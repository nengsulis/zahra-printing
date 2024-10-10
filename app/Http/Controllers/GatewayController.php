<?php

namespace App\Http\Controllers;

use App\Models\Payment;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Gateway;
use Illuminate\Support\Facades\File;
use Illuminate\Validation\Validator;

class GatewayController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth')->only(['list']);
        $this->middleware('auth:api')->only(['store', 'update', 'destroy']);
    }

    public function list()
    {
        return view('gateway.index');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $gateways = Gateway::all(); // Ambil semua gateway
        return response()->json([
            'data' => $gateways
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
            'nama_bank' => 'required',
            'atas_nama' => 'required',
            'rekening' => 'required',
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
            $gambar->move('gateways', $nama_gambar);
            $input['gambar'] = $nama_gambar;
        }

        $gateways = Gateway::create($input);

        return response()->json([
            'success' => true,
            'data' => $gateways
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Gateway  $gateway
     * @return \Illuminate\Http\Response
     */
    public function show(Gateway $gateway)
    {
        return response()->json([
            'data' => $gateway
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Gateway  $gateway
     * @return \Illuminate\Http\Response
     */
    public function edit(Gateway $gateway)
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
    public function update(Request $request, Gateway $gateway)
    {
        $validator = \Illuminate\Support\Facades\Validator::make($request->all(), [
            'nama_bank' => 'required',
            'atas_nama' => 'required',
            'rekening' => 'required',

        ]);

        if ($validator->fails()) {
            return response()->json(
                $validator->errors(),
                422
            );
        }

        $input = $request->all();

        if ($request->has('gambar')) {
            File::delete('gateways/' . $gateway->gambar);
            $gambar = $request->file('gambar');
            $nama_gambar = time() . rand(1, 9) . '.' . $gambar->getClientOriginalExtension();
            $gambar->move('gateways', $nama_gambar);
            $input['gambar'] = $nama_gambar;
        } else {
            unset($input['$gambar']);
        }

        $gateway->update($input);

        return response()->json([
            'success' => true,
            'message' => 'success',
            'data' => $gateway
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Gateway  $payment
     * @return \Illuminate\Http\Response
     */
    public function destroy(Gateway $gateway)
    {
        File::delete('gateway/' . $gateway->gambar);
        $gateway->delete();

        return response()->json([
            'success' => true,
            'message' => 'success'
        ]);
    }
}
