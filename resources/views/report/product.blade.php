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
                        <div class="row">
                            <div class="col form-group">
                                <label for="dari">Dari</label>
                                <input type="date" name="dari" id="dari" class="form-control"
                                    value="{{ request()->input('dari') }}">
                            </div>
                            <div class="col form-group">
                                <label for="sampai">Sampai</label>
                                <input type="date" name="sampai" id="sampai" class="form-control"
                                    value="{{ request()->input('sampai') }}">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label for="jenis_bahan">Jenis Bahan</label>
                                    <select name="jenis_bahan" class="form-control" id="jenis_bahan">
                                        @foreach ($jenisBahan as $bahan)
                                            <option value="{{ $bahan->bahan }}"
                                                {{ request()->input('jenis_bahan') == $bahan->bahan ? 'selected' : '' }}>
                                                {{ $bahan->bahan }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label for="gramasi">Gramasi</label>
                                    <select name="gramasi" class="form-control" id="gramasi">
                                        @foreach ($gramasi as $g)
                                            <option value="{{ $g->gsm }}"
                                                {{ request()->input('gramasi') == $g->gsm ? 'selected' : '' }}>
                                                {{ $g->gsm }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="jenis_layanan">Jenis Layanan</label>
                            <select name="jenis_layanan" class="form-control" id="jenis_layanan">
                                @foreach ($subCategory as $jenisLayanan)
                                    <option value="{{ $jenisLayanan->id }}"
                                        {{ request()->input('jenis_layanan') == $jenisLayanan->id ? 'selected' : '' }}>
                                        {{ $jenisLayanan->nama_subkategori }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="is_need_design">Jasa</label>
                            <select name="is_need_design" class="form-control" id="is_need_design">
                                <option value="1" {{ request()->input('is_need_design') == '1' ? 'selected' : '' }}>
                                    Desain
                                </option>
                                <option value="0" {{ request()->input('is_need_design') == '0' ? 'selected' : '' }}>
                                    Tidak Desain
                                </option>
                            </select>
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
                                <th>Size</th>
                                <th>QTY</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Data akan di-populate via AJAX -->
                        </tbody>
                        <tfoot id="totalRow" style="display: none;">
                            <tr>
                                <td colspan="3" class="text-right"><strong>Total:</strong></td>
                                <td id="totalSize">0</td>
                                <td id="totalQty">0</td>
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
            const jenisBahan = '{{ request()->input('jenis_bahan') }}';
            const gramasi = '{{ request()->input('gramasi') }}';
            const jenisLayanan = '{{ request()->input('jenis_layanan') }}';
            const isNeedDesign = '{{ request()->input('is_need_design') }}';

            function rupiah(angka) {
                if (angka === undefined || angka === null) return 'Rp 0';
                return 'Rp ' + Number(angka).toLocaleString('id-ID');
            }

            // Fungsi hitungSize() tetap disini jika dibutuhkan,
            // namun saat ini nilai size sudah dikalkulasi di sisi server.
            function hitungSize(size) {
                try {
                    return eval(size);
                } catch (e) {
                    return 0;
                }
            }

            if (dari && sampai) {
                $.ajax({
                    url: '/api/product-reports?' +
                        'dari=' + encodeURIComponent(dari) +
                        '&sampai=' + encodeURIComponent(sampai) +
                        '&jenis_bahan=' + encodeURIComponent(jenisBahan) +
                        '&gramasi=' + encodeURIComponent(gramasi) +
                        '&jenis_layanan=' + encodeURIComponent(jenisLayanan) +
                        '&is_need_design=' + encodeURIComponent(isNeedDesign),
                    success: function(response) {
                        console.log(response); // Untuk debugging

                        if (Array.isArray(response.data)) {
                            let rows = '';
                            let totalPendapatan = 0;
                            let totalSize = 0;
                            let totalQty = 0;

                            if (response.data.length === 0) {
                                $('#noDataMessage').show();
                                $('#totalRow').hide();
                            } else {
                                $('#noDataMessage').hide();
                                response.data.forEach(function(val, index) {
                                    // Perhitungan total bisa diambil dari data server jika tersedia
                                    let total = val.harga * val.qty;
                                    rows += `
                                        <tr>
                                            <td>${index + 1}</td>
                                            <td>${val.nama_produk}</td>
                                            <td>${rupiah(val.harga)}</td>
                                            <td>${val.size}</td>
                                            <td>${val.qty}</td>
                                            <td>${rupiah(total)}</td>
                                        </tr>`;
                                    totalPendapatan += total;
                                    totalSize += Number(val.size);
                                    totalQty += Number(val.qty);
                                });

                                $('#reportTable tbody').html(rows);
                                $('#totalPendapatan').text(rupiah(totalPendapatan));
                                $('#totalSize').text(totalSize);
                                $('#totalQty').text(totalQty);
                                $('#totalRow').show();
                            }
                        } else {
                            console.error('response.data bukan array:', response.data);
                            alert(
                                'Gagal memuat data. Pastikan server mengirimkan data dalam format yang benar.');
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
