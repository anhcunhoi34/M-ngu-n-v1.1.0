<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Session;

class SectionContent extends Model
{
    use HasFactory;

    public function contentlangfrontend()
    {
        $front_lang = Session::get('front_lang');
        $language = Language::where('is_default', 'Yes')->first();
        if($front_lang == ''){
            $front_lang = Session::put('front_lang', $language->lang_code);
        }
        return $this->belongsTo(SectionContentLanguage::class, 'id', 'content_id')->where('lang_code', $front_lang);
    }

    public function contentlangadmin()
    {
        $admin_lang = Session::get('admin_lang');
        return $this->belongsTo(SectionContentLanguage::class, 'id', 'content_id')->where('lang_code', $admin_lang);
    }
}
