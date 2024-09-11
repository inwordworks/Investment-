<?php

namespace App\Http\Controllers\User;

use App\Helpers\GoogleAuthenticator;
use App\Http\Controllers\Controller;
use App\Models\Page;
use App\Traits\Notify;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;

class VerificationController extends Controller
{

    use Notify;

    public function __construct()
    {
        $this->middleware(['auth']);

        $this->middleware(function ($request, $next) {
            $this->user = auth()->user();
            return $next($request);
        });

        $this->theme = template();
    }

    public function checkValidCode($user, $code, $add_min = 10000)
    {
        if (!$code) return false;
        if (!$user->sent_at) return false;
        if ($user->sent_at->addMinutes($add_min) < Carbon::now()) return false;
        if ($user->verify_code !== $code) return false;
        return true;
    }

    public function check()
    {
        $user = $this->user;
        if (!$user->status) {
            Auth::guard('web')->logout();
        } elseif (!$user->email_verification) {
            if (!$this->checkValidCode($user, $user->verify_code)) {
                $user->verify_code = code(6);
                $user->sent_at = Carbon::now();
                $user->save();
                $this->verifyToMail($user, 'VERIFICATION_CODE', [
                    'code' => $user->verify_code
                ]);
                session()->flash('success', 'Email verification code has been sent');
            }
            // $page_title = 'Email Verification';
            // $pageSeo = Page::where('slug', 'email_verification')->first();
            // $pageSeo->meta_keywords =  implode(",", $pageSeo->meta_keywords);
            // $pageSeo->image = getFile($pageSeo->meta_image_driver, $pageSeo->meta_image);

            return view(template() . 'auth.verification.email', compact('user'));
        }
        //  elseif (!$user->sms_verification) {
        //     if (!$this->checkValidCode($user, $user->verify_code)) {
        //         $user->verify_code = code(6);
        //         $user->sent_at = Carbon::now();
        //         $user->save();

        //         $this->verifyToSms($user, 'VERIFICATION_CODE', [
        //             'code' => $user->verify_code
        //         ]);
        //         session()->flash('success', 'SMS verification code has been sent');
        //     }
        //     $page_title = 'SMS Verification';

        //     $pageSeo = Page::where('slug', 'sms_verification')->first();
        //     $pageSeo->meta_keywords =  implode(",", $pageSeo->meta_keywords);
        //     $pageSeo->image = getFile($pageSeo->meta_image_driver, $pageSeo->meta_image);

        //     return view(template() . 'auth.verification.sms', compact('user', 'page_title','pageSeo'));
        // } elseif (!$user->two_fa_verify) {
        //     $page_title = '2FA Code';
        //     $pageSeo = Page::where('slug', '2fa')->first();
        //     $pageSeo->meta_keywords =  implode(",", $pageSeo->meta_keywords);
        //     $pageSeo->image = getFile($pageSeo->meta_image_driver, $pageSeo->meta_image);
        //     return view(template() . 'auth.verification.2stepSecurity', compact('user', 'page_title','pageSeo'));

        // }
        return redirect()->route('user.dashboard');
    }


    public function resendCode()
    {
        $type = request()->type;
        $user = $this->user;
        if ($this->checkValidCode($user, $user->verify_code, 2)) {
            $target_time = $user->sent_at->addMinutes(2)->timestamp;
            $delay = $target_time - time();

            throw ValidationException::withMessages(['resend' => 'Please Try after ' . gmdate("i:s", $delay) . ' minutes']);
        }
        if (!$this->checkValidCode($user, $user->verify_code)) {
            $user->verify_code = code(6);
            $user->sent_at = Carbon::now();
            $user->save();
        } else {
            $user->sent_at = Carbon::now();
            $user->save();
        }

        if ($type === 'email') {
            $this->verifyToMail($user, 'VERIFICATION_CODE', [
                'code' => $user->verify_code
            ]);

            return back()->with('success', 'Email verification code has been sent');
        } elseif ($type === 'mobile') {
            $this->verifyToSms($user, 'VERIFICATION_CODE', [
                'code' => $user->verify_code
            ]);
            return back()->with('success', 'SMS verification code has been sent');
        } else {
            throw ValidationException::withMessages(['error' => 'Sending Failed']);
        }
    }

    public function mailVerify(Request $request)
    {
        $rules = [
            'code' => 'required',
        ];
        $msg = [
            'code.required' => 'Email verification code is required',
        ];
        $validate = $this->validate($request, $rules, $msg);
        $user = $this->user;
        if ($this->checkValidCode($user, $request->code)) {
            $user->email_verification = 1;
            $user->verify_code = null;
            $user->sent_at = null;
            $user->save();
            session()->flash('success', 'Your email has been verified');
            return redirect()->intended(route('user.dashboard'));
        }
        throw ValidationException::withMessages(['code' => 'Verification code didn\'t match!']);
    }

    public function smsVerify(Request $request)
    {
        $rules = [
            'code' => 'required',
        ];
        $msg = [
            'code.required' => 'SMS verification code is required',
        ];
        $validate = $this->validate($request, $rules, $msg);
        $user = Auth::user();

        if ($this->checkValidCode($user, $request->code)) {
            $user->sms_verification = 1;
            $user->verify_code = null;
            $user->sent_at = null;
            $user->save();

            return redirect()->intended(route('user.dashboard'));
        }
        throw ValidationException::withMessages(['error' => 'Verification code didn\'t match!']);
    }

    public function twoFAverify(Request $request)
    {
        $this->validate($request, [
            'code' => 'required',
        ], [
            'code.required' => '2FA verification code is required',
        ]);
        $ga = new GoogleAuthenticator();
        $user = Auth::user();
        $getCode = $ga->getCode($user->two_fa_code);
        if ($getCode == trim($request->code)) {
            $user->two_fa_verify = 1;
            $user->save();
            return redirect()->intended(route('user.dashboard'));
        }
        throw ValidationException::withMessages(['error' => 'Wrong Verification Code']);
    }
}
