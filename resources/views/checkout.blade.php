@extends($active_theme)

@section('title')
    <title>{{__('user.Check Out')}}</title>
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
                        <h1>{{__('user.Check Out')}}</h1>
                        <ul class="d-flex flex-wrap">
                            <li><a href="{{ route('home') }}">{{__('user.Home')}}</a></li>
                            <li><a href="javascript:;">{{__('user.Check Out')}}</a></li>
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
        CHECKOUT START
    ==============================-->
    <section class="wsus__checkout pt_120 xs_pt_80 pb_120 xs_pb_80">
        <div class="container">
            <div class="row">
                <div class="col-xl-8 col-lg-7">
                    <div class="wsus__checkout_text">
                        <h3>{{__('user.Select your payment method')}}</h3>
                        <ul class="nav nav-pills" id="pills-tab" role="tablist">
                            @if ($stripe->status == 1)
                            <li class="nav-item">
                                <button class="nav-link active" data-bs-toggle="modal" data-bs-target="#stripeModal">
                                    <img src="{{ asset($stripe->image) }}" alt="stripe" class="img-fluis w-100">
                                </button>
                            </li>
                            @endif
                            @if ($paypal->status == 1)
                            <li class="nav-item">
                                <form action="{{ route('pay-with-paypal') }}" method="GET" id="paypalForm">
                                    @csrf
                                    <input type="hidden" name="total_amount" value="{{ $cartTotal }}">
                                    <input type="hidden" name="cart_qty" value="{{ $cartQty }}">
                                </form>
                                <button class="nav-link" id="paypal" data-bs-toggle="pill">
                                    <img src="{{ asset($paypal->image) }}" alt="paypal" class="img-fluis w-100">
                                </button>
                            </li>
                            @endif
                            @if ($mollie->mollie_status == 1)
                            <li class="nav-item">
                                <button class="nav-link" id="mollie" data-bs-toggle="pill">
                                    <img src="{{ asset($mollie->mollie_image) }}" alt="paypal" class="img-fluis w-100">
                                </button>
                                <form action="{{ route('pay-with-mollie') }}" method="GET" id="mollieForm">
                                    @csrf
                                    <input type="hidden" name="total_amount" value="{{ $cartTotal }}">
                                    <input type="hidden" name="cart_qty" value="{{ $cartQty }}">
                                </form>
                            </li>
                            @endif
                            @if ($instamojo->status == 1)
                            <li class="nav-item">
                                <button class="nav-link" id="instamojo" data-bs-toggle="pill">
                                    <img src="{{ asset($instamojo->image) }}" alt="Degmark" class="img-fluis w-100">
                                </button>
                                <form action="{{ route('pay-with-instamojo') }}" method="GET" id="instamojoForm">
                                    @csrf
                                    <input type="hidden" name="total_amount" value="{{ $cartTotal }}">
                                    <input type="hidden" name="cart_qty" value="{{ $cartQty }}">
                                </form>
                            </li>
                            @endif
                            @if ($paystack->paystack_status == 1)
                            <li class="nav-item">
                                <button class="nav-link" onclick="payWithPaystack()" data-bs-toggle="pill">
                                    <img src="{{ asset($paystack->paystack_image) }}" alt="Degmark" class="img-fluis w-100">
                                </button>
                                <input type="hidden" name="total_amount" id="total_amount" value="{{ $cartTotal }}">
                                <input type="hidden" name="cart_qty" id="cart_qty" value="{{ $cartQty }}">
                            </li>
                            @endif
                            @if ($razorpay->status == 1)
                            <li class="nav-item">
                                <button class="nav-link" id="rajorpay" data-bs-toggle="pill">
                                    <img src="{{ asset($razorpay->image) }}" alt="Degmark" class="img-fluis w-100">
                                </button>
                                <form action="{{ route('pay-with-razorpay') }}" class="d-none" method="POST" id="rajorpayForm">
                                @csrf
                                @php
                                    $payable_amount = intval($cartTotal) * $razorpay->currency->currency_rate;
                                    $payable_amount = round($payable_amount, 2);
                                @endphp
                                <script src="https://checkout.razorpay.com/v1/checkout.js"
                                        data-key="{{ $razorpay->key }}"
                                        data-currency="{{ $razorpay->currency->currency_code }}"
                                        data-amount= "{{ $payable_amount * 100 }}"
                                        data-buttontext="{{__('user.Pay')}} {{ $payable_amount }} {{ $razorpay->currency->currency_code }}"
                                        data-name="{{ $razorpay->name }}"
                                        data-description="{{ $razorpay->description }}"
                                        data-image="{{ asset($razorpay->image) }}"
                                        data-prefill.name=""
                                        data-prefill.email=""
                                        data-theme.color="{{ $razorpay->color }}">
                                </script>
                                    <input type="hidden" name="total_amount" value="{{ $cartTotal }}">
                                    <input type="hidden" name="cart_qty" value="{{ $cartQty }}">
                                </form>
                            </li>
                            @endif
                            @if ($flutterwave->status == 1)
                            <li class="nav-item">
                                <button class="nav-link" onclick="flutterwavePayment()" data-bs-toggle="pill">
                                    <img src="{{ asset($flutterwave->logo) }}" alt="Degmark" class="img-fluis w-100">
                                </button>
                            </li>
                            @endif
                            @if ($bankPayment->status == 1)
                            <li class="nav-item">
                                <button class="nav-link" data-bs-toggle="modal" data-bs-target="#bankPayment">
                                    <img src="{{ asset($bankPayment->image) }}" alt="Degmark" class="img-fluis w-100">
                                </button>
                            </li>
                            @endif
                            @if ($sslcommerz->status == 1)
                            <li class="nav-item">
                                <form action="{{ url('/pay') }}" method="POST" class="needs-validation" id="sslForm">
                                    @csrf
                                    <input type="hidden" name="total_amount" value="{{ $cartTotal }}">
                                    <input type="hidden" name="cart_qty" value="{{ $cartQty }}">
                                </form>
                                <button class="nav-link" id="sslBtn" data-bs-toggle="pill">
                                    <img src="{{ asset($sslcommerz->image) }}" alt="Degmark" class="img-fluis w-100">
                                </button>
                            </li>
                            @endif
                        </ul>
                    </div>
                </div>

                <div class="col-xl-4 col-lg-5">
                    <div class="wsus__checkout_sidebar" id="sticky_sidebar">
                        <h3>{{__('user.Order Summary')}}</h3>
                        <ul>
                            @foreach ($carts as $cart)
                            <li>
                                <div class="img">
                                    <img src="{{ asset($cart->options->image) }}" alt="checkout" class="img-fluid w-100">
                                </div>
                                <div class="text">
                                    <a href="{{ route('product-detail', $cart->options->slug) }}">{{ html_decode($cart->name) }}</a>
                                    <p>{{__('user.Item by')}} {{ html_decode($cart->options->author) }}</p>
                                    <p>{{ $cart->options->size ? html_decode($cart->options->size):'' }}</p>
                                    <p> {{ $cart->options->price_type ? ucfirst(html_decode($cart->options->price_type)):''}}</p>
                                    <h3>
                                        @if (session()->get('currency_position') == 'right')
                                            {{ html_decode($cart->price * session()->get('currency_rate')) }}{{ session()->get('currency_icon') }}
                                        @else
                                            {{ session()->get('currency_icon') }}{{ html_decode($cart->price * session()->get('currency_rate')) }}
                                        @endif
                                    </h3>
                                </div>
                            </li>
                            @endforeach
                        </ul>
                        @if (Session::has('coupon'))
                        <div class="wsus__checkout_sidebar_price">
                            <p>{{__('user.Subtotal')}} 
                                <span>
                                    @if (session()->get('currency_position') == 'right')
                                        {{ html_decode($subTotal * session()->get('currency_rate')) }}{{ session()->get('currency_icon') }}
                                    @else
                                        {{ session()->get('currency_icon') }}{{ html_decode($subTotal * session()->get('currency_rate')) }}
                                    @endif
                                </span> 
                            </p>
                            <p>{{__('user.Discount')}} 
                                <span class="dis_amount">(-)
                                    @if (session()->get('currency_position') == 'right')
                                        {{ html_decode(session()->get('coupon')['discount_amount'] * session()->get('currency_rate')) }}{{ session()->get('currency_icon') }}
                                    @else
                                        {{ session()->get('currency_icon') }}{{ html_decode(session()->get('coupon')['discount_amount'] * session()->get('currency_rate')) }}
                                    @endif
                                </span> 
                            </p>
                            <p class="total">{{__('user.Total')}}  
                                <span>
                                    @if (session()->get('currency_position') == 'right')
                                        {{ html_decode(session()->get('coupon')['total_amount'] * session()->get('currency_rate')) }}{{ session()->get('currency_icon') }}
                                    @else
                                        {{ session()->get('currency_icon') }}{{ html_decode(session()->get('coupon')['total_amount'] * session()->get('currency_rate')) }}
                                    @endif
                                </span> 
                            </p>
                        </div>
                        @else
                        <div class="wsus__checkout_sidebar_price">
                            <p>{{__('user.Subtotal')}} 
                                <span>
                                    @if (session()->get('currency_position') == 'right')
                                        {{ html_decode($subTotal * session()->get('currency_rate')) }}{{ session()->get('currency_icon') }}
                                    @else
                                        {{ session()->get('currency_icon') }}{{ html_decode($subTotal * session()->get('currency_rate')) }}
                                    @endif
                                </span> 
                            </p>
                            <p>{{__('user.Discount')}} 
                                <span class="dis_amount">(-)
                                    @if (session()->get('currency_position') == 'right')
                                        {{ html_decode(0 * session()->get('currency_rate')) }}{{ session()->get('currency_icon') }}
                                    @else
                                        {{ session()->get('currency_icon') }}{{ html_decode(0 * session()->get('currency_rate')) }}
                                    @endif
                                </span> 
                            </p>
                            <p class="total">{{__('user.Total')}} 
                                <span>
                                    @if (session()->get('currency_position') == 'right')
                                        {{ html_decode($subTotal * session()->get('currency_rate')) }}{{ session()->get('currency_icon') }}
                                    @else
                                        {{ session()->get('currency_icon') }}{{ html_decode($subTotal * session()->get('currency_rate')) }}
                                    @endif
                                </span> 
                            </p>
                        </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        CHECKOUT END
    ==============================-->

    <!--=============================
        RELATED PRODICT START
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
        RELATED PRODICT END
    ==============================-->
    {{-- stripe modal --}}
    <!-- Button trigger modal -->
  <!-- Modal -->
  <div class="modal fade" id="stripeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">{{__('user.Pay via Stripe')}}</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            @php
                $stripe = App\Models\StripePayment::first();
            @endphp
          <form  role="form" action="{{route('pay-with-stripe')}}" method="post" 
          class="require-validation"
          data-cc-on-file="false"
          data-stripe-publishable-key="{{ $stripe->stripe_key }}"
          id="payment-form">
          @csrf
            <div class="row">
                <div class="col-md-12 mt-2">
                    <div class="form-group">
                        <label for="card_number">{{__('user.Card Number')}}*</label>
                        <input autocomplete='off' class='form-control card-number' size='20'
                        type='text' name="card_number" autocomplete="off">
                        <input type="hidden" name="total_amount" value="{{ $cartTotal }}">
                        <input type="hidden" name="cart_qty" value="{{ $cartQty }}">
                    </div>
                </div>
                <div class="col-md-12 mt-4">
                    <div class="form-group">
                        <label for="month">{{__('user.Month')}}*</label>
                        <input input
                        class='form-control card-expiry-month' size='2'
                        type='text' name="month" autocomplete="off">
                    </div>
                </div>
                <div class="col-md-12 mt-4">
                    <div class="form-group">
                        <label for="year">{{__('user.Year')}}*</label>
                        <input class='form-control card-expiry-year' size='4'
                        type='text' name="year" autocomplete="off">
                    </div>
                </div>
                <div class="col-md-12 my-4">
                    <div class="form-group">
                        <label for="cvc">{{__('user.CVC')}}*</label>
                        <input autocomplete='off'
                        class='form-control card-cvc' size='4'
                        type='text' name="cvc" autocomplete="off">
                    </div>
                </div>
              </div>
              <div class='row'>
                <div class='col-md-12 error d-none'>
                    <div class='alert-danger alert'>{{__('user.Please correct the errors and try
                        again')}}.</div>
                </div>
            </div>
            
           <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">{{__('user.Cancel')}}</button>
            <button class="btn btn-primary btn-block" type="submit">{{__('user.Payment')}}</button>
          </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  {{-- start bank payment modal --}}
    <div class="wsus__payment_modal modal fade" id="bankPayment" data-bs-backdrop="static" data-bs-keyboard="false"
    tabindex="-1" aria-labelledby="bankPaymentLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="bankPaymentLabel">{{__('user.Bank Payment')}}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form method="POST" action="{{ route('bank-payment') }}">
                        @csrf
                        <div class="row">
                            <div class="col-xl-12 mb-4">
                                <p>{!! clean(nl2br($bankPayment->account_info)) !!}</p>
                            </div>

                            <div class="col-xl-12">
                                <textarea required cols="3" rows="3" name="tnx_info"  placeholder="{{__('user.Type your transaction information')}}"></textarea>
                                <input type="hidden" name="total_amount" value="{{ $cartTotal }}">
                                <input type="hidden" name="cart_qty" value="{{ $cartQty }}">
                            </div>

                        </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">{{__('user.Close')}}</button>
                    <button type="submit" class="btn btn-danger">{{__('user.Submit')}}</button>
                </div>
                </form>
            </div>
        </div>
    </div>
{{-- end bank payment --}}
@endsection
@push('frontend_js')
<script>
    "use strict";
    $(document).ready(function(){
        $('#paypal').on('click',function(){
            $('#paypalForm').submit();
        });
        $('#rajorpay').on('click',function(){
            $('#rajorpayForm').submit();
        });

        $('#mollie').on('click',function(){
            $('#mollieForm').submit();
        });

        $('#instamojo').on('click',function(){
            $('#instamojoForm').submit();
        });
        $('#paystack').on('click',function(){
            $('#paystackForm').submit();
        });
        $('#sslBtn').on('click',function(){
            $('#sslForm').submit();
        });
    })
</script>


    

<script type="text/javascript" src="https://js.stripe.com/v2/"></script>
<script type="text/javascript">
  
$(function() {
    "use strict";
    /*------------------------------------------
    --------------------------------------------
    Stripe Payment Code
    --------------------------------------------
    --------------------------------------------*/
    
    var $form = $(".require-validation");
     
    $('form.require-validation').bind('submit', function(e) {
        var $form = $(".require-validation"),
        inputSelector = ['input[type=email]', 'input[type=password]',
                         'input[type=text]', 'input[type=file]',
                         'textarea'].join(', '),
        $inputs = $form.find('.required').find(inputSelector),
        $errorMessage = $form.find('div.error'),
        valid = true;
        $errorMessage.addClass('d-none');
    
        $('.has-error').removeClass('has-error');
        $inputs.each(function(i, el) {
          var $input = $(el);
          if ($input.val() === '') {
            $input.parent().addClass('has-error');
            $errorMessage.removeClass('d-none');
            e.preventDefault();
          }
        });
     
        if (!$form.data('cc-on-file')) {
          e.preventDefault();
          Stripe.setPublishableKey($form.data('stripe-publishable-key'));
          Stripe.createToken({
            number: $('.card-number').val(),
            cvc: $('.card-cvc').val(),
            exp_month: $('.card-expiry-month').val(),
            exp_year: $('.card-expiry-year').val()
          }, stripeResponseHandler);
        }
    
    });
      
    /*------------------------------------------
    --------------------------------------------
    Stripe Response Handler
    --------------------------------------------
    --------------------------------------------*/
    function stripeResponseHandler(status, response) {
        if (response.error) {
            $('.error')
                .removeClass('d-none')
                .find('.alert')
                .text(response.error.message);
        } else {
            /* token contains id, last4, and card type */
            var token = response['id'];
                 
            $form.find('input[type=text]').empty();
            $form.append("<input type='hidden' name='stripeToken' value='" + token + "'/>");
            $form.get(0).submit();
        }
    }
     
});
</script>
{{-- paystack start --}}


<script src="https://js.paystack.co/v1/inline.js"></script>
@php

    $public_key = $paystack->paystack_public_key;
    $currency = $paystack->paystackcurrency->currency_code;
    $currency = strtoupper($currency);
    $ngn_amount = $cartTotal  * $paystack->paystackcurrency->currency_rate;
    $ngn_amount = $ngn_amount * 100;
    $ngn_amount = round($ngn_amount);
    $user=Auth::guard('web')->user();
@endphp
<script>
"use strict";
function payWithPaystack(){
    var isDemo = "{{ env('APP_MODE') }}"
    if(isDemo == 'DEMO'){
        toastr.error('This Is Demo Version. You Can Not Change Anything');
        return;
    }
    var handler = PaystackPop.setup({
        key: '{{ $public_key }}',
        email: '{{ $user->email }}',
        amount: '{{ $ngn_amount }}',
        currency: "{{ $currency }}",
        callback: function(response){
        let reference = response.reference;
        let tnx_id = response.transaction;
        let _token = "{{ csrf_token() }}";
        $.ajax({
            type: "post",
            data: {reference, tnx_id, _token},
            url: "{{ url('pay-with-paystack') }}",
            success: function(response) {
                if(response.status == 'success'){
                    toastr.success(response.message);
                    window.location.href = "{{ route('payment-success') }}";
                }else{
                    toastr.error(response.message);
                    window.location.reload();
                }
            },
            error: function(response){
                    toastr.error('Server Error');
                    window.location.reload();
            }
        });
        },
        onClose: function(){
            alert('window closed');
        }
    });
    handler.openIframe();
}
</script>
<script src="https://checkout.flutterwave.com/v3.js"></script>
@php
    $payable_amount = $cartTotal * $flutterwave->currency->currency_rate;
    $payable_amount = round($payable_amount, 2);
@endphp
<script>
    "use strict";
    function flutterwavePayment() {

        var isDemo = "{{ env('APP_MODE') }}"
        if(isDemo == 'DEMO'){
            toastr.error('This Is Demo Version. You Can Not Change Anything');
            return;
        }

        
        FlutterwaveCheckout({
            public_key: "{{ $flutterwave->public_key }}",
            tx_ref: "RX1",
            amount: {{ $payable_amount }},
            currency: "{{ $flutterwave->currency->currency_code }}",
            country: "{{ $flutterwave->currency->country_code }}",
            payment_options: " ",
            customer: {
            email: "{{ $user->email }}",
            phone_number: "{{ $user->phone }}",
            name: "{{ $user->name }}",
            },
            callback: function (data) {

                var tnx_id = data.transaction_id;
                var _token = "{{ csrf_token() }}";
                $.ajax({
                    type: 'post',
                    data : {tnx_id,_token},
                    url: "{{ url('pay-with-flutterwave') }}",
                    success: function (response) {
                        if(response.status == 'success'){
                            toastr.success(response.message);
                            window.location.href = "{{ route('payment-success') }}";
                        }else{
                            toastr.error(response.message);
                            window.location.reload();
                        }
                    },
                    error: function(err) {

                    }
                });
            },
            customizations: {
            title: "{{ $flutterwave->title }}",
            logo: "{{ asset($flutterwave->logo) }}",
            },
        });
    }
</script>
{{-- end flutterwave payment --}}
@endpush
