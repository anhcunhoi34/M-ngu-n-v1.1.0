<?php

namespace App\Http\Controllers\Admin;

use File;
use Image;
use App\Models\AboutUs;
use App\Models\Language;
use App\Models\BecomeAuthor;
use Illuminate\Http\Request;
use App\Models\AboutUsLanguage;
use App\Http\Controllers\Controller;
use App\Models\BecomeAuthorLanguage;

class AboutUsController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function index(Request $request)
    {
        $about = AboutUs::with('aboutlangadmin')->first();
        $languages = Language::get();
        $about_language = AboutUsLanguage::where(['about_id' => $about->id, 'lang_code' => $request->lang_code])->first();
        return view('admin.about-us',compact('about', 'languages', 'about_language'));
    }

    public function update_aboutUs(Request $request){
        $rules = [
            'title' => 'required',
            'header1' => 'required',
            'header2' => 'required',
            'header3' => 'required',
            'name' => 'required',
            'desgination' => 'required',
            'about_us' => 'required',
        ];
        $customMessages = [
            'header1.required' => trans('admin_validation.Title is required'),
            'header1.required' => trans('admin_validation.Header is required'),
            'header2.required' => trans('admin_validation.Header is required'),
            'header3.required' => trans('admin_validation.Header is required'),
            'name.required' => trans('admin_validation.Name is required'),
            'desgination.required' => trans('admin_validation.Designation is required'),
            'about_us.required' => trans('admin_validation.About us is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $about = AboutUs::with('aboutlangadmin')->first();

        $about_language = AboutUsLanguage::where(['about_id' => $about->id, 'lang_code' => $request->lang_code])->first();

        $about_language->name = $request->name;
        $about_language->desgination = $request->desgination;
        $about_language->title = $request->title;
        $about_language->header1 = $request->header1;
        $about_language->header2 = $request->header2;
        $about_language->header3 = $request->header3;
        $about_language->about_us = $request->about_us;
        $about_language->save();

        if($request->banner_image){
            $exist_banner = $about->banner_image;
            $extention = $request->banner_image->getClientOriginalExtension();
            $banner_name = 'about-us'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $banner_name = 'uploads/website-images/'.$banner_name;
            Image::make($request->banner_image)
                ->save(public_path().'/'.$banner_name);
            $about->banner_image = $banner_name;
            $about->save();
            if($exist_banner){
                if(File::exists(public_path().'/'.$exist_banner))unlink(public_path().'/'.$exist_banner);
            }
        }

        if($request->image){
            $exist_image= $about->image;
            $extention = $request->image->getClientOriginalExtension();
            $image_name = 'about-us'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name = 'uploads/website-images/'.$image_name;
            Image::make($request->image)
                ->save(public_path().'/'.$image_name);
            $about->image = $image_name;
            $about->save();
            if($exist_image){
                if(File::exists(public_path().'/'.$exist_image))unlink(public_path().'/'.$exist_image);
            }
        }

        if($request->signature){
            $exist_signature = $about->signature;
            $extention = $request->signature->getClientOriginalExtension();
            $signature_name = 'about-us'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $signature_name = 'uploads/website-images/'.$signature_name;
            Image::make($request->signature)
                ->save(public_path().'/'.$signature_name);
            $about->signature = $signature_name;
            $about->save();
            if($exist_signature){
                if(File::exists(public_path().'/'.$exist_signature))unlink(public_path().'/'.$exist_signature);
            }
        }
        $notification = trans('admin_validation.Updated Successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    public function become_author(Request $request){
        $become_author = BecomeAuthor::with('becomelangadmin')->first();
        $languages = Language::get();
        $become_language = BecomeAuthorLanguage::where(['become_id' => $become_author->id, 'lang_code' => $request->lang_code])->first();
       
        return view('admin.become_author',compact('become_author','languages','become_language'));
    }

    public function update_become_author(Request $request){

        $rules = [
            'title' => 'required',
            'header1' => 'required',
            'header2' => 'required',
            'description' => 'required',
            'item1' => 'required',
            'item2' => 'required',
            'item3' => 'required',
            'item4' => 'required',
            'name' => 'required',
            'desgination' => 'required',
        ];

        $customMessages = [
            'title.required' => trans('admin_validation.Title is required'),
            'header1.required' => trans('admin_validation.Header is required'),
            'header2.required' => trans('admin_validation.Header is required'),
            'description.required' => trans('admin_validation.Description is required'),
            'item1.required' => trans('admin_validation.Item is required'),
            'item2.required' => trans('admin_validation.Item is required'),
            'item3.required' => trans('admin_validation.Item is required'),
            'item4.required' => trans('admin_validation.Item is required'),
            'name.required' => trans('admin_validation.Name is required'),
            'desgination.required' => trans('admin_validation.Designation is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $become_author = BecomeAuthor::with('becomelangadmin')->first();
        $become_language = BecomeAuthorLanguage::where(['become_id' => $become_author->id, 'lang_code' => $request->lang_code])->first();
       
        $become_language->title = $request->title;
        $become_language->name = $request->name;
        $become_language->desgination = $request->desgination;
        $become_language->header1 = $request->header1;
        $become_language->header2 = $request->header2;
        $become_language->description = $request->description;
        $become_language->item1 = $request->item1;
        $become_language->item2 = $request->item2;
        $become_language->item3 = $request->item3;
        $become_language->item4 = $request->item4;
        $become_language->save();

        if($request->bg_image){
            $exist_banner = $become_author->bg_image;
            $extention = $request->bg_image->getClientOriginalExtension();
            $banner_name = 'become_author'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $banner_name = 'uploads/website-images/'.$banner_name;
            Image::make($request->bg_image)
                ->save(public_path().'/'.$banner_name);
            $become_author->bg_image = $banner_name;
            $become_author->save();
            if($exist_banner){
                if(File::exists(public_path().'/'.$exist_banner))unlink(public_path().'/'.$exist_banner);
            }
        }

        if($request->image1){
            $exist_banner = $become_author->image1;
            $extention = $request->image1->getClientOriginalExtension();
            $banner_name = 'become_author'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $banner_name = 'uploads/website-images/'.$banner_name;
            Image::make($request->image1)
                ->save(public_path().'/'.$banner_name);
            $become_author->image1 = $banner_name;
            $become_author->save();
            if($exist_banner){
                if(File::exists(public_path().'/'.$exist_banner))unlink(public_path().'/'.$exist_banner);
            }
        }

        if($request->image2){
            $exist_banner = $become_author->image2;
            $extention = $request->image2->getClientOriginalExtension();
            $banner_name = 'become_author'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $banner_name = 'uploads/website-images/'.$banner_name;
            Image::make($request->image2)
                ->save(public_path().'/'.$banner_name);
            $become_author->image2 = $banner_name;
            $become_author->save();
            if($exist_banner){
                if(File::exists(public_path().'/'.$exist_banner))unlink(public_path().'/'.$exist_banner);
            }
        }

        if($request->image){
            $exist_banner = $become_author->image;
            $extention = $request->image->getClientOriginalExtension();
            $banner_name = 'become_author'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $banner_name = 'uploads/website-images/'.$banner_name;
            Image::make($request->image)
                ->save(public_path().'/'.$banner_name);
            $become_author->image = $banner_name;
            $become_author->save();
            if($exist_banner){
                if(File::exists(public_path().'/'.$exist_banner))unlink(public_path().'/'.$exist_banner);
            }
        }

        if($request->signature){
            $exist_banner = $become_author->signature;
            $extention = $request->signature->getClientOriginalExtension();
            $banner_name = 'become_author'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $banner_name = 'uploads/website-images/'.$banner_name;
            Image::make($request->signature)
                ->save(public_path().'/'.$banner_name);
            $become_author->signature = $banner_name;
            $become_author->save();
            if($exist_banner){
                if(File::exists(public_path().'/'.$exist_banner))unlink(public_path().'/'.$exist_banner);
            }
        }

        if($request->icon1){
            $exist_banner = $become_author->icon1;
            $extention = $request->icon1->getClientOriginalExtension();
            $banner_name = 'become_author'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $banner_name = 'uploads/website-images/'.$banner_name;
            Image::make($request->icon1)
                ->save(public_path().'/'.$banner_name);
            $become_author->icon1 = $banner_name;
            $become_author->save();
            if($exist_banner){
                if(File::exists(public_path().'/'.$exist_banner))unlink(public_path().'/'.$exist_banner);
            }
        }

        if($request->icon2){
            $exist_banner = $become_author->icon2;
            $extention = $request->icon2->getClientOriginalExtension();
            $banner_name = 'become_author'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $banner_name = 'uploads/website-images/'.$banner_name;
            Image::make($request->icon2)
                ->save(public_path().'/'.$banner_name);
            $become_author->icon2 = $banner_name;
            $become_author->save();
            if($exist_banner){
                if(File::exists(public_path().'/'.$exist_banner))unlink(public_path().'/'.$exist_banner);
            }
        }

        if($request->icon3){
            $exist_banner = $become_author->icon3;
            $extention = $request->icon3->getClientOriginalExtension();
            $banner_name = 'become_author'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $banner_name = 'uploads/website-images/'.$banner_name;
            Image::make($request->icon3)
                ->save(public_path().'/'.$banner_name);
            $become_author->icon3 = $banner_name;
            $become_author->save();
            if($exist_banner){
                if(File::exists(public_path().'/'.$exist_banner))unlink(public_path().'/'.$exist_banner);
            }
        }

        if($request->icon4){
            $exist_banner = $become_author->icon4;
            $extention = $request->icon4->getClientOriginalExtension();
            $banner_name = 'become_author'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $banner_name = 'uploads/website-images/'.$banner_name;
            Image::make($request->icon4)
                ->save(public_path().'/'.$banner_name);
            $become_author->icon4 = $banner_name;
            $become_author->save();
            if($exist_banner){
                if(File::exists(public_path().'/'.$exist_banner))unlink(public_path().'/'.$exist_banner);
            }
        }

        $notification = trans('admin_validation.Updated Successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

}
