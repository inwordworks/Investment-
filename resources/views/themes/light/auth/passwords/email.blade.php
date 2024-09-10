@extends('components.layouts.app')

@section('content')

<section class="background-radial-gradient overflow-hidden pt-5">

    <div class="container px-4 py-5 px-md-5 text-center text-lg-start my-5">
        <div class="row gx-lg-5 align-items-center">
            <div class="col-lg-6 mx-auto my-md-5 position-relative">
                <div id="radius-shape-1" class="position-absolute rounded-circle shadow-5-strong"></div>
                <div id="radius-shape-2" class="position-absolute shadow-5-strong"></div>
                <div class="card bg-glass">
                    <div class="card-body px-4 py-5 px-md-5">
                        <form method="post" action="{{ route('password.email') }}">
                            @csrf
                            <div class="row">
                                <div class="col-md-12 mb-3">
                                    <h2>@lang('Recover Password')!</h2>
                                    <p class="mb-3">@lang('Regain access with your seamless and secure account retrieval process in just a few clicks')!</p>
                                    <div class="mb-2">
                                        <input type="email" name="email" value="{{old('email')}}" class="sign-in-input form-control cmn-input @error('email') is-invalid @enderror" placeholder="@lang('Email address')" required>
                                        @error('email')
                                        <span class="invalid-feedback d-block" role="alert">{{ $message }}<strong></strong></span>
                                        @enderror
                                    </div>
                                </div>

                            </div>

                            <button type="submit" name="submit" value="submit"
                                class="btn btn-primary btn-block mb-4 login_btn w-100">
                                Send Link
                            </button>

                            <div class="account-signup">
                                <p>Back to Sign in? <a href="{{route('login')}}"><strong>Login</strong></a></p>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>

@endsection
