<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>Masuk</title>

    <link href="/sbadmin2/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <link href="/sbadmin2/css/sb-admin-2.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('https://images.pexels.com/photos/3408745/pexels-photo-3408745.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260');
            /* Gambar dari Pexels */
            background-size: cover;
            background-position: center;
            height: 100vh;
            margin: 0;
        }

        .card {
            border-radius: 15px;
            background: rgba(255, 255, 255, 0.9);
            /* Transparansi latar belakang kartu */
        }

        .form-control {
            border-radius: 10px;
        }

        .btn-primary {
            border-radius: 10px;
        }

        .alert {
            margin-top: 10px;
        }
    </style>
</head>

<body>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-6">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Selamat Datang di Dashboard Aplikasi
                                            Manajemen Percetakan</h1>
                                        <p class="mb-4">Silakan Masuk Terlebih Dahulu</p>
                                    </div>
                                    @if ($errors->any())
                                        <div class="alert alert-danger">
                                            <strong>Kesalahan!</strong> {{ $errors->first() }}
                                        </div>
                                    @endif
                                    <form class="form-login user" method="POST" action="/login">
                                        @csrf
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user email"
                                                id="exampleInputEmail" placeholder="Masukkan Alamat Email..."
                                                name="email" required>
                                            @error('email')
                                                <small class="text-danger">{{ $message }}</small>
                                            @enderror
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user password"
                                                id="exampleInputPassword" placeholder="Kata Sandi" name="password"
                                                required>
                                            @error('password')
                                                <small class="text-danger">{{ $message }}</small>
                                            @enderror
                                        </div>

                                        <button type="submit" class="btn btn-primary btn-user btn-block">Masuk</button>
                                    </form>
                                    <hr>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="/sbadmin2/vendor/jquery/jquery.min.js"></script>
    <script src="/sbadmin2/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/sbadmin2/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="/sbadmin2/js/sb-admin-2.min.js"></script>

    <script>
        $(function() {
            $('.form-login').submit(function(e) {
                e.preventDefault();

                const email = $('.email').val();
                const password = $('.password').val();
                const csrf_token = $('meta[name="csrf-token"]').attr('content');

                $.ajax({
                    url: '/login',
                    type: 'POST',
                    data: {
                        email: email,
                        password: password,
                        _token: csrf_token
                    },
                    success: function(data) {
                        if (!data.success) {
                            alert(data.message);
                        } else {
                            localStorage.setItem('token', data.token);
                            window.location.href = '/dashboard';
                        }
                    }
                });
            });
        });
    </script>

</body>

</html>
