<?php

namespace App\Http\Controllers\User;

use Auth;
use Session;
use App\Models\Product;
use App\Models\Language;
use App\Models\Wishlist;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class WishlistController extends Controller
{

    public function translator(){
        $front_lang = Session::get('front_lang');
        $language = Language::where('is_default', 'Yes')->first();
        if($front_lang == ''){
            $front_lang = Session::put('front_lang', $language->lang_code);
        }
        config(['app.locale' => $front_lang]);
    }

    public function add_wishlist(Request $request, $product_id){
        $this->translator();
        if(Auth::guard('web')->check()){
            $product=Product::where('id', $product_id)->first();
            $user_id=Auth::guard('web')->user()->id;
            $author_id=$product->author_id;
              $exist=Wishlist::where('product_id', $product_id)->where('user_id', $user_id)->first();
              if(!$exist){
                 $insert= new Wishlist();
                 $insert->user_id=$user_id;
                 $insert->product_id=$product_id;
                 $insert->author_id=$author_id;
                 $insert->save();
                 $message = trans('user_validation.Successfully added your wishlist');
                 return response()->json(['success' => $message]);
              }else{
                $message = trans('user_validation.This product allready exist');
                return response()->json(['error' => $message]);
              } 
            }else{
                $message = trans('user_validation.At first login your account');
                return response()->json(['error' => $message]);
            }
    }
}
