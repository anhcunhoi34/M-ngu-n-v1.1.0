
@extends('layout2')
@section('title')
    <title>{{ $seo_setting->seo_title }}</title>
    <meta name="title" content="{{ $seo_setting->seo_title }}">
    <meta name="description" content="{{ $seo_setting->seo_description }}">
@endsection
@section('frontend-content')
    @if ($intro_visibility)
    <!--=============================
        BANNER START
    ==============================-->
    <section class="wsus__banner" style="background: url({{ asset('frontend/images/banner_bg.jpg') }});">
        <div class="container">
            <div class="row">
                <div class="col-xxl-6 col-sm-12 col-lg-7">
                    <div class="wsus__banner_text">
                        <h1>{{ $intro_section->content->sliderlangfrontend->home2_title }}</h1>
                        <P>{{ $intro_section->content->sliderlangfrontend->home2_description }}</P>
                        <form action="{{ route('products') }}" method="GET">
                            <select class="select_js" name="category">
                                <option value="">{{__('user.All Categories')}}</option>
                                @foreach ($intro_section->categories as $category)
                                <option value="{{ $category->slug }}">{{ $category->catlangfrontend->name }}</option>
                                @endforeach
                            </select>
                            <input type="text" name="keyword" placeholder="{{__('user.Search your products')}}...">
                            <button class="common_btn" type="submit"><i class="far fa-search"></i> {{__('user.Search')}}</button>
                        </form>
                        <ul class="wsus__banner_counter d-flex flex-wrap">
                            <li>
                                <span class="counter">{{ $intro_section->content->total_user }}</span>
                                <span>{{__('user.k')}}+</span>
                                {{__('user.Users')}}
                            </li>
                            <li>
                                <span class="counter">{{ $intro_section->content->total_sold }}</span>
                                <span>+</span>
                                {{__('user.Million Sells')}}
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-xxl-5 col-sm-12 col-lg-5">
                    <div class="wsus__banner_img">
                        <img src="{{ asset('frontend/images/banner_img.png') }}" alt="banner" class="img-fluid w-100">
                        <p>
                            <span>{{ $intro_section->content->total_product }}{{__('user.k')}}+</span>
                            {{__('user.Prodcuts')}}
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        BANNER END
    ==============================-->
    @endif

    @if ($category_visibility)
    <!--=============================
        CATEGORIES START
    ==============================-->
    <section class="wsus__categories pb_175 xs_pb_0">
        <div class="container">
            <div class="wsus__categorie_area">
                <div class="row category_slider">
                    @foreach ($category_section->categories as $key=>$category)
                    <div class="col-xl-3">
                        <div class="wsus__categories_item">
                            <div class="icon">
                                <img src="{{ asset($category->icon) }}" alt="category" class="img-fluid w-100">
                            </div>
                            <h3>{{ $category->catlangfrontend->name }}</h3>
                            <a class="view_all" href="{{ route('products', ['category' => $category->slug]) }}">{{__('user.View All')}} <i class="far fa-long-arrow-right"></i></a>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        CATEGORIES END
    ==============================-->
    @endif


    @if ($product_section->visibility)
    <!--=============================
        GALLERY START
    ==============================-->
    <section class="wsus__galley pt_115 xs_pt_75">
        <div class="container">
            <div class="row">
                <div class="col-xl-7 col-lg-9 m-auto">
                    <div class="wsus__section_heading mb_35">
                        <h5>{{ $product_section->title }}</h5>
                        <h2>{{ $product_section->description }}</h2>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xl-7 m-auto">
                    <div class="gallery_filter d-flex flex-wrap mb_5">
                        <button class=" active" data-filter="*">{{__('user.All Categories')}}</button>
                        @foreach ($product_section->categories as $category)
                        <button data-filter=".{{ $category->id }}">{{ $category->catlangfrontend->name }}</button>
                        @endforeach
                    </div>
                </div>
            </div>

            <div class="row grid">
                @foreach ($product_section->products as $product)
                <div class="col-xl-4 col-md-6 {{ $product->category->id }}">
                    <div class="wsus__gallery_item">
                        <div class="wsus__gallery_item_img">
                            <img src="{{ asset($product->thumbnail_image) }}" alt="gallery" class="img-fluid w-100">
                            <ul class="wsus__gallery_item_overlay">
                                <li><a target="_blank" href="{{ $product->preview_link }}">{{__('user.Preview')}}</a></li>
                                <li><a href="{{ route('product-detail', $product->slug) }}">{{__('user.Buy Now')}}</a></li>
                            </ul>
                        </div>
                        <div class="wsus__gallery_item_text">
                            <p class="price">
                                @if (session()->get('currency_position') == 'right')
                                    {{ html_decode($product->regular_price * session()->get('currency_rate')) }}{{ session()->get('currency_icon') }}
                                @else
                                    {{ session()->get('currency_icon') }}{{ html_decode($product->regular_price * session()->get('currency_rate')) }}
                                @endif
                            </p>
                            <a class="title" href="{{ route('product-detail', $product->slug) }}">{{ html_decode($product->productlangfrontend->name) }}</a>
                            <p class="category">{{__('user.By')}} <span>{{ html_decode($product->author->name) }}</span> {{__('user.In')}} <a class="category"
                                    href="{{ route('products', ['category' => $product->category->slug]) }}">{{ $product->category->catlangfrontend->name }}</a></p>
                            <ul class="d-flex flex-wrap justify-content-between">
                                @php
                                    $review=App\Models\Review::where(['product_id' => $product->id, 'status' => 1])->get()->average('rating');
                                    $sale=App\Models\OrderItem::where(['product_id' => $product->id])->get()->count();
                                @endphp
                                <li>
                                    <p>
                                        @for ($i = 1; $i <= 5; $i++)
                                            @if ($i <= $review)
                                            <i class="fas fa-star"></i>
                                            @else
                                            <i class="far fa-star"></i>
                                            @endif
                                        @endfor
                                        <span>({{ $review == 0 ? 0 : $review }})</span>
                                    </p>
                                </li>
                                <li>
                                    <span class="download"><i class="far fa-download"></i> {{ $sale }} {{__('user.Sale')}}</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </section>
    <!--=============================
        GALLERY END
    ==============================-->
   @endif


   @if ($counter_section->visibitliy)
    <!--=============================
        COUNTER START
    ==============================-->
    <section class="wsus__counter mt_120 xs_mt_80" style="background: url({{ asset($counter_section->counter_home2_background) }});">
        <div class="wsus__counter_overlay pt_90 pb_85 xs_pb_35">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="wsus__single_counter">
                            <div class="icon">
                                <img src="{{ asset($counter_section->home2_icon1) }}" alt="counter" class="img-fluid w-100">
                            </div>
                            <h2 class="counter">{{ $counter_section->counter1_value }}</h2>
                            <p>{{ $counter_section->counter1_title }}</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="wsus__single_counter">
                            <div class="icon">
                                <img src="{{ asset($counter_section->home2_icon2) }}" alt="counter" class="img-fluid w-100">
                            </div>
                            <h2 class="counter">{{ $counter_section->counter2_value }}</h2>
                            <p>{{ $counter_section->counter2_title }}</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="wsus__single_counter">
                            <div class="icon">
                                <img src="{{ asset($counter_section->home2_icon3) }}" alt="counter" class="img-fluid w-100">
                            </div>
                            <h2 class="counter">{{ $counter_section->counter3_value }}</h2>
                            <p>{{ $counter_section->counter3_title }}</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="wsus__single_counter">
                            <div class="icon">
                                <img src="{{ asset($counter_section->home2_icon4) }}" alt="counter" class="img-fluid w-100">
                            </div>
                            <h2 class="counter">{{ $counter_section->counter4_value }}</h2>
                            <p>{{ $counter_section->counter4_title }}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        COUNTER END
    ==============================-->
    @endif


    @if ($popular_trending->visibility)
    <!--=============================
        RECENT PRODUCT START
    ==============================-->
    <section class="wsus__recent_product wsus__recent_product_2  pt_115 xs_pt_75">
        <div class="container">
            <div class="row">
                <div class="col-xl-7 col-lg-6">
                    <div class="wsus__section_heading heading_left mb_5">
                        <h5>{{ $popular_trending->title }}</h5>
                        <h2>{{ $popular_trending->description }}</h2>
                    </div>
                </div>
                <div class="col-xl-5 col-lg-6">
                    <div class="wsus__recent_product_filter d-flex flex-wrap">
                        <ul class="nav nav-pills" id="pills-tab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill"
                                    data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home"
                                    aria-selected="true"> <i class="far fa-bars"></i> {{__('user.New Items')}}</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill"
                                    data-bs-target="#pills-profile" type="button" role="tab"
                                    aria-controls="pills-profile" aria-selected="false"><i class="fas fa-bolt"></i>
                                    {{__('user.Tranding')}}</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill"
                                    data-bs-target="#pills-contact" type="button" role="tab"
                                    aria-controls="pills-contact" aria-selected="false"><i class="fas fa-magic"></i>
                                    {{__('user.Popular')}}</button>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row mt_15">
                <div class="col-12">
                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel"
                            aria-labelledby="pills-home-tab" tabindex="0">
                            <div class="row">
                                @foreach ($popular_trending->new_products as $new_product)
                                <div class="col-xl-4 col-md-6 col-lg-4">
                                    <div class="wsus__recent_product_2_item">
                                        <div class="img">
                                            <img src="{{ asset($new_product->product_icon) }}" alt="product" class="img-fluid w-100">
                                        </div>
                                        <div class="text">
                                            <a href="{{ route('product-detail', $new_product->slug) }}">{{ $new_product->productlangfrontend->name }}</a>
                                            <p>
                                                @if (session()->get('currency_position') == 'right')
                                                    {{ $new_product->regular_price * session()->get('currency_rate') }}{{ session()->get('currency_icon') }}
                                                @else
                                                    {{ session()->get('currency_icon') }}{{ $new_product->regular_price * session()->get('currency_rate') }}
                                                @endif
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                @endforeach
                            </div>
                        </div>
                        <div class="tab-pane fade" id="pills-profile" role="tabpanel"
                            aria-labelledby="pills-profile-tab" tabindex="0">

                            <div class="row">
                                @foreach ($popular_trending->trending_products as $trending_product)
                                <div class="col-xl-4 col-md-6 col-lg-4">
                                    <div class="wsus__recent_product_2_item">
                                        <div class="img">
                                            <img src="{{ asset($trending_product->product_icon) }}" alt="product" class="img-fluid w-100">
                                        </div>
                                        <div class="text">
                                            <a href="{{ route('product-detail', $trending_product->slug) }}">{{ $trending_product->productlangfrontend->name }}</a>
                                            <p>
                                                @if (session()->get('currency_position') == 'right')
                                                    {{ $trending_product->regular_price * session()->get('currency_rate') }}{{ session()->get('currency_icon') }}
                                                @else
                                                    {{ session()->get('currency_icon') }}{{ $trending_product->regular_price * session()->get('currency_rate') }}
                                                @endif
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                @endforeach
                            </div>

                        </div>
                        <div class="tab-pane fade" id="pills-contact" role="tabpanel"
                            aria-labelledby="pills-contact-tab" tabindex="0">
                            <div class="row">
                                @foreach ($popular_trending->popular_products as $popular_product)
                                <div class="col-xl-4 col-md-6 col-lg-4">
                                    <div class="wsus__recent_product_2_item">
                                        <div class="img">
                                            <img src="{{ asset($popular_product->product_icon) }}" alt="product" class="img-fluid w-100">
                                        </div>
                                        <div class="text">
                                            <a href="{{ route('product-detail', $popular_product->slug) }}">{{ $popular_product->productlangfrontend->name }}</a>
                                            <p>
                                                @if (session()->get('currency_position') == 'right')
                                                    {{ $popular_product->regular_price * session()->get('currency_rate') }}{{ session()->get('currency_icon') }}
                                                @else
                                                    {{ session()->get('currency_icon') }}{{ $popular_product->regular_price * session()->get('currency_rate') }}
                                                @endif
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        RECENT PRODUCT END
    ==============================-->
    @endif


    @if ($featured_section->visibility)
    <!--=============================
        GALLERY 2 START
    ==============================-->
    <section class="wsus__galley_2 mt_120 xs_mt_80 pt_115 xs_pt_75 pb_120 xs_pb_80"
        style="background: url({{ asset('frontend/images/gallery_bg.jpg') }});">
        <div class="container">
            <div class="row">
                <div class="col-xl-7 col-lg-8">
                    <div class="wsus__section_heading mb_15">
                        <h5>{{ $featured_section->title }}</h5>
                        <h2>{{ $featured_section->description }}</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                @foreach ($featured_section->products as $product)
                <div class="col-xl-4 col-md-6">
                    <div class="wsus__gallery_item">
                        <div class="wsus__gallery_item_img">
                            <img src="{{ asset($product->thumbnail_image) }}" alt="gallery" class="img-fluid w-100">
                            <ul class="wsus__gallery_item_overlay">
                                <li><a target="__blank" href="{{ $product->preview_link }}">{{__('user.Preview')}}</a></li>
                                <li><a href="{{ route('product-detail', $product->slug) }}">{{__('user.Buy Now')}}</a></li>
                            </ul>
                        </div>
                        <div class="wsus__gallery_item_text">
                            @php
                                $review=App\Models\Review::where(['product_id' => $product->id, 'status' => 1])->get()->average('rating');
                                $sale=App\Models\OrderItem::where(['product_id' => $product->id])->get()->count();
                            @endphp

                            <a class="title" href="{{ route('product-detail', $product->slug) }}">{{ html_decode($product->productlangfrontend->name) }}</a>

                            <p class="category">{{__('user.By')}} <span>{{ html_decode($product->author->name) }}</span> {{__('user.In')}} <a class="category"
                                    href="{{ route('products', ['category' => $product->category->slug]) }}">{{ $product->category->catlangfrontend->name }}</a></p>
                            
                            <p class="rating">
                                @for ($i = 1; $i <= 5; $i++)
                                    @if ($i <= $review)
                                    <i class="fas fa-star"></i>
                                    @else
                                    <i class="far fa-star"></i>
                                    @endif
                                @endfor
                                <span>({{ $review == 0 ? 0 : $review }})</span>
                            </p>
                            <p class="price">
                                @if (session()->get('currency_position') == 'right')
                                    {{ html_decode($product->regular_price * session()->get('currency_rate')) }}{{ session()->get('currency_icon') }}
                                @else
                                    {{ session()->get('currency_icon') }}{{ html_decode($product->regular_price * session()->get('currency_rate')) }}
                                @endif
                            </p>
                            
                            <div class="like_and_sell">
                                <span class="download"><i class="fas fa-arrow-to-bottom"></i>{{ $sale }} {{__('user.Sale')}}</span>
                            </div>
                            
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
            <a href="{{ route('products', ['featured' => 1]) }}" class="common_btn">{{__('user.View All')}} <i class="far fa-long-arrow-right"></i></a>
        </div>
    </section>
    <!--=============================
        GALLERY 2 END
    ==============================-->
    @endif


    @if ($why_choose_us->visibility)
    <!--=============================
        WHU CHOOSE START
    ==============================-->
    <section class="wsus__why_choose pt_115 xs_pt_75 pb_120 xs_pb_80"
        style="background: url({{ asset($why_choose_us->background_image) }});">
        <div class="container">
            <div class="row">
                <div class="col-xl-7 m-auto">
                    <div class="wsus__section_heading mb_25">
                        <h5>{{ $why_choose_us->title1 }}</h5>
                        <h2>{{ $why_choose_us->title2 }}</h2>
                    </div>
                </div>
            </div>
            <div class="row justify-content-between">
                <div class="col-xl-3 col-md-4">
                    <div class="wsus__why_choose_item">
                        <div class="img">
                            <img src="{{ asset($why_choose_us->icon1) }}" alt="why choose" class="img-fluid w-100">
                        </div>
                        <h4>{{ $why_choose_us->item_title1 }}</h4>
                    </div>
                </div>
                <div class="col-xl-3 col-md-4">
                    <div class="wsus__why_choose_item center">
                        <div class="img">
                            <img src="{{ asset($why_choose_us->icon2) }}" alt="why choose" class="img-fluid w-100">
                        </div>
                        <h4>{{ $why_choose_us->item_title2 }}</h4>
                    </div>
                </div>
                <div class="col-xl-3 col-md-4">
                    <div class="wsus__why_choose_item last">
                        <div class="img">
                            <img src="{{ asset($why_choose_us->icon3) }}" alt="why choose" class="img-fluid w-100">
                        </div>
                        <h4>{{ $why_choose_us->item_title3 }}</h4>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=============================
       WHU CHOOSE END
    ==============================-->
    @endif


    @if ($testimonial_section->visibility)
    <!--=============================
        TESTIMOMNIAL START
    ==============================-->
    <section class="wsus__testimonial pt_115 xs_pt_75 pb_120 xs_pb_80">
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
                        <p class="rating">
                            @for ($i = 1; $i <= 5; $i++)
                                @if ($i <= $testimonial->rating)
                                <i class="fas fa-star"></i>
                                @else
                                <i class="far fa-star"></i>
                                @endif
                            @endfor
                        </p>
                        <p class="description">{{ $testimonial->testimoniallangfrontend->comment }}</p>
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
    <!--=============================
        TESTIMOMNIAL END
    ==============================-->
    @endif


    @if ($mobile_app->visibility)
    <!--=============================
        DOWNLOAD START
    ==============================-->
    <section class="wsus__download pt_110 xs_pt_70" style="background: url({{ asset($mobile_app->home2_background) }});">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-xl-6 col-lg-7">
                    <div class="wsus__download_text">
                        <h2>{{ $mobile_app->home2_title }}</h2>
                        <p>{{ $mobile_app->home2_description }}</p>
                        <ul class="d-flex flex-wrap">
                            <li>
                                <a target="_blank" href="{{ $mobile_app->play_store_link }}">
                                    <img src="{{ asset('frontend/images/download_icon_2.png') }}" alt="Play store">
                                </a>
                            </li>
                            <li>
                                <a target="_blank" href="{{ $mobile_app->apple_store_link }}">
                                    <img src="{{ asset('frontend/images/download_icon_1.png') }}" alt="Apple store">
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-xl-5 col-lg-5">
                    <div class="wsus__download_img">
                        <img src="{{ asset($mobile_app->home2_foreground) }}" alt="download" class="img-fluid w-100">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        DOWNLOAD END
    ==============================-->
    @endif


    @if ($home2_blog_section->visibility)
    <!--=============================
        BLOG START
    ==============================-->
    <section class="wsus__blog pt_115 xs_pt_75 pb_120 xs_pb_80">
        <div class="container">
            <div class="row">
                <div class="col-xl-7 m-auto">
                    <div class="wsus__section_heading mb_20">
                        <h5>{{ $home2_blog_section->title }}</h5>
                        <h2>{{ $home2_blog_section->description }}</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                @if ($home2_blog_section->blog)
                <div class="col-xl-6 col-md-12 col-lg-6">
                    <div class="wsus__blog_1">
                        <div class="wsus__blog_1_img">
                            <img src="{{ asset($home2_blog_section->blog->image) }}" alt="blog" class="img-fluid w-100">
                        </div>
                        <div class="wsus__blog_1_text">
                            <ul class="d-flex flex-wrap">
                                <li>
                                    <i class="far fa-user"></i>
                                    {{__('user.By')}} {{ $home2_blog_section->blog->admin->name }}
                                </li>
                                <li>
                                    <i class="far fa-calendar-alt"></i>
                                    {{ \Carbon\Carbon::parse($home2_blog_section->blog->created_at)->format('d M Y') }}
                                </li>
                            </ul>
                            <a href="{{ route('blog', $home2_blog_section->blog->slug) }}">{{ $home2_blog_section->blog->bloglanguagefrontend->title }}</a>
                        </div>
                    </div>
                </div>
                @endif
                <div class="col-xl-6 col-md-12 col-lg-6">
                    @foreach ($home2_blog_section->blogs as $blog)
                    <div class="wsus__blog_2">
                        <div class="row">
                            <div class="col-xl-5 col-md-6">
                                <div class="wsus__blog_2_img">
                                    <img src="{{ asset($blog->image) }}" alt="blog" class="img-fluid w-100">
                                </div>
                            </div>
                            <div class="col-xl-7 col-md-6">
                                <div class="wsus__blog_2_text">
                                    <a href="{{ route('blog', $blog->slug) }}">{{ $blog->bloglanguagefrontend->title }}</a>
                                    <ul class="d-flex flex-wrap">
                                        <li>
                                            <i class="far fa-user"></i>
                                            {{__('user.By')}} {{ $blog->admin->name }}
                                        </li>
                                        <li>
                                            <i class="far fa-calendar-alt"></i>
                                            {{ \Carbon\Carbon::parse($blog->created_at)->format('d M Y') }}
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div> 
                    @endforeach
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        BLOG END
    ==============================-->
    @endif
@endsection
