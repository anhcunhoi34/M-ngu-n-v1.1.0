<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Session;

class ProductItem extends Model
{
    use HasFactory;

    public function productitemlangadmin()
    {
        $admin_lang = Session::get('admin_lang');
        return $this->belongsTo(ProductItemLanguage::class, 'id', 'item_id')->where('lang_code', $admin_lang);
    }
}
