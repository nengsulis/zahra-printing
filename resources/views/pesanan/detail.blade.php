@extends('layout.app')

@section('title', 'Detail Order')

@section('content')
    <div class="card shadow">
        <div class="card-header d-flex justify-content-between align-items-center">
            <h4>
                Detail Order
            </h4>
            <button class="btn btn-primary" id="printButton" style="margin-right: 10px;">
                Cetak
            </button>
            @if ($orders_id->status == 'Baru')
                <a href="#" data-id="{{ $order_id }}" class="btn btn-success btn-konfirmasi"
                    style="background-color: #8fbf80; color: white; border: none;">Konfirmasi</a>
            @elseif ($orders_id->status == 'Dikonfirmasi')
                <a href="#" data-id="{{ $order_id }}" class="btn btn-success btn-kemas"
                    style="background-color: #8fbf80; color: white; border: none;">Kemas</a>
            @elseif ($orders_id->status == 'Dikemas')
                <a href="#" data-id="{{ $order_id }}" class="btn btn-success btn-kirim"
                    style="background-color: #8fbf80; color: white; border: none;">Kirim</a>
            @elseif ($orders_id->status == 'Dikirim')
                <a href="#" data-id="{{ $order_id }}" class="btn btn-success btn-terima"
                    style="background-color: #8fbf80; color: white; border: none;">Terima</a>
            @elseif ($orders_id->status == 'Diterima')
                <a href="#" data-id="{{ $order_id }}" class="btn btn-success btn-selesai"
                    style="background-color: #8fbf80; color: white; border: none;">Selesai</a>
            @else
                <a href="/dashboard" class="btn btn-success btn-aksi"
                    style="background-color: #BF9280FF; color: white; border: none;">Kembali</a>
            @endif
        </div>
        <div class="card-body" id="printArea">
            @foreach ($orders as $order)
                <div class="row">
                    <div class="col-2">
                        <h1>Invoice</h1>
                    </div>
                    <div class="col">
                        <h1>{{ $order->invoice }}</h1>
                    </div>
                    <div class="col">
                        <div class="alert alert-primary" role="alert">
                            Status Order Saat ini: {{ $order->status }}
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">Bukti Pembayaran Orders</div>
                    <div class="col">Bukti Pembayaran Charge</div>
                    <div class="col-2"></div>
                    <div class="col"></div>
                </div>
                <div class="row">
                    <div class="col">
                        @if ($payment_orders != null)
                            <span
                                class="badge {{ $payment_orders->status == 'MENUNGGU' ? 'bg-danger' : 'bg-success' }} rounded-pill text-white">
                                {{ $payment_orders->status }}
                            </span>
                        @else
                            <span class="badge bg-secondary rounded-pill text-white">
                                Data Kosong
                            </span>
                        @endif
                    </div>
                    <div class="col">
                        @if ($payment_charges != null)
                            <span
                                class="badge {{ $payment_charges->status == 'MENUNGGU' ? 'bg-danger' : 'bg-success' }} rounded-pill text-white">
                                {{ $payment_charges->status }}
                            </span>
                        @else
                            <span class="badge bg-secondary rounded-pill text-white">
                                Data Kosong
                            </span>
                        @endif
                    </div>

                    <div class="col-2">
                        <span>Nama Member</span>
                    </div>
                    <div class="col">
                        <span>{{ $order->member->nama_member }}</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col">Via Pembayaran</div>
                    <div class="col">
                        Via Pembayaran
                    </div>
                    <div class="col-2">
                        <span>Provinsi</span>
                    </div>
                    <div class="col">
                        <span>{{ $order->provinsi }}</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        @if ($payment_orders != null)
                            {{ $gateway_orders->nama_bank }}
                        @else
                            Data Kosong
                        @endif
                    </div>
                    <div class="col">
                        @if ($payment_charges != null)
                            {{ $gateway_charges->nama_bank }}
                        @else
                            Data Kosong
                        @endif
                    </div>
                    <div class="col-2">
                        <span>Kota</span>
                    </div>
                    <div class="col">
                        <span>{{ $order->kota }}</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col">Jumlah</div>
                    <div class="col">
                        Jumlah
                    </div>
                    <div class="col-2">
                        <span>Email</span>
                    </div>
                    <div class="col">
                        <span>{{ $order->member->email }}</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col">{{ 'Rp. ' . number_format($order->grand_total) }}</div>
                    <div class="col">
                        {{ 'Rp. ' . number_format($order->charge) }}
                    </div>
                    <div class="col-2">
                        <span>No Hp</span>
                    </div>
                    <div class="col">
                        <span>{{ $order->member->no_hp }}</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col">Bukti Pembayaran</div>
                    <div class="col">
                        Bukti Pembayaran
                    </div>
                    <div class="col-2">
                        <span>Detail Alamat</span>
                    </div>
                    <div class="col">
                        <span>{{ $order->detail_alamat }}</span>
                    </div>
                </div>
                <div class="row mb-5">
                    <div class="col">
                        @if ($payment_orders != null)
                            <img src="{{ asset('storage/' . $payment_orders->bukti_pembayaran) }}" width="200"
                                class="img-fluid mt-3" alt="Bukti Pembayaran">
                        @else
                            Data Kosong
                        @endif


                    </div>
                    <div class="col">
                        @if ($payment_charges != null)
                            <img src="{{ asset('storage/' . $payment_charges->bukti_pembayaran) }}" width="200"
                                class="img-fluid mt-3" alt="Bukti Pembayaran">
                        @else
                            Data Kosong
                        @endif

                    </div>
                    <div class="col-2">
                        <span>Berat</span><br>
                        <span>Charge</span>
                        <span>Nominal</span><br>
                        <span>No Resi</span>
                    </div>
                    <div class="col">
                        <span>{{ $order->berat }} g</span>
                        <div class="row">
                            <div class="col">
                                @if ($order->status == 'Dikonfirmasi')
                                    <input type="number" class="charge" id="charge-{{ $order->id }}"
                                        placeholder="Masukkan Charge" min="0">
                                    <a href="#" data-id="{{ $order->id }}" class="btn btn-success mt-3 btn-charge"
                                        style="background-color: #8fbf80; color: white; border: none;">Perbaharui</a>
                                @elseif ($order->status == 'Dikemas')
                                    <span>{{ 'Rp. ' . number_format($order->charge) }}</span>
                                @else
                                    <span>{{ 'Rp. ' . number_format($order->charge) }}</span><br>
                                    <span>{{ $order->no_resi }}</span>
                                @endif
                            </div>

                        </div>
                        <div class="row">

                            <div class="col">
                                @if ($order->status == 'Dikonfirmasi')
                                    <span>{{ $order->no_resi }}</span>
                                @elseif ($order->status == 'Dikemas')
                                    @if ($order->no_resi == null)
                                        <input type="text" class="no_resi" id="no_resi-{{ $order->id }}"
                                            placeholder="Masukkan No Resi">
                                    @else
                                        <input type="text" value="{{ $order->no_resi }}" class="no_resi"
                                            id="no_resi-{{ $order->id }}" placeholder="Masukkan No Resi">
                                    @endif
                                    <a href="#" data-id="{{ $order->id }}"
                                        class="btn btn-success mt-3 btn-no_resi"
                                        style="background-color: #8fbf80; color: white; border: none;">Perbaharui</a>
                                @endif

                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
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
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($orders as $order)
                            @foreach ($order->order_detail as $detail)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $detail->product->nama_produk ?? 'Nama produk tidak tersedia' }}</td>
                                    <td>{{ $detail->size ?? 'Size tidak tersedia' }}</td>
                                    <td>{{ $detail->is_need_design == 1 ? 'Request' : 'Tersedia' }}</td>
                                    <td>
                                        <img src="{{ asset('storage/' . $detail->file) }}" width="200"
                                            class="img-fluid mt-3" alt="Thumbnail Desain">
                                    </td>
                                    <td>{{ $detail->note ?? 'Note tidak tersedia' }}</td>
                                    <td>{{ 'Rp. ' . number_format($detail->total) }}</td>
                                    <td>
                                        @if (!empty($detail->file))
                                            <a href="{{ route('file.download', ['filename' => substr($detail->file, 8)]) }}"
                                                class="btn btn-primary"><i class="bi bi-cloud-download"></i></a>
                                        @else
                                            <span>Tidak ada file</span>
                                        @endif

                                        <button class="btn btn-secondary btn-upload-design" data-id="{{ $detail->id }}"
                                            data-toggle="modal" data-target="#uploadModal"><i
                                                class="bi bi-arrow-down-up"></i></button>
                                    </td>
                                </tr>
                            @endforeach
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Modal Upload Gambar -->
    <div class="modal fade" id="uploadModal" tabindex="-1" aria-labelledby="uploadModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="uploadModalLabel">Update Desain</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="upload-design-form" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="order_detail_id" id="order_detail_id">
                        <div class="form-group">
                            <label for="design_image">Pilih Gambar Desain</label>
                            <input type="file" name="design_image" id="design_image" class="form-control" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                    <button type="button" class="btn btn-primary" id="upload-button">Upload</button>
                </div>
            </div>
        </div>
    </div>

@endsection

@push('js')
    <script>
        $(function() {
            const token = localStorage.getItem('token');

            // Event untuk menampilkan modal dan mengatur ID
            $('.btn-upload-design').on('click', function() {
                const detailId = $(this).data('id');
                $('#order_detail_id').val(detailId);
            });

            // Event untuk upload gambar desain
            $('#upload-button').on('click', function() {
                const form = $('#upload-design-form')[0];
                const formData = new FormData(form);

                $.ajax({
                    url: '/api/pesanan/upload_design', // Sesuaikan dengan URL Anda
                    type: 'POST',
                    data: formData,
                    contentType: false,
                    processData: false,
                    headers: {
                        "Authorization": 'Bearer ' + token
                    },
                    success: function(data) {
                        alert('Gambar desain berhasil diupload!');
                        $('#uploadModal').modal('hide');
                        location.reload(); // Memperbarui halaman
                    },
                    error: function(xhr, status, error) {
                        console.error('Error:', status, error);
                        alert('Terjadi kesalahan saat mengupload gambar. Silakan coba lagi.');
                    }
                });
            });

            $(document).on('click', '.btn-konfirmasi', function() {
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

            $(document).on('click', '.btn-kemas', function() {
                const id = $(this).data('id')

                $.ajax({
                    url: '/api/pesanan/ubah_status/' + id,
                    type: 'POST',
                    data: {
                        status: 'Dikemas'
                    },
                    headers: {
                        "Authorization": 'Bearer ' + token
                    },
                    success: function(data) {
                        location.reload()
                    }
                })
            })
            $(document).on('click', '.btn-kirim', function() {
                const id = $(this).data('id')

                $.ajax({
                    url: '/api/pesanan/ubah_status/' + id,
                    type: 'POST',
                    data: {
                        status: 'Dikirim'
                    },
                    headers: {
                        "Authorization": 'Bearer ' + token
                    },
                    success: function(data) {
                        location.reload()
                    }
                })
            })
            $(document).on('click', '.btn-terima', function() {
                const id = $(this).data('id')

                $.ajax({
                    url: '/api/pesanan/ubah_status/' + id,
                    type: 'POST',
                    data: {
                        status: 'Diterima'
                    },
                    headers: {
                        "Authorization": 'Bearer ' + token
                    },
                    success: function(data) {
                        location.reload()
                    }
                })
            })
            $(document).on('click', '.btn-selesai', function() {
                const id = $(this).data('id')

                $.ajax({
                    url: '/api/pesanan/ubah_status/' + id,
                    type: 'POST',
                    data: {
                        status: 'Selesai'
                    },
                    headers: {
                        "Authorization": 'Bearer ' + token
                    },
                    success: function(data) {
                        location.reload()
                    }
                })
            })

            $(document).on('click', '.btn-charge', function(e) {
                e.preventDefault(); // Mencegah default action
                const id = $(this).data('id');
                const charge = $('#charge-' + id).val(); // Ambil nilai dari input charge yang sesuai

                // Validasi input charge
                if (!charge || isNaN(charge) || charge <= 0) {
                    alert('Harap masukkan charge charge yang valid.');
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
                        location.reload(); // Memperbarui halaman
                    },
                    error: function(xhr, status, error) {
                        console.error('Error:', xhr.status, xhr.statusText, xhr.responseText);
                        alert('Terjadi kesalahan saat menghubungi server. Silakan coba lagi.');
                    }
                });
            });

            $(document).on('click', '.btn-no_resi', function(e) {
                e.preventDefault(); // Mencegah default action
                const id = $(this).data('id');
                const no_resi = $('#no_resi-' + id).val(); // Ambil nilai dari input no_resi yang sesuai

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
                        location.reload(); // Memperbarui halaman
                    },
                    error: function(xhr, status, error) {
                        console.error('Error:', xhr.status, xhr.statusText, xhr.responseText);
                        alert('Terjadi kesalahan saat menghubungi server. Silakan coba lagi.');
                    }
                });
            });

            document.getElementById('printButton').onclick = function() {
                var printContents = document.getElementById('printArea').innerHTML;
                var originalContents = document.body.innerHTML;

                document.body.innerHTML = printContents;
                window.print();
                document.body.innerHTML = originalContents;
                location.reload(); // Optionally reload the page after printing
            };
        });
    </script>
@endpush
