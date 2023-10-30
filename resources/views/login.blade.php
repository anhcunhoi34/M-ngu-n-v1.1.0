@extends($active_theme)
@section('title')
    <title>{{__('user.Login')}}</title>
@endsection

@section('frontend-content')
    <!--=============================
        BREADCRUMB START
    ==============================-->
    <section class="wsus__breadcrumb" style="background: url({{ asset('frontend/images/breadcrumb_bg.jpg') }});">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="wsus__breadcrumb_text">
                        <h1>{{__('user.sign in')}}</h1>
                        <ul class="d-flex flex-wrap">
                            <li><a href="{{ route('home') }}">{{__('user.home')}}</a></li>
                            <li><a href="javascript:;">{{__('user.sign in')}}</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        BREADCRUMB END
    ==============================-->


    <!--=============================
        SIGN IN START
    ==============================-->
    <section class="wsus__sign_up wsus__sign_in mt_120 xs_mt_80 pb_120 xs_pb_80">
        <div class="container">
            <div class="row">
                <div class="col-xl-7 col-lg-9 m-auto">
                    <div class="wsus__signup_text">
                        <h3>{{__('user.Login In')}}</h3>
                        <p class="description">{{__('user.Welcome back! Login with your data you entered during registration')}}.</p>
                        <form action="{{ route('store-login') }}" method="POST">
                            @csrf
                            <div class="row">
                                <div class="col-12">
                                    <div class="wsus__comment_single_input">
                                        <fieldset>
                                            <legend>{{__('user.Email address')}}*</legend>
                                            <input type="email" name="email" placeholder="{{__('user.Email address')}}">
                                        </fieldset>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="wsus__comment_single_input">
                                        <fieldset>
                                            <legend>{{__('user.Password')}}*</legend>
                                            <input type="password" name="password" id="passowrd_input" placeholder="Password">
                                            <span id="show_password"><i class="fas fa-eye-slash"></i></span>
                                        </fieldset>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" name="remember">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            {{__('user.Remember Me')}}
                                            <a href="{{ route('forget-password') }}">{{__('user.Forget Password')}}</a>
                                        </label>
                                    </div>
                                </div>
                                @if($recaptchaSetting->status==1)
                                    <div class="col-12 mb-4">
                                        <div class="wsus__single_com mt_20">
                                            <div class="g-recaptcha" data-sitekey="{{ $recaptchaSetting->site_key }}"></div>
                                        </div>
                                    </div>
                                @endif
                                <div class="col-12">
                                    <button type="submit" class="common_btn">{{__('user.Login')}}</button>
                                </div>
                            </div>
                        </form>
                        <p class="other_login">{{__('user.I have no account .')}} <a href="{{ route('register') }}">{{__('user.Create Account')}}</a></p>
                        @if ($socialLogin->is_gmail == 1)
                        <ul>
                            <li>
                                <a href="{{ route('login-google') }}">
                                    <span><img src="{{ asset('frontend/images/google_icon.png') }}" alt="google" class="img-fluid w-100"></span>
                                    {{__('user.Sign In with Google')}}
                                </a>
                            </li>
                        </ul>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        SIGN IN END
    ==============================-->
@endsection

@push('frontend_js')
<script>
    "use strict";
    let password_show = false;
    (function($) {
        "use strict";
        $(document).ready(function () {
            $("#show_password").on("click", function(){
                password_show = !password_show;
                if(password_show){
                    $(this).html('<i class="fas fa-eye"></i>')

                    $('#passowrd_input').prop('type', 'text');

                }else{
                    $(this).html('<i class="fas fa-eye-slash"></i>')
                    $('#passowrd_input').prop('type', 'password');
                }
            })
        });
    })(jQuery);
</script>
@endpush
