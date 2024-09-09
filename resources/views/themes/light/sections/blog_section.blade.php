


<!-- blog -->
<section class="blog">
    <div class="container">
        <div class="common-title-container">
            <div class="common-title">
                <h3>{!! styleSentence($blog_section['single']['heading']??null,2) !!}</h3>
                <p>{!! $blog_section['single']['short_description']??'' !!} </p>
            </div>
            <div class="common-title-btn">
                <a href="{{$blog_section['single']['media']->button_link??'#'}}" class="btn-2">{!! $blog_section['single']['button_name']??trans('View All') !!} <i class="fa-sharp fa-solid fa-arrow-right"></i> <span></span></a>
            </div>
        </div>

        <div class="blog-carousol pagination-style-one">
            <div class="three-item-carousel swiper-container blog-carousol-container">
                <div class="swiper-wrapper">

                    @foreach($blogs as $blog)
                        <div class="swiper-slide">
                            <div class="blog-single wow fadeInUp" data-wow-delay="00ms" data-wow-duration="1500ms">
                                <div class="blog-single-image">
                                    <img src="{{$blog->blogImage()}}" alt="image">
                                </div>
                                <div class="blog-single-content">
                                    <a href="{{route('blog.details',[slug(optional($blog->details)->slug),$blog->id])}}">{{optional($blog->details)->title}}</a>
                                    <p>{{ Str::limit(strip_tags(optional($blog->details)->description), 90, '...') }}</p>
                                    <div class="blog-single-bottom">
                                        <div class="blog-single-author">
                                            <div class="author-image">
                                                <img src="{{$blog->createdByInfo('image')}}" alt="author">
                                            </div>
                                            <h6>{{$blog->createdByInfo('name')}}</h6>
                                        </div>
                                        <a href="{{route('blog.details',[slug(optional($blog->details)->slug),$blog->id])}}" class="btn-2">Details <i class="fa-sharp fa-solid fa-arrow-right"></i> <span></span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach

                </div>
            </div>
            <div class="slider__pagination3"></div>
        </div>
    </div>
</section>
<!-- blog -->
