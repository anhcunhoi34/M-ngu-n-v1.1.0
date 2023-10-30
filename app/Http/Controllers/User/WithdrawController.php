<?php

namespace App\Http\Controllers\User;

use Auth;
use Session;
use App\Models\Order;
use App\Models\Setting;
use App\Models\Language;
use App\Models\OrderItem;
use Illuminate\Http\Request;
use App\Models\WithdrawMethod;
use App\Models\ProviderWithdraw;
use App\Http\Controllers\Controller;

class WithdrawController extends Controller
{
    public function translator(){
        $front_lang = Session::get('front_lang');
        $language = Language::where('is_default', 'Yes')->first();
        if($front_lang == ''){
            $front_lang = Session::put('front_lang', $language->lang_code);
        }
        config(['app.locale' => $front_lang]);
    }

    public function index(){
        $this->translator();
        $user = Auth::guard('web')->user();
        $author = $user;
        $setting = Setting::first();
        $withdraw_methods=WithdrawMethod::where('status', 1)->get();
        $withdraws = ProviderWithdraw::where('user_id',$author->id)->orderBy('id','desc')->get();


        $order_items = OrderItem::where('author_id', $author->id)->get();
        $total_sold_product = $order_items->count();
        $order_item_id_arr=[];
        foreach($order_items as $order_item){
            $order_item_id_arr[]=$order_item->order_id;
        }
        $order_item_id_arr=array_unique($order_item_id_arr);
        $orders = Order::whereIn('id', $order_item_id_arr)->where('order_status', 1)->get();

        $order_id_arr=[];
        
        foreach($orders as $order){
            $order_id_arr[]=$order->id;
        }
        $order_id_arr=array_unique($order_id_arr);
        $orders_items = OrderItem::whereIn('order_id', $order_id_arr)->get();
        
        $total_balance = $orders_items->sum('price');
        
        $total_withdraw = ProviderWithdraw::where('user_id', $author->id)->sum('total_amount');
        $current_balance = $total_balance - $total_withdraw;
        
        $active_theme = 'layout2';

        return view('user.withdraw')->with([
            'active_theme' => $active_theme,
            'user' => $user,
            'setting' => $setting,
            'withdraws' => $withdraws,
            'withdraw_methods' => $withdraw_methods,
            'total_balance' => $total_balance,
            'total_withdraw' => $total_withdraw,
            'current_balance' => $current_balance,
        ]);
    }
    public function show($id){
        $this->translator();
        $withdraw = ProviderWithdraw::find($id);
        $setting = Setting::first();
        $currency_icon = array(
            'icon' => $setting->currency_icon
        );
        $currency_icon = (object) $currency_icon;
        return view('provider.show_withdraw', compact('withdraw','currency_icon'));
    }

    public function create(){
        $this->translator();
        $methods = WithdrawMethod::whereStatus('1')->get();
        return view('provider.create_withdraw', compact('methods'));
    }

    public function getWithDrawAccountInfo($id){
        $this->translator();
        $method = WithdrawMethod::whereId($id)->first();
        $setting = Setting::first();
        $currency_icon = array(
            'icon' => $setting->currency_icon
        );
        $currency_icon = (object) $currency_icon;
        return view('user.withdraw_account_info', compact('method', 'currency_icon'));
    }

    public function store(Request $request){
        $this->translator();
        $rules = [
            'method_id' => 'required',
            'withdraw_amount' => 'required|numeric',
            'account_info' => 'required',
        ];

        $customMessages = [
            'method_id.required' => trans('user_validation.Payment Method field is required'),
            'withdraw_amount.required' => trans('user_validation.Withdraw amount field is required'),
            'withdraw_amount.numeric' => trans('user_validation.Please provide valid numeric number'),
            'account_info.required' => trans('user_validation.Account field is required'),
        ];

        $this->validate($request, $rules, $customMessages);

        $user = Auth::guard('web')->user();

        $author = $user;
        $order_items = OrderItem::where('author_id', $author->id)->get();
        $total_sold_product = $order_items->count();
        $order_item_id_arr=[];
        foreach($order_items as $order_item){
            $order_item_id_arr[]=$order_item->order_id;
        }
        $order_item_id_arr=array_unique($order_item_id_arr);
        $orders = Order::whereIn('id', $order_item_id_arr)->where('order_status', 1)->get();

        $order_id_arr=[];
        
        foreach($orders as $order){
            $order_id_arr[]=$order->id;
        }
        $order_id_arr=array_unique($order_id_arr);
        $orders_items = OrderItem::whereIn('order_id', $order_id_arr)->get();
        
        $total_balance = $orders_items->sum('price');

        $total_withdraw = ProviderWithdraw::where('user_id', $author->id)->sum('total_amount');
        $current_balance = $total_balance - $total_withdraw;

        if($request->withdraw_amount > $current_balance){
            $notification = trans('user_validation.Sorry! Your Payment request is more then your current balance');
            $notification = array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->back()->with($notification);
        }

        $method = WithdrawMethod::whereId($request->method_id)->first();
        if($request->withdraw_amount >= $method->min_amount && $request->withdraw_amount <= $method->max_amount){
            $widthdraw = new ProviderWithdraw();
            $widthdraw->user_id = $author->id;
            $widthdraw->method = $method->name;
            $widthdraw->total_amount = $request->withdraw_amount;
            $withdraw_request = $request->withdraw_amount;
            $withdraw_amount = ($method->withdraw_charge / 100) * $withdraw_request;
            $widthdraw->withdraw_amount = $request->withdraw_amount - $withdraw_amount;
            $widthdraw->withdraw_charge = $method->withdraw_charge;
            $widthdraw->account_info = $request->account_info;
            $widthdraw->save();
            $notification = trans('user_validation.Withdraw request send successfully, please wait for admin approval');
            $notification=array('messege'=>$notification,'alert-type'=>'success');
            return redirect()->back()->with($notification);

        }else{
            $notification = trans('user_validation.Your amount range is not available');
            $notification=array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->back()->with($notification);
        }

    }
}
