@extends($active_theme)
@section('title')
    <title>{{__('user.Forget Password')}}</title>
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
                        <h1>{{__('user.Forget Password')}}</h1>
                        <ul class="d-flex flex-wrap">
                            <li><a href="{{ route('home') }}">{{__('user.home')}}</a></li>
                            <li><a href="javascript:;">{{__('user.Forget Password')}}</a></li>
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
                <div class="col-xl-8 col-lg-10 m-auto">
                    <div class="wsus__signup_text">
                        <h3>{{__('user.Forget your password')}} ?</h3>
                        <p class="description">{{__('user.Did you forget your password ? Do not worry. Please submit below form using your email, and get a reset password link.')}}</p>
                        <form action="{{ route('send-forget-password') }}" method="POST">
                            @csrf
                            <div class="row">
                                <div class="col-xl-12">
                                    <div class="wsus__comment_single_input">
                                        <fieldset>
                                            <legend>{{__('user.Email address')}}*</legend>
                                            <input type="email" name="email" placeholder="{{__('user.Email address')}}">
                                        </fieldset>
                                    </div>
                                    <button type="submit" class="common_btn">{{__('user.Forget your password')}}</button>
                                </div>
                            </div>
                        </form>
                        <p class="other_login text-center mt-3">{{__("Redirect to login page.")}} <a href="{{ route('login') }}">{{__('user.Click here')}}</a></p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        SIGN IN END
    ==============================-->
@endsection
