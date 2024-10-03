<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\BasicControl;
use App\Models\Referral;
use App\Models\ReferralBonus;
use App\Models\User;
use App\Traits\Upload;
use hisorange\BrowserDetect\Exceptions\Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\DataTables;

class CommissionController extends Controller
{
    use Upload;

    public function index()
    {
        return view('admin.commission.commission');
    }

    public function getCommissionList(Request $request)
    {
        $commissions = ReferralBonus::query()->with(['user', 'bonusBy'])
            ->when(!empty($request->search['value']), function ($query) use ($request) {
                $query->whereHas('fromUser', function ($query) use ($request) {
                    $query->where('firstname', 'LIKE', '%' . $request->search['value'] . '%')
                        ->orWhere('lastname', 'LIKE', '%' . $request->search['value'] . '%')
                        ->orWhereRaw("CONCAT(firstname, ' ', lastname) LIKE ?", [$request->search['value']])
                        ->orWhere('username', 'LIKE', '%' . $request->search['value'] . '%');
                })
                    ->orWhereHas('toUser', function ($query) use ($request) {
                        $query->where('firstname', 'LIKE', '%' . $request->search['value'] . '%')
                            ->orWhere('lastname', 'LIKE', '%' . $request->search['value'] . '%')
                            ->orWhereRaw("CONCAT(firstname, ' ', lastname) LIKE ?", [$request->search['value']])
                            ->orWhere('username', 'LIKE', '%' . $request->search['value'] . '%');
                    });
            })
            ->orderBy('created_at', 'desc');


        return DataTables::of($commissions)
            ->addColumn('sl', function ($commissions) {
                static $counter = 0;
                return ++$counter;
            })
            ->addColumn('user', function ($commissions) {
                return $commissions->getUser();
            })
            ->addColumn('bonus_by', function ($commissions) {
                return $commissions->getBonsuByUser();
            })
            ->addColumn('amount', function ($commission) {
                return currencyPosition($commission->amount);
            })
            ->addColumn('remarks', function ($commission) {
                return $commission->remarks;
            })
            ->addColumn('date', function ($commission) {
                return dateTime($commission->created_at);
            })
            ->rawColumns(['sl', 'user', 'bonus_by', 'amount', 'remarks', 'date'])
            ->make(true);
    }

    public function referralLevels()
    {
        return view('admin.commission.rewards');
    }
    public function getReferralLevels(Request $request)
    {
        $achievedUsers = [];
        $users = User::with(['referrals', 'investments'])->get();

        // Get query parameters for filtering and sorting
        $search = $request->input('search.value');
        $orderColumn = $request->input('order.0.column');
        $orderDir = $request->input('order.0.dir');

        // Apply filtering based on search term
        if (!empty($search)) {
            $users = $users->where(function ($query) use ($search) {
                $query->where('name', 'like', '%' . $search . '%')
                      ->orWhere('email', 'like', '%' . $search . '%')
                      ->orWhere('phone', 'like', '%' . $search . '%');
            });
        }

        // Apply sorting based on order column and direction
        if (!empty($orderColumn)) {
            $sortableColumns = ['name', 'email', 'phone', 'last_login', 'achieved_level', 'total_referral_count'];
            $orderColumn = $sortableColumns[$orderColumn];
            $users = $users->orderBy($orderColumn, $orderDir);
        }

        foreach ($users as $user) {
            // Use a cached version of referral users with investment data if available
            if (!isset($referralCache[$user->id])) {
                $referralCache[$user->id] = $user->referralUsersWithInvestment([$user->id]);
            }
            $achievedLevel = $user->getRewardAchievementLevel();
            if ($achievedLevel > 0) {
                $totalReferralCount = 0;
                $referralData = $referralCache[$user->id];
                // Calculate total referral count for the current user
                foreach ($referralData as $level => $referrals) {
                    $totalReferralCount += count($referrals);
                }
                // Add only the users who achieved levels
                $achievedUsers[] = (object) [
                    'user_id' => $user->id,
                    'getUser' => $user->getUser(),
                    'email' => $user->email,
                    'phone' => $user->phone,
                    'last_login' => $user->last_login,
                    'achieved_level' => $achievedLevel,
                    'total_referral_count' => $totalReferralCount,
                ];
            }
        }

        // $achievedUsers = (object)$achievedUsers;

        return DataTables::of($achievedUsers)
            ->addColumn('user', function ($item) {
                return $item->getUser;
            })
            ->addColumn('email', function ($item) {
                return '<span class="d-block h5 mb-0">' . $item->email . '</span>
                            <span class="d-block fs-5">' . $item->phone . '</span>';
            })
            ->addColumn('achieved_level', function ($item) {
                return 'Level: '.$item->achieved_level;
            })
            ->addColumn('total_referral_count', function ($item) {
                return $item->total_referral_count.' Referrals';
            })
            ->addColumn('last_login', function ($item) {
                return diffForHumans($item->last_login);
            })
            ->rawColumns(['user', 'email', 'achieved_level', 'total_referral_count', 'last_login'])
            ->make(true);
    }


    public function referral()
    {
        $data['referrals'] = Referral::get();
        return view('admin.commission.referral', $data);
    }

    public function commissionStatus(Request $request)
    {
        $basic = BasicControl::firstOrNew();
        $basic->deposit_commission = $request->deposit_commission;
        $basic->investment_commission = $request->investment_commission;
        $basic->profit_commission = $request->profit_commission;
        $basic->reward_system = $request->reward_system;
        $basic->save();
        return back()->with('success', 'Update Successfully.');
    }

    public function StoreCommission(Request $request)
    {

        $request->validate([
            'level.*' => 'required|integer|min:1',
            'commission.*' => 'required|numeric',
            'commission_type' => 'required',
            'amount_type.*' => 'required'
        ]);

        if (!isset($request->commission) || !isset($request->level) || !isset($request->amount_type)) {
            return back()->with('error', 'Please fill all the required fields.');
        }

        try {

            Referral::where('commission_type', $request->commission_type)->delete();

            for ($i = 0; $i < count($request->level); $i++) {
                if ($request->commission[$i] && $request->amount_type[$i]) {


                    if ($request->hasFile('image') && $request->image[$i]) {
                        $upload = $this->fileUpload($request->image[$i], config('filelocation.rewards.path'), null, null, 'webp', 60);
                        $reward_image = $upload['path'];
                        $reward_image_driver = $upload['driver'];
                    }

                    $referral = new Referral();
                    $referral->commission_type = $request->commission_type;
                    $referral->level = $request->level[$i];
                    $referral->commission = $request->commission[$i];
                    $referral->amount_type = $request->amount_type[$i];
                    $referral->reward_image = $reward_image ?? null;
                    $referral->reward_image_driver = $reward_image_driver ?? null;
                    $referral->save();
                } else {
                    return back()->with('error', 'Please enter commission or select amount type value');
                }
            }

            return back()->with('success', 'Level Bonus Has been Updated.');
        } catch (\Exception $exception) {
            return back()->with('error', $exception->getMessage());
        }
    }
}
