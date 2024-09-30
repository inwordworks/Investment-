@extends('components.layouts.app')

@section('content')

<section class="overflow-hidden pt-5" style="background-image: url('/web_assets/assets/images/bg.jpg');
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;">

    <div class="container px-4 py-5 px-md-5 text-center text-lg-start my-5">
        <div class="row gx-lg-5 align-items-center">
            <div class="col-lg-6 mx-auto mb-5 mb-lg-0 position-relative">
                <div class="card bg-glass">
                    <div class="card-body px-4 py-5 px-md-5">
                    <form class="login-form" action="{{route('user.twoFA-Verify')}}"  method="post">
                            @csrf
                            <div class="row">
                                <div class="col-md-12 mb-3">
                                    <h2>2FA Verification</h2>
                                    <p class="pb-3">Check your email for verification code.</p>
                                    <div class="mb-2">
                                        <input class="form-control" type="text" name="code" value="{{old('code')}}" placeholder="@lang('Code')" autocomplete="off" required>
                                        @error('code')
                                        <span class="invalid-feedback d-block" role="alert">{{ $message }}<strong></strong>
                                        </span>
                                        @enderror
                                    </div>
                                </div>

                            </div>

                            <button type="submit" name="submit" value="submit"
                                class="btn btn-primary btn-block mb-4 login_btn w-100">
                                Submit
                            </button>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>

@endsection
