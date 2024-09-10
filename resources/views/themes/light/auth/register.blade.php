@extends('components.layouts.app')

@section('content')

<!-- Register -->
<section class="background-radial-gradient overflow-hidden pt-5">
    <div class="container px-4 py-5 px-md-5 text-center text-lg-start my-5">
        <div class="row gx-lg-5 justify-content-center mb-5">
            <div class="col-lg-6 mb-5 mb-lg-0 position-relative">
                <div id="radius-shape-1" class="position-absolute rounded-circle shadow-5-strong"></div>
                <div id="radius-shape-2" class="position-absolute shadow-5-strong"></div>
                <div class="card bg-glass">
                    <div class="card-body px-4 py-5 px-md-5">
                        <form action="{{ route('register') }}" method="post">
                            @csrf

                            <div class="mb-3">
                                <h2 class="text-center">Registration</h2>
                                <p class="pb-4 text-center">Discover the world’s best investment Platform for the future Asset .</p>
                                <div class="row">
                                    @if($referUser != null)
                                    <div class="col-12">
                                        <div class="mb-2">
                                            <div class="form-group-flex">
                                                <label class="fw-semibold">@lang('Refered By')</label>
                                            </div>
                                            <input type="text" name="email" class="form-control" value="{{$referUser->username}}" readonly>
                                        </div>
                                    </div>
                                    @endif
                                    <div class="col-md-6">
                                        <div class="mb-2">
                                            <div class="form-group-flex">
                                                <label class="fw-semibold">@lang('First Name')</label>
                                            </div>
                                            <input type="text" name="first_name" class="form-control" value="{{old('first_name')}}" placeholder="@lang('First Name')" required>
                                            @error('first_name')
                                            <span class="invalid-feedback d-block" role="alert"> {{ $message }} </span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="mb-2">
                                            <div class="form-group-flex">
                                                <label class="fw-semibold">@lang('Last Name')</label>
                                            </div>
                                            <input type="text" name="last_name" class="form-control" value="{{old('last_name')}}" placeholder="@lang('Last Name')" required>
                                            @error('last_name')
                                            <span class="invalid-feedback d-block" role="alert"> {{ $message }} </span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="mb-2">
                                            <div class="form-group-flex">
                                                <label class="fw-semibold">@lang('Email')</label>
                                            </div>
                                            <input type="email" name="email" class="form-control" value="{{old('email')}}" placeholder="@lang('Enter your email')" required>
                                            @error('email')
                                            <span class="invalid-feedback d-block" role="alert"> {{ $message }} </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-2">
                                            <div class="form-group-flex">
                                                <label class="fw-semibold">@lang('Username')</label>
                                            </div>
                                            <input type="text" name="username" class="form-control" value="{{old('username')}}" placeholder="@lang('Enter your username')" required>
                                            @error('username')
                                            <span class="invalid-feedback d-block" role="alert"> {{ $message }} </span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <div class="form-group-flex">
                                                <label for="organization" class="fw-semibold">@lang('Phone Number')</label>
                                            </div>
                                            <div class="phone-input">
                                                <input type="hidden" name="phone_code" id="phoneCode" value="+91">
                                                <input type="hidden" name="country_code" id="countryCode" value="IN">
                                                <input type="hidden" name="country" id="countryName" value="India">
                                                <input type="tel" min="1111111111" max="9999999999" maxlength="10" minlength="10" id="telephone" name="phone" value="{{old('phone')}}" class="form-control">
                                            </div>
                                            @error('phone')
                                            <div class="invalid-feedback d-block" role="alert">{{$message}}</div>
                                            @enderror
                                        </div>
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
                                                    <input type="password" name="password" class="form-control pass-input" placeholder="@lang('Password')" autocomplete="off" required>
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
                                                    <input type="password" name="password_confirmation" class="form-control pass-input confirm_password" placeholder="@lang('Confirm Password')" autocomplete="off" required>
                                                    <span class="feather-eye-off toggle-password"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="form-check d-flex mb-4 w-100">
                                <input class="form-check-input me-2" type="checkbox" value=""
                                    id="form2Example33" checked />
                                <label class="form-check-label" for="form2Example33">
                                    Accept Terms & Conditions
                                </label>
                            </div>
                            <button type="submit" name="submit" value="submit"
                                class="btn btn-primary btn-block mb-4 login_btn w-100" style="margin: 0 auto;">
                                @lang('Create Account')
                            </button>
                            <div class="account-signup w-100">
                                <p>Already have an account ? <a href="{{route('login')}}"><strong>Login</strong></a></p>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Register -->
@endsection
