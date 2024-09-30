

<!-- footer -->
<footer class="main-footer footer-style-1 main-footer-padding">
    <div class="bg-layer" style="background: url('{{asset($themeTrue.'images/background/footer-bg-shape.png')}}');"></div>
    <div class="container">
        <div class="row">
            <div class="col-xl-3 col-lg-3 col-md-4">
                <div class="link-widget-1 logo-widget pr_20 wow fadeInUp" data-wow-delay="300ms" data-wow-duration="1500ms">
                    <div class="logo-widget-inner">
                        <div class="footer-logo">
                            <a href="{{route('page')}}"><img src="{{getFile(basicControl()->logo_driver,basicControl()->logo)}}" alt="logo"></a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-3  col-lg-2 col-md-3">
                <div class="link-widget-1 useful-widget wow fadeInUp" data-wow-delay="500ms" data-wow-duration="1500ms">
                    <h6>@lang('Useful Link')</h6>
                    <ul class="link-widget-1-list">
                        @if(getFooterMenuData('useful_link') != null)

                            @foreach(getFooterMenuData('useful_link') as $list)
                                {!! $list !!}
                            @endforeach
                        @endif
                    </ul>
                </div>
            </div>

            <div class="col-lg-3 col-md-5">
                <div class="link-widget-1 help-widget wow fadeInUp" data-wow-delay="600ms" data-wow-duration="1500ms">
                    <h6>@lang('Resources')</h6>
                    <ul class="link-widget-1-list">
                        @if(getFooterMenuData('support_link') != null)

                            @foreach(getFooterMenuData('support_link') as $list)
                                {!! $list !!}
                            @endforeach
                        @endif
                    </ul>
                </div>
            </div>

        </div>
    </div>
    <div class="container">
        <div class="footer-copyright">
            <p class="copyright-text d-block m-auto">@lang('All right reserved') @lang(basicControl()->site_title) &copy; @lang(date("Y"))</p>
        </div>

    </div>
</footer>
<!-- footer -->
