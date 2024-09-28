<?php

namespace App\Observers;
use App\Models\Referral;
use App\Models\ReferralBonus;
use App\Models\User;
use App\Traits\Notify;
use Facades\App\Services\BasicService;
use Illuminate\Support\Facades\Log;

class ReferralBonusObserver
{
    use Notify;
    /**
     * Handle the User "Bonus" event.
     */
    public function created(ReferralBonus $bonus): void
    {
        $user = User::find($bonus->from_user_id);
        if ($bonus->commission_type == 'invest' && basicControl()->profit_commission && $user->referral_id) {
            $amount = $bonus->amount;

            try {
                $userId = $user->id;
                $i = 1;
                $level = Referral::where('commission_type', 'profit_commission')->count();

                while ($userId != "" || $userId != "0" || $i < $level) {
                    $me = User::with('referral')->find($userId);
                    // if ($user->total_invest == null || $user->total_invest == 0 || $user->total_invest == '') {
                    //     break;
                    // }
                    $refer = $me->referral;
                    if (!$refer) {
                        break;
                    }
                    $commission = Referral::where('commission_type', 'profit_commission')->where('level', $i)->first();
                    if (!$commission) {
                        break;
                    }
                    if ($commission->amount_type == '%') {
                        $com = ($amount * $commission->commission) / 100;
                    } else {
                        $com = $commission->commission;
                    }

                    $new_bal = getAmount($refer->profit_balance + $com);
                    $refer->profit_balance = $new_bal;
                    $refer->total_profit += $com;
                    $refer->total_commission += $com;
                    $refer->save();

                    $remarks = 'level ' . $i . '  Investment profit bonus From  ' . $user->username;


                    $transaction = BasicService::makeTransaction($refer, $com, 0, '+', null, $remarks, 'App\Models\ReferralBonus', 'Profit');

                    $trx = $transaction->trx_id;

                    $bonus = new ReferralBonus();
                    $bonus->from_user_id = $refer->id; // those person who Referred for investment
                    $bonus->to_user_id = $user->id; // those person who invested
                    $bonus->level = $i;
                    $bonus->amount = getAmount($com);
                    $bonus->commission_type = 'profit_commission';
                    $bonus->trx_id = $trx;
                    $bonus->remarks = $remarks;
                    $bonus->save();

                    $params = [
                        'transaction_id' => $trx,
                        'amount' => currencyPosition(getAmount($com)),
                        'bonus_from' => $user->username,
                        'final_balance' => $refer->profit_balance,
                        'level' => $i
                    ];
                    $action = [
                        'link' => route('user.referral.bonus'),
                        'icon' => 'fa fa-money-bill-alt text-white'
                    ];
                    $firebaseAction = route('user.referral.bonus');

                    $this->userPushNotification($refer, 'REFERRAL_BONUS', $params, $action);
                    $this->userFirebasePushNotification($refer, 'REFERRAL_BONUS', $params, $firebaseAction);
                    $this->sendMailSms($refer, 'REFERRAL_BONUS', $params);

                    $userId = $refer->id;
                    $i++;
                }
            } catch (\Exception $exception) {
                Log::error('Investment profit bonus error: ', $exception);
            }
        }
    }
}
