@extends('components.layouts.app')

@section('content')

<!-- sign-in -->
<section class="overflow-hidden pt-5" style="background-image: url('/web_assets/assets/images/bg.jpg');
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;">

    <div class="container px-4 py-5 px-md-5 text-center text-lg-start my-5">
        <div class="row gx-lg-5 align-items-center mb-5">
            <div class="col-lg-6 mb-5 mb-lg-0" style="z-index: 10">
                <h1 class="my-5 display-5 fw-bold ls-tight" style="color: hsl(218, 81%, 95%)">
                    Welcome
                    <span style="color: hsl(218, 81%, 75%)">Back</span> MyStartUp's Family Member!
                </h1>
                <p class="mb-4 opacity-70" style="color: hsl(218, 81%, 85%)">
                    "Life is more vibrant with you here. Your return brings a burst of energy and positivity,
                    makes everyday count, and let's continue to inspire and achieve greatness together!"
                </p>
            </div>
            <div class="col-lg-6 mb-5 mb-lg-0 position-relative">
                <div class="card bg-glass">
                    <div class="card-body px-4 py-5 px-md-5">
                        <form action="{{ route('login') }}" method="post" id="login-form"">
                            @csrf
                            <div class="row">
                                <div class="col-md-12 mb-3">
                                    <h2>Login</h2>
                                    <!-- <p class="pb-4">Login to continue to MyStartUp .</p> -->
                                    <div class="mb-2 mt-3">
                                        <div class="form-group-flex">
                                            <label class="mb-2">@lang('Username or Email')</label>
                                        </div>
                                        <input type="text" name="username" value="{{old('username')}}" class="form-control" placeholder="@lang('username or email')" required>
                                        @error('username')
                                        <span class="invalid-feedback d-block" role="alert">{{ $message }}<strong></strong></span>
                                        @enderror
                                        @error('email')
                                        <span class="invalid-feedback d-block" role="alert">{{ $message }}<strong></strong></span>
                                        @enderror
                                    </div>
                                </div>

                            </div>
                            <div class="mb-3">
                                <div class="form-group-flex">
                                    <div class="form-group-flex">
                                        <label class="mb-2">Password</label>
                                    </div>
                                    <a href="{{ route('password.request') }}" class="forgot-link">Forgot password?</a>
                                </div>
                                <div class="pass-group">
                                    <input type="password" name="password" value="{{old('password')}}" class="form-control pass-input" placeholder="@lang('Password')" autocomplete="off" required>
                                    <span class="feather-eye-off toggle-password"></span>
                                </div>
                                @error('password')
                                <span class="invalid-feedback d-block" role="alert">{{ $message }} </span>
                                @enderror
                            </div>

                            @if($basicControl->manual_recaptcha === 1 && $basicControl->reCaptcha_status_login === 1)
                            <!-- <span>Manual captcha</span> -->
                                <div class="sign-in-form-group">
                                    <label>@lang('Captcha')</label>
                                    <input type="text"   name="captcha" id="captcha" class="sign-in-input" placeholder="@lang('enter captcha')">
                                    @error('captcha')
                                    <span class="invalid-feedback d-block" role="alert">{{ $message }}</span>
                                    @enderror
                                </div>
                                <div class="mt-4">
                                    <div class="input-group input-group-merge manualRecaptchaImage" data-hs-validation-validate-class>
                                        <img src="{{route('captcha').'?rand='. rand()}}" id='captcha_image' >
                                        <a class="input-group-append input-group-text manualRecaptchaIcon"
                                            href='javascript: refreshCaptcha();'>
                                            <i class="fa-solid fa-rotate-right"></i>
                                        </a>
                                    </div>
                                </div>
                            @endif

                            @if(basicControl()->google_user_login_recaptcha_status && basicControl()->google_recaptcha)
                            <!-- <span>Google re-captcha</span> -->
                                <div class="row mt-4">
                                    <div class="g-recaptcha @error('g-recaptcha-response') is-invalid @enderror"
                                            data-sitekey="{{ env('GOOGLE_RECAPTCHA_SITE_KEY') }}"></div>
                                    @error('g-recaptcha-response')
                                    <span class="invalid-feedback d-block text-danger" role="alert">
                                        {{ $message }}
                                    </span>
                                    @enderror
                                </div>
                            @endif
                            <div class="form-check d-flex mb-4">
                                <input class="form-check-input me-2" type="checkbox"
                                    id="remember" {{ old('remember') ? 'checked' : '' }} />
                                <label class="form-check-label" for="remember">
                                    Remember Me
                                </label>
                            </div>
                            <button
                             type="button"
                             name="submit" value="submit"
                                class="btn btn-primary btn-block mb-4 login_btn g-recaptcha"
                            @if(basicControl()->google_user_login_recaptcha_status && basicControl()->google_recaptcha)
                                data-sitekey="{{ env('GOOGLE_RECAPTCHA_SITE_KEY') }}"
                                    data-callback='onSubmit'
                                    data-action='submit'
                            @endif
                                >
                                Login <i class="fas fa-sign-in-alt"></i>
                            </button>

                            <div class="account-signup">
                                <p>Don't have an account ? <a href="{{ route('register') }}"><strong>Register</strong></a></p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- sign-in -->

@endsection


@push('js-lib')
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
@endpush

@push('style')
    <style>
        .main-footer-padding{
            padding-top: 60px;
        }
    </style>
@endpush

@push('script')
    <script>
        'use strict';
        function onSubmit(token) {
            document.getElementById("login-form").submit();
        }
        function refreshCaptcha(){
            let img = document.images['captcha_image'];
            img.src = img.src.substring(
                0,img.src.lastIndexOf("?")
            )+"?rand="+Math.random()*1000;
        }
    </script>
@endpush
