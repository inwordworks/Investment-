<?php

namespace App\Models;

use App\Traits\Notify;
use Illuminate\Contracts\Auth\CanResetPassword;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Cache;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Database\Eloquent\SoftDeletes;
use Konekt\User\Contracts\User as UserContract;
use Konekt\User\Models\Profile;

class User extends Authenticatable implements CanResetPassword, UserContract
{
    use HasApiTokens, HasFactory, Notifiable, SoftDeletes, Notify;

    public function inactivate()
    {
        $this->is_active = false;
        $this->save();
    }

    public function activate()
    {
        $this->is_active = true;
        $this->save();
    }

    public function getProfile(): ?Profile
    {
        return null;
    }
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */

    protected $table = 'users';
    protected $fillable = [
        'firstname',
        'lastname',
        'username',
        'email',
        'password',
        'referral_id',
        'language_id',
        'email',
        'country_code',
        'country',
        'phone_code',
        'phone',
        'balance',
        'image',
        'image_driver',
        'state',
        'city',
        'zip_code',
        'address_one',
        'address_two',
        'provider',
        'provider_id',
        'status',
        'identity_verify',
        'address_verify',
        'two_fa',
        'two_fa_verify',
        'two_fa_code',
        'email_verification',
        'sms_verification',
        'verify_code',
        'time_zone',
        'sent_at',
        'last_login',
        'last_seen',
        'password',
        'email_verified_at',
        'remember_token',
        'profit_balance',
        'total_invest',
        'total_profit',
        'plan_invest',
        'project_invest',
        'plan_profit',
        'project_profit',
        'total_commission',
        'github_id',
        'google_id',
        'facebook_id'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];
    public $allusers = [];

    protected $appends = ['last-seen-activity'];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
        'sent_at' => 'date',
    ];

    protected $dates = ['deleted_at'];

    protected static function boot()
    {
        parent::boot();
        static::saved(function () {
            Cache::forget('userRecord');
        });
    }

    public function funds()
    {
        return $this->hasMany(Fund::class)->latest()->where('status', '!=', 0);
    }


    public function transaction()
    {
        return $this->hasOne(Transaction::class)->latest();
    }

    public function payout()
    {
        return $this->hasMany(Payout::class, 'user_id');
    }


    public function getLastSeenActivityAttribute()
    {
        return Cache::has('user-is-online-' . $this->id) ? true : false;
    }


    public function inAppNotification()
    {
        return $this->morphOne(InAppNotification::class, 'inAppNotificationable', 'in_app_notificationable_type', 'in_app_notificationable_id');
    }

    public function fireBaseToken()
    {
        return $this->morphMany(FireBaseToken::class, 'tokenable');
    }

    public function profilePicture()
    {
        $image = $this->image;
        if (!$image) {
            $active = !$this->LastSeenActivity ? 'warning' : 'success';
            $firstLetter = substr($this->firstname, 0, 1);
            return '<div class="avatar avatar-sm avatar-soft-primary avatar-circle">
                        <span class="avatar-initials">' . $firstLetter . '</span>
                        <span class="avatar-status avatar-sm-status avatar-status-' . $active . '"></span>
                     </div>';
        } else {
            $url = getFile($this->image_driver, $this->image);
            $active = !$this->LastSeenActivity ? 'warning' : 'success';
            return '<div class="avatar avatar-sm avatar-circle">
                        <img class="avatar-img" src="' . $url . '" alt="Image Description">
                        <span class="avatar-status avatar-sm-status avatar-status-' . $active . '"></span>
                     </div>';
        }
    }

    public function sendPasswordResetNotification($token)
    {
        $this->verifyToMail($this, 'PASSWORD_RESET', $params = [
            'message' => '<a href="' . url('password/reset', $token) . '?email=' . $this->email . '" target="_blank">Click To Reset Password</a>'
        ]);
    }

    public function plans()
    {
        return $this->hasMany(InvestHistory::class, 'user_id', 'id');
    }

    public function notifypermission()
    {
        return $this->morphOne(NotificationPermission::class, 'notifyable');
    }

    public function getUser(): string
    {
        $url = route('admin.user.view.profile', $this->id ?? 1);
        return '<a class="d-flex align-items-center me-2" href="' . $url . '">
                                <div class="flex-shrink-0">
                                  ' . $this->profilePicture() . '
                                </div>
                                <div class="flex-grow-1 ms-3">
                                  <h5 class="text-hover-primary mb-0">' . $this->firstname . ' ' . $this->lastname . '</h5>
                                  <span class="fs-6 text-body">@' . $this->username . '</span>
                                </div>
                              </a>';
    }

    public function getRewardAchievement($id = null)
    {
        $userId = $id ? $id : $this->id;
        $achievedLevels = 'Not achieved level 1 yet';
        $level = $this->getRewardAchievementLevel($userId);
        if ($level > 0) {
            $achievedLevels = "Level {$level} achieved";
        }
        return $achievedLevels;
    }
    public function getRewardAchievementLevel($id = null)
    {
        $userId = $id ? $id : $this->id;
        $referralData = $this->referralUsersWithInvestment([$userId]);
        $levelConfig = Referral::where('commission_type', 'reward_system')->orderBy('level', 'asc')->get();
        // Initialize an array to store the achieved levels
        $thisLevel = 0;
        foreach ($levelConfig as $config) {
            $level = $config['level'];
            $requiredUsers = intval($config['commission']);

            // Check if referral data exists for the current level and if the number of users meets the requirement
            if (isset($referralData[$level]) && count($referralData[$level]) >= $requiredUsers) {
                $thisLevel = $level;
            } else {
                break;
            }
        }
        // Output the achieved levels
        return intval($thisLevel);
    }
    public function referralUsersWithInvestment($id, $currentLevel = 1)
    {
        $users = $this->getUsersWithInvestment($id);
        if ($users['status']) {
            $this->allusers[$currentLevel] = $users['user'];
            $currentLevel++;
            $this->referralUsers($users['ids'], $currentLevel);
        }
        return $this->allusers;
    }
    public function referralUsers($id, $currentLevel = 1)
    {
        $users = $this->getUsers($id);
        if ($users['status']) {
            $this->allusers[$currentLevel] = $users['user'];
            $currentLevel++;
            $this->referralUsers($users['ids'], $currentLevel);
        }
        return $this->allusers;
    }
    public function getAllReferrals($id)
    {
        return User::where('referral_id', $id)
            ->orWhereIn('referral_id', function ($query) use ($id) {
                $query->select('id')->from('users')->where('referral_id', $id);
            })
            ->get();
    }
    public function getUsersWithInvestment($id)
    {
        if (isset($id)) {
            $data['user'] = User::whereIn('referral_id', $id)
                ->where('total_invest', '!=', null)
                ->get(['id', 'firstname', 'lastname', 'username', 'email', 'phone_code', 'phone', 'referral_id', 'created_at']);
            if (count($data['user']) > 0) {
                $data['status'] = true;
                $data['ids'] = $data['user']->pluck('id');

                return $data;
            }
        }
        $data['status'] = false;
        return $data;
    }
    public function getUsers($id)
    {
        if (isset($id)) {
            $data['user'] = User::whereIn('referral_id', $id)->get(['id', 'firstname', 'lastname', 'username', 'email', 'phone_code', 'phone', 'referral_id', 'created_at']);
            if (count($data['user']) > 0) {
                $data['status'] = true;
                $data['ids'] = $data['user']->pluck('id');

                return $data;
            }
        }
        $data['status'] = false;
        return $data;
    }

    public function referral()
    {
        return $this->belongsTo(User::class, 'referral_id');
    }
    public function referrals()
    {
        return $this->hasMany(User::class, 'referral_id', 'id');
    }
    public function investments()
    {
        return $this->hasMany(ProjectInvestment::class);
    }
}
