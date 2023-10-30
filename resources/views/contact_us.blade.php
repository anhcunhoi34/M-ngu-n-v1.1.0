
@extends($active_theme)

@section('title')
    <title>{{ $seo_setting->seo_title }}</title>
    <meta name="title" content="{{ $seo_setting->seo_title }}">
    <meta name="description" content="{{ $seo_setting->seo_description }}">
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
                        <h1>{{__('user.Contact Us')}}</h1>
                        <ul class="d-flex flex-wrap">
                            <li><a href="{{ route('home') }}">{{__('user.Home')}}</a></li>
                            <li><a href="javascript:;">{{__('user.Contact Us')}}</a></li>
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
        CONTACT US START
    ==============================-->
    <section class="wsus__contact_us pt_95 xs_pt_55">
        <div class="container">
            <div class="row">
                <div class="col-xl-4 col-md-6 col-lg-4">
                    <div class="wsus__contact_single_info">
                        <span><i class="fas fa-phone-alt"></i></span>
                        <a>{!! nl2br($contact->contactlangfrontend->phone) !!}</a>
                    </div>
                </div>
                <div class="col-xl-4 col-md-6 col-lg-4">
                    <div class="wsus__contact_single_info">
                        <span><i class="fas fa-envelope"></i></span>
                        <a>{!! nl2br($contact->email) !!}</a>
                    </div>
                </div>
                <div class="col-xl-4 col-md-6 col-lg-4">
                    <div class="wsus__contact_single_info">
                        <span><i class="fas fa-map-marker-alt"></i></span>
                        <a>{!! nl2br($contact->contactlangfrontend->address) !!}</a>
                    </div>
                </div>
            </div>
            <div class="row mt_120 xs_mt_80">
                <div class="col-xl-8 col-lg-7">
                    <form action="{{ route('send-contact-message') }}" method="POST" class="wsus__contact_form wsus__comment_input_area">
                        @csrf
                        <h3>{{ $contact->contactlangfrontend->title1 }}</h3>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="wsus__comment_single_input">
                                    <fieldset>
                                        <legend>{{__('user.Name')}}*</legend>
                                        <input type="text" name="name" value="{{ old('name') }}" placeholder="{{__('user.Name')}}">
                                    </fieldset>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="wsus__comment_single_input">
                                    <fieldset>
                                        <legend>{{__('user.Phone')}}</legend>
                                        <input type="text" name="phone" value="{{ old('phone') }}" placeholder="{{__('user.Phone')}}">
                                    </fieldset>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="wsus__comment_single_input">
                                    <fieldset>
                                        <legend>{{__('user.Email')}}*</legend>
                                        <input type="email" name="email" value="{{ old('email') }}" placeholder="{{__('user.Email')}}">
                                    </fieldset>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="wsus__comment_single_input">
                                    <fieldset>
                                        <legend>{{__('user.Subject')}}*</legend>
                                        <input type="text" name="subject" value="{{ old('subject') }}" placeholder="{{__('user.Subject')}}">
                                    </fieldset>
                                </div>
                            </div>
                            <div class="col-xl-12">
                                <div class="wsus__comment_single_input">
                                    <fieldset>
                                        <legend>{{__('user.Message')}}*</legend>
                                        <textarea rows="6" name="message" placeholder="{{__('user.Write a Message')}}">{{ old('message') }}</textarea>
                                    </fieldset>
                                </div>
                            </div>

                            @if($recaptchaSetting->status==1)
                                <div class="col-xl-12">
                                    <div class="wsus__comment_single_input">
                                        <div class="g-recaptcha" data-sitekey="{{ $recaptchaSetting->site_key }}"></div>
                                    </div>
                                </div>
                            @endif

                            <div class="col-xl-12">
                                <button class="common_btn" type="submit">{{__('user.Send Message')}}</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-xl-4 col-lg-5">
                    <div class="wsus__contact_support">
                        <div class="text">
                            <span class="icon"><i class="far fa-headset"></i></span>
                            <p>
                                {{ $contact->contactlangfrontend->title2 }}
                                <span>{{ $contact->contactlangfrontend->time }}</span>
                                {{ $contact->contactlangfrontend->off_day }}
                            </p>
                        </div>
                        <div class="img">
                            <img src="{{ asset($contact->supporter_image) }}" alt="support classimg-fluid w-100">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-12 pt_120 xs_pt_80">
            <div class="wsus__contact_map">
                {!! $contact->map !!}
            </div>
        </div>
    </section>
    <!--=============================
        CONTACT US END
    ==============================-->
@endsection
