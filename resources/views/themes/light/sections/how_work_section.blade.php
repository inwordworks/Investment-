<!-- how work -->
<section class="how-work">
    <div class="container">
        <div class="common-title-container">
            <div class="common-title">
                <h3> {!! styleSentence($how_work_section['single']['heading'],3) !!} </h3>
                <p>{{$how_work_section['single']['short_description']}} </p>
                <!-- <div class="common-title-top-right">
                    <img src="{{asset($themeTrue.'images/shape/title-top-shape.png')}}" alt="shape">
                </div> -->
                <!-- <div class="common-title-top-left">
                    <img src="{{asset($themeTrue.'images/shape/title-top-left.png')}}" alt="shape">
                </div> -->
            </div>
        </div>
        <div class="row">
            @foreach(collect($how_work_section['multiple'])->toArray() as $key =>  $item)
            <div class="col-lg-3 col-md-6">
                <div class="how-work-single">
                    <div class="how-work-single-icon">
                        <img src="{{getFile($item['media']->icon_image->driver,$item['media']->icon_image->path)}}" alt="icon">
                    </div>
                    <div class="how-work-single-content">
                        <a href="javascript:void(0)">{!! $item['heading'] !!}</a>
                        <p>{!! $item['short_description'] !!}</p>
                    </div>
                    <div class="how-work-single-number">
                        <h2>{{$key+1}}</h2>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</section>
<!-- how work -->
