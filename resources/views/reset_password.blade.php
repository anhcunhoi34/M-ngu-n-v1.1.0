@extends($active_theme)
@section('title')
    <title>{{__('user.Reset Password')}}</title>
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
                        <h1>{{__('user.Reset password')}}</h1>
                        <ul class="d-flex flex-wrap">
                            <li><a href="{{ route('home') }}">{{__('user.home')}}</a></li>
                            <li><a href="javascript:;">{{__('user.Reset password')}}</a></li>
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
        RESET PAGE START
    ==============================-->
    <section class="wsus__sign_up wsus__sign_in mt_120 xs_mt_80 pb_120 xs_pb_80">
        <div class="container">
            <div class="row">
                <div class="col-xl-7 col-lg-9 m-auto">
                    <div class="wsus__signup_text">
                        <h3>{{__('user.Reset Password')}}</h3>
                        <p class="description">{{__('user.Reset your Password to initiate the process of recovering access to your account.')}}</p>
                        <form action="{{ route('store-reset-password',$token) }}" method="POST">
                            @csrf
                            <div class="row">
                                <div class="col-12">
                                    <div class="wsus__comment_single_input">
                                        <fieldset>
                                            <legend>{{__('user.Email address')}}*</legend>
                                            <input type="email" name="email" value="{{ $user->email }}"  placeholder="{{__('user.Email address')}}" readonly>
                                        </fieldset>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="wsus__comment_single_input">
                                        <fieldset>
                                            <legend>{{__('user.Password')}}*</legend>
                                            <input type="password" name="password" id="passowrd_input" placeholder="{{__('user.Password')}}">
                                            <span id="show_password"><i class="fas fa-eye-slash"></i></span>
                                        </fieldset>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="wsus__comment_single_input">
                                        <fieldset>
                                            <legend>{{__('user.Confirm password')}}*</legend>
                                            <input type="password" name="password_confirmation" id="c_passowrd_input" placeholder="{{__('user.Confirm password')}}">
                                            <span id="c_show_password"><i class="fas fa-eye-slash"></i></span>
                                        </fieldset>
                                    </div>
                                </div>
                                @if($recaptchaSetting->status==1)
                                    <div class="col-xl-12 mb-4">
                                        <div class="wsus__single_com mt_20">
                                            <div class="g-recaptcha" data-sitekey="{{ $recaptchaSetting->site_key }}"></div>
                                        </div>
                                    </div>
                                @endif
                                <div class="col-12">
                                    <button type="submit" class="common_btn">{{__('user.Reset Password')}}</button>
                                </div>
                            </div>
                        </form>
                        <p class="other_login">{{__('user.Already have an Account')}}? <a href="{{ route('login') }}">{{__('user.Login')}}</a></p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        RESET PAGE END
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
