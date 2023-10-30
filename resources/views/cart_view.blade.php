@extends($active_theme)

@section('title')
    <title>{{__('user.Cart view')}}</title>
@endsection

@section('frontend-content')
 @if ($carts->count()>0)
    <!--=============================
        BREADCRUMB START
    ==============================-->
    <section class="wsus__breadcrumb" style="background: url({{ asset('frontend/images/breadcrumb_bg.jpg') }});">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="wsus__breadcrumb_text">
                        <h1>{{__('user.Cart view')}}</h1>
                        <ul class="d-flex flex-wrap">
                            <li><a href="{{ route('home') }}">{{__('user.Home')}}</a></li>
                            <li><a href="javascript:;">{{__('user.Cart view')}}</a></li>
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
        CART VIEW START
    ==============================-->
    <section class="wsus__cart_view pt_120 xs_pt_80 pb_120 xs_pb_80">
        <div class="container">
            <div class="wsus__cart_area">
                <div class="row">
                    <div class="col-12">
                        <div class="wsus__cart_table">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th class="img">{{__('user.Product')}}</th>
                                            <th class="description"></th>
                                            <th class="price">{{__('user.Price')}}</th>
                                            <th class="discount">{{__('user.Category')}}</th>
                                            <th class="action">{{__('user.Action')}}</th>
                                        </tr>
                                    </thead>
                                    <tbody id="cartItem">
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-between mt_80">
                    <div class="col-xxl-5 col-xl-6 col-lg-6">
                        <form class="wsus__cart_coupone">
                            <input type="text" id="coupon_name" placeholder="{{__('user.Discount Code')}}">
                            <input type="hidden" id="coupon_valid" value="{{__('user.Coupon is required')}}">
                            <button class="common_btn" onclick="couponApply()" type="button">{{__('user.Apply')}}</button>
                        </form>
                    </div>
                    <div class="col-xxl-4 col-xl-5 col-lg-5">
                        <div class="wsus__cart_price_list">
                            <ul class="d-flex flex-wrap justify-content-end">
                                <li><a class="common_btn" href="{{ route('products') }}">{{__('user.Continue Shopping')}}</a></li>
                            </ul>
                            <div class="list_item" id="calprice">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        CART VIEW END
    ==============================-->


    <!--=============================
        RELATED PRODUCT START
    ==============================-->
    @if ($related_products->count() > 0)
    <section class="wsus__related_product wsus__galley_2 pt_115 xs_pt_75 pb_120 xs_pb_80">
        <div class="container">
            <div class="row">
                <div class="col-xl-7 col-lg-8">
                    <div class="wsus__section_heading mb_15">
                        <h5>{{__('user.Save time with pre-installed software')}}.</h5>
                        <h2>{{__('user.Related Products')}}.</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                @forelse ($related_products as $product)
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
                @empty
                <div class="col-12 text-center mt-5">
                    <h2 class="mt-5 text-danger">{{__('user.Product Not Found')}}</h2>
                </div>
                @endforelse
            </div>
            <a href="{{ route('products') }}" class="common_btn">{{__('user.View All')}} <i class="far fa-long-arrow-right"></i></a>
        </div>
    </section>
    @endif
    <!--=============================
        RELATED PRODUCT END
    ==============================-->
 @else
    <!--=============================
        BREADCRUMB START
    ==============================-->
    <section class="wsus__breadcrumb" style="background: url({{ asset('frontend/images/breadcrumb_bg.jpg') }});">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="wsus__breadcrumb_text">
                        <h1>{{__('user.Empty Cart')}}</h1>
                        <ul class="d-flex flex-wrap">
                            <li><a href="{{ route('home') }}">{{__('user.Home')}}</a></li>
                            <li><a href="javascript:;">{{__('user.Empty Cart')}}</a></li>
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
        CART EMPTY START
    ==============================-->
    <section class="wsus__cart_empty pt_120 xs_pt_80 pb_110 xs_pb_70">
        <div class="container">
            <div class="row">
                <div class="col-xl-7 col-md-7 m-auto">
                    <div class="wsus__cart_empty_text">
                        <div class="img">
                            <img src="{{ asset('frontend/images/empty_cart_img.png') }}" alt="empty cart" class="img-fluid w-100">
                        </div>
                        <h3>{{__('user.Your cart is empty')}}</h3>
                        <a class="common_btn" href="{{ route('products') }}">{{__('user.Continue To Shoping')}}</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        CART EMPTY END
    ==============================-->
 @endif
@endsection
