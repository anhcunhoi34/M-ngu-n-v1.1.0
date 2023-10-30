@extends($active_theme)

@section('title')
    <title>{{__('user.Become author')}}</title>
@endsection

@section('frontend-content')
    <!--=============================
        BECOME AN AUTHOR START
    ==============================-->
    <section class="wsus__become_author pt_130 xs_pt_100 pb_120 xs_pb_80">

        <div class="wsus__become_author_header pt_100 pb_100" style="background: url({{ asset($become_author->bg_image) }});">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-xxl-6 col-xl-6 col-md-7">
                        <div class="wsus__become_author_text">
                            <h2>{{ $become_author->becomelangfrontend->title }}</h2>
                            <a href="{{ route('register') }}" class="common_btn">{{__('user.Become an Author')}}</a>
                        </div>
                    </div>
                    <div class="col-xxl-4 col-xl-5 col-md-5">
                        <div class="wsus__become_author_img">
                            <img src="{{ asset($become_author->image1) }}" alt="author" class="img-fluid w-100">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="wsus__author_category mt_95 xs_mt_55">
            <div class="container">
                <div class="row">
                    <div class="col-xl-3 col-sm-6 col-lg-4">
                        <div class="wsus__author_category_item">
                            <div class="img">
                                <img src="{{ asset($become_author->icon1) }}" alt="icon" class="img-fluid w-100">
                            </div>
                            <h4>{{ $become_author->becomelangfrontend->item1 }}</h4>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 col-lg-4">
                        <div class="wsus__author_category_item">
                            <div class="img">
                                <img src="{{ asset($become_author->icon2) }}" alt="icon" class="img-fluid w-100">
                            </div>
                            <h4>{{ $become_author->becomelangfrontend->item2 }}</h4>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 col-lg-4">
                        <div class="wsus__author_category_item">
                            <div class="img">
                                <img src="{{ asset($become_author->icon3) }}" alt="icon" class="img-fluid w-100">
                            </div>
                            <h4>{{ $become_author->becomelangfrontend->item3 }}</h4>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 col-lg-4">
                        <div class="wsus__author_category_item">
                            <div class="img">
                                <img src="{{ asset($become_author->icon4) }}" alt="icon" class="img-fluid w-100">
                            </div>
                            <h4>{{ $become_author->becomelangfrontend->item4 }}</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="wsus__about_us mt_115 xs_mt_75 pb_120 xs_pb_80">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-xl-6 col-lg-6">
                        <div class="wsus__about_us_text">
                            <h5>{{ $become_author->becomelangfrontend->header1 }}</h5>
                            <h2>{{ $become_author->becomelangfrontend->header2 }}</h2>
                            {!! clean($become_author->becomelangfrontend->description) !!}
                            <div class="wsus__about_text_img d-flex flex-wrap align-items-center">
                                <div class="img">
                                    <img src="{{ asset('frontend/images/about_text_img.png') }}" alt="about" class="img-fluid w-100">
                                </div>
                                <div class="text">
                                    <h3>{{ $become_author->becomelangfrontend->name }}</h3>
                                    <p>{{ $become_author->becomelangfrontend->desgination }}</p>
                                </div>
                                <div class="signature">
                                    <img src="{{ asset($become_author->signature) }}" alt="about" class="img-fluid w-100">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6">
                        <div class="wsus__about_us_img">
                            <img src="{{ asset($become_author->image2) }}" alt="about us" class="img-fluid w-100">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        @if ($our_teem_section->visibility)
            <div class="wsus__team pt_115 xs_pt_75 pb_120 xs_pb_80">
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
                </div>
            </div>
        @endif

        @if ($category_section->visibility)
        <div class="wsus__categorie_area_2 pt_115 xs_pt_75">
            <div class="container">
                <div class="row">
                    <div class="col-xl-7 col-lg-8 m-auto">
                        <div class="wsus__section_heading mb_50">
                            <h5>{{ $category_section->title }}</h5>
                            <h2>{{ $category_section->description }}</h2>
                        </div>
                    </div>
                </div>
                <div class="row category_slider_2">
                    @foreach ($category_section->categories as $key=>$category)
                    <div class="col-xl-3">
                        <div class="wsus__categories_item_2">
                            <div class="icon">
                                <img src="{{ asset($category->icon) }}" alt="category" class="img-fluid w-100">
                            </div>
                            <h3><a href="{{ route('products', ['category' => $category->slug]) }}">{{ $category->catlangfrontend->name }}</a></h3>
                            @php
                                $product = App\Models\Product::where('category_id', $category->id)->get();
                            @endphp
                            <p>{{ $product->count() }} {{__('user.Items')}}</p>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
        @endif

    </section>
    <!--=============================
        BECOME AN AUTHOR END
    ==============================-->
@endsection
