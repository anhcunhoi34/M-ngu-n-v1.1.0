@extends($active_theme)
@section('title')
    <title>{{__('user.Register')}}</title>
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
                        <h1>{{__('user.sign up')}}</h1>
                        <ul class="d-flex flex-wrap">
                            <li><a href="{{ route('home') }}">{{__('user.home')}}</a></li>
                            <li><a href="javascript:;">{{__('user.sign up')}}</a></li>
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
        SIGN UP START
    ==============================-->
    <section class="wsus__sign_up mt_120 xs_mt_80 pb_120 xs_pb_80">
        <div class="container">
            <div class="row">
                <div class="col-xl-7 col-lg-9 m-auto">
                    <div class="wsus__signup_text">
                        <h3>{{__('user.Register')}}</h3>
                        <p class="description">{{__('user.Welcome to Alasmart')}}.</p>
                        <form action="{{ route('store-register') }}" method="POST">
                            @csrf
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="wsus__comment_single_input">
                                        <fieldset>
                                            <legend>{{__('user.Name')}}*</legend>
                                            <input type="text" name="name" placeholder="{{__('user.Name')}}">
                                        </fieldset>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="wsus__comment_single_input">
                                        <fieldset>
                                            <legend>{{__('user.Email')}}*</legend>
                                            <input type="email" name="email" placeholder="{{__('user.Email')}}">
                                        </fieldset>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="wsus__comment_single_input">
                                        <fieldset>
                                            <legend>{{__('user.Password')}}*</legend>
                                            <input type="password" id="passowrd_input" name="password" placeholder="{{__('user.Password')}}">
                                            <span id="show_password"><i class="fas fa-eye-slash"></i></span>
                                        </fieldset>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="wsus__comment_single_input">
                                        <fieldset>
                                            <legend>{{__('user.Confirm Password')}}*</legend>
                                            <input type="password" name="c_password" id="c_passowrd_input" placeholder="{{__('user.Confirm Password')}}">
                                            <span id="c_show_password"><i class="fas fa-eye-slash"></i></span>
                                        </fieldset>
                                    </div>
                                </div>
                                @if($recaptchaSetting->status==1)
                                    <div class="col-xl-12">
                                        <div class="wsus__single_com">
                                            <div class="g-recaptcha" data-sitekey="{{ $recaptchaSetting->site_key }}"></div>
                                        </div>
                                    </div>
                                @endif
                                <div class="col-12 mt-4">
                                    <button type="submit" class="common_btn">{{__('user.Registration')}}</button>
                                </div>
                            </div>
                        </form>
                        <p class="other_login">{{__('user.Already have an Account')}}? <a href="{{ route('login') }}">{{__('user.Log In')}}</a></p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        SIGN UP END
    ==============================-->
@endsection

@push('frontend_js')
<script>
    "use strict";
    let password_show = false;
    let c_password_show = false;
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
            });

            $("#c_show_password").on("click", function(){
                c_password_show = !c_password_show;
                if(c_password_show){
                    $(this).html('<i class="fas fa-eye"></i>')

                    $('#c_passowrd_input').prop('type', 'text');

                }else{
                    $(this).html('<i class="fas fa-eye-slash"></i>')
                    $('#c_passowrd_input').prop('type', 'password');
                }
            })
        });
    })(jQuery);
</script>
@endpush