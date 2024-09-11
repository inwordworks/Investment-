@extends($theme.'layouts.user')
@section('title',trans('Project Details'))
@section('content')
<div class="pagetitle">
    <h3 class="mb-1">@lang('Projects Details')</h3>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{route('user.dashboard')}}">@lang('Home')</a></li>
            <li class="breadcrumb-item active">@lang('Projects')</li>
            @if($project->details->title)
            <li class="breadcrumb-item active">{{$project->details->title}}</li>
            @else
            <li class="breadcrumb-item active">@lang('Project Details')</li>
            @endif
        </ol>
    </nav>
</div>
<!-- projects Details -->
<section class="project-details pt-3">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-8">
                <div class="project-details-left">
                    <div class="swiper projectSwiper2">
                        <div class="swiper-wrapper swiper_big_slider">
                            @foreach($project->getImages() as $image)
                            <div class="swiper-slide">
                                <img src="{{$image}}" />
                                {!! $project->projectStatus() !!}
                            </div>
                            @endforeach
                        </div>
                    </div>
                    <div class="swiper projectSwiper swiper_small_slider">
                        <div class="swiper-wrapper">
                            @foreach($project->getImages() as $image)
                            <div class="swiper-slide">
                                <img src="{{$image}}" />
                            </div>
                            @endforeach

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-4">
                <div class="project-invest">
                    <div class="project-invest-title">
                        <h3>{!! optional($project->details)->title !!} </h3>
                        <p><i class="fa-sharp fa-light fa-location-dot"></i> {{$project->location}}</p>
                    </div>
                    <div class="project-invest-body">
                        <div class="project-single-content-bottom">
                            <div class="project-single-content-wrapper">
                                <div class="project-single-content-inner">
                                    <div class="icon">
                                        <i class="fal fa-hashtag"></i>
                                    </div>
                                    <div class="content">
                                        <p>@lang('Number of Return')</p>
                                        <span>{{$project->number_of_return? $project->number_of_return.' '.trans('Times') :trans('Lifetime Earning')}} </span>
                                    </div>
                                </div>
                                <div class="project-single-content-inner">
                                    <div class="icon">
                                        <i class="fa-solid fa-chart-mixed"></i>
                                    </div>
                                    <div class="content">
                                        <p>@lang('ROI')</p>
                                        <span>{{$project->getReturn()}}</span>
                                    </div>
                                </div>

                                <div class="project-single-content-inner">
                                    <div class="icon">
                                        <i class="fal fa-tag"></i>
                                    </div>
                                    <div class="content">
                                        <p>@lang('Total Unit')</p>
                                        <span>{{$project->total_units}}</span>
                                    </div>
                                </div>
                                <div class="project-single-content-inner">
                                    <div class="icon">
                                        <i class="fal fa-clock-rotate-left"></i>
                                    </div>
                                    <div class="content">
                                        <p>@lang('Maturity')</p>
                                        <span>{{$project->maturity.' '.trans('Days')}}</span>
                                    </div>
                                </div>
                            </div>
                            <div class="project-single-content-wrapper">
                                <div class="project-single-content-inner">
                                    <div class="icon">
                                        <i class="fa-sharp fa-light fa-tags"></i>
                                    </div>
                                    <div class="content">
                                        <p>@lang('Unite Price')</p>
                                        <span>{{$project->investAmount()}}</span>
                                    </div>
                                </div>
                                <div class="project-single-content-inner">
                                    <div class="icon">
                                        <i class="fal fa-calendar-days"></i>
                                    </div>
                                    <div class="content">
                                        <p>@lang('Return Period')</p>
                                        <span>{{$project->returnPeriod()}}</span>
                                    </div>
                                </div>
                                <div class="project-single-content-inner">
                                    <div class="icon">
                                        <i class="fal fa-hand-holding-dollar"></i>
                                    </div>
                                    <div class="content">
                                        <p>@lang('Capital Back')</p>
                                        <span>{{$project->capital_back?'Yes':'No'}}</span>
                                    </div>
                                </div>

                                <div class="project-single-content-inner">
                                    <div class="icon">
                                        <i class="fal fa-clock"></i>
                                    </div>
                                    <div class="content">
                                        <p>@lang('Investment Last Date')</p>
                                        <span>{{dateTime($project->invest_last_date)}}</span>
                                    </div>
                                </div>

                            </div>

                        </div>
                        <div class="project-invest-count">
                            <div class="count-container">
                                <p>@lang('You are Sponsoring:')</p>
                                <div class="count-single">
                                    <button type="button" class="decrement">-</button>
                                    <span class="number unitOfProjects">1</span>
                                    <button type="button" class="increment">+</button>
                                </div>
                            </div>
                            <div class="project-invest-value">
                                <p>@lang('Available Unit')</p>
                                <h4>{{$project->available_units}}</h4>
                            </div>
                        </div>
                        <div class="project-invest-button">
                            @if($project->checkInvestmentLastDate())
                            <button type="button" class="btn-1 projectInvestButton" data-bs-toggle="modal" data-bs-target="#investModal">@lang('Invest Now') <i class="fa-sharp fa-solid fa-arrow-right"></i> <span></span></button>
                            @else
                            <button type="button" class="btn-1">@lang('Expired') <i class="fa-sharp fa-solid fa-arrow-right"></i> <span></span></button>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="about-farmproject">
            <div class="about-farmproject-title">
                <h3>@lang('About The Project')</h3>
            </div>
            <div class="about-farmproject-article">
                {!! optional($project->details)->description !!}
            </div>
        </div>
    </div>
</section>
<!-- projects Details -->


<div class="modal fade" id="investModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">@lang('Invest Now')</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="{{route('user.projectInvest')}}" method="post">
                @csrf
                <div class="modal-body project-modal">
                    <p class="text-center mt-2 mb-1"> @lang('Maturity') : {{$project->number_of_return?$project->number_of_return.' '.trans('Times'):'Lifetime Earning'}}</p>
                    <p class="text-center mb-1"> @lang('ROI :') {{$project->getReturn()}}</p>
                    <p class="text-center mb-2"> @lang('Return Period') : {{$project->returnPeriod()}}</p>
                    <p class="text-center mb-2">@lang('Capital Back') : {{$project->capital_back?'Yes':'No'}}</p>

                    <div class="row g-3">
                        <div class="col-12">
                            <select class="cmn-select2-modal" data-select2-id="select2-data-1-sjyd" aria-hidden="true" required name="balance_type">
                                @auth
                                <option
                                    value="balance">@lang('Wallet Balance -') {{currencyPosition(auth()->guard('web')->user()->balance)}}</option>
                                <option
                                    value="profit">@lang('Profit Balance -') {{currencyPosition(auth()->guard('web')->user()->profit_balance)}}</option>
                                @endauth
                                <option value="checkout">@lang('Checkout')</option>
                            </select>
                        </div>
                        <div class="col-12">
                            @if($project->minimum_invest && $project->maximum_invest)
                            <label>Investment between: {{$project->investAmount()}}</label>
                            @endif
                            <div class="input-group">
                                <span class="input-group-text show-currency bg-white">{{basicControl()->currency_symbol}}</span>
                                <input
                                    type="number"
                                    class="form-control invest-amount"
                                    name="amount"
                                    id="amount"
                                    <?= !$project->minimum_invest && $project->fixed_invest ? 'readonly' : '' ?>
                                    value="{{old('amount')}}"
                                    onkeyup="this.value = this.value.replace (/^\.|[^\d\.]/g, '')" autocomplete="off"
                                    placeholder="@lang('enter per unit price')"
                                    <?= $project->minimum_invest ? 'min="' . $project->minimum_invest . '"' : '' ?>
                                    <?= $project->maximum_invest ? 'max="' . $project->maximum_invest . '"' : '' ?>
                                    required />
                            </div>
                        </div>
                        <input type="hidden" name="project_id" value="{{$project->id}}">
                        <input type="hidden" name="unit" id="investUnit" value="1">
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn-1 d-flex justify-content-center align-items-center text-center">@lang('Make Payment') <span></span></button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection

@push('script')
<script>
    $(document).ready(function() {
        $('.cmn-select2-modal').select2({
            dropdownParent: $('#investModal')
        });
    });

    var unitPrice = "<?= $project->fixed_invest ?>";
    $(document).on('click', '.projectInvestButton', function() {
        let unit = Number($('.unitOfProjects').text());
        $('#investUnit').val(unit);
        <?php if (!$project->minimum_invest): ?>
            $('#amount').val(unit * parseInt(unitPrice));
        <?php else: ?>
            $('#amount').val(unit * parseInt("<?= $project->minimum_invest ?>"));
        <?php endif; ?>
    })

    var swiper = new Swiper(".projectSwiper", {
        spaceBetween: 10,
        slidesPerView: 4,
        freeMode: true,
        watchSlidesProgress: true,
    });
    var swiper2 = new Swiper(".projectSwiper2", {
        spaceBetween: 10,
        autoplay: {
            delay: 5000,
            disableOnInteraction: false
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        thumbs: {
            swiper: swiper,
        },
    });
</script>
@endpush
