@extends($active_theme)

@section('title')
    <title>{{ $product->productlangfrontend->name }}</title>
    <meta name="title" content="{{ $product->productlangfrontend->seo_title }}">
    <meta name="description" content="{{ $product->productlangfrontend->seo_description }}">
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
        PRODUCT DETAILS START
    ==============================-->
    <section class="wsus__product_details pt_120 xs_pt_80 pb_120 xs_pb_80">
        <div class="container">
            <div class="row">
                <div class="col-xl-8 col-lg-7 ">
                    <div class="wsus__product_details_img">
                        <img src="{{ asset($product->thumbnail_image) }}" alt="product" class="img-fluod w-100">
                    </div>

                    <div class="wsus__product_details_text">
                        <ul class="nav nav-pills" id="pills-tab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill"
                                    data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home"
                                    aria-selected="true"><i class="fal fa-layer-group"></i> {{__('user.Description')}}</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill"
                                    data-bs-target="#pills-profile" type="button" role="tab"
                                    aria-controls="pills-profile" aria-selected="false"><i class="far fa-comments"></i>
                                    {{__('user.Comments')}} ({{ $productComments->count() }})</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill"
                                    data-bs-target="#pills-contact" type="button" role="tab"
                                    aria-controls="pills-contact" aria-selected="false"><i class="far fa-star"></i>
                                    {{__('user.Review')}} ({{ $productReviews->count() }})</button>
                            </li>

                            <li class="nav-item" role="presentation">
                                <button onclick="addWishlist({{ $product->id }})"><i class="far fa-heart" aria-hidden="true"></i>
                                    {{__('user.Wishlist')}}</button>
                            </li>

                        </ul>
                        <div class="tab-content" id="pills-tabContent">
                            <div class="tab-pane fade show active" id="pills-home" role="tabpanel"
                                aria-labelledby="pills-home-tab" tabindex="0">
                                <div class="wsus__pro_description">
                                    {!! clean(html_decode($product->productlangfrontend->description)) !!}
                                </div>
                            </div>
                            <div class="tab-pane fade" id="pills-profile" role="tabpanel"
                                aria-labelledby="pills-profile-tab" tabindex="0">
                                <div class="wsus__pro_det_comment">
                                    <h4>{{__('user.Comments')}}</h4>
                                    @foreach ($productComments as $productComment)
                                    <div class="wsus__single_comment">
                                        <div class="comment_footer d-flex flex-wrap">
                                            <div class="img">
                                                @if($productComment->user->image!=null)
                                                <img src="{{ asset($productComment->user->image) }}" alt="useer" class="img-fluid w-100">
                                                @elseif($productComment->user->provider=='google')
                                                <img src="{{ asset($productComment->user->provider_avatar) }}" alt="useer" class="img-fluid w-100">
                                                @else
                                                <img src="{{ asset($setting->default_avatar) }}" alt="useer" class="img-fluid w-100">
                                                @endif
                                            </div>
                                            <div class="text">
                                                <h3>{{ html_decode($productComment->name) }}</h3>
                                                <p>{{ html_decode($productComment->address) }}</p>
                                            </div>
                                        </div>
                                        <p class="comment_des">{!! html_decode($productComment->comment) !!}</p>
                                        <p class="comment_date"> <span class="date"><i class="far fa-calendar-alt"></i>
                                            {{ Carbon\Carbon::parse($productComment->created_at)->format('F d,Y') }} {{__('user.At')}}
                                            {{  Carbon\Carbon::parse($productComment->created_at)->format('h:ia') }} </span>
                                        </p>
                                    </div>
                                    @endforeach
                                </div>
                                <div class="wsus__pagination">
                                    @if ($productComments->hasPages())
                                        <div class="row">
                                            {{ $productComments->links('custom_pagination') }}
                                        </div>
                                    @endif
                                </div>
                                <form class="wsus__comment_input_area" id="productCommentForm" method="POST">
                                    @csrf
                                    <h3>{{__('user.Leave a Comment')}}</h3>
                                    <div class="row">
                                        <div class="col-xl-12">
                                            <div class="wsus__comment_single_input">
                                                <fieldset>
                                                    <legend>{{__('user.Comment')}}*</legend>
                                                    <textarea rows="7" name="comment" placeholder="{{__('user.Type here')}}.."></textarea>
                                                    <input type="hidden" name="product_id" value="{{ $product->id }}">
                                                </fieldset>
                                            </div>
                                            @if($recaptchaSetting->status==1)
                                            <div class="wsus__comment_single_input"> 
                                                <div class="g-recaptcha mt-2" data-sitekey="{{ $recaptchaSetting->site_key }}"></div>
                                            </div>
                                            @endif
                                            <button class="common_btn" id="submitBtn" type="submit">{{__('user.Submit Comment')}}</button>
                                            <button class="common_btn d-none" id="showSpain" type="submit"><i class="fas fa-spinner fa-spin"></i></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="tab-pane fade" id="pills-contact" role="tabpanel"
                                aria-labelledby="pills-contact-tab" tabindex="0">
                                <div class="wsus__pro_det_review">
                                    <h3>{{__('user.Reviews')}}</h3>
                                    @foreach ($productReviews as $productReview)
                                    <div class="wsus__single_comment">
                                        <div class="comment_footer d-flex flex-wrap">
                                            <div class="img">
                                                @if($productReview->user->image!=null)
                                                <img src="{{ asset($productReview->user->image) }}" alt="useer" class="img-fluid w-100">
                                                @elseif($productReview->user->provider=='google')
                                                <img src="{{ asset($productReview->user->provider_avatar) }}" alt="useer" class="img-fluid w-100">
                                                @else
                                                <img src="{{ asset($setting->default_avatar) }}" alt="useer" class="img-fluid w-100">
                                                @endif
                                            </div>
                                            <div class="text">
                                                <h3>{{ html_decode($productReview->user->name) }}
                                                    <span>
                                                        @for ($i = 1; $i <= 5; $i++)
                                                            @if ($i <= $productReview->rating)
                                                            <i class="fas fa-star"></i>
                                                            @else
                                                            <i class="far fa-star"></i>
                                                            @endif
                                                        @endfor
                                                    </span>
                                                </h3>
                                                <p>{{ html_decode($productReview->user->address) }}</p>
                                            </div>
                                        </div>
                                        <p class="comment_des">{{ html_decode($productReview->review) }}</p>
                                        <p class="comment_date"> <span class="date"><i class="far fa-calendar-alt"></i>
                                            {{ Carbon\Carbon::parse($productReview->created_at)->format('F d,Y') }} {{__('user.At')}} {{  Carbon\Carbon::parse($productReview->created_at)->format('h:ia') }} </span>
                                        </p>
                                    </div>
                                    @endforeach
                                </div>
                                
                                <div class="wsus__pagination">
                                    @if ($productReviews->hasPages())
                                        <div class="row">
                                            {{ $productReviews->links('custom_pagination') }}
                                        </div>
                                    @endif
                                </div>

                                <form class="wsus__comment_input_area" id="productReviewForm" method="POST">
                                    @csrf
                                    <h3>{{__('user.Write Your Reviews')}}</h3>
                                    <p>
                                        <i class="fas fa-star s1"></i>
                                        <i class="fas fa-star s2"></i>
                                        <i class="fas fa-star s3"></i>
                                        <i class="fas fa-star s4"></i>
                                        <i class="fas fa-star s5"></i>
                                        <span class="total_star">(0.0)</span>
                                    </p>
                                    <div class="row">
                                        <div class="col-xl-12">
                                            <div class="wsus__comment_single_input">
                                                <fieldset>
                                                    <legend>{{__('user.comment')}}*</legend>
                                                    <textarea rows="7" name="review" placeholder="{{__('user.Type here')}}.."></textarea>
                                                    <input type="hidden" class="star" name="rating" value="">
                                                    <input type="hidden" id="product_id" name="product_id" value="{{ $product->id }}">
                                                    <input type="hidden" id="author_id" name="author_id" value="{{ $product->author->id }}">
                                                </fieldset>
                                            </div>

                                            @if($recaptchaSetting->status==1)
                                            <div class="wsus__comment_single_input"> 
                                                <div class="g-recaptcha mt-2" data-sitekey="{{ $recaptchaSetting->site_key }}"></div>
                                            </div>
                                            @endif

                                            <button class="common_btn" id="reviewSubmitBtn" type="submit">{{__('user.Submit Review')}}</button>
                                            <button class="common_btn d-none" id="reviewShowSpain" type="submit"><i class="fas fa-spinner fa-spin"></i></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-5">
                    <div class="wsus__sidebar pl_30 xs_pl_0" id="sticky_sidebar">
                        <div class="wsus__sidebar_licence">
                            @if ($product->product_type != 'script')
                                @if ($variants->count() > 0)
                                <div class="select_licance">
                                    <select class="select_js" name="variant_id" id="variant_id">
                                        @foreach ($variants as $variant)
                                        <option value="{{ $variant->id }}">{{ html_decode($variant->variant_name) }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <h2>
                                    @if (session()->get('currency_position') == 'right')
                                        <strong id="price">{{ html_decode($first_variant->price * session()->get('currency_rate')) }}</strong><span class="right_currency_icon">{{ session()->get('currency_icon') }}</span>
                                    @else
                                        <span>{{ session()->get('currency_icon') }}</span> <strong id="price">{{ html_decode($first_variant->price * session()->get('currency_rate')) }}</strong>
                                    @endif
                                </h2>
                                <input type="hidden" value="{{ session()->get('currency_rate') }}" id="currency_rate">
                                <input type="hidden" value="{{ $first_variant->price }}" id="image_price">
                                @endif
                            @endif
                            @if ($product->product_type == 'script')
                            <div class="select_licance">
                                <select class="select_js" name="price_type" id="price_type">
                                    <option value="regular price">{{__('user.Regular Price')}}</option>
                                    <option value="extend price">{{__('user.extend Price')}}</option>
                                </select>
                            </div>

                            @if (session()->get('currency_position') == 'right')
                                <h2 class="" id="reg_price"><strong id="regular_price">{{ html_decode($product->regular_price * session()->get('currency_rate')) }}</strong> <span class="right_currency_icon">{{ session()->get('currency_icon') }}</span></h2>

                                <h2 class="d-none" id="ext_price"><strong id="extend_price">{{ html_decode($product->extend_price * session()->get('currency_rate')) }}</strong> <span class="right_currency_icon">{{ session()->get('currency_icon') }}</span> </h2>
                            @else
                                <h2 class="" id="reg_price"><span>{{ session()->get('currency_icon') }}</span> <strong id="regular_price">{{ html_decode($product->regular_price * session()->get('currency_rate')) }}</strong></h2>

                                <h2 class="d-none" id="ext_price"><span>{{ session()->get('currency_icon') }}</span> <strong id="extend_price">{{ html_decode($product->extend_price * session()->get('currency_rate')) }}</strong></h2>
                            @endif

                            <ul class="feature" id="regular_content">
                                {!! $script_content->scriptlangfrontend->regular_content !!}
                            </ul>
                            <ul class="feature d-none" id="extend_content">
                                {!! $script_content->scriptlangfrontend->extend_content !!}
                            </ul>
                            @endif
                            
                            <input type="hidden" value="{{ $product->regular_price }}" id="script_regular_price">
                            <input type="hidden" value="{{ $product->extend_price }}" id="script_extend_price">
                            <input type="hidden" value="{{ $product->product_type }}" id="product_type">
                            <input type="hidden" value="{{ $product->productlangfrontend->name }}" id="product_name">
                            <input type="hidden" value="{{ $product->slug }}" id="slug">
                            <input type="hidden" value="{{ $product->category->catlangfrontend->name }}" id="category_name">
                            <input type="hidden" value="{{ $product->category->id }}" id="category_id">
                            <input type="hidden" value="{{ $product->thumbnail_image }}" id="product_image">
                            <input type="hidden" value="{{ $product->author->name }}" id="author_name">
                            <input type="hidden" value="{{ $product->author->id }}" id="author_id">
                            <ul class="button_area mt_50 d-flex flex-wrap {{ $product->product_type=='script' ? '':'mt-3' }}">
                                <li><a class="live" target="__blank" href="{{ $product->preview_link }}">{{__('user.Live Preview')}}</a></li>
                                <li><a class="common_btn" href="javascript:;" onclick="addToCard({{ $product->id }})">{{__('user.add to cart')}}</a></li>
                            </ul>
                            <ul class="sell_rating mt_20 d-flex flex-wrap justify-content-between">
                                <li><i class="far fa-cart-arrow-down"></i> {{ $total_sale }}</li>
                                <li><i class="far fa-comments"></i> {{ $productComments->count() }}</li>
                                <li><i class="far fa-star"></i> {{ $productReviews->count() }}</li>
                            </ul>
                        </div>

                        <div class="wsus__sidebar_author_info mt_30">
                            <h3>{{__('user.Author Profile')}}</h3>
                            <div class="wsus__sidebar_author_text">
                                <div class="img">
                                    @if($product->author->image!=null)
                                    <img src="{{ asset($product->author->image) }}" alt="author" class="img-fluid w-100">
                                    @elseif($product->author->provider=='google')
                                    <img src="{{ asset($product->author->provider_avatar) }}" alt="author" class="img-fluid w-100">
                                    @else
                                    <img src="{{ asset($setting->default_avatar) }}" alt="author" class="img-fluid w-100">
                                    @endif
                                </div>
                                <div class="text">
                                    <h4>{{ html_decode($product->author->name) }}</h4>
                                    <p>{{__('user.Joined')}} - {{ Carbon\Carbon::parse($product->author->created_at)->format('F Y') }}</p>
                                </div>
                            </div>
                            <ul class="d-flex flex-wrap justify-content-center">
                                @php
                                    $total_sold=App\Models\OrderItem::where('author_id', $product->author->id)->get()->count();
                                    $total_product=App\Models\Product::where(['author_id' => $product->author->id, 'status' => 1])->get()->count();
                                @endphp
                                <li>
                                    <h4>{{ $total_product }}</h4>
                                    <p>{{__('user.products')}}</p>
                                </li>
                                <li>
                                    <h4>{{ $total_sold }}</h4>
                                    <p>{{__('user.Total sale')}}</p>
                                </li>
                            </ul>
                            <a class="common_btn w-100" href="{{ route('author-profile', $product->author->user_name ) }}"><i class="fal fa-stars"></i> {{__('user.View Profile')}}</a>
                        </div>

                        <div class="wsus__sidebar_pro_info mt_30">
                            <h3>{{__('user.product Info')}}</h3>
                            <ul>
                                <li><span>{{__('user.Released')}}</span> {{ Carbon\Carbon::parse($product->created_at)->format('F d,Y') }}</li>
                                <li><span>{{__('user.Updated')}}</span> {{ Carbon\Carbon::parse($product->updated_at)->format('F d,Y') }}</li>
                                <li><span>{{__('user.File Type')}}</span> {{ $product->product_type }}</li>
                                <li><span>{{__('user.High Resolution')}}</span> {{ $product->high_resolution == 1 ? 'Yes' : 'No' }}</li>
                                <li><span>{{__('user.Cross browser')}}</span> {{ $product->cross_browser == 1 ? 'Yes' : 'No' }}</li>
                                <li><span>{{__('user.Documentation')}}</span> {{ $product->documentation == 1 ? 'Yes' : 'No' }}</li>
                                <li><span>{{__('user.Responsive')}}</span> {{ $product->layout == 1 ? 'Yes' : 'No' }}</li>
                                <li><span>{{__('user.Tags')}}</span>
                                    @php
                                        $tag_arr=[];
                                        $tags=explode(',', $product->productlangfrontend->tags);
                                        foreach($tags as $tag){
                                            $tag_arr[]=$tag;
                                        }
                                        array_pop($tag_arr);
                                    @endphp
                                    <p>
                                        @foreach ($tag_arr as $tag)
                                        <a href="{{ route('products', ['keyword' => strtolower($tag)]) }}">{{ html_decode($tag) }},</a>
                                        @endforeach
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        PRODUCT DETAILS END
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
                @foreach ($related_products as $product)
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
                            <p class="price">{{ $setting->currency_icon }}{{ html_decode($product->regular_price) }}</p>
                            
                            <div class="like_and_sell">
                                <span class="download"><i class="fas fa-arrow-to-bottom"></i>{{ $sale }} {{__('user.Sale')}}</span>
                            </div>
                            
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
            <a href="{{ route('products', ['category' => $product->category->slug]) }}" class="common_btn">{{__('user.View All')}} <i class="far fa-long-arrow-right"></i></a>
        </div>
    </section>
    @endif
    <!--=============================
        RELATED PRODUCT END
    ==============================-->
@endsection
@push('frontend_js')
<script>
    (function($) {
        "use strict";
        $(document).ready(function () {
            $("#contactWithAuthor").on("submit", function(e){
                e.preventDefault();

                var isDemo = "{{ env('APP_MODE') }}"
                if(isDemo == 'DEMO'){
                    toastr.error('This Is Demo Version. You Can Not Change Anything');
                    return;
                }
                 $('#submitBtnn').addClass('d-none');
                 $('#showSpainn').removeClass('d-none');
                $.ajax({
                    url: "{{ route('contact-with-author') }}",
                    type:"post",
                    data:$('#contactWithAuthor').serialize(),
                    success:function(response){
                        if(response.status == 1){
                            toastr.success(response.message)
                            $("#contactWithAuthor").trigger("reset");
                            $('#submitBtnn').removeClass('d-none');
                            $('#showSpainn').addClass('d-none');
                            $('#cancelBtn').click();
                        }

                        if(response.status == 0){
                            toastr.error(response.message)
                            $("#contactWithAuthor").trigger("reset");
                            $('#submitBtnn').removeClass('d-none');
                            $('#showSpainn').addClass('d-none');
                        }
                    },
                    error:function(response){
                        if(response.status == 403){
                            toastr.error(response.responseJSON.message);
                            $('#submitBtnn').removeClass('d-none');
                            $('#showSpainn').addClass('d-none');
                        }else{
                            if(response.responseJSON.errors.message)toastr.error(response.responseJSON.errors.message[0])
                            $('#submitBtnn').removeClass('d-none');
                            $('#showSpainn').addClass('d-none');
                            if(!response.responseJSON.errors.message){
                                toastr.error("{{__('user.Please complete the recaptcha to submit the form')}}")
                            }
                        }
                    }
                });
            });
        
            $("#productCommentForm").on('submit', function(e){
                e.preventDefault();
                $('#showSpain').removeClass('d-none');
                $('#submitBtn').addClass('d-none');
                var isDemo = "{{ env('APP_MODE') }}"
                if(isDemo == 'DEMO'){
                    toastr.error('This Is Demo Version. You Can Not Change Anything');
                    return;
                }
                $.ajax({
                    type: 'POST',
                    data: $('#productCommentForm').serialize(),
                    url: "{{ route('product-comment') }}",
                    success: function (response) {
                        if(response.status == 1){
                            toastr.success(response.message)
                            $("#productCommentForm").trigger("reset");
                            $('#showSpain').addClass('d-none');
                            $('#submitBtn').removeClass('d-none');
                        }
                        if(response.status == 0){
                            toastr.error(response.message);
                            $('#showSpain').addClass('d-none');
                            $('#submitBtn').removeClass('d-none');
                        }
                    },
                    error: function(response) {
                        $('#showSpain').addClass('d-none');
                        $('#submitBtn').removeClass('d-none');
                        if(response.responseJSON.errors.comment)toastr.error(response.responseJSON.errors.comment[0])
                        if(!response.responseJSON.errors.comment){
                            toastr.error("{{__('user.Please complete the recaptcha to submit the form')}}")
                        }
                    }
                });
            });

            $("#productReviewForm").on('submit', function(e){
                e.preventDefault();
                $('#reviewShowSpain').removeClass('d-none');
                $('#reviewSubmitBtn').addClass('d-none');
                var isDemo = "{{ env('APP_MODE') }}"
                if(isDemo == 'DEMO'){
                    toastr.error('This Is Demo Version. You Can Not Change Anything');
                    return;
                }
                $.ajax({
                    type: 'POST',
                    data: $('#productReviewForm').serialize(),
                    url: "{{ route('product-review') }}",
                    success: function (response) {
                        if(response.status == 1){
                            toastr.success(response.message)
                            $("#productReviewForm").trigger("reset");
                            $('#reviewShowSpain').addClass('d-none');
                            $('#reviewSubmitBtn').removeClass('d-none');
                        }
                        if(response.status == 0){
                            toastr.error(response.message);
                            $('#reviewShowSpain').addClass('d-none');
                            $('#reviewSubmitBtn').removeClass('d-none');
                        }
                    },
                    error: function(response) {
                        $('#reviewShowSpain').addClass('d-none');
                        $('#reviewSubmitBtn').removeClass('d-none');
                        if(response.responseJSON.errors.rating)toastr.error(response.responseJSON.errors.rating[0])
                        if(response.responseJSON.errors.review)toastr.error(response.responseJSON.errors.review[0])
                        if(!response.responseJSON.errors.comment){
                            toastr.error("{{__('user.Please complete the recaptcha to submit the form')}}")
                        }
                    }
                });
            });

           $('#send_message_btn').on('click', function(){
            toastr.error('Please login your account');
           });

            $("#variant_id").on("change", function(){
                let variant_id = $(this).val();
                
                $.ajax({
                    url: "{{ url('/variant-price') }}" + "/" + variant_id,
                    type:"get",
                    success:function(response){
                        if(response){
                            let variant_price= response.variant.price;
                            let currency_rate = $('#currency_rate').val();
                            $('#price').text(variant_price * currency_rate);
                            $('#image_price').val(variant_price);
                        }
                    }
                });
                
        });

        $("#price_type").on("change", function(){
                let price_type = $(this).val();
                if(price_type=='extend price'){
                    $('#reg_price').addClass('d-none');
                    $('#ext_price').removeClass('d-none');
                    $('#extend_content').removeClass('d-none');
                    $('#regular_content').addClass('d-none');
                }else if(price_type=='regular price'){
                    $('#reg_price').removeClass('d-none');
                    $('#ext_price').addClass('d-none');
                    $('#regular_content').removeClass('d-none');
                    $('#extend_content').addClass('d-none');
                } 
        });
    });   
})(jQuery);

</script>

<script>
    "use strict";
    $(document).ready(function(){
        $('.s1').on('click', function(){
            $('.s2, .s3, .s4, .s5').removeClass('fas fa-star text-warning');
            $('.s2, .s3, .s4, .s5').addClass('fas fa-star');
            $('.s1').removeClass('fas fa-star');
            $('.s1').addClass('fas fa-star text-warning');
            $('.star').val('');
            $('.star').val(1);
            $('.total_star').text('');
            $('.total_star').text('('+1+'.0)');
        });
        $('.s2').on('click', function(){
            $('.s3, .s4, .s5').removeClass('fas fa-star text-warning');
            $('.s3, .s4, .s5').addClass('fas fa-star');
            $('.s1, .s2').removeClass('fas fa-star');
            $('.s1, .s2').addClass('fas fa-star text-warning');
            $('.star').val('');
            $('.star').val(2);
            $('.total_star').text('');
            $('.total_star').text('('+2+'.0)');
        });
        $('.s3').on('click', function(){
            $('.s4, .s5').removeClass('fas fa-star text-warning');
            $('.s4, .s5').addClass('fas fa-star');
            $('.s1, .s2, .s3').removeClass('fas fa-star');
            $('.s1, .s2, .s3').addClass('fas fa-star text-warning');
            $('.star').val('');
            $('.star').val(3);
            $('.total_star').text('');
            $('.total_star').text('('+3+'.0)');
        });
        $('.s4').on('click', function(){
            $('.s5').removeClass('fas fa-star text-warning');
            $('.s5').addClass('fas fa-star ');
            $('.s1, .s2, .s3, .s4').removeClass('fas fa-star');
            $('.s1, .s2, .s3, .s4').addClass('fas fa-star text-warning');
            $('.star').val('');
            $('.star').val(4);
            $('.total_star').text('');
            $('.total_star').text('('+4+'.0)');
        });
        $('.s5').on('click', function(){
            $('.s1, .s2, .s3, .s4, .s5').removeClass('fas fa-star');
            $('.s1, .s2, .s3, .s4, .s5').addClass('fas fa-star text-warning');
            $('.star').val('');
            $('.star').val(5);
            $('.total_star').text('');
            $('.total_star').text('('+5+'.0)');
        });
    })
</script>
@endpush
