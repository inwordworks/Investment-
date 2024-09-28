<?php

namespace App\Providers;

use App\Models\Blog;
use App\Models\ContentDetails;
use App\Models\InvestmentPlan;
use App\Models\Language;
use App\Models\ManageMenu;
use App\Models\Project;
use App\Models\ReferralBonus;
use App\Observers\ReferralBonusObserver;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\URL;
use Symfony\Component\Mailer\Bridge\Mailchimp\Transport\MandrillTransportFactory;
use Symfony\Component\Mailer\Bridge\Sendgrid\Transport\SendgridTransportFactory;
use Symfony\Component\Mailer\Bridge\Sendinblue\Transport\SendinblueTransportFactory;
use Symfony\Component\Mailer\Transport\Dsn;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {

        ReferralBonus::observe(ReferralBonusObserver::class);
        try {
            // Check database connection
            DB::connection()->getPdo();

            // Register user model
            $this->registerUserModel();

            // Share basic data to all views
            $this->shareBasicViewData();

            // Configure view composers
            $this->composeNavbar();
            $this->composeProjectSections();
            $this->composePricingSections();
            $this->composeBlogSections();
            $this->composeFooter();
            $this->composeAuthPages();

            // Configure mail transports
            $this->configureMailTransports();

            // Force SSL if required
            $this->forceSSL();
        } catch (\Exception $e) {
            // Log the exception for debugging
            Log::error($e->getMessage());
        }
    }
    protected function getBasicData()
    {
        return Cache::remember('basic_data', 60, function () {
            return [
                'basicControl' => basicControl(),
                'theme' => template(),
                'themeTrue' => template(true),
            ];
        });
    }

    // Register user model
    protected function registerUserModel(): void
    {
        $this->app->concord->registerModel(\Konekt\User\Contracts\User::class, \App\Models\User::class);
    }

    // Share basic control and theme data to all views
    protected function shareBasicViewData(): void
    {
        View::share($this->getBasicData());
    }

    // Navbar composer
    protected function composeNavbar(): void
    {
        // Navbar view composer
        view()->composer([$data['theme'] . 'partials.navbar'], function ($view) {
            // Retrieve languages
            $languages = Language::orderBy('name')->where('status', 1)->get();
            $view->with('languages', $languages);

            // Fetch content details for top_section
            $contentData = ContentDetails::with('content')
                ->whereHas('content', function ($query) {
                    $query->where('name', 'top_section');
                })->get();

            // Retrieve the first 'single' type content for 'top_section'
            $single_content = $contentData->where('content.name', 'top_section')
                ->where('content.type', 'single')
                ->first();

            // Merge content description with media if available
            $datas = [
                'single' => $single_content ? collect($single_content->description ?? [])
                    ->merge($single_content->content->only('media')) : []
            ];

            // Pass the 'top_section' data to the view
            $view->with("top_section", $datas);
        });
    }

    // Project sections composer
    protected function composeProjectSections(): void
    {
        $theme = template();

        // Project section 1
        view()->composer([$theme . 'sections.project_section'], function ($view) {
            $projects = $this->getActiveProjects(4);
            $view->with('projects', $projects);
        });

        // Project section 2
        view()->composer([$theme . 'sections.project_section_2'], function ($view) {
            $projects = $this->getActiveProjects(6);
            $view->with('projects', $projects);
        });

        // Farming and project details
        view()->composer([$theme . 'sections.farming_section', $theme . 'pages.project_details'], function ($view) {
            $projects = $this->getActiveProjects(4);
            $view->with('projects', $projects);
        });
    }

    // Pricing sections composer
    protected function composePricingSections(): void
    {
        $theme = template();
        view()->composer([$theme . 'sections.pricing_section', $theme . 'sections.pricing_section_2'], function ($view) {
            $plans = InvestmentPlan::where(['status' => 1, 'soft_delete' => 0])->get();
            $view->with('plans', $plans);
        });
    }

    // Blog sections composer
    protected function composeBlogSections(): void
    {
        $theme = template();
        view()->composer([$theme . 'sections.blog_section', $theme . 'sections.blog_section_3'], function ($view) {
            $blogs = Blog::with('details')->paginate(9);
            $view->with('blogs', $blogs);
        });
    }

    // Footer composer
    protected function composeFooter(): void
    {
        view()->composer([template() . 'partials.footer'], function ($view) {
            $footer_section = ContentDetails::with('content')
                ->whereHas('content', function ($query) {
                    $query->where('name', 'footer_section');
                })
                ->get();

            $single_content = $footer_section->where('content.name', 'footer_section')->where('content.type', 'single')->first();
            $multipleContents = $footer_section->where('content.name', 'footer_section')->where('content.type', 'multiple')->values()->map(function ($multipleContentData) {
                return collect($multipleContentData->description)->merge($multipleContentData->content->only('media'));
            });

            $datas = [
                'single' => $single_content ? collect($single_content->description ?? [])->merge($single_content->content->only('media')) : [],
                'multiple' => $multipleContents
            ];

            $view->with("footer_section", $datas);
        });
    }

    // Auth pages composer
    protected function composeAuthPages(): void
    {
        view()->composer([template() . 'auth.login', template() . 'auth.register'], function ($view) {
            $login_registration = ContentDetails::with('content')
                ->whereHas('content', function ($query) {
                    $query->where('name', 'login_registration');
                })
                ->get();

            $single_content = $login_registration->where('content.name', 'login_registration')->where('content.type', 'single')->first();
            $datas = [
                'single' => $single_content ? collect($single_content->description ?? [])->merge($single_content->content->only('media')) : [],
            ];

            $view->with("login_registration", $datas);
        });
    }

    // Configure mail transports
    protected function configureMailTransports(): void
    {
        Mail::extend('sendinblue', function () {
            return (new SendinblueTransportFactory)->create(
                new Dsn('sendinblue+api', 'default', config('services.sendinblue.key'))
            );
        });

        Mail::extend('sendgrid', function () {
            return (new SendgridTransportFactory)->create(
                new Dsn('sendgrid+api', 'default', config('services.sendgrid.key'))
            );
        });

        Mail::extend('mandrill', function () {
            return (new MandrillTransportFactory)->create(
                new Dsn('mandrill+api', 'default', config('services.mandrill.key'))
            );
        });
    }

    // Force SSL if required
    protected function forceSSL(): void
    {
        if (basicControl()->force_ssl == 1 && $this->app->environment('production')) {
            URL::forceScheme('https');
        }
    }

    // Helper method to get active projects
    protected function getActiveProjects(int $limit)
    {
        return Project::with([
            'details' => function ($query) {
                $query->select('title', 'project_id', 'language_id', 'id', 'slug');
            }
        ])
            ->where(function ($query) {
                $query->where('expiry_date', '>', Carbon::now())
                    ->orWhere('project_duration_has_unlimited', 1);
            })
            ->where('status', 1)
            ->where('is_deleted', 0)
            ->orderBy('created_at', 'desc')
            ->limit($limit)
            ->get();
    }
}
