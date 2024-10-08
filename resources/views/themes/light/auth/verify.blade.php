@extends('layouts.app')

@section('content')
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
                        <form method="post" action="{{ route('login') }}">
                            @csrf
                            <div class="row">
                                <div class="col-md-12 mb-3">
                                    <h2>Login</h2>
                                    <!-- <p class="pb-4">Login to continue to MyStartUp .</p> -->
                                    <div class="mb-2 mt-3">
                                        <div class="form-group-flex">
                                            <label class="mb-2">User Id / Mobile</label>
                                        </div>
                                        <input type="text" name="username" value="{{old('username')}}" class="sign-in-input form-control" placeholder="@lang('username or email')" required>
                                        @error('username')
                                        <span class="invalid-feedback d-block" role="alert">{{ $message }}<strong></strong>
                                        </span>
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
                            <div class="form-check d-flex mb-4">
                                <input class="form-check-input me-2" type="checkbox" name="remember" id="remember" <?= old('remember') ? 'checked' : '' ?> />
                                <label class="form-check-label" for="remember">
                                    Remember Me
                                </label>
                            </div>
                            <button type="submit" name="submit" value="submit"
                                class="btn btn-primary btn-block mb-4 login_btn">
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
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Verify Your Email Address') }}</div>

                <div class="card-body">
                    @if (session('resent'))
                        <div class="alert alert-success" role="alert">
                            {{ __('A fresh verification link has been sent to your email address.') }}
                        </div>
                    @endif

                    {{ __('Before proceeding, please check your email for a verification link.') }}
                    {{ __('If you did not receive the email') }},
                    <form class="d-inline" method="POST" action="{{ route('verification.resend') }}">
                        @csrf
                        <button type="submit" class="btn btn-link p-0 m-0 align-baseline">{{ __('click here to request another') }}</button>.
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
