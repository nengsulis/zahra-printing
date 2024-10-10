@extends('layout.home')

@section('title', 'Checkout')

@section('content')
    <!-- Checkout -->
    <section class="section-wrap checkout pb-70">
        <div class="container relative">
            <table style="margin-bottom: 100px">
                @foreach ($orders as $order)
                    <tr>
                        <td colspan="2">
                            <h4>Detail Order</h4>
                        </td>
                        <td>
                            <a href="/orders/bayar/{{ $order->id }}"
                                style="background-color: red; padding-left:24px; padding-right:25px"
                                class="btn btn-succes">Bayar Order</a>
                        </td>
                        <td>
                            <a href="/orders/charge/{{ $order->id }}"
                                style="background-color: red; padding-left:24px; padding-right:25px"
                                class="btn btn-succes">Bayar Charge</a>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" style="width:800px">
                            <h1>Invoice #{{ $order->invoice }}</h1>
                        </td>

                        <td colspan="2">
                            Status Order Saat ini: {{ $order->status }}
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 400px">
                            Bukti Pembayaran Orders
                        </td>
                        <td colspan="3">
                            Bukti Pembayaran Charge
                        </td>
                    </tr>
                    <tr>
                        <td>
                            @if ($payment_orders != null)
                                {{ $payment_orders->status }}
                            @else
                                Data Kosong
                            @endif


                        </td>
                        <td>
                            @if ($payment_charges != null)
                                {{ $payment_charges->status }}
                            @else
                                Data Kosong
                            @endif
                        </td>
                        <td style="width: 200px">Nama Member</td>
                        <td style="width: 200px">{{ $order->member->nama_member }}</td>
                    </tr>
                    <tr>
                        <td>Via Pembayaran</td>
                        <td>Via Pembayaran</td>
                        <td>Provinsi</td>
                        <td>{{ $order->provinsi }}</td>
                    </tr>
                    <tr>
                        <td>
                            @if ($payment_orders != null)
                                {{ $gateway_orders->nama_bank }}
                            @else
                                Data Kosong
                            @endif

                        </td>
                        <td>
                            @if ($payment_charges != null)
                                {{ $gateway_charges->nama_bank }}
                            @else
                                Data Kosong
                            @endif
                        </td>
                        <td>Kota</td>
                        <td>{{ $order->kota }}</td>
                    </tr>
                    <tr>
                        <td>Jumlah</td>
                        <td>Jumlah</td>
                        <td>Email</td>
                        <td>{{ $order->member->email }}</td>
                    </tr>
                    <tr>
                        <td>{{ 'Rp. ' . number_format($order->grand_total) }}</td>
                        <td>{{ 'Rp. ' . number_format($order->charge) }}</td>
                        <td>No Hp</td>
                        <td>{{ $order->member->no_hp }}</td>
                    </tr>
                    <tr>
                        <td>Bukti Pembayaran</td>
                        <td>Bukti Pembayaran</td>
                        <td>Detail Alamat</td>
                        <td>{{ $order->detail_alamat }}</td>
                    </tr>
                    <tr>
                        <td>
                            @if ($payment_orders != null)
                                <img src="{{ asset('storage/' . $payment_orders->bukti_pembayaran) }}" width="200"
                                    class="img-fluid mt-3" alt="Bukti Pembayaran">
                            @else
                                Data Kosong
                            @endif
                        </td>
                        <td>
                            @if ($payment_charges != null)
                                <img src="{{ asset('storage/' . $payment_charges->bukti_pembayaran) }}" width="200"
                                    class="img-fluid mt-3" alt="Bukti Pembayaran">
                            @else
                                Data Kosong
                            @endif
                        </td>
                        <td style="vertical-align: top;">
                            Berat<br>
                            Charge<br>
                            No Resi
                        </td>
                        <td style="vertical-align: top;">
                            {{ $order->berat }} g <br>
                            {{ 'Rp. ' . number_format($order->charge) }} <br>
                            {{ $order->no_resi }}

                        </td>
                    </tr>
                @endforeach
            </table>


            <div class="table-responsive">
                <table class="table table-bordered table-hover table-striped">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Nama Produk</th>
                            <th>Ukuran</th>
                            <th>Desain</th>
                            <th>Thumbnail Desain</th>
                            <th>Note</th>
                            <th>Nominal</th>
                            <th>Download</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($orders as $order)
                            @foreach ($order->order_detail as $detail)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $detail->product->nama_produk ?? 'Nama produk tidak tersedia' }}
                                    </td>
                                    <td>{{ $detail->size ?? 'Size tidak tersedia' }}</td>
                                    <td>{{ $detail->is_need_design == 1 ? 'Request Desain' : 'Desain sudah tersedia' }}
                                    </td>
                                    <td>
                                        <img src="{{ asset('storage/' . $detail->file) }}" width="200"
                                            class="img-fluid mt-3" alt="Thumbnail Desain">
                                    </td>
                                    <td>{{ $detail->note ?? 'Note tidak tersedia' }}</td>
                                    <td>{{ 'Rp. ' . number_format($detail->total) }}</td>
                                    <td>
                                        @if (!empty($detail->file))
                                            <a href="{{ route('file.download', ['filename' => substr($detail->file, 8)]) }}"
                                                class="btn btn-primary">Download File</a>
                                        @else
                                            <span>Tidak ada file</span>
                                        @endif
                                    </td>
                                </tr>
                            @endforeach
                        @endforeach
                    </tbody>
                </table>

            </div> <!-- end row -->
        </div> <!-- end container -->
    </section> <!-- end checkout -->

    @push('css')
        <style>
            .grid-3,
            .grid-4 {
                display: grid;
                grid-template-columns: repeat(4, 1fr);
                gap: 10px;
            }

            .grid-3 .col,
            .grid-4 .col {
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            .section-wrap {
                background-color: #f8f9fa;
                padding: 20px;
                border-radius: 10px;
            }
        </style>
    @endpush

    @push('js')
        <script>
            $(function() {
                const token = localStorage.getItem('token');

                $(document).on('click', '.btn-aksi', function() {
                    const id = $(this).data('id');

                    $.ajax({
                        url: '/api/pesanan/ubah_status/' + id,
                        type: 'POST',
                        data: {
                            status: 'Dikonfirmasi'
                        },
                        headers: {
                            "Authorization": 'Bearer ' + token
                        },
                        success: function(data) {
                            location.reload();
                        },
                        error: function(xhr, status, error) {
                            console.error('Error:', status, error);
                            alert('Terjadi kesalahan saat mengubah status. Silakan coba lagi.');
                        }
                    });
                });

                $(document).on('click', '.btn-charge', function(e) {
                    e.preventDefault();
                    const id = $(this).data('id');
                    const charge = $('#charge-' + id).val();

                    if (!charge || isNaN(charge) || charge <= 0) {
                        alert('Harap masukkan charge yang valid.');
                        return;
                    }

                    $.ajax({
                        url: '/api/pesanan/update_charge/' + id,
                        type: 'POST',
                        data: {
                            charge: charge
                        },
                        headers: {
                            "Authorization": 'Bearer ' + token
                        },
                        success: function(data) {
                            alert('Charge berhasil diperbarui!');
                            location.reload();
                        },
                        error: function(xhr, status, error) {
                            console.error('Error:', xhr.status, xhr.statusText, xhr.responseText);
                            alert('Terjadi kesalahan saat menghubungi server. Silakan coba lagi.');
                        }
                    });
                });

                $(document).on('click', '.btn-no_resi', function(e) {
                    e.preventDefault();
                    const id = $(this).data('id');
                    const no_resi = $('#no_resi-' + id).val();

                    $.ajax({
                        url: '/api/pesanan/update_resi/' + id,
                        type: 'POST',
                        data: {
                            no_resi: no_resi
                        },
                        headers: {
                            "Authorization": 'Bearer ' + token
                        },
                        success: function(data) {
                            alert('Resi berhasil diperbarui!');
                            location.reload();
                        },
                        error: function(xhr, status, error) {
                            console.error('Error:', xhr.status, xhr.statusText, xhr.responseText);
                            alert('Terjadi kesalahan saat menghubungi server. Silakan coba lagi.');
                        }
                    });
                });
            });
        </script>
    @endpush
@endsection
