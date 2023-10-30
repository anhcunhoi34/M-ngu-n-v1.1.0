<?php

namespace App\Http\Controllers\Admin;

use File;
use App\Models\Language;
use App\Models\ProductItem;
use Illuminate\Http\Request;
use App\Models\ProductItemLanguage;
use App\Http\Controllers\Controller;
use Intervention\Image\Facades\Image;

class ProductItemController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function index(Request $request)
    {
        $productItem = ProductItem::first();
        $languages = Language::get();

        $product_item_language = ProductItemLanguage::where(['item_id' => $productItem->id, 'lang_code' => $request->lang_code])->first();

        return view('admin.product_item', compact('productItem', 'languages', 'product_item_language'));
    }


    
    public function update(Request $request, $id)
    {
        $productItem = ProductItem::find($id);

        $product_item_language = ProductItemLanguage::where(['item_id' => $productItem->id, 'lang_code' => $request->lang_code])->first();

        $rules = [
            'script_title'=>'required',
            'script_description'=>'required',
            'image_title'=>'required',
            'image_description'=>'required',
            'video_title'=>'required',
            'video_description'=>'required',
            'audio_title'=>'required',
            'audio_description'=>'required',
        ];
        $customMessages = [
            'script_title.required' => trans('admin_validation.Script product title is required'),
            'script_description.required' => trans('admin_validation.Script product description is required'),
            'image_title.required' => trans('admin_validation.Image product title is required'),
            'image_description.required' => trans('admin_validation.Image product description is required'),
            'video_title.required' => trans('admin_validation.Video product title is required'),
            'video_description.required' => trans('admin_validation.Video product description is required'),
            'audio_title.required' => trans('admin_validation.Audio product title is required'),
            'audio_description.required' => trans('admin_validation.Audio product description is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $product_item_language->script_title = $request->script_title;
        $product_item_language->script_description = $request->script_description;
        $product_item_language->image_title = $request->image_title;
        $product_item_language->image_description = $request->image_description;
        $product_item_language->video_title = $request->video_title;
        $product_item_language->video_description = $request->video_description;
        $product_item_language->audio_title = $request->audio_title;
        $product_item_language->audio_description = $request->audio_description;
        $product_item_language->save();

        if($request->script_image){
            $exist_banner = $productItem->script_image;
            $extention = $request->script_image->getClientOriginalExtension();
            $banner_name = 'script-product-image-'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $banner_name = 'uploads/website-images/'.$banner_name;
            Image::make($request->script_image)
                ->save(public_path().'/'.$banner_name);
            $productItem->script_image = $banner_name;
            $productItem->save();
            if($exist_banner){
                if(File::exists(public_path().'/'.$exist_banner))unlink(public_path().'/'.$exist_banner);
            }
        }

        if($request->image_image){
            $exist_banner = $productItem->image_image;
            $extention = $request->image_image->getClientOriginalExtension();
            $banner_name = 'image-product-image-'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $banner_name = 'uploads/website-images/'.$banner_name;
            Image::make($request->image_image)
                ->save(public_path().'/'.$banner_name);
            $productItem->image_image = $banner_name;
            $productItem->save();
            if($exist_banner){
                if(File::exists(public_path().'/'.$exist_banner))unlink(public_path().'/'.$exist_banner);
            }
        }

        if($request->video_image){
            $exist_banner = $productItem->video_image;
            $extention = $request->video_image->getClientOriginalExtension();
            $banner_name = 'video-product-image-'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $banner_name = 'uploads/website-images/'.$banner_name;
            Image::make($request->video_image)
                ->save(public_path().'/'.$banner_name);
            $productItem->video_image = $banner_name;
            $productItem->save();
            if($exist_banner){
                if(File::exists(public_path().'/'.$exist_banner))unlink(public_path().'/'.$exist_banner);
            }
        }

        if($request->audio_image){
            $exist_banner = $productItem->audio_image;
            $extention = $request->audio_image->getClientOriginalExtension();
            $banner_name = 'audio-product-image-'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $banner_name = 'uploads/website-images/'.$banner_name;
            Image::make($request->audio_image)
                ->save(public_path().'/'.$banner_name);
            $productItem->audio_image = $banner_name;
            $productItem->save();
            if($exist_banner){
                if(File::exists(public_path().'/'.$exist_banner))unlink(public_path().'/'.$exist_banner);
            }
        }

        $notification= trans('admin_validation.Updated Successfully');
        $notification=array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    
}
