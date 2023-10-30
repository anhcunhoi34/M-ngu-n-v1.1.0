<?php

namespace App\Http\Controllers\Admin;

use File;
use Image;
use App\Models\Slider;
use App\Models\Setting;
use App\Models\Language;
use Illuminate\Http\Request;
use App\Models\SliderLanguage;
use App\Http\Controllers\Controller;

class SliderController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function index(Request $request){
        $slider = Slider::with('sliderlangadmin')->first();
        $sliderlanguage = SliderLanguage::where(['slider_id' => $slider->id, 'lang_code' => $request->lang_code])->first();
        $languages = Language::get();
        $setting = Setting::first();
        $selected_theme = $setting->selected_theme;

        return view('admin.create_slider', compact('slider','selected_theme', 'languages', 'sliderlanguage'));
    }

    public function update(Request $request, $id){
        $rules = [
            'home1_title' => 'required',
            'home2_title' => 'required',
            'home3_title' => 'required',
            'home2_description' => 'required',
            'home3_description' => 'required',
            'total_sold' => session()->get('admin_lang') == $request->lang_code ? 'required':'',
            'total_product' => session()->get('admin_lang') == $request->lang_code ? 'required':'',
            'total_user' => session()->get('admin_lang') == $request->lang_code ? 'required':'',
        ];
        $customMessages = [
            'home1_title.required' => trans('admin_validation.Title is required'),
            'home2_title.required' => trans('admin_validation.Title is required'),
            'home3_title.required' => trans('admin_validation.Title is required'),
            'home2_description.required' => trans('admin_validation.Description is required'),
            'home3_description.required' => trans('admin_validation.Description is required'),
            'total_sold.required' => trans('admin_validation.Total sold is required'),
            'total_product.required' => trans('admin_validation.Total product is required'),
            'total_user.required' => trans('admin_validation.Total user is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $slider = Slider::find($id);
        $sliderlanguage = SliderLanguage::where(['slider_id' => $slider->id, 'lang_code' => $request->lang_code])->first();

        if($request->home1_bg){
            $existing_slider = $slider->home1_bg;
            $extention = $request->home1_bg->getClientOriginalExtension();
            $slider_image = 'slider'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $slider_image = 'uploads/website-images/'.$slider_image;
            Image::make($request->home1_bg)
                ->save(public_path().'/'.$slider_image);
            $slider->home1_bg = $slider_image;
            $slider->save();
            if($existing_slider){
                if(File::exists(public_path().'/'.$existing_slider))unlink(public_path().'/'.$existing_slider);
            }
        }

        if($request->home2_bg){
            $existing_slider = $slider->home2_bg;
            $extention = $request->home2_bg->getClientOriginalExtension();
            $slider_image = 'slider'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $slider_image = 'uploads/website-images/'.$slider_image;
            Image::make($request->home2_bg)
                ->save(public_path().'/'.$slider_image);
            $slider->home2_bg = $slider_image;
            $slider->save();
            if($existing_slider){
                if(File::exists(public_path().'/'.$existing_slider))unlink(public_path().'/'.$existing_slider);
            }
        }

        if($request->home2_image){
            $existing_slider = $slider->home2_image;
            $extention = $request->home2_image->getClientOriginalExtension();
            $slider_image = 'slider'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $slider_image = 'uploads/website-images/'.$slider_image;
            Image::make($request->home2_image)
                ->save(public_path().'/'.$slider_image);
            $slider->home2_image = $slider_image;
            $slider->save();
            if($existing_slider){
                if(File::exists(public_path().'/'.$existing_slider))unlink(public_path().'/'.$existing_slider);
            }
        }

        if($request->home3_image){
            $existing_slider = $slider->home3_image;
            $extention = $request->home3_image->getClientOriginalExtension();
            $slider_image = 'slider'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $slider_image = 'uploads/website-images/'.$slider_image;
            Image::make($request->home3_image)
                ->save(public_path().'/'.$slider_image);
            $slider->home3_image = $slider_image;
            $slider->save();
            if($existing_slider){
                if(File::exists(public_path().'/'.$existing_slider))unlink(public_path().'/'.$existing_slider);
            }
        }

        if($request->home3_bg){
            $existing_slider = $slider->home3_bg;
            $extention = $request->home3_bg->getClientOriginalExtension();
            $slider_image = 'slider'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $slider_image = 'uploads/website-images/'.$slider_image;
            Image::make($request->home3_bg)
                ->save(public_path().'/'.$slider_image);
            $slider->home3_bg = $slider_image;
            $slider->save();
            if($existing_slider){
                if(File::exists(public_path().'/'.$existing_slider))unlink(public_path().'/'.$existing_slider);
            }
        }  

        if($request->total_sold){
            $slider->total_sold = $request->total_sold;
        }

        if($request->total_product){
            $slider->total_product = $request->total_product;
        }
        
        if($request->total_user){
            $slider->total_user = $request->total_user;
        }

        $slider->save();

        $sliderlanguage->home1_title = $request->home1_title;
        $sliderlanguage->home2_title = $request->home2_title;
        $sliderlanguage->home3_title = $request->home3_title;
        $sliderlanguage->home2_description = $request->home2_description;
        $sliderlanguage->home3_description = $request->home3_description;
        $sliderlanguage->save();

        $notification= trans('admin_validation.Update Successfully');
        $notification=array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

}
