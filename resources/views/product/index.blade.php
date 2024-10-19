@extends('layout.app')

@section('title', 'Data Produk')

@section('content')
    <div class="card shadow">
        <div class="card-header">
            <h4 class="card-title">Data Produk</h4>
        </div>
        <div class="card-body">
            <div class="d-flex justify-content-end mb-4">
                <a href="#modal-form" class="btn btn-primary modal-tambah">Tambah Data</a>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered table-hover table-striped">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Kategori</th>
                            <th>Subkategori</th>
                            <th>Nama Produk</th>
                            <th>Harga</th>
                            <th>Berat</th>
                            <th>Tags</th>
                            <th>Sku</th>
                            <th>Ukuran</th>
                            <th>Deskripsi</th>
                            <th>Gambar</th>
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
                    <h5 class="modal-title">Form Tambah Data</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form class="form-kategori">
                        <div class="form-group">
                            <label for="id_kategori">Kategori</label>
                            <select name="id_kategori" class="form-control" required>
                                <option value="">Pilih Kategori</option>
                                @foreach ($categories as $category)
                                    <option value="{{ $category->id }}">{{ $category->nama_kategori }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="id_subkategori">Subkategori</label>
                            <select name="id_subkategori" class="form-control" required>
                                <option value="">Pilih Subkategori</option>
                                @foreach ($subcategories as $subcategory)
                                    <option value="{{ $subcategory->id }}">{{ $subcategory->nama_subkategori }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="nama_produk">Nama Produk</label>
                            <input type="text" class="form-control" name="nama_produk" placeholder="Nama Produk"
                                required>
                        </div>
                        <div class="form-group">
                            <label for="harga">Harga</label>
                            <input type="number" class="form-control" name="harga" placeholder="Harga" required>
                        </div>
                        <div class="form-group">
                            <label for="berat">Berat</label>
                            <input type="number" class="form-control" name="berat" placeholder="Berat" required>
                        </div>
                        <div class="form-group">
                            <label for="tags">Tags</label>
                            <input type="text" class="form-control" name="tags" placeholder="Tags">
                        </div>
                        <div class="form-group">
                            <label for="sku">Sku</label>
                            <input type="text" class="form-control" name="sku" placeholder="Sku" required>
                        </div>
                        <div class="form-group">
                            <label for="ukuran">Ukuran</label>
                            <input type="text" class="form-control" name="ukuran" placeholder="Ukuran" required>
                        </div>
                        <div class="form-group">
                            <label for="deskripsi">Deskripsi</label>
                            <textarea name="deskripsi" class="form-control" cols="30" rows="10" required></textarea>
                        </div>
                        <div class="form-group">
                            <label for="gambar">Gambar</label>
                            <input type="file" class="form-control" name="gambar">
                            <div class="mt-2">
                                <img id="current-image" src="" alt="Current Gambar"
                                    style="max-width: 100px; display: none;">
                            </div>
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
            // Load products
            function loadProducts() {
                $.ajax({
                    url: '/api/products',
                    success: function({
                        data
                    }) {
                        let row = '';
                        data.forEach((val, index) => {
                            row += `
                                <tr>
                                    <td>${index + 1}</td>
                                    <td>${val.category.nama_kategori}</td>
                                    <td>${val.subcategory.nama_subkategori}</td>
                                    <td>${val.nama_produk}</td>
                                    <td>${val.harga}</td>
                                    <td>${val.berat}</td>
                                    <td>${val.tags}</td>
                                    <td>${val.sku}</td>
                                    <td>${val.ukuran}</td>
                                    <td>${val.deskripsi}</td>
                                    <td><img src="/uploads/${val.gambar}" width="100"></td>
                                    <td>
                                        <a data-toggle="modal" href="#modal-form" data-id="${val.id}" class="btn btn-light text-dark border-dark modal-ubah" title="Edit">
                                            <i class="bi bi-pencil-fill"></i>
                                        </a>
                                        <a href="#" data-id="${val.id}" class="btn btn-danger btn-hapus" style="background-color: #555555; color: white; border: none;" title="Hapus">
                                            <i class="bi bi-trash-fill"></i>
                                        </a>
                                    </td>
                                </tr>
                            `;
                        });
                        $('tbody').html(row);
                    },
                    error: function() {
                        alert('Gagal memuat data produk.');
                    }
                });
            }

            loadProducts();

            // Delete product
            $(document).on('click', '.btn-hapus', function() {
                const id = $(this).data('id');
                const token = localStorage.getItem('token');

                if (confirm('Apakah anda yakin?')) {
                    $.ajax({
                        url: '/api/products/' + id,
                        type: "DELETE",
                        headers: {
                            "Authorization": "Bearer " + token
                        },
                        success: function(data) {
                            if (data.success) {
                                alert('Data berhasil dihapus');
                                loadProducts();
                            }
                        },
                        error: function() {
                            alert('Gagal menghapus data.');
                        }
                    });
                }
            });

            // Add product
            $('.modal-tambah').click(function() {
                $('#modal-form').modal('show');
                $('.form-kategori')[0].reset();
                $('.form-kategori').data('id', null);
                $('.modal-title').text('Form Tambah Data');
                $('#current-image').hide(); // Reset current image
            });

            // Handle form submission
            $('.form-kategori').submit(function(e) {
                e.preventDefault();
                const token = localStorage.getItem('token');
                const frmdata = new FormData(this);
                const id = $(this).data('id');

                if (id) {
                    frmdata.append('_method', 'PUT');
                }

                $.ajax({
                    url: id ? `api/products/${id}` : 'api/products',
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
                            alert(`Data berhasil ${id ? 'diubah' : 'ditambah'}`);
                            $('#modal-form').modal('hide');
                            loadProducts();
                        }
                    },
                    error: function() {
                        alert('Gagal menyimpan data.');
                    }
                });
            });

            // Edit product
            $(document).on('click', '.modal-ubah', function() {
                const id = $(this).data('id');
                $('#modal-form').modal('show');

                // Reset current image display
                $('#current-image').attr('src', '').hide();
                $('input[name="gambar"]').val(''); // Reset file input

                $.get('/api/products/' + id, function({
                    data
                }) {
                    $('select[name="id_kategori"]').val(data.id_kategori);
                    $('select[name="id_subkategori"]').val(data.id_subkategori);
                    $('input[name="nama_produk"]').val(data.nama_produk);
                    $('input[name="harga"]').val(data.harga);
                    $('input[name="berat"]').val(data.berat);
                    $('input[name="tags"]').val(data.tags);
                    $('input[name="sku"]').val(data.sku);
                    $('input[name="ukuran"]').val(data.ukuran);
                    $('textarea[name="deskripsi"]').val(data.deskripsi);
                    $('.form-kategori').data('id', id);
                    $('.modal-title').text('Form Edit Data');

                    // Tampilkan gambar saat ini jika ada
                    if (data.gambar) {
                        const currentImage = `/uploads/${data.gambar}`;
                        $('#current-image').attr('src', currentImage).show();
                    } else {
                        $('#current-image').hide(); // Sembunyikan jika tidak ada gambar
                    }
                }).fail(function() {
                    alert('Gagal memuat data produk untuk diubah.');
                });
            });




        });
    </script>
@endpush
