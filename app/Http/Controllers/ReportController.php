<?php

namespace App\Http\Controllers;

use DB;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Payment;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Subcategory;

class ReportController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth')->only(['index']);
        $this->middleware('auth:api')->only(['get_reports']);
    }

    public function get_reports(Request $request)
    {
        $report = DB::table('order_details')
            ->join('products', 'products.id', '=', 'order_details.id_produk')
            ->select(DB::raw('
                nama_produk,
                count(*) as jumlah_pembelian, 
                harga,
                SUM(total) as total_pendapatan, 
                SUM(jumlah) as total_qty'))
            ->whereRaw("date(order_details.created_at) >= '$request->dari'")
            ->whereRaw("date(order_details.created_at) <= '$request->sampai'")
            ->groupBy('id_produk', 'nama_produk', 'harga')
            ->get();

        return response()->json([
            'data' => $report
        ]);
    }

    public function invoice_reports(Request $request)
    {
        // Mengambil laporan berdasarkan tanggal
        $report = Order::with('Member', 'Payment')
            ->whereBetween('created_at', [$request->dari, $request->sampai])
            ->get();

        // Menghitung total nilai order selesai
        $orderSelesai = Order::with('Payment')
            ->where('status', 'Selesai')
            ->whereBetween('created_at', [$request->dari, $request->sampai])
            ->get();

        // Menghitung total grand_total dan charge dari order yang selesai
        $totalOrderSelesai = $orderSelesai->sum(function ($order) {
            return $order->grand_total + $order->charge;
        });

        // Menghitung total nilai order belum selesai
        $orderBelumSelesai = Order::with('Payment')
            ->where('status', '!=', 'Selesai')
            ->whereBetween('created_at', [$request->dari, $request->sampai])
            ->get();

        // Menghitung total grand_total dan charge dari order yang belum selesai
        $totalOrderBelumSelesai = $orderBelumSelesai->sum(function ($order) {
            return $order->grand_total + $order->charge;
        });

        // Menghitung total nilai pembayaran yang belum diproses
        $pendingPayments = Payment::where('status', 'MENUNGGU')->sum('jumlah');

        // Menghitung total nilai pembayaran yang sudah selesai
        $completedPayments = Payment::where('status', 'DITERIMA')->sum('jumlah');

        // Menghitung total pendapatan bersih dari pembayaran yang selesai
        $netIncome = Payment::where('status', 'DITERIMA')->sum('jumlah');

        // Menghitung jumlah total semua pembayaran
        $totalPayments = Payment::sum('jumlah');

        return response()->json([
            'data' => $report,
            'total_order_selesai' => $totalOrderSelesai,
            'total_order_belum_selesai' => $totalOrderBelumSelesai,
            'pending_payments' => $pendingPayments,
            'completed_payments' => $completedPayments,
            'net_income' => $netIncome,
            'total_payments' => $totalPayments, // Total jumlah semua pembayaran
        ]);
    }



    public function index()
    {
        return view('report.index');
    }

    public function fetchReports(Request $request)
    {
        // Jika input tanggal tidak disediakan, gunakan awal dan akhir bulan saat ini.
        $dari = $request->input('dari', Carbon::now()->startOfMonth()->format('Y-m-d'));
        $sampai = $request->input('sampai', Carbon::now()->endOfMonth()->format('Y-m-d'));

        $reports = OrderDetail::filterDate($dari, $sampai)
            ->selectRaw('product_name, price, SUM(qty) as qty, SUM(price * qty) as total')
            ->groupBy('product_name', 'price')
            ->get();

        return response()->json([
            'data' => $reports
        ]);
    }

    /**
     * Mengambil data laporan berdasarkan filter tertentu dan mengkalkulasi nilai size.
     */
    public function getReportData(Request $request)
    {
        // Ambil input dari request
        $dari = $request->input('dari');
        $sampai = $request->input('sampai');
        $jenisBahan = $request->input('jenis_bahan');
        $gramasi = $request->input('gramasi');
        $jenisLayanan = $request->input('jenis_layanan');
        $is_need_design = $request->input('is_need_design'); // Perbaikan: gunakan 'is_need_design' bukan 'jis_need_design'

        // Mulai query OrderDetail
        $query = OrderDetail::query();

        // Filter berdasarkan tanggal jika tersedia
        if ($dari && $sampai) {
            $query->whereBetween('order_details.created_at', [$dari, $sampai]);
        }

        // Filter berdasarkan jenis bahan (misal: bahan pada produk)
        if ($jenisBahan) {
            $query->whereHas('product', function ($q) use ($jenisBahan) {
                $q->where('bahan', $jenisBahan);
            });
        }

        // Filter berdasarkan gramasi
        if ($gramasi) {
            $query->whereHas('product', function ($q) use ($gramasi) {
                $q->where('gsm', $gramasi);
            });
        }

        // Filter berdasarkan jenis layanan melalui relasi subCategory
        if ($jenisLayanan) {
            $query->whereHas('product.subCategory', function ($q) use ($jenisLayanan) {
                $q->where('id', $jenisLayanan);
            });
        }

        // Filter berdasarkan kebutuhan desain jika nilai diberikan (bisa 0/1)
        if (!is_null($is_need_design)) {
            $query->where('is_need_design', $is_need_design);
        }

        try {
            /**
             * Karena kolom "size" menyimpan ekspresi (contoh: "60*160"), 
             * kita tidak dapat langsung menggunakan SUM() untuk menghitung total size.
             * Oleh karena itu, gunakan GROUP_CONCAT untuk mengumpulkan semua nilai size per produk,
             * kemudian proses perhitungannya di PHP.
             */
            $data = $query->join('products', 'order_details.id_produk', '=', 'products.id')
                ->selectRaw('
                    products.id as product_id,
                    products.nama_produk,
                    products.harga,
                    SUM(order_details.jumlah) as total_qty,
                    GROUP_CONCAT(order_details.size) as sizes,
                    SUM(products.harga * order_details.jumlah) as total_revenue
                ')
                ->groupBy('products.id', 'products.harga', 'products.nama_produk')
                ->orderByDesc('total_qty')
                ->get();

            // Proses masing-masing record untuk menghitung total size secara akumulatif
            $processedData = $data->map(function ($item) {
                $totalSize = 0;
                // Pecah string sizes berdasarkan koma (asumsi separatornya koma)
                $sizeExpressions = explode(',', $item->sizes);

                foreach ($sizeExpressions as $expr) {
                    try {
                        $totalSize += $this->calculateSize(trim($expr));
                    } catch (\Exception $e) {
                        // Jika ekspresi tidak valid, bisa di-log atau dilewati
                        // Di sini, kita lewati ekspresi yang bermasalah
                        continue;
                    }
                }

                return [
                    'nama_produk' => $item->nama_produk ?? 'Unknown',
                    'harga'       => $item->harga ?? 0,
                    'qty'         => $item->total_qty ?? 0,
                    'size'        => $totalSize,
                    'total'       => $item->total_revenue ?? 0,
                ];
            });

            return response()->json(['data' => $processedData]);
        } catch (\Exception $e) {
            // Tangani error jika query atau proses mapping gagal
            return response()->json(['error' => 'Error fetching data: ' . $e->getMessage()], 500);
        }
    }

    /**
     * Fungsi untuk menghitung ekspresi matematika di dalam string (misal: "60*160" atau "60/2")
     *
     * @param string $size
     * @return float|int
     * @throws \Exception
     */
    public function calculateSize($size)
    {
        // Hapus spasi ekstra
        $size = trim($size);

        // Cek ekspresi perkalian (contoh: "60*160")
        if (preg_match('/^(\d+)\s*\*\s*(\d+)$/', $size, $matches)) {
            return $matches[1] * $matches[2];
        }

        // Cek ekspresi pembagian (contoh: "60/2")
        if (preg_match('/^(\d+)\s*\/\s*(\d+)$/', $size, $matches)) {
            if ($matches[2] == 0) {
                throw new \Exception("Division by zero in size expression: " . $size);
            }
            return $matches[1] / $matches[2];
        }

        // Jika ekspresi tidak valid, lempar exception
        throw new \Exception("Invalid size expression: " . $size);
    }











    public function rekap_product()
    {
        $jenisBahan = OrderDetail::select('bahan')->distinct()->get();
        $gramasi = OrderDetail::select('gsm')->distinct()->get();
        $subCategory = Subcategory::select('id', 'nama_subkategori')->get();
        return view('report.product', compact('jenisBahan', 'gramasi', 'subCategory'));
    }
}
