<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Product;
use Illuminate\Support\Str;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for ($i=1; $i<20 ; $i++) { 
            Product::create([
                'id_kategori' => rand(1, 3),
                'id_subkategori' => rand(1, 8),
                'nama_produk' => 'lorem ipsum dolor sit amet',
                'gambar' => 'shop_image_' . $i .'.jpg',
                'deskripsi' => 'lorem ipsum dolor sit amet',
                'harga' => rand(1000, 100000),
                'tags' => 'lorem,ipsum,dolor,sit,amet',
                'sku' => Str::random(8),
                'ukuran' => '(50m x 30m), (30m x 50m)', 
            ]);
    
        }
    }
}
