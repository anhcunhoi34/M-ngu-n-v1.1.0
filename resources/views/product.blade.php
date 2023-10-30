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
                        <h1>{{__('user.Our Products')}}</h1>
                        <ul class="d-flex flex-wrap">
                            <li><a href="{{ route('home') }}">{{__('user.home')}}</a></li>
                            <li><a href="javascript:;">{{__('user.Our Products')}}</a></li>
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
        PRODUCT PAGE START
    ==============================-->
    <section class="wsus__product_page mt_120 xs_mt_80 mb_120 xs_mb_80">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-xxl-6 col-xl-6 col-md-7 col-lg-6">
                    <div class="wsus__product_page_search">
                        <form id="search_form">
                            <input type="text" name="keyword" id="search_keyword" value="{{ request()->get('keyword') }}" placeholder="{{__('user.Search your products')}}...">
                            <button class="common_btn" type="submit"><i class="far fa-search"></i> {{__('user.Search')}}</button>
                        </form>
                    </div>
                </div>
                <div class="col-xxl-3 col-xl-3 col-md-5 col-lg-4">
                    <div class="wsus__product_page_search">
                        <select class="select_js" id="sorting">
                            <option value="default" {{ request()->get('sorting')=='default'? 'selected':'' }}>{{__('user.Default sorting')}}</option>
                            <option value="script" {{ request()->get('sorting')=='script'? 'selected':'' }}>{{__('user.Script product')}}</option>
                            <option value="image" {{ request()->get('sorting')=='image'? 'selected':'' }}>{{__('user.Image product')}}</option>
                            <option value="video" {{ request()->get('sorting')=='video'? 'selected':'' }}>{{__('user.Video product')}}</option>
                            <option value="audio" {{ request()->get('sorting')=='audio'? 'selected':'' }}>{{__('user.Audio product')}}</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-8 col-lg-8">
                    <div class="row">
                        @forelse ($products as $product)
                        <div class="col-xl-6 col-md-6">
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
                                            href="javascript:;" onclick="getCatSlug('{{ $product->category->slug }}')">{{ $product->category->catlangfrontend->name }}</a></p>
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
                        @empty
                        <div class="col-12 text-center mt-5">
                            <h2 class="text-danger mt-5">{{__('user.Product Not Found')}}</h2>
                       </div>
                        @endforelse
                    </div>
                    <div class="wsus__pagination mt_50">
                        <div class="row">
                            {{ $products->links('custom_pagination') }}
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4">
                    <div class="wsus__product_sidebar_area mt_25">
                        <div class="wsus__product_sidebar categories">
                            <h3>{{__('user.Categories')}}</h3>
                            <ul>
                                @foreach ($categories as $category)
                                @php
                                    $total_product = App\Models\Product::where(['status' => 1, 'category_id'=>$category->id])->count();
                                @endphp
                                <li><a href="javascript:;" onclick="getCatSlug('{{ $category->slug }}')">{{ $category->catlangfrontend->name }} <span>({{ $total_product }})</span> </a></li>
                                @endforeach
                            </ul>
                        </div>
                        <div class="wsus__product_sidebar tags">
                            <h3>{{__('user.Filter Price')}}</h3>
                            <div id="slider-range" class="price-filter-range"></div>
                            <div class="range_price_area d-flex">
                                <p>{{__('user.Price')}}: <span>{{ session()->get('currency_icon') }}</span></p>
                                <div class="range_main_price d-flex">
                                    <input type="text" oninput="validity.valid||(value='0');" id="min_price"
                                        class="price-range-field" readonly />
                                    <input type="text" oninput="validity.valid||(value='1000');" id="max_price"
                                        class="price-range-field" readonly />
                                </div>
                            </div>
                            <input type="hidden" id="filter_min_price" name="min_price" value="0">
                            <input type="hidden" id="filter_max_price" name="max_price" value="1000">
                            <input type="hidden" id="get_min_price" value="{{ $min_price }}">
                            <input type="hidden" id="get_max_price" value="{{ $max_price }}">
                            <input type="hidden" id="product_max_price" value="{{ $product_max_price }}">
                            <input type="hidden" id="session_currency_rate" value="{{ session()->get('currency_rate') }}">
                            <button class="common_btn mt-3 w-100" onclick="priceFilter()"  type="submit">{{__('user.Filter')}}</button>
                        </div>
                    </div>
                    @if ($ad->status==1)
                    <div class="wsus__product_sidebar_offer">
                        <a target="__blank" href="{{ $ad->link }}">
                            <img src="{{ asset($ad->image) }}" alt="offer" class="img-fluid w-100">
                        </a>
                    </div>
                    @endif
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        PRODUCT PAGE END
    ==============================-->

    <form action="{{ route('products') }}" id="productSearchForm">

        @if (request()->has('sorting'))
        <input type="hidden" name="sorting" value="{{ request()->get('sorting') }}" id="search_sorting">
        @else
        <input type="hidden" name="sorting" value="" id="search_sorting">
        @endif

        @if (request()->has('category'))
            <input type="hidden" name="category" value="{{ request()->get('category') }}" id="search_category_slug">
        @else
            <input type="hidden" name="category" value="" id="search_category_slug">
        @endif


        @if (request()->has('min_price'))
        <input type="hidden" name="min_price" value="{{ request()->get('min_price') }}" id="search_min_price">
        @else
            <input type="hidden" name="min_price" value="" id="search_min_price">
        @endif

        @if (request()->has('max_price'))
            <input type="hidden" name="max_price" value="{{ request()->get('max_price') }}" id="search_max_price">
        @else
            <input type="hidden" name="max_price" value="" id="search_max_price">
        @endif

        @if (request()->has('keyword'))
            <input type="hidden" name="keyword" value="{{ request()->get('keyword') }}" id="keyword">
        @else
            <input type="hidden" name="keyword" value="" id="keyword">
        @endif
    
    </form>
@endsection
@push('frontend_js')
<script>
    (function($) {
        "use strict";
         $(document).ready(function () {

            $("#sorting").on("change", function(){
                $("#search_sorting").val($(this).val());
                $("#productSearchForm").submit();

            });

            $("#search_form").on("submit", function(e){
                e.preventDefault();

                $("#keyword").val($("#search_keyword").val());
                $("#productSearchForm").submit();
            });
        });
    })(jQuery);
    function getCatSlug(slug){
        $("#search_category_slug").val(slug);
        $("#productSearchForm").submit();
    }

    function priceFilter(){
        let filter_min_price = $('#filter_min_price').val();
        let filter_max_price = $('#filter_max_price').val();
        $('#search_min_price').val(filter_min_price);
        $('#search_max_price').val(filter_max_price);
        $("#productSearchForm").submit();
    }
</script>
@endpush
