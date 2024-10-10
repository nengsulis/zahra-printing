@extends('layout.home')

@section('title', 'Product')

@section('content')
    <!-- Single Product -->
    <section class="section-wrap pb-40 single-product">
        <div class="container-fluid semi-fluid">
            <div class="row">

                <div class="col-md-6 col-xs-12 product-slider mb-60">

                    <div class="flickity flickity-slider-wrap mfp-hover" id="gallery-main">

                        <div class="gallery-cell">
                            <a href="/uploads/{{ $product->gambar }}" class="lightbox-img">
                                <img src="/uploads/{{ $product->gambar }}" alt="" />
                                <i class="ui-zoom zoom-icon"></i>
                            </a>
                        </div>
                        <div class="gallery-cell">
                            <a href="/uploads/{{ $product->gambar }}" class="lightbox-img">
                                <img src="/uploads/{{ $product->gambar }}" alt="" />
                                <i class="ui-zoom zoom-icon"></i>
                            </a>
                        </div>
                        <div class="gallery-cell">
                            <a href="/uploads/{{ $product->gambar }}" class="lightbox-img">
                                <img src="/uploads/{{ $product->gambar }}" alt="" />
                                <i class="ui-zoom zoom-icon"></i>
                            </a>
                        </div>
                        <div class="gallery-cell">
                            <a href="/uploads/{{ $product->gambar }}" class="lightbox-img">
                                <img src="/uploads/{{ $product->gambar }}" alt="" />
                                <i class="ui-zoom zoom-icon"></i>
                            </a>
                        </div>
                        <div class="gallery-cell">
                            <a href="/uploads/{{ $product->gambar }}" class="lightbox-img">
                                <img src="/uploads/{{ $product->gambar }}" alt="" />
                                <i class="ui-zoom zoom-icon"></i>
                            </a>
                        </div>
                    </div> <!-- end gallery main -->

                    <div class="gallery-thumbs">
                        <div class="gallery-cell">
                            <img src="/uploads/{{ $product->gambar }}" alt="" />
                        </div>
                        <div class="gallery-cell">
                            <img src="/uploads/{{ $product->gambar }}" alt="" />
                        </div>
                        <div class="gallery-cell">
                            <img src="/uploads/{{ $product->gambar }}" alt="" />
                        </div>
                        <div class="gallery-cell">
                            <img src="/uploads/{{ $product->gambar }}" alt="" />
                        </div>
                        <div class="gallery-cell">
                            <img src="/uploads/{{ $product->gambar }}" alt="" />
                        </div>
                    </div> <!-- end gallery thumbs -->

                </div> <!-- end col img slider -->

                <div class="col-md-6 col-xs-12 product-description-wrap">
                    <ol class="breadcrumb">
                        <li>
                            <a href="/">Home</a>
                        </li>
                        <li>
                            <a
                                href="/products/{{ $product->id_subkategori }}">{{ $product->subcategory->nama_subkategori }}</a>
                        </li>
                        <li class="active">
                            Catalog
                        </li>
                    </ol>
                    <h1 class="product-title">{{ $product->nama_produk }}</h1>
                    <span class="price">
                        <ins>
                            <span class="amount">Rp. {{ number_format($product->harga) }}</span>
                        </ins>
                    </span>
                    <p class="short-description">{{ $product->deskripsi }}</p>

                    <div class="size-options clearfix">
                        <span>Ukuran : </span>
                        @php
                            $ukurans = explode(',', $product->ukuran);
                        @endphp

                        @foreach ($ukurans as $ukuran)
                            <input type="radio" name="ukuran" id="{{ $ukuran }}" value="{{ $ukuran }}"
                                class="ukuran">
                            <label for="{{ $ukuran }}" style="margin-right: 20px">{{ $ukuran }}</label>
                        @endforeach
                    </div>
                    <div class="upload-image mb-4">
                        <label for="file_upload" class="form-label">Upload Gambar Pesanan:</label>
                        <input type="file" id="file_upload" name="file_upload" class="form-control mb-2" />

                        <label for="input" class="form-label">Catatan (Opsional):</label>
                        <textarea name="note" class="form-control note mb-2" id="input" cols="30" rows="10"></textarea>


                        <span class="form-text mb-2">
                            Jika anda tidak mempunyai desain, kami akan membantu anda untuk membantunya!
                        </span>

                        <div class="form-check mb-3">
                            <input class="form-check-input" name="need" type="checkbox" value="0" id="need">
                            <label class="form-check-label" for="need">
                                Saya Butuh Desain (Jasa Desain Rp.50.000)
                            </label>
                        </div>

                        <input type="hidden" class="need_desain" name="need_desain" value="0" id="need_desain">
                    </div>


                    <div class="product-actions">
                        <span>Qty:</span>

                        <div class="quantity buttons_added">
                            <input type="number" step="1" min="0" value="1" title="Qty"
                                class="input-text jumlah qty text" />
                            <div class="quantity-adjust">
                                <a href="#" class="plus">
                                    <i class="fa fa-angle-up"></i>
                                </a>
                                <a href="#" class="minus">
                                    <i class="fa fa-angle-down"></i>
                                </a>
                            </div>
                        </div>

                        <br>

                        <a href="#" class="btn btn-dark btn-lg add-to-cart"><span>Add to Cart</span></a>

                        <a href="#" class="product-add-to-wishlist"><i class="fa fa-heart"></i></a>
                    </div>



                    <div class="product_meta">
                        <span class="sku">SKU: <a href="#">{{ $product->sku }}</a></span>
                        <span class="brand_as">Kategori: <a
                                href="#">{{ $product->category->nama_kategori }}</a></span>
                        <span class="posted_in">Tags: <a href="#">{{ $product->tags }}</a></span>
                    </div>

                    <!-- Accordion -->
                    <div class="panel-group accordion mb-50" id="accordion">
                        <div class="panel">
                            <div class="panel-heading">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                                    class="minus">Deskripsi<span>&nbsp;</span>
                                </a>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    {{ $product->deskripsi }}
                                </div>
                            </div>
                        </div>

                        <div class="panel">
                            <div class="panel-heading">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"
                                    class="plus">Informasi<span>&nbsp;</span>
                                </a>
                            </div>
                            <div id="collapseTwo" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <table class="table shop_attributes">
                                        <tbody>
                                            <tr>
                                                <th>Size:</th>
                                                <td>EU 41 (US 8), EU 42 (US 9), EU 43 (US 10), EU 45 (US 12)</td>
                                            </tr>
                                            <tr>
                                                <th>Colors:</th>
                                                <td>Violet, Black, Blue</td>
                                            </tr>
                                            <tr>
                                                <th>Fabric:</th>
                                                <td>Cotton (100%)</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="socials-share clearfix">
                        <span>Share:</span>
                        <div class="social-icons nobase">
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-google"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                        </div>
                    </div>
                </div> <!-- end col product description -->
            </div> <!-- end row -->

        </div> <!-- end container -->
    </section> <!-- end single product -->
@endsection


@push('js')
    <script>
        var checkbox = document.getElementById("need");
        var hiddenAgreeValue = document.getElementById("need_desain");

        // Update nilai hidden input sesuai dengan checkbox
        checkbox.addEventListener("change", function() {
            hiddenAgreeValue.value = checkbox.checked ? "1" : "0";
        });


        $(function() {
            $('.add-to-cart').click(function(e) {
                e.preventDefault(); // Mencegah reload halaman

                let id_member = {{ Auth::guard('webmember')->user()->id }};
                let id_produk = {{ $product->id }};
                let jumlah = $('.jumlah').val();
                let ukuran = $('.ukuran').val();
                let need_desain = $('.need_desain').val();
                let note = $('.note').val();
                let total = {{ $product->harga }} * jumlah;
                let is_checkout = 0;

                // Ambil file dari input
                let file_data = $('#file_upload').prop('files')[0];

                // Buat FormData untuk mengirim data
                let formData = new FormData();
                formData.append('id_member', id_member);
                formData.append('id_produk', id_produk);
                formData.append('jumlah', jumlah);
                formData.append('ukuran', ukuran);
                formData.append('need_desain', need_desain);
                formData.append('note', note);
                formData.append('total', total);
                formData.append('is_checkout', is_checkout);
                if (file_data) {
                    formData.append('file_upload', file_data);
                }

                // AJAX request
                $.ajax({
                    url: '/add_to_cart',
                    method: 'POST',
                    headers: {
                        'X-CSRF-TOKEN': "{{ csrf_token() }}",
                    },
                    data: formData,
                    processData: false, // Mencegah pemrosesan data
                    contentType: false, // Konten dikirim dalam bentuk multipart/form-data
                    success: function(data) {
                        window.location.href = '/cart';
                    }
                });
            });
        });
    </script>
@endpush
