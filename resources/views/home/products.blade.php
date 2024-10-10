@extends('layout.home')

@section('title', 'List Products')

@section('content')
    <!-- Catalogue -->
    <section class="section-wrap pt-80 pb-40 catalogue">
        <div class="container relative">

            <!-- Filter -->
            <div class="shop-filter">
                <div class="view-mode hidden-xs">
                    <span>Tampilkan:</span>
                    <a class="grid grid-active" id="grid"></a>
                    <a class="list" id="list"></a>
                </div>
                <div class="filter-show hidden-xs">
                    <span>Show:</span>
                    <a href="#" class="active">12</a>
                    <a href="#">24</a>
                    <a href="#">semua</a>
                </div>
                <form class="ecommerce-ordering">
                    <select>
                        <option value="default-sorting">Urutan Standar</option>
                        <option value="price-low-to-high">Harga: tinggi ke randah</option>
                        <option value="price-high-to-low">Harga: rendah ke tinggi</option>
                        <option value="by-popularity">By Trend</option>
                        <option value="date">By terbaru</option>
                        <option value="rating">By penilaian</option>
                    </select>
                </form>
            </div>

            <div class="row">
                <div class="col-md-12 catalogue-col right mb-50">
                    <div class="shop-catalogue grid-view">

                        <div class="row items-grid">

                            @foreach ($products as $product)
                                <div class="col-md-4 col-xs-6 product product-grid">
                                    <div class="product-item clearfix">
                                        <div class="product-img hover-trigger">
                                            <a href="/product/{{ $product->id }}">
                                                <img src="/uploads/{{ $product->gambar }}" alt="">
                                                <img src="/uploads/{{ $product->gambar }}" alt="" class="back-img">
                                            </a>
                                            <div class="hover-2">
                                                <div class="product-actions">
                                                    <a href="#" class="product-add-to-wishlist">
                                                        <i class="fa fa-heart"></i>
                                                    </a>
                                                </div>
                                            </div>
                                            <a href="/product/{{ $product->id }}" class="product-quickview">Detail</a>
                                        </div>

                                        <div class="product-details">
                                            <h3 class="product-title">
                                                <a href="/product/{{ $product->id }}">{{ $product->nama_produk }}</a>
                                            </h3>
                                            <span class="category">
                                                <a
                                                    href="/product/{{ $product->id_subkategori }}">{{ $product->subcategory->nama_subkategori }}</a>
                                            </span>
                                        </div>
                                        @php
                                            $ukurans = explode(',', $product->ukuran);
                                            $lebarUkuran = [];

                                            foreach ($ukurans as $ukuran) {
                                                $ukuranParts = explode('x', trim($ukuran));
                                                if (count($ukuranParts) > 1) {
                                                    $lebarUkuran[] = trim($ukuranParts[1]);
                                                }
                                            }

                                            $lebarPertama = isset($lebarUkuran[0]) ? $lebarUkuran[0] : '';
                                        @endphp

                                        <span class="ukuran" style="width: 100%; display: block">
                                            <ins style="float: right;">
                                                <span class="amount">x {{ $lebarPertama }}</span>
                                            </ins>
                                        </span>

                                    </div>
                                </div> <!-- end product -->
                            @endforeach
                        </div> <!-- end row -->
                    </div> <!-- end grid mode -->

                    <!-- Pagination -->
                    <div class="pagination-wrap clearfix">
                        <p class="result-count">Menampilkan: 12 dari 80 hasil</p>
                        <nav class="pagination right clearfix">
                            <a href="#"><i class="fa fa-angle-left"></i></a>
                            <span class="page-numbers current">1</span>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#">4</a>
                            <a href="#"><i class="fa fa-angle-right"></i></a>
                        </nav>
                    </div>

                </div> <!-- end col -->

            </div> <!-- end row -->
        </div> <!-- end container -->
    </section> <!-- end catalog -->
@endsection
