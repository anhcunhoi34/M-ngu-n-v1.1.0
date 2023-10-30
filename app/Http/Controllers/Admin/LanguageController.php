<?php

namespace App\Http\Controllers\Admin;
use Auth;
use App\Models\Faq;
use App\Models\Blog;
use App\Models\Footer;
use App\Models\Slider;
use App\Models\AboutUs;
use App\Models\OurTeam;
use App\Models\Product;
use App\Models\Setting;
use App\Models\Category;
use App\Models\Homepage;
use App\Models\Language;
use App\Models\Template;
use App\Models\CustomPage;
use App\Models\ContactPage;
use App\Models\FaqLanguage;
use App\Models\ProductItem;
use App\Models\Testimonial;
use App\Models\BecomeAuthor;
use App\Models\BlogCategory;
use App\Models\BlogLanguage;
use Illuminate\Http\Request;
use App\Models\PrivacyPolicy;
use App\Models\ScriptContent;
use App\Models\FooterLanguage;
use App\Models\SectionContent;
use App\Models\SliderLanguage;
use App\Models\AboutUsLanguage;
use App\Models\OurTeamLanguage;
use App\Models\ProductDiscount;
use App\Models\ProductLanguage;
use App\Models\ProductTypePage;
use App\Models\SettingLanguage;
use App\Models\CategoryLanguage;
use App\Models\HomepageLanguage;
use App\Models\TemplateLanguage;
use App\Models\TermsAndCondition;
use App\Models\CustomPageLanguage;
use Illuminate\Support\Facades\DB;
use App\Models\ContactPageLanguage;
use App\Models\ProductItemLanguage;
use App\Models\TestimonialLanguage;
use App\Http\Controllers\Controller;
use App\Models\BecomeAuthorLanguage;
use App\Models\BlogCategoryLanguage;
use App\Models\PrivacyPolicyLanguage;
use App\Models\ScriptContentLanguage;
use App\Models\SectionContentLanguage;
use App\Models\ProductDiscountLanguage;
use App\Models\ProductTypePageLanguage;
use App\Models\TermsAndConditionLanguage;
use File;

class LanguageController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:admin');
    }
    
    public function adminLnagugae(Request $request){
        $data = include('lang/'.$request->lang_code.'/admin.php');
        $languages = Language::get();
        return view('admin.admin_language', compact('data', 'languages'));
    }

    public function updateAdminLanguage(Request $request){
        $dataArray = [];
        foreach($request->values as $index => $value){
            $dataArray[$index] = $value;
        }
        file_put_contents('lang/'.$request->lang_code.'/admin.php', "");
        $dataArray = var_export($dataArray, true);
        file_put_contents('lang/'.$request->lang_code.'/admin.php', "<?php\n return {$dataArray};\n ?>");

        $notification= trans('admin_validation.Update Successfully');
        $notification=array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    public function adminValidationLnagugae(Request $request){
        $data = include('lang/'.$request->lang_code.'/admin_validation.php');
        $languages = Language::get();
        return view('admin.admin_validation_language', compact('data','languages'));
    }

    public function updateAdminValidationLnagugae(Request $request){
        $dataArray = [];
        foreach($request->values as $index => $value){
            $dataArray[$index] = $value;
        }
        file_put_contents('lang/'.$request->lang_code.'/admin_validation.php', "");
        $dataArray = var_export($dataArray, true);
        file_put_contents('lang/'.$request->lang_code.'/admin_validation.php', "<?php\n return {$dataArray};\n ?>");

        $notification= trans('admin_validation.Update Successfully');
        $notification=array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    public function websiteLanguage(Request $request){

        $data = include('lang/'.$request->lang_code.'/user.php');
        $languages = Language::get();
        return view('admin.language', compact('data','languages'));
    }

    public function updateLanguage(Request $request){

        $dataArray = [];
        foreach($request->values as $index => $value){
            $dataArray[$index] = $value;
        }
        file_put_contents('lang/'.$request->lang_code.'/user.php', "");
        $dataArray = var_export($dataArray, true);
        file_put_contents('lang/'.$request->lang_code.'/user.php', "<?php\n return {$dataArray};\n ?>");

        $notification= trans('admin_validation.Update Successfully');
        $notification=array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }


    public function websiteValidationLanguage(Request $request){
        $data = include('lang/'.$request->lang_code.'/user_validation.php');
        $languages = Language::get();
        return view('admin.website_validation_language', compact('data','languages'));
    }

    public function updateValidationLanguage(Request $request){

        $dataArray = [];
        foreach($request->values as $index => $value){
            $dataArray[$index] = $value;
        }
        file_put_contents('lang/'.$request->lang_code.'/user_validation.php', "");
        $dataArray = var_export($dataArray, true);
        file_put_contents('lang/'.$request->lang_code.'/user_validation.php', "<?php\n return {$dataArray};\n ?>");

        $notification= trans('admin_validation.Update Successfully');
        $notification=array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    public function languages(){
        $languages = Language::get();
        return view('admin.languages')->with([
            'languages' => $languages,
        ]);
    }

    public function create(){
        return view('admin.create_language');
    }

    public function store(Request $request){

        $rules = [
            'lang_name'=>'required|unique:languages',
            'lang_code'=>'required|unique:languages'
        ];
        $customMessages = [
            'lang_name.required' => trans('admin_validation.Name is required'),
            'lang_name.unique' => trans('admin_validation.Name already exist'),
            'lang_code.required' => trans('admin_validation.Code is required'),
            'lang_code.unique' => trans('admin_validation.Code already exist'),
        ];
        $this->validate($request, $rules,$customMessages);

        $language = new Language();

        if($request->is_default == 'Yes'){
            DB::table('languages')->update(['is_default' => 'No']);
        }

        $language->lang_name = $request->lang_name;
        $language->lang_code = $request->lang_code;
        $language->is_default = $request->is_default;
        $language->lang_direction = $request->lang_direction;
        $language->status = $request->status;
        $language->save();


        $path = base_path().'/lang'.'/'.$request->lang_code;

        if (! File::exists($path)) {
            File::makeDirectory($path);
            
            
            $sourcePath = base_path().'/lang/en';
            $destinationPath = $path;

            // Get all files from the source folder
            $files = File::allFiles($sourcePath);

            foreach ($files as $file) {
                $destinationFile = $destinationPath . '/' . $file->getRelativePathname();

                // Copy the file to the destination folder
                File::copy($file->getRealPath(), $destinationFile);
            }

        }

        $blgo_categories = BlogCategory::with('blogcategorylanguageadmin')->get();

        foreach($blgo_categories as $category){
            $blog_category_language = new BlogCategoryLanguage();
            $blog_category_language->category_id = $category->id;
            $blog_category_language->lang_code = $request->lang_code;
            $blog_category_language->category_name = $category->blogcategorylanguageadmin->category_name;
            $blog_category_language->save();
        }

        $blogs = Blog::with('bloglanguageadmin')->get();

        foreach($blogs as $blog){
            $blog_language = new BlogLanguage();
            $blog_language->blog_id = $blog->id;
            $blog_language->lang_code = $request->lang_code;

            $blog_language->title = $blog->bloglanguageadmin->title;

            $blog_language->tag = $blog->bloglanguageadmin->tag;
            $blog_language->short_description = $blog->bloglanguageadmin->short_description;
            $blog_language->description = $blog->bloglanguageadmin->description;
            $blog_language->seo_title = $blog->bloglanguageadmin->seo_title;
            $blog_language->seo_description = $blog->bloglanguageadmin->seo_description;
            $blog_language->save();
        }

        $categories = Category::with('catlangadmin')->get();

        foreach($categories as $category){
            $category_language = new CategoryLanguage();
            $category_language->category_id = $category->id;
            $category_language->lang_code = $request->lang_code;
            $category_language->name = $category->catlangadmin->name;
            $category_language->save();
        }

        $products = Product::with('productlangadmin')->get();

        foreach($products as $product){
            $product_language = new ProductLanguage();
            $product_language->product_id = $product->id;
            $product_language->lang_code = $request->lang_code;
            $product_language->name = $product->productlangadmin->name;
            $product_language->description = $product->productlangadmin->description;
            $product_language->tags = $product->productlangadmin->tags;
            $product_language->seo_title = $product->productlangadmin->seo_title;
            $product_language->seo_description = $product->productlangadmin->seo_description;
            $product_language->save();
        }

        $discount = ProductDiscount::with('discountlangadmin')->first();

        if($discount){
            $product_discount_language = new ProductDiscountLanguage();
            $product_discount_language->discount_id = $discount->id;
            $product_discount_language->lang_code = $request->lang_code;
            $product_discount_language->title = $discount->discountlangadmin->title;
            $product_discount_language->save();
        }

        $package_content = ScriptContent::with('scriptlangadmin')->first();

        if($package_content){
            $content_language = new ScriptContentLanguage();
            $content_language->script_id = $package_content->id;
            $content_language->lang_code = $language->lang_code;
            $content_language->regular_content = $package_content->scriptlangadmin->regular_content;
            $content_language->extend_content = $package_content->scriptlangadmin->extend_content;
            $content_language->save();
        }

        $productItem = ProductItem::with('productitemlangadmin')->first();

        if($productItem){
            $product_item_language = new ProductItemLanguage();
            $product_item_language->item_id = $productItem->id;
            $product_item_language->lang_code = $language->lang_code;
            $product_item_language->script_title = $productItem->productitemlangadmin->script_title;
            $product_item_language->script_description = $productItem->productitemlangadmin->script_description;
            $product_item_language->image_title = $productItem->productitemlangadmin->image_title;
            $product_item_language->image_description = $productItem->productitemlangadmin->image_description;
            $product_item_language->video_title = $productItem->productitemlangadmin->video_title;
            $product_item_language->video_description = $productItem->productitemlangadmin->video_description;
            $product_item_language->audio_title = $productItem->productitemlangadmin->audio_title;
            $product_item_language->audio_description = $productItem->productitemlangadmin->audio_description;
            $product_item_language->save();
        }

        $productType = ProductTypePage::with('pagelangadmin')->first();

        if($productType){
            $product_type_language = new ProductTypePageLanguage();
            $product_type_language->product_type_id = $productType->id;
            $product_type_language->lang_code = $language->lang_code;
            $product_type_language->title = $productType->pagelangadmin->title;
            $product_type_language->description = $productType->pagelangadmin->description;
            $product_type_language->save();
        }

        $footer = Footer::with('footerlangadmin')->first();

        if($footer){
            $footer_language =  new FooterLanguage();
            $footer_language->footer_id = $footer->id;
            $footer_language->lang_code = $language->lang_code;
            $footer_language->copyright = $footer->footerlangadmin->copyright;
            $footer_language->description = $footer->footerlangadmin->description;
            $footer_language->save();
        }

        $contents = SectionContent::with('contentlangadmin')->get();

        foreach($contents as $content){
            $content_language = new SectionContentLanguage();
            $content_language->content_id = $content->id;
            $content_language->lang_code = $request->lang_code;
            $content_language->section_name = $content->contentlangadmin->section_name;
            $content_language->title = $content->contentlangadmin->title;
            $content_language->description = $content->contentlangadmin->description;
            $content_language->save();
        }

        $slider = Slider::with('sliderlangadmin')->first();

        if($slider){
            $slider_language = new SliderLanguage();
            $slider_language->slider_id = $slider->id;
            $slider_language->lang_code = $request->lang_code;
            $slider_language->home1_title = $slider->sliderlangadmin->home1_title;
            $slider_language->home2_title = $slider->sliderlangadmin->home2_title;
            $slider_language->home3_title = $slider->sliderlangadmin->home3_title;
            $slider_language->home2_description = $slider->sliderlangadmin->home2_description;
            $slider_language->home3_description = $slider->sliderlangadmin->home3_description;
            $slider_language->save();
        }


        $homepage = Homepage::with('homelangadmin')->first();

        if($homepage){
            $homepage_language = new HomepageLanguage();
            $homepage_language->home_id = $homepage->id;
            $homepage_language->lang_code = $request->lang_code;
            $homepage_language->why_choose_title1 = $homepage->homelangadmin->why_choose_title1;
            $homepage_language->why_choose_title2 = $homepage->homelangadmin->why_choose_title2;
            $homepage_language->why_choose_item1_title = $homepage->homelangadmin->why_choose_item1_title;
            $homepage_language->why_choose_item2_title = $homepage->homelangadmin->why_choose_item2_title;
            $homepage_language->why_choose_item3_title = $homepage->homelangadmin->why_choose_item3_title;
            $homepage_language->why_choose_home3_item1_title = $homepage->homelangadmin->why_choose_home3_item1_title;
            $homepage_language->why_choose_home3_item2_desc = $homepage->homelangadmin->why_choose_home3_item2_desc;
            $homepage_language->why_choose_home3_item3_title = $homepage->homelangadmin->why_choose_home3_item3_title;
            $homepage_language->why_choose_home3_item1_desc = $homepage->homelangadmin->why_choose_home3_item1_desc;
            $homepage_language->why_choose_home3_item2_title = $homepage->homelangadmin->why_choose_home3_item2_title;
            $homepage_language->why_choose_home3_item3_desc = $homepage->homelangadmin->why_choose_home3_item3_desc;
            
            $homepage_language->counter1_title = $homepage->homelangadmin->counter1_title;
            $homepage_language->counter2_title = $homepage->homelangadmin->counter2_title;
            $homepage_language->counter3_title = $homepage->homelangadmin->counter3_title;
            $homepage_language->counter4_title = $homepage->homelangadmin->counter4_title;

            $homepage_language->offer_title1 = $homepage->homelangadmin->offer_title1;
            $homepage_language->offer_title2 = $homepage->homelangadmin->offer_title2;
            $homepage_language->offer_home3_item1_title = $homepage->homelangadmin->offer_home3_item1_title;
            $homepage_language->offer_home3_item1_description = $homepage->homelangadmin->offer_home3_item1_description;
            $homepage_language->offer_home3_item2_title = $homepage->homelangadmin->offer_home3_item2_title;
            $homepage_language->offer_home3_item2_description = $homepage->homelangadmin->offer_home3_item2_description;
            $homepage_language->about_offer_title1 = $homepage->homelangadmin->about_offer_title1;
            $homepage_language->about_offer_title2 = $homepage->homelangadmin->about_offer_title2;
            $homepage_language->about_offer_title3 = $homepage->homelangadmin->about_offer_title3;

            $homepage_language->trending_offer_title1 = $homepage->homelangadmin->trending_offer_title1;
            $homepage_language->trending_offer_title2 = $homepage->homelangadmin->trending_offer_title2;

            $homepage_language->app_home2_title = $homepage->homelangadmin->app_home2_title;
            $homepage_language->app_home2_desc = $homepage->homelangadmin->app_home2_desc;
            $homepage_language->app_title1 = $homepage->homelangadmin->app_title1;
            $homepage_language->app_title2 = $homepage->homelangadmin->app_title2;
            $homepage_language->app_title3 = $homepage->homelangadmin->app_title3;
            $homepage_language->app_description = $homepage->homelangadmin->app_description;
            $homepage_language->app_home3_title = $homepage->homelangadmin->app_home3_title;
            $homepage_language->app_home3_desc = $homepage->homelangadmin->app_home3_desc;

            $homepage_language->save();
        }

        $setting = Setting::with('settinglangadmin')->first();
        
        if($setting){
            $setting_language = new SettingLanguage();
            $setting_language->setting_id = $setting->id;
            $setting_language->lang_code = $language->lang_code;
            $setting_language->subscriber_title = $setting->settinglangadmin->subscriber_title;
            $setting_language->subscriber_description = $setting->settinglangadmin->subscriber_description;
            $setting_language->save();
        }



       $testimonials = Testimonial::with('testimoniallangadmin')->get();

        foreach($testimonials as $testimonial){
            $testimonial_language = new TestimonialLanguage();
            $testimonial_language->testimonial_id = $testimonial->id;
            $testimonial_language->lang_code = $request->lang_code;
            $testimonial_language->name = $testimonial->testimoniallangadmin->name;
            $testimonial_language->designation = $testimonial->testimoniallangadmin->designation;
            $testimonial_language->comment = $testimonial->testimoniallangadmin->comment;
            $testimonial_language->save();
        }

        $templates = Template::with('templatelangadmin')->get();

        foreach($templates as $template){
            $template_language = new TemplateLanguage();
            $template_language->template_id = $template->id;
            $template_language->lang_code = $request->lang_code;
            $template_language->title = $template->templatelangadmin->title;
            $template_language->description = $template->templatelangadmin->description;
            $template_language->save();
        }

        $teams = OurTeam::with('teamlangadmin')->get();

        foreach($teams as $team){
            $team_language = new OurTeamLanguage();
            $team_language->team_id = $team->id;
            $team_language->lang_code = $language->lang_code;
            $team_language->name = $team->teamlangadmin->name;
            $team_language->designation = $team->teamlangadmin->designation;
            $team_language->save();
        }

        //pages

        $about = AboutUs::with('aboutlangadmin')->first();
        
        if($about){
            $about_language = new AboutUsLanguage();
            $about_language->about_id = $about->id;
            $about_language->lang_code = $language->lang_code;
            $about_language->name = $about->aboutlangadmin->name;
            $about_language->desgination = $about->aboutlangadmin->desgination;
            $about_language->title = $about->aboutlangadmin->title;
            $about_language->header1 = $about->aboutlangadmin->header1;
            $about_language->header2 = $about->aboutlangadmin->header2;
            $about_language->header3 = $about->aboutlangadmin->header3;
            $about_language->about_us = $about->aboutlangadmin->about_us;
            $about_language->save();
        }

        $become_author = BecomeAuthor::with('becomelangadmin')->first();
        
        if($become_author){
            $become_language = new BecomeAuthorLanguage();
            $become_language->become_id = $become_author->id;
            $become_language->lang_code = $language->lang_code;
            $become_language->title = $become_author->becomelangadmin->title;
            $become_language->name = $become_author->becomelangadmin->name;
            $become_language->desgination = $become_author->becomelangadmin->desgination;
            $become_language->header1 = $become_author->becomelangadmin->header1;
            $become_language->header2 = $become_author->becomelangadmin->header2;
            $become_language->description = $become_author->becomelangadmin->description;
            $become_language->item1 = $become_author->becomelangadmin->item1;
            $become_language->item2 = $become_author->becomelangadmin->item2;
            $become_language->item3 = $become_author->becomelangadmin->item3;
            $become_language->item4 = $become_author->becomelangadmin->item4;
            $become_language->save();
        }

        $contact = ContactPage::with('contactlangadmin')->first();
        
        if($contact){
            $contact_language = new ContactPageLanguage();
            $contact_language->contact_id = $contact->id;
            $contact_language->lang_code = $language->lang_code;
            $contact_language->title1 = $contact->contactlangadmin->title1;
            $contact_language->title2 = $contact->contactlangadmin->title2;
            $contact_language->time = $contact->contactlangadmin->time;
            $contact_language->off_day = $contact->contactlangadmin->off_day;
            $contact_language->address = $contact->contactlangadmin->address;
            $contact_language->phone = $contact->contactlangadmin->phone;
            $contact_language->save();
        }

        $termsAndCondition = TermsAndCondition::with('termslangadmin')->first();
        
        if($termsAndCondition){
            $terms_condition_language = new TermsAndConditionLanguage();
            $terms_condition_language->terms_id = $termsAndCondition->id;
            $terms_condition_language->lang_code = $language->lang_code;
            $terms_condition_language->terms_and_condition = $termsAndCondition->termslangadmin->terms_and_condition;
            $terms_condition_language->save();
        }

        $privacyPolicy = PrivacyPolicy::with('privacylangadmin')->first();
        
        if($privacyPolicy){
            $privacy_policy_language = new PrivacyPolicyLanguage();
            $privacy_policy_language->privacy_id = $privacyPolicy->id;
            $privacy_policy_language->lang_code = $language->lang_code;
            $privacy_policy_language->privacy_policy = $privacyPolicy->privacylangadmin->privacy_policy;
            $privacy_policy_language->save();
        }

        $faqs = Faq::with('faqlangadmin')->get();

        foreach($faqs as $faq){
            $faq_language = new FaqLanguage();
            $faq_language->faq_id = $faq->id;
            $faq_language->lang_code = $language->lang_code;
            $faq_language->question = $faq->faqlangadmin->question;
            $faq_language->answer = $faq->faqlangadmin->answer;
            $faq_language->save();
        }
        
        $custom_pages = CustomPage::with('customlangadmin')->get();

        foreach($custom_pages as $page){
            $custom_page_language = new CustomPageLanguage();
            $custom_page_language->custom_id = $page->id;
            $custom_page_language->lang_code = $language->lang_code;
            $custom_page_language->page_name = $page->customlangadmin->page_name;
            $custom_page_language->description = $page->customlangadmin->description;
            $custom_page_language->save();
        }
        

        $notification=trans('admin_validation.Created Successfully');
        $notification=array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->route('admin.languages')->with($notification);
    }

    public function edit($id){
        $language = Language::findOrFail($id);
        return view('admin.edit_language')->with([
            'language' => $language,
        ]);
    }

    public function update(Request $request, $id){
        
        $rules = [
            'lang_name'=> $id != 1 ? 'required|unique:languages,id,'.$id : '',
            'lang_code'=> $id != 1 ? 'required|unique:languages,id,'.$id : '',
        ];
        $customMessages = [
            'lang_name.required' => trans('admin_validation.Name is required'),
            'lang_name.unique' => trans('admin_validation.Name already exist'),
            'lang_code.required' => trans('admin_validation.Code is required'),
            'lang_code.unique' => trans('admin_validation.Code already exist'),
        ];

        $this->validate($request, $rules,$customMessages);

        $language = Language::findOrFail($id);

        if ($language->id != 1) {
            $old_path = base_path().'/lang'.'/'.$language->lang_code;
            $update_path = base_path().'/lang'.'/'.$request->lang_code;

            if (File::exists($old_path) && $old_path != $update_path) {
                File::move($old_path, $update_path);
            }
            
            BlogCategoryLanguage::where('lang_code', $language->lang_code)->update(['lang_code' => $request->lang_code]);
            BlogLanguage::where('lang_code', $language->lang_code)->update(['lang_code' => $request->lang_code]);
            CategoryLanguage::where('lang_code', $language->lang_code)->update(['lang_code' => $request->lang_code]);
            ProductLanguage::where('lang_code', $language->lang_code)->update(['lang_code' => $request->lang_code]);
            SectionContentLanguage::where('lang_code', $language->lang_code)->update(['lang_code' => $request->lang_code]);
            SliderLanguage::where('lang_code', $language->lang_code)->update(['lang_code' => $request->lang_code]);
            HomepageLanguage::where('lang_code', $language->lang_code)->update(['lang_code' => $request->lang_code]);
            TestimonialLanguage::where('lang_code', $language->lang_code)->update(['lang_code' => $request->lang_code]);
            TemplateLanguage::where('lang_code', $language->lang_code)->update(['lang_code' => $request->lang_code]);
            OurTeamLanguage::where('lang_code', $language->lang_code)->update(['lang_code' => $request->lang_code]);
            SettingLanguage::where('lang_code', $language->lang_code)->update(['lang_code' => $request->lang_code]);
            AboutUsLanguage::where('lang_code', $language->lang_code)->update(['lang_code' => $request->lang_code]);
            BecomeAuthorLanguage::where('lang_code', $language->lang_code)->update(['lang_code' => $request->lang_code]);
            ContactPageLanguage::where('lang_code', $language->lang_code)->update(['lang_code' => $request->lang_code]);
            TermsAndConditionLanguage::where('lang_code', $language->lang_code)->update(['lang_code' => $request->lang_code]);
            PrivacyPolicyLanguage::where('lang_code', $language->lang_code)->update(['lang_code' => $request->lang_code]);
            FaqLanguage::where('lang_code', $language->lang_code)->update(['lang_code' => $request->lang_code]);
            CustomPageLanguage::where('lang_code', $language->lang_code)->update(['lang_code' => $request->lang_code]);
            ProductDiscountLanguage::where('lang_code', $language->lang_code)->update(['lang_code' => $request->lang_code]);
            ScriptContentLanguage::where('lang_code', $language->lang_code)->update(['lang_code' => $request->lang_code]);
            ProductItemLanguage::where('lang_code', $language->lang_code)->update(['lang_code' => $request->lang_code]);
            ProductTypePageLanguage::where('lang_code', $language->lang_code)->update(['lang_code' => $request->lang_code]);
            FooterLanguage::where('lang_code', $language->lang_code)->update(['lang_code' => $request->lang_code]);
        }
        if($request->is_default == 'Yes'){
            DB::table('languages')->where('id', '!=', $language->id)->update(['is_default' => 'No']);
        }

        if($language->is_default == 'Yes' && $request->is_default == 'No'){
            DB::table('languages')->where('id', 1)->update(['is_default' => 'Yes']);
        }

        if ($language->id != 1) {
            $language->lang_name = $request->lang_name;
        }

        if ($language->id != 1) {
            $language->lang_code = $request->lang_code;
        }

        
        $language->is_default = $request->is_default;

        $language->lang_direction = $request->lang_direction;

        if ($language->id != 1) {
            $language->status = $request->status;
        }

        $language->save();

        
        $notification=trans('admin_validation.Updated Successfully');
        $notification=array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->route('admin.languages')->with($notification);
    }

    public function destroy($id)
    {
        $language = Language::findOrFail($id);
        $path = base_path().'/lang'.'/'.$language->lang_code;

        if (File::exists($path)) {
            File::deleteDirectory($path);
        }

        $language->delete();

        $blog_category_language = BlogCategoryLanguage::where('lang_code', $language->lang_code)->delete();
        $blog_language = BlogLanguage::where('lang_code', $language->lang_code)->delete();
        $category_language = CategoryLanguage::where('lang_code', $language->lang_code)->delete();
        $product_language = ProductLanguage::where('lang_code', $language->lang_code)->delete();
        $section_content_language = SectionContentLanguage::where('lang_code', $language->lang_code)->delete();
        $slider_language = SliderLanguage::where('lang_code', $language->lang_code)->delete();
        $homepage_language = HomepageLanguage::where('lang_code', $language->lang_code)->delete();
        $testimonial_language = TestimonialLanguage::where('lang_code', $language->lang_code)->delete();
        $template_language = TemplateLanguage::where('lang_code', $language->lang_code)->delete();
        $team_language = OurTeamLanguage::where('lang_code', $language->lang_code)->delete();
        $setting_language = SettingLanguage::where('lang_code', $language->lang_code)->delete();
        $about_language = AboutUsLanguage::where('lang_code', $language->lang_code)->delete();
        $become_language = BecomeAuthorLanguage::where('lang_code', $language->lang_code)->delete();
        $contact_language = ContactPageLanguage::where('lang_code', $language->lang_code)->delete();
        $terms_condition_language = TermsAndConditionLanguage::where('lang_code', $language->lang_code)->delete();
        $privacy_policy_language = PrivacyPolicyLanguage::where('lang_code', $language->lang_code)->delete();
        $faq_language = FaqLanguage::where('lang_code', $language->lang_code)->delete();
        $custom_page_language = CustomPageLanguage::where('lang_code', $language->lang_code)->delete();
        $product_discount_language = ProductDiscountLanguage::where('lang_code', $language->lang_code)->delete();
        $content_language = ScriptContentLanguage::where('lang_code', $language->lang_code)->delete();
        $product_item_language = ProductItemLanguage::where('lang_code', $language->lang_code)->delete();
        $product_type_language = ProductTypePageLanguage::where('lang_code', $language->lang_code)->delete();
        $footer_language = FooterLanguage::where('lang_code', $language->lang_code)->delete();

        $notification = trans('admin_validation.Delete Successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->route('admin.languages')->with($notification);
    }
}
