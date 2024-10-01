<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- <link rel="shortcut icon" href="/web_assets/assets/img/favicon.png" type="image/x-icon"> -->
    <link rel="shortcut icon" href="{{ getFile(basicControl()->favicon_driver, basicControl()->favicon) }}" type="image/x-icon">

    <meta name="description" content="MyStartUp">

    <meta name="keywords" content="MyStartUp">

    <meta name="author" content="MyStartUp">

    <title><?= isset($title) && !empty(trim($title)) ?  $title . ' | ' . basicControl()->site_title : basicControl()->site_title ?></title>

    <script>
        if ('serviceWorker' in navigator) {
            navigator.serviceWorker.register('/firebase-messaging-sw.js')
                .then(function(registration) {
                    console.log('Service Worker registered successfully:', registration);
                })
                .catch(function(err) {
                    console.log('Service Worker registration failed:', err);
                });
        }
    </script>

    @stack('firebase')

    <meta property="og:url" content="MyStartUp.com">

    <meta property="og:type" content="website">

    <meta property="og:title" content="MyStartUp">

    <meta property="og:description" content="MyStartUp">

    <meta property="og:image" content="/web_assets/assets/img/logo-thumbnail.png">

    <meta name="twitter:card" content="summary_large_image">

    <meta property="twitter:domain" content="MyStartUp">

    <meta property="twitter:url" content="MyStartUp.info">

    <meta name="twitter:title" content="MyStartUp">

    <meta name="twitter:description" content="MyStartUp">

    <meta name="twitter:image" content="/web_assets/assets/img/logo-thumbnail.png">

    <link rel="stylesheet" href="/web_assets/assets/css/bootstrap.min.css">

    <link rel="stylesheet" href="/web_assets/assets/plugins/fontawesome/css/fontawesome.min.css">

    <link rel="stylesheet" href="/web_assets/assets/plugins/swiper/css/swiper.min.css">

    <link rel="stylesheet" href="/web_assets/assets/plugins/fontawesome/css/all.min.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2496c.css?family=Poppins:wght@300;400;500;600;700&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css23ab7.css?family=Inter:wght@200;300;400;500;600;700;800;900&amp;display=swap">

    <link rel="stylesheet" href="/web_assets/assets/css/feather.css">

    <link rel="stylesheet" href="/web_assets/assets/css/bootstrap-datetimepicker.min.css">

    <link rel="stylesheet" href="/web_assets/assets/css/owl.carousel.min.css">

    <link rel="stylesheet" href="/web_assets/assets/css/aos.css">

    <link rel="stylesheet" href="/web_assets/assets/css/f5.css">

    <link rel="stylesheet" href="/web_assets/assets/css/custom.min.css">

    <link rel="stylesheet" href="/web_assets/assets/css/sweet-alert.css">

    @stack('style')
    <style>
        @media screen and (max-width: 990px) {
            .banner-section {
                padding-top: 70px !important;
            }
        }
    </style>
    @livewireStyles
</head>

<body>

    <div class="main-wrapper">

        <livewire:partials.header-component />

        @if(isset($slot))
        {{ $slot }}
        @endif

        @yield('content')

        <livewire:partials.footer-component />

        <!-- <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">x</button>
                    </div>
                    <div class="modal-body">
                        <img src="/web_assets/uploads/popup2.jpg">
                    </div>

                </div>
            </div>
        </div> -->

        <div class="mouse-cursor cursor-outer"></div>

        <div class="mouse-cursor cursor-inner"></div>

    </div>

    <div class="progress-wrap active-progress">

        <svg class="progress-circle svg-content" width="100%" height="100%" viewBox="-1 -1 102 102">

            <path d="M50,1 a49,49 0 0,1 0,98 a49,49 0 0,1 0,-98"
                style="transition: stroke-dashoffset 10ms linear 0s; stroke-dasharray: 307.919px, 307.919px; stroke-dashoffset: 228.265px;">
            </path>

        </svg>

    </div>

    <div class="d-block d-md-none">

        <div class="mobile-fixed-btns">

            <ul>

                <li class="menu-item">

                    <a href="/" class="menu-link is-active">

                        <i class="fal fa-home"></i>

                        <span class="menu-name">Home</span>

                    </a>

                </li>

                <li class="menu-item">

                    <a href="/about-us" class="menu-link is-active">

                        <i class="fal fa-user"></i>

                        <span class="menu-name">About</span>

                    </a>

                </li>

                <li class="menu-item">

                    <a href="/contact-us" class="menu-link is-active">

                        <i class="fal fa-envelope"></i>

                        <span class="menu-name">Contact</span>

                    </a>

                </li>

                <li class="menu-item">

                    <a href="/register" class="menu-link is-active">

                        <i class="fal fa-user"></i>

                        <span class="menu-name">Register</span>

                    </a>

                </li>

                <li class="menu-item">

                    <a href="/login" class="menu-link is-active">

                        <i class="fal fa-lock"></i>

                        <span class="menu-name">Log In</span>

                    </a>

                </li>

            </ul>

        </div>

    </div>

    <script src="/web_assets/assets/js/jquery-3.7.0.min.js"></script>

    <script src="/web_assets/assets/js/bootstrap.bundle.min.js"></script>

    <script src="/web_assets/assets/js/feather.min.js"></script>

    <script src="/web_assets/assets/js/moment.min.js"></script>

    <script src="/web_assets/assets/js/bootstrap-datetimepicker.min.js"></script>

    <script src="/web_assets/assets/js/owl.carousel.min.js"></script>

    <script src="/web_assets/assets/plugins/swiper/js/swiper.min.js"></script>

    <script src="/web_assets/assets/js/slick.js"></script>

    <script src="/web_assets/assets/js/aos.js"></script>

    <script src="/web_assets/assets/js/counter.js"></script>

    <script src="/web_assets/assets/js/backToTop.js"></script>

    <script src="/web_assets/assets/js/script.js"></script>


    @stack('js-lib')
    @include('plugins')
    @stack('script')

    <script src="{{ asset('assets/global/js/notiflix-aio-3.2.6.min.js') }}"></script>
    <script>
        if ('serviceWorker' in navigator) {
            navigator.serviceWorker.register('/firebase-messaging-sw.js')
                .then(function(registration) {
                    console.log('Service Worker registered successfully:', registration);
                })
                .catch(function(err) {
                    console.log('Service Worker registration failed:', err);
                });
        }
    </script>
    <script>
        $(document).ready(function() {
            if ($('.swiper-container').length) {
                new Swiper('.swiper-container', {
                    speed: 500,
                    spaceBetween: 100,
                    autoplay: true,
                    disableOnInteraction: true,

                    navigation: {

                        nextEl: ".swiper-button-next",

                        prevEl: ".swiper-button-prev",

                    },
                });
                var mySwiper = document.querySelector('.swiper-container').swiper

                $(".swiper-container").mouseenter(function() {
                    mySwiper.autoplay.stop();
                    // console.log('slider stopped');
                });

                $(".swiper-container").mouseleave(function() {
                    mySwiper.autoplay.start();
                    // console.log('slider started again');
                });
            }
        });
    </script>
    <script src="/web_assets/assets/js/sweet-alert.min.js"></script>
    <script type="text/javascript">
        /* Displaying success/error message*/
        $(function() {
            $('.number').on('keydown', function(e) {
                -1 !== $.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) || /65|67|86|88/.test(e.keyCode) && (!0 === e.ctrlKey || !0 === e.metaKey) || 35 <= e.keyCode && 40 >= e.keyCode || (e.shiftKey || 48 > e.keyCode || 57 < e.keyCode) && (96 > e.keyCode || 105 < e.keyCode) && e.preventDefault()
            });
        })
    </script>
    <script type="text/javascript">
        // $(window).on('load', function() {
        //     $('#myModal').appendTo("body").modal('show');
        // });
        // $(window).on('click', function() {
        //     //$('#myModal').modal('hide');
        // });
    </script>

    @if (session()->has('success'))
    <script>
        Notiflix.Notify.success("@lang(session('success'))");
    </script>
    @endif

    @if (session()->has('error'))
    <script>
        Notiflix.Notify.failure("@lang(session('error'))");
    </script>
    @endif

    @if (session()->has('warning'))
    <script>
        Notiflix.Notify.warning("@lang(session('warning'))");
    </script>
    @endif

    @livewireScripts


    @stack('pageBottom')
</body>

</html>
