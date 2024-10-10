@extends('layout.app')

@section('title', 'Data Payment Gateway')

@section('content')
    <div class="card shadow">
        <div class="card-header">
            <h4 class="card title">
                Data Gateway Payment
            </h4>
        </div>
        <div class="card-body">
            <div class="d-flex justify-content-end mb-4">
                <a href="#modal-form" class="btn btn-primary modal-tambah">Tambah Data</a>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered table-hover table-stripe">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Gambar</th>
                            <th>Nama Bank</th>
                            <th>Atas Nama</th>
                            <th>Rekening</th>
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
                            <form class="form-gateway">
                                <div class="form-group">
                                    <label for="">Nama Bank</label>
                                    <input type="text" class="form-control" name="nama_bank" placeholder="Nama Bank"
                                        required>
                                </div>
                                <div class="form-group">
                                    <label for="">Atas nama</label>
                                    <input type="text" class="form-control" name="atas_nama" placeholder="Atas Nama"
                                        required>
                                </div>
                                <div class="form-group">
                                    <label for="">Rekening</label>
                                    <input type="text" class="form-control" name="rekening" placeholder="Rekening"
                                        required>
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
            $.ajax({
                url: '/api/gateways',
                success: function({
                    data
                }) {

                    let row;
                    data.map(function(val, index) {
                        row += `
                    <tr>
                        <td>${index+1}</td>
                        <td><img src="/gateways/${val.gambar}" width="100"></td>
                        <td>${val.nama_bank}</td>
                        <td>${val.atas_nama}</td>
                        <td>${val.rekening }</td>
                        <td>
                            <a data-toggle="modal" href="#modal-form" data-id="${val.id}" class="btn btn-light text-dark border-dark modal-ubah">Edit</a>
                            <a href="#" data-id="${val.id}" class="btn btn-danger btn-hapus" style="background-color: #555555; color: white; border: none;">Hapus</a>
                        </td>
                    </tr>
                    `;
                    });

                    $('tbody').append(row)
                }
            })

            $(document).on('click', '.btn-hapus', function() {
                const id = $(this).data('id')
                const token = localStorage.getItem('token')

                confirm_dialog = confirm('Apakah anda yakin?');

                if (confirm_dialog) {
                    $.ajax({
                        url: '/api/gateways/' + id,
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
                $('input[name="nama_bank"]').val('')
                $('input[name="atas_nama"]').val('')
                $('input[name="rekening"]').val('')


                $('.form-gateway').submit(function(e) {
                    e.preventDefault();
                    const token = localStorage.getItem('token')
                    const frmdata = new FormData(this);

                    $.ajax({
                        url: 'api/gateways',
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

                $.get('/api/gateways/' + id, function({
                    data
                }) {
                    $('input[name="nama_bank"]').val(data.nama_bank);
                    $('input[name="atas_nama"]').val(data.atas_nama);
                    $('input[name="rekening"]').val(data.rekening);

                });

                $('.form-gateway').submit(function(e) {
                    e.preventDefault();
                    const token = localStorage.getItem('token')
                    const frmdata = new FormData(this);

                    $.ajax({
                        url: `api/gateways/${id}?_method=PUT`,
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

        });
    </script>
@endpush
