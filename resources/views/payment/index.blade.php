@extends('layout.app')

@section('title', 'Data Pembayaran')

@section('content')
    <div class="card shadow">
        <div class="card-header">
            <h4 class="card-title">Data Pembayaran</h4>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover table-stripe">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Tanggal</th>
                            <th>Invoice</th>
                            <th>Jumlah</th>
                            <th>Gateway</th>
                            <th>Bukti</th>
                            <th>Status</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modal-form" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Form Pembayaran</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form class="form-pembayaran">
                        <div class="form-group">
                            <label for="">Tanggal</label>
                            <input type="text" class="form-control" name="tanggal" placeholder="Tanggal" readonly>
                        </div>
                        {{-- <div class="form-group">
                            <label for="">Invoice</label>
                            <input type="text" class="form-control" name="invoice" placeholder="Invoice" readonly>
                        </div> --}}
                        <div class="form-group">
                            <label for="">Jumlah</label>
                            <input type="text" class="form-control" name="jumlah" placeholder="Jumlah" readonly>
                        </div>
                        {{-- <div class="form-group">
                            <label for="">Gateway</label>
                            <input type="text" class="form-control" name="gateway" placeholder="Gateway" readonly>
                        </div> --}}
                        <div class="form-group">
                            <label for="">Bukti Pembayaran</label>
                            <input type="text" class="form-control" name="bukti_pembayaran"
                                placeholder="Bukti Pembayaran" readonly>
                        </div>
                        <div class="form-group">


                            <div id="buktiPembayaranContainer"></div>
                        </div>
                        <div class="form-group">
                            <label for="">Status</label>
                            <select name="status" id="status" class="form-control">
                                <option value="DITERIMA">DITERIMA</option>
                                <option value="DITOLAK">DITOLAK</option>
                                <option value="MENUNGGU">MENUNGGU</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block">Submit</button>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

@endsection

@push('js')
    <script>
        $(function() {
            $.ajax({
                url: '/api/payments',
                success: function({
                    data
                }) {
                    let row = ''; // Inisialisasi row sebagai string kosong
                    data.forEach(function(val, index) {
                        const tgl = new Date(val.created_at);
                        const tgl_lengkap =
                            `${tgl.getDate()}-${tgl.getMonth() + 1}-${tgl.getFullYear()}`;
                        const formattedJumlah = new Intl.NumberFormat('id-ID', {
                            style: 'currency',
                            currency: 'IDR'
                        }).format(val.jumlah);

                        row += `
                        <tr>
                            <td>${index + 1}</td>
                            <td>${tgl_lengkap}</td>
                            <td>${val.order ? val.order.invoice : 'Tidak Ditemukan'}</td>
                            <td>${formattedJumlah}</td>
                            <td>${val.gateway.nama_bank}</td>
                            <td><img src="storage/${val.bukti_pembayaran}" width="100"></td>
                            <td>${val.status}</td>
                            <td>
                                <a data-toggle="modal" href="#modal-form" data-id="${val.id}" class="btn btn-light text-dark border-dark modal-ubah">Edit</a>
                                <a href="#" data-id="${val.id}" class="btn btn-danger btn-hapus" style="background-color: #555555; color: white; border: none;">Hapus</a>
                            </td>
                        </tr>
                        `;
                    });

                    $('tbody').append(row);
                }
            });

            $(document).on('click', '.btn-hapus', function() {
                const id = $(this).data('id')
                const token = localStorage.getItem('token')

                confirm_dialog = confirm('Apakah anda yakin?');

                if (confirm_dialog) {
                    $.ajax({
                        url: '/api/payments/' + id,
                        type: "DELETE",
                        headers: {
                            "Authorization": "Bearer " + token
                        },
                        success: function(data) {
                            if (data.success) {
                                alert('Data berhasil dihapus')
                                location.reload();
                            }
                        }
                    });
                }


            });

            $(document).on('click', '.modal-ubah', function() {
                const id = $(this).data('id');
                $.get('/api/payments/' + id, function({
                    data
                }) {
                    $('input[name="tanggal"]').val(new Date(data.created_at).toLocaleDateString(
                        'id-ID'));
                    // $('input[name="invoice"]').val(data.order ? data.order.invoice :
                    //     'Tidak Ditemukan');
                    $('input[name="jumlah"]').val(new Intl.NumberFormat('id-ID', {
                        style: 'currency',
                        currency: 'IDR'
                    }).format(data.jumlah));
                    // $('input[name="gateway"]').val(data.gateway ? data.gateway.nama_bank :
                    //     'Tidak Ditemukan');
                    $('input[name="bukti_pembayaran"]').val(data.bukti_pembayaran);
                    $('#buktiPembayaranContainer').html(
                        `<img src="storage/${data.bukti_pembayaran}" alt="bukti" width="100">`);
                    $('select[name="status"]').val(data.status);
                    $('#modal-form').modal('show');
                });

                $('.form-pembayaran').submit(function(e) {
                    e.preventDefault();
                    const token = localStorage.getItem('token'); // Ambil token di sini
                    const frmdata = new FormData(this);

                    $.ajax({
                        url: `api/payments/${id}?_method=PUT`,
                        type: 'POST',
                        data: frmdata,
                        cache: false,
                        contentType: false,
                        processData: false,
                        headers: {
                            "Authorization": "Bearer " + token
                        },
                        success: function(data) {
                            if (data.success) {
                                alert('Data berhasil diubah');
                                location.reload();
                            }
                        }
                    });
                });
            });
        });
    </script>
@endpush
