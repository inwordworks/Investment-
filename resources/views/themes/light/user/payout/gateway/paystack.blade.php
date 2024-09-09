@extends($theme.'layouts.user')
@section('title',__('Payout'))

@section('content')
    <div class="pagetitle">
        <h3 class="mb-1">@lang('Payout')</h3>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('user.dashboard')}}">@lang('Home')</a></li>
                <li class="breadcrumb-item active">@lang('Payout')</li>
            </ol>
        </nav>
    </div>
    <div class="container-fluid">
        <div class="main row">
            <div class="col-12">
                <div class="row g-4 g-lg-5">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <form action="{{ route('user.payout.paystack',$payout->trx_id) }}" method="post">
                                    @csrf

                                    <input type="hidden" class="type" name="type" value="">
                                    <div class="row g-4">
                                        @if($payoutMethod->supported_currency)
                                            <div class="col-md-12">
                                                <div class=" search-currency-dropdown">
                                                    <label for="from_wallet" class="mb-2">@lang('Select Bank Currency')</label>
                                                    <input type="text" name="currency_code"
                                                           placeholder="Selected"
                                                           autocomplete="off"
                                                           value="{{ $payout->payout_currency_code }}"
                                                           class="form-control transfer-currency @error('currency_code') is-invalid @enderror">

                                                    @error('currency_code')
                                                    <span class="text-danger">{{$message}}</span>
                                                    @enderror
                                                </div>
                                            </div>
                                        @endif
                                        <div class="col-md-12  dynamic-bank mx-1 d-none mb-2">
                                            <label class="mb-2">@lang('Select Bank')</label>
                                            <select id="dynamic-bank" name="bank"
                                                    class="form-control js-example-basic-single">
                                            </select>
                                            @error('bank')
                                            <span class="text-danger">{{$message}}</span>
                                            @enderror
                                        </div>
                                        @if(isset($payoutMethod->inputForm))
                                            @foreach($payoutMethod->inputForm as $key => $value)
                                                @if($value->type == 'text')
                                                    <div class=" mt-3">
                                                        <label
                                                            for="{{ $value->field_name }}" class="mb-2">@lang(snake2Title($value->field_name))</label>
                                                        <input type="text" name="{{ $value->field_name }}"
                                                               placeholder="{{ __(snake2Title($value->field_name)) }}"
                                                               autocomplete="off"
                                                               value="{{ old(snake2Title($value->field_name)) }}"
                                                               class="form-control @error($value->field_name)) is-invalid @enderror">
                                                        <div class="invalid-feedback">
                                                            @error($value->field_name) @lang($message) @enderror
                                                        </div>
                                                    </div>
                                                @elseif($value->type == 'textarea')
                                                    <div class="">
                                                        <label
                                                            for="{{ $value->field_name }}" class="mb-2">@lang(snake2Title($value->field_name))</label>
                                                        <textarea
                                                            class="form-control @error($value->field_name) is-invalid @enderror"
                                                            name="{{$value->field_name}}"
                                                            rows="5">{{ old(snake2Title($value->field_name)) }}</textarea>
                                                        <div
                                                            class="invalid-feedback">@error($value->field_name) @lang($message) @enderror</div>
                                                    </div>
                                                @elseif($value->type == 'file')
                                                    <div class=" mt-3 mb-4">
                                                        <label class="col-form-label mb-2" >@lang('Choose File')</label>
                                                        <div id="image-preview" class="image-preview">
                                                            <label for="image-upload"
                                                                   id="image-label">@lang('Choose File')</label>
                                                            <input type="file" name="{{ $value->field_name }}"
                                                                   class="form-control @error($value->field_name) is-invalid @enderror"
                                                                   id="image-upload"/>
                                                        </div>
                                                        <div class="invalid-feedback">
                                                            @error($value->field_name) @lang($message) @enderror
                                                        </div>
                                                    </div>
                                                @endif
                                            @endforeach
                                        @endif
                                        @if($payoutMethod->automatic_payout_permisstion)
                                            <div class=" mb-3">
                                                <div class="form-check">
                                                    <input class="form-check-input" name="automatic_payout_permisstion" type="checkbox" value="1"/>
                                                    <label class="form-check-label" for="tandc">
                                                        @lang('Automatic Payout')
                                                    </label>
                                                </div>
                                            </div>
                                        @endif

                                        <div class="input-box col-12">
                                            <button type="submit" class="btn-2 ">@lang('submit') <span></span></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div id="tab1" class="content active">
                            <ul class="list-group list-group-numbered">
                                <li class="list-group-item d-flex justify-content-between align-items-start">
                                    <div class="ms-2 me-auto">
                                        <div class="fw-bold-500">@lang('Payout Method')</div>
                                    </div>
                                    <span class="">{{ __($payoutMethod->name) }}</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-start">
                                    <div class="ms-2 me-auto">
                                        <div class="fw-bold-500">@lang('Request Amount')</div>

                                    </div>
                                    <span class="">{{ (getAmount($payout->amount)) }} {{ $payout->payout_currency_code }}</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-start">
                                    <div class="ms-2 me-auto">
                                        <div class="fw-bold-500">@lang('Percentage')</div>
                                    </div>
                                    <span class="">{{ (getAmount($payout->percentage)) }} {{ $payout->payout_currency_code }}</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-start">
                                    <div class="ms-2 me-auto">
                                        <div class="fw-bold-500">@lang('Charge Percentage')</div>
                                    </div>
                                    <span class=" ">{{ (getAmount($payout->charge_percentage)) }} {{ $payout->payout_currency_code }}</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-start">
                                    <div class="ms-2 me-auto">
                                        <div class="fw-bold-500">@lang('Charge Fixed')</div>
                                    </div>
                                    <span class=" ">{{ (getAmount($payout->charge_fixed)) }} {{ $payout->payout_currency_code }}</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-start">
                                    <div class="ms-2 me-auto">
                                        <div class="fw-bold-500">@lang('Charge')</div>
                                    </div>
                                    <span class=" ">{{ (getAmount($payout->charge)) }} {{ $payout->payout_currency_code }}</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-start">
                                    <div class="ms-2 me-auto">
                                        <div class="fw-bold-500">@lang('Amount In Base Currency')</div>
                                    </div>
                                    <span class=" ">{{ (getAmount($payout->amount_in_base_currency)) }} {{ $payout->base_currency }}</span>
                                </li>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection



@push('script')
    <script type="text/javascript">
        'use strict';

        let currency_code = "{{old('currency_code')}}";
        if (currency_code) {
            getBankForm(currency_code);
        }

        $(document).ready(function () {
            let currencyCode = $(".transfer-currency").val();
            $('.dynamic-bank').addClass('d-none');
            getBankForm(currencyCode);


            $(document).on("change", "#dynamic-bank", function () {
                let type = $(this).find(':selected').data('type');
                $('.type').val(type);
            })

        });

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        function getBankForm(currencyCode) {
            $.ajax({
                url: "{{route('user.payout.getBankList')}}",
                type: "post",
                data: {
                    currencyCode,
                },
                success: function (response) {
                    if (response.data != null) {
                        showBank(response.data)
                    }
                }
            });
        }

        function showBank(bankLists) {
            $('#dynamic-bank').html(``);
            let options = `<option disabled selected>@lang("Select Bank")</option>`;
            for (let i = 0; i < bankLists.length; i++) {
                options += `<option value="${bankLists[i].code}" data-type="${bankLists[i].type}">${bankLists[i].name}</option>`;
            }
            $('.dynamic-bank').removeClass('d-none');
            $('#dynamic-bank').html(options);
        }

    </script>

@endpush
