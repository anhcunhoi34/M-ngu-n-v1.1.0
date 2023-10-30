<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Models\ProductComment;
use App\Http\Controllers\Controller;

class ProductCommentController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function index()
    {
        $productComments = ProductComment::orderBy('id','desc')->get();
        return view('admin.product_comment', compact('productComments'));
    }

    public function destroy($id)
    {
        $productComment = ProductComment::find($id);
        $productComment->delete();

        $notification= trans('admin_validation.Delete Successfully');
        $notification=array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->route('admin.product-comment.index')->with($notification);
    }

    public function changeStatus($id){
        $productComment = ProductComment::find($id);
        if($productComment->status == 1){
            $productComment->status = 0;
            $productComment->save();
            $message = trans('admin_validation.Inactive Successfully');
        }else{
            $productComment->status = 1;
            $productComment->save();
            $message = trans('admin_validation.Active Successfully');
        }
        return response()->json($message);
    }
}
