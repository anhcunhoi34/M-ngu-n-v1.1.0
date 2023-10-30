<?php

namespace App\Http\Controllers;

use Auth;
use Session;
use Carbon\Carbon;
use App\Models\Coupon;
use App\Models\Product;
use App\Models\Setting;
use App\Models\Language;
use App\Models\BankPayment;
use App\Models\Flutterwave;
use Illuminate\Http\Request;
use App\Models\PaypalPayment;
use App\Models\StripePayment;
use App\Models\RazorpayPayment;
use App\Models\InstamojoPayment;
use App\Models\PaystackAndMollie;
use App\Models\SslcommerzPayment;
use Gloudemans\Shoppingcart\Facades\Cart;

class CartController extends Controller
{
    public function translator(){
        $front_lang = Session::get('front_lang');
        $language = Language::where('is_default', 'Yes')->first();
        if($front_lang == ''){
            $front_lang = Session::put('front_lang', $language->lang_code);
        }
        config(['app.locale' => $front_lang]);
    }

    public function addToCart(Request $request, $product_id){
        $this->translator();
        if(Session::has('coupon')){
            Session::forget('coupon');
         }
        $product=Product::findOrFail($product_id);
        $itemExist = false;
        $cartContents = Cart::content();
        if($product->product_type=='script'){
            foreach($cartContents as $cartContent){
                if($cartContent->id == $product_id && $cartContent->options->price_type == $request->price_type) {
                    $itemExist = true;
                }
            }
            if($itemExist) {
                $notification = trans('user_validation.Item already exist');
                return response()->json(['status' => 0, 'message' => $notification]);
            }
            if($request->price_type=='regular price'){
                Cart::add([
                    'id' => $product_id, 
                    'name' => $request->product_name,
                    'qty' => 1,
                    'price' => $request->regular_price,
                    'weight' => 550,
                    'options' => [
                        'variant_id' => $request->variant_id,
                        'variant_name' => $request->variant_name,
                        'category' => $request->category_name,
                        'category_id' => $request->category_id,
                        'product_type'=> $request->product_type,
                        'price_type'=> $request->price_type,
                        'image'=> $request->product_image,
                        'author'=> $request->author_name,
                        'author_id'=> $request->author_id,
                        'slug'=> $request->slug,
                        ]
                ]);
                $notification = trans('user_validation.Product added successfully');
                return response()->json(['status' => 1, 'message' => $notification]);
            }else{
                
                Cart::add([
                    'id' => $product_id, 
                    'name' => $request->product_name,
                    'qty' => 1, 
                    'price' => $request->extend_price, 
                    'weight' => 550,
                    'options' => [
                        'variant_id' => $request->variant_id,
                        'variant_name' => $request->variant_name,
                        'category' => $request->category_name,
                        'category_id' => $request->category_id,
                        'product_type'=> $request->product_type,
                        'price_type'=> $request->price_type,
                        'image'=> $request->product_image,
                        'author'=> $request->author_name,
                        'author_id'=> $request->author_id,
                        'slug'=> $request->slug,
                        ]
                ]);
                $notification = trans('user_validation.Product added successfully');
                return response()->json(['status' => 1, 'message' => $notification]);
            }
        }else{
            foreach($cartContents as $cartContent){
                if($cartContent->id == $request->product_id && $cartContent->options->variant_id == $request->variant_id) {
                    $itemExist = true;
                }
            }
    
            $productStock = Product::find($request->product_id);
    
            if($itemExist) {
                $notification = trans('user_validation.Item already exist');
                return response()->json(['status' => 0, 'message' => $notification]);
            }
            Cart::add([
                'id' => $product_id, 
                'name' => $request->product_name,
                'qty' => 1, 
                'price' => $request->price, 
                'weight' => 550,
                'options' => [
                    'variant_id' => $request->variant_id,
                    'variant_name' => $request->variant_name,
                    'category' => $request->category_name,
                    'category_id' => $request->category_id,
                    'product_type'=> $request->product_type,
                    'price_type'=> $request->price_type,
                    'image'=> $request->product_image,
                    'author'=> $request->author_name,
                    'author_id'=> $request->author_id,
                    'slug'=> $request->slug,
                ]
            ]);
            $notification = trans('user_validation.Product added successfully');
            return response()->json(['status' => 1, 'message' => $notification]);
        }
    }

    public function miniCart(){
        $cartQty=Cart::count();
        return response()->json([
            'cartQty' => $cartQty,
        ]);
    }

    public function cartView(){
        $this->translator();
        $active_theme = 'layout2';
        $setting=Setting::first();
        $carts=Cart::content();
        $product_arr=[];
        foreach($carts as $cart){
            $product_arr[]=$cart->id;
        }
        $products=Product::whereIn('id', $product_arr)->groupBy('category_id')->select('category_id')->get();
        $category_arr=[];
        foreach($products as $product){
            $category_arr[]=$product->category_id;
        }
        $related_products=Product::with('category', 'author', 'variants')->whereIn('category_id', $category_arr)->whereNotIn('id', $product_arr)->where('status', 1)->get()->take(3);
        return view('cart_view')->with([
            'active_theme' => $active_theme,
            'setting' => $setting,
            'carts' => $carts,
            'related_products' =>$related_products,
        ]);
    }

    public function cartItem(){
        $setting=Setting::first();
        $carts=Cart::content();
        $cartQty=Cart::count();
        $cartTotal=Cart::total();
        $currencyPosition= session()->get('currency_position');
        $currencyIcon= session()->get('currency_icon');
        $currencyRate= session()->get('currency_rate');
        return response()->json([
            'carts' => $carts,
            'cartQty' => $cartQty,
            'cartTotal' => $cartTotal,
            'setting' => $setting,
            'currencyPosition' => $currencyPosition,
            'currencyIcon' => $currencyIcon,
            'currencyRate' => $currencyRate,
        ]);
    }

    public function cartRemove($rowId){
        $this->translator();
        $cart=Cart::remove($rowId);
        if(Session::has('coupon')){
            $coupon_name =  Session()->get('coupon')['coupon_name'];
            $coupon = Coupon::where('coupon_name', $coupon_name)->first();
            Session::put('coupon', [
                'coupon_name'=>$coupon->coupon_name,
                'coupon_discount'=>$coupon->coupon_discount,
                'discount_amount'=>round(Cart::totalFloat() * (int)$coupon->coupon_discount / 100, 2),
                'total_amount'=>round(Cart::totalFloat() - Cart::totalFloat() * (int)$coupon->coupon_discount / 100, 2),
            ]);
        }
        $notification = trans('user_validation.Product removed successfully');
        return response()->json(['status' => 1, 'message' => $notification]);
    }

    public function couponApply(Request $request){
        $this->translator();
        $coupon = Coupon::where('coupon_name', $request->coupon_name)->where('coupon_validity','>=', Carbon::now()->format('Y-m-d'))->where('status', 1)->first();
     if($coupon){
        Session::put('coupon', [
            'coupon_name'=>$coupon->coupon_name,
            'coupon_discount'=>$coupon->coupon_discount,
            'discount_amount'=>round(Cart::totalFloat() * (int)$coupon->coupon_discount / 100, 2),
            'total_amount'=>round(Cart::totalFloat() - Cart::totalFloat() * (int)$coupon->coupon_discount / 100, 2)
        ]);
        $notification = trans('user_validation.Coupon apply successfully');
        return response()->json(['status' => 1, 'message' => $notification]);
     }else{
        $notification = trans('user_validation.Invalid coupon');
        return response()->json(['status' => 0, 'message' => $notification]);
     }
    }

    public function couponCalculation(){
        $this->translator();
        $setting=Setting::select('currency_icon')->first();
        $cartTotal = str_replace(',', '', Cart::total());
        $currencyPosition= session()->get('currency_position');
        $currencyIcon= session()->get('currency_icon');
        if(Session::has('coupon')){
            return response()->json(array(
                'sub_total' => $cartTotal * session()->get('currency_rate'),
                'coupon_name' =>  Session()->get('coupon')['coupon_name'],
                'discount_amount' =>  round(Session()->get('coupon')['discount_amount'] * session()->get('currency_rate'), 2),
                'total_amount' =>  round(Session()->get('coupon')['total_amount'] * session()->get('currency_rate'), 2),
                'setting' =>  $setting,
                'currencyPosition' =>  $currencyPosition,
                'currencyIcon' =>  $currencyIcon,
            ));
        }else{
            return response()->json(array(
                'sub_total' => $cartTotal * session()->get('currency_rate'),
                'setting' =>  $setting,
                'currencyPosition' =>  $currencyPosition,
                'currencyIcon' =>  $currencyIcon,
              ));
        }
    }

    //remove coupon
    public function couponRemove(){
        $this->translator();
        Session::forget("coupon");
        $notification = trans('user_validation.Coupon remove successfully');
        return response()->json(['status' => 1, 'message' => $notification]);
    }

    public function checkout(){
        $this->translator();
        if(Auth::guard('web')->check()){
            if(Cart::total()>0){
                $personalCarts=Cart::content();
                $author_id_arr=[];
                foreach($personalCarts as $item){
                    $author_id_arr[] = $item->options->author_id;
                }

                $author_id_arr = array_unique($author_id_arr);
                $user_id = Auth::guard('web')->user()->id;
                $is_id=in_array($user_id, $author_id_arr);
                
                if(!$is_id){
                    $active_theme = 'layout2';
                    $setting=Setting::first();
                    $carts=Cart::content();
                    $cartQty=Cart::count();
                    $subTotal = str_replace(',', '', Cart::total());
                    if(Session::has('coupon')){
                        $cartTotal = Session()->get('coupon')['total_amount'];
                    }else{
                        $cartTotal = str_replace(',', '', Cart::total());
                    }
                    $product_arr=[];
                    foreach($carts as $cart){
                        $product_arr[]=$cart->id;
                    }
                    $products=Product::whereIn('id', $product_arr)->groupBy('category_id')->select('category_id')->get();
                    $category_arr=[];
                    foreach($products as $product){
                        $category_arr[]=$product->category_id;
                    }
                    $related_products=Product::with('category', 'author', 'variants')->whereIn('category_id', $category_arr)->whereNotIn('id', $product_arr)->where('status', 1)->get()->take(3);
                    $paypal = PaypalPayment::first();
                    $stripe = StripePayment::first();
                    $razorpay = RazorpayPayment::first();
                    $paystack = PaystackAndMollie::first();
                    $mollie = PaystackAndMollie::first();
                    $instamojo = InstamojoPayment::first();
                    $flutterwave = Flutterwave::first();
                    $bankPayment = BankPayment::first();
                    $sslcommerz = SslcommerzPayment::first();
                    return view('checkout')->with([
                        'active_theme' => $active_theme,
                        'setting' => $setting,
                        'carts' => $carts,
                        'cartQty' => $cartQty,
                        'subTotal' => $subTotal,
                        'cartTotal' => $cartTotal,
                        'paypal' => $paypal,
                        'stripe' => $stripe,
                        'razorpay' => $razorpay,
                        'related_products' => $related_products,
                        'paystack' => $paystack,
                        'mollie' => $mollie,
                        'instamojo' => $instamojo,
                        'flutterwave' => $flutterwave,
                        'bankPayment' => $bankPayment,
                        'sslcommerz' => $sslcommerz,
                    ]);
                }else{
                    $notification = trans("user_validation.You can not purchase personal product");
                    $notification=array('messege'=>$notification,'alert-type'=>'error');
                    return back()->with($notification);
                }
            }else{
                $notification = trans('user_validation.Cart is empty');
                $notification=array('messege'=>$notification,'alert-type'=>'error');
                return redirect()->route('products')->with($notification);
            }
        }else{
            $notification = trans('user_validation.Need to login first');
            $notification=array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->route('login')->with($notification);
        }
    }
}
