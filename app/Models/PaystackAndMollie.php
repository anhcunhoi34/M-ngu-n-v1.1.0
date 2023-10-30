<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PaystackAndMollie extends Model
{
    use HasFactory;

    public function molliecurrency()
    {
        return $this->belongsTo(MultiCurrency::class, 'mollie_currency_id', 'id');
    }

    public function paystackcurrency()
    {
        return $this->belongsTo(MultiCurrency::class, 'paystack_currency_id', 'id');
    }
}
