<?php

namespace App\Http\Controllers\Admin;

use File;
use Image;
use App\Models\Setting;
use App\Models\Homepage;
use App\Models\Language;
use Illuminate\Http\Request;
use App\Models\HomepageLanguage;
use App\Http\Controllers\Controller;

class HomepageController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function why_choose_us(Request $request){
        $homepage = Homepage::with('homelangadmin')->first();
        $languages = Language::get();
        $homepageLanguage = HomepageLanguage::where(['home_id' => $homepage->id, 'lang_code' => $request->lang_code])->first();
        $why_choose_us = (object) array(
            'title1' => $homepageLanguage->why_choose_title1,
            'title2' => $homepageLanguage->why_choose_title2,
            'item1_icon' => $homepage->why_choose_item1_icon,
            'item2_icon' => $homepage->why_choose_item2_icon,
            'item3_icon' => $homepage->why_choose_item3_icon,
            'item1_title' => $homepageLanguage->why_choose_item1_title,
            'item2_title' => $homepageLanguage->why_choose_item2_title,
            'item3_title' => $homepageLanguage->why_choose_item3_title,
            'home3_item1_icon' => $homepage->why_choose_home3_item1_icon,
            'home3_item2_icon' => $homepage->why_choose_home3_item2_icon,
            'home3_item3_icon' => $homepage->why_choose_home3_item3_icon,
            'home3_item1_title' => $homepageLanguage->why_choose_home3_item1_title,
            'home3_item2_desc' => $homepageLanguage->why_choose_home3_item2_desc,
            'home3_item3_title' => $homepageLanguage->why_choose_home3_item3_title,
            'home3_item1_desc' => $homepageLanguage->why_choose_home3_item1_desc,
            'home3_item2_title' => $homepageLanguage->why_choose_home3_item2_title,
            'home3_item3_desc' => $homepageLanguage->why_choose_home3_item3_desc,
            'home2_background' => $homepage->why_choose_home2_background,
        );

        return view('admin.why_choose_us', compact('why_choose_us', 'languages'));
    }

    public function why_choose_us_update(Request $request){
        $setting = Setting::first();
        $home2= false;
        if($setting->selected_theme == 0 || $setting->selected_theme == 2){
            $home2 = true;
        }
        $rules = [
            'title1' => 'required',
            'title2' => 'required',
            'item1_title' => $home2 ? 'required':'',
            'item2_title' => $home2 ? 'required':'',
            'item3_title' => $home2 ? 'required':'',
            'home3_item1_title' => 'required',
            'home3_item2_desc' => 'required',
            'home3_item3_title' => 'required',
            'home3_item1_desc' => 'required',
            'home3_item2_title' => 'required',
            'home3_item3_desc' => 'required',
        ];
        $customMessages = [
            'title1.required' => trans('admin_validation.Title is required'),
            'title2.required' => trans('admin_validation.Title is required'),
            'item1_title.required' => trans('admin_validation.Title is required'),
            'item2_title.required' => trans('admin_validation.Title is required'),
            'item3_title.required' => trans('admin_validation.Title is required'),
            'home3_item1_title.required' => trans('admin_validation.Title is required'),
            'home3_item2_desc.required' => trans('admin_validation.Description is required'),
            'home3_item3_title.required' => trans('admin_validation.Title is required'),
            'home3_item1_desc.required' => trans('admin_validation.Description is required'),
            'home3_item2_title.required' => trans('admin_validation.Title is required'),
            'home3_item3_desc.required' => trans('admin_validation.Description is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $homepage = Homepage::with('homelangadmin')->first();
        $homepageLanguage = HomepageLanguage::where(['home_id' => $homepage->id, 'lang_code' => $request->lang_code])->first();

        if($request->home2_background){
            $existing_image = $homepage->why_choose_home2_background;
            $extention = $request->home2_background->getClientOriginalExtension();
            $image_name = 'why-choose-us'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $slider_image = 'uploads/website-images/'.$image_name;
            Image::make($request->home2_background)
                ->save(public_path().'/'.$image_name);
            $homepage->why_choose_home2_background = $image_name;
            $homepage->save();
            if($existing_image){
                if(File::exists(public_path().'/'.$existing_image))unlink(public_path().'/'.$existing_image);
            }
        }

        if($request->item1_icon){
            $existing_image = $homepage->why_choose_item1_icon;
            $extention = $request->item1_icon->getClientOriginalExtension();
            $image_name = 'why-choose-us'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $slider_image = 'uploads/website-images/'.$image_name;
            Image::make($request->item1_icon)
                ->save(public_path().'/'.$image_name);
            $homepage->why_choose_item1_icon = $image_name;
            $homepage->save();
            if($existing_image){
                if(File::exists(public_path().'/'.$existing_image))unlink(public_path().'/'.$existing_image);
            }
        }

        if($request->item2_icon){
            $existing_image = $homepage->why_choose_item2_icon;
            $extention = $request->item2_icon->getClientOriginalExtension();
            $image_name = 'why-choose-us'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $slider_image = 'uploads/website-images/'.$image_name;
            Image::make($request->item2_icon)
                ->save(public_path().'/'.$image_name);
            $homepage->why_choose_item2_icon = $image_name;
            $homepage->save();
            if($existing_image){
                if(File::exists(public_path().'/'.$existing_image))unlink(public_path().'/'.$existing_image);
            }
        }

        if($request->item3_icon){
            $existing_image = $homepage->why_choose_item3_icon;
            $extention = $request->item3_icon->getClientOriginalExtension();
            $image_name = 'why-choose-us'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $slider_image = 'uploads/website-images/'.$image_name;
            Image::make($request->item3_icon)
                ->save(public_path().'/'.$image_name);
            $homepage->why_choose_item3_icon = $image_name;
            $homepage->save();
            if($existing_image){
                if(File::exists(public_path().'/'.$existing_image))unlink(public_path().'/'.$existing_image);
            }
        }

        if($request->home3_item1_icon){
            $existing_image = $homepage->why_choose_home3_item1_icon;
            $extention = $request->home3_item1_icon->getClientOriginalExtension();
            $image_name = 'why-choose-us'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $slider_image = 'uploads/website-images/'.$image_name;
            Image::make($request->home3_item1_icon)
                ->save(public_path().'/'.$image_name);
            $homepage->why_choose_home3_item1_icon = $image_name;
            $homepage->save();
            if($existing_image){
                if(File::exists(public_path().'/'.$existing_image))unlink(public_path().'/'.$existing_image);
            }
        }

        if($request->home3_item2_icon){
            $existing_image = $homepage->why_choose_home3_item2_icon;
            $extention = $request->home3_item2_icon->getClientOriginalExtension();
            $image_name = 'why-choose-us'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $slider_image = 'uploads/website-images/'.$image_name;
            Image::make($request->home3_item2_icon)
                ->save(public_path().'/'.$image_name);
            $homepage->why_choose_home3_item2_icon = $image_name;
            $homepage->save();
            if($existing_image){
                if(File::exists(public_path().'/'.$existing_image))unlink(public_path().'/'.$existing_image);
            }
        }

        if($request->home3_item3_icon){
            $existing_image = $homepage->why_choose_home3_item3_icon;
            $extention = $request->home3_item3_icon->getClientOriginalExtension();
            $image_name = 'why-choose-us'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $slider_image = 'uploads/website-images/'.$image_name;
            Image::make($request->home3_item3_icon)
                ->save(public_path().'/'.$image_name);
            $homepage->why_choose_home3_item3_icon = $image_name;
            $homepage->save();
            if($existing_image){
                if(File::exists(public_path().'/'.$existing_image))unlink(public_path().'/'.$existing_image);
            }
        }

        $homepageLanguage->why_choose_title1 = $request->title1;
        $homepageLanguage->why_choose_title2 = $request->title2;
        if($home2){
            $homepageLanguage->why_choose_item1_title = $request->item1_title;
            $homepageLanguage->why_choose_item2_title = $request->item2_title;
            $homepageLanguage->why_choose_item3_title = $request->item3_title;
        }
        $homepageLanguage->why_choose_home3_item1_title = $request->home3_item1_title;
        $homepageLanguage->why_choose_home3_item2_desc = $request->home3_item2_desc;
        $homepageLanguage->why_choose_home3_item3_title = $request->home3_item3_title;
        $homepageLanguage->why_choose_home3_item1_desc = $request->home3_item1_desc;
        $homepageLanguage->why_choose_home3_item2_title = $request->home3_item2_title;
        $homepageLanguage->why_choose_home3_item3_desc = $request->home3_item3_desc;
        $homepageLanguage->save();

        $notification= trans('admin_validation.Updated Successfully');
        $notification=array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }


    public function mobile_app(Request $request){
        $homepage = Homepage::with('homelangadmin')->first();
        $languages = Language::get();
        $homepage_language = HomepageLanguage::where(['home_id' => $homepage->id, 'lang_code' => $request->lang_code])->first();


        $mobile_app = array(
            'home2_title' => $homepage_language->app_home2_title,
            'home2_desc' => $homepage_language->app_home2_desc,
            'title1' => $homepage_language->app_title1,
            'title2' => $homepage_language->app_title2,
            'title3' => $homepage_language->app_title3,
            'home3_title' => $homepage_language->app_home3_title,
            'home3_desc' => $homepage_language->app_home3_desc,
            'description' => $homepage_language->app_description,
            'play_store' => $homepage->app_play_store_link,
            'app_store' => $homepage->app_apple_store_link,
            'home1_foreground' => $homepage->app_home1_foreground,
            'home2_background' => $homepage->app_home2_background,
            'home2_foreground' => $homepage->app_home2_foreground,
            'home3_foreground' => $homepage->app_home3_foreground,
            'home3_background' => $homepage->app_home3_background,

        );
        $mobile_app = (object) $mobile_app;

        return view('admin.mobile_app',compact('mobile_app',  'languages'));
    }


    public function update_mobile_app(Request $request){
        $setting = Setting::first();
        $home1= false;
        if($setting->selected_theme == 0 || $setting->selected_theme == 1){
            $home1 = true;
        }

        $home2= false;
        if($setting->selected_theme == 0 || $setting->selected_theme == 2){
            $home2 = true;
        }

        $home3 = false;
        if($setting->selected_theme == 0 || $setting->selected_theme == 3){
            $home3 = true;
        }
        $rules = [
            'home2_title'=> $home2 ? 'required':'',
            'home2_desc'=> $home2 ? 'required':'',
            'title1'=> $home1 ? 'required':'',
            'description'=> $home1 ? 'required':'',
            'home3_title'=> $home3 ? 'required':'',
            'home3_desc'=> $home3 ? 'required':'',
            'play_store'=> session()->get('admin_lang') == $request->lang_code ? 'required':'',
            'app_store'=> session()->get('admin_lang') == $request->lang_code ? 'required':'',
        ];
        $customMessages = [
            'home2_title.required' => trans('admin_validation.Title is required'),
            'home2_desc.required' => trans('admin_validation.Description is required'),
            'title1.required' => trans('admin_validation.Title is required'),
            'title2.required' => trans('admin_validation.Title is required'),
            'title3.required' => trans('admin_validation.Title is required'),
            'description.required' => trans('admin_validation.Description is required'),
            'home3_title.required' => trans('admin_validation.Title is required'),
            'home3_desc.required' => trans('admin_validation.Description is required'),
            'play_store.required' => trans('admin_validation.Play store is required'),
            'app_store.required' => trans('admin_validation.App store is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $homepage = Homepage::with('homelangadmin')->first();
        $homepage_language = HomepageLanguage::where(['home_id' => $homepage->id, 'lang_code' => $request->lang_code])->first();


        if($request->app_store){
            $homepage->app_play_store_link = $request->play_store;
            $homepage->save();
        }

        if($request->app_store){
            $homepage->app_apple_store_link = $request->app_store;
            $homepage->save();
        }


        if($request->home1_foreground){
            $old_image = $homepage->app_home1_foreground;
            $extention=$request->home1_foreground->getClientOriginalExtension();
            $image_name = 'mobile-app-bg-'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name ='uploads/website-images/'.$image_name;
            Image::make($request->home1_foreground)
                ->save(public_path().'/'.$image_name);
            $homepage->app_home1_foreground = $image_name;
            $homepage->save();
            if($old_image){
                if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
            }
        }

        if($request->home2_background){
            $old_image = $homepage->app_home2_background;
            $extention=$request->home2_background->getClientOriginalExtension();
            $image_name = 'mobile-app-bg-'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name ='uploads/website-images/'.$image_name;
            Image::make($request->home2_background)
                ->save(public_path().'/'.$image_name);
            $homepage->app_home2_background = $image_name;
            $homepage->save();
            if($old_image){
                if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
            }
        }

        if($request->home2_foreground){
            $old_image = $homepage->app_home2_foreground;
            $extention=$request->home2_foreground->getClientOriginalExtension();
            $image_name = 'mobile-app-bg-'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name ='uploads/website-images/'.$image_name;
            Image::make($request->home2_foreground)
                ->save(public_path().'/'.$image_name);
            $homepage->app_home2_foreground = $image_name;
            $homepage->save();
            if($old_image){
                if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
            }
        }

        if($request->home3_background){
            $old_image = $homepage->app_home3_background;
            $extention=$request->home3_background->getClientOriginalExtension();
            $image_name = 'mobile-app-bg-'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name ='uploads/website-images/'.$image_name;
            Image::make($request->home3_background)
                ->save(public_path().'/'.$image_name);
            $homepage->app_home3_background = $image_name;
            $homepage->save();
            if($old_image){
                if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
            }
        }

        if($request->home3_foreground){
            $old_image = $homepage->app_home3_foreground;
            $extention=$request->home3_foreground->getClientOriginalExtension();
            $image_name = 'mobile-app-bg-'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name ='uploads/website-images/'.$image_name;
            Image::make($request->home3_foreground)
                ->save(public_path().'/'.$image_name);
            $homepage->app_home3_foreground = $image_name;
            $homepage->save();
            if($old_image){
                if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
            }
        }

        if ($home2) {
            $homepage_language->app_home2_title = $request->home2_title;
            $homepage_language->app_home2_desc = $request->home2_desc;
        }
        if ($home1) {
            $homepage_language->app_title1 = $request->title1;
            $homepage_language->app_description = $request->description;
        }
        if ($home3) {
            $homepage_language->app_home3_title = $request->home3_title;
            $homepage_language->app_home3_desc = $request->home3_desc;
        }

        $homepage_language->save();

        $notification= trans('admin_validation.Update Successfully');
        $notification=array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    public function counter(Request $request){
        $homepage = Homepage::with('homelangadmin')->first();
        $languages = Language::get();
        $homepage_language = HomepageLanguage::where(['home_id' => $homepage->id, 'lang_code' => $request->lang_code])->first();

        $counter = (object) array(
            'counter1_value' => $homepage->counter1_value,
            'counter2_value' => $homepage->counter2_value,
            'counter3_value' => $homepage->counter3_value,
            'counter4_value' => $homepage->counter4_value,
            'counter1_title' => $homepage_language->counter1_title,
            'counter2_title' => $homepage_language->counter2_title,
            'counter3_title' => $homepage_language->counter3_title,
            'counter4_title' => $homepage_language->counter4_title,
            'counter1_description' => $homepage->counter1_description,
            'counter2_description' => $homepage->counter2_description,
            'counter3_description' => $homepage->counter3_description,
            'item1_title' => $homepage->counter_item1_title,
            'item1_description' => $homepage->counter_item1_description,
            'item1_link' => $homepage->counter_item1_link,
            'item1_icon' => $homepage->counter_item1_icon,
            'item2_title' => $homepage->counter_item2_title,
            'item2_description' => $homepage->counter_item2_description,
            'item2_link' => $homepage->counter_item2_link,
            'item2_icon' => $homepage->counter_item2_icon,
            'counter_icon1' => $homepage->counter_icon1,
            'counter_icon2' => $homepage->counter_icon2,
            'counter_icon3' => $homepage->counter_icon3,
            'counter_icon4' => $homepage->counter_icon4,
            'counter_icon5' => $homepage->counter_icon5,
            'counter_icon6' => $homepage->counter_icon6,
            'counter_icon7' => $homepage->counter_icon7,
            'counter_icon8' => $homepage->counter_icon8,
            'home1_background' => $homepage->counter_home1_background,
            'home2_background' => $homepage->counter_home2_background,
        );

        return view('admin.create_counter', compact('counter', 'languages'));
    }

    public function update_counter(Request $request){
        $rules = [
            'counter1_value'=>session()->get('admin_lang') == $request->lang_code ? 'required':'',
            'counter2_value'=>session()->get('admin_lang') == $request->lang_code ? 'required':'',
            'counter3_value'=>session()->get('admin_lang') == $request->lang_code ? 'required':'',
            'counter4_value'=>session()->get('admin_lang') == $request->lang_code ? 'required':'',
            'counter1_title'=>'required',
            'counter2_title'=>'required',
            'counter3_title'=>'required',
            'counter4_title'=>'required',
        ];
        $customMessages = [
            'counter1_value.required' => trans('admin_validation.Quantity is required'),
            'counter2_value.required' => trans('admin_validation.Quantity is required'),
            'counter3_value.required' => trans('admin_validation.Quantity is required'),
            'counter4_value.required' => trans('admin_validation.Quantity is required'),
            'counter1_title.required' => trans('admin_validation.Title is required'),
            'counter2_title.required' => trans('admin_validation.Title is required'),
            'counter3_title.required' => trans('admin_validation.Title is required'),
            'counter4_title.required' => trans('admin_validation.Title is required'),

        ];
        $this->validate($request, $rules,$customMessages);

        $homepage = Homepage::with('homelangadmin')->first();
        $homepage_language = HomepageLanguage::where(['home_id' => $homepage->id, 'lang_code' => $request->lang_code])->first();

        if($request->counter1_value){
            $homepage->counter1_value = $request->counter1_value;
        }

        if($request->counter2_value){
            $homepage->counter2_value = $request->counter2_value;
        }

        if($request->counter3_value){
            $homepage->counter3_value = $request->counter3_value;
        }

        if($request->counter4_value){
            $homepage->counter4_value = $request->counter4_value;
        }

        $homepage->save();

        if($request->counter_icon1){
            $old_image = $homepage->counter_icon1;
            $extention=$request->counter_icon1->getClientOriginalExtension();
            $image_name = 'counter-'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name ='uploads/website-images/'.$image_name;
            Image::make($request->counter_icon1)
                ->save(public_path().'/'.$image_name);
            $homepage->counter_icon1 = $image_name;
            $homepage->save();
            if($old_image){
                if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
            }
        }

        if($request->counter_icon2){
            $old_image = $homepage->counter_icon2;
            $extention=$request->counter_icon2->getClientOriginalExtension();
            $image_name = 'counter-'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name ='uploads/website-images/'.$image_name;
            Image::make($request->counter_icon2)
                ->save(public_path().'/'.$image_name);
            $homepage->counter_icon2 = $image_name;
            $homepage->save();
            if($old_image){
                if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
            }
        }

        if($request->counter_icon3){
            $old_image = $homepage->counter_icon3;
            $extention=$request->counter_icon3->getClientOriginalExtension();
            $image_name = 'counter-'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name ='uploads/website-images/'.$image_name;
            Image::make($request->counter_icon3)
                ->save(public_path().'/'.$image_name);
            $homepage->counter_icon3 = $image_name;
            $homepage->save();
            if($old_image){
                if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
            }
        }

        if($request->counter_icon4){
            $old_image = $homepage->counter_icon4;
            $extention=$request->counter_icon4->getClientOriginalExtension();
            $image_name = 'counter-'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name ='uploads/website-images/'.$image_name;
            Image::make($request->counter_icon4)
                ->save(public_path().'/'.$image_name);
            $homepage->counter_icon4 = $image_name;
            $homepage->save();
            if($old_image){
                if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
            }
        }

        if($request->counter_icon5){
            $old_image = $homepage->counter_icon5;
            $extention=$request->counter_icon5->getClientOriginalExtension();
            $image_name = 'counter-'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name ='uploads/website-images/'.$image_name;
            Image::make($request->counter_icon5)
                ->save(public_path().'/'.$image_name);
            $homepage->counter_icon5 = $image_name;
            $homepage->save();
            if($old_image){
                if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
            }
        }

        if($request->counter_icon6){
            $old_image = $homepage->counter_icon6;
            $extention=$request->counter_icon6->getClientOriginalExtension();
            $image_name = 'counter-'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name ='uploads/website-images/'.$image_name;
            Image::make($request->counter_icon6)
                ->save(public_path().'/'.$image_name);
            $homepage->counter_icon6 = $image_name;
            $homepage->save();
            if($old_image){
                if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
            }
        }

        if($request->counter_icon7){
            $old_image = $homepage->counter_icon7;
            $extention=$request->counter_icon7->getClientOriginalExtension();
            $image_name = 'counter-'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name ='uploads/website-images/'.$image_name;
            Image::make($request->counter_icon7)
                ->save(public_path().'/'.$image_name);
            $homepage->counter_icon7 = $image_name;
            $homepage->save();
            if($old_image){
                if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
            }
        }

        if($request->counter_icon8){
            $old_image = $homepage->counter_icon8;
            $extention=$request->counter_icon8->getClientOriginalExtension();
            $image_name = 'counter-'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name ='uploads/website-images/'.$image_name;
            Image::make($request->counter_icon8)
                ->save(public_path().'/'.$image_name);
            $homepage->counter_icon8 = $image_name;
            $homepage->save();
            if($old_image){
                if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
            }
        }

        if($request->home2_background){
            $old_image = $homepage->counter_home2_background;
            $extention=$request->home2_background->getClientOriginalExtension();
            $image_name = 'counter-'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name ='uploads/website-images/'.$image_name;
            Image::make($request->home2_background)
                ->save(public_path().'/'.$image_name);
            $homepage->counter_home2_background = $image_name;
            $homepage->save();
            if($old_image){
                if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
            }
        }

        $homepage_language->counter1_title = $request->counter1_title;
        $homepage_language->counter2_title = $request->counter2_title;
        $homepage_language->counter3_title = $request->counter3_title;
        $homepage_language->counter4_title = $request->counter4_title;
        $homepage_language->save();

        $notification= trans('admin_validation.Update Successfully');
        $notification=array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    public function offer(Request $request){

        $homepage = Homepage::with('homelangadmin')->first();
        $languages = Language::get();
        $homepage_language = HomepageLanguage::where(['home_id' => $homepage->id, 'lang_code' => $request->lang_code])->first();

        $offer = (object) array(
            'title1' => $homepage_language->offer_title1,
            'title2' => $homepage_language->offer_title2,
            'link' => $homepage->offer_link,
            'home3_background' => $homepage->offer_home3_background,
            'home3_item1_image' => $homepage->offer_home3_item1_image,
            'home3_item2_image' => $homepage->offer_home3_item2_image,
            'home3_item1_title' => $homepage_language->offer_home3_item1_title,
            'home3_item1_description' => $homepage_language->offer_home3_item1_description,
            'home3_item1_link' => $homepage->offer_home3_item1_link,
            'home3_item2_title' => $homepage_language->offer_home3_item2_title,
            'home3_item2_description' => $homepage_language->offer_home3_item2_description,
            'home3_item2_link' => $homepage->offer_home3_item2_link,
            'about_offer_title1' => $homepage_language->about_offer_title1,
            'about_offer_title2' => $homepage_language->about_offer_title2,
            'about_offer_title3' => $homepage_language->about_offer_title3,
            'about_offer_link' => $homepage->about_offer_link,
            'about_offer_background' => $homepage->about_offer_background,
        );

        return view('admin.offer', compact('offer', 'languages'));
    }

    public function update_offer(Request $request){
        $setting = Setting::first();
        $home1= false;
        if($setting->selected_theme == 0 || $setting->selected_theme == 1){
            $home1 = true;
        }

        $home2= false;
        if($setting->selected_theme == 0 || $setting->selected_theme == 2){
            $home2 = true;
        }

        $home3 = false;
        if($setting->selected_theme == 0 || $setting->selected_theme == 3){
            $home3 = true;
        }

        $rules = [
            'title1'=> $home1 || $home3 ? 'required':'',
            'link'=>session()->get('admin_lang') == $request->lang_code && ($home1 || $home3) ? 'required':'',
            'home3_item1_title'=> $home3 ? 'required':'',
            'home3_item1_description'=>$home3 ? 'required':'',
            'home3_item1_link'=>session()->get('admin_lang') == $request->lang_code && $home3 ? 'required':'',
            'home3_item2_title'=>$home3 ? 'required':'',
            'home3_item2_description'=>$home3 ? 'required':'',
            'home3_item2_link'=>session()->get('admin_lang') == $request->lang_code && $home3 ? 'required':'',
            'about_offer_title1'=>'required',
            'about_offer_title3'=>'required',
            'about_offer_link'=>session()->get('admin_lang') == $request->lang_code ? 'required':'',
        ];
        $customMessages = [
            'title1.required' => trans('admin_validation.Title is required'),
            'title2.required' => trans('admin_validation.Title is required'),
            'link.required' => trans('admin_validation.Link is required'),
            'home3_item1_title.required' => trans('admin_validation.Link is required'),
            'home3_item1_description.required' => trans('admin_validation.Description is required'),
            'home3_item1_link.required' => trans('admin_validation.Link is required'),
            'home3_item2_title.required' => trans('admin_validation.Link is required'),
            'home3_item2_description.required' => trans('admin_validation.Description is required'),
            'home3_item2_link.required' => trans('admin_validation.Link is required'),
            'about_offer_title1.required' => trans('admin_validation.Title is required'),
            'about_offer_title2.required' => trans('admin_validation.Title is required'),
            'about_offer_title3.required' => trans('admin_validation.Title is required'),
            'about_offer_link.required' => trans('admin_validation.Link is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $homepage = Homepage::with('homelangadmin')->first();
        $homepage_language = HomepageLanguage::where(['home_id' => $homepage->id, 'lang_code' => $request->lang_code])->first();

        if(session()->get('admin_lang') == $request->lang_code && ($home1 || $home3)){
            $homepage->offer_link = session()->get('admin_lang') == $request->lang_code;
        }

        if($request->home3_item1_link  && $home3){
            $homepage->offer_home3_item1_link = $request->home3_item1_link;
        }

        if($request->home3_item2_link  && $home3){
            $homepage->offer_home3_item2_link = $request->home3_item2_link;
        }

        if($request->about_offer_link){
            $homepage->about_offer_link = $request->about_offer_link;
        }

        if($request->link){
            $homepage->offer_link = $request->link;
        }

        $homepage->save();

        if($request->home3_background){
            $old_image = $homepage->offer_home3_background;
            $extention=$request->home3_background->getClientOriginalExtension();
            $image_name = 'offer-'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name ='uploads/website-images/'.$image_name;
            Image::make($request->home3_background)
                ->save(public_path().'/'.$image_name);
            $homepage->offer_home3_background = $image_name;
            $homepage->save();
            if($old_image){
                if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
            }
        }

        if($request->home3_item1_image){
            $old_image = $homepage->home3_item1_image;
            $extention=$request->home3_item1_image->getClientOriginalExtension();
            $image_name = 'offer-'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name ='uploads/website-images/'.$image_name;
            Image::make($request->home3_item1_image)
                ->save(public_path().'/'.$image_name);
            $homepage->offer_home3_item1_image = $image_name;
            $homepage->save();
            if($old_image){
                if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
            }
        }

        if($request->home3_item2_image){
            $old_image = $homepage->home3_item2_image;
            $extention=$request->home3_item2_image->getClientOriginalExtension();
            $image_name = 'offer-'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name ='uploads/website-images/'.$image_name;
            Image::make($request->home3_item2_image)
                ->save(public_path().'/'.$image_name);
            $homepage->offer_home3_item2_image = $image_name;
            $homepage->save();
            if($old_image){
                if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
            }
        }

        if($request->about_offer_background){
            $old_image = $homepage->about_offer_background;
            $extention=$request->about_offer_background->getClientOriginalExtension();
            $image_name = 'offer-'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name ='uploads/website-images/'.$image_name;
            Image::make($request->about_offer_background)
                ->save(public_path().'/'.$image_name);
            $homepage->about_offer_background = $image_name;
            $homepage->save();
            if($old_image){
                if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
            }
        }


        if ($home1 || $home3) {
            $homepage_language->offer_title1 = $request->title1;
            $homepage_language->offer_title2 = $request->title1;
        }

        if($home3){
            $homepage_language->offer_home3_item1_title = $request->home3_item1_title;
            $homepage_language->offer_home3_item1_description = $request->home3_item1_description;
            $homepage_language->offer_home3_item2_title = $request->home3_item2_title;
            $homepage_language->offer_home3_item2_description = $request->home3_item2_description;
        }
        $homepage_language->about_offer_title1 = $request->about_offer_title1;
        $homepage_language->about_offer_title3 = $request->about_offer_title3;

        $homepage_language->save();

        $notification= trans('admin_validation.Updated Successfully');
        $notification=array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }


    public function trending_offer(Request $request){

        $homepage = Homepage::with('homelangadmin')->first();
        $languages = Language::get();
        $homepage_language = HomepageLanguage::where(['home_id' => $homepage->id, 'lang_code' => $request->lang_code])->first();

        $trending_offer = (object) array(
            'image' => $homepage->trending_offer_image,
            'title1' => $homepage_language->trending_offer_title1,
            'title2' => $homepage_language->trending_offer_title2,
            'link' => $homepage->trending_offer_link,
        );

        return view('admin.trending_offer', compact('trending_offer', 'languages'));
    }


    public function update_trending_offer(Request $request){
        $rules = [
            'title1'=>'required',
            'title2'=>'required',
            'link'=> session()->get('admin_lang') == $request->lang_code ? 'required':'',
        ];
        $customMessages = [
            'title1.required' => trans('admin_validation.Title is required'),
            'title2.required' => trans('admin_validation.Title is required'),
            'link.required' => trans('admin_validation.Link is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $homepage = Homepage::with('homelangadmin')->first();

        $homepage_language = HomepageLanguage::where(['home_id' => $homepage->id, 'lang_code' => $request->lang_code])->first();

        if(session()->get('admin_lang') == $request->lang_code){
            $homepage->trending_offer_link = session()->get('admin_lang') == $request->lang_code;
            $homepage->save();
        }

        if($request->image){
            $old_image = $homepage->trending_offer_image;
            $extention=$request->image->getClientOriginalExtension();
            $image_name = 'offer-'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name ='uploads/website-images/'.$image_name;
            Image::make($request->image)
                ->save(public_path().'/'.$image_name);
            $homepage->trending_offer_image = $image_name;
            $homepage->save();
            if($old_image){
                if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
            }
        }

        $homepage_language->trending_offer_title1 = $request->title1;
        $homepage_language->trending_offer_title2 = $request->title2;

        if($request->link){
            $homepage->trending_offer_link = $request->link;
            $homepage->save();
        }

        $homepage_language->save();

        $notification= trans('admin_validation.Updated Successfully');
        $notification=array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }
}
