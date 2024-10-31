@extends('layout.home')

@section('title', 'Checkout')

@section('content')
    <!-- Checkout -->
    <section class="section-wrap checkout pb-70">
        <div class="container relative">
            <div class="row">

                <div class="ecommerce col-xs-12">

                    <form name="checkout" class="checkout ecommerce-checkout row" enctype="multipart/form-data" method="POST"
                        action="/payments">
                        @csrf
                        <input type="hidden" name="id_order" value="{{ $orders->id }}">
                        <div class="col-md-8" id="customer_details">
                            <div>
                                <h2 class="heading uppercase bottom-line full-grey mb-30">billing payment</h2>
                                <p class="form-row form-row-first validate-required ecommerce-invalid ecommerce-invalid-required-field"
                                    id="billing_first_name_field">
                                    <label for="billing_first_name">Upload Bukti Pembayaran
                                        <abbr class="required" title="required">*</abbr>
                                    </label> <br>
                                    <input type="file" class="input-text" name="bukti_pembayaran"
                                        id="billing_first_name">
                                </p>

                                <div class="clear"></div>

                            </div>

                            <div class="clear"></div>

                            <div class="clear"></div>

                        </div> <!-- end col -->

                        <!-- Your Order -->
                        <div class="col-md-4">
                            <div class="order-review-wrap ecommerce-checkout-review-order" id="order_review">
                                <h2 class="heading uppercase bottom-line full-grey">Your Order</h2>
                                <table class="table shop_table ecommerce-checkout-review-order-table">
                                    <tbody>
                                        <tr class="order-total">
                                            <th><strong>Order Total</strong></th>
                                            <td>
                                                <strong><span class="amount">Rp.
                                                        {{ number_format($orders->grand_total) }}</span></strong>
                                                <input type="hidden" name="jumlah" value="{{ $orders->grand_total }}">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                                <div id="payment" class="ecommerce-checkout-payment">
                                    <h2 class="heading uppercase bottom-line full-grey">Payment Method</h2>
                                    <p>Lakukan pembayaran Anda langsung ke rekening bank kami. Silakan melakukan pembayaran sesuai dengan jumlah nominal order anda. 
                                        Pesanan Anda tidak akan diproses sampai dana tersedia di akun kami.</p>
                                    <ul class="payment_methods methods">
                                        @foreach ($gateways as $gateway)
                                            <li class="payment_method_bacs">
                                                <input id="payment_method_bacs{{ $gateway->id }}" type="radio"
                                                    class="input-radio" name="id_gateway" value="{{ $gateway->id }}"
                                                    checked="checked">
                                                <label for="payment_method_bacs{{ $gateway->id }}"><img
                                                        style="width: 50px; ; margin: 20px"
                                                        src="/gateways/{{ $gateway->gambar }}"
                                                        alt="">{{ $gateway->nama_bank }}</label>
                                                <div class="payment_box payment_method_bacs">
                                                    <p>Atas Nama: {{ $gateway->atas_nama }}</p>
                                                    <p>No Rekening: {{ $gateway->rekening }}</p>
                                                </div>
                                            </li>
                                        @endforeach
                                    </ul>
                                    <div class="form-row place-order">
                                        <input type="submit" name="ecommerce_checkout_place_order"
                                            class="btn btn-lg btn-dark" id="place_order" value="Place order">
                                    </div>
                                </div>
                            </div>
                        </div> <!-- end order review -->
                    </form>

                </div> <!-- end ecommerce -->

            </div> <!-- end row -->
        </div> <!-- end container -->
    </section> <!-- end checkout -->
@endsection

@push('js')
    <script>
        $(function() {
            $('.provinsi').change(function() {
                $.ajax({
                    url: '/get_kota/' + $(this).val(),
                    success: function(data) {
                        data = JSON.parse(data)
                        option = ""
                        data.rajaongkir.results.map((kota) => {
                            option +=
                                `<option value=${kota.city_id}>${kota.city_name}</option>`
                        })
                        $('.kota').html(option)
                    }
                });
            });
        })
    </script>
@endpush
