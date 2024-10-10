@extends('layout.home')

@section('title', 'Orders')

@section('content')
    <section class="section-wrap orders">
        <div class="container relative">
            <div class="row">

                <div class="ecommerce col-xs-12">
                    <h2>Pembayaran Saya</h2>
                    <table class="table table-ordered table-hover table-striped">
                        <thead>
                            <th>No</th>
                            <th>Tanggal Pesan</th>
                            <th>Nominal Transfer</th>
                            <th>Status</th>
                        </thead>
                        <tbody>
                            @foreach ($payments as $index => $payment)
                                <tr>
                                    <td>{{ $index + 1 + ($payments->currentPage() - 1) * $payments->perPage() }}</td>
                                    <td>{{ $payment->created_at }}</td>
                                    <td>Rp. {{ number_format($payment->jumlah) }}</td>
                                    <td>{{ $payment->status }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>

                    <!-- Pagination for payments -->
                    <div class="pagination-wrapper">
                        {{ $payments->links() }}
                    </div>

                    <h2>Pesanan Saya</h2>
                    <table class="table table-ordered table-hover table-striped">
                        <thead>
                            <th>No</th>
                            <th>Tanggal Pesan</th>
                            <th>Total Keseluruhan</th>
                            <th>Status</th>
                            <th>Aksi</th>
                        </thead>
                        <tbody>
                            @foreach ($orders as $index => $order)
                                <tr>
                                    <td>{{ $index + 1 + ($orders->currentPage() - 1) * $orders->perPage() }}</td>
                                    <td>{{ $order->created_at }}</td>
                                    <td>Rp. {{ number_format($order->grand_total) }}</td>
                                    <td>{{ $order->status }}</td>
                                    <td>
                                        <a href="/orders/detail/{{ $order->id }}"
                                            style="background-color: red; padding-left:24px; padding-right:25px"
                                            class="btn btn-succes">Detail</a>
                                        <form action="/pesanan_selesai/{{ $order->id }}" method="POST">
                                            @csrf
                                            <button type="submit" class="btn btn-succes">SELESAI</button>
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>

                    <!-- Pagination for orders -->
                    <div class="pagination-wrapper">
                        {{ $orders->links() }}
                    </div>

                </div> <!-- end ecommerce -->

            </div> <!-- end row -->
        </div> <!-- end container -->
    </section> <!-- end orders -->
@endsection
