<?php

namespace App\Http\Controllers\User;

use Str;
use Auth;
use File;
use Hash;
use Slug;
use Image;
use Session;
use App\Models\User;
use App\Models\Order;
use App\Models\Review;
use App\Models\Ticket;

use App\Rules\Captcha;
use App\Models\Product;
use App\Models\Setting;
use App\Models\Category;
use App\Models\Language;
use App\Models\Wishlist;
use App\Models\OrderItem;

use App\Events\SellerToUser;
use Illuminate\Http\Request;
use App\Models\RefundRequest;
use App\Models\TicketMessage;
use App\Models\ProductComment;
use App\Models\ProductVariant;
use App\Models\BreadcrumbImage;
use App\Models\GoogleRecaptcha;
use App\Models\MessageDocument;
use App\Models\ProductLanguage;
use App\Models\ProductTypePage;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Response;

class UserProfileController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:web');
    }

    public function translator(){
        $front_lang = Session::get('front_lang');
        $language = Language::where('is_default', 'Yes')->first();
        if($front_lang == ''){
            $front_lang = Session::put('front_lang', $language->lang_code);
        }
        config(['app.locale' => $front_lang]);
    }

    public function dashboard(){
        $this->translator();
        $user = Auth::guard('web')->user();
        $setting = Setting::first();
        
        $active_theme = 'layout2';

        return view('user.dashboard')->with([
            'active_theme' => $active_theme,
            'user' => $user,
            'setting' => $setting,
        ]);
    }

    public function portfolio($id=null){
        $this->translator();
        $setting = Setting::first();
        $user = Auth::guard('web')->user();
        $products = Product::with('category','author','productlangfrontend')->where(['author_id' => $user->id])->orderBy('id','desc')->select('id','name','slug','thumbnail_image','regular_price','category_id','author_id','status','approve_by_admin')->paginate(10);
        
        
        
        $active_theme = 'layout2';

        return view('user.portfolio')->with([
            'active_theme' => $active_theme,
            'user' => $user,
            'products' => $products,
            'setting' => $setting,
        ]);
    }

    public function download(){
        $this->translator();
        $setting = Setting::first();

        $user = Auth::guard('web')->user();
        $orders=Order::where('user_id', $user->id)->where('order_status', 1)->get();

        $order_items=OrderItem::with('product', 'variant', 'order')->where('user_id', $user->id)->latest()->paginate(10);

        $active_theme = 'layout2';

        return view('user.download')->with([
            'active_theme' => $active_theme,
            'user' => $user,
            'order_items' => $order_items,
            'setting' => $setting,
        ]);
    }

    public function collection(){
        $this->translator();
        $setting = Setting::first();
        $user = Auth::guard('web')->user();
        $wishlists=Wishlist::with('product')->where('user_id', $user->id)->paginate(6);
        
        $active_theme = 'layout2';

        return view('user.collection')->with([
            'active_theme' => $active_theme,
            'user' => $user,
            'wishlists' => $wishlists,
            'setting' => $setting,
        ]);
    }

    public function delete_wishlist($id){
       $this->translator();
       $wishlist=Wishlist::findOrFail($id);
       $wishlist->delete();
       $notification = trans('user_validation.Successfully deleted');
       $notification = array('messege'=>$notification,'alert-type'=>'success');
       return redirect()->back()->with($notification);
    }

    public function select_product_type(){
        $this->translator();
        $user = Auth::guard('web')->user();
        $productType = ProductTypePage::first();
        
        $active_theme = 'layout2';

        return view('user.select_product_type')->with([
            'active_theme' => $active_theme,
            'user' => $user,
            'productType' => $productType,
        ]);
    }

    public function product_create(Request $request){
        $this->translator();
        $rules = [
            'product_type'=>'required',
        ];

        $customMessages = [
            'product_type.required' => trans('user_validation.Product type is required'),
        ];
        $this->validate($request, $rules,$customMessages);
        $user = Auth::guard('web')->user();
        
        $active_theme = 'layout2';

        if(!$request->product_type){
            $notification = trans('user_validation.Something went wrong');
            $notification = array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->route('select-product-type')->with($notification);
        }

        if($request->product_type == 'script'){
            $categories = Category::where('status', 1)->get();
            $product_type = $request->product_type;

            return view('user.create_product')->with([
                'active_theme' => $active_theme,
                'categories' => $categories,
                'product_type' => $product_type,
            ]);

        }elseif($request->product_type == 'image'){

            $categories = Category::where('status', 1)->get();
            $product_type = $request->product_type;

            return view('user.create_image_product')->with([
                'active_theme' => $active_theme,
                'categories' => $categories,
                'product_type' => $product_type,
            ]);
        }elseif($request->product_type == 'video'){

            $categories = Category::where('status', 1)->get();
            $authors = User::where('status', 1)->orderBy('name', 'asc')->get();
            $product_type = $request->product_type;

            return view('user.create_image_product')->with([
                'active_theme' => $active_theme,
                'categories' => $categories,
                'product_type' => $product_type,
            ]);
        }elseif($request->product_type == 'audio'){

            $categories = Category::where('status', 1)->get();
            $product_type = $request->product_type;

            return view('user.create_image_product')->with([
                'active_theme' => $active_theme,
                'categories' => $categories,
                'product_type' => $product_type,
            ]);
        }else{
            abort(404);
        }
    }

    public function store(Request $request){
        $this->translator();
        $rules = [
            'thumb_image'=>'required',
            'upload_file'=> 'required|file|mimes:zip',
            'product_icon'=>'required',
            'category'=>'required',
            'name'=>'required',
            'slug'=>'required|unique:products',
            'preview_link'=>'required',
            'regular_price'=>'required|numeric',
            'extend_price'=>'required|numeric',
            'description'=>'required',
            'tags'=>'required',
            'product_type'=>'required',
        ];

        $customMessages = [
            'thumb_image.required' => trans('user_validation.Thumbnail is required'),
            'download_file_type.required' => trans('user_validation.Upload file type is required'),
            'product_icon.required' => trans('user_validation.Product icon is required'),
            'upload_file.required' => trans('user_validation.Upload file is required'),
            'download_link.required' => trans('user_validation.Download link is required'),
            'category.required' => trans('user_validation.Category is required'),
            'name.required' => trans('user_validation.Name is required'),
            'slug.required' => trans('user_validation.Slug is required'),
            'slug.unique' => trans('user_validation.Slug already exist'),
            'preview_link.required' => trans('user_validation.Preview link is required'),
            'regular_price.required' => trans('user_validation.Regular price is required'),
            'extend_price.required' => trans('user_validation.Extend price is required'),
            'extend_price.numeric' => trans('user_validation.Extend price should be numeric value'),
            'regular_price.numeric' => trans('user_validation.Regular price should be numeric value'),
            'description.required' => trans('user_validation.Description is required'),
            'tags.required' => trans('user_validation.Tag is required'),
        ];
        $this->validate($request, $rules,$customMessages);
        $user = Auth::guard('web')->user();
        $product = new Product();

        if($request->thumb_image){
            $extention = $request->thumb_image->getClientOriginalExtension();
            $image_name = 'thumb_image'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name = 'uploads/custom-images/'.$image_name;
            Image::make($request->thumb_image)
                ->save(public_path().'/'.$image_name);
            $product->thumbnail_image = $image_name;
        }

        if($request->product_icon){
            $extention = $request->product_icon->getClientOriginalExtension();
            $image_name = 'product_icon'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name = 'uploads/custom-images/'.$image_name;
            Image::make($request->product_icon)
                ->save(public_path().'/'.$image_name);
            $product->product_icon = $image_name;
        }

        if($request->file('upload_file')){
            $extention = $request->upload_file->getClientOriginalExtension();
            $image_name = 'Script'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $request->upload_file->move(public_path('uploads/custom-images/'),$image_name);
            $product->download_file = $image_name;
        }
        
        $product->product_type = $request->product_type;
        $product->author_id = $user->id;
        $product->slug = $request->slug;
        $product->category_id = $request->category;
        $product->preview_link = $request->preview_link;
        $product->regular_price = $request->regular_price;
        $product->extend_price = $request->extend_price;
        $product->status = 0;
        $product->high_resolution = $request->high_resolution ? 1 : 0;
        $product->cross_browser = $request->cross_browser ? 1 : 0;
        $product->documentation = $request->documentation ? 1 : 0;
        $product->layout = $request->layout ? 1 : 0;
        $product->save();

        $languages = Language::get();
        foreach($languages as $language){
            $product_language = new ProductLanguage();
            $product_language->product_id = $product->id;
            $product_language->lang_code = $language->lang_code;
            $product_language->name = $request->name;
            $product_language->description = $request->description;
            $product_language->tags = $request->tags;
            $product_language->seo_title = $request->seo_title ? $request->seo_title : $request->name;
            $product_language->seo_description = $request->seo_description ? $request->seo_description : $request->name;
            $product_language->save();
        }

        $notification = trans('user_validation.Created successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);

    }

    public function store_image_type_product(Request $request){
        $this->translator();
        $rules = [
            'thumb_image'=>'required',
            'product_icon'=>'required',
            'category'=>'required',
            'name'=>'required',
            'slug'=>'required|unique:products',
            'preview_link'=>'required',
            'regular_price'=>'required',
            'description'=>'required',
            'tags'=>'required',
            'product_type'=>'required',
        ];

        $customMessages = [
            'thumb_image.required' => trans('user_validation.Thumbnail is required'),
            'product_icon.required' => trans('user_validation.Product icon is required'),
            'category.required' => trans('user_validation.Category is required'),
            'name.required' => trans('user_validation.Name is required'),
            'slug.required' => trans('user_validation.Slug is required'),
            'slug.unique' => trans('user_validation.Slug already exist'),
            'preview_link.required' => trans('user_validation.Preview link is required'),
            'regular_price.required' => trans('user_validation.Regular price is required'),
            'description.required' => trans('user_validation.Description is required'),
            'tags.required' => trans('user_validation.Tag is required'),
        ];
        $this->validate($request, $rules,$customMessages);
        $user = Auth::guard('web')->user();
        $product = new Product();

        if($request->thumb_image){
            $extention = $request->thumb_image->getClientOriginalExtension();
            $image_name = 'thumb_image'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name = 'uploads/custom-images/'.$image_name;
            Image::make($request->thumb_image)
                ->save(public_path().'/'.$image_name);
            $product->thumbnail_image = $image_name;
        }
        if($request->product_icon){
            $extention = $request->product_icon->getClientOriginalExtension();
            $image_name = 'product_icon'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name = 'uploads/custom-images/'.$image_name;
            Image::make($request->product_icon)
                ->save(public_path().'/'.$image_name);
            $product->product_icon = $image_name;
        }
        $product->product_type = $request->product_type;
        $product->author_id = $user->id;
        $product->slug = $request->slug;
        $product->preview_link = $request->preview_link;
        $product->regular_price = $request->regular_price;
        $product->category_id = $request->category;
        $product->status = 0;
        $product->high_resolution = $request->high_resolution ? 1 : 0;
        $product->cross_browser = $request->cross_browser ? 1 : 0;
        $product->documentation = $request->documentation ? 1 : 0;
        $product->layout = $request->layout ? 1 : 0;
        $product->save();

        $languages = Language::get();
        foreach($languages as $language){
            $product_language = new ProductLanguage();
            $product_language->product_id = $product->id;
            $product_language->lang_code = $language->lang_code;
            $product_language->name = $request->name;
            $product_language->description = $request->description;
            $product_language->tags = $request->tags;
            $product_language->seo_title = $request->seo_title ? $request->seo_title : $request->name;
            $product_language->seo_description = $request->seo_description ? $request->seo_description : $request->name;
            $product_language->save();
        }

        $notification = trans('user_validation.Created successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->route('product-edit', ['id' => $product->id, 'lang_code' => 'en'])->with($notification);
    }

    public function edit(Request $request, $id){
        $this->translator();
        $user = Auth::guard('web')->user();
        $product = Product::find($id);
        $product_language = ProductLanguage::where(['product_id' => $id, 'lang_code' => $request->lang_code])->first();
        $languages = Language::get();
        $product_variants = ProductVariant::where('product_id', $id)->get();
        $setting=Setting::first();


        $active_theme = 'layout2';

        
        if(!$product->product_type){
            $notification = trans('user_validation.Something went wrong');
            $notification = array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->route('select-product-type')->with($notification);
        }

        if($product->product_type == 'script'){
            $categories = Category::where('status', 1)->get();
            $product_type = $product->product_type;
            return view('user.edit_product')->with([
                'active_theme' => $active_theme,
                'product_language' => $product_language,
                'languages' => $languages,
                'categories' => $categories,
                'product_type' => $product_type,
                'product' => $product,
                'setting' => $setting,
            ]);

        }elseif($product->product_type == 'image'){

            $categories = Category::where('status', 1)->get();
            $authors = User::where('status', 1)->orderBy('name', 'asc')->get();
            $product_type = $product->product_type;

            return view('user.edit_image_product')->with([
                'active_theme' => $active_theme,
                'product_language' => $product_language,
                'languages' => $languages,
                'categories' => $categories,
                'product_type' => $product_type,
                'product' => $product,
                'product_variants' => $product_variants,
                'setting' => $setting,
            ]);
        }elseif($product->product_type == 'video'){

            $categories = Category::where('status', 1)->get();
            $product_type = $product->product_type;

            return view('user.edit_image_product')->with([
                'active_theme' => $active_theme,
                'product_language' => $product_language,
                'languages' => $languages,
                'categories' => $categories,
                'product_type' => $product_type,
                'product' => $product,
                'product_variants' => $product_variants,
                'setting' => $setting,
            ]);
        }elseif($product->product_type == 'audio'){

            $categories = Category::where('status', 1)->get();
            $product_type = $product->product_type;

            return view('user.edit_image_product')->with([
                'active_theme' => $active_theme,
                'product_language' => $product_language,
                'languages' => $languages,
                'categories' => $categories,
                'product_type' => $product_type,
                'product' => $product,
                'product_variants' => $product_variants,
                'setting' => $setting,
            ]);
        }else{
            abort(404);
        }
    }

    public function update(Request $request, $id){
        $this->translator();
        $rules = [
            'category'=>session()->get('front_lang') == $request->lang_code ? 'required':'',
            'name'=>'required',
            'preview_link'=>session()->get('front_lang') == $request->lang_code ? 'required':'',
            'regular_price'=>session()->get('front_lang') == $request->lang_code ? 'required|numeric':'',
            'extend_price'=>session()->get('front_lang') == $request->lang_code ? 'required|numeric':'',
            'description'=>'required',
            'tags'=>'required',
            'product_type'=>session()->get('front_lang') == $request->lang_code ?'required':'',
        ];

        $customMessages = [
            'download_file_type.required' => trans('user_validation.Upload file type is required'),
            'upload_file.required' => trans('user_validation.Upload file is required'),
            'download_link.required' => trans('user_validation.Download link is required'),
            'category.required' => trans('user_validation.Category is required'),
            'name.required' => trans('user_validation.Name is required'),
            'preview_link.required' => trans('user_validation.Preview link is required'),
            'regular_price.required' => trans('user_validation.Regular price is required'),
            'extend_price.required' => trans('user_validation.Extend price is required'),
            'extend_price.numeric' => trans('user_validation.Extend price should be numeric value'),
            'regular_price.numeric' => trans('user_validation.Regular price should be numeric value'),
            'description.required' => trans('user_validation.Description is required'),
            'tags.required' => trans('user_validation.Tag is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $user = Auth::guard('web')->user();
        $product = Product::find($id);
        $product_language = ProductLanguage::where(['product_id' => $id, 'lang_code' => $request->lang_code])->first();
        
        if(session()->get('front_lang') == $request->lang_code){
            if($request->thumb_image){
                $old_image = $product->thumbnail_image;
                $extention = $request->thumb_image->getClientOriginalExtension();
                $image_name = 'thumb_image'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
                $image_name = 'uploads/custom-images/'.$image_name;
                Image::make($request->thumb_image)
                    ->save(public_path().'/'.$image_name);
                $product->thumbnail_image = $image_name;

                if($old_image){
                    if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
                }
            }

            if($request->product_icon){
                $old_icon = $product->product_icon;
                $extention = $request->product_icon->getClientOriginalExtension();
                $image_name = 'product_icon'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
                $image_name = 'uploads/custom-images/'.$image_name;
                Image::make($request->product_icon)
                    ->save(public_path().'/'.$image_name);
                $product->product_icon = $image_name;

                if($old_icon){
                    if(File::exists(public_path().'/'.$old_icon))unlink(public_path().'/'.$old_icon);
                }
            }

            if($request->file('upload_file')){
                $old_download_file = $product->download_file;
                $extention = $request->upload_file->getClientOriginalExtension();
                $image_name = 'Script'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
                $request->upload_file->move(public_path('uploads/custom-images/'),$image_name);
                $product->download_file = $image_name;
                $product->save();

                if($old_download_file){
                    if(File::exists(public_path().'/uploads/custom-images/'.$old_download_file))unlink(public_path().'/uploads/custom-images/'.$old_download_file);
                }
            }

            $product->product_type = $request->product_type;
            $product->author_id = $user->id;
            $product->category_id = $request->category;
            $product->preview_link = $request->preview_link;
            $product->regular_price = $request->regular_price;
            $product->extend_price = $request->extend_price;
            $product->high_resolution = $request->high_resolution ? 1 : 0;
            $product->cross_browser = $request->cross_browser ? 1 : 0;
            $product->documentation = $request->documentation ? 1 : 0;
            $product->layout = $request->layout ? 1 : 0;
            $product->save();
        }


        $product_language->name = $request->name;
        $product_language->description = $request->description;
        $product_language->tags = $request->tags;
        $product_language->seo_title = $request->seo_title ? $request->seo_title : $request->name;
        $product_language->seo_description = $request->seo_description ? $request->seo_description : $request->name;
        $product_language->save();

        $notification = trans('user_validation.Updated successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);

    }

    public function image_product_update(Request $request, $id){
        $this->translator();
        $rules = [
            'category'=>session()->get('front_lang') == $request->lang_code ? 'required':'',
            'name'=>'required',
            'preview_link'=>session()->get('front_lang') == $request->lang_code ? 'required':'',
            'regular_price'=>session()->get('front_lang') == $request->lang_code ? 'required':'',
            'description'=>'required',
            'tags'=>'required',
            'product_type'=>session()->get('front_lang') == $request->lang_code ? 'required':'',
        ];

        $customMessages = [
            'category.required' => trans('user_validation.Category is required'),
            'name.required' => trans('user_validation.Name is required'),
            'preview_link.required' => trans('user_validation.Preview link is required'),
            'regular_price.required' => trans('user_validation.Regular price is required'),
            'description.required' => trans('user_validation.Description is required'),
            'tags.required' => trans('user_validation.Tag is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $user = Auth::guard('web')->user();
        $product = Product::find($id);
        $product_language = ProductLanguage::where(['product_id' => $id, 'lang_code' => $request->lang_code])->first();

        if(session()->get('front_lang') == $request->lang_code){
            if($request->thumb_image){
                $old_image = $product->thumbnail_image;
                $extention = $request->thumb_image->getClientOriginalExtension();
                $image_name = 'thumb_image'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
                $image_name = 'uploads/custom-images/'.$image_name;
                Image::make($request->thumb_image)
                    ->save(public_path().'/'.$image_name);
                $product->thumbnail_image = $image_name;

                if($old_image){
                    if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
                }
            }

            if($request->product_icon){
                $old_icon = $product->product_icon;
                $extention = $request->product_icon->getClientOriginalExtension();
                $image_name = 'product_icon'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
                $image_name = 'uploads/custom-images/'.$image_name;
                Image::make($request->product_icon)
                    ->save(public_path().'/'.$image_name);
                $product->product_icon = $image_name;

                if($old_icon){
                    if(File::exists(public_path().'/'.$old_icon))unlink(public_path().'/'.$old_icon);
                }
            }
            $product->author_id = $user->id;
            $product->preview_link = $request->preview_link;
            $product->regular_price = $request->regular_price;
            $product->category_id = $request->category;
            $product->tags = $request->tags;
            $product->high_resolution = $request->high_resolution ? 1 : 0;
            $product->cross_browser = $request->cross_browser ? 1 : 0;
            $product->documentation = $request->documentation ? 1 : 0;
            $product->layout = $request->layout ? 1 : 0;
            $product->save();
        }

        $product_language->name = $request->name;
        $product_language->description = $request->description;
        $product_language->tags = $request->tags;
        $product_language->seo_title = $request->seo_title ? $request->seo_title : $request->name;
        $product_language->seo_description = $request->seo_description ? $request->seo_description : $request->name;
        $product_language->save();

        $notification = trans('user_validation.Updated successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    public function store_product_variant(Request $request, $id){
        $this->translator();
        $rules = [
            'variant_name'=>'required',
            'file_name'=>'required',
            'price'=>'required|numeric',
        ];

        $customMessages = [
            'variant_name.required' => trans('user_validation.Variant name is required'),
            'file_name.required' => trans('user_validation.Upload file is required'),
            'price.required' => trans('user_validation.Price is required'),
            'price.numeric' => trans('user_validation.Price should be numeric value'),
        ];
        $this->validate($request, $rules,$customMessages);

        $variant = new ProductVariant();

        if($request->file('file_name')){
            $extention = $request->file_name->getClientOriginalExtension();
            $image_name = 'Script'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $request->file_name->move(public_path('uploads/custom-images/'),$image_name);
            $variant->file_name = $image_name;
        }

        $variant->variant_name = $request->variant_name;
        $variant->price = $request->price;
        $variant->product_id = $id;
        $variant->save();

        $notification = trans('user_validation.Created successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);

    }

    public function product_variant($id){
        $this->translator();
        $user = Auth::guard('web')->user();
        $active_theme = 'layout2';
        return view('user.product_variant')->with([
            'active_theme' => $active_theme,
        ]);
    }

    public function update_product_variant(Request $request, $id){
        $this->translator();
        $rules = [
            'variant_name'=>'required',
            'price'=>'required|numeric',
        ];

        $customMessages = [
            'variant_name.required' => trans('user_validation.Variant name is required'),
            'price.required' => trans('user_validation.Price is required'),
            'price.numeric' => trans('user_validation.Price should be numeric value'),
        ];
        $this->validate($request, $rules,$customMessages);

        $variant = ProductVariant::find($id);
        //dd($request->all());
        //return $request->file('file_name');

        if($request->file('file_name')){
            //return 1;
            $old_download_file = $variant->file_name;
            $extention = $request->file_name->getClientOriginalExtension();
            $image_name = 'Script'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $request->file_name->move(public_path('uploads/custom-images/'),$image_name);
            $variant->file_name = $image_name;
            $variant->save();

            if($old_download_file){
                if(File::exists(public_path().'/uploads/custom-images/'.$old_download_file)){
                    unlink(public_path().'/uploads/custom-images/'.$old_download_file);
                }
            }
        }

        $variant->variant_name = $request->variant_name;
        $variant->price = $request->price;
        $variant->save();

        $notification = trans('user_validation.Updated successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    public function delete_product_variant($id){
        $this->translator();
        $order_item = OrderItem::where('variant_id', $id)->first();
        
        if (!$order_item) {
            $variant = ProductVariant::find($id);
            $old_download_file = $variant->file_name;
            $variant->delete();
            if($old_download_file){
                if(File::exists(public_path().'/uploads/custom-images/'.$old_download_file)){
                    unlink(public_path().'/uploads/custom-images/'.$old_download_file);
                }
            }

            $notification = trans('user_validation.Deleted successfully');
            $notification = array('messege'=>$notification,'alert-type'=>'success');
            return redirect()->back()->with($notification);
        }else{
            $notification = trans("You can't delete sold product variant");
            $notification = array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->back()->with($notification);
        }
    }


    public function profileEdit(){
        $this->translator();
        $user = Auth::guard('web')->user();
        $active_theme = 'layout2';
        return view('user.profile_edit')->with([
            'active_theme' => $active_theme,
            'user' => $user,
        ]);
    }


    public function updateProfile(Request $request){
        $this->translator();
        $user = Auth::guard('web')->user();
        $rules = [
            'name'=>'required',
            'designation'=>'required',
            'phone'=>'required',
            'address'=>'required',
            'about_me'=>'required',
            'my_skill'=>'required',
            'image' => 'file|mimes:png,jpg,jpeg|max:2048',
        ];
        $customMessages = [
            'name.required' => trans('user_validation.Name is required'),
            'designation.required' => trans('user_validation.Designation is required'),
            'phone.required' => trans('user_validation.Phone is required'),
            'address.required' => trans('user_validation.Address is required'),
            'about_me.required' => trans('user_validation.About is required'),
            'my_skill.required' => trans('user_validation.Skill is required'),
            'image.mimes' => trans('user_validation.File type must be: png, jpg,jpeg'),
            'image.max' => trans('user_validation.Maximum file size 2MB'),
        ];
        $this->validate($request, $rules,$customMessages);

        $user->name = $request->name;
        $user->designation = $request->designation;
        $user->phone = $request->phone;
        $user->country = $request->country;
        $user->state = $request->state;
        $user->city = $request->city;
        $user->address = $request->address;
        $user->about_me = $request->about_me;
        $user->my_skill = $request->my_skill;
        $user->facebook = $request->facebook;
        $user->pinterest = $request->pinterest;
        $user->linkedIn = $request->linkedIn;
        $user->dribbble = $request->dribbble;
        $user->twitter = $request->twitter;
        $user->save();
        $image_upload = false;

        if($request->file('image')){
            $old_image=$user->image;
            $user_image=$request->image;
            $extention=$user_image->getClientOriginalExtension();
            $image_name= Str::slug($request->name).date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name='uploads/custom-images/'.$image_name;

            Image::make($user_image)
                ->save(public_path().'/'.$image_name);

            $user->image=$image_name;
            $user->save();
            if($old_image){
                if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
            }
            $image_upload = true;
        }

        $user = User::select('id','name','email','image','phone','address','status','is_provider')->where('id', $user->id)->first();


        $notification = trans('user_validation.Update Successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    public function updateUserPhoto(Request $request){
        $this->translator();
        $user = Auth::guard('web')->user();
        $rules = [
            'image' => 'file|mimes:png,jpg,jpeg|max:2048',
        ];
        $customMessages = [
            'image.mimes' => trans('user_validation.File type must be: png, jpg,jpeg'),
            'image.max' => trans('user_validation.Maximum file size 2MB'),
        ];
        $this->validate($request, $rules,$customMessages);

        if($request->file('image')){
            $old_image=$user->image;
            $user_image=$request->image;
            $extention=$user_image->getClientOriginalExtension();
            $image_name = Str::slug($request->name).date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            
            $image_name ='uploads/custom-images/'.$image_name;

            Image::make($user_image)
                ->save(public_path().'/'.$image_name);

            $user->image=$image_name;
            $user->save();
            if($old_image){
                if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
            }

            return response()->json([
              'status' => 1,
              'message' => 'Image change successfully',
            ]);
        }

    }

    public function changePassword(){
        $this->translator();
        $user = Auth::guard('web')->user();
        $active_theme = 'layout2';
        return view('user.change_password')->with([
            'active_theme' => $active_theme,
            'user' => $user,
        ]);
    }

    public function updatePassword(Request $request){
        $this->translator();
        $rules = [
            'current_password'=>'required',
            'password'=>'required|min:4',
            'c_password' => 'required|same:password',
        ];
        $customMessages = [
            'current_password.required' => trans('user_validation.Current password is required'),
            'password.required' => trans('user_validation.Password is required'),
            'password.min' => trans('user_validation.Password minimum 4 character'),
            'c_password.required' => trans('user_validation.Confirm password is required'),
            'c_password.same' => trans('user_validation.Confirm password does not match'),
        ];
        $this->validate($request, $rules,$customMessages);

        $user = Auth::guard('web')->user();
        if(Hash::check($request->current_password, $user->password)){
            $user->password = Hash::make($request->password);
            $user->save();

            $notification = 'Password change successfully';
            $notification = array('messege'=>$notification,'alert-type'=>'success');
            return redirect()->back()->with($notification);

        }else{
            $notification = trans('user_validation.Current password does not match');
            $notification = array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->back()->with($notification);
        }
    }

    public function download_script($id){
        $this->translator();
        if(Auth::guard('web')->check()){
            $product=Product::findOrFail($id);
            $file=public_path('uploads/custom-images/').'/'.$product->download_file;
            return Response::download($file);
        }else{
            $notification = trans('user_validation.Please login your account');
            $notification = array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->back()->with($notification);
        }
    }

    public function download_variant($id){
        $this->translator();
        if(Auth::guard('web')->check()){
            $product_variant=ProductVariant::findOrFail($id);
            $file=public_path('uploads/custom-images/').'/'.$product_variant->file_name;
            return Response::download($file);
        }else{
            $notification = trans('user_validation.Please login your account');
            $notification = array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->back()->with($notification);
        }
    }


    public function myProfile(){
        $this->translator();
        $user = Auth::guard('web')->user();
        $setting = Setting::first();
        $default_avatar = array(
            'image' => $setting->default_avatar
        );
        $default_avatar = (object) $default_avatar;
        return view('user.my_profile', compact('user','default_avatar'));
    }

    public function addToWishlist($id){
        $this->translator();
        $user = Auth::guard('web')->user();
        $product = Product::find($id);
        $isExist = Wishlist::where(['user_id' => $user->id, 'product_id' => $product->id])->count();
        if($isExist == 0){
            $wishlist = new Wishlist();
            $wishlist->product_id = $id;
            $wishlist->user_id = $user->id;
            $wishlist->save();
            $message = trans('user_validation.Wishlist added successfully');
            return response()->json(['status' => 1, 'message' => $message]);
        }else{
            $message = trans('user_validation.Already added');
            return response()->json(['status' => 0, 'message' => $message]);
        }
    }

    public function removeWishlist($id){
        $this->translator();
        $wishlist = Wishlist::find($id);
        $wishlist->delete();
        $notification = trans('user_validation.Removed successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }


    public function review(){
        $this->translator();
        $user = Auth::guard('web')->user();
        $reviews = ProductReview::orderBy('id','desc')->where(['user_id' => $user->id, 'status' => 1])->paginate(10);
        return view('user.review',compact('reviews'));
    }


    public function storeProductReview(Request $request){
        $this->translator();
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
        $isExistOrder = false;
        $orders = Order::where(['user_id' => $user->id])->get();
        foreach ($orders as $key => $order) {
            foreach ($order->orderProducts as $key => $orderProduct) {
                if($orderProduct->product_id == $request->product_id){
                    $isExistOrder = true;
                }
            }
        }

        if($isExistOrder){
            $isReview = ProductReview::where(['product_id' => $request->product_id, 'user_id' => $user->id])->count();
            if($isReview > 0){
                $message = trans('user_validation.You have already submited review');
                return response()->json(['status' => 0, 'message' => $message]);
            }
            $review = new ProductReview();
            $review->user_id = $user->id;
            $review->rating = $request->rating;
            $review->review = $request->review;
            $review->product_vendor_id = $request->seller_id;
            $review->product_id = $request->product_id;
            $review->save();
            $message = trans('user_validation.Review Submited successfully');
            return response()->json(['status' => 1, 'message' => $message]);
        }else{
            $message = trans('user_validation.Oops! You can not review this product');
            return response()->json(['status' => 0, 'message' => $message]);
        }

    }

    public function updateReview(Request $request, $id){
        $this->translator();
        $rules = [
            'rating'=>'required',
            'review'=>'required',
        ];
        $this->validate($request, $rules);
        $user = Auth::guard('web')->user();
        $review = ProductReview::find($id);
        $review->rating = $request->rating;
        $review->review = $request->review;
        $review->save();

        $notification = trans('user_validation.Updated successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }


    public function productReview(Request $request){
        $this->translator();
        $rules = [
            'rating'=>'required',
            'review'=>'required',
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
            $notification = array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->back()->with($notification);
        }
        
        $review = new Review();
        $review->user_id = $user->id;
        $review->order_id = $request->order_id;
        $review->rating = $request->rating;
        $review->review = $request->review;
        $review->product_id = $request->product_id;
        $review->variant_id = $request->variant_id;
        $review->author_id = $request->author_id;
        $review->save();
        $notification = trans('user_validation.Review Submited successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
        
    }

    public function payment_success(){
        $this->translator();
        $active_theme = 'layout2';
        
        return view('user.payment_success')->with([
            'active_theme' => $active_theme,
        ]);
    }

    public function download_existing_file($file_name){
        $filepath= public_path() . "/uploads/custom-images/".$file_name;
        return response()->download($filepath);
    }

    public function download_existing_variant_file($file_name){
        $filepath= public_path() . "/uploads/custom-images/".$file_name;
        return response()->download($filepath);
    }

    public function delete_product($id){
        $this->translator();
        $order_item = OrderItem::where('product_id', $id)->first();
        if(!$order_item){
            $product = Product::findOrFail($id);
            $product->delete();
            $product_language = ProductLanguage::where('product_id', $id)->delete();
            if($product->thumbnail_image){
                $old_image = $product->thumbnail_image;
                if($old_image){
                    if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);
                }
            }
    
            if($product->product_icon){
                $old_icon = $product->product_icon;
    
                if($old_icon){
                    if(File::exists(public_path().'/'.$old_icon))unlink(public_path().'/'.$old_icon);
                }
            }
    
            if($product->download_file){
                $old_download_file = $product->download_file;
                if($old_download_file){
                    if(File::exists(public_path().'/uploads/custom-images/'.$old_download_file))unlink(public_path().'/uploads/custom-images/'.$old_download_file);
                }
            }
    
            if($product->product_type!='script'){
                $variants = ProductVariant::where('product_id', $id)->get();
                foreach($variants as $variant){
                    $old_download_file = $variant->file_name;
                    $variant->delete();
                    if($old_download_file){
                        if(File::exists(public_path().'/uploads/custom-images/'.$old_download_file)){
                            unlink(public_path().'/uploads/custom-images/'.$old_download_file);
                        }
                    }
                }
            }

            $product_language = ProductLanguage::where('product_id', $id)->delete();
            $product_comment = ProductComment::where('product_id', $id)->delete();
            $product_review = Review::where('product_id', $id)->delete();
            $wishlist = Wishlist::where('product_id', $id)->delete();
    
            $notification = trans('user_validation.Deleted successfully');
            $notification = array('messege'=>$notification,'alert-type'=>'success');
            return redirect()->back()->with($notification);
        }else{
            $notification = trans("You can't delete sold product");
            $notification = array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->back()->with($notification);
        }
    }


}
