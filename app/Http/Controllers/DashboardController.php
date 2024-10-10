<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Member;
use App\Models\OrderDetail;
use App\Models\Product;
use App\Models\Subcategory;
use App\Models\User;

class DashboardController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        // Orders
        $orders_baru = Order::where('status', 'Baru')->count();
        $orders_dikonfirmasi = Order::where('status', 'Dikonfirmasi')->count();
        $orders_dikemas = Order::where('status', 'Dikemas')->count();
        $orders_dikirim = Order::where('status', 'Dikirim')->count();
        $orders_diterima = Order::where('status', 'Diterima')->count();
        $orders_selesai = Order::where('status', 'Selesai')->count();

        // Desain
        $need_desain = OrderDetail::where('is_need_design', 1)->count();
        $no_desain = OrderDetail::where('is_need_design', 0)->count();

        // Produk
        $kategori = Category::count();
        $sub_kategori = Subcategory::count();
        $produk = Product::count();

        // User
        $admin = User::count();
        $member = Member::count();


        return view('dashboard', compact('orders_baru', 'orders_dikonfirmasi', 'orders_dikemas', 'orders_dikirim', 'orders_diterima', 'orders_selesai', 'need_desain', 'no_desain', 'kategori', 'sub_kategori', 'produk', 'admin', 'member'));
    }
}
