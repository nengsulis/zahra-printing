@extends('layout.home')

@section('title', 'FAQ')

@section('content')
    <!-- FAQ -->
    <section class="section-wrap faq">
        <div class="container">
            <div class="row">

                <div class="col-sm-9">
                    <h2 class="mb-20"><small>pertanyaan pengiriman</small></h2>

                    <div class="panel-group accordion mb-50" id="accordion-1">
                        <div class="panel">
                            <div class="panel-heading">
                                <a data-toggle="collapse" data-parent="#accordion-1" href="#collapse-1"
                                    class="minus">bagaimana cara
                                    melacak pengiriman saya?<span>&nbsp;</span>
                                </a>
                            </div>
                            <div id="collapse-1" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    Untuk melacak pengiriman anda, langkah pertama adalah menggunakan nomor resi yang telah tersedia. Nomor resi dapat dilihat di detail pesanan setelah proses pengemasan selesai.
                                    Setelah mendapatkan nomor resi, anda dapat menggunakan aplikasi pihak ketiga atau situs web resmi jasa pengiriman untuk melakukan pelacakan.
                                    Dengan cara ini, anda dapat memantau secara berkala informasi pengiriman pesanan anda.

                                    jika anda mengalami kesulitan, jangan ragu untuk menghubungi kami. Terima Kasih 
                                </div>
                            </div>
                        </div>

                        <div class="panel">
                            <div class="panel-heading">
                                <a data-toggle="collapse" data-parent="#accordion-1" href="#collapse-2" class="plus">di
                                    mana
                                    saya bisa menemukan nomor pelacakan?<span>&nbsp;</span>
                                </a>
                            </div>
                            <div id="collapse-2" class="panel-collapse collapse">
                                <div class="panel-body">
                                    Nomor pelacakan atau resi pengiriman akan tersedia setelah pesanan anda melewati tahap pengemasan.Proses ini memastikan bahwa barang anda siap untuk dikirim.
                                    Setelah pesanan dikemas, admin akan memasukkan nomor resi yang terkait dengan pengiriman. Anda dapat menemukan nomor resi tersebut dengan mengakses detail pesanan dibagian riwayat pesanan anda.
                                    Pastikan anda memeriksa secara berkala status pengiriman barang anda. Jika ada pertanyaan lebih lanjut, bisa menghubungi admin di kontak informasi.
                                    Terima Kasih.
                                </div>
                            </div>
                        </div>


                    </div> <!-- end accordion -->


                    <h2 class="mb-20 mt-80"><small>pertanyaan pembayaran</small></h2>

                    <div class="panel-group accordion mb-50" id="accordion-2">
                        <div class="panel">
                            <div class="panel-heading">
                                <a data-toggle="collapse" data-parent="#accordion-2" href="#collapse-4"
                                    class="minus">metode
                                    pembayaran apa yang Anda terima?<span>&nbsp;</span>
                                </a>
                            </div>
                            <div id="collapse-4" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    Toko kami menerima pembayaran melalui transfer bank. Anda dapat menggunakan Bank BCA atau Bank BRI untuk menyelesaikan transaksi. 
                                    Informasi detail rekening akan disediakan setelah Anda menyelesaikan pemesanan.
                                </div>
                            </div>
                        </div>



                    </div> <!-- end accordion -->

                </div> <!-- end col -->

            </div>
        </div>
    </section> <!-- end faq -->
@endsection
