@extends($theme.'layouts.user')
@section('title',trans('Payment'))
@section('content')
<style>
    .displayNone {
        display: none !important
    }

    /* .payment {
        padding: 140px 0 140px;
        background: rgba(var(--secondary-color-rgb), 0.1);
    } */

    .payment-title {
        font-size: 24px;
        font-weight: 500;
        margin-bottom: 30px;
    }

    .payment-list {
        margin-top: 20px;
        height: 480px;
        overflow: auto;
        padding: 5px;
    }

    .payment-list:first-child {
        margin-top: 0;
    }

    .payment-list .item {
        position: relative;
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 15px;
        border: 0.5px solid var(--primary-color);
        border-radius: 5px;
        /* -webkit-box-shadow: 0px 0px 13px 5px rgba(224, 224, 224, 1);
        -moz-box-shadow: 0px 0px 13px 5px rgba(224, 224, 224, 1);
        box-shadow: 0px 0px 13px 5px rgba(224, 224, 224, 1); */
    }

    .payment-list .form-check-label {
        display: flex;
        align-items: center;
        width: 100%;
        height: 100%;
        padding: 14px;
        cursor: pointer;
        border-radius: 5px;
        transition: 0.5s;
        gap: 15px;
        background-color: var(--white-color);
    }

    .payment-list-content {
        display: flex;
        align-items: center;
        gap: 20px;
    }

    .payment-list-info .payment-list-title {
        display: block;
        font-size: 20px;
        font-weight: 500;
        color: var(--black-color);
        margin-bottom: 10px;
    }

    .payment-list-info .payment-list-text {
        display: inline-block;
        color: var(--text-color-1);
        max-width: 462px;
    }

    .payment-list .form-check-label .payment-list-image img {
        width: 50px;
        height: 50px;
        min-width: 50px;
        min-height: 50px;
        border-radius: 50%;
    }

    .form-check-input:checked {
        background-color: var(--secondary-color);
        border-color: var(--secondary-color);
    }

    .payment-list .form-check-label .content-area {
        max-width: 400px;
        padding-right: 30px;
    }

    .payment-list .form-check-input {
        position: absolute;
        right: 15px;
    }

    .payment-list .form-check-input[type=radio]:checked+.form-check-label {
        background-color: var(--bg-2);
    }

    /* right side */
    .payment-side-box {
        border: 1px solid var(--secondary-color);
        padding: 30px 30px;
        border-radius: 6px;
        margin-bottom: 30px;
    }

    .payment-side-bar label {
        font-size: 18px;
        margin-bottom: 10px;
    }

    .payment-side-bar .nice-select {
        width: 100%;
        float: none;
        z-index: 1;
        border-radius: 7px;
        border: none;
        font-size: 16px;
        height: 48px;
        line-height: 48px;
    }

    .payment-side-bar .nice-select:after {
        border-bottom: 1px solid var(--black-color);
        border-right: 1px solid var(--black-color);
        height: 9px;
        width: 9px;
        margin-top: -7px;
        right: 18px;
    }

    .payment-side-bar .nice-select .list {
        width: 100%;
    }

    .payment-summary-list ul {
        padding: 10px 0 20px;
    }

    .payment-summary-list ul li {
        padding: 12px 0 12px;
        border-bottom: 1px solid rgba(0, 0, 0, 0.25);
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .payment-side-bar .btn-1 {
        width: 100%;
        display: flex;
        justify-content: center;
    }
</style>
<section class="payment">
    <div class="container">
        <form action="{{route('user.invest.request')}}" method="post">
            @csrf
            <h4 class="payment-title">@lang('Select Payment')</h4>
            <div class="row">
                <div class="col-7">
                    <div class="payment-box">
                        <ul class="payment-list">
                            @foreach($gateways as $method)
                            <li class="item">
                                <label class="form-check-label" for="{{ $method->name }}">
                                    <input class="form-check-input selectPayment"
                                        value="{{ $method->id }}" type="radio"
                                        name="gateway_id"
                                        id="{{ $method->name }}">
                                    <span class="payment-list-content">
                                        <span class="payment-list-image">
                                            <img src="{{ getFile($method->driver,$method->image ) }}" alt="image">
                                        </span>
                                        <span class="payment-list-info">
                                            <span class="payment-list-title">{{$method->name}}</span>
                                            <span class="payment-list-text">{{$method->description}}</span>
                                        </span>
                                    </span>
                                </label>
                            </li>
                            @endforeach
                        </ul>
                    </div>
                </div>

                <div class="col-lg-5">
                    <div class="payment-side-bar">
                        <div class="payment-side-box" id="GatewayForm">
                            <label>@lang('Select Currency')</label>
                            <select class="selectpicker nice-select" name="supported_currency" id="supported_currency">

                            </select>

                            <span class="d-block text-danger errorMessage"></span>
                        </div>
                        <div class="payment-side-box payment-summary">
                            <h5>@lang('Payment Summery')</h5>
                            <div class="payment-summary-list">
                                <ul class="showCharge">

                                </ul>
                            </div>
                        </div>
                        <button type="submit" class="btn-1">@lang('Make Payment') <span></span></button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>
<!-- payment -->

@endsection


@push('script')
<script>
    var gateway_id = null;
    $(document).on('click', '.selectPayment', function() {
        let id = $(this).val();
        gateway_id = id;
        supportCurrency(id)
    })

    function supportCurrency(selectedGateway) {
        if (!selectedGateway) {
            console.error('Selected Gateway is undefined or null.');
            return;
        }
        $.ajax({
            url: "{{ route('supported.currency') }}",
            data: {
                gateway: selectedGateway
            },
            type: "GET",
            success: function(response) {
                $('#supported_currency').empty();
                if (response.data === "") {
                    $('#supported_currency').attr('name', 'supported_currency');
                    let markup = `<option value="USD">USD</option>`;
                    $('#supported_currency').append(markup);
                }
                if (response.currencyType == 1) {
                    $('#supported_currency').attr('name', 'supported_currency');
                    let markup = '<option value="">Selected Currency</option>';
                    $('#supported_currency').append(markup);
                    $(response.data).each(function(index, value) {
                        let markup = `<option value="${value}">${value}</option>`;
                        $('#supported_currency').append(markup);
                    });
                }
                if (response.currencyType == 0) {
                    $('#supported_currency').attr('name', 'supported_crypto_currency');
                    let markup2 = '<option value="">Select Crypto Currency</option>';
                    $('#supported_currency').append(markup2);
                    $(response.data).each(function(index, value) {
                        let markupOption = `<option value="${value}">${value}</option>`;
                        $('#supported_currency').append(markupOption);
                    });
                }
                $('.nice-select').niceSelect('update');

            },
            error: function(error) {
                console.error('AJAX Error:', error);
            }
        })
    }

    $(document).on('change', '#supported_currency', function() {

        checkAmount($(this).val())

    })

    function checkAmount(currency) {
        let amount = '{{$amount}}';
        $.ajax({
            method: 'GET',
            url: "{{ route('payment.checkAmount') }}",
            dataType: "json",
            data: {
                'amount': amount,
                'selected_currency': currency,
                'select_gateway': gateway_id,
                'selectedCryptoCurrency': '',
            },
            success: function(response) {
                $('.errorMessage').text('')
                if (response.status) {
                    let base_currency = "{{basicControl()->base_currency}}"
                    showCharge(response, base_currency);
                } else {
                    $('.errorMessage').text(response.message)

                }
            }
        })
    }

    function showCharge(response, currency) {
        let txnDetails = `
						<li>
							{{ __('Amount In') }} ${response.currency}
							<span> ${response.amount} ${response.currency}</span>
						</li>

						<li >
							{{ __('Charge') }}
            <span>  ${response.charge} ${response.currency}</span>
						</li>


						<li class="displayNone">
							{{ __('Payable Amount') }}
            <span> ${response.payable_amount} ${response.currency}</span>
						</li>

						<li class="displayNone">
							<span>{{ __('Exchange Rate') }}</span>
							<span > 1 ${currency} <i class="fa-light fa-arrow-right-arrow-left fa-sm"></i>  ${response.conversion_rate} ${response.currency}</span>
						</li>


						<li >
							<span>{{ __('Payable Amount') }}</span>
							<span> ${response.amount_in_base_currency} ${currency}</span>
						</li>

					</ul>`;
        $('.showCharge').html(txnDetails)
    }
</script>
@endpush
