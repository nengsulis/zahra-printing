<!DOCTYPE html>
<html lang="en">

<head>
    <title>@yield('title', 'Home')</title>

    <meta charset="utf-8">
    <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="">

    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700%7COpen+Sans:400,400i,600,700' rel='stylesheet'>

    <!-- Css -->

    <link rel="stylesheet" href="/front/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/front/css/magnific-popup.css" />
    <link rel="stylesheet" href="/front/css/font-icons.css" />
    <link rel="stylesheet" href="/front/css/sliders.css" />
    <link rel="stylesheet" href="/front/css/style.css" />

    <!-- Favicons -->
    <link rel="shortcut icon" href="/front/img/favicon.ico">
    <link rel="apple-touch-icon" href="/front/img/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/front/img/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/front/img/apple-touch-icon-114x114.png">

    <style>
        .grid-4 {
            display: grid;
            grid-template-columns: auto auto auto auto;
        }

        .grid-3 {
            display: grid;
            grid-template-columns: auto auto auto;
        }

        .grid-2 {
            display: grid;
            grid-template-columns: auto auto auto;
        }



        .col {
            border: 1px solid rgba(0, 0, 0, 0.8);


            text-align: left;
        }
    </style>

</head>

<body class="relative">

    <!-- Preloader -->
    <div class="loader-mask">
        <div class="loader">
            <div></div>
            <div></div>
        </div>
    </div>

    <main class="main-wrapper">

        <header class="nav-type-1">



            <nav class="navbar navbar-static-top">
                <div class="navigation" id="sticky-nav">
                    <div class="container relative">

                        <div class="row flex-parent">

                            <div class="navbar-header flex-child">
                                <!-- Logo -->
                                <div class="logo-container">
                                    <div class="logo-wrap">
                                        <a href="/">
                                            @php
                                                $about = App\Models\About::first();
                                            @endphp
                                            <img class="zp" src="/uploads/{{ $about->logo }}" alt="logo">
                                        </a>
                                    </div>
                                </div>
                                <button type="button" class="navbar-toggle" data-toggle="collapse"
                                    data-target="#navbar-collapse">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <!-- Mobile cart -->
                                <div class="nav-cart mobile-cart hidden-lg hidden-md">
                                    <div class="nav-cart-outer">
                                        <div class="nav-cart-inner">
                                            <a href="/front/#" class="nav-cart-icon">
                                                <span class="nav-cart-badge">2</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div> <!-- end navbar-header -->

                            <div class="nav-wrap flex-child">
                                <div class="collapse navbar-collapse text-center" id="navbar-collapse">

                                    <ul class="nav navbar-nav">

                                        <li class="dropdown">
                                            <a href="/">Beranda</a>
                                        </li>

                                        <li class="dropdown">
                                            <a href="/about">Tentang</a>
                                        </li>

                                        @php
                                            $categories = App\Models\Category::all();
                                        @endphp

                                        <li class="dropdown">
                                            <a href="#">Toko</a>
                                            <i class="fa fa-angle-down dropdown-trigger"></i>
                                            <ul class="dropdown-menu megamenu-wide">
                                                <li>
                                                    <div class="megamenu-wrap container">
                                                        <div class="row">
                                                            @foreach ($categories as $category)
                                                                <div class="col-md-3 megamenu-item">
                                                                    <ul class="menu-list">
                                                                        <li>
                                                                            <span>{{ $category->nama_kategori }}</span>
                                                                        </li>
                                                                        @php
                                                                            $subcategories = App\Models\Subcategory::where(
                                                                                'id_kategori',
                                                                                $category->id,
                                                                            )->get();
                                                                        @endphp
                                                                        @foreach ($subcategories as $subcategory)
                                                                            <li><a
                                                                                    href="/products/{{ $subcategory->id }}">{{ $subcategory->nama_subkategori }}</a>
                                                                            </li>
                                                                        @endforeach
                                                                    </ul>
                                                                </div>
                                                            @endforeach
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </li>

                                        <li class="dropdown">
                                            <a href="/faq">Pertanyaan</a>
                                        </li>

                                        {{-- <li class="dropdown">
                                            <a href="/contact">Testimoni</a>
                                        </li> --}}

                                        <!-- Mobile search -->
                                        <li id="mobile-search" class="hidden-lg hidden-md">
                                            <form method="get" class="mobile-search">
                                                <input type="search" class="form-control" placeholder="Search...">
                                                <button type="submit" class="search-button">
                                                    <i class="fa fa-search"></i>
                                                </button>
                                            </form>
                                        </li>

                                    </ul> <!-- end menu -->
                                </div> <!-- end collapse -->
                            </div> <!-- end col -->

                            <div class="flex-child flex-right nav-right hidden-sm hidden-xs">
                                <ul>
                                    <li class="nav-register">
                                        @if (Auth::guard('webmember')->check())
                                            <a href="/orders">{{ Auth::guard('webmember')->user()->nama_member }}</a>
                                        @else
                                            <a href="/login_member">Masuk</a>
                                        @endif
                                    </li>

                                    <li class="nav-cart">
                                        <div class="nav-cart-outer">
                                            <div class="nav-cart-inner">
                                                <a href="/cart" class="nav-cart-icon"></a>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="nav-register">
                                        @if (Auth::guard('webmember')->check())
                                            <a href="/logout_member">Keluar</a>
                                        @endif
                                    </li>
                                </ul>
                            </div>

                        </div> <!-- end row -->
                    </div> <!-- end container -->
                </div> <!-- end navigation -->
            </nav> <!-- end navbar -->
        </header>

        <div class="content-wrapper oh">

            @yield('content')

            <!-- Footer Type-1 -->
            <footer class="footer footer-type-1">
                <div class="container">
                    <div class="footer-widgets">
                        <div class="row">

                            <div class="col-md-3 col-sm-12 col-xs-12">
                                <div class="widget footer-about-us">
                                    <h5 class="widget-title bottom-line left-align grey">Zahra Printing</h5>
                                    <p class="mb-30">Zahra Printing.</p>
                                    <div class="footer-socials">
                                        <!-- <div class="social-icons nobase">
                                            <a href="/front/#"><i class="fa fa-twitter"></i></a>
                                            <a href="/front/#"><i class="fa fa-facebook"></i></a>
                                            <a href="/front/#"><i class="fa fa-google-plus"></i></a>
                                        </div> -->
                                    </div>
                                </div>
                            </div> <!-- end about us -->

                            <div class="col-md-2 col-md-offset-1 col-sm-6 col-xs-12">
                                <div class="widget footer-links">
                                    <h5 class="widget-title bottom-line left-align grey">Beranda</h5>
                                    <ul class="list-no-dividers">
                                        <li><a href="/">Lihat Selengkapnya</a></li>

                                    </ul>
                                </div>
                            </div>

                            <div class="col-md-2 col-sm-6 col-xs-12">
                                <div class="widget footer-links">
                                    <h5 class="widget-title bottom-line left-align grey">Tentang</h5>
                                    <ul class="list-no-dividers">
                                        <li><a href="/about">Lihat Selengkapnya</a></li>

                                    </ul>
                                </div>
                            </div>

                            <div class="col-md-2 col-sm-6 col-xs-12">
                                <div class="widget footer-links">
                                    <h5 class="widget-title bottom-line left-align grey">Pertanyaan</h5>
                                    <ul class="list-no-dividers">
                                        <li><a href="/faq">Lihat Selengkapnya</a></li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div> <!-- end container -->

                <div class="bottom-footer">
                    <div class="container">
                        <div class="row">

                            <div class="col-sm-6 copyright sm-text-center">
                                <span>
                                    &copy; 2024 Zahra Printing</a>
                                </span>
                            </div>



                        </div>
                    </div>
                </div> <!-- end bottom footer -->
            </footer> <!-- end footer -->

            <div id="back-to-top">
                <a href="#top"><i class="fa fa-angle-up"></i></a>
            </div>

        </div> <!-- end content wrapper -->
    </main> <!-- end main wrapper -->

    <!-- jQuery Scripts -->
    <script type="text/javascript" src="/front/js/jquery.min.js"></script>
    <script type="text/javascript" src="/front/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/front/js/plugins.js"></script>
    <script type="text/javascript" src="/front/js/scripts.js"></script>
    @stack('js')
</body>

</html>
