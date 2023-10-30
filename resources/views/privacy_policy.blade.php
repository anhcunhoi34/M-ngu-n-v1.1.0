@extends($active_theme)
@section('title')
    <title>{{__('user.Privacy Policy')}}</title>
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
                        <h1>{{__('user.privacy policy')}}</h1>
                        <ul class="d-flex flex-wrap">
                            <li><a href="{{ route('home') }}">{{__('user.home')}}</a></li>
                            <li><a href="javascript:;">{{__('user.privacy policy')}}</a></li>
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
        PRIVACY POLICY START
    ==============================-->
    <section class="wsus__privacy_policy mt_70 xs_mt_30 pb_115 xs_pb_75">
        <div class="container">
            <div class="row">
                <div class="col-12 col-xl-12 wow fadeInUp" data-wow-duration="1s">
                    <div class="wsus__terms_condition_text">
                        {!! clean($privacyPolicy) !!}
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        PRIVACY POLICY END
    ==============================-->

@endsection
