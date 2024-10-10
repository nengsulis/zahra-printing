@extends('layout.app')

@section('title', 'Report Pesanan')

@section('content')
    <div class="card shadow">
        <div class="card-header">
            <h4 class="card-title">Report Pesanan</h4>
        </div>
        <div class="card-body">

            <div class="row mb-3">
                <div class="col-md-6">
                    <form>
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
                                <th>Tanggal</th>
                                <th>No Invoice</th>
                                <th>Nama Member</th>
                                <th>Nominal Order</th>
                                <th>Nominal Charge</th>
                                <th>Total Pendapatan</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                        <tfoot id="totalRow" style="display: none;">
                            <tr>
                                <td colspan="6" class="text-right"><strong>Total Order Belum Selesai:</strong></td>
                                <td id="totalorderbelumSelesai">0</td>
                            </tr>
                            <tr>
                                <td colspan="6" class="text-right"><strong>Total Order Selesai:</strong></td>
                                <td id="totalorderSelesai">0</td>
                            </tr>
                            <tr>
                                <td colspan="6" class="text-right"><strong>Total Order:</strong></td>
                                <td id="totalPendapatan">0</td>
                            </tr>
                            <tr>
                                <td colspan="6" class="text-right"><strong>Pembayaran Belum Selesai:</strong></td>
                                <td id="pendingPayments">0</td>
                            </tr>
                            <tr>
                                <td colspan="6" class="text-right"><strong>Pembayaran Selesai:</strong></td>
                                <td id="completedPayments">0</td>
                            </tr>
                            <tr>
                                <td colspan="6" class="text-right"><strong>Total Pembayaran:</strong></td>
                                <td id="totalPayments">0</td>
                            </tr>
                            <tr>
                                <td colspan="6" class="text-right"><strong>Pendapatan Bersih:</strong></td>
                                <td id="netIncome">0</td>
                            </tr>
                        </tfoot>
                    </table>
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
                const format = angka.toString().split('').reverse().join('');
                const convert = format.match(/\d{1,3}/g);
                return 'Rp ' + convert.join('.').split('').reverse().join('');
            }

            const token = localStorage.getItem('token');
            if (dari && sampai) {
                console.log(`Fetching data from API with dari: ${dari} and sampai: ${sampai}`);
                $.ajax({
                    url: `/api/reports?dari=${dari}&sampai=${sampai}`,
                    headers: {
                        "Authorization": "Bearer " + token
                    },
                    success: function(response) {
                        const data = response.data;
                        console.log('Data received:', data); // Log data yang diterima

                        let row = ''; // Inisialisasi row sebagai string
                        let totalPendapatan = 0;

                        data.forEach(function(val, index) {
                            const totalOrder = val.grand_total + val.charge;
                            row += `
                            <tr>
                                <td>${index + 1}</td>
                                <td>${new Date(val.created_at).toLocaleDateString('id-ID')}</td> <!-- Corrected date format -->
                                <td>${val.invoice}</td>
                                <td>${val.member.nama_member}</td>
                                <td>${rupiah(val.grand_total)}</td>
                                <td>${rupiah(val.charge)}</td> 
                                <td>${rupiah(totalOrder)}</td>
                            </tr>
                            `;
                            totalPendapatan += totalOrder;
                        });
                        $('tbody').append(row); // Tambahkan row ke tbody

                        // Update total pendapatan dan status pembayaran di tabel
                        $('#totalorderSelesai').text(rupiah(response.total_order_selesai));
                        $('#totalorderbelumSelesai').text(rupiah(response.total_order_belum_selesai));
                        $('#totalPendapatan').text(rupiah(totalPendapatan));
                        $('#pendingPayments').text(rupiah(response.pending_payments));
                        $('#completedPayments').text(rupiah(response.completed_payments));
                        $('#netIncome').text(rupiah(response.net_income));
                        $('#totalPayments').text(rupiah(response.total_payments));

                        // Tampilkan baris total hanya pada halaman terakhir
                        $('#totalRow').show();
                    },
                    error: function(xhr) {
                        console.error('Error fetching data:', xhr.responseText); // Log kesalahan
                        alert(
                            'Gagal mengambil data. Silakan coba lagi.'
                        ); // Notifikasi kesalahan kepada pengguna
                    }
                });
            } else {
                console.warn('Tanggal tidak valid.'); // Log peringatan jika tanggal tidak valid
            }

            // Fungsi untuk mencetak tabel
            $('#printButton').click(function() {
                const printWindow = window.open('', '_blank', 'width=800,height=600');
                printWindow.document.write(`
                    <html>
                        <head>
                            <title>Cetak Report Pesanan</title>
                            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
                       <style>
    @media print {
        #totalRow {
            display: table-row-group; /* Tampilkan saat mencetak */
        }
    }
        .total-row {
        background-color: #f2f2f2; /* Warna latar belakang untuk baris total */
    }
    .alternate-row {
        background-color: #e6e6e6; /* Warna latar belakang untuk baris alternatif */
    }

    @media print {
        #totalRow {
            display: table-row-group; /* Tampilkan saat mencetak */
        }
        .total-row,
        .alternate-row {
            background-color: inherit; /* Pastikan warna tetap saat mencetak */
        }
    }
</style>
                        </head>
                        <body>
                            <h1 class="text-center">Report Pesanan</h1>
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
