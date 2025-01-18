@extends('layout.home')

@section('title', 'About')

@section('content')
    <!-- Intro -->
    <section class="section-wrap intro pb-0">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 mb-50">
                    <h2 class="intro-heading">About Our Shop</h2>
                    <p style="white-space: pre-line;">{{ $about->deskripsi }}</p>
                </div>

                <div class="col-md-3 col-md-offset-1 col-sm-5 mb-40">
                    <div class="contact-item">
                        <h6>Address</h6>
                        <address>
                            {{ $about->judul_website }}<br>
                            {!! nl2br(e($about->alamat)) !!}
                        </address>
                    </div> <!-- end address -->

                    <div class="contact-item">
                        <h6>Information</h6>
                        <ul>
                            <li>
                                <i class="fa fa-envelope"></i><a href="mailto:{{ $about->email }}">{{ $about->email }}</a>
                            </li>
                            <li>
                                <i class="fa fa-phone"></i>
                                @if($about->telepon)
                                    @foreach(explode("\n", $about->telepon) as $telepon)
                                        <span>{{ $telepon }}</span><br>
                                    @endforeach
                                @endif
                                <!-- <i class="fa fa-phone"></i><span>{{ $about->telepon }}</span> -->
                            </li>
                        </ul>
                    </div> <!-- end information -->

                </div>
                <hr class="mb-0">
            </div>
    </section> <!-- end intro -->



@endsection
