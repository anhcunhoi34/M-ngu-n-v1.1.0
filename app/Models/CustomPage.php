<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Session;

class CustomPage extends Model
{
    use HasFactory;

    public function customlangfrontend()
    {
        $front_lang = Session::get('front_lang');
        $language = Language::where('is_default', 'Yes')->first();
        if($front_lang == ''){
            $front_lang = Session::put('front_lang', $language->lang_code);
        }
        return $this->belongsTo(CustomPageLanguage::class, 'id', 'custom_id')->where('lang_code', $front_lang);
    }

    public function customlangadmin()
    {
        $admin_lang = Session::get('admin_lang');
        return $this->belongsTo(CustomPageLanguage::class, 'id', 'custom_id')->where('lang_code', $admin_lang);
    }
}
