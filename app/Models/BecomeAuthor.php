<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Session;

class BecomeAuthor extends Model
{
    use HasFactory;

    public function becomelangfrontend()
    {
        $front_lang = Session::get('front_lang');
        $language = Language::where('is_default', 'Yes')->first();
        if($front_lang == ''){
            $front_lang = Session::put('front_lang', $language->lang_code);
        }
        return $this->belongsTo(BecomeAuthorLanguage::class, 'id', 'become_id')->where('lang_code', $front_lang);
    }

    public function becomelangadmin()
    {
        $admin_lang = Session::get('admin_lang');
        return $this->belongsTo(BecomeAuthorLanguage::class, 'id', 'become_id')->where('lang_code', $admin_lang);
    }
}
