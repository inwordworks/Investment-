
<!-- about page -->
<section class="about-page">
    <div class="container">
        <div class="row">
            <div class="col-lg-7">
                <div class="about-page-left-container">
                    <div class="about-page-image">
                        <img src="{{isset($about_section['single']['media']->about_image)?getFile($about_section['single']['media']->about_image->driver,$about_section['single']['media']->about_image->path):getFile('local','image')}}" alt="image">
                    </div>
                    <div class="shape-top"></div>
                    <div class="shape-bottom"></div>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="about-page-right-container">
                    <div class="about-page-content">
                        <div class="about-page-title">
                            <h2>{!! styleSentence2($about_section['single']['heading']??'',1) !!} </h2>
                            {!! $about_section['single']['short_description']??'' !!}
                        </div>
                        <div class="about-page-btn-group">
                            @foreach(collect($about_section['multiple'])->toArray() as $item)
                                <a href="{{$item['media']->button_link??'#'}}" class="btn-1"><i class="{{$item['media']->icon}}"></i> {!! $item['button_name']??'' !!} <span></span></a>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- about page -->
