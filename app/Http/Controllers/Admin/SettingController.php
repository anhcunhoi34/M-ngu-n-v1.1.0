<?php

namespace App\Http\Controllers\Admin;

use File;
use Image;
use Artisan;
use Session;
use Validator;
use App\Models\Faq;
use App\Models\Blog;
use App\Models\User;
use App\Models\Admin;
use App\Models\Order;
use App\Models\Coupon;
use App\Models\Review;
use App\Models\Ticket;
use App\Models\Message;
use App\Models\OurTeam;
use App\Models\Partner;
use App\Models\Product;
use App\Models\Service;
use App\Models\Setting;
use App\Models\Category;
use App\Models\Currency;
use App\Models\Language;
use App\Models\Schedule;
use App\Models\TawkChat;
use App\Models\Template;
use App\Models\Wishlist;
use App\Models\OrderItem;
use App\Models\CustomPage;
use App\Models\FooterLink;
use App\Models\PopularTag;

use App\Models\Subscriber;
use App\Models\BlogComment;
use App\Models\FaqLanguage;
use App\Models\PopularPost;
use App\Models\Testimonial;
use App\Models\BlogCategory;
use App\Models\BlogLanguage;
use Illuminate\Http\Request;
use App\Models\CookieConsent;
use App\Models\FacebookPixel;
use App\Models\RefundRequest;


use App\Models\ScriptContent;
use App\Models\TicketMessage;
use App\Models\ContactMessage;
use App\Models\FooterLanguage;
use App\Models\GoogleAnalytic;
use App\Models\ProductComment;
use App\Models\ProductVariant;
use App\Models\SectionContent;
use App\Models\SliderLanguage;
use App\Models\WithdrawMethod;
use App\Models\AboutUsLanguage;
use App\Models\CompleteRequest;
use App\Models\GoogleRecaptcha;
use App\Models\MessageDocument;
use App\Models\OurTeamLanguage;
use App\Models\ProductLanguage;
use App\Models\SettingLanguage;
use App\Models\CategoryLanguage;
use App\Models\CustomPagination;
use App\Models\FooterSocialLink;
use App\Models\HomepageLanguage;
use App\Models\ProviderWithdraw;
use App\Models\PusherCredentail;
use App\Models\TemplateLanguage;
use App\Models\CustomPageLanguage;
use App\Models\AppointmentSchedule;
use App\Models\ContactPageLanguage;
use App\Models\ProductItemLanguage;
use App\Models\TestimonialLanguage;
use App\Http\Controllers\Controller;
use App\Models\BecomeAuthorLanguage;
use App\Models\BlogCategoryLanguage;
use App\Models\PrivacyPolicyLanguage;
use App\Models\ScriptContentLanguage;
use App\Models\SectionContentLanguage;
use App\Models\SocialLoginInformation;
use App\Models\ProductDiscountLanguage;
use App\Models\ProductTypePageLanguage;
use App\Models\TermsAndConditionLanguage;

class SettingController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function clearDatabase(){
        Blog::truncate();
        BlogLanguage::truncate();
        PopularPost::truncate();
        PopularTag::truncate();
        BlogCategory::truncate();
        BlogCategoryLanguage::truncate();
        BlogComment::truncate();
        Category::truncate();
        CategoryLanguage::truncate();
        ContactMessage::truncate();
        Faq::truncate();
        FaqLanguage::truncate();
        FooterLink::truncate();
        FooterSocialLink::truncate();
        Product::truncate();
        ProductLanguage::truncate();
        ProductVariant::truncate();
        ProductComment::truncate();
        Message::truncate();
        MessageDocument::truncate();
        Order::truncate();
        OrderItem::truncate();
        Coupon::truncate();
        ProviderWithdraw::truncate();
        OurTeam::truncate();
        OurTeamLanguage::truncate();
        Partner::truncate();
        Review::truncate();
        Subscriber::truncate();
        Testimonial::truncate();
        TestimonialLanguage::truncate();
        User::truncate();
        WithdrawMethod::truncate();
        Wishlist::truncate();
        CustomPage::truncate();
        CustomPageLanguage::truncate();




        // pending ----
        $admins = Admin::where('id', '!=', 1)->get();
        foreach($admins as $admin){
            $admin_image = $admin->image;
            $admin->delete();
            if($admin_image){
                if(File::exists(public_path().'/'.$admin_image))unlink(public_path().'/'.$admin_image);
            }
        }

        $content_languages = SectionContentLanguage::where('lang_code', '!=', 'en')->get();
        foreach($content_languages as $content){
            $content->delete();
        }

        $slider_languages = SliderLanguage::where('lang_code', '!=', 'en')->get();
        foreach($slider_languages as $slider){
            $slider->delete();
        }

        $homepage_language = HomepageLanguage::where('lang_code', '!=', 'en')->get();
        foreach($homepage_language as $homepage){
            $homepage->delete();
        }

        $product_discount_languages = ProductDiscountLanguage::where('lang_code', '!=', 'en')->get();
        foreach($product_discount_languages as $discount){
            $discount->delete();
        }

        $template_languages = TemplateLanguage::where('lang_code', '!=', 'en')->get();
        foreach($template_languages as $template){
            $template->delete();
        }

        $setting_languages = SettingLanguage::where('lang_code', '!=', 'en')->get();
        foreach($setting_languages as $setting){
            $setting->delete();
        }

        $script_content_languages = ScriptContentLanguage::where('lang_code', '!=', 'en')->get();
        foreach($script_content_languages as $script_content){
            $script_content->delete();
        }

        $product_item_languages = ProductItemLanguage::where('lang_code', '!=', 'en')->get();
        foreach($product_item_languages as $product_item){
            $product_item->delete();
        }

        $product_type_languages = ProductTypePageLanguage::where('lang_code', '!=', 'en')->get();
        foreach($product_type_languages as $product_type){
            $product_type->delete();
        }

        $footer_languages = FooterLanguage::where('lang_code', '!=', 'en')->get();
        foreach($footer_languages as $footer){
            $footer->delete();
        }

        $about_languages = AboutUsLanguage::where('lang_code', '!=', 'en')->get();
        foreach($about_languages as $about){
            $about->delete();
        }

        $become_languages = BecomeAuthorLanguage::where('lang_code', '!=', 'en')->get();
        foreach($become_languages as $become){
            $become->delete();
        }

        $contact_page_languages = ContactPageLanguage::where('lang_code', '!=', 'en')->get();
        foreach($contact_page_languages as $contact_page){
            $contact_page->delete();
        }

        $terms_condition_languages = TermsAndConditionLanguage::where('lang_code', '!=', 'en')->get();
        foreach($terms_condition_languages as $terms_condition_language){
            $terms_condition_language->delete();
        }

        $privacy_policy_languages = PrivacyPolicyLanguage::where('lang_code', '!=', 'en')->get();
        foreach($privacy_policy_languages as $privacy_policy_language){
            $privacy_policy_language->delete();
        }

        $languages = Language::where('id', '!=', 1)->get();
        foreach($languages as $language){

            $path = base_path().'/lang'.'/'.$language->lang_code;
            if (File::exists($path)) {
                File::deleteDirectory($path);
            }
            
            $language->delete();
        }

        $language = Language::first();
        $language->is_default = 'Yes';
        $language->save();

        $folderPath = public_path('uploads/custom-images');
        $response = File::deleteDirectory($folderPath);

        $path = public_path('uploads/custom-images');
        if(!File::isDirectory($path)){
            File::makeDirectory($path, 0777, true, true);
        }

        Session::forget('front_lang');

        $notification = trans('admin_validation.Database Cleared Successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    public function index(){
        $setting = Setting::first();
        $cookieConsent = CookieConsent::first();
        $googleRecaptcha = GoogleRecaptcha::first();
        $tawkChat = TawkChat::first();
        $googleAnalytic = GoogleAnalytic::first();
        $customPaginations = CustomPagination::all();
        $socialLogin = SocialLoginInformation::first();
        $facebookPixel = FacebookPixel::first();
        $pusher = PusherCredentail::first();
        $currencies = Currency::orderBy('name','asc')->get();
        $selected_theme = $setting->selected_theme;

        return view('admin.setting',compact('setting','cookieConsent','googleRecaptcha','tawkChat','googleAnalytic','customPaginations','socialLogin','facebookPixel','currencies','pusher','selected_theme'));
    }

    public function updateThemeColor(Request $request){
        $setting = Setting::first();
        $setting->theme_one_color = $request->theme_one_color;
        $setting->theme_two_color = $request->theme_two_color;
        $setting->theme_three_color = $request->theme_three_color;
        $setting->save();

        $notification = trans('admin_validation.Update Successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    public function updateCustomPagination(Request $request){

        foreach($request->quantities as $index => $quantity){
            if($request->quantities[$index]==''){
                $notification=array(
                    'messege'=> trans('admin_validation.Every field is required'),
                    'alert-type'=>'error'
                );

                return redirect()->back()->with($notification);
            }

            $customPagination=CustomPagination::find($request->ids[$index]);
            $customPagination->qty=$request->quantities[$index];
            $customPagination->save();
        }

        $notification = trans('admin_validation.Update Successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);

    }

    public function updateGeneralSetting(Request $request){
        $rules = [
            'lg_header' => 'required',
            'sm_header' => 'required',
            'currency_name' => 'required',
            'currency_icon' => 'required',
            'timezone' => 'required',
            'selected_theme' => 'required',
        ];
        $customMessages = [
            'lg_header.required' => trans('admin_validation.Sidebar large header is required'),
            'sm_header.required' => trans('admin_validation.Sidebar small header is required'),
            'currency_name.required' => trans('admin_validation.Currency name is required'),
            'currency_icon.required' => trans('admin_validation.Currency icon is required'),
            'timezone.required' => trans('admin_validation.Timezone is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $setting = Setting::first();
        $setting->selected_theme = $request->selected_theme;
        $setting->blog_left_right = $request->blog_left_right;
        $setting->sidebar_lg_header = $request->lg_header;
        $setting->sidebar_sm_header = $request->sm_header;
        $setting->currency_name = $request->currency_name;
        $setting->currency_icon = $request->currency_icon;
        $setting->timezone = $request->timezone;
        $setting->save();

        $notification = trans('admin_validation.Update Successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    public function updateCookieConset(Request $request){
        $rules = [
            'allow' => 'required',
            'border' => 'required',
            'corners' => 'required',
            'background_color' => 'required',
            'text_color' => 'required',
            'border_color' => 'required',
            'button_color' => 'required',
            'btn_text_color' => 'required',
            'link_text' => 'required',
            'btn_text' => 'required',
            'message' => 'required',
        ];
        $customMessages = [
            'allow.required' => trans('admin_validation.Allow is required'),
            'border.required' => trans('admin_validation.Border is required'),
            'corners.required' => trans('admin_validation.Corner is required'),
            'background_color.required' => trans('admin_validation.Background color is required'),
            'text_color.required' => trans('admin_validation.Text color is required'),
            'border_color.required' => trans('admin_validation.Border Color is required'),
            'button_color.required' => trans('admin_validation.Button color is required'),
            'btn_text_color.required' => trans('admin_validation.Button text color is required'),
            'link_text.required' => trans('admin_validation.Link text is required'),
            'btn_text.required' => trans('admin_validation.Button text is required'),
            'message.required' => trans('admin_validation.Message is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $cookieConsent = CookieConsent::first();
        $cookieConsent->status = $request->allow;
        $cookieConsent->border = $request->border;
        $cookieConsent->corners = $request->corners;
        $cookieConsent->background_color = $request->background_color;
        $cookieConsent->text_color = $request->text_color;
        $cookieConsent->border_color = $request->border_color;
        $cookieConsent->btn_bg_color = $request->button_color;
        $cookieConsent->btn_text_color = $request->btn_text_color;
        $cookieConsent->link_text = $request->link_text;
        $cookieConsent->btn_text = $request->btn_text;
        $cookieConsent->message = $request->message;
        $cookieConsent->save();

        $notification = trans('admin_validation.Update Successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    public function updateTawkChat(Request $request){
        $rules = [
            'allow' => 'required',
            'chat_link' => $request->allow == 1 ?  'required' : ''
        ];
        $customMessages = [
            'allow.required' => trans('admin_validation.Allow is required'),
            'chat_link.required' => trans('admin_validation.Chat link is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $tawkChat = TawkChat::first();
        $tawkChat->status = $request->allow;
        $tawkChat->chat_link = $request->chat_link;
        $tawkChat->save();

        $notification = trans('admin_validation.Update Successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    public function updateGoogleAnalytic(Request $request){
        $rules = [
            'allow' => 'required',
            'analytic_id' => $request->allow == 1 ?  'required' : ''
        ];
        $customMessages = [
            'allow.required' => trans('admin_validation.Allow is required'),
            'analytic_id.required' => trans('admin_validation.Analytic id is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $googleAnalytic = GoogleAnalytic::first();
        $googleAnalytic->status = $request->allow;
        $googleAnalytic->analytic_id = $request->analytic_id;
        $googleAnalytic->save();

        $notification = trans('admin_validation.Update Successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }


    public function updateGoogleRecaptcha(Request $request){

        $rules = [
            'site_key' => $request->allow == 1 ?  'required' : '',
            'secret_key' => $request->allow == 1 ?  'required' : '',
            'allow' => 'required',
        ];
        $customMessages = [
            'site_key.required' => trans('admin_validation.Site key is required'),
            'secret_key.required' => trans('admin_validation.Secret key is required'),
            'allow.required' => trans('admin_validation.Allow is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $googleRecaptcha = GoogleRecaptcha::first();
        $googleRecaptcha->status = $request->allow;
        $googleRecaptcha->site_key = $request->site_key;
        $googleRecaptcha->secret_key = $request->secret_key;
        $googleRecaptcha->save();

        $notification = trans('admin_validation.Update Successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);

    }

    public function updateLogoFavicon(Request $request){
        $setting = Setting::first();
        if($request->logo){
            $old_logo=$setting->logo;
            $image=$request->logo;
            $ext=$image->getClientOriginalExtension();
            $logo_name= 'logo-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$ext;
            $logo_name='uploads/website-images/'.$logo_name;
            $logo=Image::make($image)
                    ->save(public_path().'/'.$logo_name);
            $setting->logo=$logo_name;
            $setting->save();
            if($old_logo){
                if(File::exists(public_path().'/'.$old_logo))unlink(public_path().'/'.$old_logo);
            }
        }

        if($request->logo_two){
            $old_logo=$setting->logo_two;
            $image=$request->logo_two;
            $ext=$image->getClientOriginalExtension();
            $logo_name= 'logo-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$ext;
            $logo_name='uploads/website-images/'.$logo_name;
            $logo=Image::make($image)
                    ->save(public_path().'/'.$logo_name);
            $setting->logo_two=$logo_name;
            $setting->save();
            if($old_logo){
                if(File::exists(public_path().'/'.$old_logo))unlink(public_path().'/'.$old_logo);
            }
        }

        if($request->logo_three){
            $old_logo=$setting->logo_three;
            $image=$request->logo_three;
            $ext=$image->getClientOriginalExtension();
            $logo_name= 'logo-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$ext;
            $logo_name='uploads/website-images/'.$logo_name;
            $logo=Image::make($image)
                    ->save(public_path().'/'.$logo_name);
            $setting->logo_three=$logo_name;
            $setting->save();
            if($old_logo){
                if(File::exists(public_path().'/'.$old_logo))unlink(public_path().'/'.$old_logo);
            }
        }

        if($request->footer_logo){
            $old_logo=$setting->footer_logo;
            $image=$request->footer_logo;
            $ext=$image->getClientOriginalExtension();
            $logo_name= 'logo-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$ext;
            $logo_name='uploads/website-images/'.$logo_name;
            $logo=Image::make($image)
                    ->save(public_path().'/'.$logo_name);
            $setting->footer_logo=$logo_name;
            $setting->save();
            if($old_logo){
                if(File::exists(public_path().'/'.$old_logo))unlink(public_path().'/'.$old_logo);
            }
        }

        if($request->footer_logo_two){
            $old_logo=$setting->footer_logo_two;
            $image=$request->footer_logo_two;
            $ext=$image->getClientOriginalExtension();
            $logo_name= 'logo-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$ext;
            $logo_name='uploads/website-images/'.$logo_name;
            $logo=Image::make($image)
                    ->save(public_path().'/'.$logo_name);
            $setting->footer_logo_two=$logo_name;
            $setting->save();
            if($old_logo){
                if(File::exists(public_path().'/'.$old_logo))unlink(public_path().'/'.$old_logo);
            }
        }

        if($request->footer_logo_three){
            $old_logo=$setting->footer_logo_three;
            $image=$request->footer_logo_three;
            $ext=$image->getClientOriginalExtension();
            $logo_name= 'logo-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$ext;
            $logo_name='uploads/website-images/'.$logo_name;
            $logo=Image::make($image)
                    ->save(public_path().'/'.$logo_name);
            $setting->footer_logo_three=$logo_name;
            $setting->save();
            if($old_logo){
                if(File::exists(public_path().'/'.$old_logo))unlink(public_path().'/'.$old_logo);
            }
        }



        if($request->favicon){
            $old_favicon=$setting->favicon;
            $favicon=$request->favicon;
            $ext=$favicon->getClientOriginalExtension();
            $favicon_name= 'favicon-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$ext;
            $favicon_name='uploads/website-images/'.$favicon_name;
            Image::make($favicon)
                    ->save(public_path().'/'.$favicon_name);
            $setting->favicon=$favicon_name;
            $setting->save();
            if($old_favicon){
                if(File::exists(public_path().'/'.$old_favicon))unlink(public_path().'/'.$old_favicon);
            }
        }

        $notification = trans('admin_validation.Update Successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    public function showClearDatabasePage(){
        return view('admin.clear_database');
    }




    public function updateSocialLogin(Request $request){

        $rules = [
            'gmail_client_id' => $request->allow_gmail_login ?  'required' : '',
            'gmail_secret_id' => $request->allow_gmail_login ?  'required' : '',
            'gmail_redirect_url' => $request->allow_gmail_login ?  'required' : '',
        ];
        $customMessages = [
            'gmail_client_id.required' => trans('admin_validation.Gmail client id is required'),
            'gmail_secret_id.required' => trans('admin_validation.Gmail secret id is required'),
            'gmail_redirect_url.required' => trans('admin_validation.Gmail redirect url is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $socialLogin = SocialLoginInformation::first();
        $socialLogin->is_gmail = $request->allow_gmail_login ? 1 : 0;
        $socialLogin->gmail_client_id = $request->gmail_client_id;
        $socialLogin->gmail_secret_id = $request->gmail_secret_id;
        $socialLogin->gmail_redirect_url = $request->gmail_redirect_url;
        $socialLogin->save();

        $notification = trans('admin_validation.Update Successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    public function updateFacebookPixel(Request $request){

        $rules = [
            'app_id' => $request->allow_facebook_pixel ?  'required' : '',
        ];
        $customMessages = [
            'app_id.required' => trans('admin_validation.App id is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $facebookPixel = FacebookPixel::first();
        $facebookPixel->app_id = $request->app_id;
        $facebookPixel->status = $request->allow_facebook_pixel ? 1 : 0;
        $facebookPixel->save();

        $notification = trans('admin_validation.Update Successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    public function updatePusher(Request $request){
        $rules = [
            'app_id' => 'required',
            'app_key' => 'required',
            'app_secret' => 'required',
            'app_cluster' => 'required',
        ];
        $customMessages = [
            'app_id.required' => trans('admin_validation.App id is required'),
            'app_key.required' => trans('admin_validation.App key is required'),
            'app_secret.required' => trans('admin_validation.App secret is required'),
            'app_cluster.required' => trans('admin_validation.App cluster is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $pusher = PusherCredentail::first();
        $pusher->app_id = $request->app_id;
        $pusher->app_key = $request->app_key;
        $pusher->app_secret = $request->app_secret;
        $pusher->app_cluster = $request->app_cluster;
        $pusher->save();

        Artisan::call("env:set PUSHER_APP_ID='". $request->app_id ."'");
        Artisan::call("env:set PUSHER_APP_KEY='". $request->app_key ."'");
        Artisan::call("env:set PUSHER_APP_SECRET='". $request->app_secret ."'");
        Artisan::call("env:set PUSHER_APP_CLUSTER='". $request->app_cluster ."'");


        $notification = trans('admin_validation.Update Successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }
}
