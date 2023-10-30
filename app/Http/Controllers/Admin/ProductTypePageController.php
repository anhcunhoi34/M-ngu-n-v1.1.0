<?php

namespace App\Http\Controllers\Admin;

use File;
use App\Models\Language;
use Illuminate\Http\Request;
use App\Models\ProductTypePage;
use App\Http\Controllers\Controller;
use Intervention\Image\Facades\Image;
use App\Models\ProductTypePageLanguage;

class ProductTypePageController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function index(Request $request){
        $productType = ProductTypePage::first();

        $languages = Language::get();

        $product_type_language = ProductTypePageLanguage::where(['product_type_id' => $productType->id, 'lang_code' => $request->lang_code])->first();
        
        return view('admin.product_type_page', compact('productType', 'languages', 'product_type_language'));
    }

    public function update(Request $request, $id)
    {
        $productType = ProductTypePage::find($id);

        $product_type_language = ProductTypePageLanguage::where(['product_type_id' => $productType->id, 'lang_code' => $request->lang_code])->first();

        $rules = [
            'title'=>'required',
            'description'=>'required',
        ];
        $customMessages = [
            'title.required' => trans('admin_validation.Title is required'),
            'description.required' => trans('admin_validation.Description is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $product_type_language->title = $request->title;
        $product_type_language->description = $request->description;
        $product_type_language->save();

        if($request->image){
            $exist_banner = $productType->image;
            $extention = $request->image->getClientOriginalExtension();
            $banner_name = 'product-type-page-'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $banner_name = 'uploads/website-images/'.$banner_name;
            Image::make($request->image)
                ->save(public_path().'/'.$banner_name);
            $productType->image = $banner_name;
            $productType->save();
            if($exist_banner){
                if(File::exists(public_path().'/'.$exist_banner))unlink(public_path().'/'.$exist_banner);
            }
        }

        $notification= trans('admin_validation.Updated Successfully');
        $notification=array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }
}
