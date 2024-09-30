@extends('components.layouts.app')

@section('content')

<section class="overflow-hidden pt-5" style="background-image: url(web_assets/assets/images/bg.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;">

    <div class="container px-4 py-5 px-md-5 text-center text-lg-start mt-5">
        <div class="row gx-lg-5 align-items-center">

            <div class="col-lg-8 mx-auto position-relative">
                <div class="card bg-glass">
                    <div class="card-body px-4 py-5 px-md-5">
                        <form action="{{ route('password.update') }}" method="post">
                            @csrf
                            <input type="hidden" name="token" value="{{ $token }}">
                            <div class="row">
                                <div class="col-md-12 mb-3">
                                    <h2>Reset Password !</h2>
                                    <p class="pb-3">Regain access with your seamless and secure account retrieval process in just a few clicks</p>
                                    <div class="mb-2 mt-3">
                                        <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ $email ?? old('email') }}" required placeholder="@lang('Email address')" readonly>
                                        @error('email')
                                        <span class="invalid-feedback d-block" role="alert">{{ $message }}<strong></strong>
                                        </span>
                                        @enderror
                                    </div>
                                </div>
                            </div>

                            <div class="mb-3">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6">
                                            <div class="mb-3">
                                                <div class="form-group-flex">
                                                    <label class="fw-semibold">Password</label>
                                                </div>
                                                <div class="pass-group">
                                                    <input id="password" type="password" name="password" class="form-control @error('password') is-invalid @enderror" placeholder="@lang('Password')" required autocomplete="new-password">
                                                    <span class="feather-eye-off toggle-password"></span>
                                                </div>
                                                @error('password')
                                                <span class="invalid-feedback d-block" role="alert"> {{ $message }} </span>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6">
                                            <div class="mb-3">
                                                <div class="form-group-flex">
                                                    <label class="fw-semibold">Confirm New Password</label>
                                                </div>
                                                <div class="pass-group">
                                                    <input id="password-confirm" type="password" name="password_confirmation" class="form-control pass-input confirm_password" placeholder="@lang('Confirm Password')" autocomplete="new-password" required>
                                                    <span class="feather-eye-off toggle-password"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <button type="submit" name="submit" value="submit" class="btn btn-primary btn-block login_btn">
                                Reset Password
                            </button>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>
@endsection
