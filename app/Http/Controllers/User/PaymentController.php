<?php

namespace App\Http\Controllers\User;

use Str;
use Auth;


use Cart;
use Mail;
use Session;
use Redirect;
use Exception;
use Carbon\Carbon;
use App\Models\Order;
use Razorpay\Api\Api;
use App\Models\Product;
use App\Models\Service;
use App\Models\Setting;
use App\Models\Language;
use App\Models\Schedule;


use App\Models\OrderItem;
Use Stripe;
use App\Helpers\MailHelper;
use App\Models\BankPayment;
use App\Models\Flutterwave;
use Illuminate\Http\Request;
use App\Models\EmailTemplate;
use App\Models\PaypalPayment;

use App\Models\StripePayment;


use App\Mail\OrderSuccessfully;
use App\Models\BreadcrumbImage;
use App\Models\PaymongoPayment;
use App\Models\RazorpayPayment;
use App\Models\InstamojoPayment;
use App\Models\AdditionalService;
use App\Models\PaystackAndMollie;
use Illuminate\Support\Facades\DB;
use Mollie\Laravel\Facades\Mollie;
use App\Models\AppointmentSchedule;
use App\Http\Controllers\Controller;

class PaymentController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:web');
    }

    public function translator(){
        $front_lang = Session::get('front_lang');
        $language = Language::where('is_default', 'Yes')->first();
        if($front_lang == ''){
            $front_lang = Session::put('front_lang', $language->lang_code);
        }
        config(['app.locale' => $front_lang]);
    }


    public function bankPayment(Request $request){
        $this->translator();
        if(env('APP_MODE') == 'DEMO'){
            $notification = trans('user_validation.This Is Demo Version. You Can Not Change Anything');
            $notification=array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->back()->with($notification);
        }

        $rules = [
            'tnx_info'=>'required',
        ];
        $customMessages = [
            'tnx_info.required' => trans('user_validation.Transaction is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $user=Auth::guard('web')->user();
                
        $order= new Order();
        $order->order_id=mt_rand(100000,999999);
        $order->user_id=$user->id;
        $order->name=$user->name;
        $order->email=$user->email;
        $order->phone=$user->phone;
        $order->total_amount=$request->total_amount;
        $order->payment_method='bank_acount';
        $order->payment_status='pending';
        $order->transection_id=$request->tnx_info;
        $order->order_status=0;
        $order->order_date=Carbon::now()->format('Y-m-d');
        $order->order_month=Carbon::now()->format('m');
        $order->order_year=Carbon::now()->format('Y');
        $order->cart_qty=$request->cart_qty;
        $order->save();
        $carts=Cart::content();
        

        foreach($carts as $cart){
            $product=Product::where('id', $cart->id)->first();
            $orderItem = new OrderItem();
            $orderItem->order_id=$order->id;
            $orderItem->product_id=$cart->id;
            $orderItem->author_id=$product->author_id;
            $orderItem->user_id=$user->id;
            $orderItem->product_type=$cart->options->product_type;
            $orderItem->price_type=$cart->options->price_type;
            $orderItem->variant_id=$cart->options->variant_id;
            $orderItem->variant_name=$cart->options->variant_name;
            $orderItem->price=$cart->price;
            $orderItem->qty=$cart->qty;
            $orderItem->save();
        }
        $this->sendMailToUser($user, $order);
        Cart::destroy();
        $notification = trans('user_validation.Your order has been submited, wait for admin approval');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->route('payment-success')->with($notification);
    }

    public function payWithStripe(Request $request){
        $this->translator();
        if(env('APP_MODE') == 'DEMO'){
            $notification = trans('user_validation.This Is Demo Version. You Can Not Change Anything');
            $notification=array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->back()->with($notification);
        }
    
        
        $stripe = StripePayment::first();
        Stripe\Stripe::setApiKey($stripe->stripe_secret);

        $result = Stripe\Charge::create ([
            "amount" => $request->total_amount * 100,
            "currency" => $stripe->currency->currency_code,
            "source" => $request->stripeToken,
            "description" => env('APP_NAME')
        ]);
        $user=Auth::guard('web')->user();

        $order = new Order();
        $order->order_id=mt_rand(100000,999999);
        $order->user_id=$user->id;
        $order->name=$user->name;
        $order->email=$user->email;
        $order->phone=$user->phone;
        $order->total_amount=$request->total_amount;
        $order->payment_method=$result->calculated_statement_descriptor;
        $order->payment_status='success';
        $order->transection_id=$result->balance_transaction;
        $order->currency_icon=$stripe->currency->currency_icon;
        $order->country_code=$stripe->currency->country_code;
        $order->currency_code=$stripe->currency->currency_code;
        $order->currency_rate=$stripe->currency->currency_rate;
        $order->order_status=1;
        $order->order_date=Carbon::now()->format('Y-m-d');
        $order->order_month=Carbon::now()->format('m');
        $order->order_year=Carbon::now()->format('Y');
        $order->cart_qty=$request->cart_qty;
        $order->save();

        $carts=Cart::content();

        foreach($carts as $cart){
            $product=Product::where('id', $cart->id)->first();
            $orderItem = new OrderItem();
            $orderItem->order_id=$order->id;
            $orderItem->product_id=$cart->id;
            $orderItem->author_id=$product->author_id;
            $orderItem->user_id=$user->id;
            $orderItem->product_type=$cart->options->product_type;
            $orderItem->price_type=$cart->options->price_type;
            $orderItem->variant_id=$cart->options->variant_id;
            $orderItem->variant_name=$cart->options->variant_name;
            $orderItem->price=$cart->price;
            $orderItem->qty=$cart->qty;
            $orderItem->save();
        }
        
    $this->sendMailToUser($user, $order);
    Cart::destroy();

    $notification = trans('user_validation.Thanks for your new order');
    $notification = array('messege'=>$notification,'alert-type'=>'success');
    return redirect()->route('payment-success')->with($notification);

    }

    public function payWithRazorpay(Request $request){
        $this->translator();
        if(env('APP_MODE') == 'DEMO'){
            $notification = trans('user_validation.This Is Demo Version. You Can Not Change Anything');
            $notification=array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->back()->with($notification);
        }

        $razorpay = RazorpayPayment::first();
        $input = $request->all();
        $api = new Api($razorpay->key,$razorpay->secret_key);
        $payment = $api->payment->fetch($input['razorpay_payment_id']);
        if(count($input)  && !empty($input['razorpay_payment_id'])) {
            try {
                $response = $api->payment->fetch($input['razorpay_payment_id'])->capture(array('amount'=>$payment['amount']));
                $payId = $response->id;
               
                $user=Auth::guard('web')->user();
                
                $order= new Order();
                $order->order_id=mt_rand(100000,999999);
                $order->user_id=$user->id;
                $order->name=$user->name;
                $order->email=$user->email;
                $order->phone=$user->phone;
                $order->total_amount=$request->total_amount;
                $order->payment_method='Razorpay';
                $order->payment_status='success';
                $order->transection_id=$payId;
                $order->country_code=$razorpay->currency->country_code;
                $order->currency_code=$razorpay->currency->currency_code;
                $order->currency_rate=$razorpay->currency->currency_rate;
                $order->order_status=1;
                $order->order_date=Carbon::now()->format('Y-m-d');
                $order->order_month=Carbon::now()->format('m');
                $order->order_year=Carbon::now()->format('Y');
                $order->cart_qty=$request->cart_qty;
                $order->save();
                $carts=Cart::content();
                
        
                foreach($carts as $cart){
                    $product=Product::where('id', $cart->id)->first();
                    $orderItem = new OrderItem();
                    $orderItem->order_id=$order->id;
                    $orderItem->product_id=$cart->id;
                    $orderItem->author_id=$product->author_id;
                    $orderItem->user_id=$user->id;
                    $orderItem->product_type=$cart->options->product_type;
                    $orderItem->price_type=$cart->options->price_type;
                    $orderItem->variant_id=$cart->options->variant_id;
                    $orderItem->variant_name=$cart->options->variant_name;
                    $orderItem->price=$cart->price;
                    $orderItem->qty=$cart->qty;
                    $orderItem->save();
                }
                $this->sendMailToUser($user, $order);
                Cart::destroy();
                $notification = trans('user_validation.Thanks for your new order');
                $notification = array('messege'=>$notification,'alert-type'=>'success');
                return redirect()->route('payment-success')->with($notification);

            }catch (Exception $e) {
                $notification = trans('user_validation.Payment Faild');
                $notification = array('messege'=>$notification,'alert-type'=>'error');
                return redirect()->back()->with($notification);
            }
        }else{
            $notification = trans('user_validation.Payment Faild');
            $notification = array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->back()->with($notification);
        }
    }

    public function payWithFlutterwave(Request $request){
        $this->translator();
        if(env('APP_MODE') == 'DEMO'){
            $notification = trans('user_validation.This Is Demo Version. You Can Not Change Anything');
            $notification=array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->back()->with($notification);
        }

        $flutterwave = Flutterwave::first();
        $curl = curl_init();
        $tnx_id = $request->tnx_id;
        $url = "https://api.flutterwave.com/v3/transactions/$tnx_id/verify";
        $token = $flutterwave->secret_key;
        curl_setopt_array($curl, array(
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => "",
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => "GET",
        CURLOPT_HTTPHEADER => array(
            "Content-Type: application/json",
            "Authorization: Bearer $token"
        ),
        ));

        $response = curl_exec($curl);

        curl_close($curl);
        $response = json_decode($response);
        if($response->status == 'success'){
            $user=Auth::guard('web')->user();
            $cartQty=Cart::count();
            $cartTotal=Cart::total();
            $order= new Order();
            $order->order_id=mt_rand(100000,999999);
            $order->user_id=$user->id;
            $order->name=$user->name;
            $order->email=$user->email;
            $order->phone=$user->phone;
            $order->total_amount=$cartTotal;
            $order->payment_method='Flutterwave';
            $order->payment_status='success';
            $order->transection_id=$tnx_id;
            $order->country_code=$flutterwave->currency->country_code;
            $order->currency_code=$flutterwave->currency->currency_code;
            $order->currency_rate=$flutterwave->currency->currency_rate;
            $order->order_status=1;
            $order->order_date=Carbon::now()->format('Y-m-d');
            $order->order_month=Carbon::now()->format('m');
            $order->order_year=Carbon::now()->format('Y');
            $order->cart_qty=$cartQty;
            $order->save();

            $carts=Cart::content();

            foreach($carts as $cart){
                $product=Product::where('id', $cart->id)->first();
                $orderItem = new OrderItem();
                $orderItem->order_id=$order->id;
                $orderItem->product_id=$cart->id;
                $orderItem->author_id=$product->author_id;
                $orderItem->user_id=$user->id;
                $orderItem->product_type=$cart->options->product_type;
                $orderItem->price_type=$cart->options->price_type;
                $orderItem->variant_id=$cart->options->variant_id;
                $orderItem->variant_name=$cart->options->variant_name;
                $orderItem->price=$cart->price;
                $orderItem->qty=$cart->qty;
                $orderItem->save();
            }
            $this->sendMailToUser($user, $order);
            Cart::destroy();
            $notification = trans('user_validation.Thanks for your new order');
            return response()->json(['status' => 'success' , 'message' => $notification]);
        }else{
            $notification = trans('user_validation.Payment Faild');
            return response()->json(['status' => 'faild' , 'message' => $notification]);
        }
    }

    public function payWithMollie(Request $request){
        $this->translator();
        if(env('APP_MODE') == 'DEMO'){
            $notification = trans('user_validation.This Is Demo Version. You Can Not Change Anything');
            $notification=array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->back()->with($notification);
        }

       $user = Auth::guard('web')->user();
        

        $mollie = PaystackAndMollie::first();
        $total_amount = $request->total_amount;
        $price = $total_amount * $mollie->molliecurrency->currency_rate;
        $price = round($price,2);
        $price = sprintf('%0.2f', $price);
        $mollie_api_key = $mollie->mollie_key;
        
        $currency = strtoupper($mollie->molliecurrency->currency_code);
        Mollie::api()->setApiKey($mollie_api_key);
        $payment = Mollie::api()->payments()->create([
            'amount' => [
                'currency' => $currency,
                'value' => ''.$price.'',
            ],
            'description' => env('APP_NAME'),
            'redirectUrl' => route('mollie-payment-success'),
        ]);
        $payment = Mollie::api()->payments()->get($payment->id);
        session()->put('payment_id',$payment->id);
        session()->put('total_amount',$total_amount);
        session()->put('cart_qty',$request->cart_qty);
        return redirect($payment->getCheckoutUrl(), 303);
    }

    public function molliePaymentSuccess(Request $request){
        $this->translator();
        $mollie = PaystackAndMollie::first();
        $mollie_api_key = $mollie->mollie_key;
        Mollie::api()->setApiKey($mollie_api_key);
        $payment = Mollie::api()->payments->get(session()->get('payment_id'));
        
        if ($payment->isPaid()){
        
            
        $user=Auth::guard('web')->user();
        $total_amount = Session::get('total_amount');
        $cart_qty = Session::get('cart_qty');
        $order= new Order();
        $order->order_id=mt_rand(100000,999999);
        $order->user_id=$user->id;
        $order->name=$user->name;
        $order->email=$user->email;
        $order->phone=$user->phone;
        $order->total_amount=$total_amount;
        $order->payment_method='Mollie';
        $order->payment_status='success';
        $order->transection_id=session()->get('payment_id');
        $order->country_code=$mollie->molliecurrency->country_code;
        $order->currency_code=$mollie->molliecurrency->currency_code;
        $order->currency_rate=$mollie->molliecurrency->currency_rate;
        $order->order_status=1;
        $order->order_date=Carbon::now()->format('Y-m-d');
        $order->order_month=Carbon::now()->format('m');
        $order->order_year=Carbon::now()->format('Y');
        $order->cart_qty=$cart_qty;
        $order->save();

        $carts=Cart::content();

        foreach($carts as $cart){
            $product=Product::where('id', $cart->id)->first();
            $orderItem = new OrderItem();
            $orderItem->order_id=$order->id;
            $orderItem->product_id=$cart->id;
            $orderItem->author_id=$product->author_id;
            $orderItem->user_id=$user->id;
            $orderItem->product_type=$cart->options->product_type;
            $orderItem->price_type=$cart->options->price_type;
            $orderItem->variant_id=$cart->options->variant_id;
            $orderItem->variant_name=$cart->options->variant_name;
            $orderItem->price=$cart->price;
            $orderItem->qty=$cart->qty;
            $orderItem->save();
        }
        Session::forget('payment_id');
        Session::forget('total_amount');
        Session::forget('cart_qty');
        $this->sendMailToUser($user, $order);
        Cart::destroy();
            $notification = trans('user_validation.Thanks for your new order');
            $notification = array('messege'=>$notification,'alert-type'=>'success');
            return redirect()->route('payment-success')->with($notification);
        }else{
            $notification = trans('user_validation.Payment Faild');
            $notification = array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->route('payment', $service->slug)->with($notification);
        }
    }

    public function payWithPayStack(Request $request){
        $this->translator();
        if(env('APP_MODE') == 'DEMO'){
            $notification = trans('user_validation.This Is Demo Version. You Can Not Change Anything');
            $notification=array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->back()->with($notification);
        }

        $paystack = PaystackAndMollie::first();

        $reference = $request->reference;
        $transaction = $request->tnx_id;
        $secret_key = $paystack->paystack_secret_key;
        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://api.paystack.co/transaction/verify/$reference",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_SSL_VERIFYHOST =>0,
            CURLOPT_SSL_VERIFYPEER =>0,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_HTTPHEADER => array(
                "Authorization: Bearer $secret_key",
                "Cache-Control: no-cache",
            ),
        ));
        $response = curl_exec($curl);
        $err = curl_error($curl);
        curl_close($curl);
        $final_data = json_decode($response);
        if($final_data->status == true) {
            $user=Auth::guard('web')->user();
            $cartQty=Cart::count();
            $cartTotal=Cart::total();
            $order= new Order();
            $order->order_id=mt_rand(100000,999999);
            $order->user_id=$user->id;
            $order->name=$user->name;
            $order->email=$user->email;
            $order->phone=$user->phone;
            $order->total_amount=$cartTotal;
            $order->payment_method='Paystack';
            $order->payment_status='success';
            $order->transection_id=$transaction;
            $order->country_code=$paystack->paystackcurrency->country_code;
            $order->currency_code=$paystack->paystackcurrency->currency_code;
            $order->currency_rate=$paystack->paystackcurrency->currency_rate;
            $order->order_status=1;
            $order->order_date=Carbon::now()->format('Y-m-d');
            $order->order_month=Carbon::now()->format('m');
            $order->order_year=Carbon::now()->format('Y');
            $order->cart_qty=$cartQty;
            $order->save();

            $carts=Cart::content();

            foreach($carts as $cart){
                $product=Product::where('id', $cart->id)->first();
                $orderItem = new OrderItem();
                $orderItem->order_id=$order->id;
                $orderItem->product_id=$cart->id;
                $orderItem->author_id=$product->author_id;
                $orderItem->user_id=$user->id;
                $orderItem->product_type=$cart->options->product_type;
                $orderItem->price_type=$cart->options->price_type;
                $orderItem->variant_id=$cart->options->variant_id;
                $orderItem->variant_name=$cart->options->variant_name;
                $orderItem->price=$cart->price;
                $orderItem->qty=$cart->qty;
                $orderItem->save();
            }
            $this->sendMailToUser($user, $order);
            Cart::destroy();
            $notification = trans('user_validation.Thanks for your new order');
            return response()->json(['status' => 'success' , 'message' => $notification]);
        }else{
            $notification = trans('user_validation.Payment Faild');
            return response()->json(['status' => 'faild' , 'message' => $notification]);
        }
    }


    public function payWithInstamojo(Request $request){
        $this->translator();
        if(env('APP_MODE') == 'DEMO'){
            $notification = trans('user_validation.This Is Demo Version. You Can Not Change Anything');
            $notification=array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->back()->with($notification);
        }

        $instamojoPayment = InstamojoPayment::first();
        $total_amount = $request->total_amount;
        $price = $total_amount * $instamojoPayment->currency->currency_rate;
        $price = round($price,2);
        
        $environment = $instamojoPayment->account_mode;
        $api_key = $instamojoPayment->api_key;
        $auth_token = $instamojoPayment->auth_token;

        if($environment == 'Sandbox') {
            $url = 'https://test.instamojo.com/api/1.1/';
        } else {
            $url = 'https://www.instamojo.com/api/1.1/';
        }

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $url.'payment-requests/');
        curl_setopt($ch, CURLOPT_HEADER, FALSE);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE);
        curl_setopt($ch, CURLOPT_HTTPHEADER,
            array("X-Api-Key:$api_key",
                "X-Auth-Token:$auth_token"));
        $payload = Array(
            'purpose' => env("APP_NAME"),
            'amount' => $price,
            'phone' => '918160651749',
            'buyer_name' => Auth::guard('web')->user()->name,
            'redirect_url' => route('response-instamojo'),
            'send_email' => true,
            'webhook' => 'http://www.example.com/webhook/',
            'send_sms' => true,
            'email' => Auth::guard('web')->user()->email,
            'allow_repeated_payments' => false
        );
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($payload));
        $response = curl_exec($ch);
        curl_close($ch);
        $response = json_decode($response);
        
        session()->put('total_amount',$total_amount);
        session()->put('cart_qty',$request->cart_qty);
        return redirect($response->payment_request->longurl);
    }

    public function instamojoResponse(Request $request){
        $this->translator();
        $input = $request->all();
        $instamojoPayment = InstamojoPayment::first();
        $environment = $instamojoPayment->account_mode;
        $api_key = $instamojoPayment->api_key;
        $auth_token = $instamojoPayment->auth_token;

        if($environment == 'Sandbox') {
            $url = 'https://test.instamojo.com/api/1.1/';
        } else {
            $url = 'https://www.instamojo.com/api/1.1/';
        }

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url.'payments/'.$request->get('payment_id'));
        curl_setopt($ch, CURLOPT_HEADER, FALSE);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE);
        curl_setopt($ch, CURLOPT_HTTPHEADER,
            array("X-Api-Key:$api_key",
                "X-Auth-Token:$auth_token"));
         $response = curl_exec($ch);
         $err = curl_error($ch);
        curl_close($ch);

        if ($err) {
            $notification = trans('user_validation.Payment Faild');
            $notification = array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->back()->with($notification);
        } else {
            $data = json_decode($response);
        }

        if($data->success == true) {
            if($data->payment->status == 'Credit') {
            $user=Auth::guard('web')->user();
            $total_amount = Session::get('total_amount');
            $cart_qty = Session::get('cart_qty');
            $order= new Order();
            $order->order_id=mt_rand(100000,999999);
            $order->user_id=$user->id;
            $order->name=$user->name;
            $order->email=$user->email;
            $order->phone=$user->phone;
            $order->total_amount=$total_amount;
            $order->payment_method='Instamojo';
            $order->payment_status='success';
            $order->transection_id=$data->payment->payment_id;
            $order->currency_rate=$instamojoPayment->currency->currency_rate;
            $order->order_status=1;
            $order->order_date=Carbon::now()->format('Y-m-d');
            $order->order_month=Carbon::now()->format('m');
            $order->order_year=Carbon::now()->format('Y');
            $order->cart_qty=$cart_qty;
            $order->save();

            $carts=Cart::content();

            foreach($carts as $cart){
                $product=Product::where('id', $cart->id)->first();
                $orderItem = new OrderItem();
                $orderItem->order_id=$order->id;
                $orderItem->product_id=$cart->id;
                $orderItem->author_id=$product->author_id;
                $orderItem->user_id=$user->id;
                $orderItem->product_type=$cart->options->product_type;
                $orderItem->price_type=$cart->options->price_type;
                $orderItem->variant_id=$cart->options->variant_id;
                $orderItem->variant_name=$cart->options->variant_name;
                $orderItem->price=$cart->price;
                $orderItem->qty=$cart->qty;
                $orderItem->save();
            }
            Session::forget('total_amount');
            Session::forget('cart_qty');
            $this->sendMailToUser($user, $order);
            Cart::destroy();

                $notification = trans('user_validation.Thanks for your new order');
                $notification = array('messege'=>$notification,'alert-type'=>'success');
                return redirect()->route('payment-success')->with($notification);
            }
        }else{
            $notification = trans('user_validation.Payment Faild');
            $notification = array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->route('payment', $service->slug)->with($notification);
        }
    }

    public function sendMailToUser($user, $order){
        MailHelper::setMailConfig();

        $setting = Setting::first();

        $template=EmailTemplate::where('id',8)->first();
        $subject=$template->subject;
        $message=$template->description;
        $message = str_replace('{{name}}',$user->name,$message);
        $message = str_replace('{{amount}}',$setting->currency_icon.$order->total_amount,$message);
        $message = str_replace('{{order_id}}',$order->order_id,$message);
        Mail::to($user->email)->send(new OrderSuccessfully($message,$subject));
    }


}
