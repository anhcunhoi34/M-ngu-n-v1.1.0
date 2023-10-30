<?php

namespace App\Http\Controllers\User;

use Auth;
use Session;
use App\Rules\Captcha;
use App\Models\Language;
use App\Helpers\MailHelper;
use Illuminate\Http\Request;
use App\Models\EmailTemplate;
use App\Mail\ContactWithAuthor;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;

class ContactWithAuthorController extends Controller
{
    public function translator(){
        $front_lang = Session::get('front_lang');
        $language = Language::where('is_default', 'Yes')->first();
        if($front_lang == ''){
            $front_lang = Session::put('front_lang', $language->lang_code);
        }
        config(['app.locale' => $front_lang]);
    }

    public function contactWithAuthor(Request $request){

        $this->translator();

        if(Auth::guard('web')->check()){
            $rules = [
                'message'=>'required',
                'g-recaptcha-response'=>new Captcha()
            ];
            $customMessages = [
                'message.required' => trans('user_validation.Message is required'),
            ];
            $this->validate($request, $rules,$customMessages);

            $user=Auth::guard('web')->user();
            $user_email=$user->email;
            $user_message=$request->message;
            $template=EmailTemplate::where('id',12)->first();
            $subject=$template->subject;
            $message=$template->description;
            $message = str_replace('{{message}}',$user_message,$message);

            MailHelper::setMailConfig();
            Mail::to($request->email)->send(new ContactWithAuthor($subject,$message,$user_email));

            $notification = trans('user_validation.Message submit successfully');
            return response()->json(['status' => 1, 'message' => $notification]);
       }else{
            $notification = trans('user_validation.Please login your account');
            return response()->json(['status' => 0, 'message' => $notification]);
       }
    }
}
