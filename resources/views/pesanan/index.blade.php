@extends('layout.app')

@section('title', 'Data Pesanan Baru')

@section('content')
    <div class="card shadow">
        <div class="card-header">
            <h4 class="card title">
                Data Pesanan Baru
            </h4>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover table-stripe">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Tanggal Pesanan</th>
                            <th>Invoice</th>
                            <th>Member</th>
                            <th>Total</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody> </tbody>
                </table>
            </div>
        </div>

    </div>
    <div class="modal fade" id="modal-form" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Form Tambah Data</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <form class="form-kategori">
                                <div class="form-group">
                                    <label for="">Tanggal Pesanan</label>
                                    <input type="text" class="form-control" name="created_at" placeholder="Nama Kategori"
                                        required>
                                </div>
                                <div class="form-group">
                                    <label for="">Invoice</label>
                                    <textarea name="deskripsi" placeholder="Deskripsi" class="form-control" id="" cols="30" rows="10"
                                        required></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="">Gambar</label>
                                    <input type="file" class="form-control" name="gambar">
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary btn-block">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
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

            function rupiah(angka) {
                const format = angka.toString().split('').reverse().join('');
                const convert = format.match(/\d{1,3}/g);
                return 'Rp ' + convert.join('.').split('').reverse().join('')
            }

            function date(date) {
                var date = new Date(date);
                var day = date.getDate();
                var month = date.getMonth() + 1;
                var year = date.getFullYear();

                return `${day}-${month}-${year}`;
            }
            const token = localStorage.getItem('token')
            $.ajax({
                url: '/api/pesanan/baru',
                headers: {
                    "Authorization": "Bearer " + token
                },
                success: function({
                    data
                }) {

                    let row;
                    data.map(function(val, index) {
                        row += `
                    <tr>
                        <td>${index+1}</td>
                        <td>${date(val.created_at)}</td>
                        <td>${val.invoice}</td>
                        <td>${val.member.nama_member}</td>
                        <td>${rupiah(val.grand_total)}</td>
                        <td>
                            <a href="#" data-id="${val.id}" class="btn btn-success btn-aksi" style="background-color: #8fbf80; color: white; border: none;">Konfirmasi</a>

                             <a href="/pesanan/baru/${val.id}" class="btn btn-light text-dark border-dark">Detail</a>
                            <a href="#" data-id="${val.id}" class="btn btn-danger btn-hapus" style="background-color: #555555; color: white; border: none;">Hapus</a>
                        </td>
                    </tr>
                    `;
                    });

                    $('tbody').append(row)
                }
            });


            $(document).on('click', '.btn-hapus', function() {
                const id = $(this).data('id')
                const token = localStorage.getItem('token')

                confirm_dialog = confirm('Apakah anda yakin?');

                if (confirm_dialog) {
                    $.ajax({
                        url: '/api/orders/' + id,
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

            $('.modal-tambah').click(function() {
                $('#modal-form').modal('show')
                $('input[name="nama_kategori"]').val('')
                $('textarea[name="deskripsi"]').val('')

                $('.form-kategori').submit(function(e) {
                    e.preventDefault();
                    const token = localStorage.getItem('token')
                    const frmdata = new FormData(this);

                    $.ajax({
                        url: 'api/categories',
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
                                alert('Data berhasil ditambah')
                                location.reload()
                            }
                        }
                    })
                });
            });

            $(document).on('click', '.modal-ubah', function() {
                $('#modal-form').modal('show')
                const id = $(this).data('id');

                $.get('/api/orders/' + id, function({
                    data
                }) {
                    $('input[name="nama_kategori"]').val(data.nama_kategori);
                    $('textarea[name="invoice"]').val(data.invoice);
                    $('textarea[name="id_member"]').val(data.member.nama_member);
                    $('textarea[name="grand_total"]').val(data.grand_total);
                    $('textarea[name="berat"]').val(data.berat);
                    $('textarea[name="provinsi"]').val(data.provinsi);
                    $('textarea[name="kota"]').val(data.kota);
                    $('textarea[name="detail_alamat"]').val(data.detail_alamat);
                    $('textarea[name="detail_alamat"]').val(data.detail_alamat);
                });

                $('.form-kategori').submit(function(e) {
                    e.preventDefault();
                    const token = localStorage.getItem('token')
                    const frmdata = new FormData(this);

                    $.ajax({
                        url: `api/categories/${id}?_method=PUT`,
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
                                alert('Data berhasil diubah')
                                location.reload();
                            }
                        },
                        fail: function(data) {
                            console.log(data)
                        }
                    })
                });
            });

            $(document).on('click', '.btn-aksi', function() {
                const id = $(this).data('id')

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
                        location.reload()
                    }
                })
            })



        });
    </script>
@endpush
