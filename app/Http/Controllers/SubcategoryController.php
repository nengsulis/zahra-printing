<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Subcategory;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Validation\Validator;

class SubcategoryController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth')->only(['list']);
        $this->middleware('auth:api')->only(['store', 'update','destroy']);
    }
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $subcategories = Subcategory::with('category')->get(); // Ambil semua kategori

        foreach ($subcategories as $subcategory) {
            if (is_null($subcategory->category)) {
                // Jika category null, tampilkan pesan di log atau lakukan debugging lebih lanjut
                \Log::info('Category tidak ditemukan untuk subcategory ID: ' . $subcategory->id);
            }
        }

        return response()->json([
            'success' => true,
            'data' => $subcategories
        ]);
    }

    public function list() 
    {
        $categories = Category::all();

        return view('subkategori.index', compact('categories'));
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
            'id_kategori' => 'required',
            'nama_subkategori' => 'required',
            'deskripsi' => 'required',
            'gambar'=> 'required|image|mimes:jpg,png,jpeg,webp'
        ]);

        if($validator->fails()) {
            return response()->json(
                $validator->errors(), 
                422
            );
        }

        $input = $request->all();

        if ($request->has('gambar')) {
            $gambar = $request->file('gambar');
            $nama_gambar = time() . rand(1,9) . '.' . $gambar->getClientOriginalExtension();
            $gambar->move('uploads', $nama_gambar);
             $input['gambar'] = $nama_gambar;
        }
        
        $Subcategory = Subcategory::create($input);

        return response()->json([
            'success' => true,
            'data' => $Subcategory
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Subcategory  $Subcategory
     * @return \Illuminate\Http\Response
     */
    public function show(Subcategory $Subcategory)
    {
        return response()->json([
            'data' => $Subcategory
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Subcategory  $Subcategory
     * @return \Illuminate\Http\Response
     */
    public function edit(Subcategory $Subcategory)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Subcategory  $Subcategory
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Subcategory $Subcategory)
    {
        $validator = \Illuminate\Support\Facades\Validator::make($request->all(), [
            'id_kategori' => 'required',
            'nama_subkategori' => 'required',
            'deskripsi' => 'required',

        ]);

        if($validator->fails()) {
            return response()->json(
                $validator->errors(), 
                422
            );
        }

        $input = $request->all();

        if ($request->has('gambar')) {
            File::delete('uploads/' . $Subcategory->gambar);
            $gambar = $request->file('gambar');
            $nama_gambar = time() . rand(1,9) . '.' . $gambar->getClientOriginalExtension();
            $gambar->move('uploads', $nama_gambar);
            $input['gambar'] = $nama_gambar;
        } else{
            unset($input['$gambar']);
        }

        $Subcategory->update($input);

        return response()->json([
            'success' => true,
            'message' => 'success',
            'data' => $Subcategory
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Subcategory  $Subcategory
     * @return \Illuminate\Http\Response
     */
    public function destroy(Subcategory $Subcategory)
    {
        File::delete('uploads/' . $Subcategory->gambar);
        $Subcategory->delete();

        return response()->json([
            'success' => true,
            'message' => 'succes'
        ]);
    }
}
