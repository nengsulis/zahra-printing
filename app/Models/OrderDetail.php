<?php

namespace App\Models;

use App\Models\Order;
use App\Models\Product;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class OrderDetail extends Model
{
    use HasFactory;
    protected $guarded = [];


    public function order()
    {
        return $this->belongsTo(Order::class, 'id_order', 'id');
    }
    public function product()
    {
        return $this->belongsTo(Product::class, 'id_produk', 'id');
    }

    public function scopeFilterDate($query, $dari, $sampai)
    {
        return $query->whereBetween('order_details.created_at', [$dari, $sampai]);
    }
}
