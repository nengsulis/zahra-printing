@extends('layout.home')

@section('title', 'Contact')

@section('content')
    <!-- Contact -->
    <section class="section-wrap contact pb-40">
        <div class="container">
            <div class="row">
                <div class="col-md-8 mb-40">
                    <form class="form-kategori" id="contact-form" action="#" method="POST" enctype="multipart/form-data">
                        @csrf <!-- Tambahkan CSRF token untuk keamanan -->

                        <div class="contact-name">
                            <input name="nama_testimoni" id="name" class="nama" type="text" placeholder="Name*"
                                required>
                        </div>
                        <div class="contact-email">
                            <input name="gambar" id="mail" type="file" style="margin-bottom: 50px" required>
                        </div>

                        <textarea name="deskripsi" id="comment" placeholder="Message" rows="9" required></textarea>
                        <button type="submit" class="btn btn-lg btn-dark btn-submit"><span
                                style="color: white">Submit</span></button>

                        <div id="msg" class="message"></div>
                    </form>
                </div> <!-- end col -->

                <div class="col-md-3 col-md-offset-1 col-sm-5 mb-40">
                    <div class="contact-item">
                        <h6>Address</h6>
                        <address>{{ $about->judul_website }}<br>{{ $about->alamat }}</address>
                    </div> <!-- end address -->

                    <div class="contact-item">
                        <h6>Information</h6>
                        <ul>
                            <li>
                                <i class="fa fa-envelope"></i><a href="mailto:{{ $about->email }}">{{ $about->email }}</a>
                            </li>
                            <li>
                                <i class="fa fa-phone"></i><span>{{ $about->telepon }}</span>
                            </li>
                        </ul>
                    </div> <!-- end information -->
                </div>
            </div>
        </div>
    </section> <!-- end contact -->

    <!-- Google Map -->
    <div id="google-map" class="gmap" data-address="V Tytana St, Manila, Philippines"></div>
@endsection

@push('js')
    <script>
        $(function() {
            $('.form-kategori').submit(function(e) {
                e.preventDefault();
                const token = localStorage.getItem('token');
                const frmdata = new FormData(this);

                $.ajax({
                    url: 'api/testimonis',
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
                            alert('Data berhasil ditambah');
                            location.reload();
                        }
                    },
                    error: function(xhr) {
                        // Menangani error
                        alert('Terjadi kesalahan: ' + xhr.responseJSON.message);
                    }
                });
            });
        });
    </script>
@endpush
