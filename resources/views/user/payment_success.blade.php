@extends($active_theme)

@section('title')
    <title>{{__('user.Payment Success')}}</title>
    <meta name="description" content="{{__('user.Payment Success')}}">
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
                        <h1>{{__('user.payment done')}}</h1>
                        <ul class="d-flex flex-wrap">
                            <li><a href="{{ route('home') }}">{{__('user.home')}}</a></li> 
                            <li><a href="javascript:;">{{__('user.payment done')}}</a></li>
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
        PAYMENT DONE  START
    ==============================-->
    <section class="wsus__payment_done pt_120 xs_pt_80 pb_110 xs_pb_70">
        <div class="container">
            <div class="row">
                <div class="col-xl-7 col-xxl-6 col-md-7 m-auto">
                    <div class="wsus__payment_done_text">
                        <div class="wsus__payment_done_img">
                            <img src="{{ asset('frontend/images/thankyou.png') }}" alt="thankyou" class="img-fluid w-100">
                        </div>
                        <h3>{{__('user.Thank You')}} ! <br> {{__('user.For Buying this Item')}}.</h3>
                        <a class="common_btn" href="{{ route('download') }}">{{__('user.Download File')}}</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        PAYMENT DONE  END
    ==============================-->
@endsection
