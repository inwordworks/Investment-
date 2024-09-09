<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;

class InvestHistory extends Model
{
    use HasFactory;

    protected $guarded =  ['id'];


    public function transactional()
    {
        return $this->morphOne(Transaction::class, 'transactional');
    }
    public static function boot(): void
    {
        parent::boot();
        static::saved(function () {
            Cache::forget('paymentRecord');
        });

        static::creating(function (InvestHistory $investHistory) {
            if (empty($investHistory->trx)) {
                $investHistory->trx = self::generateOrderNumber();
            }
        });
    }


    public static function generateOrderNumber()
    {
        return DB::transaction(function () {
            // Lock the last order to prevent race conditions
            $lastOrder = self::lockForUpdate()->orderBy('id', 'desc')->first();

            if ($lastOrder && isset($lastOrder->trx)) {
                $lastOrderNumber = (int)filter_var($lastOrder->trx, FILTER_SANITIZE_NUMBER_INT);
                $newOrderNumber = $lastOrderNumber + 1;
            } else {
                $newOrderNumber = strRandomNum(10);
            }

            // Check again to ensure the new trx_id doesn't already exist (extra safety)
            while (self::where('trx', 'PLI'.$newOrderNumber)->exists()) {
                $newOrderNumber = (int)$newOrderNumber + 1;
            }
            return 'PLI' . $newOrderNumber;
        });
    }

    public function user()
    {
        return $this->belongsTo(User::class,'user_id','id');
    }

    public function plan()
    {
        return $this->belongsTo(InvestmentPlan::class,'plan_id','id');
    }

    public function getUser() :string
    {
        $url = route('admin.user.view.profile', optional($this->user)->id??1);
        return '<a class="d-flex align-items-center me-2" href="' . $url . '">
                                <div class="flex-shrink-0">
                                  ' . optional($this->user)->profilePicture() . '
                                </div>
                                <div class="flex-grow-1 ms-3">
                                  <h5 class="text-hover-primary mb-0">' . optional($this->user)->firstname . ' ' . optional($this->user)->lastname . '</h5>
                                  <span class="fs-6 text-body">@' . optional($this->user)->username . '</span>
                                </div>
                              </a>';
    }

    public function getPlan() :string
    {
        $html = '';
        if($this->last_profit == null && now() < parseDate($this->next_return)){
            $html ='<i class="bi-exclamation-diamond-fill text-warning ms-1"
             data-bs-toggle="tooltip" data-bs-placement="top"
              aria-label="'.trans('Plan will be matured at ').dateTime($this->next_return, 'd/m/Y H:i').'"
               data-bs-original-title="'.trans('Plan will be matured at ').dateTime($this->next_return, 'd/m/Y H:i').'"></i>';

        }

        return "<div class='d-flex flex-wrap'>
                    <p>
                         ".optional($this->plan)->plan_name."
                    </p>
                    $html
                </div>";
    }

    public function getUserPlanInv() :string
    {
//        <i class=""></i>
        $html = '';
        if($this->last_profit == null && now() < parseDate($this->next_return)){
            $html ='<i class="fa-sharp fa-thin fa-circle-exclamation text-warning ms-1"
             data-bs-toggle="tooltip" data-bs-placement="top"
              aria-label="Select the language for email template and others services."
               data-bs-original-title="'.trans('Plan will matured at ').parseDate($this->next_return).'"></i>';
        }

        return "<div class='d-flex'>
                    <p>
                         ".optional($this->plan)->plan_name."
                    </p>
                    $html
                </div>";
    }

    public function returnPeriod(): string
    {
        return trans('Every').' ' .$this->return_period.' '.trans($this->return_period_type);
    }

    public function lastPayment()
    {
        if ($this->total_return == 0){
            return "<span class='badge  bg-soft-warning text-warning '><span class='legend-indicator bg-warning'></span>".trans('Immature Invest')."</span>";
        }else{
            return dateTime($this->last_profit);
        }
    }

    public function nextPayment()
    {
        if ($this->number_of_return == $this->total_return && !$this->is_life_time){
            return "<span class='badge  bg-soft-success text-success '><span class='legend-indicator bg-success'></span>".trans('Completed')."</span>";
        }else{
            return "<span class='next-payment' data-payment='" . $this->next_return . "'>" . dateTime($this->next_return) . "</span>";
        }
    }

    public function userNextPayment()
    {
        if ($this->number_of_return == $this->total_return && !$this->is_life_time){
            return "<span class='badge  text-bg-success'>".trans('Completed')."</span>";
        }

        else{
            return "<span class='next-payment' data-payment='" . $this->next_return . "'>" . dateTime($this->next_return) . "</span>";
        }
    }

    public function nextReturn()
    {
        if ($this->return_period_type == "Hour"){
            return Carbon::parse(now())->addHours($this->return_period);
        }elseif ($this->return_period_type == "Day"){
            return Carbon::parse(now())->addDays($this->return_period);
        }elseif ($this->return_period_type == "Month"){
            return  Carbon::parse(now())->addMonths($this->return_period);
        }elseif ($this->return_period_type == "Year"){
            return Carbon::parse(now())->addYears($this->return_period);
        }
    }

    public function receivedAmount():string
    {
        return "<span> ".$this->profit.' x '.($this->total_return??0).' = '.currencyPosition($this->total_return * $this->profit)." <span/>";
    }


}
