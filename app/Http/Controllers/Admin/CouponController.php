<?php

namespace App\Http\Controllers\Admin;

use App\Models\Coupon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CouponController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $coupons=Coupon::latest()->get();
        return view('admin.coupon', compact('coupons'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.create_coupon');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $rules = [
            'coupon_name' => 'required',
            'coupon_discount' => 'required',
            'coupon_validity' => 'required',
        ];
        $customMessages = [
            'coupon_name.required' => 'The coupon name is required.',
            'coupon_discount.required' => 'The coupon discount is required.',
            'coupon_validity.required' => 'The coupon vilidity is required.'
        ];
        $this->validate($request, $rules,$customMessages);
        $coupon= new Coupon();
        $coupon->coupon_name=strtoupper($request->coupon_name);
        $coupon->coupon_discount=$request->coupon_discount;
        $coupon->coupon_validity=$request->coupon_validity;
        $coupon->status=$request->status;
        $coupon->save();
        $notification=array(
            'message'=>'Coupon add successfully.',
            'alert-type'=>'success',
        );
        $notification=trans('admin_validation.Created Successfully');
        $notification=array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $coupon=Coupon::findOrFail($id);
        return view('admin.edit_coupon', compact('coupon'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $rules = [
            'coupon_name' => 'required',
            'coupon_discount' => 'required',
            'coupon_validity' => 'required',
        ];
        $customMessages = [
            'coupon_name.required' => 'The coupon name is required.',
            'coupon_discount.required' => 'The coupon discount is required.',
            'coupon_validity.required' => 'The coupon vilidity is required.'
        ];
        $this->validate($request, $rules,$customMessages);
        $coupon= Coupon::findOrFail($id);
        $coupon->coupon_name=strtoupper($request->coupon_name);
        $coupon->coupon_discount=$request->coupon_discount;
        $coupon->coupon_validity=$request->coupon_validity;
        $coupon->status=$request->status;
        $coupon->save();
        $notification=array(
            'message'=>'Coupon add successfully.',
            'alert-type'=>'success',
        );
        $notification=trans('admin_validation.Updated Successfully');
        $notification=array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->route('admin.coupon.index')->with($notification);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $coupon = Coupon::find($id);
        $coupon->delete();
        $notification = trans('admin_validation.Delete Successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->route('admin.coupon.index')->with($notification);
    }

    public function changeStatus($id){
        $coupon = Coupon::find($id);
        if($coupon->status==1){
            $coupon->status=0;
            $coupon->save();
            $message = trans('admin_validation.Inactive Successfully');
        }else{
            $coupon->status=1;
            $coupon->save();
            $message= trans('admin_validation.Active Successfully');
        }
        return response()->json($message);
    }
}
