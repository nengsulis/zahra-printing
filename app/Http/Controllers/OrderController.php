<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Http\Controllers\Controller;
use App\Models\OrderDetail;
use App\Models\Payment;
use App\Models\Gateway;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Validation\Validator;
use Illuminate\Support\Facades\Storage;

class OrderController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth')->only(['list', 'dikonfirmasi_list', 'dikemas_list', 'dikirim_list', 'diterima_list', 'selesai_list']);
        $this->middleware('auth:api')->only(['store', 'update', 'destroy', 'ubah_status', 'baru', 'dikonfirmasi', 'dikemas', 'dikirim', 'diterima', 'selesai']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $orders = Order::with('member')->get(); // Ambil semua kategori
        return response()->json([
            'data' => $orders
        ]);
    }

    public function list()
    {
        return view('pesanan.index');
    }

    public function dikonfirmasi_list()
    {
        return view('pesanan.dikonfirmasi');
    }

    public function dikemas_list()
    {
        return view('pesanan.dikemas');
    }

    public function dikirim_list()
    {
        return view('pesanan.dikirim');
    }

    public function diterima_list()
    {
        return view('pesanan.diterima');
    }

    public function selesai_list()
    {
        return view('pesanan.selesai');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = \Illuminate\Support\Facades\Validator::make($request->all(), [
            'id_member' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(
                $validator->errors(),
                422
            );
        }

        $input = $request->all();
        $Order = Order::create($input);

        for ($i = 0; $i < count($input['id_produk']); $i++) {
            OrderDetail::create([
                'id_order' => $Order['id'],
                'id_produk' => $input['id_produk'][$i],
                'jumlah' => $input['jumlah'][$i],
                'size' => $input['size'][$i],
                'total' => $input['total'][$i],
            ]);
        }

        return response()->json([
            'data' => $Order
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Order  $Order
     * @return \Illuminate\Http\Response
     */
    public function show(Order $Order)
    {
        return response()->json([
            'data' => $Order
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Order  $Order
     * @return \Illuminate\Http\Response
     */
    public function edit(Order $Order)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Order  $Order
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Order $Order)
    {
        $validator = \Illuminate\Support\Facades\Validator::make($request->all(), [
            'id_member' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(
                $validator->errors(),
                422
            );
        }

        $input = $request->all();
        $Order->update($input);

        OrderDetail::where('id_order', $Order['id'])->delete();

        for ($i = 0; $i < count($input['id_produk']); $i++) {
            OrderDetail::create([
                'id_order' => $Order['id'],
                'id_produk' => $input['id_produk'][$i],
                'jumlah' => $input['jumlah'][$i],
                'size' => $input['size'][$i],
                'total' => $input['total'][$i],
            ]);
        }

        return response()->json([
            'message' => 'success',
            'data' => $Order
        ]);
    }

    public function ubah_status(Request $request, Order $order)
    {
        $order->update([
            'status' => $request->status
        ]);

        return response()->json([
            'message' => 'success',
            'data' => $order
        ]);
    }

    public function update_charge(Request $request, Order $order)
    {
        $order->update([
            'charge' => $request->charge
        ]);

        return response()->json([
            'message' => 'success',
            'data' => $order
        ]);
    }

    public function update_resi(Request $request, Order $order)
    {
        $order->update([
            'no_resi' => $request->no_resi
        ]);

        return response()->json([
            'message' => 'success',
            'data' => $order
        ]);
    }

    public function Baru()
    {
        $orders = Order::with('member')->where('status', 'Baru')->get(); // Ambil semua kategori
        return response()->json([
            'data' => $orders
        ]);
    }

    public function dikonfirmasi()
    {
        $orders = Order::with('member')->where('status', 'Dikonfirmasi')->get(); // Ambil semua kategori
        return response()->json([
            'data' => $orders
        ]);
    }

    public function dikemas()
    {
        $orders = Order::with('member')->where('status', 'Dikemas')->get(); // Ambil semua kategori
        return response()->json([
            'data' => $orders
        ]);
    }

    public function dikirim()
    {
        $orders = Order::with('member')->where('status', 'Dikirim')->get(); // Ambil semua kategori
        return response()->json([
            'data' => $orders
        ]);
    }

    public function diterima()
    {
        $orders = Order::with('member')->where('status', 'Diterima')->get(); // Ambil semua kategori
        return response()->json([
            'data' => $orders
        ]);
    }

    public function selesai()
    {
        $orders = Order::with('member')->where('status', 'Selesai')->get(); // Ambil semua kategori
        return response()->json([
            'data' => $orders
        ]);
    }



    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Order  $Order
     * @return \Illuminate\Http\Response
     */
    public function destroy(Order $Order)
    {
        $id_order = $Order->id;
        $detailorder = OrderDetail::where('id_order', $id_order)->get();
        foreach ($detailorder as $detail) {
            $detail->delete();
        }
        $Order->delete();

        return response()->json([
            'success' => true,
            'message' => 'success'
        ]);
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

        return view('pesanan.detail', compact('orders', 'payment_orders', 'payment_charges', 'gateway_orders', 'gateway_charges', 'order_id', 'orders_id'));
    }

    public function download($filename)
    {
        // Misalnya gambar berada di storage/app/public/images
        $path = storage_path('app/public/uploads/' . $filename);

        // // Periksa apakah file ada
        // if (!file_exists($path)) {
        //     abort(404);
        // }

        return response()->download($path);
    }

    public function uploadDesign(Request $request)
    {
        // Validate the request
        $request->validate([
            'order_detail_id' => 'required|exists:order_details,id',
            'design_image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048', // Validate image
        ]);

        // Find the order detail
        $orderDetail = OrderDetail::find($request->order_detail_id);

        // Delete old image if exists
        if ($orderDetail->file) {
            Storage::disk('public')->delete($orderDetail->file);
        }

        // Store the new image
        $file = $request->file('design_image');
        $filePath = $file->store('uploads', 'public'); // Storing the file

        // Update the order detail with the new image path
        $orderDetail->file = $filePath;
        $orderDetail->save();

        return response()->json(['message' => 'Image uploaded successfully!']);
    }
}
