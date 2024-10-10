<?php

namespace App\Http\Controllers;

use App\Models\Payment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;
use Illuminate\Validation\Validator;

class PaymentController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth')->only(['list']);
        $this->middleware('auth:api')->only(['store', 'update', 'destroy']);
    }

    public function list()
    {
        $payments = Payment::with('order')->with('gateway')->get(); // Ambil semua payment
        foreach ($payments as $payment) {
            if (is_null($payment->order)) {
                // Jika category null, tampilkan pesan di log atau lakukan debugging lebih lanjut
                Log::info('Order tidak ditemukan untuk payment ID: ' . $payment->id);
            }
            if (is_null($payment->gateway)) {
                // Jika category null, tampilkan pesan di log atau lakukan debugging lebih lanjut
                Log::info('Order tidak ditemukan untuk payment ID: ' . $payment->id);
            }
        }

        return view('payment.index', compact('payments'));
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $payments = Payment::with('order')->with('gateway')->get(); // Ambil semua order

        foreach ($payments as $payment) {
            if (is_null($payment->order)) {
                // Jika category null, tampilkan pesan di log atau lakukan debugging lebih lanjut
                Log::info('Order tidak ditemukan untuk payment ID: ' . $payment->id);
            }
            if (is_null($payment->gateway)) {
                // Jika category null, tampilkan pesan di log atau lakukan debugging lebih lanjut
                Log::info('Order tidak ditemukan untuk payment ID: ' . $payment->id);
            }
        }

        return response()->json([
            'success' => true,
            'data' => $payments
        ]);
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
            'nama_payment' => 'required',
            'deskripsi' => 'required',
            'gambar' => 'required|image|mimes:jpg,png,jpeg,webp'
        ]);

        if ($validator->fails()) {
            return response()->json(
                $validator->errors(),
                422
            );
        }

        $input = $request->all();

        if ($request->has('gambar')) {
            $gambar = $request->file('gambar');
            $nama_gambar = time() . rand(1, 9) . '.' . $gambar->getClientOriginalExtension();
            $gambar->move('uploads', $nama_gambar);
            $input['gambar'] = $nama_gambar;
        }

        $payment = Payment::create($input);

        return response()->json([
            'success' => true,
            'data' => $payment
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function show(Payment $payment)
    {
        return response()->json([
            'data' => $payment
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function edit(Payment $payment)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Payment $payment)
    {
        $validator = \Illuminate\Support\Facades\Validator::make($request->all(), [
            'tanggal' => 'required',

        ]);

        if ($validator->fails()) {
            return response()->json(
                $validator->errors(),
                422
            );
        }

        $payment->update([
            'status' => request('status')
        ]);

        return response()->json([
            'success' => true,
            'message' => 'success',
            'data' => $payment
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function destroy(Payment $payment)
    {
        File::delete('uploads/' . $payment->bukti_pembayaran);
        $payment->delete();

        return response()->json([
            'success' => true,
            'message' => 'success'
        ]);
    }
}
