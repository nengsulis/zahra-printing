<?php

namespace App\Http\Controllers;

use DB;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Payment;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

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

    public function getReportData(Request $request)
    {
        $dari = $request->input('dari');
        $sampai = $request->input('sampai');

        // Menyiapkan query untuk OrderDetail
        $query = OrderDetail::with('product');

        // Menambahkan filter tanggal jika ada input dari dan sampai
        if ($dari && $sampai) {
            $query->filterDate($dari, $sampai);
        }

        // Menambahkan join dengan tabel products untuk mendapatkan harga produk
        $data = $query->join('products', 'order_details.id_produk', '=', 'products.id')
            ->selectRaw('products.nama_produk, products.harga, SUM(order_details.jumlah) as total_qty, SUM(products.harga * order_details.jumlah) as total_revenue')
            ->groupBy('products.id', 'products.harga', 'products.nama_produk') // Menyesuaikan dengan kolom yang digunakan
            ->orderByDesc('total_qty')
            ->get()
            ->map(function ($item) {
                return [
                    'nama_produk' => $item->nama_produk ?? 'Unknown', // Nama produk dari tabel products
                    'harga' => $item->harga ?? 0, // Pastikan harga tidak null
                    'qty' => $item->total_qty ?? 0, // Pastikan qty tidak null
                    'total' => $item->total_revenue ?? 0, // Pastikan total revenue tidak null
                ];
            });

        return response()->json(['data' => $data]);
    }



    public function rekap_product()
    {
        return view('report.product');
    }
}
