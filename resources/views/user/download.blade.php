@extends($active_theme)

@section('title')
    <title>{{__('user.Buying product')}}</title>
    <meta name="description" content="{{__('user.Buying product')}}">
@endsection

@section('frontend-content')
    <!--=============================
        PROFILE DOWNLOAD START
    ==============================-->
    <section class="wsus__profile pt_130 xs_pt_100 pb_120 xs_pb_80">

        @include('user.inc.profile_header')

            <div class="row">
                <div class="col-xl-8 col-lg-8">
                    <div class="wsus__profile_download">
                        <h2>{{__('user.Buying Items')}}</h2>

                        @foreach ($order_items as $item)
                            @if ($item->order->order_status == 1)
                                <div class="wsus__download_item">
                                    <div class="wsus__download_item_left">
                                        <div class="img">
                                            <img src="{{ asset($item->product->thumbnail_image) }}" alt="download" class="img-fluid w-100">
                                        </div>
                                        <div class="text">
                                            <a href="{{ route('product-detail', $item->product->slug) }}">{{ html_decode($item->product->productlangfrontend->name) }}</a>
                                            <p>{{__('user.Item by')}} {{ html_decode($item->author->name) }}</p>
                                            @if ($item->variant_id!=null)
                                            <p>{{ html_decode($item->variant->variant_name) }}</p>
                                            @endif
                                            @if ($item->price_type!=null)
                                            <p>{{ ucfirst($item->price_type) }}</p>
                                            @endif
                                            <h4>
                                                @if (session()->get('currency_position') == 'right')
                                                    {{ html_decode($item->price * session()->get('currency_rate')) }}{{ session()->get('currency_icon') }}
                                                @else
                                                    {{ session()->get('currency_icon') }}{{ html_decode($item->price * session()->get('currency_rate')) }}
                                                @endif
                                            </h4>
                                        </div>
                                    </div>
                                    <div class="wsus__download_item_right">
                                        @if ($item->product_type=='script')
                                        <a class="common_btn" href="{{ route('download-script', $item->product->id) }}">{{__('user.Download File')}}</a>
                                        @else
                                            @if ($item->variant)
                                                <a class="common_btn" href="{{ route('download-variant', $item->variant->id) }}">{{__('user.Download File')}}</a>
                                            @endif
                                        @endif
                                        @php
                                            $review=App\Models\Review::where(['product_id' => $item->product->id, 'status' => 1])->get()->average('rating');
                                        @endphp
                                        <p data-bs-toggle="modal" data-bs-target="#review{{ $item->product->id }}">
                                            @for ($i = 1; $i <= 5; $i++)
                                                @if ($i <= $review)
                                                <i class="fas fa-star text-warning"></i>
                                                @else
                                                <i class="fas fa-star"></i>
                                                @endif
                                            @endfor
                                        </p>
                                    </div>
                                </div>
                            @endif
                        @endforeach

                        <div class="wsus__pagination mt_25">
                            <div class="row">
                                @if ($order_items->hasPages())
                                    {{ $order_items->links('custom_pagination') }}
                                @endif
                            </div>
                        </div>

                        <!-- rating modal end -->
                        <div class="wsus__rating_moadl_area">
                            @foreach ($order_items as $item)
                            <div class="modal fade" id="review{{ $item->product->id }}" tabindex="-1"
                            aria-labelledby="exampleModalLabel2" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="row">
                                        <div class="col-xl-6">
                                            <div class="text">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="exampleModalLabel2">{{__('user.Review this Item')}}
                                                    </h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>{{__('user.Your Rating')}}</p>
                                                    <p>
                                                        <i class="far fa-star text-dark s1"></i>
                                                        <i class="far fa-star text-dark s2"></i>
                                                        <i class="far fa-star text-dark s3"></i>
                                                        <i class="far fa-star text-dark s4"></i>
                                                        <i class="far fa-star text-dark s5"></i>
                                                    </p>
                                                    <form id="reviewForm" action="{{ route('user-product-review') }}" method="POST">
                                                        @csrf
                                                        <label>{{__('user.Comment')}}*</label>
                                                        <input type="hidden" class="star" name="rating" value="">
                                                        <input type="hidden" id="product_id" name="product_id" value="{{ $item->product->id }}">
                                                        <input type="hidden" id="order_id" name="order_id" value="{{ $item->order->id }}">
                                                        @if ($item->product->product_type!='script' && $item->variant)
                                                        <input type="hidden" id="variant_id" name="variant_id" value="{{ $item->variant->id }}">
                                                        @endif
                                                        <input type="hidden" id="author_id" name="author_id" value="{{ $item->author->id }}">
                                                        
                                                        <textarea rows="7" name="review"
                                                            placeholder="{{__('user.Type your message here')}}"></textarea>
                                                        <button type="submit" class="common_btn">{{__('user.Save Review')}}</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-6">
                                            <div class="img">
                                                <img src="{{ asset('frontend/images/rating_modal_img.jpg') }}" alt="rating" class="img-fluid w-100">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                            @endforeach
                        </div>
                        <!-- rating modal end -->
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4">
                    @include('user.inc.user_information')
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        PROFILE DOWNLOAD END
    ==============================-->
@endsection
@push('frontend_js')
<script>
    "use strict";
    $(document).ready(function(){
        $(document).ready(function(){
        $('.s1').on('click', function(){
            $('.s2, .s3, .s4, .s5').removeClass('fas fa-star text-warning');
            $('.s2, .s3, .s4, .s5').addClass('far fa-star text-dark');
            $('.s1').removeClass('far fa-star text-dark');
            $('.s1').addClass('fas fa-star text-warning');
            $('.star').val('');
            $('.star').val(1);
        });
        $('.s2').on('click', function(){
            $('.s3, .s4, .s5').removeClass('fas fa-star text-warning');
            $('.s3, .s4, .s5').addClass('far fa-star text-dark');
            $('.s1, .s2').removeClass('far fa-star text-dark');
            $('.s1, .s2').addClass('fas fa-star text-warning');
            $('.star').val('');
            $('.star').val(2);
        });
        $('.s3').on('click', function(){
            $('.s4, .s5').removeClass('fas fa-star text-warning');
            $('.s4, .s5').addClass('far fa-star text-dark');
            $('.s1, .s2, .s3').removeClass('far fa-star text-dark');
            $('.s1, .s2, .s3').addClass('fas fa-star text-warning');
            $('.star').val('');
            $('.star').val(3);
        });
        $('.s4').on('click', function(){
            $('.s5').removeClass('fas fa-star text-warning');
            $('.s5').addClass('far fa-star text-dark');
            $('.s1, .s2, .s3, .s4').removeClass('far fa-star text-dark');
            $('.s1, .s2, .s3, .s4').addClass('fas fa-star text-warning');
            $('.star').val('');
            $('.star').val(4);
        });
        $('.s5').on('click', function(){
            $('.s1, .s2, .s3, .s4, .s5').removeClass('far fa-star text-dark');
            $('.s1, .s2, .s3, .s4, .s5').addClass('fas fa-star text-warning');
            $('.star').val('');
            $('.star').val(5);
        });
    })
    })
</script>


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
                    },
                    error:function(response){
                        if(response.status == 403){
                            toastr.error(response.responseJSON.message);
                            $('#submitBtn').removeClass('d-none');
                            $('#showSpain').addClass('d-none');
                        }else{
                            if(response.responseJSON.errors.email)toastr.error(response.responseJSON.errors.email[0])
                            if(response.responseJSON.errors.message)toastr.error(response.responseJSON.errors.message[0])
                            $('#submitBtn').removeClass('d-none');
                            $('#showSpain').addClass('d-none');
                        }
                    }
                });
            });
        });
    })(jQuery);
</script>
@endpush
