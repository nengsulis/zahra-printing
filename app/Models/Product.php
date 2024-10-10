<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Cart;
use App\Models\OrderDetail;

class Product extends Model
{
    use HasFactory;
    protected $guarded = [];

    // Product.php
    public function category()
    {
        return $this->belongsTo(Category::class, 'id_kategori', 'id');
    }

    public function subcategory()
    {
        return $this->belongsTo(Subcategory::class, 'id_subkategori', 'id');
    }

    public function cart()
    {
        return $this->hasMany(Cart::class);
    }

    public function order_detail()
    {
        return $this->hasMany(OrderDetail::class);
    }
}
