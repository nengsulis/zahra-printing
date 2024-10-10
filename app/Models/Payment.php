<?php

namespace App\Models;

use App\Models\Order;
use App\Models\Gateway;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Payment extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function order()
    {
        return $this->belongsTo(Order::class, 'id_order');
    }

    public function gateway()
    {
        return $this->belongsTo(Gateway::class, 'id_gateway', 'id');
    }
}
