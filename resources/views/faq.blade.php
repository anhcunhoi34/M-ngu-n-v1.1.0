@extends($active_theme)
@section('title')
    <title>{{__('user.FAQ')}}</title>
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
                        <h1>{{__('user.FAQ')}}</h1>
                        <ul class="d-flex flex-wrap">
                            <li><a href="{{ route('home') }}">{{__('user.Home')}}</a></li>
                            <li><a href="javascript:;">{{__('user.FAQ')}}</a></li>
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
        FAQ START
    ==============================-->
    <section class="wsus__faq pt_115 xs_pt_75 pb_120 xs_pb_80">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-lg-6">
                    <div class="wsus__faq_text">
                        <h3>{{__('user.Frequently asked questions')}}</h3>
                        <div class="accordion accordion-flush" id="accordionFlushExample">
                            @foreach ($faqs as $index=>$faq)
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="flush-heading{{ $faq->id }}">
                                    <button class="accordion-button {{ ++$index!=1? 'collapsed':'' }}" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#flush-collapse{{ $faq->id }}" aria-expanded="false"
                                        aria-controls="flush-collapse{{ $faq->id }}">
                                        {{ $index }}. {{ $faq->faqlangfrontend->question }}
                                    </button>
                                </h2>
                                <div id="flush-collapse{{ $faq->id }}" class="accordion-collapse collapse {{ $index==1 ? 'show':'' }}"
                                    aria-labelledby="flush-heading{{ $faq->id }}" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body">
                                        {!! clean($faq->faqlangfrontend->answer) !!}
                                    </div>
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="wsus__faq_form">
                        <h3>{{__('user.Have Asked Questions')}}?</h3>
                        <form action="{{ route('send-contact-message') }}" method="POST">
                            @csrf
                            <input type="text" name="name" value="{{ old('name') }}" placeholder="{{__('user.Name')}}">
                            <input type="email" name="email" value="{{ old('email') }}" placeholder="{{__('user.Email')}}">
                            <input type="text" name="phone" value="{{ old('phone') }}" placeholder="{{__('user.Phone')}}">
                            <input type="text" name="subject" value="{{ old('subject') }}" placeholder="{{__('user.Subject')}}">
                            <textarea rows="4" name="message" placeholder="{{__('user.Message')}}">{{ old('message') }}</textarea>
                            @if($recaptchaSetting->status==1)
                                <div class="col-xl-12">
                                    <div class="wsus__single_com mb_10">
                                        <div class="g-recaptcha" data-sitekey="{{ $recaptchaSetting->site_key }}"></div>
                                    </div>
                                </div>
                            @endif
                            <button type="submit" class="common_btn">{{__('user.Send Message')}}</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        FAQ END
    ==============================-->
@endsection
