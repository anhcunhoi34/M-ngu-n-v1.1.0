<?php

namespace App\Http\Controllers\Admin;

use File;
use Image;
use App\Models\Setting;
use App\Models\Language;
use App\Models\SeoSetting;
use App\Models\BannerImage;
use Illuminate\Http\Request;
use App\Models\SectionContent;
use App\Models\SectionControl;
use App\Models\SettingLanguage;
use App\Models\MaintainanceText;
use App\Http\Controllers\Controller;
use App\Models\SectionContentLanguage;

class ContentController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function maintainanceMode()
    {
        $maintainance = MaintainanceText::first();
        return view('admin.maintainance_mode', compact('maintainance'));
    }

    public function maintainanceModeUpdate(Request $request)
    {
        $rules = [
            'description'=> $request->maintainance_mode ? 'required' : ''
        ];
        $customMessages = [
            'description.required' => trans('admin_validation.Description is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $maintainance = MaintainanceText::first();
        if($request->image){
            $old_image=$maintainance->image;
            $image=$request->image;
            $ext=$image->getClientOriginalExtension();
            $image_name= 'maintainance-mode-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$ext;
            $image_name='uploads/website-images/'.$image_name;
            Image::make($image)
                ->save(public_path().'/'.$image_name);
            $maintainance->image=$image_name;
            $maintainance->save();
            if($old_image){
                if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
            }
        }
        $maintainance->status = $request->maintainance_mode ? 1 : 0;
        $maintainance->description = $request->description;
        $maintainance->save();

        $notification= trans('admin_validation.Updated Successfully');
        $notification=array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    public function joinAsAProvider(){
        $setting = Setting::first();

        $join_as_a_provider = array(
            'image' => $setting->join_as_a_provider_banner,
            'home3_image' => $setting->home3_join_as_provider,
            'home2_image' => $setting->home2_join_as_provider,
            'title' => $setting->join_as_a_provider_title,
            'button_text' => $setting->join_as_a_provider_btn,
        );
        $join_as_a_provider = (object) $join_as_a_provider;

        $selected_theme = $setting->selected_theme;

        return view('admin.join_as_a_provider',compact('join_as_a_provider','selected_theme'));
    }



    public function subscriberSection(Request $request){
        $setting = Setting::with('settinglangadmin')->first();
        $languages = Language::get();
        $setting_language = SettingLanguage::where(['setting_id' => $setting->id, 'lang_code' => $request->lang_code])->first();


        $subscriber = array(
            'title' => $setting_language->subscriber_title,
            'description' => $setting_language->subscriber_description,
            'image' => $setting->subscriber_image,
            'background_image' => $setting->subscription_bg,
            'home2_background_image' => $setting->home2_subscription_bg,
            'home3_background_image' => $setting->home3_subscription_bg,
            'blog_page_subscription_image' => $setting->blog_page_subscription_image,
        );
        $subscriber = (object) $subscriber;

        $selected_theme = $setting->selected_theme;

        return view('admin.subscriber_section',compact('subscriber','selected_theme', 'languages'));
    }

    public function updateSubscriberSection(Request $request){
        $rules = [
            'title'=>'required',
            'description'=>'required'
        ];
        $customMessages = [
            'title.required' => trans('admin_validation.Title is required'),
            'description.required' => trans('admin_validation.Description is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $setting = Setting::first();
        $setting_language = SettingLanguage::where(['setting_id' => $setting->id, 'lang_code' => $request->lang_code])->first();
        
        $setting_language->subscriber_title = $request->title;
        $setting_language->subscriber_description = $request->description;
        $setting_language->save();

        if($request->background_image){
            $old_image = $setting->subscription_bg;
            $extention=$request->background_image->getClientOriginalExtension();
            $image_name = 'sub-background'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name ='uploads/website-images/'.$image_name;
            Image::make($request->background_image)
                ->save(public_path().'/'.$image_name);
            $setting->subscription_bg = $image_name;
            $setting->save();
            if($old_image){
                if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
            }
        }

        if($request->home2_background_image){
            $old_image = $setting->home2_subscription_bg;
            $extention=$request->home2_background_image->getClientOriginalExtension();
            $image_name = 'sub-background'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name ='uploads/website-images/'.$image_name;
            Image::make($request->home2_background_image)
                ->save(public_path().'/'.$image_name);
            $setting->home2_subscription_bg = $image_name;
            $setting->save();
            if($old_image){
                if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
            }
        }

        if($request->background_image3){
            $old_image = $setting->home3_subscription_bg;
            $extention=$request->background_image3->getClientOriginalExtension();
            $image_name = 'sub-background'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name ='uploads/website-images/'.$image_name;
            Image::make($request->background_image3)
                ->save(public_path().'/'.$image_name);
            $setting->home3_subscription_bg = $image_name;
            $setting->save();
            if($old_image){
                if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
            }
        }



        if($request->blog_page_subscription_image){
            $old_image = $setting->blog_page_subscription_image;
            $extention = $request->blog_page_subscription_image->getClientOriginalExtension();
            $image_name = 'blog-sub-background'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name ='uploads/website-images/'.$image_name;
            Image::make($request->blog_page_subscription_image)
                ->save(public_path().'/'.$image_name);
            $setting->blog_page_subscription_image = $image_name;
            $setting->save();
            if($old_image){
                if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
            }
        }
        $notification= trans('admin_validation.Update Successfully');
        $notification=array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }


    public function sectionContent(Request $request){
        $contents = SectionContent::with('contentlangadmin')->get();

        $content_id = [];
        foreach($contents as $content){
            $content_id[] = $content->id;
        }

        $languages = Language::get();

        $section_content_languages = SectionContentLanguage::whereIn('content_id', $content_id)->where('lang_code', $request->lang_code)->get();
        
        return view('admin.section_content',compact('contents', 'languages', 'section_content_languages'));
    }


    public function updateSectionContent(Request $request, $id){
        $rules = [
            'section_name' => $request->section_name ? 'required':'',
            'title' => 'required',
            'description' => 'required',
        ];
        $customMessages = [
            'section_name.required' => trans('admin_validation.Section name is required'),
            'title.required' => trans('admin_validation.Title is required'),
            'description.required' => trans('admin_validation.Description is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $section = SectionContentLanguage::find($id);

        if($request->section_name){
            $section->section_name = $request->section_name;
        }

        $section->title = $request->title;
        $section->description = $request->description;
        $section->save();

        $notification = trans('admin_validation.Updated Successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);

    }


    public function sectionControl(){
        $homepage = SectionControl::get();

        return view('admin.section_control',compact('homepage'));
    }


    public function updateSectionControl(Request $request){
        foreach($request->ids as $index => $id){
            $section = SectionControl::find($id);
            $section->status = $request->status[$index];
            $section->qty = $request->quanities[$index];
            $section->save();
        }

        $notification= trans('admin_validation.Update Successfully');
        $notification=array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    public function seoSetup(){
        $pages = SeoSetting::all();
        return view('admin.seo_setup', compact('pages'));
    }

    public function updateSeoSetup(Request $request, $id){
        $rules = [
            'seo_title' => 'required',
            'seo_description' => 'required'
        ];
        $customMessages = [
            'seo_title.required' => trans('admin_validation.Seo title is required'),
            'seo_description.required' => trans('admin_validation.Seo description is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $page = SeoSetting::find($id);
        $page->seo_title = $request->seo_title;
        $page->seo_description = $request->seo_description;
        $page->save();

        $notification = trans('admin_validation.Update Successfully');
        $notification=array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);

    }

    public function defaultAvatar(){
        $setting = Setting::first();
        $default_avatar = $setting->default_avatar;
        return view('admin.default_profile_image', compact('default_avatar'));
    }

    public function updateDefaultAvatar(Request $request){
        $setting = Setting::first();
        if($request->avatar){
            $existing_avatar = $setting->default_avatar;
            $extention = $request->avatar->getClientOriginalExtension();
            $default_avatar = 'default-avatar'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $default_avatar = 'uploads/website-images/'.$default_avatar;
            Image::make($request->avatar)
                ->save(public_path().'/'.$default_avatar);
            $setting->default_avatar = $default_avatar;
            $setting->save();
            if($existing_avatar){
                if(File::exists(public_path().'/'.$existing_avatar))unlink(public_path().'/'.$existing_avatar);
            }
        }

        $notification = trans('admin_validation.Update Successfully');
        $notification=array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }



}
