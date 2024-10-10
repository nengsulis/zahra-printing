@extends('layout.app')

@section('title', 'Dashboard')
@section('content')
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="card text-white bg-primary mb-3" style="max-width: 18rem;">
                    <div class="card-header bg-primary">Order</div>
                    <div class="card-body">
                        <h5 class="card-title">Jumlah Order</h5>
                        <p class="card-text">
                        <div class="row">
                            <div class="col">Orders Baru</div>
                            <div class="col-3">{{ $orders_baru }}</div>
                        </div>
                        <div class="row">
                            <div class="col">Orders Dikonfirmasi</div>
                            <div class="col-3">{{ $orders_dikonfirmasi }}</div>
                        </div>
                        <div class="row">
                            <div class="col">Orders Dikemas</div>
                            <div class="col-3">{{ $orders_dikemas }}</div>
                        </div>
                        <div class="row">
                            <div class="col">Orders Dikirim</div>
                            <div class="col-3">{{ $orders_dikirim }}</div>
                        </div>
                        <div class="row">
                            <div class="col">Orders Selesai</div>
                            <div class="col-3">{{ $orders_selesai }}</div>
                        </div>
                        </p>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card text-white bg-danger mb-3" style="max-width: 18rem;">
                    <div class="card-header bg-danger">Kebutuhan Desain</div>
                    <div class="card-body">
                        <h5 class="card-title">Jumlah Kebutuhan Desain</h5>
                        <p class="card-text">
                        <div class="row">
                            <div class="col">Perlu Desain</div>
                            <div class="col-3">{{ $need_desain }}</div>
                        </div>
                        <div class="row">
                            <div class="col">Tidak Perlu Desain</div>
                            <div class="col-3">{{ $no_desain }}</div>
                        </div>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card text-white bg-success mb-3" style="max-width: 18rem;">
                    <div class="card-header bg-success">Produk</div>
                    <div class="card-body">
                        <h5 class="card-title">Jumlah Produk</h5>
                        <p class="card-text">
                        <div class="row">
                            <div class="col">Kategori</div>
                            <div class="col-3">{{ $kategori }}</div>
                        </div>
                        <div class="row">
                            <div class="col">Sub Kategori</div>
                            <div class="col-3">{{ $sub_kategori }}</div>
                        </div>
                        <div class="row">
                            <div class="col">Produk</div>
                            <div class="col-3">{{ $produk }}</div>
                        </div>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card text-white bg-secondary mb-3" style="max-width: 18rem;">
                    <div class="card-header bg-secondary">User</div>
                    <div class="card-body">
                        <h5 class="card-title">Jumlah Pengguna</h5>
                        <p class="card-text">
                        <div class="row">
                            <div class="col">Admin</div>
                            <div class="col-3">{{ $admin }}</div>
                        </div>
                        <div class="row">
                            <div class="col">Member</div>
                            <div class="col-3">{{ $member }}</div>
                        </div>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
