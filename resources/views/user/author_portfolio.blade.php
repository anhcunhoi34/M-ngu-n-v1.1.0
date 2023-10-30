@extends($active_theme)
@section('title')
    <title>{{__('user.Seller Portfolio')}}</title>
    <meta name="description" content="{{__('user.Seller Portfolio')}}">
@endsection

@section('frontend-content')

    <!--=============================
        PROFILE PORTFOLIO START
    ==============================-->
    <section class="wsus__profile pt_130 xs_pt_100 pb_120 xs_pb_80">
        
        @include('user.inc.author_profile_header')

            <div class="row">
                <div class="col-xl-8 col-lg-8">
                    <div class="wsus__profile_portfolio">
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
                                        <p>{{__('user.By')}} <span>{{ $product->author->name }}</span> {{__('user.In')}} <a class="category" href="{{ route('products', ['category' => $product->category->slug]) }}">{{ $product->category->catlangfrontend->name }}</a></p>
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
                            <div class="col-12 text-center text-danger mt-5">
                                <h2 class="mt-5">{{__('user.Product Not Found')}}</h2>
                            </div>
                            @endforelse
                        </div>
                        <div class="wsus__pagination mt_25">
                            <div class="row">
                                @if ($products->hasPages())
                                    {{ $products->links('custom_pagination') }}
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4">
                    @include('user.inc.author_information')
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        PROFILE PORTFOLIO END
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
                 $('#submitBtn').addClass('d-none');
                 $('#showSpain').removeClass('d-none');
                $.ajax({
                    url: "{{ route('contact-with-author') }}",
                    type:"post",
                    data:$('#contactWithAuthor').serialize(),
                    success:function(response){
                        if(response.status == 1){
                            toastr.success(response.message)
                            $("#contactWithAuthor").trigger("reset");
                            $('#submitBtn').removeClass('d-none');
                            $('#showSpain').addClass('d-none');
                        }

                        if(response.status == 0){
                            toastr.error(response.message)
                            $("#contactWithAuthor").trigger("reset");
                            $('#submitBtn').removeClass('d-none');
                            $('#showSpain').addClass('d-none');
                        }
                    },
                    error:function(response){
                        if(response.status == 403){
                            toastr.error(response.responseJSON.message);
                            $('#submitBtn').removeClass('d-none');
                            $('#showSpain').addClass('d-none');
                        }else{
                            if(response.responseJSON.errors.message)toastr.error(response.responseJSON.errors.message[0])
                            $('#submitBtn').removeClass('d-none');
                            $('#showSpain').addClass('d-none');
                            if(!response.responseJSON.errors.message){
                                toastr.error("{{__('user.Please complete the recaptcha to submit the form')}}")
                            }
                        }
                    }
                });
            });
        });
    })(jQuery);
</script>
@endpush
