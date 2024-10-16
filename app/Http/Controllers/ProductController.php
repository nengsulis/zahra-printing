<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use App\Http\Controllers\Controller;
use App\Models\Subcategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;

class ProductController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth')->only(['list']);
        $this->middleware('auth:api')->only(['store', 'update', 'destroy']);
    }

    public function list()
    {
        $categories = Category::all();
        $subcategories = Subcategory::all();

        return view('product.index', compact('categories', 'subcategories'));
    }

    public function index()
    {
        $products = Product::with('category', 'subcategory')->get();
        return response()->json(['data' => $products]);

    }

    public function store(Request $request)
    {
        $request->validate([
            'id_kategori' => 'required',
            'id_subkategori' => 'required',
            'nama_produk' => 'required',
            'harga' => 'required',
            'berat' => 'required',
            'tags' => 'required',
            'sku' => 'required',
            'ukuran' => 'required',
            'deskripsi' => 'required',
            'gambar' => 'required|image|mimes:jpg,png,jpeg,webp'
        ]);

        $input = $request->all();

        if ($request->hasFile('gambar')) {
            $gambar = $request->file('gambar');
            $nama_gambar = time() . rand(1, 9) . '.' . $gambar->getClientOriginalExtension();
            $gambar->move('uploads', $nama_gambar);
            $input['gambar'] = $nama_gambar;
        }

        $product = Product::create($input);

        return response()->json(['success' => true, 'data' => $product]);
    }

    public function show(Product $product)
    {
        return response()->json(['success' => true, 'data' => $product]);
    }

    public function update(Request $request, Product $product)
    {
        $request->validate([
            'id_kategori' => 'required',
            'id_subkategori' => 'required',
            'nama_produk' => 'required',
            'harga' => 'required',
            'berat' => 'required',
            'tags' => 'required',
            'sku' => 'required',
            'ukuran' => 'required',
            'deskripsi' => 'required',
            'gambar' => 'nullable|image|mimes:jpg,png,jpeg,webp'
        ]);

        $input = $request->all();

        if ($request->hasFile('gambar')) {
            // Hapus gambar lama
            File::delete('uploads/' . $product->gambar);

            // Simpan gambar baru
            $gambar = $request->file('gambar');
            $nama_gambar = time() . rand(1, 9) . '.' . $gambar->getClientOriginalExtension();
            $gambar->move('uploads', $nama_gambar);
            $input['gambar'] = $nama_gambar;
        }

        $product->update($input);

        return response()->json(['success' => true, 'message' => 'success', 'data' => $product]);
    }

    public function destroy(Product $product)
    {
        File::delete('uploads/' . $product->gambar);
        $product->delete();

        return response()->json(['success' => true, 'message' => 'success']);
    }
}
