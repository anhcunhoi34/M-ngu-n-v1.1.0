<?php

namespace App\Http\Controllers\User;

use Str;
use Auth;
use Cart;
use Mail;
use Session;
use Carbon\Carbon;
use PayPal\Api\Item;
use App\Models\Order;
use PayPal\Api\Payer;
use PayPal\Api\Amount;
use App\Models\Product;
use App\Models\Service;
use App\Models\Setting;

use PayPal\Api\Details;
use PayPal\Api\Payment;
use App\Models\Language;
use PayPal\Api\ItemList;
use App\Models\OrderItem;
use App\Helpers\MailHelper;
use PayPal\Api\Transaction;
use PayPal\Rest\ApiContext;
use Illuminate\Http\Request;

use PayPal\Api\RedirectUrls;
use App\Models\EmailTemplate;
use App\Models\PaypalPayment;
use App\Mail\OrderSuccessfully;
use App\Models\BreadcrumbImage;
use PayPal\Api\PaymentExecution;
use App\Models\AdditionalService;
use App\Http\Controllers\Controller;
use PayPal\Auth\OAuthTokenCredential;


class PaypalController extends Controller
{
    private $apiContext;
    public function __construct()
    {
        $account = PaypalPayment::first();
        $paypal_conf = \Config::get('paypal');
        $this->apiContext = new ApiContext(new OAuthTokenCredential(
            $account->client_id,
            $account->secret_id,
            )
        );

        $setting=array(
            'mode' => $account->account_mode,
            'http.ConnectionTimeOut' => 30,
            'log.LogEnabled' => true,
            'log.FileName' => storage_path() . '/logs/paypal.log',
            'log.LogLevel' => 'ERROR'
        );
        $this->apiContext->setConfig($setting);
    }

    public function translator(){
        $front_lang = Session::get('front_lang');
        $language = Language::where('is_default', 'Yes')->first();
        if($front_lang == ''){
            $front_lang = Session::put('front_lang', $language->lang_code);
        }
        config(['app.locale' => $front_lang]);
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
    
    public function payWithPaypal(Request $request){
        $this->translator();
        if(env('APP_MODE') == 'DEMO'){
            $notification = trans('user_validation.This Is Demo Version. You Can Not Change Anything');
            $notification=array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->back()->with($notification);
        }

        $user = Auth::guard('web')->user();

        $client_id = $user->id;
        $total_price = $request->total_amount;

        $paypalSetting = PaypalPayment::first();
        $payableAmount = round($total_price * $paypalSetting->currency->currency_rate,2);

        $name=env('APP_NAME');

        // set payer
        $payer = new Payer();
        $payer->setPaymentMethod("paypal");

        // set amount total
        $amount = new Amount();
        $amount->setCurrency($paypalSetting->currency->currency_code)
            ->setTotal($payableAmount);

        // transaction
        $transaction = new Transaction();
        $transaction->setAmount($amount)
            ->setDescription(env('APP_NAME'));

        // redirect url
        $redirectUrls = new RedirectUrls();

        $root_url=url('/');
        $redirectUrls->setReturnUrl(route('paypal-payment-success'))
            ->setCancelUrl(route('paypal-payment-cancled'));

        // payment
        $payment = new Payment();
        $payment->setIntent("sale")
            ->setPayer($payer)
            ->setRedirectUrls($redirectUrls)
            ->setTransactions(array($transaction));
        try {
            $payment->create($this->apiContext);
        } catch (\PayPal\Exception\PPConnectionException $ex) {

            $notification = trans('user_validation.Payment Faild');
            $notification = array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->back()->with($notification);
        }

        // get paymentlink
        $approvalUrl = $payment->getApprovalLink();

        session()->put('total_amount',$total_price);
        session()->put('cart_qty',$request->cart_qty);

        return redirect($approvalUrl);
    }

    public function paypalPaymentSuccess(Request $request){
        $this->translator();
        Session::put('return_from_mollie','payment_faild');
        $total_amount = Session::get('total_amount');
        $cart_qty = Session::get('cart_qty');
        $paypalSetting = PaypalPayment::first();
        if (empty($request->get('PayerID')) || empty($request->get('token'))) {
            $notification = trans('user_validation.Payment Faild');
            $notification = array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->route('payment', $service->slug)->with($notification);
        }

        $payment_id=$request->get('paymentId');
        $payment = Payment::get($payment_id, $this->apiContext);
        $execution = new PaymentExecution();
        $execution->setPayerId($request->get('PayerID'));
        /**Execute the payment **/
        $result = $payment->execute($execution, $this->apiContext);
        if ($result->getState() == 'approved') {
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
            $order->payment_method='Paypal';
            $order->payment_status='success';
            $order->transection_id=$result->id;
            $order->country_code=$paypalSetting->currency->country_code;
            $order->currency_code=$paypalSetting->currency->currency_code;
            $order->currency_rate=$paypalSetting->currency->currency_rate;
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
    }

    public function paypalPaymentCancled(){
        $this->translator();
        $notification = trans('user_validation.Payment Faild');
        $notification = array('messege'=>$notification,'alert-type'=>'error');
        return redirect()->route('payment', $service->slug)->with($notification);
    }


    public function createOrder($user, $service, $order_info, $provider_id, $client_id, $payment_method, $payment_status, $tnx_info){
        
        $extra_services = json_decode($order_info->extras);
        $additional_amount = $order_info->extra_price;
        $additional_services = array();
        if($extra_services->ids){
            foreach($extra_services->ids as $index => $extra_service){
                $addition = AdditionalService::find($extra_services->ids[$index]);
                $single_extra_service = array(
                    'service_name' => $extra_services->names[$index],
                    'qty' => $extra_services->quantities[$index],
                    'price' => ($extra_services->quantities[$index] * $addition->price),
                );
                $additional_services[] = $single_extra_service;
            }
        }


        $order_additional_services = json_encode($additional_services);
        $order_note = $order_info->customer->order_note;
        $client_address = $order_info->customer;

        $order = new Order();
        $order->order_id = substr(rand(0,time()),0,10);
        $order->booking_date = $order_info->date;
        $order->client_id = $client_id;
        $order->provider_id = $provider_id;
        $order->service_id = $service->id;
        $order->package_amount = $service->price;
        $order->additional_amount = $additional_amount;
        $order->total_amount = ($service->price + $additional_amount);
        $order->payment_method = $payment_method;
        $order->transection_id = $tnx_info;
        $order->payment_status = $payment_status;
        $order->order_status = 'awaiting_for_provider_approval';
        $order->package_features = $service->package_features;
        $order->additional_services = $order_additional_services;
        $order->order_note = $order_note;
        $order->client_address = json_encode($client_address);
        $order->save();

        return $order;
    }


    public function sendMailToClient($user, $order){
        MailHelper::setMailConfig();

        $setting = Setting::first();

        $template=EmailTemplate::where('id',8)->first();
        $subject=$template->subject;
        $message=$template->description;
        $message = str_replace('{{name}}',$user->name,$message);
        $message = str_replace('{{amount}}',$setting->currency_icon.$order->total_amount,$message);
        $message = str_replace('{{schedule_date}}',$order->booking_date,$message);
        $message = str_replace('{{order_id}}',$order->order_id,$message);
        Mail::to($user->email)->send(new OrderSuccessfully($message,$subject));
    }

    public function sendMailToProvider($provider, $order){
        MailHelper::setMailConfig();

        $setting = Setting::first();

        $template=EmailTemplate::where('id',9)->first();
        $subject=$template->subject;
        $message=$template->description;
        $message = str_replace('{{name}}',$provider->name,$message);
        $message = str_replace('{{amount}}',$setting->currency_icon.$order->total_amount,$message);
        $message = str_replace('{{schedule_date}}',$order->booking_date,$message);
        $message = str_replace('{{order_id}}',$order->order_id,$message);
        Mail::to($provider->email)->send(new OrderSuccessfully($message,$subject));
    }


}
