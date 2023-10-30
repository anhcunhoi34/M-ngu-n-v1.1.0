@extends('layout')
@section('title')
    <title>{{ $seo_setting->seo_title }}</title>
    <meta name="title" content="{{ $seo_setting->seo_title }}">
    <meta name="description" content="{{ $seo_setting->seo_description }}">
@endsection
@section('frontend-content')
    @if ($intro_visibility)
    <!--=============================
        BANNER 2 START
    ==============================-->
    <section class="wsus__banner_2" style="background: url({{ asset($intro_section->content->home1_bg) }});">
        <div class="container">
            <div class="row">
                <div class="col-xl-10 col-md-10 m-auto">
                    <div class="wsus__banner_text_2 wow fadeInUp" data-wow-duration="1s">
                        <h1>{{ $intro_section->content->sliderlangfrontend->home1_title  }}</h1>
                        <form action="{{ route('products') }}" method="GET">
                            <input type="text" name="keyword" placeholder="{{__('user.Search your products')}}...">
                            <i class="far fa-search"></i>
                            <button class="common_btn" type="submit">{{__('user.Search')}}</button>
                        </form>
                        <ul class="wsus__banner_counter_2 d-flex flex-wrap justify-content-center mt_40">
                            <li>
                                <span class="counter">{{ $intro_section->content->total_product }}</span>
                                <span>{{__('user.k')}}+</span>
                                {{__('user.Prodcuts')}}
                            </li>
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
            </div>
        </div>
    </section>
    <!--=============================
        BANNER 2 END
    ==============================-->
    @endif

    @if ($category_visibility)
    <!--=============================
        CATEGORY 2 START
    ==============================-->
    <section class="wsus__categorie_2 pt_115 xs_pt_75">
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
    </section>
    <!--=============================
        CATEGORY 2 END
    ==============================-->
    @endif

    @if ($product_section->visibility)
    <!--=============================
        GALLERY START
    ==============================-->
    <section class="wsus__galley mt_120 xs_mt_80 pt_115 xs_pt_75 pb_120 xs_pb_80"
        style="background: url({{ asset('frontend/images/gallery_bg2.jpg') }});">
        <div class="container">
            <div class="row">
                <div class="col-xl-7 col-lg-8 m-auto">
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


    <!--=============================
        TRENDING THEME START
    ==============================-->
    @if ($trending_section->visibility)
    <section class="wsus__trending_theme pt_115 xs_pt_75">
        <div class="wsus__trending_theme_bg">
            <img src="{{ asset('frontend/images/trendy_theme_bg.jpg') }}" alt="bg" class="img-fluid w-100">
        </div>
        <div class="container">
            <div class="row">
                <div class="col-xl-7 col-lg-8">
                    <div class="wsus__section_heading heading_left  mb_50">
                        <h5>{{ $trending_section->title }}</h5>
                        <h2>{{ $trending_section->description }}</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-8 col-lg-7">
                    <div class="wsus__trending_theme_slider_area">
                        <div class="row trendy_slider">

                            @php
                                $loop_count = count($trending_section->trending_products) / 4;
                                $latest_index = 0;
                                $is_break = false;
                            @endphp

                            @for ($i = 0; $i<$loop_count; $i++)
                                @php
                                    $current_index = 1;
                                    $number_of_item = 1;
                                @endphp
                                <div class="col-12">
                                    <div class="row">

                                        @foreach ($trending_section->trending_products as $trending_index => $trending_product)
                                            @if ($latest_index <= $trending_index)
                                                @if ($number_of_item <= 4)
                                                    <div class="col-xl-6 col-md-6">
                                                        <div class="wsus__trending_theme_item">
                                                            <div class="wsus__trending_theme_item_img">
                                                                <img src="{{ asset($trending_product->thumbnail_image) }}" alt="img"
                                                                    class="img-fluid w-100">
                                                            </div>
                                                            <div class="wsus__trending_theme_item_text">
                                                                <a class="title" href="{{ route('product-detail', $trending_product->slug) }}">{{ html_decode($trending_product->productlangfrontend->name) }}</a>
                                                                <p><span>{{__('user.By')}}</span> {{ html_decode($trending_product->author->name) }}</p>
                                                                <ul class="d-flex flex-wrap justify-content-between align-items-center">
                                                                    @php
                                                                        $sale=App\Models\OrderItem::where(['product_id' => $trending_product->id])->get()->count();
                                                                    @endphp
                                                                    <li>
                                                                        <span><i class="far fa-download"></i> {{ $sale  }} {{__('user.Sale')}}</span>
                                                                    </li>
                                                                    <li><a href="{{ route('product-detail', $trending_product->slug) }}"><i class="far fa-shopping-cart"></i></a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    @php
                                                        $latest_index = $trending_index;
                                                    @endphp
                                                @endif

                                                @php
                                                    $number_of_item ++;
                                                @endphp
                                            @endif
                                        @endforeach
                                    </div>
                                </div>
                            @endfor
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-5">
                    <div class="wsus__trending_theme_single">
                        <div class="wsus__trending_theme_single_img">
                            <img src="{{ asset($trending_section->trending_offer_image) }}" alt="trendy theme" class="img-fluid w-100">
                        </div>
                        <div class="wsus__trending_theme_single_text">
                            <p>{{ $trending_section->trending_offer_title1 }}</p>
                            <a class="title" href="{{ $trending_section->trending_offer_link }}">{{ $trending_section->trending_offer_title2 }}</a>
                            <a class="common_btn" target="_blank" href="{{ $trending_section->trending_offer_link }}">{{__('user.Purchase Now')}}</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    @endif
    <!--=============================
        TRENDING THEME END
    ==============================-->

    @if ($counter_section->visibitliy)
    <!--=============================
        ABOUT COUNTER START
    ==============================-->
    <section class="wsus__about_counter pt_120 xs_pt_80">
        <div class="container">
            <div class="wsus__about_counter_bg">
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="wsus__single_counter">
                            <div class="icon">
                                <img src="{{ asset($counter_section->home1_icon1) }}" alt="counter" class="img-fluid w-100">
                            </div>
                            <h2 class="counter">{{ $counter_section->counter1_value }}</h2>
                            <p>{{ $counter_section->counter1_title }}</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="wsus__single_counter">
                            <div class="icon">
                                <img src="{{ asset($counter_section->home1_icon2) }}" alt="counter" class="img-fluid w-100">
                            </div>
                            <h2 class="counter">{{ $counter_section->counter2_value }}</h2>
                            <p>{{ $counter_section->counter2_title }}</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="wsus__single_counter">
                            <div class="icon">
                                <img src="{{ asset($counter_section->home1_icon3) }}" alt="counter" class="img-fluid w-100">
                            </div>
                            <h2 class="counter">{{ $counter_section->counter3_value }}</h2>
                            <p>{{ $counter_section->counter3_title }}</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="wsus__single_counter">
                            <div class="icon">
                                <img src="{{ asset($counter_section->home1_icon4) }}" alt="counter" class="img-fluid w-100">
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
        ABOUT COUNTER END
    ==============================-->
    @endIf

    @if ($featured_section->visibility)
    <!--=============================
        GALLERY 2 START
    ==============================-->
    <section class="wsus__galley_2 pt_115 xs_pt_25">
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

    @if ($template_section->visibility)
    <!--=============================
        TEMPLATE START
    ==============================-->
    <section class="wsus__template mt_120 xs_mt_70 pt_115 xs_pt_80 pb_120 xs_pb_80"
        style="background: url({{ asset('frontend/images/template_bg.jpg') }});">
        <div class="container">
            <div class="row">
                <div class="col-xl-7 col-lg-8 m-auto">
                    <div class="wsus__section_heading mb_25">
                        <h5>{{ $template_section->title }}</h5>
                        <h2>{{ $template_section->description }}</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                @foreach ($template_section->templates as $template)
                <div class="col-xl-3 col-md-6">
                    <div class="wsus__template_item">
                        <div class="icon">
                            <img src="{{ asset($template->image) }}" alt="template" class="img-fluid w-100">
                        </div>
                        <h4>{{ $template->templatelangfrontend->title }}</h4>
                        <p>{{ $template->templatelangfrontend->description }}</p>
                        <a target="__blank" href="{{ $template->link }}">{{__('user.Learn More')}} <i class="far fa-long-arrow-right"></i></a>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </section>
    <!--=============================
        TEMPLATE END
    ==============================-->
    @endif


    @if ($mobile_app->visibility)
    <!--=============================
        DOWNLOAD 2 START
    ==============================-->
    <section class="wsus__download_2 pt_120 xs_pt_80 pb_120 xs_pb_80">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-xl-5 col-md-5">
                    <div class="wsus__download_2_img">
                        <img src="{{ asset($mobile_app->home1_foreground) }}" alt="download" class="img-fluid w-100">
                    </div>
                </div>
                <div class="col-xl-6 col-md-7">
                    <div class="wsus__download_2_text">
                        <h2>{!! strip_tags(clean($mobile_app->title1),'<span>') !!}</h2>
                        <p>{{ $mobile_app->description }}</p>
                        <ul class="d-flex flex-wrap">
                            <li>
                                <a target="__blank" href="{{ $mobile_app->play_store_link }}">
                                    <img src="{{ asset('frontend/images/download_icon_3.jpg') }}" alt="download" class="img-fluid w-100">
                                </a>
                            </li>
                            <li>
                                <a target="__blank" href="{{ $mobile_app->apple_store_link }}">
                                    <img src="{{ asset('frontend/images/download_icon_4.jpg') }}" alt="download" class="img-fluid w-100">
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        DOWNLOAD 2 END
    ==============================-->
    @endif


    @if ($partner_section->visibility)
    <!--=============================
        CUSTOMER START
    ==============================-->
    <section class="wsus__customer pt_115 xs_pt_75 mb_120 xs_mb_80" style="background: url({{ asset('frontend/images/customer_bg.jpg') }});">
        <div class="container">
            <div class="row">
                <div class="col-xl-7 col-lg-8 m-auto">
                    <div class="wsus__section_heading mb_25">
                        <h5>{{ $partner_section->title }}</h5>
                        <h2>{{ $partner_section->description }}</h2>
                    </div>
                </div>
            </div>

            <div class="row justify-content-center">
                @foreach ($partner_section->partners as $partner)
                <div class="col-xxl-2 col-sm-6 col-lg-3">
                    <div class="wsus__customer_logo">
                        <a href="{{ $partner->link }}" target="__blank">
                            <img src="{{ asset($partner->logo) }}" alt="brand" class="img-fluid w-100">
                        </a>
                    </div>
                </div>
                @endforeach
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="wsus__go_offer" style="background: url(https://i.ibb.co/pWN05Bf/subs-bg.jpg);">
                        <p>{!! strip_tags(clean($partner_section->offer_title1),'<span>') !!}</p>
                        <span class="support">Lifetime update and 6 months support.</span>
                        <a class="common_btn" href="{{ $partner_section->offer_link }}" target="__blank">{{__('user.Go to Offer page')}}</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        CUSTOMER END
    ==============================-->
    @endif


    @if ($home1_blog_section->visibility)
    <!--=============================
        BLOG START
    ==============================-->
    <section class="wsus__blog pt_115 xs_pt_75 pb_120 xs_pb_80">
        <div class="container">
            <div class="row">
                <div class="col-xl-7 m-auto">
                    <div class="wsus__section_heading mb_20">
                        <h5>{{ $home1_blog_section->title }}</h5>
                        <h2>{{ $home1_blog_section->description }}</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                @foreach ($home1_blog_section->blogs as $blog)
                <div class="col-xl-4 col-md-6">
                    <div class="wsus__blog_3">
                        <div class="wsus__blog_3_img">
                            <img src="{{ asset($blog->image) }}" alt="blog" class="img-fluid w-100">
                        </div>
                        <div class="wsus__blog_3_text">
                            <a class="categori" href="javascript:;">{{ \Carbon\Carbon::parse($blog->created_at)->format('d M') }}</a>
                            <a class="title" href="{{ route('blog', $blog->slug) }}">{{ $blog->bloglanguagefrontend->title }}</a>
                            <p class="description">{{ $blog->bloglanguagefrontend->short_description }}</p>
                            <ul>
                                <li>
                                    <div class="img">
                                        <img src="{{ asset($blog->admin->image) }}" alt="author" class="img-fluid w-100">
                                    </div>
                                    <p><span>{{__('user.By')}}</span> {{ $blog->admin->name }} </p>
                                </li>

                                <li><a href="{{ route('blog', $blog->slug) }}">{{__('user.Read More')}}</a></li>
                                
                            </ul>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </section>
    <!--=============================
        BLOG END
    ==============================-->
    @endif

@endsection
