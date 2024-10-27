@extends('layout.home')

@section('title', 'FAQ')

@section('content')
    <!-- FAQ -->
    <section class="section-wrap faq">
        <div class="container">
            <div class="row">

                <div class="col-sm-9">
                    <h2 class="mb-20"><small>Pertanyaan pengiriman</small></h2>

                    <div class="panel-group accordion mb-50" id="accordion-1">
                        <div class="panel">
                            <div class="panel-heading">
                                <a data-toggle="collapse" data-parent="#accordion-1" href="#collapse-1"
                                    class="minus">Bagaimana cara
                                    melacak pengiriman saya?<span>&nbsp;</span>
                                </a>
                            </div>
                            <div id="collapse-1" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    <p>Untuk melacak pengiriman anda, langkah pertama adalah menggunakan nomor resi yang telah tersedia. Nomor resi dapat dilihat di detail pesanan setelah proses pengemasan selesai.</p>
                                    <p>Setelah mendapatkan nomor resi, anda dapat menggunakan aplikasi pihak ketiga atau situs web resmi jasa pengiriman untuk melakukan pelacakan.</p>
                                    <p>Anda dapat memantau secara berkala informasi pengiriman pesanan anda. Jika anda mengalami kesulitan,hubungi admin di kontak informas.Terima Kasih</p>
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
                                    <p>Nomor pelacakan atau resi pengiriman akan tersedia setelah pesanan anda melewati tahap pengemasan.Proses ini memastikan bahwa barang anda siap untuk dikirim.</p>
                                    <p>Setelah pesanan dikemas, admin akan memasukkan nomor resi yang terkait dengan pengiriman.Anda dapat menemukan nomor resi tersebut dengan mengakses detail pesanan dibagian riwayat pesanan anda.<p>
                                    <p>Pastikan anda memeriksa secara berkala status pengiriman barang anda.Jika ada pertanyaan lebih lanjut, bisa menghubungi admin di kontak informasi.Terima Kasih.</p>
                                </div>
                            </div>
                        </div>

                    </div> <!-- end accordion -->


                    <h2 class="mb-20 mt-80"><small>Pertanyaan Pembayaran & order</small></h2>
                    <div class="panel-group accordion mb-50" id="accordion-2">
                        <div class="panel">
                            <div class="panel-heading">
                                <a data-toggle="collapse" data-parent="#accordion-2" href="#collapse-4"
                                    class="minus">
                                    metode pembayaran apa yang Anda terima?<span>&nbsp;</span>
                                </a>
                            </div>
                            <div id="collapse-4" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    <p>Toko kami menerima pembayaran melalui transfer bank. Anda dapat menggunakan Bank BCA atau Bank BRI untuk menyelesaikan transaksi.</p>
                                    <p>Informasi detail rekening akan disediakan setelah Anda menyelesaikan pemesanan.</p>
                                </div>
                            </div>
                        </div>

                        <div class="panel">
                            <div class="panel-heading">
                                <a data-toggle="collapse" data-parent="#accordion-2" href="#collapse-5" class="plus">
                                    Bagaimana cara saya melakukan order?<span>&nbsp;</span>
                                </a>
                            </div>
                            <div id="collapse-5" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <p>Untuk melakukan pemesanan produk, silakan masuk ke menu <strong>Toko</strong> dan pilih produk yang ingin dipesan.</p>
                
                                    <p>Jika produk yang Anda pilih memerlukan desain, terdapat dua opsi yang bisa Anda lakukan:</p>
                                    <ol>
                                        <li><strong>Unggah Desain</strong>: Pilih opsi ini jika Anda sudah memiliki desain siap cetak.</li>
                                        <li><strong>Tambah Jasa Desain</strong>: Pilih opsi ini jika Anda belum memiliki desain, dan Anda dapat menambahkan jasa desain ke dalam pesanan Anda.</li>
                                    </ol>

                                    <p>Untuk produk yang tidak memerlukan desain, Anda dapat langsung menambahkannya ke dalam keranjang. Setelah itu, selesaikan pesanan dan lakukan pembayaran.</p>

                                    <p>Setelah pesanan berhasil di-*checkout*, Anda dapat memantau status pesanan melalui menu <strong>Riwayat Pembayaran</strong> dan <strong>Riwayat Pesanan</strong> pada menu profil Anda.</p>
                                </div>
                            </div>
                        </div>
                        
                    </div> <!-- end accordion -->

                </div> <!-- end col -->

            </div>
        </div>
    </section> <!-- end faq -->
@endsection
