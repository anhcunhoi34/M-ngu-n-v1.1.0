<?php

namespace App\Http\Controllers\Admin;

use App\Models\Blog;
use App\Models\User;
use App\Models\Order;
use App\Models\Product;
use App\Models\Service;
use App\Models\Setting;
use App\Models\Subscriber;

use Illuminate\Http\Request;
use App\Models\RefundRequest;
use App\Models\ProviderWithdraw;
use App\Http\Controllers\Controller;



class DashboardController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function dashobard(){

        $todayOrders = Order::orderBy('id','desc')->whereDay('created_at', now()->day)->get();

        $today_total_order = $todayOrders->count();
        $todayProduct = Product::orderBy('id','desc')->whereDay('created_at', now()->day)->get();
        $today_total_product = $todayProduct->count();
        $today_pending_product = $todayProduct->where('status',0)->count();
        $today_approved_product = $todayProduct->where('status',1)->count();

        $today_total_earning = $todayOrders->where('payment_status','success')->where('order_status',1)->sum('total_amount');

        $today_withdraws = ProviderWithdraw::whereDay('created_at', now()->day)->get();
        $today_withdraw_request = $today_withdraws->sum('total_amount');
        $today_withdraw_approved = $today_withdraws->where('status', 1)->sum('total_amount');
        
        $today_users = User::whereDay('created_at', now()->day())->count();

        // end today

        // start this month

        $monthlyOrders = Order::orderBy('id','desc')->whereMonth('created_at', now()->month)->get();

        $monthly_total_order = $monthlyOrders->count();
        $monthlyProduct = Product::orderBy('id','desc')->whereMonth('created_at', now()->month)->get();
        $monthly_total_product = $monthlyProduct->count();
        $monthly_pending_product = $monthlyProduct->where('status',0)->count();
        $monthly_approved_product = $monthlyProduct->where('status',1)->count();

        $monthly_total_earning = $monthlyOrders->where('payment_status','success')->where('order_status',1)->sum('total_amount');

        $monthly_withdraws = ProviderWithdraw::whereMonth('created_at', now()->month)->get();
        $monthly_withdraw_request = $monthly_withdraws->sum('total_amount');
        $monthly_withdraw_approved = $monthly_withdraws->where('status', 1)->sum('total_amount');
        
        $monthly_users = User::whereMonth('created_at', now()->month)->count();

        // end monthly

        // start yearly

        $yearlyOrders = Order::orderBy('id','desc')->whereYear('created_at', now()->year)->get();

        $yearly_total_order = $yearlyOrders->count();
        $yearlyProduct = Product::orderBy('id','desc')->whereYear('created_at', now()->year)->get();
        $yearly_total_product = $yearlyProduct->count();

        $yearly_pending_product = $yearlyProduct->where('status',0)->count();
        $yearly_approved_product = $yearlyProduct->where('status',1)->count();

        $yearly_total_earning = $yearlyOrders->where('payment_status','success')->where('order_status',1)->sum('total_amount');

        $yearly_withdraws = ProviderWithdraw::whereYear('created_at', now()->year)->get();
        $yearly_withdraw_request = $yearly_withdraws->sum('total_amount');
        $yearly_withdraw_approved = $yearly_withdraws->where('status', 1)->sum('total_amount');
        
        $yearly_users = User::whereYear('created_at', now()->year)->count();

        // end yarly


        // start total
        $totalOrders = Order::orderBy('id','desc')->get();

        $total_total_order = $totalOrders->count();
        $totalProduct = Product::orderBy('id','desc')->get();
        $total_total_product = $totalProduct->count();
        
        $total_pending_product = $totalProduct->where('status',0)->count();
        $total_approved_product = $totalProduct->where('status',1)->count();

        $total_total_earning = $totalOrders->where('payment_status','success')->where('order_status',1)->sum('total_amount');

        $total_withdraws = ProviderWithdraw::get();
        $total_withdraw_request = $total_withdraws->sum('total_amount');
        $total_withdraw_approved = $total_withdraws->where('status', 1)->sum('total_amount');
        
        $total_users = User::whereYear('created_at', now()->year())->count();

        $total_blog = Blog::count();
        $total_subscriber = Subscriber::where('is_verified',1)->count();
        $author_products = Product::select('author_id')->get();
        $author_id_arr = [];
        foreach($author_products as $author_product){
            $author_id_arr[]=$author_product->author_id;
        }

        $author_id_arr = array_unique($author_id_arr);


        $total_sellers = User::whereIn('id', $author_id_arr)->where('status', 1)->orderBy('name','asc')->count();
        $total_clients = User::where('status', 1)->orderBy('name','asc')->count();
        // end total

        $setting = Setting::first();
        $currency_icon = (object) array('icon' => $setting->currency_icon);

        return view('admin.dashboard', compact('currency_icon','today_total_order','today_total_product','today_pending_product','today_approved_product','today_total_earning','today_withdraw_request','today_withdraw_approved','today_users','monthly_total_order','monthly_total_product','monthly_pending_product','monthly_approved_product','monthly_total_earning','monthly_withdraw_request','monthly_withdraw_approved','monthly_users','yearly_total_order','yearly_total_product','yearly_pending_product','yearly_approved_product','yearly_total_earning','yearly_withdraw_request','yearly_withdraw_approved','yearly_users','total_total_order','total_total_product','total_pending_product','total_approved_product','total_total_earning','total_withdraw_request','total_withdraw_approved','total_users','total_blog','total_subscriber','total_sellers','total_clients'));
    }




}
