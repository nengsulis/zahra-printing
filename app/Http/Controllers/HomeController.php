<?php

namespace App\Http\Controllers;

use DB;

use Auth;
use App\Models\Cart;
use App\Models\About;
use App\Models\Order;
use App\Models\Slider;
use App\Models\Gateway;
use App\Models\Payment;
use App\Models\Product;
use App\Models\Category;
use App\Models\Testimoni;
use App\Models\OrderDetail;
use App\Models\Subcategory;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class HomeController extends Controller
{
    public function index()
    {
        $sliders = Slider::all();
        $categories = Category::all();


        // Ambil subkategori yang memiliki kategori dengan ID 1
        $subcategories = Subcategory::where('id_kategori', 1)->with('products')->get();

        $products = [];
        foreach ($subcategories as $subcategory) {
            // Ambil satu produk dari setiap subkategori
            $product = Product::where('id_subkategori', $subcategory->id)->first(); // Ganti 'products' dengan query
            if ($product) {
                $products[] = $product; // Tambahkan produk ke dalam array
            }
        }

        // Jika ingin membatasi jumlah produk yang ditampilkan, bisa menggunakan array_slice
        $products = array_slice($products, 0, 1); // Ambil 4 produk pertama
        return view('home.index', compact('sliders', 'categories', 'products'));
    }
    public function products($id_subcategory)
    {
        $products = Product::where('id_subkategori', $id_subcategory)->get();

        return view('home.products', compact('products'));
    }

    public function add_to_cart(Request $request)
    {
        // Validasi request yang masuk
        $request->validate([
            'id_member' => 'required|integer',
            'id_produk' => 'required|integer',
            'jumlah' => 'required|integer',
            'ukuran' => 'required|string',
            'total' => 'required|numeric',
            'file_upload' => 'file|mimes:jpeg,png,jpg,gif,cdr' // Validasi file
        ]);

        // Proses upload file jika ada
        $filePath = null;
        if ($request->hasFile('file_upload')) {
            $file = $request->file('file_upload');
            $filePath = $file->store('uploads', 'public'); // Simpan file ke dalam folder public/uploads
        }

        // Jika membutuhkan desain total ditambah 50000
        if ($request->need_desain == 1) {
            $total = $request->total + 60000;
        }
        if ($request->need_desain == 0) {
            $total = $request->total;
        }


        // Simpan data ke database
        Cart::create([
            'id_member' => $request->id_member,
            'id_produk' => $request->id_produk,
            'jumlah' => $request->jumlah,
            'ukuran' => $request->ukuran,
            'is_need_design' => $request->need_desain,
            'note' => $request->note,
            'total' => $total,
            'is_checkout' => $request->is_checkout,
            'file' => $filePath, // Simpan path file jika ada
        ]);
    }

    public function delete_from_cart(Cart $cart)
    {
        // Cek apakah item memiliki file gambar yang tersimpan
        if ($cart->file) {
            // Hapus gambar dari penyimpanan
            Storage::delete('public/' . $cart->file);
        }
        $cart->delete();
        return redirect('/cart');
    }

    public function product($id_product)
    {
        $product = Product::find($id_product);
        $latest_products = Product::orderByDesc('created_at')->offset(0)->limit(10);

        return view('home.product', compact('product', 'latest_products'));
    }
    public function cart()
    {
        if (!Auth::guard('webmember')->user()) {
            return redirect('/login_member');
        }

        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://api.rajaongkir.com/starter/province",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_HTTPHEADER => array(
                "key: 6b5bd12e6a7517e91e81fd09e260ee8a"
            ),
        ));

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) {
            echo "cURL_Error #:" . $err;
        }

        $provinsi = json_decode($response);
        $carts = Cart::where('id_member', Auth::guard('webmember')->user()->id)->where('is_checkout', 0)->get();

        $cart_total = Cart::where('id_member', Auth::guard('webmember')->user()->id)->where('is_checkout', 0)->sum('total');
        $berat_total = Cart::where('id_member', Auth::guard('webmember')->user()->id)
            ->where('is_checkout', 0)
            ->join('products', 'carts.id_produk', '=', 'products.id')
            ->sum(DB::raw('products.berat * carts.jumlah'));

        return view('home.cart', compact('carts', 'provinsi', 'cart_total', 'berat_total'));
    }

    public function get_kota($id)
    {
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://api.rajaongkir.com/starter/city?province=" . $id,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_HTTPHEADER => array(
                "key: 6b5bd12e6a7517e91e81fd09e260ee8a"
            ),
        ));

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) {
            echo "cURL Error #:" . $err;
        } else {
            echo ($response);
        }
    }

    public function get_ongkir($destination, $weight)
    {
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://api.rajaongkir.com/starter/cost",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "POST",
            CURLOPT_POSTFIELDS => "origin=154&destination=" . $destination . "&weight=" . $weight . "&courier=jne",
            CURLOPT_HTTPHEADER => array(
                "content-type: application/x-www-form-urlencoded",
                "key: 6b5bd12e6a7517e91e81fd09e260ee8a"
            ),
        ));

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) {
            echo "cURL Error #:" . $err;
        } else {
            echo $response;
        }
    }

    public function checkout_orders(Request $request)
    {
        // Validasi input
        $request->validate([
            'provinsi' => 'required',
            'kota' => 'required',
            'id_member' => 'required|integer',
            'berat' => 'required|numeric',
            'grand_total' => 'required|numeric',
            'detail_alamat' => 'required|string',
            'id_produk' => 'required|array',
            'jumlah' => 'required|array',
            'total' => 'required|array',
        ]);

        // Ambil Provinsi
        $provinsi = $this->getProvinsi($request->provinsi);
        if (!$provinsi) {
            return response()->json(['error' => 'Provinsi tidak ditemukan'], 404);
        }

        // Ambil Kota
        $kota = $this->getKota($request->provinsi, $request->kota);
        if (!$kota) {
            return response()->json(['error' => 'Kota tidak ditemukan'], 404);
        }

        // Buat Order
        $order = Order::create([
            'id_member' => $request->id_member,
            'invoice' => date('ymds'),
            'berat' => $request->berat,
            'grand_total' => $request->grand_total,
            'provinsi' => $provinsi,
            'kota' => $kota,
            'detail_alamat' => $request->detail_alamat,
            'status' => 'Baru',
        ]);

        // Buat Order Details
        foreach ($request->id_produk as $index => $id_produk) {
            OrderDetail::create([
                'id_order' => $order->id,
                'id_produk' => $id_produk,
                'is_need_design' => $request->is_need_design[$index],
                'file' => $request->file[$index],
                'note' => $request->note[$index],
                'jumlah' => $request->jumlah[$index],
                'size' => $request->size[$index],
                'total' => $request->total[$index],
            ]);
        }

        // Update status cart
        Cart::where('id_member', Auth::guard('webmember')->user()->id)->update([
            'is_checkout' => 1
        ]);

        return response()->json(['success' => 'Order berhasil dibuat'], 201);
    }

    private function getProvinsi($provinsiId)
    {
        $response = $this->callRajaOngkirApi("province");
        $provinsiData = json_decode($response);

        foreach ($provinsiData->rajaongkir->results as $item) {
            if ($item->province_id == $provinsiId) {
                return $item->province;
            }
        }

        return null;
    }

    private function getKota($provinsiId, $kotaId)
    {
        $response = $this->callRajaOngkirApi("city?province=" . $provinsiId);
        $kotaData = json_decode($response);

        foreach ($kotaData->rajaongkir->results as $item) {
            if ($item->city_id == $kotaId) {
                return $item->city_name;
            }
        }

        return null;
    }

    private function callRajaOngkirApi($endpoint)
    {
        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_URL => "https://api.rajaongkir.com/starter/$endpoint",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_HTTPHEADER => [
                "key: 6b5bd12e6a7517e91e81fd09e260ee8a"
            ],
        ]);

        $response = curl_exec($curl);
        if (curl_errno($curl)) {
            Log::error("cURL Error: " . curl_error($curl));
            return response()->json(['error' => 'Gagal mengambil data'], 500);
        }

        curl_close($curl);
        return $response;
    }

    public function checkout(Request $request)
    {
        $about = About::first();
        $gateways = Gateway::all();
        $orders = Order::where('id_member', Auth::guard('webmember')->user()->id)->latest()->first();
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://api.rajaongkir.com/starter/province",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_HTTPHEADER => array(
                "key: 6b5bd12e6a7517e91e81fd09e260ee8a"
            ),
        ));

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) {
            echo "cURL_Error #:" . $err;
        }

        $provinsi = json_decode($response);

        return view('home.checkout', compact('about', 'orders', 'provinsi', 'gateways'));
    }

    public function payments(Request $request)
    {
        // Validasi request yang masuk
        $request->validate([
            'bukti_pembayaran' => 'file|mimes:jpeg,png,jpg,gif' // Validasi file
        ]);

        // Proses upload file jika ada
        $filePath = null;
        if ($request->hasFile('bukti_pembayaran')) {
            $file = $request->file('bukti_pembayaran');
            $filePath = $file->store('bukti_pembayaran', 'public'); // Simpan file ke dalam folder public/uploads
        }


        Payment::create([
            'id_order' => $request->id_order,
            'id_member' => Auth::guard('webmember')->user()->id,
            'id_gateway' => $request->id_gateway,
            'jumlah' => $request->jumlah,
            'bukti_pembayaran' => $filePath, // Simpan path file jika ada   
            'status' => 'MENUNGGU',
            'kategori' => 'order',
        ]);

        return redirect('/orders');
    }

    public function payment_charge(Request $request)
    {
        // Validasi request yang masuk
        $request->validate([
            'bukti_pembayaran' => 'file|mimes:jpeg,png,jpg,gif,pdf' // Validasi file
        ]);

        // Proses upload file jika ada
        $filePath = null;
        if ($request->hasFile('bukti_pembayaran')) {
            $file = $request->file('bukti_pembayaran');
            $filePath = $file->store('bukti_pembayaran', 'public'); // Simpan file ke dalam folder public/uploads
        }


        Payment::create([
            'id_order' => $request->id_order,
            'id_member' => Auth::guard('webmember')->user()->id,
            'id_gateway' => $request->id_gateway,
            'jumlah' => $request->jumlah,
            'bukti_pembayaran' => $filePath, // Simpan path file jika ada   
            'status' => 'MENUNGGU',
            'kategori' => 'charge',
        ]);

        return redirect('/orders');
    }

    public function bayar(Request $request)
    {
        // Validasi request yang masuk
        $request->validate([
            'bukti_pembayaran' => 'file|mimes:jpeg,png,jpg,gif,pdf' // Validasi file
        ]);

        // Proses upload file jika ada
        $filePath = null;
        if ($request->hasFile('bukti_pembayaran')) {
            $file = $request->file('bukti_pembayaran');
            $filePath = $file->store('bukti_pembayaran', 'public'); // Simpan file ke dalam folder public/uploads
        }


        Payment::create([
            'id_order' => $request->id_order,
            'id_member' => Auth::guard('webmember')->user()->id,
            'id_gateway' => $request->id_gateway,
            'jumlah' => $request->jumlah,
            'bukti_pembayaran' => $filePath, // Simpan path file jika ada   
            'status' => 'MENUNGGU',
            'kategori' => 'order',
        ]);

        return redirect('/orders');
    }

    public function orders()
    {
        $memberId = Auth::guard('webmember')->user()->id;

        // Ganti get() dengan paginate() untuk orders dan payments
        $orders = Order::where('id_member', $memberId)->paginate(10); // Misalnya 10 pesanan per halaman
        $payments = Payment::where('id_member', $memberId)->paginate(10); // Misalnya 10 pembayaran per halaman

        return view('home.orders', compact('orders', 'payments'));
    }

    public function detail($id)
    {


        // $orders =
        //     Order::where('orders.id', $id)->join('payments', 'payments.id_order', '=', 'orders.id')->join('gateways', 'gateways.id', '=', 'payments.id_gateway')->join('order_details', 'order_details.id_order', '=', 'orders.id')->get();
        $orders = Order::where('id', $id)->get();
        $orders_id = Order::where('id', $id)->first();
        $order_id = $id;
        $payment_orders = Payment::where('id_order', $id)->where('kategori', 'order')->first();
        $payment_charges = Payment::where('id_order', $id)->where('kategori', 'charge')->first();

        if ($payment_orders != null) {
            $gateway_orders = Gateway::where('id', $payment_orders->id_gateway)->first();
        } else {
            $gateway_orders = null;
        }

        if ($payment_charges != null) {
            $gateway_charges = Gateway::where('id', $payment_charges->id_gateway)->first();
        } else {
            $gateway_charges = null;
        }
        return view('home.detail', compact('orders', 'payment_orders', 'payment_charges', 'gateway_orders', 'gateway_charges', 'order_id', 'orders_id'));
    }

    public function charge($id)
    {
        $about = About::first();
        $gateways = Gateway::all();
        $orders = Order::where('id', $id)->first();
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://api.rajaongkir.com/starter/province",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_HTTPHEADER => array(
                "key: 6b5bd12e6a7517e91e81fd09e260ee8a"
            ),
        ));

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) {
            echo "cURL_Error #:" . $err;
        }

        $provinsi = json_decode($response);

        return view('home.charge', compact('about', 'orders', 'provinsi', 'gateways'));
    }

    public function order($id)
    {
        $about = About::first();
        $gateways = Gateway::all();
        $orders = Order::where('id', $id)->first();
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://api.rajaongkir.com/starter/province",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_HTTPHEADER => array(
                "key: 6b5bd12e6a7517e91e81fd09e260ee8a"
            ),
        ));

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) {
            echo "cURL_Error #:" . $err;
        }

        $provinsi = json_decode($response);

        return view('home.bayar', compact('about', 'orders', 'provinsi', 'gateways'));
    }

    public function pesanan_selesai(Order $order)
    {
        $order->status = 'Selesai';
        $order->save();

        return redirect('/orders');
    }

    public function about()
    {
        $about = About::first();

        return view('home.about', compact('about'));
    }
    public function contact()
    {
        $about = About::first();

        return view('home.contact', compact('about'));
    }
    public function faq()
    {
        return view('home.faq');
    }
}
