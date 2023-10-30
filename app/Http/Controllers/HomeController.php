<?php

namespace App\Http\Controllers;

use Str;

use Auth;
use Hash;
use Mail;
use Image;
use Session;
use App\Models\Ad;
use App\Models\Faq;
use App\Models\Blog;
use App\Models\City;
use App\Models\User;
use App\Models\Order;
use App\Models\Review;
use App\Models\Slider;
use App\Rules\Captcha;
use App\Models\AboutUs;
use App\Models\Counter;
use App\Models\Country;
use App\Models\OurTeam;
use App\Models\Partner;
use App\Models\Product;
use App\Models\Service;
use App\Models\Setting;
use App\Models\Category;
use App\Models\Homepage;
use App\Models\Language;
use App\Models\Schedule;
use App\Models\Template;
use App\Models\HowItWork;
use App\Models\OrderItem;
use App\Models\CustomPage;
use App\Models\PopularTag;
use App\Models\SeoSetting;
use App\Models\Subscriber;
use App\Helpers\MailHelper;
use App\Models\BlogComment;
use App\Models\ContactPage;
use App\Models\PopularPost;
use App\Models\Testimonial;


use App\Models\BecomeAuthor;
use App\Models\BlogCategory;
use App\Models\CountryState;
use Illuminate\Http\Request;
use App\Models\EmailTemplate;
use App\Models\MultiCurrency;
use App\Models\PrivacyPolicy;
use App\Models\ScriptContent;
use App\Mail\UserRegistration;
use App\Models\ContactMessage;
use App\Models\ProductComment;
use App\Models\ProductVariant;
use App\Models\SectionContent;
use App\Models\SectionControl;
use App\Models\BreadcrumbImage;
use App\Models\FacebookComment;
use App\Models\GoogleRecaptcha;
use App\Models\CustomPagination;
use App\Models\AdditionalService;
use App\Models\TermsAndCondition;
use App\Models\AppointmentSchedule;
use App\Mail\SubscriptionVerification;
use App\Mail\ContactMessageInformation;
use Gloudemans\Shoppingcart\Facades\Cart;

class HomeController extends Controller
{
    public function translator(){
        $front_lang = Session::get('front_lang');
        $language = Language::where('is_default', 'Yes')->first();
        if($front_lang == ''){
            $front_lang = Session::put('front_lang', $language->lang_code);
        }
        config(['app.locale' => $front_lang]);
    }

    public function index(Request $request)
    {
        $this->translator();

        $setting = Setting::select('selected_theme')->first();
        if($setting->selected_theme == 0){
            if($request->has('theme')){
                $theme = $request->theme;
                if($theme == 1){
                    Session::put('selected_theme', 'theme_one');
                }elseif($theme == 2){
                    Session::put('selected_theme', 'theme_two');
                }elseif($theme == 3){
                    Session::put('selected_theme', 'theme_three');
                }else{
                    if(!Session::has('selected_theme')){
                        Session::put('selected_theme', 'theme_one');
                    }
                }
            }else{
                Session::put('selected_theme', 'theme_one');
            }
        }else{
            if($setting->selected_theme == 1){
                Session::put('selected_theme', 'theme_one');
            }elseif($setting->selected_theme == 2){
                Session::put('selected_theme', 'theme_two');
            }elseif($setting->selected_theme == 3){
                Session::put('selected_theme', 'theme_three');
            }
        }

        $slider=Slider::with('sliderlangfrontend')->first();
        $categories=Category::with('catlangfrontend')->where('status', 1)->latest()->get();
        $setting = Setting::first();
        $products=Product::with('productlangfrontend')->where('status', 1)->limit(6)->get();

        $contents = SectionContent::with('contentlangfrontend')->get();
        $control = SectionControl::get();
        $setting = Setting::first();
        $seo_setting = SeoSetting::where('id', 1)->first();
        $homepage = Homepage::first();

        // intro section start

        $intro_visibility = false;
        $intro = $control->where('id', 1)->first();
        if($intro->status == 1) $intro_visibility = true;

        $intro_slider = Slider::with('sliderlangfrontend')->first();

        $intro_categories = Category::with('catlangfrontend')->where('status',1)->get();

        $intro_section = (object) array(
            'visibility' => $intro_visibility,
            'content' => $intro_slider,
            'categories' => $intro_categories,
        );

        // intro section end

        // category section start

        $category_control = $control->where('id', 2)->first();
        $category_visibility = false;
        if($category_control->status == 1){
            $category_visibility = true;
        }

        $category_content = $contents->where('id', 1)->first();
        $category_section = (object) array(
            'visibility' => $category_visibility,
            'title' => $category_content->contentlangfrontend->title,
            'description' => $category_content->contentlangfrontend->description,
            'categories' => $intro_categories,
        );

        // category section end

        $product_control = $control->where('id', 3)->first();
        $product_section_visibility = false;
        if($product_control->status == 1){
            $product_section_visibility = true;
        }

        $gallery_categories = Category::with('catlangfrontend')->where(['product_gallery' => 1, 'status' => 1])->get();

        $product_id = [];
        foreach($gallery_categories as $category){
            $product_id[] = $category->id;
        }
        $products = Product::with('category','author','productlangfrontend')->whereIn('category_id', $product_id)->where(['status' => 1])->orderBy('id','desc')->select('id','name','slug','product_type','thumbnail_image','regular_price','preview_link','category_id','author_id','status','approve_by_admin')->get()->take($product_control->qty);

        $product_section_content = $contents->where('id', 2)->first();
        $product_section = (object) array(
            'visibility' => $product_section_visibility,
            'title' => $product_section_content->contentlangfrontend->title,
            'description' => $product_section_content->contentlangfrontend->description,
            'products' => $products,
            'categories' => $gallery_categories,
        );

        // product section end

        // special offer start
        $offer_visibility = false;
        $offer_control = $control->where('id', 5)->first();
        if($offer_control->status == 1){
            $offer_visibility = true;
        }

        $special_offer = (object) array(
            'visibility' => $offer_visibility,
            'title1' => $homepage->homelangfrontend->offer_title1,
            'title2' => $homepage->homelangfrontend->offer_title2,
            'link' => $homepage->offer_link,
            'home1_background' => $homepage->offer_home1_background,
            'home1_foreground1' => $homepage->offer_home1_foreground1,
            'home1_foreground2' => $homepage->offer_home1_foreground2,
            'home2_background' => $homepage->offer_home2_background,
            'home3_background' => $homepage->offer_home3_background,
            'home3_item1_image' => $homepage->offer_home3_item1_image,
            'home3_item2_image' => $homepage->offer_home3_item2_image,
            'home3_item1_title' => $homepage->homelangfrontend->offer_home3_item1_title,
            'home3_item2_title' => $homepage->homelangfrontend->offer_home3_item2_title,
            'home3_item1_description' => $homepage->homelangfrontend->offer_home3_item1_description,
            'home3_item2_description' => $homepage->homelangfrontend->offer_home3_item2_description,
            'home3_item1_link' => $homepage->offer_home3_item1_link,
            'home3_item2_link' => $homepage->offer_home3_item2_link,
        );

        // end offer area

        // start populuar trending area
        $popular_trending_visibility = false;
        $popular_trending_control = $control->where('id', 6)->first();
        if($popular_trending_control->status == 1){
            $popular_trending_visibility = true;
        }

        $popular_products = Product::with('productlangfrontend')->where(['status' => 1, 'popular_item' => 1])->orderBy('id','desc')->select('id','name','slug','product_type','thumbnail_image','product_icon','regular_price','status','approve_by_admin','popular_item')->get()->take($popular_trending_control->qty);

        $trending_products = Product::with('productlangfrontend')->where(['status' => 1, 'trending_item' => 1])->orderBy('id','desc')->select('id','name','slug','product_type','thumbnail_image','product_icon','regular_price','status','approve_by_admin','trending_item')->get()->take($popular_trending_control->qty);

        $new_products = Product::with('productlangfrontend')->where(['status' => 1])->orderBy('id','desc')->select('id','name','slug','product_type','thumbnail_image','product_icon','regular_price','status','approve_by_admin')->get()->take($popular_trending_control->qty);

        $popular_trending_content = $contents->where('id', 3)->first();

        $popular_trending = (object) array(
            'visibility' => $popular_trending_visibility,
            'title' => $popular_trending_content->contentlangfrontend->title,
            'description' => $popular_trending_content->contentlangfrontend->description,
            'popular_products' => $popular_products,
            'trending_products' => $trending_products,
            'new_products' => $new_products,
        );

        // end populuar trending area

        // start trending area
        $trending_visibility = false;
        $trending_control = $control->where('id', 46)->first();
        if($trending_control->status == 1){
            $trending_visibility = true;
        }

        $trending_products = Product::with('category','author','productlangfrontend')->where(['status' => 1, 'trending_item' => 1])->orderBy('id','desc')->select('id','name','slug','product_type','thumbnail_image','regular_price','preview_link','category_id','author_id','status','approve_by_admin')->get()->take($trending_control->qty);

        $total_row = $trending_products->count() / 4;

        $trending_content = $contents->where('id', 7)->first();

        $trending_section = (object) array(
            'visibility' => $trending_visibility,
            'title' => $trending_content->contentlangfrontend->title,
            'trending_offer_title1' => $homepage->homelangfrontend->trending_offer_title1,
            'trending_offer_title2' => $homepage->homelangfrontend->trending_offer_title2,
            'trending_offer_link' => $homepage->trending_offer_link,
            'trending_offer_image' => $homepage->trending_offer_image,
            'description' => $trending_content->contentlangfrontend->description,
            'trending_products' => $trending_products,
        );

        // end trending area

        // start new product area
        $new_product_visibility = false;
        $new_product_control = $control->where('id', 47)->first();
        if($new_product_control->status == 1){
            $new_product_visibility = true;
        }

        $new_products = Product::with('productlangfrontend')->where(['status' => 1])->orderBy('id','desc')->select('id','name','slug','product_type','thumbnail_image','product_icon','regular_price','status','approve_by_admin')->get()->take($new_product_control->qty);



        $new_product_content = $contents->where('id', 8)->first();

        $new_product_section = (object) array(
            'visibility' => $new_product_visibility,
            'title' => $new_product_content->contentlangfrontend->title,
            'description' => $new_product_content->contentlangfrontend->description,
            'new_products' => $new_products,
        );

        // end new product area

        // start featured area
        $featured_visibility = false;
        $featured_control = $control->where('id', 42)->first();
        if($featured_control->status == 1){
            $featured_visibility = true;
        }

        $featured_products = Product::with('category','author','productlangfrontend')->where(['status' => 1, 'featured_item' => 1])->orderBy('id','desc')->select('id','name','slug','product_type','thumbnail_image','regular_price','preview_link','category_id','author_id','status','approve_by_admin')->get()->take($featured_control->qty);

        $featured_content = $contents->where('id', 6)->first();
        $featured_section = (object) array(
            'visibility' => $featured_visibility,
            'title' => $featured_content->contentlangfrontend->title,
            'description' => $featured_content->contentlangfrontend->description,
            'products' => $featured_products,
        );

        // end featured area

        // start templete area
        $template_visibility = false;
        $template_control = $control->where('id', 45)->first();
        if($template_control->status == 1){
            $template_visibility = true;
        }

        $templates = Template::with('templatelangfrontend')->where(['status' => 1])->orderBy('id','desc')->get();

        $template_content = $contents->where('id', 10)->first();
        $template_section = (object) array(
            'visibility' => $template_visibility,
            'title' => $template_content->contentlangfrontend->title,
            'description' => $template_content->contentlangfrontend->description,
            'templates' => $templates,
        );

        // end template area

        // why choose start

        $why_choose_visibility = false;
        $why_choose_control = $control->where('id', 10)->first();
        if($why_choose_control->status == 1){
            $why_choose_visibility = true;
        }
        $why_choose_us = (object) array(
            'visibility' => $why_choose_visibility,
            'title1' => $homepage->homelangfrontend->why_choose_title1,
            'title2' => $homepage->homelangfrontend->why_choose_title2,
            'icon1' => $homepage->why_choose_item1_icon,
            'item_title1' => $homepage->homelangfrontend->why_choose_item1_title,
            'icon2' => $homepage->why_choose_item2_icon,
            'item_title2' => $homepage->homelangfrontend->why_choose_item2_title,
            'icon3' => $homepage->why_choose_item3_icon,
            'item_title3' => $homepage->homelangfrontend->why_choose_item3_title,
            'background_image' => $homepage->why_choose_home2_background,
            'home3_icon1' => $homepage->why_choose_home3_item1_icon,
            'home3_icon2' => $homepage->why_choose_home3_item2_icon,
            'home3_icon3' => $homepage->why_choose_home3_item3_icon,
            'home3_title1' => $homepage->homelangfrontend->why_choose_home3_item1_title,
            'home3_title2' => $homepage->homelangfrontend->why_choose_home3_item2_title,
            'home3_title3' => $homepage->homelangfrontend->why_choose_home3_item3_title,
            'home3_description1' => $homepage->homelangfrontend->why_choose_home3_item1_desc,
            'home3_description2' => $homepage->homelangfrontend->why_choose_home3_item2_desc,
            'home3_description3' => $homepage->homelangfrontend->why_choose_home3_item3_desc,

        );

        // end why choose us

        // testimonial section start
        $testimonial_control = $control->where('id', 8)->first();
        $testimonial_visibility = false;
        if($testimonial_control->status == 1){
            $testimonial_visibility = true;
        }

        $testimonial_content = $contents->where('id', 4)->first();
        $testimonials = Testimonial::with('testimoniallangfrontend')->where('status',1)->get()->take($testimonial_control->qty);

        $testimonial_section = (object) array(
            'visibility' => $testimonial_visibility,
            'title' => $testimonial_content->contentlangfrontend->title,
            'description' => $testimonial_content->contentlangfrontend->description,
            'testimonials' => $testimonials,
        );
        // testimonial section end

        // partner start

        $partner_visbility = false;
         $partner_control = $control->where('id', 22)->first();
         if($partner_control->status == 1){
             $partner_visbility = true;
         }

         $partner_content = $contents->where('id', 11)->first();
         $partners = Partner::where(['status' => 1])->get()->take($partner_control->qty);

         $partner_section = (object) array(
             'visibility' => $partner_visbility,
             'title' => $partner_content->contentlangfrontend->title,
             'description' => $partner_content->contentlangfrontend->description,
             'partners' => $partners,
             'offer_title1' => $homepage->homelangfrontend->offer_title1,
             'offer_title2' => $homepage->homelangfrontend->offer_title2,
             'offer_link' => $homepage->offer_link,
         );

        // parnter end

        //mobile section start

        $mobile_app_section_visbility = false;
        $app_control = $control->where('id', 7)->first();
        if($app_control->status == 1){
            $mobile_app_section_visbility = true;
        }

        $mobile_app = (object) array(
            'visibility' => $mobile_app_section_visbility,
            'title1' => $homepage->homelangfrontend->app_title1,
            'title2' => $homepage->homelangfrontend->app_title2,
            'title3' => $homepage->homelangfrontend->app_title3,
            'description' => $homepage->homelangfrontend->app_description,
            'home2_title' => $homepage->homelangfrontend->app_home2_title,
            'home2_description' => $homepage->homelangfrontend->app_home2_desc,
            'home3_title' => $homepage->homelangfrontend->app_home3_title,
            'home3_description' => $homepage->homelangfrontend->app_home3_desc,
            'play_store_link' => $homepage->app_play_store_link,
            'apple_store_link' => $homepage->app_apple_store_link,
            'home1_foreground' => $homepage->app_home1_foreground,
            'home2_background' => $homepage->app_home2_background,
            'home2_foreground' => $homepage->app_home2_foreground,
            'home3_background' => $homepage->app_home3_background,
            'home3_foreground' => $homepage->app_home3_foreground,
        );

        // mobile  section end

        // blog section start

        $home1_blog_control = $control->where('id', 9)->first();
        $home1_blog_visibility = false;
        if($home1_blog_control->status == 1){
            $home1_blog_visibility = true;
        }

        $home1_blog_content = $contents->where('id', 5)->first();

       $home1_blogs = Blog::with('category', 'bloglanguagefrontend')->where(['status' => 1, 'show_homepage' => 1])->orderBy('id','desc')->get()->take($home1_blog_control->qty);



        $home1_blog_section = (object) array(
            'visibility' => $home1_blog_visibility,
            'title' => $home1_blog_content->contentlangfrontend->title,
            'description' => $home1_blog_content->contentlangfrontend->description,
            'blogs' => $home1_blogs,
        );


        $home2_blog_control = $control->where('id', 43)->first();
        $home2_blog_visibility = false;
        if($home2_blog_control->status == 1){
            $home2_blog_visibility = true;
        }

        $home2_blog_content = $contents->where('id', 5)->first();

        $home2_blogs = Blog::with('category', 'bloglanguagefrontend')->where(['status' => 1, 'show_homepage' => 1])->orderBy('id','desc')->get()->take($home2_blog_control->qty);

        $featured_blog = Blog::with('category', 'bloglanguagefrontend')->where(['status' => 1, 'show_featured' => 1])->first();

        if($featured_blog == null){
            $featured_blog = Blog::with('category', 'bloglanguagefrontend')->where(['status' => 1])->orderBy('id','desc')->first();
        }

        $home2_blog_section = (object) array(
            'visibility' => $home2_blog_visibility,
            'title' => $home2_blog_content->contentlangfrontend->title,
            'description' => $home2_blog_content->contentlangfrontend->description,
            'blogs' => $home2_blogs,
            'blog' => $featured_blog,
        );


        $home3_blog_control = $control->where('id', 44)->first();
        $home3_blog_visibility = false;
        if($home3_blog_control->status == 1){
            $home3_blog_visibility = true;
        }

        $home3_blog_content = $contents->where('id', 5)->first();

        $home3_blogs = Blog::with('category', 'admin', 'bloglanguagefrontend')->where(['status' => 1, 'show_homepage' => 1])->orderBy('id','desc')->get()->take($home3_blog_control->qty);


        $home3_blog_section = (object) array(
            'visibility' => $home3_blog_visibility,
            'title' => $home3_blog_content->contentlangfrontend->title,
            'description' => $home3_blog_content->contentlangfrontend->description,
            'blogs' => $home3_blogs,
        );

        // blog section end


        // coundown start

        $coundown_visibility = false;
        $coundown_control = $control->where('id', 4)->first();
        if($coundown_control->status == 1){
            $coundown_visibility = true;
        }

        $counter_section = (object) array(
            'visibitliy' => $coundown_visibility,
            'home1_icon1' => $homepage->counter_icon1,
            'home1_icon2' => $homepage->counter_icon2,
            'home1_icon3' => $homepage->counter_icon3,
            'home1_icon4' => $homepage->counter_icon4,
            'home2_icon1' => $homepage->counter_icon5,
            'home2_icon2' => $homepage->counter_icon6,
            'home2_icon3' => $homepage->counter_icon7,
            'home2_icon4' => $homepage->counter_icon8,
            'counter1_title' => $homepage->homelangfrontend->counter1_title,
            'counter2_title' => $homepage->homelangfrontend->counter2_title,
            'counter3_title' => $homepage->homelangfrontend->counter3_title,
            'counter4_title' => $homepage->homelangfrontend->counter4_title,
            'counter1_value' => $homepage->counter1_value,
            'counter2_value' => $homepage->counter2_value,
            'counter3_value' => $homepage->counter3_value,
            'counter4_value' => $homepage->counter4_value,
            'counter_home2_background' => $homepage->counter_home2_background,
        );


        $session_currency = Session::get('currency');
        $default_currency = MultiCurrency::where('is_default', 'Yes')->first();
        if($session_currency == ''){
            $session_currency = Session::put('currency', $default_currency->currency_code);
        }

        $is_currency = MultiCurrency::where('currency_code', $session_currency)->first();


        $seo_setting = SeoSetting::where('id', 1)->first();

        $selected_theme = Session::get('selected_theme');
        if ($selected_theme == 'theme_one'){
            return view('index')->with([
                'intro_visibility' => $intro_visibility,
                'intro_section' => $intro_section,
                'category_visibility' => $category_visibility,
                'category_section' => $category_section,
                'product_section'  => $product_section,
                'counter_section' => $counter_section,
                'setting'    => $setting,
                'special_offer' => $special_offer,
                'trending_section' => $trending_section,
                'featured_section' => $featured_section,
                'template_section' => $template_section,
                'popular_trending' => $popular_trending,
                'why_choose_us' => $why_choose_us,
                'partner_visbility' => $partner_visbility,
                'partner_section' => $partner_section,
                'mobile_app' => $mobile_app,
                'home1_blog_section' => $home1_blog_section,
                'seo_setting' => $seo_setting,
                'is_currency' => $is_currency,
            ]);
        }elseif($selected_theme == 'theme_two'){
            return view('index2')->with([
                'intro_visibility' => $intro_visibility,
                'intro_section' => $intro_section,
                'category_visibility' => $category_visibility,
                'category_section' => $category_section,
                'product_section'  => $product_section,
                'setting'    => $setting,
                'special_offer' => $special_offer,
                'trending_section' => $trending_section,
                'featured_section' => $featured_section,
                'popular_trending' => $popular_trending,
                'why_choose_us' => $why_choose_us,
                'testimonial_section' => $testimonial_section,
                'partner_visbility' => $partner_visbility,
                'partner_section' => $partner_section,
                'mobile_app' => $mobile_app,
                'home2_blog_section' => $home2_blog_section,
                'counter_section' => $counter_section,
                'seo_setting' => $seo_setting,
            ]);
        }elseif($selected_theme == 'theme_three'){
            return view('index3')->with([
                'intro_visibility' => $intro_visibility,
                'intro_section' => $intro_section,
                'category_visibility' => $category_visibility,
                'category_section' => $category_section,
                'product_section'  => $product_section,
                'setting'    => $setting,
                'special_offer' => $special_offer,
                'popular_trending' => $popular_trending,
                'featured_section' => $featured_section,
                'new_product_section' => $new_product_section,
                'why_choose_us' => $why_choose_us,
                'testimonial_section' => $testimonial_section,
                'partner_visbility' => $partner_visbility,
                'partner_section' => $partner_section,
                'mobile_app' => $mobile_app,
                'home3_blog_section' => $home3_blog_section,
                'counter_section' => $counter_section,
                'seo_setting' => $seo_setting,
            ]);
        }else{
            return view('index')->with([
                'intro_visibility' => $intro_visibility,
                'intro_section' => $intro_section,
                'category_visibility' => $category_visibility,
                'category_section' => $category_section,
                'product_section'  => $product_section,
                'setting'    => $setting,
                'special_offer' => $special_offer,
                'popular_trending' => $popular_trending,
                'featured_section' => $featured_section,
                'why_choose_us' => $why_choose_us,
                'partner_visbility' => $partner_visbility,
                'partner_section' => $partner_section,
                'mobile_app' => $mobile_app,
                'home1_blog_section' => $home1_blog_section,
                'seo_setting' => $seo_setting,
            ]);
        }

    }

    public function product(Request $request){
        $this->translator();

        if($request->min_price){
            $min_price = $request->min_price;
        }else{
            $min_price = 0;
        }

        $get_max_product_price = Product::OrderBy('regular_price', 'DESC')->first();

        if($request->max_price){
            $max_price = $request->max_price;
        }else if($get_max_product_price){
            $max_price = $get_max_product_price->regular_price * session()->get('currency_rate');
        }else{
            $max_price = 0;
        }

        $setting = Setting::first();
        $categories=Category::with('catlangfrontend')->where('status', 1)->get();
        $all_category=Category::with('catlangfrontend')->where('status', 1)->get();
        $ad=Ad::first();

        $paginateQty = CustomPagination::whereId('6')->first()->qty;

        $products = Product::with('category','author','productlangfrontend');

        if($request->category){
            $category=Category::with('catlangfrontend')->where('slug', $request->category)->first();
            $category_id=$category->id;
            $products = $products->where('category_id', $category_id)->select('id','name','product_type','slug','thumbnail_image','regular_price','category_id','author_id','status','approve_by_admin','preview_link');
        }

        if($request->min_price){
            if($request->min_price == 0){
                $minPrice = $request->min_price;
            }else{
                $minPrice = $request->min_price / session()->get('currency_rate');
            }
            $products = $products->where('regular_price', '>=', $minPrice);
        }

        if($request->max_price){
            $maxPrice = $request->max_price / session()->get('currency_rate');
            $products = $products->where('regular_price', '<=', $maxPrice);
        }

        if($request->sorting=='default'){
            $products = $products->select('id','name','product_type','slug','thumbnail_image','regular_price','category_id','author_id','status','approve_by_admin','preview_link');
        }else if($request->sorting){
            $products = $products->where('product_type', $request->sorting)->select('id','name','product_type','slug','thumbnail_image','regular_price','category_id','author_id','status','approve_by_admin','preview_link');
        }


        if($request->keyword){
            $products = $products->whereHas('productlangfrontend',function($query) use ($request){
                $query->where('name','LIKE','%'.$request->keyword.'%')->orWhere('description','LIKE','%'.$request->keyword.'%')->orWhere('tags','LIKE','%'.$request->keyword.'%');
            });
        }

        $products = $products->where('status', 1)->latest()->paginate($paginateQty);
        $products = $products->appends($request->all());

        if($get_max_product_price){
            $product_max_price = $get_max_product_price->regular_price;
        }else{
            $product_max_price = 0;
        }

        $seo_setting = SeoSetting::where('id', 5)->first();

        $active_theme = 'layout2';

        return view('product')->with([
            'active_theme' => $active_theme,
            'products' => $products,
            'setting' => $setting,
            'categories' => $categories,
            'all_category' => $all_category,
            'min_price' => $min_price,
            'max_price' => $max_price,
            'ad' => $ad,
            'seo_setting' => $seo_setting,
            'product_max_price' => $product_max_price,

        ]);
    }

    public function product_detail($slug){

        $this->translator();

        $user = Auth::guard('web')->user();

        $paginateComentQty = CustomPagination::whereId('7')->first()->qty;

        $paginateReviewQty = CustomPagination::whereId('8')->first()->qty;

        $product = Product::with('category','author','productlangfrontend')->where('slug', $slug)->first();

        $related_products=Product::with('category','author','productlangfrontend')->where('category_id', $product->category_id)->where('status', 1)->whereNot('id', $product->id)->take(3)->get();
        $setting = Setting::first();
        $variants=ProductVariant::where('product_id', $product->id)->get();
        $first_variant=ProductVariant::where('product_id', $product->id)->first();
        $productComments=ProductComment::with('user')->where(['product_id'=>$product->id, 'status'=>1])->latest()->paginate($paginateComentQty);
        $productReviews=Review::where(['product_id'=>$product->id, 'status'=>1])->latest()->paginate($paginateReviewQty);
        $total_sale=OrderItem::where('Product_id', $product->id)->get()->count();
        $script_content = ScriptContent::first();
        $recaptchaSetting = GoogleRecaptcha::first();

        $active_theme = 'layout2';

        return view('product_detail')->with([
            'active_theme' => $active_theme,
            'user' => $user,
            'product' => $product,
            'related_products' => $related_products,
            'setting' => $setting,
            'variants' => $variants,
            'first_variant' => $first_variant,
            'productComments' => $productComments,
            'productReviews' => $productReviews,
            'total_sale' => $total_sale,
            'script_content' => $script_content,
            'recaptchaSetting' => $recaptchaSetting,
        ]);
    }


    public function become_author(){

        $this->translator();

        $active_theme = 'layout2';
        $contents = SectionContent::with('contentlangfrontend')->get();
        $control = SectionControl::get();
        $setting = Setting::first();
        $become_author=BecomeAuthor::with('becomelangfrontend')->first();

         // our teem section start
         $our_teem_control = $control->where('id', 35)->first();

         $our_teem_visibility = false;
         if($our_teem_control->status == 1){
             $our_teem_visibility = true;
         }
         $teem_content = $contents->where('id', 9)->first();
         $our_teems = OurTeam::with('teamlangfrontend')->where('status',1)->get()->take($our_teem_control->qty);

         $our_teem_section = (object) array(
             'visibility' => $our_teem_visibility,
             'title' => $teem_content->contentlangfrontend->title,
             'description' => $teem_content->contentlangfrontend->description,
             'our_teems' => $our_teems,
         );
         // our teem section end


         // category section start

         $category_control = $control->where('id', 2)->first();
         $category_visibility = false;
         if($category_control->status == 1){
             $category_visibility = true;
         }

         $categories = Category::with('catlangfrontend')->where('status',1)->get()->take($category_control->qty);
         $category_content = $contents->where('id', 1)->first();
         $category_section = (object) array(
             'visibility' => $category_visibility,
             'title' => $category_content->contentlangfrontend->title,
             'description' => $category_content->contentlangfrontend->description,
             'categories' => $categories,
         );

         // category section end
        return view('become_author')->with([
            'active_theme' => $active_theme,
            'setting' => $setting,
            'become_author' => $become_author,
            'our_teem_section' => $our_teem_section,
            'category_section' => $category_section,
        ]);
    }

    public function variant_price($size){
        $variant=ProductVariant::where('id', $size)->first();
        return response()->json(['variant'=>$variant]);
    }




    public function checkUserName(Request $request){
        $this->translator();
        $user = User::where('user_name',$request->username)->count();
        if($user== 0){
            return response()->json(['status' => 1]);
        }else{
            return response()->json(['status' => 0, 'message' => trans('user_validation.User name already exist')]);
        }
    }

    public function stateByCountry($id){
        $states = CountryState::where(['status' => 1, 'country_id' => $id])->orderBy('name','asc')->get();
        $response='<option value="">'.trans('user_validation.Select').'</option>';
        if($states->count() > 0){
            foreach($states as $state){
                $response .= "<option value=".$state->id.">".$state->name."</option>";
            }
        }

        return response()->json(['states'=>$response]);
    }

    public function cityByState($id){
        $cities = City::where(['status' => 1, 'country_state_id' => $id])->orderBy('name','asc')->get();
        $response='<option value="">'.trans('user_validation.Select').'</option>';
        if($cities->count() > 0){
            foreach($cities as $city){
                $response .= "<option value=".$city->id.">".$city->name."</option>";
            }
        }

        return response()->json(['cities'=>$response]);
    }



    public function aboutUs(){

        $this->translator();

        $contents = SectionContent::with('contentlangfrontend')->get();
        $control = SectionControl::get();
        $setting = Setting::first();
        $seo_setting = SeoSetting::where('id', 2)->first();
        $homepage = Homepage::with('homelangfrontend')->first();

         // our teem section start
         $our_teem_control = $control->where('id', 35)->first();
         $our_teem_visibility = false;
         if($our_teem_control->status == 1){
             $our_teem_visibility = true;
         }
         $teem_content = $contents->where('id', 9)->first();
         $our_teems = OurTeam::with('teamlangfrontend')->where('status',1)->get()->take($our_teem_control->qty);

         $our_teem_section = (object) array(
             'visibility' => $our_teem_visibility,
             'title' => $teem_content->contentlangfrontend->title,
             'description' => $teem_content->contentlangfrontend->description,
             'our_teems' => $our_teems,
             'offer_title1' => $homepage->homelangfrontend->about_offer_title1,
             'offer_title2' => $homepage->homelangfrontend->about_offer_title2,
             'offer_title3' => $homepage->homelangfrontend->about_offer_title3,
             'offer_link' => $homepage->about_offer_link,
             'offer_background' => $homepage->about_offer_background,
         );
         // our teem section end

        //counter section start
        $coundown_visibility = false;
        $coundown_control = $control->where('id', 4)->first();
        if($coundown_control->status == 1){
            $coundown_visibility = true;
        }

        $counter_section = (object) array(
            'visibitliy' => $coundown_visibility,
            'home1_icon1' => $homepage->counter_icon1,
            'home1_icon2' => $homepage->counter_icon2,
            'home1_icon3' => $homepage->counter_icon3,
            'home1_icon4' => $homepage->counter_icon4,
            'counter1_title' => $homepage->homelangfrontend->counter1_title,
            'counter2_title' => $homepage->homelangfrontend->counter2_title,
            'counter3_title' => $homepage->homelangfrontend->counter3_title,
            'counter4_title' => $homepage->homelangfrontend->counter4_title,
            'counter1_value' => $homepage->counter1_value,
            'counter2_value' => $homepage->counter2_value,
            'counter3_value' => $homepage->counter3_value,
            'counter4_value' => $homepage->counter4_value,
        );
        //counter section end

        // why choose start
        $why_choose_visibility = false;
        $why_choose_control = $control->where('id', 10)->first();
        if($why_choose_control->status == 1){
            $why_choose_visibility = true;
        }
        $why_choose_us = (object) array(
            'visibility' => $why_choose_visibility,
            'title1' => $homepage->homelangfrontend->why_choose_title1,
            'title2' => $homepage->homelangfrontend->why_choose_title2,
            'item_icon1' => $homepage->why_choose_home3_item1_icon,
            'item_icon2' => $homepage->why_choose_home3_item2_icon,
            'item_icon3' => $homepage->why_choose_home3_item3_icon,
            'item_title1' => $homepage->homelangfrontend->why_choose_home3_item1_title,
            'item_title2' => $homepage->homelangfrontend->why_choose_home3_item2_title,
            'item_title3' => $homepage->homelangfrontend->why_choose_home3_item3_title,
            'item_description1' => $homepage->homelangfrontend->why_choose_home3_item1_desc,
            'item_description2' => $homepage->homelangfrontend->why_choose_home3_item2_desc,
            'item_description3' => $homepage->homelangfrontend->why_choose_home3_item3_desc,

        );
        // end why choose us

         // testimonial section start
         $testimonial_control = $control->where('id', 37)->first();
         $testimonial_visibility = false;
         if($testimonial_control->status == 1){
             $testimonial_visibility = true;
         }

         $testimonial_content = $contents->where('id', 4)->first();
         $testimonials = Testimonial::with('testimoniallangfrontend')->where('status',1)->get()->take($testimonial_control->qty);

         $testimonial_section = (object) array(
             'visibility' => $testimonial_visibility,
             'title' => $testimonial_content->contentlangfrontend->title,
             'description' => $testimonial_content->contentlangfrontend->description,
             'testimonials' => $testimonials,
         );
         // testimonial section end

         // partner start

         $partner_visbility = false;
         $partner_control = $control->where('id', 39)->first();
         if($partner_control->status == 1){
             $partner_visbility = true;
         }

         $partners = Partner::where(['status' => 1])->get()->take($partner_control->qty);

         // parnter end

         //mobile section start

         $mobile_app_section_visbility = false;
         $app_control = $control->where('id', 38)->first();
         if($app_control->status == 1){
             $mobile_app_section_visbility = true;
         }

         $mobile_app = (object) array(
             'visibility' => $mobile_app_section_visbility,
             'title1' => $homepage->app_title1,
             'title2' => $homepage->app_title2,
             'title3' => $homepage->app_title3,
             'description' => $homepage->app_description,
             'play_store_link' => $homepage->app_play_store_link,
             'apple_store_link' => $homepage->app_apple_store_link,
             'home1_background' => $homepage->app_home1_background,
             'home1_foreground' => $homepage->app_home1_foreground,
             'home2_background' => $homepage->app_home2_background,
             'home2_foreground' => $homepage->app_home2_foreground,
             'home3_background' => $homepage->app_home3_background,
             'home3_foreground' => $homepage->app_home3_foreground,
         );

         // mobile  section end

         // blog section start

         $blog_control = $control->where('id', 9)->first();
         $blog_visibility = false;
         if($blog_control->status == 1){
             $blog_visibility = true;
         }

         $blog_content = $contents->where('id', 5)->first();
         $blogs = Blog::with('category', 'bloglanguagefrontend')->where(['status' => 1, 'show_homepage' => 1])->orderBy('id','desc')->get()->take($blog_control->qty);

         $blog_section = (object) array(
             'visibility' => $blog_visibility,
             'title' => $blog_content->contentlangfrontend->title,
             'description' => $blog_content->contentlangfrontend->description,
             'blogs' => $blogs,
         );

         // blog section end



        $active_theme = 'layout2';

        $about_us=AboutUs::with('aboutlangfrontend')->first();
        $homepage = Homepage::first();
        $testimonials=Testimonial::with('testimoniallangfrontend')->where('status', 1)->latest()->get();
        return view('about_us')->with([
            'active_theme' => $active_theme,
            'about_us' => $about_us,
            'our_teem_section' => $our_teem_section,
            'counter_section' => $counter_section,
            'why_choose_us' => $why_choose_us,
            'testimonial_section' => $testimonial_section,
            'partners' => $partners,
            'mobile_app' => $mobile_app,
            'blog_section' => $blog_section,
            'partner_visbility' => $partner_visbility,
            'seo_setting' => $seo_setting,
        ]);
    }



    public function contactUs(){

        $this->translator();

        $contact = ContactPage::first();
        $recaptchaSetting = GoogleRecaptcha::first();

        $seo_setting = SeoSetting::where('id', 3)->first();

        $active_theme = 'layout2';

        return view('contact_us')->with([
            'active_theme' => $active_theme,
            'seo_setting' => $seo_setting,
            'contact' => $contact,
            'recaptchaSetting' => $recaptchaSetting,
        ]);
    }

    public function sendContactMessage(Request $request){
        $this->translator();
        $rules = [
            'name'=>'required',
            'email'=>'required',
            'subject'=>'required',
            'message'=>'required',
            'g-recaptcha-response'=>new Captcha()
        ];

        $customMessages = [
            'name.required' => trans('user_validation.Name is required'),
            'email.required' => trans('user_validation.Email is required'),
            'subject.required' => trans('user_validation.Subject is required'),
            'message.required' => trans('user_validation.Message is required'),
        ];
        $this->validate($request, $rules,$customMessages);


        $setting = Setting::first();
        if($setting->enable_save_contact_message == 1){
            $contact = new ContactMessage();
            $contact->name = $request->name;
            $contact->email = $request->email;
            $contact->subject = $request->subject;
            $contact->phone = $request->phone;
            $contact->message = $request->message;
            $contact->save();
        }

        MailHelper::setMailConfig();
        $template = EmailTemplate::where('id',2)->first();
        $message = $template->description;
        $subject = $request->subject;
        $user_email = $request->email;
        $message = str_replace('{{name}}',$request->name,$message);
        $message = str_replace('{{email}}',$request->email,$message);
        $message = str_replace('{{phone}}',$request->phone,$message);
        $message = str_replace('{{subject}}',$request->subject,$message);
        $message = str_replace('{{message}}',$request->message,$message);

        Mail::to($setting->contact_email)->send(new ContactMessageInformation($message,$subject,$user_email));

        $notification = trans('user_validation.Message send successfully');
        $notification=array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }


    public function blogs(Request $request){

        $this->translator();

        $seo_setting = SeoSetting::where('id', 6)->first();

        $paginateQty = CustomPagination::whereId('1')->first()->qty;

        $blogs = Blog::with('category', 'admin', 'bloglanguagefrontend')->where(['status' => 1])->orderBy('id','desc');

        if($request->category){
            $category = BlogCategory::where('slug', $request->category)->first();
            $blogs = $blogs->where('blog_category_id', $category->id);
        }

        if($request->keyword){
            $blogs = $blogs->whereHas('bloglanguagefrontend',function($query) use ($request){
                $query->where('title','LIKE','%'.$request->keyword.'%')->orWhere('description','LIKE','%'.$request->keyword.'%')->orWhere('tag','LIKE','%'.$request->keyword.'%');
            });
        }

        $blogs = $blogs->paginate($paginateQty);
        $blogs=$blogs->appends($request->all());

        //return $blogs;

        $setting = Setting::first();

        if($request->blog == 'leftbar'){
              $blog_left_right = 1;
        }else if($request->blog == 'rightbar'){
            $blog_left_right = 2;
        }else if(!$request->blog){
            $blog_left_right = $setting->blog_left_right;
        }

        $subscriber = (object) array(
            'title' => $setting->settinglangfrontend->subscriber_title,
            'description' => $setting->settinglangfrontend->subscriber_description,
            'image' => $setting->blog_page_subscription_image,
        );
        $recaptchaSetting = GoogleRecaptcha::first();

        $popularBlogs = PopularPost::select('id','blog_id')->get();
        $popular_arr = array();
        foreach($popularBlogs as $popularBlog){
            $popular_arr[] = $popularBlog->blog_id;
        }
        $popular_blogs = Blog::with('category', 'bloglanguagefrontend')->select('id','image','slug','status','created_at')->where(['status' => 1])->orderBy('id','desc')->whereIn('id', $popular_arr)->get()->take(6);

        $categories = BlogCategory::with('blogcategorylanguagefrontend')->where(['status' => 1])->orderBy('name','asc')->get();
        $popular_tags=PopularTag::latest()->get();

        $active_theme = 'layout2';

        return view('blog')->with([
            'active_theme' => $active_theme,
            'seo_setting' => $seo_setting,
            'blogs' => $blogs,
            'setting' => $setting,
            'subscriber' => $subscriber,
            'recaptchaSetting' => $recaptchaSetting,
            'popular_blogs' => $popular_blogs,
            'categories' => $categories,
            'popular_tags' => $popular_tags,
            'blog_left_right' => $blog_left_right,
        ]);
    }


    public function single_blog($slug){

        $this->translator();

        $blog = Blog::with('category', 'admin', 'bloglanguagefrontend')->where('slug', $slug)->first();
        $tags=json_decode($blog->tag);
        $category_id=$blog->blog_category_id;
        $blog_pagiante_qty = CustomPagination::whereId('4')->first()->qty;
        $blog_comments = BlogComment::where(['blog_id' => $blog->id, 'status' => 1])->paginate($blog_pagiante_qty);

        $categories = BlogCategory::where(['status' => 1])->orderBy('name','asc')->get();

        $popularBlogs = PopularPost::select('id','blog_id')->get();
        $popular_arr = array();
        foreach($popularBlogs as $popularBlog){
            $popular_arr[] = $popularBlog->blog_id;
        }
        $popular_blogs = Blog::with('category', 'bloglanguagefrontend')->select('id','image','slug','status','created_at')->where(['status' => 1])->orderBy('id','desc')->whereIn('id', $popular_arr)->where('id', '!=', $blog->id)->get()->take(6);


        $related_blogs = Blog::with('admin', 'bloglanguagefrontend')->where('status', 1)->where('blog_category_id', '=', $category_id)->where('id', '!=', $blog->id)->latest()->get()->take(3);
        $setting = Setting::first();
        $subscriber = (object) array(
            'title' => $setting->settinglangfrontend->subscriber_title,
            'description' => $setting->settinglangfrontend->subscriber_description,
            'image' => $setting->blog_page_subscription_image,
        );
        $recaptchaSetting = GoogleRecaptcha::first();
        $popular_tags=PopularTag::latest()->get();
        $setting = Setting::first();

        $active_theme = 'layout2';

        return view('show_blog')->with([
            'active_theme' => $active_theme,
            'blog' => $blog,
            'blog_comments' => $blog_comments,
            'categories' => $categories,
            'popular_blogs' => $popular_blogs,
            'related_blogs' => $related_blogs,
            'tags'=>$tags,
            'subscriber' => $subscriber,
            'pupular_tags' => $popular_tags,
            'recaptchaSetting' => $recaptchaSetting,
            'setting' => $setting,
        ]);
    }

    public function blogComment(Request $request){
        $this->translator();
        $rules = [
            'name'=>'required',
            'email'=>'required',
            'comment'=>'required',
            'blog_id'=>'required',
            'g-recaptcha-response'=>new Captcha()
        ];

        $customMessages = [
            'name.required' => trans('user_validation.Name is required'),
            'email.required' => trans('user_validation.Email is required'),
            'comment.required' => trans('user_validation.Comment is required'),
            'blog_id.required' => trans('user_validation.Blog id is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $comment = new BlogComment();
        $comment->blog_id = $request->blog_id;
        $comment->name = $request->name;
        $comment->email = $request->email;
        $comment->comment = $request->comment;
        $comment->save();

        $notification = trans('user_validation.Blog comment submited successfully');

        return response()->json(['status' => 1, 'message' => $notification]);
    }

    public function productComment(Request $request){
        $this->translator();
        if(Auth::guard('web')->check()){
            $rules = [
                'comment'=>'required',
                'g-recaptcha-response'=>new Captcha()
            ];

            $customMessages = [
                'comment.required' => trans('user_validation.Comment is required'),
            ];
            $this->validate($request, $rules,$customMessages);

            $user = Auth::guard('web')->user();
            $comment = new ProductComment();
            $comment->product_id = $request->product_id;
            $comment->user_id = $user->id;
            $comment->name = $user->name;
            $comment->email = $user->email;
            $comment->phone = $user->phone;
            $comment->address = $user->address;
            $comment->comment = $request->comment;
            $comment->save();

            $notification = trans('user_validation.Comment submited successfully');
            return response()->json(['status' => 1, 'message' => $notification]);
        }else{
            $notification = trans('user_validation.Please login your account');
            return response()->json(['status' => 0, 'message' => $notification]);
        }
    }

    public function productReview(Request $request){
        $this->translator();
        if(Auth::guard('web')->check()){
            $user = Auth::guard('web')->user();
            $order_item = OrderItem::where(['product_id' => $request->product_id, 'user_id' => $user->id])->first();

            if($order_item){
                $rules = [
                    'rating'=>'required',
                    'review'=>'required',
                    'g-recaptcha-response'=>new Captcha()
                ];
                $customMessages = [
                    'rating.required' => trans('user_validation.Rating is required'),
                    'review.required' => trans('user_validation.Review is required'),
                ];
                $this->validate($request, $rules,$customMessages);

                $user = Auth::guard('web')->user();

                $isReview = Review::where(['product_id' => $request->product_id, 'user_id' => $user->id])->count();
                if($isReview > 0){
                    $notification = trans('user_validation.You have already submited review');
                    return response()->json(['status' => 0, 'message' => $notification]);
                }

                $review = new Review();
                $review->user_id = $user->id;
                $review->rating = $request->rating;
                $review->review = $request->review;
                $review->product_id = $request->product_id;
                $review->author_id = $request->author_id;
                $review->save();
                $notification = trans('user_validation.Review Submited successfully');
                return response()->json(['status' => 1, 'message' => $notification]);
            }else{
                $notification = trans('user_validation.You can only review your purchased products');
                return response()->json(['status' => 0, 'message' => $notification]);
            }
        }else{
            $notification = trans('user_validation.Please login your account');
            return response()->json(['status' => 0, 'message' => $notification]);
        }
    }


    public function faq(){

        $this->translator();

        $faqs = Faq::with('faqlangfrontend')->where('status',1)->get();

        $recaptchaSetting = GoogleRecaptcha::first();

        $active_theme = 'layout2';

        return view('faq')->with([
            'active_theme' => $active_theme,
            'faqs' => $faqs,
            'recaptchaSetting' => $recaptchaSetting,
        ]);
    }

    public function termsAndCondition(){

        $this->translator();

        $terms_conditions = TermsAndCondition::first();
        $terms_conditions = $terms_conditions->termslangfrontend->terms_and_condition;

        $active_theme = 'layout2';

        return view('terms_and_conditions')->with([
            'active_theme' => $active_theme,
            'terms_conditions' => $terms_conditions,
        ]);
    }

    public function privacyPolicy(){

        $this->translator();

        $privacyPolicy = PrivacyPolicy::with('privacylangfrontend')->first();
        $privacyPolicy = $privacyPolicy->privacylangfrontend->privacy_policy;

        $active_theme = 'layout2';

        return view('privacy_policy')->with([
            'active_theme' => $active_theme,
            'privacyPolicy' => $privacyPolicy,
        ]);
    }


    public function customPage($slug){
        $this->translator();
        $page = CustomPage::with('customlangfrontend')->where(['slug' => $slug, 'status' => 1])->first();
        $active_theme = 'layout2';

        return view('custom_page')->with([
            'active_theme' => $active_theme,
            'page' => $page
        ]);
    }


    public function subscribeRequest(Request $request){
        $this->translator();
        if($request->email != null){
            $isExist = Subscriber::where('email', $request->email)->count();
            if($isExist == 0){
                $subscriber = new Subscriber();
                $subscriber->email = $request->email;
                $subscriber->verified_token = Str::random(25);
                $subscriber->save();

                MailHelper::setMailConfig();

                $template=EmailTemplate::where('id',3)->first();
                $message=$template->description;
                $subject=$template->subject;
                Mail::to($subscriber->email)->send(new SubscriptionVerification($subscriber,$message,$subject));

                return response()->json(['status' => 1, 'message' => trans('user_validation.Subscription successfully, please verified your email')]);

            }else{
                return response()->json(['status' => 0, 'message' => trans('user_validation.Email already exist')]);
            }
        }else{
            return response()->json(['status' => 0, 'message' => trans('user_validation.Email Field is required')]);
        }
    }

    public function subscriberVerifcation($token){
        $this->translator();
        $subscriber = Subscriber::where('verified_token',$token)->first();
        if($subscriber){
            $subscriber->verified_token = null;
            $subscriber->is_verified = 1;
            $subscriber->save();
            $notification = trans('user_validation.Email verification successfully');
            $notification = array('messege'=>$notification,'alert-type'=>'success');
            return redirect()->route('home')->with($notification);
        }else{
            $notification = trans('user_validation.Invalid token');
            $notification = array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->route('home')->with($notification);
        }

    }



    public function downloadListingFile($file){
        $filepath= public_path() . "/uploads/custom-images/".$file;
        return response()->download($filepath);
    }


    public function language_change(Request $request){
        session()->forget('front_lang');
        Session::put('front_lang', $request->front_lang);
        return redirect()->back();
    }

    public function currency_change(Request $request){
        $currency = MultiCurrency::where('currency_code', $request->currency_code)->first();
        session()->forget('currency_code');
        session()->forget('currency_icon');
        session()->forget('currency_rate');
        session()->forget('currency_position');
        Session::put('currency_code', $currency->currency_code);
        Session::put('currency_icon', $currency->currency_icon);
        Session::put('currency_rate', $currency->currency_rate);
        Session::put('currency_position', $currency->currency_position);
        return redirect()->back();
    }

}
