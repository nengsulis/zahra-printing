<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ReportController;
use App\Http\Controllers\ReviewController;
use App\Http\Controllers\SliderController;
use App\Http\Controllers\SubcategoryController;
use App\Http\Controllers\TentangController;
use App\Http\Controllers\TestimoniController;
use App\Http\Controllers\GatewayController;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Response;

//auth
Route::get('login', [AuthController::class, 'index'])->name('login');
Route::post('login', [AuthController::class, 'login']);
Route::get('logout', [AuthController::class, 'logout']);

Route::get('login_member', [AuthController::class, 'login_member']);
Route::post('login_member', [AuthController::class, 'login_member_action']);
Route::get('logout_member', [AuthController::class, 'logout_member']);

Route::get('register_member', [AuthController::class, 'register_member']);
Route::post('register_member', [AuthController::class, 'register_member_action']);


//kategori
Route::get('/kategori', [CategoryController::class, 'list']);
Route::get('/gateway', [GatewayController::class, 'list']);
Route::get('/subkategori', [SubcategoryController::class, 'list']);
Route::get('/slider', [SliderController::class, 'list']);
Route::get('/produk', [ProductController::class, 'list']);
Route::get('/testimoni', [TestimoniController::class, 'list']);
Route::get('/review', [ReviewController::class, 'list']);
Route::get('/payment', [PaymentController::class, 'list']);

Route::get('/pesanan/baru', [OrderController::class, 'list']);
Route::get('/pesanan/baru/{id}', [OrderController::class, 'detail']);
Route::get('/pesanan/konfirmasi/{id}', [OrderController::class, 'konfirmasi']);
Route::get('/download-image/{filename}', [OrderController::class, 'download'])->name('file.download');
Route::get('download/{filename}', function ($filename) {
    // Check if file exists in app/storage/file folder
    $file_path = storage_path() . $filename;
    if (file_exists($file_path)) {
        // Send Download
        return response()->download($file_path, null, [
            'Content-Disposition' => 'attachment; filename="' . basename($file_path) . '"'
        ]);
    } else {
        // Error
        exit('Requested file does not exist on our server!');
    }
})
    ->where('filename', '[A-Za-z0-9\-\_\.]+');
Route::get('/pesanan/dikonfirmasi', [OrderController::class, 'dikonfirmasi_list']);
Route::get('/pesanan/dikemas', [OrderController::class, 'dikemas_list']);
Route::get('/pesanan/dikirim', [OrderController::class, 'dikirim_list']);
Route::get('/pesanan/diterima', [OrderController::class, 'diterima_list']);
Route::get('/pesanan/selesai', [OrderController::class, 'selesai_list']);
Route::get('/pesanan/selesai', [OrderController::class, 'selesai_list']);
Route::post('/api/pesanan/upload_design', [OrderController::class, 'uploadDesign']);

Route::get('/report', [ReportController::class, 'index']);

Route::get('/tentang', [TentangController::class, 'index']);
Route::post('/tentang/{about}', [TentangController::class, 'update']);

Route::get('/dashboard', [DashboardController::class, 'index']);

//home routes
Route::get('/', [HomeController::class, 'index']);
Route::get('/products/{category}', [HomeController::class, 'products']);
Route::get('/product/{id}', [HomeController::class, 'product']);
Route::get('/cart', [HomeController::class, 'cart']);
Route::get('/checkout', [HomeController::class, 'checkout']);
Route::get('/orders', [HomeController::class, 'orders']);
Route::get('/orders/detail/{order}', [HomeController::class, 'detail']);
Route::get('/orders/charge/{order}', [HomeController::class, 'charge']);
Route::get('/orders/bayar/{order}', [HomeController::class, 'order']);
Route::get('/about', [HomeController::class, 'about']);
Route::get('/contact', [HomeController::class, 'contact']);
Route::get('/faq', [HomeController::class, 'faq']);

Route::post('/add_to_cart', [HomeController::class, 'add_to_cart']);
Route::get('/delete_from_cart/{cart}', [HomeController::class, 'delete_from_cart']);
Route::get('/get_kota/{id}', [HomeController::class, 'get_kota']);
Route::get('/get_ongkir/{destination}/{weight}', [HomeController::class, 'get_ongkir']);
Route::post('/checkout_orders', [HomeController::class, 'checkout_orders']);
Route::post('/payments', [HomeController::class, 'payments']);
Route::post('/bayar', [HomeController::class, 'bayar']);
Route::post('/payment_charge', [HomeController::class, 'payment_charge']);
Route::post('/pesanan_selesai/{order}', [HomeController::class, 'pesanan_selesai']);

