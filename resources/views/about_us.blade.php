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
                        <h1>{{__('user.About Us')}}</h1>
                        <ul class="d-flex flex-wrap">
                            <li><a href="{{ route('home') }}">{{__('user.Home')}}</a></li>
                            <li><a href="javascript:;">{{__('user.About Us')}}</a></li>
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
        ABOUT US START
    ==============================-->
    <section class="wsus__about_us mt_115 xs_mt_75 pb_120 xs_pb_80">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-xl-6 col-lg-6">
                    <div class="wsus__about_us_text">
                        <h5>{{ $about_us->aboutlangfrontend->title }}</h5>
                        <h2>{{ $about_us->aboutlangfrontend->header1 }} <b>{{ $about_us->aboutlangfrontend->header2 }}</b> {{ $about_us->aboutlangfrontend->header3 }}</h2>
                        {!! clean($about_us->aboutlangfrontend->about_us ) !!}
                        <div class="wsus__about_text_img d-flex flex-wrap align-items-center">
                            <div class="img">
                                <img src="{{ asset($about_us->image) }}" alt="about" class="img-fluid w-100">
                            </div>
                            <div class="text">
                                <h3>{{ $about_us->aboutlangfrontend->name }}</h3>
                                <p>{{ $about_us->aboutlangfrontend->desgination }}</p>
                            </div>
                            <div class="signature">
                                <img src="{{ asset($about_us->signature) }}" alt="about" class="img-fluid w-100">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-6">
                    <div class="wsus__about_us_img">
                        <img src="{{ asset($about_us->banner_image) }}" alt="about us" class="img-fluid w-100">
                    </div>
                </div>
            </div>
        </div>
    </section>

    @if ($our_teem_section->visibility)
    <section class="wsus__team pt_115 xs_pt_75 mb_120">
        <div class="container">
            <div class="row">
                <div class="col-xl-7 m-auto">
                    <div class="wsus__section_heading mb_20">
                        <h5>{{ $our_teem_section->title }}</h5>
                        <h2>{{ $our_teem_section->description }}</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                @foreach ($our_teem_section->our_teems as $our_team)
                <div class="col-xl-3 col-sm-6 col-lg-4">
                    <div class="wsus__single_team">
                        <img src="{{ asset($our_team->image) }}" alt="team" class="img-fluid w-100">
                        <div class="wsus__single_team_text">
                            <div class="img">
                                <img src="{{ asset($our_team->image) }}" alt="team" class="img-fluid w-100">
                            </div>
                            <h3>{{ $our_team->teamlangfrontend->name }}</h3>
                            <p>{{ $our_team->teamlangfrontend->designation }}</p>
                            <ul>
                                <li><a href="{{ $our_team->facebook }}"><i class="fab fa-facebook-f"></i></a></li>
                                <li><a href="{{ $our_team->linkedin }}"><i class="fab fa-linkedin-in"></i></a></li>
                                <li><a href="{{ $our_team->twitter }}"><i class="fab fa-twitter"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
            <div class="wsus__purchase" style="background: url({{ asset($our_teem_section->offer_background) }});">
                <h3> {!! strip_tags(clean($our_teem_section->offer_title1),'<span>') !!}</h3>
                <p>{{ $our_teem_section->offer_title3 }}</p>
                <a target="_blank" href="{{ $our_teem_section->offer_link }}">{{__('user.Purchase Here')}}</a>
            </div>
        </div>
    </section>
    @endif


    @if ($testimonial_section->visibility)
    <section class="wsus__testimonial about_testimonial pt_110 xs_pt_20 pb_120 xs_pb_80">
        <div class="container">
            <div class="row">
                <div class="col-xl-7 m-auto">
                    <div class="wsus__section_heading mb_15">
                        <h5>{{ $testimonial_section->title }}</h5>
                        <h2>{{ $testimonial_section->description }}</h2>
                    </div>
                </div>
            </div>
            <div class="row testi_slider">
                @foreach ($testimonial_section->testimonials as $testimonial)
                <div class="col-xl-6">
                    <div class="wsus__testimonial_item">
                        <p class="description">{{ $testimonial->testimoniallangfrontend->comment }}</p>
                        <p class="rating">
                            @for ($i = 1; $i <= 5; $i++)
                                @if ($i <= $testimonial->rating)
                                <i class="fas fa-star"></i>
                                @else
                                <i class="far fa-star"></i>
                                @endif
                            @endfor
                        </p>
                        <div class="wsus__testimonial_footer d-flex flex-wrap">
                            <div class="img">
                                <img src="{{ asset($testimonial->image) }}" alt="testimonial" class="img-fluid w-100">
                            </div>
                            <div class="text">
                                <h4>{{ $testimonial->testimoniallangfrontend->name }}</h4>
                                <p>{{ $testimonial->testimoniallangfrontend->designation }}</p>
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </section>
    @endif

    @if ($why_choose_us->visibility)
    <section class="wsus__why_choose_2 pt_115 xs_pt_75 pb_115 xs_pb_75">
        <div class="container">
            <div class="row">
                <div class="col-xl-7 m-auto">
                    <div class="wsus__section_heading mb_15">
                        <h5>{{ $why_choose_us->title1 }}</h5>
                        <h2>{{ $why_choose_us->title2 }}</h2>
                    </div>
                </div>
            </div>
            <div class="row justify-content-between">
                <div class="col-lg-4 col-md-6">
                    <div class="wsus__why_choose_item">
                        <div class="img">
                            <img src="{{ asset($why_choose_us->item_icon1) }}" alt="why choose" class="img-fluid w-100">
                        </div>
                        <h4>{{ $why_choose_us->item_title1 }}</h4>
                        <p>{{ $why_choose_us->item_description1 }}</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="wsus__why_choose_item center">
                        <div class="img">
                            <img src="{{ asset($why_choose_us->item_icon2) }}" alt="why choose" class="img-fluid w-100">
                        </div>
                        <h4>{{ $why_choose_us->item_title2 }}</h4>
                        <p>{{ $why_choose_us->item_description2 }}</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="wsus__why_choose_item last">
                        <div class="img">
                            <img src="{{ asset($why_choose_us->item_icon3) }}" alt="why choose" class="img-fluid w-100">
                        </div>
                        <h4>{{ $why_choose_us->item_title3 }}</h4>
                        <p>{{ $why_choose_us->item_description3 }}</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    @endif
    <!--=============================
        ABOUT US END
    ==============================-->
@endsection
