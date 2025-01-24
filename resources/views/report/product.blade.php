@extends('layout.app')

@section('title', 'Report Product')

@section('content')
    <div class="card shadow">
        <div class="card-header">
            <h4 class="card-title">Report Product</h4>
        </div>
        <div class="card-body">

            <div class="row mb-3">
                <div class="col-md-6">
                    <form method="GET" action="{{ route('report.product') }}">
                        <div class="form-group">
                            <label for="dari">Dari</label>
                            <input type="date" name="dari" id="dari" class="form-control"
                                value="{{ request()->input('dari') }}">
                        </div>
                        <div class="form-group">
                            <label for="sampai">Sampai</label>
                            <input type="date" name="sampai" id="sampai" class="form-control"
                                value="{{ request()->input('sampai') }}">
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block">Submit</button>
                        </div>
                    </form>
                </div>
                <div class="col-md-6 text-right">
                    <button id="printButton" class="btn btn-success btn-block">Cetak</button>
                </div>
            </div>

            @if (request()->input('dari') && request()->input('sampai'))
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped" id="reportTable">
                        <thead class="thead-dark">
                            <tr>
                                <th>No</th>
                                <th>Nama Produk</th>
                                <th>Harga</th>
                                <th>QTY</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Data will be populated here via AJAX -->
                        </tbody>
                        <tfoot id="totalRow" style="display: none;">
                            <tr>
                                <td colspan="4" class="text-right"><strong>Total:</strong></td>
                                <td id="totalPendapatan">0</td>
                            </tr>
                        </tfoot>
                    </table>

                    <div id="noDataMessage" style="display:none;" class="alert alert-warning">
                        Tidak ada data untuk periode yang dipilih.
                    </div>
                </div>
            @endif
        </div>
    </div>
@endsection

@push('js')
    <script>
        $(function() {
            const dari = '{{ request()->input('dari') }}';
            const sampai = '{{ request()->input('sampai') }}';

            function rupiah(angka) {
                if (angka === undefined || angka === null) return 'Rp 0'; // Default check for undefined or null
                return 'Rp ' + angka.toLocaleString('id-ID'); // Format dengan pemisah ribuan
            }

            if (dari && sampai) {
                $.ajax({
                    url: `/api/product-reports?dari=${dari}&sampai=${sampai}`,
                    success: function(response) {
                        let rows = '';
                        let totalPendapatan = 0;

                        if (response.data.length === 0) {
                            $('#noDataMessage').show();
                            $('#totalRow').hide();
                        } else {
                            $('#noDataMessage').hide();
                            response.data.forEach(function(val, index) {
                                let total = val.harga * val
                                    .qty; // Gunakan harga yang sudah dikirim
                                rows += `
                                    <tr>
                                        <td>${index + 1}</td>
                                        <td>${val.nama_produk}</td>
                                        <td>${rupiah(val.harga)}</td>
                                        <td>${val.qty}</td>
                                        <td>${rupiah(total)}</td>
                                    </tr>`;
                                totalPendapatan += total;
                            });
                            $('tbody').html(rows);
                            $('#totalPendapatan').text(rupiah(totalPendapatan));
                            $('#totalRow').show();
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('Error: ', error);
                        alert('Gagal mengambil data. Silakan coba lagi.');
                    }
                });
            }

            $('#printButton').click(function() {
                const printWindow = window.open('', '_blank', 'width=800,height=600');
                printWindow.document.write(`
                    <html>
                        <head>
                            <title>Cetak Report Product</title>
                            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
                        </head>
                        <body>
                            <h1 class="text-center">Report Product</h1>
                            <div class="table-responsive">
                                ${$('#reportTable').prop('outerHTML')}
                            </div>
                        </body>
                    </html>
                `);
                printWindow.document.close();
                printWindow.print();
            });
        });
    </script>
@endpush
