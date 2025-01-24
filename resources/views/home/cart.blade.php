@extends('layout.home')

@section('title', 'Cart')

@section('content')

    <!-- Cart -->
    <section class="section-wrap shopping-cart">
        <div class="container relative">
            <form class="form-cart">
                <input type="hidden" name="id_member" value="{{ Auth::guard('webmember')->user()->id }}">
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-wrap mb-30">
                            <table class="shop_table cart table">
                                <thead>
                                    <tr>
                                        <th class="product-name" colspan="2">Product</th>
                                        <th class="product-price">Price</th>
                                        <th class="product-quantity">Quantity</th>
                                        <th class="product-subtotal" colspan="2">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($carts as $cart)
                                        <input type="hidden" name="id_produk[]" value="{{ $cart->product->id }}">
                                        <input type="hidden" name="is_need_design[]" value="{{ $cart->is_need_design }}">
                                        <input type="hidden" name="file[]" value="{{ $cart->file }}">
                                        <input type="hidden" name="note[]" value="{{ $cart->note }}">
                                        <input type="hidden" name="jumlah[]" value="{{ $cart->jumlah }}">
                                        <input type="hidden" name="size[]" value="{{ $cart->ukuran }}">
                                        <input type="hidden" name="total[]" value="{{ $cart->total }}">
                                        <tr class="cart_item">
                                            <td class="product-thumbnail">
                                                <a href="#">
                                                    <img src="/uploads/{{ $cart->product->gambar }}" alt="">
                                                </a>
                                            </td>
                                            <td class="product-name">
                                                <a href="#">{{ $cart->product->nama_produk }}</a>
                                                <ul>
                                                    <li>Pilihan/Size: {{ $cart->ukuran }}</li>
                                                    <li>Desain:
                                                        @if ($cart->file != null)
                                                            <span>Desain sudah terupload</span>
                                                        @elseif ($cart->is_need_design == 1)
                                                            <span style="color: red">Saya ingin request desain (Jasa Desain
                                                                Rp.60.000)</span>
                                                        @else
                                                            <span>Desain belum Terupload</span>
                                                        @endif
                                                    </li>
                                                    <li>Note: {{ $cart->note }}</li>
                                                    <li>Berat: {{ $cart->product->berat }}</li>
                                                </ul>
                                            </td>
                                            <td class="product-price">
                                                <span class="amount">{{ 'Rp. ' . number_format($cart->product->harga) }}</span>
                                            </td>
                                            <td class="product-quantity">
                                                <span class="amount">{{ $cart->jumlah }}</span>
                                            </td>
                                            <td class="product-subtotal">
                                                <span class="amount">{{ 'Rp. ' . number_format($cart->total) }}</span>
                                            </td>
                                            <td class="product-remove">
                                                <a href="/delete_from_cart/{{ $cart->id }}" class="remove" title="Remove this item">
                                                    <i class="ui-close"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>

                        <div class="row mb-50">
                            <div class="col-md-5 col-sm-12">
                            </div>
                            <div class="col-md-7">
                                <div class="actions">
                                    <div class="wc-proceed-to-checkout">
                                        <a href="#" class="btn btn-lg btn-dark checkout"><span>Proceed to Checkout</span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end col -->
                </div> <!-- end row -->

                <div class="row">
                    <div class="col-md-6 shipping-calculator-form">
                        <h2 class="heading relative uppercase bottom-line full-grey mb-30">Form Shipping</h2>
                        <div class="row row-10">
                            <div class="col-sm-12">
                                <p class="form-row form-row-wide">
                                    <label for="detail_alamat">Berat (g)</label>
                                    <input type="text" class="input-text berat" placeholder="Berat" name="berat"
                                        value="{{ $berat_total }}" id="berat" disabled>
                                    <input type="hidden" class="input-text berat" placeholder="Berat" name="berat"
                                        value="{{ $berat_total }}" id="berat">
                                </p>
                            </div>
                        </div>
                        <p class="form-row form-row-wide">
                            <select name="provinsi" id="provinsi" class="country_to_state provinsi"
                                rel="calc_shipping_state">
                                <option value="">Provinsi</option>
                                @foreach ($provinsi->rajaongkir->results as $provinsi)
                                    <option value="{{ $provinsi->province_id }}">{{ $provinsi->province }}</option>
                                @endforeach
                            </select>
                        </p>
                        <p class="form-row form-row-wide">
                            <select name="kota" id="kota" class="country_to_state kota" rel="calc_shipping_state">

                            </select>
                        </p>
                        <p class="form-row form-row-wide">
                            <label for="detail_alamat">Detail Alamat</label>
                            <textarea name="detail_alamat" id="detail_alamat" class="country_to_state detail_alamat" cols="30" rows="10"></textarea>
                        </p>
                    </div> <!-- end col shipping calculator -->

                    <div class="col-md-6">
                        <div class="cart_totals">
                            <h2 class="heading relative bottom-line full-grey uppercase mb-30">Cart Totals</h2>

                            <table class="table shop_table">
                                <tbody>
                                    <tr class="cart-subtotal">
                                        <th>Cart Subtotal</th>
                                        <td>
                                            <span class="amount cart-total">Rp. {{ number_format($cart_total) }}</span>
                                        </td>
                                    </tr>

                                    <!-- Menambahkan baris PPN 12% -->
                                    <tr class="ppn">
                                        <th>PPN (12%)</th>
                                        <td>
                                            <span class="amount" id="ppn">Rp. {{ number_format($cart_total * 0.12) }}</span>
                                        </td>
                                    </tr>

                                    <tr class="shipping">
                                        <th>Shipping</th>
                                        <td>
                                            <span class="shipping-cost">0</span>
                                        </td>
                                    </tr>
                                    <tr class="order-total">
                                        <th>Order Total</th>
                                        <td>
                                            <input type="hidden" name="grand_total" class="grand_total">
                                            <strong><span class="amount grand_total">Rp. 0</span></strong>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div> <!-- end col cart totals -->

                </div> <!-- end row -->
            </form>
        </div> <!-- end container -->
    </section> <!-- end cart -->
@endsection

@push('js')
    <script>
        $(function() {
            $('.provinsi').change(function() {
                $.ajax({
                    url: '/get_kota/' + $(this).val(),
                    success: function(data) {
                        data = JSON.parse(data);
                        option = "";
                        data.rajaongkir.results.map((kota) => {
                            option += `<option value=${kota.city_id}>${kota.city_name}</option>`;
                        });
                        $('.kota').html(option);
                    }
                });
            });

            // Fungsi untuk memformat angka menjadi Rupiah
            function formatRupiah(angka) {
                let rupiah = angka.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
                return 'Rp ' + rupiah;
            }

            $('.kota').change(function(e) {
                e.preventDefault();

                if ($('.kota').val() && $('.berat').val()) {
                    $.ajax({
                        url: '/get_ongkir/' + $('.kota').val() + '/' + $('.berat').val(),
                        success: function(data) {
                            data = JSON.parse(data);

                            // Menghitung ongkir, PPN, dan grand total
                            let ongkir = parseInt(data.rajaongkir.results[0].costs[1].cost[0].value);
                            let cartTotal = {{ $cart_total }};
                            let ppn = cartTotal * 0.12;  // Hitung PPN 12%
                            let grandtotal = ongkir + cartTotal + ppn;

                            // Memperbarui biaya pengiriman, PPN dan grand total di halaman
                            $('.shipping-cost').text(formatRupiah(ongkir));
                            $('#ppn').text(formatRupiah(ppn));
                            $('.grand_total').text(formatRupiah(grandtotal));
                            $('.grand_total').val(grandtotal); // Untuk input hidden
                        }
                    });
                }
            });

            $('.checkout').click(function(e) {
                e.preventDefault();
                $.ajax({
                    url: '/checkout_orders',
                    method: 'POST',
                    data: $('.form-cart').serialize(),
                    headers: {
                        'X-CSRF-TOKEN': "{{ csrf_token() }}",
                    },
                    success: function() {
                        location.href = '/checkout';
                    }
                });
            });
        });
    </script>
@endpush
