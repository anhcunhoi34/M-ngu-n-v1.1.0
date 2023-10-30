<?php

namespace App\Http\Controllers;

use DB;
use Auth;
use Session;
use App\Models\Product;
use App\Models\Setting;
use App\Models\Language;
use App\Models\OrderItem;
use App\Helpers\MailHelper;
use Illuminate\Http\Request;
use App\Models\EmailTemplate;
use App\Mail\OrderSuccessfully;
use App\Models\SslcommerzPayment;
use Illuminate\Support\Facades\Mail;
use Gloudemans\Shoppingcart\Facades\Cart;
use App\Library\SslCommerz\SslCommerzNotification;

class SslCommerzPaymentController extends Controller
{

    public function translator(){
        $front_lang = Session::get('front_lang');
        $language = Language::where('is_default', 'Yes')->first();
        if($front_lang == ''){
            $front_lang = Session::put('front_lang', $language->lang_code);
        }
        config(['app.locale' => $front_lang]);
    }

    public function exampleEasyCheckout()
    {
        return view('exampleEasycheckout');
    }

    public function exampleHostedCheckout()
    {
        return view('exampleHosted');
    }

    public function sendMailToUser($user, $order){
        MailHelper::setMailConfig();

        $sslcommerz=SslcommerzPayment::first();
        $setting = Setting::first();

        $template=EmailTemplate::where('id',8)->first();
        $subject=$template->subject;
        $message=$template->description;
        $message = str_replace('{{name}}',$user->name,$message);
        $message = str_replace('{{amount}}',$sslcommerz->currency->currency_icon.$order->total_amount * $sslcommerz->currency->currency_rate,$message);
        $message = str_replace('{{order_id}}',$order->order_id,$message);
        Mail::to($user->email)->send(new OrderSuccessfully($message,$subject));
    }

    public function index(Request $request)
    {
        # Here you have to receive all the order data to initate the payment.
        # Let's say, your oder transaction informations are saving in a table called "orders"
        # In "orders" table, order unique identity is "transaction_id". "status" field contain status of the transaction, "amount" is the order amount to be paid and "currency" is for storing Site Currency which will be checked with paid currency.
        $sslcommerz=SslcommerzPayment::first();
        $user=Auth::guard('web')->user();
        $post_data = array();
        $post_data['total_amount'] = $request->total_amount * $sslcommerz->currency->currency_rate; # You cant not pay less than 10
        $post_data['currency'] = $sslcommerz->currency->currency_code;
        $post_data['currency_rate'] = $sslcommerz->currency->currency_rate;
        $post_data['tran_id'] = uniqid(); // tran_id must be unique


        # CUSTOMER INFORMATION
        $post_data['cus_name'] = $user->name;
        $post_data['cus_email'] = $user->email;
        $post_data['cus_add1'] = 'Customer Address';
        $post_data['cus_add2'] = "";
        $post_data['cus_city'] = "";
        $post_data['cus_state'] = "";
        $post_data['cus_postcode'] = "";
        $post_data['cus_country'] = $sslcommerz->currency->country_code;
        $post_data['cus_phone'] = $user->phone;
        $post_data['cus_fax'] = "";
        $post_data['order_id'] = mt_rand(100000,999999);
        $post_data['user_id'] = $user->id;
        $post_data['payment_method'] = 'sslcommerz';
        $post_data['payment_status'] = 'pending';
        $post_data['currency_icon'] = '$';
        $post_data['order_status'] = 0;
        $post_data['order_date'] = 0;
        $post_data['order_month'] = 0;
        $post_data['order_year'] = 0;
        $post_data['cart_qty'] = $request->cart_qty;

        # SHIPMENT INFORMATION
        $post_data['ship_name'] = "Store Test";
        $post_data['ship_add1'] = "Dhaka";
        $post_data['ship_add2'] = "Dhaka";
        $post_data['ship_city'] = "Dhaka";
        $post_data['ship_state'] = "Dhaka";
        $post_data['ship_postcode'] = "1000";
        $post_data['ship_phone'] = "";
        $post_data['ship_country'] = "Bangladesh";

        $post_data['shipping_method'] = "NO";
        $post_data['product_name'] = "Computer";
        $post_data['product_category'] = "Goods";
        $post_data['product_profile'] = "physical-goods";

        # OPTIONAL PARAMETERS
        $post_data['value_a'] = "ref001";
        $post_data['value_b'] = "ref002";
        $post_data['value_c'] = "ref003";
        $post_data['value_d'] = "ref004";

        #Before  going to initiate the payment order status need to insert or update as Pending.
        $update_product = DB::table('orders')
            ->where('transection_id', $post_data['tran_id'])
            ->updateOrInsert([
                'order_id' => $post_data['order_id'],
                'user_id' => $post_data['user_id'],
                'name' => $post_data['cus_name'],
                'email' => $post_data['cus_email'],
                'phone' => $post_data['cus_phone'],
                'payment_method' => $post_data['payment_method'],
                'payment_status' => $post_data['payment_status'] ,
                'currency_icon' => $post_data['currency_icon'],
                'order_date' => $post_data['order_date'],
                'order_month' => $post_data['order_month'],
                'order_year' => $post_data['order_year'],
                'cart_qty' => $post_data['cart_qty'],
                'total_amount' => $post_data['total_amount'] / $sslcommerz->currency->currency_rate,
                'order_status' => $post_data['order_status'],
                'transection_id' => $post_data['tran_id'],
                'currency_code' => $post_data['currency'],
                'currency_rate' => $post_data['currency_rate'],
                'country_code' => $post_data['cus_country']
            ]);
        $sslc = new SslCommerzNotification();
        # initiate(Transaction Data , false: Redirect to SSLCOMMERZ gateway/ true: Show all the Payement gateway here )
        $payment_options = $sslc->makePayment($post_data, 'hosted');

        if (!is_array($payment_options)) {
            print_r($payment_options);
            $payment_options = array();
        }

    }

    public function payViaAjax(Request $request)
    {

        # Here you have to receive all the order data to initate the payment.
        # Lets your oder trnsaction informations are saving in a table called "orders"
        # In orders table order uniq identity is "transaction_id","status" field contain status of the transaction, "amount" is the order amount to be paid and "currency" is for storing Site Currency which will be checked with paid currency.

        $post_data = array();
        $post_data['total_amount'] = '10'; # You cant not pay less than 10
        $post_data['currency'] = "BDT";
        $post_data['tran_id'] = uniqid(); // tran_id must be unique

        # CUSTOMER INFORMATION
        $post_data['cus_name'] = 'Customer Name';
        $post_data['cus_email'] = 'customer@mail.com';
        $post_data['cus_add1'] = 'Customer Address';
        $post_data['cus_add2'] = "";
        $post_data['cus_city'] = "";
        $post_data['cus_state'] = "";
        $post_data['cus_postcode'] = "";
        $post_data['cus_country'] = "Bangladesh";
        $post_data['cus_phone'] = '8801XXXXXXXXX';
        $post_data['cus_fax'] = "";

        # SHIPMENT INFORMATION
        $post_data['ship_name'] = "Store Test";
        $post_data['ship_add1'] = "Dhaka";
        $post_data['ship_add2'] = "Dhaka";
        $post_data['ship_city'] = "Dhaka";
        $post_data['ship_state'] = "Dhaka";
        $post_data['ship_postcode'] = "1000";
        $post_data['ship_phone'] = "";
        $post_data['ship_country'] = "Bangladesh";

        $post_data['shipping_method'] = "NO";
        $post_data['product_name'] = "Computer";
        $post_data['product_category'] = "Goods";
        $post_data['product_profile'] = "physical-goods";

        # OPTIONAL PARAMETERS
        $post_data['value_a'] = "ref001";
        $post_data['value_b'] = "ref002";
        $post_data['value_c'] = "ref003";
        $post_data['value_d'] = "ref004";


        #Before  going to initiate the payment order status need to update as Pending.
        $update_product = DB::table('orders')
            ->where('transaction_id', $post_data['tran_id'])
            ->updateOrInsert([
                'name' => $post_data['cus_name'],
                'email' => $post_data['cus_email'],
                'phone' => $post_data['cus_phone'],
                'amount' => $post_data['total_amount'],
                'status' => 'Pending',
                'address' => $post_data['cus_add1'],
                'transaction_id' => $post_data['tran_id'],
                'currency' => $post_data['currency']
            ]);

        $sslc = new SslCommerzNotification();
        # initiate(Transaction Data , false: Redirect to SSLCOMMERZ gateway/ true: Show all the Payement gateway here )
        $payment_options = $sslc->makePayment($post_data, 'checkout', 'json');

        if (!is_array($payment_options)) {
            print_r($payment_options);
            $payment_options = array();
        }

    }

    public function success(Request $request)
    {
        $this->translator();
        echo "Transaction is Successful";

        $tran_id = $request->input('tran_id');
        $amount = $request->input('amount');
        $currency = $request->input('currency');

        $sslc = new SslCommerzNotification();

        #Check order status in order tabel against the transaction id or order id.
        $order_details = DB::table('orders')
            ->where('transection_id', $tran_id)
            ->select('id', 'transection_id', 'order_status', 'currency_code', 'total_amount', 'order_id')->first();
        
        if ($order_details->order_status == 0) {
            $validation = $sslc->orderValidate($request->all(), $tran_id, $amount, $currency);
            
            if ($validation) {
                /*
                That means IPN did not work or IPN URL was not set in your merchant panel. Here you need to update order status
                in order table as Processing or Complete.
                Here you can also sent sms or email for successfull transaction to customer
                */
                $update_product = DB::table('orders')
                    ->where('transection_id', $tran_id)
                    ->update(['order_status' => 1, 'payment_status' => 'success']);

            $carts=Cart::content();
            $user=Auth::guard('web')->user();
            
            foreach($carts as $cart){
                $product=Product::where('id', $cart->id)->first();
                $orderItem = new OrderItem();
                $orderItem->order_id=$order_details->id;
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
            $this->sendMailToUser($user, $order_details);
            Cart::destroy();
            $notification = trans('user_validation.Thanks for your new order');
            $notification = array('messege'=>$notification,'alert-type'=>'success');
            return redirect()->route('payment-success')->with($notification);
            }
        } else if ($order_details->order_status == 'Processing' || $order_details->order_status == 'Complete') {
            /*
             That means through IPN Order status already updated. Now you can just show the customer that transaction is completed. No need to udate database.
             */
            echo "Transaction is successfully Completed";
        } else {
            #That means something wrong happened. You can redirect customer to your product page.
            echo "Invalid Transaction";
        }


    }

    public function fail(Request $request)
    {
        $this->translator();
        $notification = trans('user_validation.Payment Failed!');
        $notification = array('messege'=>$notification,'alert-type'=>'error');
        return back()->with($notification);
    }

    public function cancel(Request $request)
    {
        $this->translator();
        $notification = trans('user_validation.Payment Canceled!');
        $notification = array('messege'=>$notification,'alert-type'=>'error');
        return back()->with($notification);
    }

    public function ipn(Request $request)
    {
        #Received all the payement information from the gateway
        if ($request->input('tran_id')) #Check transation id is posted or not.
        {

            $tran_id = $request->input('tran_id');

            #Check order status in order tabel against the transaction id or order id.
            $order_details = DB::table('orders')
                ->where('transaction_id', $tran_id)
                ->select('transaction_id', 'status', 'currency', 'amount')->first();

            if ($order_details->status == 'Pending') {
                $sslc = new SslCommerzNotification();
                $validation = $sslc->orderValidate($request->all(), $tran_id, $order_details->amount, $order_details->currency);
                if ($validation == TRUE) {
                    /*
                    That means IPN worked. Here you need to update order status
                    in order table as Processing or Complete.
                    Here you can also sent sms or email for successful transaction to customer
                    */
                    $update_product = DB::table('orders')
                        ->where('transaction_id', $tran_id)
                        ->update(['status' => 'Processing']);

                    echo "Transaction is successfully Completed";
                }
            } else if ($order_details->status == 'Processing' || $order_details->status == 'Complete') {

                #That means Order status already updated. No need to udate database.

                echo "Transaction is already successfully Completed";
            } else {
                #That means something wrong happened. You can redirect customer to your product page.

                echo "Invalid Transaction";
            }
        } else {
            echo "Invalid Data";
        }
    }

}
