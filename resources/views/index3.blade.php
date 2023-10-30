
@extends('layout3')
@section('title')
    <title>{{ $seo_setting->seo_title }}</title>
    <meta name="title" content="{{ $seo_setting->seo_title }}">
    <meta name="description" content="{{ $seo_setting->seo_description }}">
@endsection
@section('frontend-content')
    @if ($intro_visibility)
    <!--=============================
        BANNER 3 START
    ==============================-->
    <section class="wsus__banner_3 wsus__banner" style="background: url({{ asset($intro_section->content->home3_bg) }});">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <div class="wsus__banner_text_3 wsus__banner_text">
                        <h4>{{ $intro_section->content->sliderlangfrontend->home3_title  }}</h4>
                        <h1>{{ $intro_section->content->sliderlangfrontend->home3_description  }}</h1>
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
                <div class="col-lg-5">
                    <div class="wsus__banner_img">
                        <img src="{{ asset($intro_section->content->home3_image) }}" alt="banner" class="img-fluid w-100">
                    </div>
                </div>
            </div>
            @if ($category_visibility)
            <div class="row category_3_slider mt_45">
                @foreach ($category_section->categories as $key=>$category)
                <div class="col-xl-2">
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
            @endif
        </div>
    </section>
    <!--=============================
        BANNER 3 END
    ==============================-->
    @endif

    <div class="new_bg_area" style="background: url({{ asset('frontend/images/new_bg.jpg') }});">

        @if ($new_product_section->visibility)
        <!--=============================
            NEW PRODUCT START
        ==============================-->
        <section class="wsus__new_product pt_115 xs_pt_75">
            <div class="container">
                <div class="row">
                    <div class="col-xl-7 col-lg-6">
                        <div class="wsus__section_heading heading_left mb_15">
                            <h5>{{ $new_product_section->title }}</h5>
                            <h2>{{ $new_product_section->description }}</h2>
                        </div>
                    </div>
                </div>
                <div class="wsus__new_product_area">
                    <div class="row justify-content-between">
                        @foreach ($new_product_section->new_products as $product)
                        <div class="col-xl-4 col-md-6 col-lg-4">
                            <div class="wsus__recent_product_2_item">
                                <div class="img">
                                    <img src="{{ asset($product->product_icon) }}" alt="product" class="img-fluid w-100">
                                </div>
                                <div class="text">
                                    <a href="{{ route('product-detail', $product->slug) }}">{{ $product->productlangfrontend->name }}</a>
                                    <p>
                                        @if (session()->get('currency_position') == 'right')
                                            {{ $product->regular_price * session()->get('currency_rate') }}{{ session()->get('currency_icon') }}
                                        @else
                                            {{ session()->get('currency_icon') }}{{ $product->regular_price * session()->get('currency_rate') }}
                                        @endif
                                    </p>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>
                    <a href="{{ route('products') }}" class="common_btn">{{__('user.View All')}} <i class="far fa-long-arrow-right" aria-hidden="true"></i></a>
                </div>
            </div>
        </section>
        <!--=============================
            NEW PRODUCT END
        ==============================-->
        @endif

        @if ($why_choose_us->visibility)
        <!--=============================
            WHY CHOOSE 3 START
        ==============================-->
        <section class="wsus__why_choose_3 wsus__why_choose_2 pt_115 xs_pt_75 pb_115 xs_pb_75">
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
                    <div class="col-xl-4 col-sm-6 col-lg-4">
                        <div class="wsus__why_choose_item">
                            <div class="img">
                                <img src="{{ asset($why_choose_us->home3_icon1) }}" alt="why choose" class="img-fluid w-100">
                            </div>
                            <h4>{{ $why_choose_us->home3_title1 }}</h4>
                            <p>{{ $why_choose_us->home3_description1 }}</p>
                        </div>
                    </div>
                    <div class="col-xl-4 col-sm-6 col-lg-4">
                        <div class="wsus__why_choose_item center">
                            <div class="img">
                                <img src="{{ asset($why_choose_us->home3_icon2) }}" alt="why choose" class="img-fluid w-100">
                            </div>
                            <h4>{{ $why_choose_us->home3_title2 }}</h4>
                            <p>{{ $why_choose_us->home3_description2 }}</p>
                        </div>
                    </div>
                    <div class="col-xl-4 col-sm-6 col-lg-4">
                        <div class="wsus__why_choose_item last">
                            <div class="img">
                                <img src="{{ asset($why_choose_us->home3_icon3) }}" alt="why choose" class="img-fluid w-100">
                            </div>
                            <h4>{{ $why_choose_us->home3_title3 }}</h4>
                            <p>{{ $why_choose_us->home3_description3 }}</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--=============================
            WHY CHOOSE 3 END
        ==============================-->
        @endif

    </div>



    @if ($product_section->visibility)
    <!--=============================
        GALLERY START
    ==============================-->
    <section class="wsus__galley pt_115 xs_pt_75 pb_120 xs_pb_80" style="background: url({{ asset('frontend/images/gallery_bg2.jpg') }});">
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

    @if ($special_offer->visibility)
    <!--=============================
        MEGAPACK START
    ==============================-->
    <section class="wsus__megapack">
        <div class="wsus__megapack_bg pt_105 xs_pt_65 pb_195" style="background: url({{ asset($special_offer->home3_background) }});">
            <div class="container">
                <div class="row mb_10">
                    <div class="col-xl-12">
                        <div class="wsus__megapack_text">
                            <p>{!! strip_tags(clean($partner_section->offer_title1),'<span>') !!}</p>
                            <a target="_blank" href="{{ $special_offer->link }}">{{__('user.Go to Offer page')}}</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="wsus__megapack_card_area">
            <div class="container">
                <div class="row">
                    <div class="col-xl-6 col-md-6">
                        <div class="wsus__megapack_card">
                            <h4>{{ $special_offer->home3_item1_title }}</h4>
                            <p>{{ $special_offer->home3_item1_description }}</p>
                            <a class="common_btn" target="_blank" href="{{ $special_offer->home3_item1_link }}">{{__('user.Buy Goods')}}</a>
                            <div class="img">
                                <img src="{{ asset($special_offer->home3_item1_image) }}" alt="mega pack" classimg-fluid w-100>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-md-6">
                        <div class="wsus__megapack_card">
                            <h4>{{ $special_offer->home3_item2_title }}</h4>
                            <p>{{ $special_offer->home3_item2_description }}</p>
                            <a class="common_btn" target="_blank" href="{{ $special_offer->home3_item2_link }}">{{__('user.Buy Goods')}}</a>
                            <div class="img">
                                <img src="{{ asset($special_offer->home3_item2_image) }}" alt="mega pack" classimg-fluid w-100>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        MEGAPACK END
    ==============================-->
    @endif


    @if ($featured_section->visibility)
    <!--=============================
        GALLERY 2 START
    ==============================-->
    <section class="wsus__galley_2 pt_115 xs_pt_50">
        <div class="container">
            <div class="row">
                <div class="col-xl-7 col-lg-8">
                    <div class="wsus__section_heading mb_15">
                        <h5>{{ $featured_section->title }}</</h5>
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

    @if ($mobile_app->visibility)
    <!--=============================
        DOWNLOAD 3 START
    ==============================-->
    <section class="wsus__download_3 mt_100 xs_mt_80 pt_120 xs_pt_80 pb_120 xs_pb_80"
        style="background: url({{ asset($mobile_app->home3_background) }});">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-xxl-6 col-md-7">
                    <div class="wsus__download_text">
                        <h2>{{ $mobile_app->home3_title }}</h2>
                        <p>{{ $mobile_app->home3_description }}</p>
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
                <div class="col-xxl-5 col-md-5">
                    <div class="wsus__download_img_3">
                        <img src="{{ asset($mobile_app->home3_foreground) }}" alt="download" class="img-fluid w-100">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        DOWNLOAD 3 END
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
                        <h5>{{ $testimonial_section->title }}</</h5>
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


    @if ($home3_blog_section->visibility)
    <!--=============================
        BLOG START
    ==============================-->
    <section class="wsus__blog pt_115 xs_pt_75 pb_120 xs_pb_80">
        <div class="container">
            <div class="row">
                <div class="col-xl-7 m-auto">
                    <div class="wsus__section_heading mb_20">
                        <h5>{{ $home3_blog_section->title }}</h5>
                        <h2>{{ $home3_blog_section->description }}</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                @foreach ($home3_blog_section->blogs as $blog)
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
                                <li><a href="{{ route('blog', $blog->slug) }}">{{__('user.Read More')}}</a></li>
                                <li>
                                    <div class="img">
                                        <img src="{{ asset($blog->admin->image) }}" alt="author" class="img-fluid w-100">
                                    </div>
                                    <p><span>{{__('user.By')}}</span> {{ $blog->admin->name }} </p>
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
        BLOG END
    ==============================-->
    @endif
@endsection
