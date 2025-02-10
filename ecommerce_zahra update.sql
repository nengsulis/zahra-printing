-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Feb 2025 pada 05.25
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_zahra`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `about`
--

CREATE TABLE `about` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul_website` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telepon` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `atas_nama` varchar(255) NOT NULL,
  `no_rekening` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `about`
--

INSERT INTO `about` (`id`, `judul_website`, `logo`, `deskripsi`, `alamat`, `email`, `telepon`, `created_at`, `updated_at`, `atas_nama`, `no_rekening`) VALUES
(1, 'Zahra Printing', '17245591402.png', 'Zahra Printing hadir sejak tahun 2018 sebagai solusi percetakan yang berkualitas dan terpercaya. \r\nUntuk memenuhi berbagai kebutuhan anda, toko kami menawarkan layanan lengkap mulai dari jasa desain grafis, percetakan, fotocopy bisa dilayani di tempat kami. \r\nMulai dari roll banner, x banner, spanduk,kartu nama, id card, kebutuhan kantor, kebutuhan alat tulis, dan berbagai produk lainnya . \r\nDengan pelayanan yang terbaik  Zahra Printing siap mendukung kebutuhan cetak anda. \r\n\r\nZahra Printing memang solusi terbaik untuk kebutuhan desain dan cetak :)', 'Jl.Gading Raya No 86 Pisangan Timur\r\nPulogadung,  Jakarta Timur \r\nJam Operasional : \r\nSenin - Jumat: 06.30 - 23.00 \r\nSabtu-Minggu: 08.00 - 23.00', 'milafc84@gmail.com', '081398290684 - Muslim\r\n085855343008 - Mila', '2025-01-04 08:35:53', '2025-01-04 08:35:53', 'Muslimin', '1234-1234-1234-1234');

-- --------------------------------------------------------

--
-- Struktur dari tabel `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_member` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `jumlah` varchar(255) NOT NULL,
  `ukuran` varchar(255) NOT NULL,
  `is_need_design` int(11) NOT NULL DEFAULT 0,
  `total` int(11) NOT NULL,
  `is_checkout` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `carts`
--

INSERT INTO `carts` (`id`, `id_member`, `id_produk`, `file`, `note`, `jumlah`, `ukuran`, `is_need_design`, `total`, `is_checkout`, `created_at`, `updated_at`) VALUES
(126, 6, 61, 'uploads/p79YBjELge9JtlHwjbQF0tQhj2kXLlYVPIY2sB5U.jpg', NULL, '1', '60cm x 160 cm', 0, 175000, 1, '2025-01-04 08:39:08', '2025-01-28 05:16:55'),
(127, 6, 61, 'uploads/QxozV3b49vEsigLYt5iTnluGsVmoUwiVqeP1RTlB.jpg', NULL, '1', '60cm x 160 cm', 0, 175000, 1, '2025-01-07 22:04:30', '2025-01-28 05:16:55'),
(128, 6, 62, 'uploads/Vpr5J3Jpt8nEBNOarIBPKmOtxuYyamvRgtXQ6uAG.jpg', NULL, '1', '60cm x 160 cm', 0, 198000, 1, '2025-01-07 22:10:16', '2025-01-28 05:16:55'),
(129, 6, 63, 'uploads/EAaOZETJHfr3cyLvBCuRkl0KFyINukYfbIajmvbX.jpg', NULL, '1', '60cm x 160 cm', 0, 185000, 1, '2025-01-08 05:06:39', '2025-01-28 05:16:55'),
(130, 6, 63, 'uploads/eQacjkTjk26xEicKPK1I87CLmPpK3oAaBz2KldK9.jpg', NULL, '1', '60cm x 160 cm', 0, 185000, 1, '2025-01-08 05:37:15', '2025-01-28 05:16:55'),
(133, 6, 61, 'uploads/7WHDKA24vpAdIp6jcGXZsB2wdlgFhQtWDbD8K7Uj.jpg', NULL, '1', '60cm x 160 cm', 0, 175000, 1, '2025-01-17 02:20:11', '2025-01-28 05:16:55'),
(134, 6, 61, 'uploads/x9nzjESmKtNp2x9Qu5ahnXuKrXreSu0JsLIZlAEy.jpg', NULL, '1', '60cm x 160 cm', 0, 175000, 1, '2025-01-17 03:41:04', '2025-01-28 05:16:55'),
(135, 6, 89, 'uploads/nDkq2kV9kVc5q8POI3KrdCNl2u49KrwLn5toZ1r8.jpg', NULL, '5', '3*3', 0, 75000, 1, '2025-01-24 01:52:14', '2025-01-28 05:16:55'),
(136, 6, 95, 'uploads/UkDbabB2OksITsAZXiGFnIPF3QioMBfj02RcIe6r.png', NULL, '5', '21cm x 14', 0, 10000, 1, '2025-01-24 01:53:43', '2025-01-28 05:16:55'),
(137, 6, 61, 'uploads/jKQCz1jFbOU7ip3ZNLpWDKP4bDvuE5hRnhcf0H7l.png', NULL, '1', '60cm x 160 cm', 0, 175000, 1, '2025-01-24 01:54:23', '2025-01-28 05:16:55'),
(139, 14, 91, 'uploads/LNnlj2wmWqBLTN14IdD35LraxK5IyNm77oOjz3HX.png', NULL, '25', '3.5 x 3.5', 0, 375000, 1, '2025-01-24 02:08:06', '2025-01-25 14:06:50'),
(140, 14, 94, 'uploads/38iz1B0mdd11aerN1fVWC4YgmZghxmjAsKGPTWZR.png', NULL, '10', '21cm x 29', 0, 60000, 1, '2025-01-24 02:08:41', '2025-01-25 14:06:50'),
(141, 15, 62, 'uploads/j01B3w5aJxeJIxWdY7oBEnRmzxmsy4JCb0ocoLQ0.jpg', NULL, '2', '60cm x 160 cm', 0, 396000, 1, '2025-01-24 02:14:33', '2025-01-24 08:02:20'),
(142, 15, 94, 'uploads/KXOFHkvJzcLTYkLYYAQFpupy98x02mmRBP9qRu52.png', NULL, '20', '21cm x 29', 0, 120000, 1, '2025-01-24 02:15:23', '2025-01-24 08:02:20'),
(143, 6, 93, 'uploads/Yr16DoccP3FsTOt7KnXeGFWPP6IGw9p76MvgmfRA.jpg', NULL, '20', '21cm x 29.7cm (A4)', 0, 60000, 1, '2025-01-24 07:39:33', '2025-01-28 05:16:55'),
(144, 6, 91, 'uploads/NhTZ9basoPegKpSwlVwBdioUKbF0mv2YgDdkta8M.png', NULL, '10', '3.5 x 3.5', 0, 150000, 1, '2025-01-24 07:41:40', '2025-01-28 05:16:55'),
(145, 6, 61, 'uploads/JliyxTSQQolhutRUm1w0WRjIMMcEQnnwt9aVT8z2.png', NULL, '1', '60cm x 160 cm', 0, 175000, 1, '2025-01-24 07:42:04', '2025-01-28 05:16:55'),
(146, 15, 91, 'uploads/lYrFMqmQKpxtE6mt9tkU5AodRKFEZKqcr8vyOlEK.jpg', NULL, '10', '3.5 x 3.5', 0, 150000, 1, '2025-01-24 07:56:18', '2025-01-24 08:02:20'),
(147, 15, 94, 'uploads/5KbKBWWBnxoqbMZ2tFekvs0gyQCxUgFOR4MDtCAU.png', NULL, '5', '21cm x 29', 0, 30000, 1, '2025-01-24 07:57:02', '2025-01-24 08:02:20'),
(148, 15, 90, 'uploads/UaHegtGwooERonWqlPxOlGI0DfRlYKExUBtm13H9.png', NULL, '10', '3.5 x 3.5', 0, 150000, 1, '2025-01-24 08:01:07', '2025-01-24 08:02:20'),
(149, 15, 61, 'uploads/cE3q9gsLVnKxIAhLsGd55fdkbXIKqS9PCXHzFx3U.png', NULL, '1', '60cm x 160 cm', 0, 175000, 1, '2025-01-24 08:01:26', '2025-01-24 08:02:20'),
(150, 15, 94, 'uploads/V57atqJQGUn5Nqz1r2nSUoG3PLabmA6SBxHPKl1l.png', NULL, '5', '21cm x 29', 0, 30000, 1, '2025-01-24 08:01:49', '2025-01-24 08:02:20'),
(151, 14, 91, 'uploads/O9mE723uPmpdN4gTDZPw8aYiNma6y6lmmk0FlK72.png', NULL, '10', '3.5 x 3.5', 0, 150000, 1, '2025-01-24 08:06:38', '2025-01-25 14:06:50'),
(152, 14, 62, 'uploads/e9LHAZKtTLvVOki3KZiYLRxeUb6tkb7TkyH3TELh.png', NULL, '1', '60cm x 160 cm', 0, 198000, 1, '2025-01-24 08:07:25', '2025-01-25 14:06:50'),
(153, 6, 89, 'uploads/rRqqaEo1wp9YrjmdKGA1iJhVUCVmPRMUUd8VQbsM.jpg', NULL, '10', '3.5 x 3.5', 0, 150000, 1, '2025-01-25 13:20:25', '2025-01-28 05:16:55'),
(154, 6, 93, 'uploads/M1ZcbncyLnmz4jW3jqPcj6DKumVDFxYrlJ3AsRqL.jpg', NULL, '5', '21cm x 29.7cm (A4)', 0, 15000, 1, '2025-01-25 13:21:28', '2025-01-28 05:16:55'),
(156, 6, 90, 'uploads/n6a8vgGx0yONeNGY2H5i5Zogwk3mK4wuNJR9mdhj.jpg', NULL, '10', '3.5 x 3.5', 0, 150000, 1, '2025-01-25 13:23:32', '2025-01-28 05:16:55'),
(157, 6, 80, 'uploads/hwEXyC0PwnXto9KtcQJ81FzuxSFvGQtw7rcFVqyN.jpg', NULL, '2', '1mx1m', 0, 70000, 1, '2025-01-25 13:24:07', '2025-01-28 05:16:55'),
(158, 6, 93, 'uploads/r1MXGJ9pB1CWSr3tLUSBDrgFE7pHwVJ9JQoleCuz.jpg', NULL, '5', '21cm x 29.7cm (A4)', 0, 15000, 1, '2025-01-25 13:24:32', '2025-01-28 05:16:55'),
(159, 14, 79, 'uploads/yepOOCeARvNCocex0P9KhuNAw8wwpvXOds5wQG5v.jpg', NULL, '2', '1mx1m', 0, 60000, 1, '2025-01-25 13:37:40', '2025-01-25 14:06:50'),
(160, 14, 91, 'uploads/6FSN3nbnujyLSFTYhjD4LWYMvzOUXWpQe5sfMmBN.jpg', NULL, '8', '3.5 x 3.5', 0, 120000, 1, '2025-01-25 13:38:02', '2025-01-25 14:06:50'),
(161, 14, 95, 'uploads/SXpKA6DYT7VNukuQpPPpIAXwpoEJvnEMmp9fuhck.jpg', NULL, '3', '21cm x 14', 0, 6000, 1, '2025-01-25 13:38:33', '2025-01-25 14:06:50'),
(162, 14, 63, 'uploads/5YSPga7yHPhOEvClevsiZTL7mfZGdFPmwqX6tkSj.jpg', NULL, '2', '60cm x 160 cm', 0, 370000, 1, '2025-01-25 14:00:48', '2025-01-25 14:06:50'),
(163, 14, 89, 'uploads/K550vdik8WhVYKrw7lEFu2NOciLOFoUMhYUZF83F.jpg', NULL, '5', '3.5 x 3.5', 0, 75000, 1, '2025-01-25 14:01:19', '2025-01-25 14:06:50'),
(164, 14, 132, NULL, NULL, '3', 'Standart (P 15.1cm x D 1cm )', 0, 6000, 1, '2025-01-25 14:01:43', '2025-01-25 14:06:50'),
(165, 6, 91, NULL, NULL, '5', '3.5 x 3.5', 0, 75000, 1, '2025-01-28 05:13:11', '2025-01-28 05:16:55'),
(166, 6, 95, 'uploads/HhfRdENAzGNLivTVOP3tqLDd7oivbZ2mSI6Igomb.jpg', NULL, '5', '21cm x 14', 0, 10000, 1, '2025-01-28 05:13:54', '2025-01-28 05:16:55'),
(167, 6, 61, 'uploads/1wzleX0Fi1ykFq3sTdoLcTKAPQGaCweAq8CMXvYx.jpg', NULL, '1', '60cm x 160 cm', 0, 175000, 1, '2025-01-28 05:14:37', '2025-01-28 05:16:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `nama_kategori`, `deskripsi`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'DESIGN GRAFIS', 'Design Grafis', '17298660335.png', '2024-12-28 06:49:12', '2024-12-28 14:20:33'),
(2, 'PERALATAN KANTOR', 'Temukan Semua Kebutuhan Kantor Disini', '17298660443.png', '2024-12-28 09:46:13', '2024-12-28 14:20:44'),
(3, 'CETAK BUKU', 'Cetak Buku Berkualitas', '17298660557.png', '2024-12-28 09:46:57', '2024-12-28 14:20:55'),
(4, 'ALAT TULIS & KERTAS', 'Alat Tulis & Kertas', '17367659152.png', '2024-12-28 09:47:55', '2025-01-13 10:58:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cls`
--

CREATE TABLE `cls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gateways`
--

CREATE TABLE `gateways` (
  `id` int(11) NOT NULL,
  `nama_bank` varchar(255) NOT NULL,
  `atas_nama` varchar(255) NOT NULL,
  `rekening` varchar(255) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `gateways`
--

INSERT INTO `gateways` (`id`, `nama_bank`, `atas_nama`, `rekening`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'Bank BCA', 'Muslimin', '0940896444', '17290633728.jpg', NULL, '2025-01-13 10:52:49'),
(2, 'Bank BRI', 'Jamilatun Maghfiroh', '119201006085509', '17290634169.jpg', '2024-12-28 07:15:02', '2024-12-28 07:15:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_member` varchar(255) NOT NULL,
  `no_hp` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `members`
--

INSERT INTO `members` (`id`, `nama_member`, `no_hp`, `email`, `password`, `created_at`, `updated_at`) VALUES
(6, 'Ayu Sulis', '082228928895', 'ayusulis@gmail.com', '$2y$10$HvUwAOqN.ZoHKK.Bovl8G.kG6Mco4bMBT/uQu3Tc/K1dc9gPPKbaC', '2024-12-28 09:42:35', '2024-12-28 09:42:35'),
(8, 'Muslimin', '081398290684', 'milafc84@gmail.com', '$2y$10$pJ5aUNxAKg0ZOwNLkjeMoegXdPxwINLchq23U.zRlfFB1XSqo5BmC', '2024-12-28 07:21:31', '2024-12-28 07:21:31'),
(13, 'Nida', '087871092409', 'nidaayu@gmail.com', '$2y$10$RBQz6nYnCglF7hlot7Nx4eps3Ih4Kz3rYIJs6Yo0YjMwfbLdPamWy', '2025-01-17 02:28:20', '2025-01-17 02:28:20'),
(14, 'Nenden Wulandari', '081211545955', 'NendenWulan15@gmail.com', '$2y$10$1NJ9VV6bEIGCHHV8aXonu.aYviSdGSm72T3C3Wl0M1Ukome19nY0O', '2025-01-24 02:06:26', '2025-01-24 02:06:26'),
(15, 'Gallur Pandu', '082261958546', 'gallurpandu12@gmail.com', '$2y$10$Yj/E83BJ2lxOBWSFX59scONq7k4o8ydwdxYw2PTTJttHTC4WbZbry', '2025-01-24 02:13:44', '2025-01-24 02:13:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2014_10_12_000000_create_users_table', 2),
(3, '2014_10_12_100000_create_password_resets_table', 2),
(4, '2019_08_19_000000_create_failed_jobs_table', 2),
(5, '2024_08_09_060721_create_categories_table', 2),
(6, '2024_08_09_152015_create_cls_table', 2),
(7, '2024_08_09_152257_create_subcategories_table', 2),
(8, '2024_08_10_053752_create_sliders_table', 2),
(9, '2024_08_10_063227_create_products_table', 2),
(10, '2024_08_10_083001_create_members_table', 2),
(11, '2024_08_10_085800_create_testimonis_table', 2),
(12, '2024_08_10_132338_create_reviews_table', 2),
(13, '2024_08_20_044241_create_orders_table', 2),
(14, '2024_08_20_045918_add_status_to_orders_table', 2),
(15, '2024_08_20_122334_create_payments_table', 2),
(16, '2024_08_23_151930_create_about_table', 2),
(17, '2024_08_24_122718_remove_bahan_from_products_table', 3),
(18, '2024_08_25_121044_add_rekening_to_about', 4),
(19, '2024_08_25_124259_drop_column_in_members', 5),
(20, '2024_08_25_145120_create_carts_table', 6),
(23, '2024_08_26_152930_remove_gambar_from_carts_table', 7),
(24, '2024_08_28_123713_add_id_member_to_payments', 8),
(25, '2024_11_01_161944_create_penjualans_table', 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_member` int(11) NOT NULL,
  `invoice` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `grand_total` int(11) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `kota` varchar(255) NOT NULL,
  `detail_alamat` text NOT NULL,
  `no_resi` varchar(255) DEFAULT NULL,
  `charge` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `id_member`, `invoice`, `berat`, `grand_total`, `provinsi`, `kota`, `detail_alamat`, `no_resi`, `charge`, `created_at`, `updated_at`, `status`) VALUES
(112, 15, 25012420, 2225, 437600, 'DKI Jakarta', 'Jakarta Utara', 'Gang Haji Malik Rt 006/Rw 03 Kelurahan Sukaparu, Kecamatan Cilincing Jakarta Utara, DKI Jakarta 14140', '015910002504025', 0, '2025-01-24 08:02:20', '2025-01-28 05:36:22', 'Selesai'),
(115, 6, 25012552, 225, 194800, 'Jawa Barat', 'Bekasi', 'Jl Mustang No 16A Rt 01/ Rw 01 Jaladhapura, Margahayu, Bekasi Timur Kontrakan Wisma Indah', NULL, 0, '2025-01-25 13:21:52', '2025-01-28 05:37:53', 'Selesai'),
(116, 6, 25012458, 1225, 273200, 'Jawa Barat', 'Bekasi', 'Jl Mustang No 16A Rt 01/ Rw 01 Jaladhapura, Margahayu, Bekasi Timur Kontrakan Wisma Indah', 'JD0445313496', 0, '2025-01-25 13:24:58', '2025-01-25 13:28:16', 'Selesai'),
(117, 14, 25012427, 955, 248320, 'DKI Jakarta', 'Jakarta Timur', 'Kp Rawa Gelem Rt 004/ Rw 06 No 194 Jl. Pengarengan, Kota Jakarta Timur, Cakung DKI Jakarta,13930', 'JD0445137945', 0, '2025-01-25 13:39:27', '2025-01-25 13:42:27', 'Selesai'),
(119, 6, 25012455, 2175, 311200, 'Jawa Barat', 'Bekasi', 'Jl Mustang No 16A Rt 01/ Rw 01 Jaladhapura, Margahayu, Bekasi Timur Kontrakan Wisma Indah', 'JD0445313496', 0, '2025-01-24 05:16:55', '2025-01-28 05:37:57', 'Selesai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `is_need_design` int(11) NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `bahan` varchar(50) NOT NULL,
  `gsm` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `size` varchar(255) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `order_details`
--

INSERT INTO `order_details` (`id`, `id_order`, `id_produk`, `is_need_design`, `file`, `note`, `bahan`, `gsm`, `jumlah`, `size`, `total`, `created_at`, `updated_at`) VALUES
(75, 86, 61, 0, 'uploads/p79YBjELge9JtlHwjbQF0tQhj2kXLlYVPIY2sB5U.jpg', NULL, 'BANNER', 300, 1, '60*160', 175000, '2025-01-04 15:39:32', '2025-01-04 15:39:32'),
(76, 87, 61, 0, 'uploads/QxozV3b49vEsigLYt5iTnluGsVmoUwiVqeP1RTlB.jpg', NULL, 'BANNER', 300, 1, '60*160', 175000, '2025-01-08 05:04:49', '2025-01-08 05:04:49'),
(77, 88, 62, 0, 'uploads/Vpr5J3Jpt8nEBNOarIBPKmOtxuYyamvRgtXQ6uAG.jpg', NULL, 'BANNER', 120, 1, '60*160', 198000, '2025-01-08 05:10:51', '2025-01-08 05:10:51'),
(78, 89, 63, 0, 'uploads/EAaOZETJHfr3cyLvBCuRkl0KFyINukYfbIajmvbX.jpg', NULL, 'BANNER', 120, 1, '60*160', 185000, '2025-01-08 12:07:25', '2025-01-08 12:07:25'),
(79, 90, 63, 0, 'uploads/eQacjkTjk26xEicKPK1I87CLmPpK3oAaBz2KldK9.jpg', NULL, 'BANNER', 120, 1, '60*160', 185000, '2025-01-08 12:37:41', '2025-01-08 12:37:41'),
(82, 93, 61, 0, 'uploads/7WHDKA24vpAdIp6jcGXZsB2wdlgFhQtWDbD8K7Uj.jpg', NULL, 'BANNER', 120, 1, '60*160', 175000, '2025-01-17 09:20:31', '2025-01-17 09:20:31'),
(83, 94, 61, 0, 'uploads/x9nzjESmKtNp2x9Qu5ahnXuKrXreSu0JsLIZlAEy.jpg', NULL, 'BANNER MATTE', 300, 1, '60*160', 175000, '2025-01-17 10:43:11', '2025-01-17 10:43:11'),
(84, 95, 89, 0, 'uploads/nDkq2kV9kVc5q8POI3KrdCNl2u49KrwLn5toZ1r8.jpg', NULL, 'BANNER MATTE', 350, 5, '60*160', 75000, '2025-01-24 08:56:55', '2025-01-24 08:56:55'),
(85, 95, 95, 0, 'uploads/UkDbabB2OksITsAZXiGFnIPF3QioMBfj02RcIe6r.png', NULL, 'BANNER MATTE', 300, 5, '60*160', 10000, '2025-01-24 08:56:55', '2025-01-24 08:56:55'),
(86, 95, 61, 0, 'uploads/jKQCz1jFbOU7ip3ZNLpWDKP4bDvuE5hRnhcf0H7l.png', NULL, 'BANNER MATTE', 300, 1, '60*160', 175000, '2025-01-24 08:56:55', '2025-01-24 08:56:55'),
(87, 96, 89, 0, 'uploads/nDkq2kV9kVc5q8POI3KrdCNl2u49KrwLn5toZ1r8.jpg', NULL, 'BANNER', 150, 5, '3*3', 75000, '2025-01-24 08:57:00', '2025-01-24 08:57:00'),
(88, 96, 95, 0, 'uploads/UkDbabB2OksITsAZXiGFnIPF3QioMBfj02RcIe6r.png', NULL, 'BANNER', 150, 5, '60*160', 10000, '2025-01-24 08:57:00', '2025-01-24 08:57:00'),
(89, 96, 61, 0, '', NULL, 'BANNER', 150, 1, '60*160', 175000, '2025-01-24 08:57:00', '2025-01-24 08:57:00'),
(90, 97, 89, 0, 'uploads/nDkq2kV9kVc5q8POI3KrdCNl2u49KrwLn5toZ1r8.jpg', NULL, 'BANNER', 150, 5, '60*160', 75000, '2025-01-24 08:57:04', '2025-01-24 08:57:04'),
(91, 97, 95, 0, 'uploads/UkDbabB2OksITsAZXiGFnIPF3QioMBfj02RcIe6r.png', NULL, 'BANNER', 170, 5, '60*160', 10000, '2025-01-24 08:57:04', '0000-00-00 00:00:00'),
(92, 97, 61, 0, 'uploads/jKQCz1jFbOU7ip3ZNLpWDKP4bDvuE5hRnhcf0H7l.png', NULL, '', 0, 1, '60*160', 175000, '2025-01-24 08:57:04', '2025-01-24 08:57:04'),
(93, 98, 89, 0, 'uploads/nDkq2kV9kVc5q8POI3KrdCNl2u49KrwLn5toZ1r8.jpg', NULL, '', 0, 5, '60*160', 75000, '2025-01-24 08:57:07', '2025-01-24 08:57:07'),
(94, 98, 95, 0, 'uploads/UkDbabB2OksITsAZXiGFnIPF3QioMBfj02RcIe6r.png', NULL, '', 0, 5, '60*160', 10000, '2025-01-24 08:57:07', '2025-01-24 08:57:07'),
(95, 98, 61, 0, 'uploads/jKQCz1jFbOU7ip3ZNLpWDKP4bDvuE5hRnhcf0H7l.png', NULL, '', 0, 1, '60*160', 175000, '2025-01-24 08:57:07', '2025-01-24 08:57:07'),
(96, 99, 89, 0, 'uploads/nDkq2kV9kVc5q8POI3KrdCNl2u49KrwLn5toZ1r8.jpg', NULL, '', 0, 5, '3.5*3.5', 75000, '2025-01-24 08:57:10', '2025-01-24 08:57:10'),
(97, 99, 95, 0, 'uploads/UkDbabB2OksITsAZXiGFnIPF3QioMBfj02RcIe6r.png', NULL, '', 0, 5, '3.5*3.5', 10000, '2025-01-24 08:57:10', '2025-01-24 08:57:10'),
(98, 99, 61, 0, 'uploads/jKQCz1jFbOU7ip3ZNLpWDKP4bDvuE5hRnhcf0H7l.png', NULL, '', 0, 1, '3.5*3.5', 175000, '2025-01-24 08:57:10', '2025-01-24 08:57:10'),
(99, 100, 89, 0, 'uploads/nDkq2kV9kVc5q8POI3KrdCNl2u49KrwLn5toZ1r8.jpg', NULL, '', 0, 5, '3.5*3.5', 75000, '2025-01-24 08:57:13', '2025-01-24 08:57:13'),
(100, 100, 95, 0, 'uploads/UkDbabB2OksITsAZXiGFnIPF3QioMBfj02RcIe6r.png', NULL, '', 0, 5, '3.5*3.5', 10000, '2025-01-24 08:57:13', '2025-01-24 08:57:13'),
(101, 100, 61, 0, 'uploads/jKQCz1jFbOU7ip3ZNLpWDKP4bDvuE5hRnhcf0H7l.png', NULL, '', 0, 1, '3.5*3.5', 175000, '0000-00-00 00:00:00', '2025-01-24 08:57:13'),
(102, 101, 89, 0, 'uploads/nDkq2kV9kVc5q8POI3KrdCNl2u49KrwLn5toZ1r8.jpg', NULL, '', 0, 5, '3.5 x 3.5', 75000, '2025-01-24 08:57:21', '2025-01-24 08:57:21'),
(103, 101, 95, 0, 'uploads/UkDbabB2OksITsAZXiGFnIPF3QioMBfj02RcIe6r.png', NULL, '', 0, 5, '21cm x 14', 10000, '2025-01-24 08:57:21', '2025-01-24 08:57:21'),
(104, 101, 61, 0, 'uploads/jKQCz1jFbOU7ip3ZNLpWDKP4bDvuE5hRnhcf0H7l.png', NULL, '', 0, 1, '60cm x 160 cm', 175000, '2025-01-24 08:57:21', '2025-01-24 08:57:21'),
(105, 102, 89, 0, 'uploads/nDkq2kV9kVc5q8POI3KrdCNl2u49KrwLn5toZ1r8.jpg', NULL, '', 0, 5, '3.5 x 3.5', 75000, '2025-01-24 08:57:24', '2025-01-24 08:57:24'),
(106, 102, 95, 0, 'uploads/UkDbabB2OksITsAZXiGFnIPF3QioMBfj02RcIe6r.png', NULL, '', 0, 5, '21cm x 14', 10000, '2025-01-24 08:57:24', '2025-01-24 08:57:24'),
(107, 102, 61, 0, 'uploads/jKQCz1jFbOU7ip3ZNLpWDKP4bDvuE5hRnhcf0H7l.png', NULL, '', 0, 1, '60cm x 160 cm', 175000, '2025-01-24 08:57:24', '2025-01-24 08:57:24'),
(108, 103, 89, 0, 'uploads/nDkq2kV9kVc5q8POI3KrdCNl2u49KrwLn5toZ1r8.jpg', NULL, '', 0, 5, '3.5 x 3.5', 75000, '2025-01-24 08:57:29', '2025-01-24 08:57:29'),
(109, 103, 95, 0, 'uploads/UkDbabB2OksITsAZXiGFnIPF3QioMBfj02RcIe6r.png', NULL, '', 0, 5, '21cm x 14', 10000, '2025-01-24 08:57:29', '2025-01-24 08:57:29'),
(110, 103, 61, 0, 'uploads/jKQCz1jFbOU7ip3ZNLpWDKP4bDvuE5hRnhcf0H7l.png', NULL, '', 0, 1, '60cm x 160 cm', 175000, '2025-01-24 08:57:29', '2025-01-24 08:57:29'),
(111, 104, 89, 0, 'uploads/nDkq2kV9kVc5q8POI3KrdCNl2u49KrwLn5toZ1r8.jpg', NULL, '', 0, 5, '3.5 x 3.5', 75000, '2025-01-24 08:57:35', '2025-01-24 08:57:35'),
(112, 104, 95, 0, 'uploads/UkDbabB2OksITsAZXiGFnIPF3QioMBfj02RcIe6r.png', NULL, '', 0, 5, '21cm x 14', 10000, '2025-01-24 08:57:35', '2025-01-24 08:57:35'),
(113, 104, 61, 0, 'uploads/jKQCz1jFbOU7ip3ZNLpWDKP4bDvuE5hRnhcf0H7l.png', NULL, '', 0, 1, '60cm x 160 cm', 175000, '2025-01-24 08:57:35', '2025-01-24 08:57:35'),
(114, 105, 89, 0, 'uploads/nDkq2kV9kVc5q8POI3KrdCNl2u49KrwLn5toZ1r8.jpg', NULL, '', 0, 5, '3.5 x 3.5', 75000, '2025-01-24 08:57:40', '2025-01-24 08:57:40'),
(115, 105, 95, 0, 'uploads/UkDbabB2OksITsAZXiGFnIPF3QioMBfj02RcIe6r.png', NULL, '', 0, 5, '21cm x 14', 10000, '2025-01-24 08:57:40', '2025-01-24 08:57:40'),
(116, 105, 61, 0, 'uploads/jKQCz1jFbOU7ip3ZNLpWDKP4bDvuE5hRnhcf0H7l.png', NULL, '', 0, 1, '60cm x 160 cm', 175000, '2025-01-24 08:57:40', '2025-01-24 08:57:40'),
(117, 106, 89, 0, 'uploads/nDkq2kV9kVc5q8POI3KrdCNl2u49KrwLn5toZ1r8.jpg', NULL, '', 0, 5, '3.5 x 3.5', 75000, '2025-01-24 08:57:45', '2025-01-24 08:57:45'),
(118, 106, 95, 0, 'uploads/UkDbabB2OksITsAZXiGFnIPF3QioMBfj02RcIe6r.png', NULL, '', 0, 5, '21cm x 14', 10000, '2025-01-24 08:57:45', '2025-01-24 08:57:45'),
(119, 106, 61, 0, 'uploads/jKQCz1jFbOU7ip3ZNLpWDKP4bDvuE5hRnhcf0H7l.png', NULL, '', 0, 1, '60cm x 160 cm', 175000, '2025-01-24 08:57:45', '2025-01-24 08:57:45'),
(120, 107, 91, 0, 'uploads/LNnlj2wmWqBLTN14IdD35LraxK5IyNm77oOjz3HX.png', NULL, '', 0, 25, '3.5 x 3.5', 375000, '2025-01-24 09:10:05', '2025-01-24 09:10:05'),
(121, 107, 94, 0, 'uploads/38iz1B0mdd11aerN1fVWC4YgmZghxmjAsKGPTWZR.png', NULL, '', 0, 10, '21cm x 29', 60000, '2025-01-24 09:10:05', '2025-01-24 09:10:05'),
(122, 108, 62, 0, 'uploads/j01B3w5aJxeJIxWdY7oBEnRmzxmsy4JCb0ocoLQ0.jpg', NULL, '', 0, 2, '60cm x 160 cm', 396000, '2025-01-24 09:16:38', '2025-01-24 09:16:38'),
(123, 108, 94, 0, 'uploads/KXOFHkvJzcLTYkLYYAQFpupy98x02mmRBP9qRu52.png', NULL, '', 0, 20, '21cm x 29', 120000, '2025-01-24 09:16:38', '2025-01-24 09:16:38'),
(124, 109, 93, 0, 'uploads/Yr16DoccP3FsTOt7KnXeGFWPP6IGw9p76MvgmfRA.jpg', NULL, '', 0, 20, '21cm x 29.7cm (A4)', 60000, '2025-01-24 14:43:08', '2025-01-24 14:43:08'),
(125, 109, 91, 0, 'uploads/NhTZ9basoPegKpSwlVwBdioUKbF0mv2YgDdkta8M.png', NULL, '', 0, 10, '3.5 x 3.5', 150000, '2025-01-24 14:43:08', '2025-01-24 14:43:08'),
(126, 109, 61, 0, 'uploads/JliyxTSQQolhutRUm1w0WRjIMMcEQnnwt9aVT8z2.png', NULL, '', 0, 1, '60cm x 160 cm', 175000, '2025-01-24 14:43:08', '2025-01-24 14:43:08'),
(127, 110, 91, 0, 'uploads/lYrFMqmQKpxtE6mt9tkU5AodRKFEZKqcr8vyOlEK.jpg', NULL, '', 0, 10, '3.5 x 3.5', 150000, '2025-01-24 14:58:09', '2025-01-24 14:58:09'),
(128, 110, 94, 0, 'uploads/5KbKBWWBnxoqbMZ2tFekvs0gyQCxUgFOR4MDtCAU.png', NULL, '', 0, 5, '21cm x 29', 30000, '2025-01-24 14:58:09', '2025-01-24 14:58:09'),
(129, 111, 90, 0, 'uploads/UaHegtGwooERonWqlPxOlGI0DfRlYKExUBtm13H9.png', NULL, '', 0, 10, '3.5 x 3.5', 150000, '2025-01-24 15:02:16', '2025-01-24 15:02:16'),
(130, 111, 61, 0, 'uploads/cE3q9gsLVnKxIAhLsGd55fdkbXIKqS9PCXHzFx3U.png', NULL, '', 0, 1, '60cm x 160 cm', 175000, '2025-01-24 15:02:16', '2025-01-24 15:02:16'),
(131, 111, 94, 0, 'uploads/V57atqJQGUn5Nqz1r2nSUoG3PLabmA6SBxHPKl1l.png', NULL, '', 0, 5, '21cm x 29', 30000, '2025-01-24 15:02:16', '2025-01-24 15:02:16'),
(132, 112, 90, 0, 'uploads/UaHegtGwooERonWqlPxOlGI0DfRlYKExUBtm13H9.png', NULL, '', 0, 10, '3.5 x 3.5', 150000, '2025-01-24 15:02:20', '2025-01-24 15:02:20'),
(133, 112, 61, 0, 'uploads/cE3q9gsLVnKxIAhLsGd55fdkbXIKqS9PCXHzFx3U.png', NULL, '', 0, 1, '60cm x 160 cm', 175000, '2025-01-24 15:02:20', '2025-01-24 15:02:20'),
(134, 112, 94, 0, 'uploads/V57atqJQGUn5Nqz1r2nSUoG3PLabmA6SBxHPKl1l.png', NULL, '', 0, 5, '21cm x 29', 30000, '2025-01-24 15:02:20', '2025-01-24 15:02:20'),
(135, 113, 91, 0, 'uploads/O9mE723uPmpdN4gTDZPw8aYiNma6y6lmmk0FlK72.png', NULL, '', 0, 10, '3.5 x 3.5', 150000, '2025-01-24 15:08:24', '2025-01-24 15:08:24'),
(136, 113, 62, 0, 'uploads/e9LHAZKtTLvVOki3KZiYLRxeUb6tkb7TkyH3TELh.png', NULL, '', 0, 1, '60cm x 160 cm', 198000, '2025-01-24 15:08:24', '2025-01-24 15:08:24'),
(137, 115, 89, 0, 'uploads/rRqqaEo1wp9YrjmdKGA1iJhVUCVmPRMUUd8VQbsM.jpg', NULL, '', 0, 10, '3*3', 150000, '2025-01-25 20:21:52', '2025-01-25 20:21:52'),
(138, 115, 93, 0, 'uploads/M1ZcbncyLnmz4jW3jqPcj6DKumVDFxYrlJ3AsRqL.jpg', NULL, '', 0, 5, '21cm x 29.7cm (A4)', 15000, '2025-01-25 20:21:52', '2025-01-25 20:21:52'),
(139, 116, 90, 0, 'uploads/n6a8vgGx0yONeNGY2H5i5Zogwk3mK4wuNJR9mdhj.jpg', NULL, '', 0, 10, '3.5 x 3.5', 150000, '2025-01-25 20:24:58', '2025-01-25 20:24:58'),
(140, 116, 80, 0, 'uploads/hwEXyC0PwnXto9KtcQJ81FzuxSFvGQtw7rcFVqyN.jpg', NULL, '', 0, 2, '1mx1m', 70000, '2025-01-25 20:24:58', '2025-01-25 20:24:58'),
(141, 116, 93, 0, 'uploads/r1MXGJ9pB1CWSr3tLUSBDrgFE7pHwVJ9JQoleCuz.jpg', NULL, '', 0, 5, '21cm x 29.7cm (A4)', 15000, '2025-01-25 20:24:58', '2025-01-25 20:24:58'),
(142, 117, 79, 0, 'uploads/yepOOCeARvNCocex0P9KhuNAw8wwpvXOds5wQG5v.jpg', NULL, '', 0, 2, '1mx1m', 60000, '2025-01-25 20:39:27', '2025-01-25 20:39:27'),
(143, 117, 91, 0, 'uploads/6FSN3nbnujyLSFTYhjD4LWYMvzOUXWpQe5sfMmBN.jpg', NULL, '', 0, 8, '3.5 x 3.5', 120000, '2025-01-25 20:39:27', '2025-01-25 20:39:27'),
(144, 117, 95, 0, 'uploads/SXpKA6DYT7VNukuQpPPpIAXwpoEJvnEMmp9fuhck.jpg', NULL, '', 0, 3, '21cm x 14', 6000, '2025-01-25 20:39:27', '2025-01-25 20:39:27'),
(145, 118, 63, 0, 'uploads/5YSPga7yHPhOEvClevsiZTL7mfZGdFPmwqX6tkSj.jpg', NULL, '', 0, 2, '60cm x 160 cm', 370000, '2025-01-25 21:06:50', '2025-01-25 21:06:50'),
(146, 118, 89, 0, 'uploads/K550vdik8WhVYKrw7lEFu2NOciLOFoUMhYUZF83F.jpg', NULL, '', 0, 5, '3.5 x 3.5', 75000, '2025-01-25 21:06:50', '2025-01-25 21:06:50'),
(147, 118, 132, 0, NULL, NULL, '', 0, 3, 'Standart (P 15.1cm x D 1cm )', 6000, '2025-01-25 21:06:50', '2025-01-25 21:06:50'),
(148, 119, 91, 0, NULL, NULL, '', 0, 5, '3.5 x 3.5', 75000, '2025-01-28 12:16:55', '2025-01-28 12:16:55'),
(149, 119, 95, 0, 'uploads/HhfRdENAzGNLivTVOP3tqLDd7oivbZ2mSI6Igomb.jpg', NULL, '', 0, 5, '21cm x 14', 10000, '2025-01-28 12:16:55', '2025-01-28 12:16:55'),
(150, 119, 61, 0, 'uploads/1wzleX0Fi1ykFq3sTdoLcTKAPQGaCweAq8CMXvYx.jpg', NULL, '', 0, 1, '60cm x 160 cm', 175000, '2025-01-28 12:16:55', '2025-01-28 12:16:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_order` int(11) NOT NULL,
  `kategori` varchar(10) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `id_gateway` int(11) NOT NULL,
  `bukti_pembayaran` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_member` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `payments`
--

INSERT INTO `payments` (`id`, `id_order`, `kategori`, `jumlah`, `id_gateway`, `bukti_pembayaran`, `status`, `created_at`, `updated_at`, `id_member`) VALUES
(60, 112, 'order', 437600, 1, 'bukti_pembayaran/ZKWg2DKOu0z0nN92zRl0qK41rOYrxUenqjhrKwZl.jpg', 'DITERIMA', '2025-01-24 08:02:39', '2025-01-24 08:03:01', 15),
(62, 115, 'order', 194800, 1, 'bukti_pembayaran/Qogd31CPra7VHpxx4GuwJDkyDBapLWl7BIm1CWpx.jpg', 'DITERIMA', '2025-01-25 13:22:06', '2025-01-28 05:00:57', 6),
(63, 116, 'order', 273200, 1, 'bukti_pembayaran/6V0ReQFRWnCEUCXBYjlow6FxDNUsh7xwDX9MWjyd.jpg', 'DITERIMA', '2025-01-25 13:25:09', '2025-01-25 13:26:36', 6),
(64, 117, 'order', 248320, 1, 'bukti_pembayaran/NXiXGOc8emKm06S8aLVGa0szfGXsLtJoiHZRtYGd.jpg', 'DITERIMA', '2025-01-25 13:39:43', '2025-01-25 13:40:27', 14),
(65, 119, 'order', 311200, 1, 'bukti_pembayaran/wFzYtP6FIeMFwkSVvheWScbOhOmaw8StAHw1VKFY.jpg', 'DITERIMA', '2025-01-28 05:25:31', '2025-01-28 05:26:47', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_subkategori` int(11) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `berat` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `ukuran` varchar(255) NOT NULL,
  `satuan` varchar(5) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `id_kategori`, `id_subkategori`, `nama_produk`, `gambar`, `deskripsi`, `berat`, `harga`, `tags`, `sku`, `ukuran`, `satuan`, `created_at`, `updated_at`) VALUES
(61, 1, 1, 'Roll Up Banner 1 | Stand Banner Alumunium(Moving Roll Up) | Bahan Flexy Korea 380gsm', '17350293065.png', 'CETAK ROLL UP BANNER\nSpesifikasi \n1. Bahan Flexy Korea 380gsm\n2.Ukuran Khusus 60cmx160cm\n3.Tiang Roll Banner Menggunakan Alumunium(Moving Roll Up)\n\nProses Pengerjaan:\n1. Jika sudah memiliki desain dan siap cetak, akan diproses di hari saat orderan masuk.\n2. Jika belum memiliki desain. Ada jasa pengerjaan desain dan produk di kirim 2-3 hari\n\n** Happy Shopping **', 2000, 175000, 'Roll Up Banner,Flexy Korea 380gsm,60x160', 'RB-001', '60cm x 160 cm', '', '2024-12-31 11:42:00', '2024-12-31 11:42:00'),
(62, 1, 1, 'Roll Up Banner 2 | Stand Banner Alumunium(Moving Roll Up) | Bahan Flexy Korea 440gsm', '17298668597.png', 'CETAK ROLL UP BANNER\nSpesifikasi \n1. Bahan Flexy Korea 440gsm\n2.Ukuran Khusus 60cmx160cm\n3.Tiang Roll Banner Menggunakan Alumunium(Moving Roll Up)\n\nProses Pengerjaan:\n1. Jika sudah memiliki desain dan siap cetak, akan diproses di hari saat orderan masuk.\n2. Jika belum memiliki desain. Ada jasa pengerjaan desain dan produk di kirim 2-3 hari\n\n** Happy Shopping **', 2000, 198000, 'Roll Up Banner,Flexy Korea 440gsm,60x160', 'RB-002', '60cm x 160 cm', '', '2024-12-31 12:53:00', '2024-12-31 12:53:00'),
(63, 1, 1, 'Roll Up Banner 3 | Stand Banner Alumunium(Moving Roll Up) | Bahan Albatros', '17298669121.png', 'CETAK ROLL UP BANNER\nSpesifikasi \n1. Bahan Albatros\n2.Ukuran Khusus 60cmx160cm\n3.Tiang Roll Banner Menggunakan Alumunium(Moving Roll Up)\n\nProses Pengerjaan:\n1. Jika sudah memiliki desain dan siap cetak, akan diproses di hari saat orderan masuk.\n2. Jika belum memiliki desain. Ada jasa pengerjaan desain dan produk di kirim 2-3 hari\n\n** Happy Shopping **', 1600, 185000, 'Roll Up Banner, Albatros,60x160', 'RB-003', '60cm x 160 cm', '', '2024-12-31 12:56:00', '2024-12-31 12:56:00'),
(64, 1, 1, 'Roll Up Banner 4 | Stand Banner Alumunium(Moving Roll Up) | Bahan  Luster', '17298669416.png', 'CETAK ROLL UP BANNER\nSpesifikasi \n1. Bahan Luster\n2.Ukuran Khusus 60cmx160cm\n3.Tiang Roll Banner Menggunakan Alumunium(Moving Roll Up)\n\nProses Pengerjaan:\n1. Jika sudah memiliki desain dan siap cetak, akan diproses di hari saat orderan masuk.\n2. Jika belum memiliki desain. Ada jasa pengerjaan desain dan produk di kirim 2-3 hari\n\n** Happy Shopping **', 2000, 200000, 'Roll Up Banner, Luster,60x160', 'RB-004', '60cm x 160 cm', '', '2024-12-31 12:59:00', '2024-12-31 12:59:00'),
(65, 1, 1, 'Roll Up Banner 5 | Stand Banner Alumunium(Moving Roll Up) | Bahan Flexy Korea 380gsm', '17302712241.png', 'CETAK ROLL UP BANNER\nSpesifikasi \n1. Bahan Flexy Korea 380gsm \n2.Terdapat 2 ukuran dengan harga sama yaitu khusus 85cm x 200cm dan 80cm x200cm\n3.Tiang Roll Banner Menggunakan Alumunium(Moving Roll Up)\n\nProses Pengerjaan:\n1. Jika sudah memiliki desain dan siap cetak, akan diproses di hari saat orderan masuk.\n2. Jika belum memiliki desain. Ada jasa pengerjaan desain dan produk di kirim 2-3 hari\n\n** Happy Shopping **', 3000, 222000, 'Roll Up Banner,Flexy Korea 380gsm,85x200,80x200', 'RB-005', '85cm x 200cm,  80cm x 200cm', '', '2024-12-31 13:01:00', '2024-12-31 13:01:00'),
(66, 1, 1, 'Roll Up Banner 6 | Stand Banner Alumunium(Moving Roll Up) | Bahan Flexy Korea 440gsm', '17298671601.png', 'CETAK ROLL UP BANNER\nSpesifikasi \n1. Bahan Flexy Korea 440gsm\n2.Terdapat 2 ukuran dengan harga sama yaitu khusus 85cm x 200cm dan 80cm x200cm\n3.Tiang Roll Banner Menggunakan Alumunium(Moving Roll Up)\n\nProses Pengerjaan:\n1. Jika sudah memiliki desain dan siap cetak, akan diproses di hari saat orderan masuk.\n2. Jika belum memiliki desain. Ada jasa pengerjaan desain dan produk di kirim 2-3 hari\n\n** Happy Shopping **', 3000, 245000, 'Roll Up Banner, Flexy Korea 440, 85x200,80x200', 'RB-006', '85cm x 200 cm, 80cm x 200cm', '', '2024-12-31 13:04:00', '2024-12-31 13:04:00'),
(67, 1, 1, 'Roll Up Banner 7 | Stand Banner Alumunium(Moving Roll Up) | Bahan Luster', '17302681129.png', 'CETAK ROLL UP BANNER\nSpesifikasi \n1. Bahan Luster\n2.Terdapat 2 ukuran dengan harga sama yaitu khusus 85cm x 200cm dan 80cm x200cm\n3.Tiang Roll Banner Menggunakan Alumunium(Moving Roll Up)\n\nProses Pengerjaan:\n1. Jika sudah memiliki desain dan siap cetak, akan diproses di hari saat orderan masuk.\n2. Jika belum memiliki desain. Ada jasa pengerjaan desain dan produk di kirim 2-3 hari\n\n** Happy Shopping **', 3000, 270000, 'Roll Up Banner, Luster,80x200,85x200', 'RB-007', '80cm x 200cm, 85cm x 200cm', '', '2024-12-31 13:06:00', '2024-12-31 13:06:00'),
(68, 1, 1, 'Roll Up Banner 8 | Stand Banner Alumunium(Moving Roll Up) | Bahan Albatros', '17302706969.png', 'CETAK ROLL UP BANNER\nSpesifikasi \n1. Bahan Albatros & Flexy Korea 380gsm\n2.Terdapat 2 ukuran dengan harga sama yaitu khusus 85cm x 200cm dan 80cm x200cm\n3.Tiang Roll Banner Menggunakan Alumunium(Moving Roll Up)\n\nProses Pengerjaan:\n1. Jika sudah memiliki desain dan siap cetak, akan diproses di hari saat orderan masuk.\n2. Jika belum memiliki desain. Ada jasa pengerjaan desain dan produk di kirim 2-3 hari\n\n** Happy Shopping **', 3000, 220000, 'Roll Up Banner ,Albatros, 80x200 x 85x200', 'RB-008', '80cm x 200cm,85cm x 200cm', '', '2024-12-31 13:06:00', '2024-12-31 13:06:00'),
(69, 1, 1, 'Roll Up Banner 9 | Stand Banner Alumunium(Moving Roll Up) | Bahan Flexy Korea 440gsm', '17300682325.png', 'CETAK ROLL UP BANNER\nSpesifikasi \n1. Bahan Flexy Korea 440gsm\n2.Ukuran Khusus 80mx200cm\n3.Tiang Roll Banner Menggunakan Alumunium(Moving Roll Up)\n\nProses Pengerjaan:\n1. Jika sudah memiliki desain dan siap cetak, akan diproses di hari saat orderan masuk.\n2. Jika belum memiliki desain. Ada jasa pengerjaan desain dan produk di kirim 2-3hari\n\n** Happy Shopping **', 3000, 247000, 'Roll Up Banner ,Bahan Flexy Korea 440gsm,80x200', 'RB-009', '80cm x 200cm', '', '2024-12-31 13:10:00', '2024-12-31 13:10:00'),
(71, 1, 1, 'X Banner 1 | Cetak X-Banner Stand | Albatros', '17298674756.png', 'CETAK X-BANNER\nSpesifikasi \n1. Bahan Albatros (penggunaan indoor)\n2.Ukuran Khusus 60cmx160cm\n3.Stand rangka X-banner premiun\n\nProses Pengerjaan:\n1. Jika sudah memiliki desain dan siap cetak, akan diproses di hari saat orderan masuk.\n2. Jika belum memiliki desain. Ada jasa pengerjaan desain dan produk di kirim 2-3hari\n\n** Happy Shopping **', 1000, 81000, 'X-banner,Albatros,60x160', 'RB-010', '60cm x 160cm', '', '2024-12-31 13:12:00', '2024-12-31 13:12:00'),
(72, 1, 2, 'Cetak Sablon Tali Lanyard | Full Printing | Sisi Depan | 1 Sisi', '17298679532.png', 'CETAK SABLON TALI LANYARD\n\nSpesifikasi:\n1. Ukuran MentahTali 90cm(45cm setelah jadi)\n2. Kait Cantelan Besi di Ujung Tali Lanyard\n3. Bahan Nilon Lebar 2cm\n4. Full Printing\n5. Minimal Order 10pcs\n6. Harga tertera adalah harga per pcs\n\nCatatan:\n-Pilihan Sablon 1 sisi(Tulisan hanya bagian depan, belakang polos)\n-Jika sudah memiliki desain bisa diunggah langsung pada button tersedia\n\n** Happy Shopping **', 20, 10000, 'Sablon Tali Lanyard , 1 Sisi', 'LNY-001', 'Merah, Kuning,Hijau, Hitam, Biru, Putih', '', '2024-12-31 13:15:00', '2024-12-31 13:15:00'),
(73, 1, 2, 'Cetak Sablon Tali Lanyard | Full Printing | Sisi Depan Belakang | 2 Sisi', '17298680075.png', 'CETAK SABLON TALI LANYARD 2 SISI\n\nSpesifikasi:\n1. Ukuran MentahTali 90cm(45cm setelah jadi)\n2. Kait Cantelan Besi di Ujung Tali Lanyard\n3. Bahan Nilon Lebar 2cm\n4. Full Printing\n5. Minimal Order 10pcs\n6. Harga tertera adalah harga per pcs\n\nCatatan:\n-Pilihan Sablon 2 sisi(Tulisan  ada bagian depan dan belakang )\n-Jika sudah memiliki desain bisa diunggah langsung pada button tersedia\n\n** Happy Shopping **', 20, 20000, 'Sablon Tali Lanyard, Sablon 2 Sisi', 'LNY-002', 'Merah, Kuning,Hijau, Hitam , Biru, Putih', '', '2024-12-31 14:02:00', '2024-12-31 14:02:00'),
(74, 1, 2, 'Cetak Sablon Tali Lanyard Costum | Sisi Depan Belakang | 2 Sisi', '17298681071.png', 'CETAK SABLON TALI LANYARD 2 SISI\n\nSpesifikasi:\n1. Bahan Nilom lebar 2 cm\n2. Ukuran mentah 90cm(Ukuran Tali Jadi 45cm)\n3. Full Printing\n4.  Kait cantelan besi di ujung tali lanyard\n5. Minimal Order 10pcs\n6. Harga tertera adalah harga per pcs\n\nCara order:\n-Pilihan Sablon 2  sisi dengan costum corak warna yang banyak(Tulisan ada dibagian depan dan belakang)\n-Jika sudah memiliki desain bisa diunggah langsung pada button tersedia\n\n** Happy Shopping **', 20, 23000, 'Sablon Tali Lanyard Costum, Sablon 2 Sisi', 'LNY-013', 'Merah, Kuning,Hijau, Hitam , Biru, Putih', '', '2024-12-31 13:06:00', '2024-12-31 13:06:00'),
(75, 1, 2, 'Cetak Sablon Tali Lanyard Costum | Sisi Depan | 1 Sisi', '17298681737.png', 'CETAK SABLON TALI LANYARD 1 SISI\n\nSpesifikasi:\n1. Bahan Nilom lebar 2 cm\n2. Ukuran mentah 90cm(Ukuran Tali Jadi 45cm)\n3. Full Printing\n4.  Kait cantelan besi di ujung tali lanyard\n5. Minimal Order 10pcs\n6. Harga tertera adalah harga per pcs\n\nCara order:\n-Pilihan Sablon 1  sisi dengan costum corak warna yang banyak(Tulisan hanya bagian depan, belakang polos)\n-Jika sudah memiliki desain bisa diunggah langsung pada button tersedia\n\n** Happy Shopping **', 20, 12000, 'Sablon Tali Lanyard Costum, Sablon 1 Sisi', 'LNY-019', 'Merah, Kuning,Hijau, Hitam , Biru, Putih', '', '2024-12-31 14:15:00', '2024-12-31 14:15:00'),
(76, 1, 2, 'ID Card PVC | SISI DEPAN | PVC Premium', '17298685274.png', 'CETAK ID CARD PVC 1 SISI\n\nSpesifikasi:\n1. Minimal order 10 pcs\n2. Menggunakan Bahan PCV dengan ketebalan 0,76 micron\n3. Cetak untuk 1 sisi\n4. Produk kuat dan tahan lama\n5. Terdapat lubang pengait pada bagian tengah atas \n6. Harga tertera adalah harga per pcs\n\n** Happy Shopping **', 7, 5000, 'ID Card PVC, 1 Sisi', 'ICP-001', '8.6cm x 5.4cm', '', '2024-12-31 14:17:00', '2024-12-31 14:17:00'),
(77, 1, 2, 'ID Card PVC | SISI DEPAN BELAKANG | PVC Premium', '17298686017.png', 'CETAK ID CARD PVC 2 SISI\n\nSpesifikasi:\n1. Minimal order 10 pcs\n2. Menggunakan Bahan PCV dengan ketebalan 0,76 micron\n3. Cetak untuk 2 sisi yaitu tampak depan dan belakang\n4. Produk kuat dan tahan lama\n5. Terdapat lubang pengait pada bagian tengah atas\n6. Harga tertera adalah harga per pcs\n\n** Happy Shopping **', 7, 10000, 'ID Card PVC, 2 Sisi', 'ICP-002', '8.6cm x 5.4cm', '', '2024-12-31 14:19:00', '2024-12-31 14:19:00'),
(78, 1, 2, 'Casing ID Card | Card Holder', '17298688057.png', 'CASING ID CARD / CARD HOLDER \n\nSpesifikasi:\n1. Casing id card terbuat dari plastik tebal yang tidak mudah ditekuk atau dilipat. \n2. Casing Id Card transparan untuk bagian depan. identitas ukuran kartu standar\n3. Ukuran casing : 11cm x 7cm\n4. Ukuran kartu dalam : 5,4cm x 8,5cm\n5. Harga diatas harga card per pcs tanpa tambahan tali\n\n** Happy Shopping **', 28, 4000, 'Casing ID Card', 'CID-001', 'Merah, Kuning,Hijau, Hitam, Biru, Putih', '', '2024-12-31 14:23:00', '2024-12-31 14:23:00'),
(79, 1, 3, 'Cetak Spanduk | Bahan Flexy 340gram | Ukuran 1x1(permeter)', '17298689611.png', 'CETAK SPANDUK SESUAI UKURAN \n\nSpesifikasi: \n1. Cetak spanduk dengan harga per meter adalah 30rb \n2. Bahan menggunakan flexy 340gsm yang berkualitas \n3, Finishing menggunakan 4 mata ayam di setiap ujung nya. Jika tidak menggunakan harap cantumkan catatan \n4. Perhitungan harga tertera adalah per meter\n\nDetail Order :\n1. Harga 1 meter persegi (100cm x 100cm) \n2. Jika pesan ukuran 0.5 x 1m. Pemesanan dilakukan 1 kali add\n3. Jika pesan ukuran 2 x 1.5 m. Pemesanan di lakukan 4 kali add(panjang dan lebar ditambah lalu dibulatkan karena hitungan bahan permeter)\n4. Jika sudah mempunyai desain, bisa langsung diunggah dan akan diproses dihari yang sama \n5. Jika belum memiliki desain, harap menambahkan jasa desain dan bisa mengunggah desain kasar\n\n** Happy Shopping **', 400, 30000, 'Spanduk, Flexy 340', 'SPD-001', '1mx1m', '', '2025-01-01 00:10:00', '2025-01-01 00:10:00'),
(80, 1, 3, 'Cetak Spanduk | Bahan Flexy 440gsm | Ukuran 1x1(permeter)', '17298690153.png', 'CETAK SPANDUK SESUAI UKURAN \n\nSpesifikasi: \n1. Cetak spanduk dengan harga per meter adalah 35rb \n2. Bahan menggunakan flexy 440gsm yang berkualitas \n3, Finishing menggunakan 4 mata ayam di setiap ujung nya. Jika tidak menggunakan harap cantumkan catatan \n4. Perhitungan harga tertera adalah per meter\n\nDetail Order :\n1. Harga 1 meter persegi (100cm x 100cm) \n2. Jika pesan ukuran 0.5 x 1m. Pemesanan dilakukan 1 kali add\n3. Jika pesan ukuran 2 x 1.5 m. Pemesanan di lakukan 4 kali add(panjang dan lebar ditambah lalu dibulatkan karena hitungan bahan permeter)\n4. Jika sudah mempunyai desain, bisa langsung diunggah dan akan diproses dihari yang sama \n5. Jika belum memiliki desain, harap menambahkan jasa desain dan bisa mengunggah desain kasar\n\n** Happy Shopping **', 500, 35000, 'Spanduk, Flexy 440', 'SPD-002', '1mx1m', '', '2025-01-01 03:10:00', '2025-01-01 03:10:00'),
(81, 1, 3, 'Cetak Banner | Bahan Flexy 340gsm | Ukuran 1x1(permeter)', '17298690734.png', 'CETAK BANNER SESUAI UKURAN \n\nSpesifikasi: \n1. Cetak spanduk dengan harga per meter adalah 30rb \n2. Bahan menggunakan flexy 340gsm yang berkualitas \n3, Finishing menggunakan 4 mata ayam di setiap ujung nya. Jika tidak menggunakan harap cantumkan catatan \n4. Perhitungan harga tertera adalah per meter\n\nDetail Order :\n1. Harga 1 meter persegi (100cm x 100cm) \n2. Jika pesan ukuran 0.5 x 1m. Pemesanan dilakukan 1 kali add\n3. Jika pesan ukuran 2 x 1.5 m. Pemesanan di lakukan 4 kali add(panjang dan lebar ditambah lalu dibulatkan karena hitungan bahan permeter)\n4. Jika sudah mempunyai desain, bisa langsung diunggah dan akan diproses dihari yang sama \n5. Jika belum memiliki desain, harap menambahkan jasa desain dan bisa mengunggah desain kasar\n\n** Happy Shopping **', 400, 30000, 'Banner, Flexy 340', 'BAN-001', '1mx1m', '', '2025-01-01 05:11:00', '2025-01-01 05:11:00'),
(82, 1, 3, 'Cetak Banner | Bahan Flexy 440gsm | Ukuran 1x1(permeter)', '17298691132.png', 'CETAK BANNER SESUAI UKURAN \n\nSpesifikasi: \n1. Cetak spanduk dengan harga per meter adalah 35rb \n2. Bahan menggunakan flexy 440gsm yang berkualitas \n3, Finishing menggunakan 4 mata ayam di setiap ujung nya. Jika tidak menggunakan harap cantumkan catatan \n4. Perhitungan harga tertera adalah per meter\n\nDetail Order :\n1. Harga 1 meter persegi (100cm x 100cm) \n2. Jika pesan ukuran 0.5 x 1m. Pemesanan dilakukan 1 kali add\n3. Jika pesan ukuran 2 x 1.5 m. Pemesanan di lakukan 4 kali add(panjang dan lebar ditambah lalu dibulatkan karena hitungan bahan permeter)\n4. Jika sudah mempunyai desain, bisa langsung diunggah dan akan diproses dihari yang sama \n5. Jika belum memiliki desain, harap menambahkan jasa desain dan bisa mengunggah desain kasar\n\n** Happy Shopping **', 500, 35000, 'Banner, Flexy 440', 'BAN-002', '1mx1m', '', '2025-01-01 05:13:00', '2025-01-01 05:13:00'),
(83, 1, 4, 'Cetak Backdrop | Bahan Flexy 280gsm | Ukuran 1mx1m', '17299378862.png', 'CETAK BACKDROP UKURAN 1X1\n\nSpesifikasi: \n1. Cetak backdrop khusus ukuran 1m x 1m\n2. Bahan menggunakan flexy 280gsm yang berkualitas \n3, Finishing menggunakan 4 mata ayam di setiap ujung nya. Jika tidak menggunakan harap cantumkan catatan \n4. Produk berkualitas dan high resolution\n\n** Happy Shopping **', 1000, 50000, 'Backdrop,Flexy 280gs,,1mx1m', 'BDP-001', '1mx1m', '', '2025-01-01 10:18:00', '2025-01-01 10:18:00'),
(84, 1, 4, 'Cetak Backdrop | Bahan Flexy 280gsm | Ukuran 1mx1,5m', '17299379305.png', 'CETAK BACKDROP UKURAN 1X1.5\n\nSpesifikasi: \n1. Cetak backdrop khusus ukuran 1m x 1.5m\n2. Bahan menggunakan flexy 280gsm yang berkualitas \n3, Finishing menggunakan 4 mata ayam di setiap ujung nya. Jika tidak menggunakan harap cantumkan catatan \n4. Produk berkualitas dan high resolution\n\n** Happy Shopping **', 3, 70000, 'Backdrop,Flexy 280gs,,1mx1.5m', 'BDP-002', '1mx1.5m', '', '2025-01-01 10:20:00', '2025-01-01 10:20:00'),
(85, 1, 4, 'Cetak Backdrop | Bahan Flexy 280gsm | Ukuran 1mx2m', '17299379776.png', 'CETAK BACKDROP UKURAN 1X2\n\nSpesifikasi: \n1. Cetak backdrop khusus ukuran 1m x 2m\n2. Bahan menggunakan flexy 280gsm yang berkualitas \n3, Finishing menggunakan 4 mata ayam di setiap ujung nya. Jika tidak menggunakan harap cantumkan catatan \n4. Produk berkualitas dan high resolution\n\n** Happy Shopping **', 3, 85000, 'Backdrop,Flexy 280gs,,1mx2m', 'BDP-003', '1mx2m', '', '2025-01-01 10:23:00', '2025-01-01 10:23:00'),
(86, 1, 4, 'Cetak Backdrop | Bahan Flexy 280gsm | Ukuran 1.5mx1.5m', '17299380667.png', 'CETAK BACKDROP UKURAN 1.5X1.5\n\nSpesifikasi: \n1. Cetak backdrop khusus ukuran 1.5m x 1.5m\n2. Bahan menggunakan flexy 280gsm yang berkualitas \n3, Finishing menggunakan 4 mata ayam di setiap ujung nya. Jika tidak menggunakan harap cantumkan catatan \n4. Produk berkualitas dan high resolution\n\n** Happy Shopping **', 3, 95000, 'Backdrop,Flexy 280gsm,1.5mx1.5m', 'BDP-004', '1.5mx1.5m', '', '2025-01-01 10:26:00', '2025-01-01 10:26:00'),
(87, 1, 4, 'Cetak Backdrop | Bahan Flexy 280gsm | Ukuran 2mx1.5m', '17299381308.png', 'CETAK BACKDROP UKURAN 2X1.5\n\nSpesifikasi: \n1. Cetak backdrop khusus ukuran 2m x 1.5m\n2. Bahan menggunakan flexy 280gsm yang berkualitas \n3, Finishing menggunakan 4 mata ayam di setiap ujung nya. Jika tidak menggunakan harap cantumkan catatan \n4. Produk berkualitas dan high resolution\n\n** Happy Shopping **', 3, 115000, 'Backdrop,Flexy 280gsm,2mx1.5m', 'BDP-005', '2mx1,5m', '', '2025-01-01 10:30:00', '2025-01-01 10:30:00'),
(88, 1, 4, 'Cetak Backdrop | Bahan Flexy 280gsm | Ukuran 2mx2m', '17299381844.png', 'CETAK BACKDROP UKURAN 2X2\n\nSpesifikasi: \n1. Cetak backdrop khusus ukuran 2m x 2m\n2. Bahan menggunakan flexy 280gsm yang berkualitas \n3, Finishing menggunakan 4 mata ayam di setiap ujung nya. Jika tidak menggunakan harap cantumkan catatan \n4. Produk berkualitas dan high resolution\n\n** Happy Shopping **', 2500, 130000, 'Backdrop,Flexy 280gsm,2mx2m', 'BDP-006', '2mx2m', '', '2025-01-01 12:17:00', '2025-01-01 12:17:00'),
(89, 1, 5, 'Cetak Stiker Chromo A3 | Stiker Bulat | Free Cutting', '17299383317.png', 'CETAK STIKER A3 BAHAN CHROMO - BULAT\n\nSpesifikasi:\n1. Ukuran stiker pada lembar A3\n2. Bahan chromo anti air\n3. Minimal order 3 lembar\n4. Free Cutting. Jika tidak dicutting, cantumkan catatan. \n5. Stiker dicetak sesuai ketentuan\n\nDetail Ukuran:\n1. 3.5cm x 3.5cm = 77 pcs/lembar\n2. 4cm x 4cm = 80 pcs/lembar\n3. 5cm x 5cm = 40 pcs/lembar\n4. 6cm x 6cm = 28 pcs/lembar\n5. 7cm x 7cm = 24 pcs/lembar\n6. 8cm x 8cm = 15 pcs/lembar\n7. 9cm x 9cm = 12 pcs/lembar\n\n** Happy Shopping **', 10, 15000, 'Stiker Bulat Chromo A3', 'BLT-A3-CRM-001', '3.5 x 3.5, 4x4, 5x5, 6 x 6 ,7x7, 8x8,9x9', '', '2025-01-01 12:25:00', '2025-01-01 12:25:00'),
(90, 1, 5, 'Cetak Stiker Chromo A3 | Stiker Kotak | Free Cutting', '17299385519.png', 'CETAK STIKER A3 BAHAN CHROMO - KOTAK\n\nSpesifikasi:\n1. Ukuran stiker pada lembar A3\n2. Bahan chromo anti air\n3. Minimal order 3 lembar\n4. Free Cutting. Jika tidak dicutting, cantumkan catatan. \n5. Stiker dicetak sesuai ketentuan\n\nDetail Ukuran:\n1. 3.5cm x 3.5cm = 88 pcs/lembar\n2. 4cm x 4cm = 60 pcs/lembar\n3. 5cm x 5cm = 40 pcs/lembar\n4. 6cm x 6cm = 28 pcs/lembar\n5. 7cm x 7cm = 24 pcs/lembar\n6. 8cm x 8cm = 15 pcs/lembar\n7. 9cm x 9cm = 12 pcs/lembar\n\n** Happy Shopping **', 10, 15000, 'Stiker Kotak Chromo A3', 'KTK-A3-CRM-002', '3.5 x 3.5, 4x4, 5x5, 6 x 6 ,7x7, 8x8,9x9', '', '2025-01-01 12:29:00', '2025-01-01 12:29:00'),
(91, 1, 5, 'Cetak Stiker Chromo A3 | Stiker Persegi | Free Cutting', '17299386184.png', 'CETAK STIKER A3 BAHAN CHROMO - PERSEGI\n\nSpesifikasi:\n1. Ukuran stiker pada lembar A3\n2. Bahan chromo anti air\n3. Minimal order 3 lembar\n4. Free Cutting. Jika tidak dicutting, cantumkan catatan. \n5. Stiker dicetak sesuai ketentuan\n\nDetail Ukuran:\n1. 3.5cm x 3.5cm = 77 pcs/lembar\n2. 4cm x 4cm = 52 pcs/lembar\n3. 5cm x 5cm = 40 pcs/lembar\n4. 6cm x 6cm = 30 pcs/lembar\n5. 7cm x 7cm = 24 pcs/lembar\n6. 8cm x 8cm = 20 pcs/lembar\n7. 9cm x 9cm = 16 pcs/lembar\n\n** Happy Shopping **', 10, 15000, 'Stiker Persegi Chromo A3', 'PSG-A3-CRM-001', '3.5 x 3.5, 4x4, 5x5, 6 x 6 ,7x7, 8x8,9x9', '', '2025-01-01 12:33:00', '2025-01-01 12:33:00'),
(92, 1, 5, 'Cetak Stiker Chromo A3 | Stiker Oval | Free Cutting', '17299386651.png', 'CETAK STIKER A3 BAHAN CHROMO - OVAL\n\nSpesifikasi:\n1. Ukuran stiker pada lembar A3\n2. Bahan chromo anti air\n3. Minimal order 3 lembar\n4. Free Cutting. Jika tidak dicutting, cantumkan catatan. \n5. Stiker dicetak sesuai ketentuan\n\nDetail Ukuran:\n1. 3.5cm x 3.5cm = 65 pcs/lembar\n2. 4cm x 4cm = 54 pcs/lembar\n3. 5cm x 5cm = 40 pcs/lembar\n4. 6cm x 6cm = 24 pcs/lembar\n5. 7cm x 7cm = 21 pcs/lembar\n6. 8cm x 8cm = 16 pcs/lembar\n7. 9cm x 9cm = 9 pcs/lembar\n\n** Happy Shopping **', 10, 15000, 'Stiker Oval Chromo A3', 'OVL-A3-CRM-001', '3.5 x 3.5, 4x4, 5x5, 6 x 6 ,7x7, 8x8,9x9', '', '2025-01-01 12:35:00', '2025-01-01 12:35:00'),
(93, 1, 6, 'Flayer Art  Paper | Sisi Depan | A4', '17301056076.png', 'FLAYER ART PAPER 1 SISI\n\nSpesifikasi:\n1. Bahan Art Paper dengan 150Gsm\n2. Ukuran Flayer art A4(21cm x 29.7cm)\n3. Order minimal 100pcs\n4. Jika sudah memiliki desain maka boleh langsung diunggah\n\n** Happy Shopping **', 25, 3000, 'Flayer Art, 1 Sisi, A4', 'FL-A4-1M', '21cm x 29.7cm (A4)', '', '2025-01-01 12:38:00', '2025-01-01 12:38:00'),
(94, 1, 6, 'Flayer Art Paper | Sisi Depan Belakang | A4', '17301056415.png', 'FLAYER ART PAPER 2 SISI\n\nSpesifikasi:\n1. Bahan Art Paper dengan 150Gsm\n2. Ukuran Flayer art A4(21cm x 29.7cm)\n3. Order minimal 100pcs\n4. Jika sudah memiliki desain maka boleh langsung diunggah\n\n** Happy Shopping **', 25, 6000, 'Flayer Art, 2 Sisi, A4', 'FL-A4-2M', '21cm x 29,7cm (A4)', '', '2025-01-01 12:41:00', '2025-01-01 12:41:00'),
(95, 1, 6, 'Flayer Art Paper | Sisi Depan | A5', '17301056514.png', 'FLAYER ART PAPER 2 SISI\n\nSpesifikasi:\n1. Bahan Art Paper dengan 150Gsm\n2. Ukuran Flayer art A5(21cm x 14.8cm)\n3. Order minimal 100pcs\n4. Jika sudah memiliki desain maka boleh langsung diunggah\n\n** Happy Shopping **', 25, 2000, 'Flayer Art, 1 Sisi, A5', 'FL-A5-3M', '21cm x 14,8cm (A5)', '', '2025-01-01 12:45:00', '2025-01-01 12:45:00'),
(96, 1, 6, 'Flayer Art Paper | Sisi Depan Belakang | A5', '17301056617.png', 'FLAYER ART PAPER 2 SISI\n\nSpesifikasi:\n1. Bahan Art Paper dengan 150Gsm\n2. Ukuran Flayer art A5(21cm x 14,8cm)\n3. Order minimal 100pcs\n4. Jika sudah memiliki desain maka boleh langsung diunggah\n\n** Happy Shopping **', 25, 4000, 'Flayer Art, 2 Sisi, A5', 'FL-A5-4M', '21cm x 14,8cm(A5)', '', '2025-01-01 12:50:00', '2025-01-01 12:50:00'),
(97, 2, 7, 'Map L Folio F4 | Folder One', '17299392141.png', 'MAP L FOLIO UKURAN F4\n\nSpesifikasi:\n1. Ukuran Produk F4(23x34cm)\n2. Pembelian 1 pack Isi 12 pcs\n3. Map L biasa untuk penyimpanan dokumen, kertas, dll\n4. Merk Produk: Folder One\n5. Harga tertera adalah harga per pcs\n\n** Happy Shopping **', 15, 2000, 'Map L Folio', 'MP-F4', 'Merah, Kuning,Hijau, Biru,Putih', '', '2025-01-01 12:52:00', '2025-01-01 12:52:00'),
(98, 2, 7, 'Map Kertas Biasa | Isi 50 pcs', '17299393768.png', 'MAP KERTAS BIASA \n\nSpesifikasi:\n1. Pembelian 1 pack isi 50pcs\n2. Terdapat 4 pilihan warna \n3. Biasa digunakan untuk menyimpan dokumen, kertas, dll\n4. Produk bagus dan berkualitas \n5. Harga tertera adalah harga per pcs', 35, 3000, 'Map Kertas Biasa', 'MP-50', 'Merah, Kuning,Hijau, Biru', '', '2025-01-01 12:55:00', '2025-01-01 12:55:00'),
(99, 2, 7, 'Paper Clip Joyko | Penjepit Kertas No 3', '17299395511.png', 'PAPER CLIP PENJEPIT KERTAS\n\nSpesifikasi:\n1. Paper clip untuk menjepit kertas\n2. Merk Joyko\n3. Harga tertera adalah harga 1 dus kecil\n\n** Happy Shopping **', 40, 2000, 'Paper Clip', 'PC-3', '25mm', '', '2025-01-01 12:58:00', '2025-01-01 12:58:00'),
(100, 2, 7, 'Folder One | Map Plastik F4', '17299396649.png', 'MAP PLASTIK F4\n\nSpesifikasi:\n1. Map plastik bening berukuran folio\n2. Tersedia 4 Macam Warna\n3. Pembelian 1 pack isi 12 pcs\n4. Merk Folder One\n5. Harga tertera  adalah harga per pcs\n\n** Happy Shopping **', 40, 3000, 'Map Plastik F4', 'MP-12', 'Merah, Kuning,Hijau, Biru', '', '2025-01-01 13:04:00', '2025-01-01 13:04:00'),
(101, 2, 7, 'Gunting Joyko SC-828 | Gunting Kecil', '17299397546.png', 'GUNTING JOYKO SC-828\n\nSpesifikasi:\n1. Gunting tajam , berkualitas dan tidak mudah berkarat\n2. Harga diatas adalah harga per pcs\n3. Ukuran : P 12cm x L 6,5cm\n4. Material stainless stell\n\n** Happy Shopping **', 50, 7000, 'Gunting 828 Joyko', 'GT-JYK-828', '-', '', '2025-01-01 13:06:00', '2025-01-01 13:06:00'),
(102, 2, 7, 'Isi Steples | No 10', '17299398162.png', 'ISI STEPLES NO 10\n\nSpesifikasi:\n1. Refill stepler No 10\n2. Merk Kenko\n3. Biasa digunakan untuk stapler HD 10\n4. Harga tertera adalah harga per 1 dus kecil\n\n** Happy Shopping **', 35, 3000, 'Isi Steples No 10', 'ISP-10', '-', '', '2025-01-01 13:09:00', '2025-01-01 13:09:00'),
(103, 2, 7, 'Binder Clip No 111 | Isi 12 pcs', '17299399057.png', 'BINDER CLIP NO 111 ISI 12 PCS\n\nSpesifikasi:\n1. Merk Joyko \n2. Biasa digunakan penjepit kertas \n3. 1 dus isi 12 pcs\n4. Harga tertera adalah harga per dus\n\n** Happy Shopping **', 60, 15000, 'Binder Clip No 111', 'BC-111', 'Kecil', '', '2025-01-01 13:12:00', '2025-01-01 13:12:00'),
(104, 2, 7, 'Lem Stick | Glue Stick Kenko 8gr', '17299399916.png', 'LEM STICK KENKO \n\nSpesifikasi:\n1. Lem sangat mudah digunakan \n2. Cocok untuk merekatkan kertas, foto, dan bahan lainnya\n3. Kecil dan praktis untuk dibawa kemana saja \n4. Harga tertera adalah harga per pcs\n\n** Happy Shopping **', 60, 2500, 'Lem Stick Kenko', 'LS-KN-8', 'P 8cm x D 2cm', '', '2025-01-01 13:14:00', '2025-01-01 13:14:00'),
(105, 2, 7, 'Map Coklat Tali', '17299509756.png', 'MAP COKLAT TALI \n\nSpesifikasi:\n1. Amplop coklat bertali \n2. Harga diatas adalah harga per-pcs\n3. Varian coklat polos dengan garis pada tepian \n\n** Happy Shopping **', 10, 2000, 'Map Coklat Tali', 'MCT-001', '19.5cm X 27.5cm(Folio)', '', '2025-01-01 13:16:00', '2025-01-01 13:16:00'),
(106, 2, 7, 'Map Plastik Resleting | Folio Zipper Bag', '17299510461.png', 'MAP PLASTIK RESLETING \n\nSpesifikasi:\n1. Terdapat 4 pilihan warna \n2. Cocok digunakan untuk penyimpanan dokumen \n3. Ukuran : 39cm x 27cm x 3 cm\n4. Terdapat jaring pemisah didalam map yang bisa muat lebih banyak dan luas\n\n** Happy Shopping **', 175, 10000, 'Map Plastik Resleting', 'MPR-001', 'Merah(F4), Kuning(F4),Hijau(F4), Biru(F4)', '', '2025-01-01 13:18:00', '2025-01-01 13:18:00'),
(107, 2, 7, 'Inter Bussines File F4 Folio | 1 pcs', '17299511999.png', 'INTER BUSSINES FILE F4\n\nSpesifikasi:\n1. Produk tanpa pocket berbahan plastik lentur\n2. Ukuran produk 34cm x 23,5cm\n3. Terdapat 7 pilihan warna \n4. Harga tertera harga per-pcs\n5. Penggunaan penyimpanan kertas ukuran folio dengan kapasitas +-50lembar\n\n** Happy Shopping **', 50, 3000, 'Inter Bussines File F4', 'IBF-F4', 'Merah, Kuning,Hijau, Abu-Abu, Biru, Putih, Ungu', '', '2025-01-01 13:21:00', '2025-01-01 13:21:00'),
(108, 2, 7, 'Lakban 90yard | Bening Coklat | Lebar 2 inch', '17299513506.png', 'LAKBAN 90 YARD \n\nSpesifikasi:\n1. Terdapat 2 pilihan warna yaitu coklat dan bening \n2. Produk berkualitas, aman, dan daya rekat yang kuat \n3. Harga tertera harga per-pcs\n\n** Happy Shopping **', 170, 6000, 'Lakban 90yard', 'LK90-BN-CKT', 'Bening, Coklat', '', '2025-01-01 13:23:00', '2025-01-01 13:23:00'),
(109, 2, 7, 'Staples Hd 10 | Tokyo Design | Original', '17299514344.png', 'STAPLES HD 10 TOKYO DESIGN \n\nSpesifikasi:\n1. Staples gede model HD 10ML\n2. Produk terbuat dari plastik dan besi sehingga kokok, tahan lama, dan awet\n3. Terdapat 6 pilihan warna. dikirim random sesuai stok toko\n4. Produk simple dan mudah digunakan\n\n** Happy Shopping **', 150, 15000, 'Staples Hd 10 Tokyo Design', 'SH10-TD', '9cmx 4.2cm', '', '2025-01-01 13:27:00', '2025-01-01 13:27:00'),
(110, 2, 7, 'Nota Kontan Paperline | 2 Ply', '17299515602.png', 'NOTA KONTAN PAPERLINE - 2 PLY\n\nSpesifikasi:\n1. Produk merk paperline \n2. Terdiri dari 2 ply sehingga mudah penggunaan\n3. Terbuat dari bhan HVS & NCR\n4. Isi 25set(50lembar)\n5. Harga tertera adalah harga per-pcs\n\n** Happy Shopping **', 130, 5000, 'Nota Paperline,2ply', 'NKP-2', '16cm x 21 cm', '', '2025-01-01 13:35:00', '2025-01-01 13:35:00'),
(111, 2, 7, 'Kwitansi Besar  | Paperline 1 ply | 40sheet', '17299516468.png', 'KWITANSI PAPERLINE ISI 40SHEET\n\nSpesifikasi :\n1. Produk merk paperline\n2. Produk tipe ukuran 31.5cm x 10.1cm\n3. Warna kertas hijau putih\n4. Harga tertera adalah harga per-pcs\n5. Kwitansi berisi 40sheet\n\n** Happy Shopping **', 140, 13000, 'Kwitansi,1ply,40sheet', 'KW1-40', '31.5cm x 10.1cm', '', '2025-01-01 13:33:00', '2025-01-01 13:33:00'),
(112, 2, 7, 'Gunting Besar | Kenko KS-848', '17301251445.png', 'GUNTING KENKO BESAR \n\nSpesifikasi:\n1. Tipe produk kenko ks-848\n2. Terbuat dari bahan stainless jadi awet dan tajam \n3. Harga tertera adalah harga per-pcs\n\n** Happy Shopping **', 165, 13000, 'Gunting Kenko 848', 'GB-KN848', 'Besar(20.5cm x 7.6cm)', '', '2025-01-01 13:36:00', '2025-01-01 13:36:00'),
(113, 2, 7, 'Isolasi Kecil | Nachi | Bening Transparan', '17299518078.png', 'ISOLASI KECIL \n\nSpesifikasi:\n1. Produk berwarna bening transparan \n2. Produk merk nachi \n3. Harga tertera adalah harga per-pcs\n\n** Happy Shopping **', 10, 2000, 'Isolasi Kecil Nachi', 'ISK-NH', '25yard(1/2\")', '', '2025-01-01 13:39:00', '2025-01-01 13:39:00'),
(114, 2, 7, 'Map Tenteng Kancing | Jaring Berkantong | Tipe 2 Kancing', '17299518938.png', 'MAP TENTENG BERKANCING 2\n\nSpesifikasi:\n1. Produk merk folder one\n2. Map terdiri 2 kancing kanan kiri \n3. Terdapat 4 pilihan warna.\n4. Produk berkualitas dan mudah dibawa\n\n** Happy Shopping **', 110, 13000, 'Map Tenteng 2 Kancing', 'MTK-2', 'Merah, Kuning,Hijau, Biru', '', '2025-01-01 13:42:00', '2025-01-01 13:42:00'),
(115, 3, 8, 'Buku Yasin 176 Halaman | Cover Bludru | Isi Glossy', '17301263855.png', 'BUKU YASIN BLUDRU\n\nSpesifikasi :\n1. Sampul produk bludru tebal \n2. Isi halaman 176\n3. Kertas isi glossy\n4. Terdapat pita pemisah \n5. Minimal order 10pcs\n6. Harga tertera adalah harga per pcs\n\n** Happy Shopping **', 150, 20000, 'Buku Yasin Bludru,176H', 'BY-BL-176', '16cm x 12 cm', '', '2025-01-01 13:45:00', '2025-01-01 13:45:00'),
(116, 3, 8, 'Buku Yasin 176 Halaman | Cover RCP | Isi Glossy', '17301267487.png', 'BUKU YASIN COVER BAHAN RCP \n\nSpesifikasi : \n1. Sampul produk halusan bahan rcp\n2. Isi halaman 176 \n3. Kertas isi glossy \n4. Terdapat pita pemisah\n 5. Minimal order 10pcs\n6. Harga tertera adalah harga per pcs\n\n** Happy Shopping **', 150, 18000, 'Buku Yasin RCP,176H', 'BY-RCP-176', '16cm x 12 cm', '', '2025-01-01 13:48:00', '2025-01-01 13:48:00'),
(117, 3, 8, 'Nota Costum 1 ply | Nota 50 Lembar | Potrait/Landscape | 1/4 Folio', '17299523221.png', 'NOTA COSTUM 50 LEMBAR \n\nSpesifikasi:\n1. Nota costum isi 50 lembar 1 ply\n2. Ukuran nota 1/4 Folio\n3. Bisa request bentuk potrait/landscape\n4. Jika sudah punya desain bisa di unggah langsung\n5. Bahan kertas hvs\n6. Harga tertera adalah harga per pcs\n\n** Happy Shopping **', 200, 7000, 'Nota 1ply,50lembar,1/4F', 'NT1-50-1/4F', '10cm x 16cm', '', '2025-01-01 13:51:00', '2025-01-01 13:51:00'),
(118, 3, 8, 'Nota Costum 1ply | Nota 50 Lembar | Potrait/Landscape | 1/6 Folio', '17299524755.png', 'NOTA COSTUM 50 LEMBAR \nSpesifikasi: \n1. Nota costum isi 50 lembar 1 ply \n2. Ukuran nota 1/6 Folio \n3. Bisa request bentuk potrait/landscape \n4. Jika sudah punya desain bisa di unggah langsung \n5. Bahan kertas hvs\n6. Harga tertera adalah harga per pcs \n\n** Happy Shopping **', 75, 6000, 'Nota 1ply,50lembar,1/6F', 'NT1-50-1/6F', '10cm x 11cm', '', '2025-01-01 13:53:00', '2025-01-01 13:53:00'),
(119, 3, 8, 'Nota Costum 2 ply | Nota 50 Lembar | Potrait/Landscape | 1/4 Folio |', '17299526079.png', 'NOTA COSTUM 50 LEMBAR \n\nSpesifikasi: \n1. Nota costum isi 50 lembar 2 ply \n2. Ukuran nota 1/4 Folio \n3. Bisa request bentuk potrait/landscape \n4. Jika sudah punya desain bisa di unggah langsung \n5. Bahan kertas hvs\n6. Harga tertera adalah harga per pcs\n\n** Happy Shopping **', 1, 7500, 'Nota 2ply,50lembar,1/4F', 'NT2-50-1/4F', '10cm x 16cm', '', '2025-01-01 13:56:00', '2025-01-01 13:56:00'),
(120, 3, 8, 'Nota Costum 2ply | Nota 50 Lembar | Potrait/Landscape | 1/6 Folio', '17299526644.png', 'NOTA COSTUM 50 LEMBAR \n\nSpesifikasi: \n1. Nota costum isi 50 lembar 2ply \n2. Ukuran nota 1/4 Folio \n3. Bisa request bentuk potrait/landscape \n4. Jika sudah punya desain bisa di unggah langsung \n5. Bahan kertas NCR 55gr sehingga bisa tembus kebawah saat penulisan\n6. Harga tertera adalah harga per pcs\n\n** Happy Shopping **', 1, 6500, 'Nota 2 ply,50lembar,1/6F', 'NT2-50-1/6F', '10cm x 11cm', '', '2025-01-01 13:59:00', '2025-01-01 13:59:00'),
(121, 3, 8, 'Nota Costum 1 ply | Nota 100 Lembar | Potrait/Landscape | 1/4 Folio', '17299528351.png', 'NOTA COSTUM 100 LEMBAR \n\nSpesifikasi: \n1. Nota costum isi 100 lembar 1 ply \n2. Ukuran nota 1/4 Folio \n3. Bisa request bentuk potrait/landscape \n4. Jika sudah punya desain bisa di unggah langsung \n5. Bahan kertas hvs\n6. Harga tertera adalah harga per pcs\n\n** Happy Shopping **', 1, 14000, 'Nota 1ply,100lembar,1/4F', 'NT1-100-1/4F', '10cm x 16cm', '', '2025-01-01 14:06:00', '2025-01-01 14:06:00'),
(122, 3, 8, 'Nota Costum 1 ply | Nota 100 Lembar | Potrait/Landscape | 1/6Folio', '17299529342.png', 'NOTA COSTUM 100 LEMBAR \n\nSpesifikasi: \n1. Nota costum isi 100 lembar 1 ply \n2. Ukuran nota 1/6 Folio \n3. Bisa request bentuk potrait/landscape \n4. Jika sudah punya desain bisa di unggah langsung \n5. Bahan kertas hvs\n6. Harga tertera adalah harga per pcs\n\n** Happy Shopping **', 1, 12000, 'Nota 1ply,100lembar,1/6F', 'NT1-100-1/6F', '10cm x 11cm', '', '2025-01-01 14:09:00', '2025-01-01 14:09:00'),
(123, 3, 8, 'Nota Costum 2 ply | Nota 100 Lembar | Potrait/Landscape | 1/4Folio', '17299529789.png', 'NOTA COSTUM 100 LEMBAR \n\nSpesifikasi: \n1. Nota costum isi 100 lembar 2 ply \n2. Ukuran nota 1/4 Folio \n3. Bisa request bentuk potrait/landscape \n4. Jika sudah punya desain bisa di unggah langsung \n5. Bahan kertas NCR 55gr sehingga bisa tembuh kebawah saat penulisan\n6. Harga tertera adalah harga per pcs\n\n** Happy Shopping **', 1, 15000, 'Nota 2ply,100lembar,1/4F', 'NT2-100-1/4F', '10cm x 16cm', '', '2025-01-01 14:12:00', '2025-01-01 14:12:00'),
(124, 3, 8, 'Nota Costum 2 ply | Nota 100 Lembar | Potrait/Landscape | 1/6Folio', '17299530188.png', 'NOTA COSTUM 100 LEMBAR  \n\nSpesifikasi: \n1. Nota costum isi 100 lembar 2 ply \n2. Ukuran nota 1/6 Folio \n3. Bisa request bentuk potrait/landscape \n4. Jika sudah punya desain bisa di unggah langsung \n5. Bahan kertas NCR 55gr sehingga bisa tembuh kebawah saat penulisan\n6. Harga tertera adalah adalah harga pcs\n\n** Happy Shopping **', 1, 13000, 'Nota 2ply,100lembar,1/6F', 'NT2-100-1/6F', '10cm x 11cm', '', '2025-01-01 14:15:00', '2025-01-01 14:15:00'),
(125, 3, 8, 'Kalender Meja Duduk | Potrait/Landscape | Ukuran A5', '17299531386.png', 'KALENDER MEJA DUDUK A5\n\nSpesifikasi:\n1. Produk berbahan kualitas yaitu Art Carton 260GSM\n2. Produk berisi 1 cover dan kalender 12 bulan \n3. Finishing menggunakan spiral sebagai pengait \n4. Cetak full color\n5. Bisa request potrait/landscape cantumkan pada catatan\n6. Harga tertera adalah harga per pcs\n\n** Happy Shopping **', 350, 42000, 'Kalender Meja, A5', 'KM-A5', 'A5(21cm x 14.8cm)', '', '2025-01-01 14:17:00', '2025-01-01 14:17:00'),
(126, 3, 8, 'Cetak Kartu Nama | Free box | Isi 100pcs | 1 sisi', '17299532428.png', 'CETAK KARTU NAMA 1 SISI \n\nSpesifikasi:\n1. Kartu nama berbahan dasar Art Carton 260gsm\n2. Finishing menggunakan laminating glossy \n3. Ukuran tertera adalah ukuran standart\n4. Pembelian min 100 pcs dan free box\n5. Produk cetak 1 sisi depan saja belakang polos mengikuti warna\n6. Harga tertera adalah harga per pcs\n\n** Happy Shopping **', 185, 36000, 'Kartu Nama, 1Sisi', 'KN-1S', '9cmx5.5cm', '', '2025-01-01 14:20:00', '2025-01-01 14:20:00'),
(127, 3, 8, 'Cetak Kartu Nama | Free box | Isi 100pcs | 2 sisi', '17299532935.png', 'CETAK KARTU NAMA 1 SISI \n\nSpesifikasi:\n1. Kartu nama berbahan dasar Art Carton 260gsm\n2. Finishing menggunakan laminating glossy \n3. Ukuran tertera adalah ukuran standart\n4. Pembelian min 100 pcs dan free box\n5. Produk cetak 2 sisi depan belakang\n6. Harga tertera adalah harga 100pcs\n\n** Happy Shopping **', 185, 71000, 'Kartu Nama, 2Sisi', 'KN-2S', '9cmx5.5cm', '', '2025-01-01 14:23:00', '2025-01-01 14:23:00'),
(128, 3, 8, 'Notebook Costum A5 | Spiral Block Note | 50 Lembar(100 halaman)', '17299534476.png', 'NOTEBOOK COSTUM A5\n\nSpesifikasi:\n1. Produk berbahan dasar art carton 260gsm\n2. Bagian cover polos . Pilihan coklat dan hitam. cantumkan pada catatan \n3. Produk Isi 50lembar = 100halaman, \n4. Proses finishing menggunakan spiral putih\n5. Ukuran produk A5\n6. Harga tertera adalah harga per pcs \n\n** Happy Shopping **', 150, 15000, 'Notebook 50, A5, Spiral', 'NB-50-A5', '21cmx15cm(Kertas Polos), 21cmx15cm(Kertas Bergaris)', '', '2025-01-01 14:27:00', '2025-01-01 14:27:00'),
(129, 3, 8, 'Notebook Costum A5 | Spiral Block Note | 100 Lembar(200 halaman)', '17299535144.png', 'NOTEBOOK COSTUM A5\n\nSpesifikasi:\n1. Produk berbahan dasar art carton 260gsm\n2. Bagian cover polos . Pilihan coklat dan hitam. cantumkan pada catatan \n3. Produk Isi 100lembar = 200halaman\n4. Proses finishing menggunakan spiral putih\n5. Ukuran produk A5\n6. Harga tertera adalah harga per pcs\n\n** Happy Shopping **', 260, 30000, 'Notebook 100, A5, Spiral', 'NB-100-A5', '21cmx15cm(Kertas Polos), 21cmx15cm(Kertas Bergaris)', '', '2025-01-01 14:30:00', '2025-01-01 14:30:00'),
(130, 3, 8, 'Note Pocket Spiral Small | Notebook Mini | Isi 50 Lembar(100 halaman) | Buku Agenda', '17299536308.png', 'CETAK NOTEBOOK MINI / BUKU AGENDA\n\nSpesifikasi:\n1. Produk berbahan dasar art carton 260gsm\n2. Bagian cover bisa costum design\n3. Produk Isi 50lembar atau 100 halaman\n4. Proses finishing menggunakan spiral putih\n5. Ukuran produk B7\n6. Harga tertera adalah harga per pcs\n7. Terdapat 2 pilihan kertas dibagian dalam yaitu kertas polos dan kertas bergaris\n\n** Happy Shopping **', 1, 6000, 'Note Spiral, 50, B7', 'NS-50-B7', '9cmx12cm(Kertas Polos), 9cmx12cm(Kertas Bergaris),', '', '2025-01-01 14:35:00', '2025-01-01 14:35:00'),
(131, 4, 9, 'Pensil Faber Castel | 2B Castell | Pensil Ujian', '17299537046.png', 'PENSIL FABER CASTELL 2B\n\nSpesifikasi:\n1. Merk faber castell\n2. Warna hitam 2b\n3. 1 pack isi 12 pcs\n4. Kualitas terbaik dan dapat dibaca\n5. Harga tertera adalah harga per pcs\n\n** Happy Shopping **', 18, 4000, 'Pensil,Faber Castel', 'PS-FC', 'Leads 2.5mm', '', '2025-01-01 14:33:00', '2025-01-01 14:33:00'),
(132, 4, 9, 'Bolpoin Joyko Jk-100 | Bolpoin Gel | Ketebalan 0.5mm', '17299538232.png', 'BOLPOIN JOYKO JK-100\n\nSpesifikasi :\n1. Produk tipe joyko jk-100\n2. Tinta warna hitam \n3. Harga tertera adalah harga per pcs\n4. Ketebalan 0.5mm\n5. 1pack isi 12 pcs\n\n** Happy Shopping **', 20, 2000, 'Bolpoin Joyko Jk-100', 'BP-JY100', 'Standart (P 15.1cm x D 1cm )', '', '2025-01-01 14:36:00', '2025-01-01 14:36:00'),
(133, 4, 9, 'Spidol Permanent Snowman | Snowman Marker | AG 12 Snowman', '17299538965.png', 'SPIDOL SNOWMAN PERMANENT\n\nSpesifikasi:\n1. Type produk  AG12\n2. Harga tertera adalah harga per pcs\n3. Terdapat 3 pilihan warna yaitu hitam, merah, biru\n4. Cantumkan pilihan warna pada catatan atau dikirim random \n5. 1 pack isi 12 pcs\n\n** Happy Shopping **', 20, 5000, 'Spidol Snowman Permanent', 'SS-PM', 'Standart', '', '2025-01-01 14:40:00', '2025-01-01 14:40:00'),
(134, 4, 9, 'Spidol Non Permanent Snowman | Snowman Marker | ABG 12 Snowman', '17299539444.png', 'SPIDOL SNOWMAN NON PERMANENT\n\nSpesifikasi: \n1. Type produk ABG12 \n2. Harga tertera adalah harga per pcs \n3. Terdapat 3 pilihan warna yaitu hitam, merah, biru \n4. Cantumkan pilihan warna pada catatan atau dikirim random \n5. 1 pack isi 12 pcs\n\n** Happy Shopping **', 20, 6000, 'Spidol Snowman Non Permanent', 'SS-NPM', 'Standart', '', '2025-01-01 14:45:00', '2025-01-01 14:45:00'),
(135, 4, 9, 'Spidol Kecil Artline | Spidol Marker Pensil', '17299543132.png', 'SPIDOL KECIL ARTLINE SNOWMAN \n\nSpesifikasi :\n1. Produk berkualitas dan tinta pekat \n2. Harga tertera adalah harga per pcs\n3. Terdapat 3 pilihan warna yaitu hitam, merah, biru. Silahkan cantumkan pada catatan \n4. Isi 1 pack adalah 12pcs\n\n** Happy Shopping **', 11, 1000, 'Spidol Kecil Snowman', 'SPK-SN', 'Kecil', '', '2025-01-01 14:51:00', '2025-01-01 14:51:00'),
(136, 4, 9, 'Penggaris 30cm | Penggaris Butterfly | Mika Glass Ruller', '17299544052.png', 'PENGGARIS BUTTERFLY UKURAN 30 CM\n\nSpesifikasi:\n1. Produk merk butterfly\n2. Produk ukuran 30cm\n3. Bahan plastik mika \n4. Harga tertera adalah harga per pcs\n5. 1 Pack isi 12 pcs\n\n** Happy Shopping **', 250, 2000, 'Penggaris 30cm Butterfly', 'PG-30BT', '30cm', '', '2025-01-01 14:53:00', '2025-01-01 14:53:00'),
(137, 4, 9, 'Penghapus Joyko 526 B40P | Putih Kecil', '17299544696.png', 'PENGHAPUS JOYKO 526 B40P \n\nSpesifikasi:\n1. Produk berwarna putih \n2. Produk merk joyko \n3. Harga tertera adalah harga per pcs\n4. 1 Pack isi 40pcs\n5. Penghapus berkualitas dan bersih\n\n** Happy Shopping **', 45, 1000, 'Penghapus Joyko 526, Putih', 'PG-JY526', 'Kecil', '', '2025-01-01 14:54:00', '2025-01-01 14:54:00'),
(138, 4, 9, 'Penghapus Faber Castel | Warna Putih', '17299545879.png', 'PENGHAPUS FABER CASTEL\n\nSpesifikasi :\n1. Produk bermerk faber castel\n2. Penghapus warna putih \n3. 1 Pack isi 12pcs\n4. Harga tertera adalah harga per pcs\n5. Produk berkualitas dan bersih\n\n** Happy Shopping **', 10, 2000, 'Penghapus Faber Castel', 'PH-FC', '3.3cm x 1cm x 1.3cm', '', '2025-01-01 14:56:00', '2025-01-01 14:56:00'),
(139, 4, 9, 'Tipe-x Cair Kenko | Kenko 108 Mini', '17299548328.png', 'TIPE -X CAIR KENKO MINI \n\nSpesifikasi :\n1. Produk berukuran mini dan praktis \n2. Mudah digunakan dan praktis dibawa kemana saja \n3, Cepat kering saat digunakan \n4. Harga tertera adalah harga per-pcs\n\n** Happy Shopping **', 22, 4000, 'Tipe-x Kenko Mini', 'TPK-M', 'Mini', '', '2025-01-01 15:00:00', '2025-01-01 15:00:00'),
(141, 4, 9, 'Buku Tulis Sinar Dunia | Isi 38 lembar', '17299549868.png', 'BUKU TULIS ISI 38 LEMBAR \n\nSpesifikasi:\n1. Buku merk sinar dunia isi 38 lembar \n2. Produk berkualitas dan halus\n3. Harga tertera adalah harga per pcs\n4. 1 Pack isi 10 pcs\n\n** Happy Shopping **', 88, 4000, 'Buku Tulis,Sinar Dunia ,38 lembar,', 'BT-38', '21cm X 16cm', '', '2025-01-01 15:03:00', '2025-01-01 15:03:00'),
(142, 4, 9, 'Buku Tulis Sinar Dunia | Isi 58 lembar | 1 Pack Isi 10 buku', '17299550457.png', 'BUKU TULIS ISI 58 LEMBAR \n\nSpesifikasi:\n1. Buku merk sinar dunia isi 58 lembar \n2. Produk dengan kertas tebal, halus dan berkualitas \n3. Harga tertera adalah harga per pack \n4. Tinta tidak mudah tembus belakang\n5. 1 Pack isi 10 pcs\n\n** Happy Shopping **', 130, 6000, 'Buku Tulis,Sinar Dunia,58 lembar,', 'BT-58', '21cm X 16cm', '', '2025-01-01 15:04:00', '2025-01-01 15:04:00'),
(143, 4, 9, 'Buku Tulis Campus | Isi 50 lembar', '17299551183.png', 'BUKU TULIS CAMPUS ISI 50 LEMBAR \n\nSpesifikasi:\n1. Produk buku tulis merk campus \n2, Isi buku 50 lembar dengan ukuran lebih panjang\n3. Ukuran standart, cover bagus dan tidak mudah robek\n4. Harga tertera adalah harga per pack\n5. 1 pack isi 10 buku\n\n** Happy Shopping **', 195, 7000, 'Buku Tulis Campus,50 lembar', 'BTC-58', '25cm x 18cm', '', '2025-01-01 15:07:00', '2025-01-01 15:07:00'),
(145, 4, 9, 'Pensil Warna Faber Castel | Isi 12 pcs |  Faber Castell Classic 12 pcs', '17299552386.png', 'PENSIL WARNA FABER CASTELL ISI 12 PCS\n\nSpesifikasi:\n1. Produk merk faber castel isi 12 pcs\n2. Warna nya cerah dan banyak varian \n3. Produk ukuran lebih panjang dan tidak mudah patah\n4. Harga tertera adalah harga per set isi 12 pcs\n5. Sangat mudah digunakan dan praktis dibawa kemana saja\n\n** Happy Shopping **', 181, 30000, 'Pensil Warna Faber Castell,12 pcs', 'PW-FB12', 'Panjang', '', '2025-01-01 15:10:00', '2025-01-01 15:10:00'),
(146, 4, 9, 'Buku Gambar A4 | Merk Sinar Dunia | Isi Lembar', '17299553128.png', 'BUKU GAMBAR A4\n\nSpesifikasi :\n1. Buku gambar merk sinar dunia\n2. Produk ukuran A4\n3. Kertas bersih dan berkualitas \n4. 1 Pack isi 5 pcs\n5. Harga tertera adalah harga per pcs\n\n** Happy Shopping **', 250, 7000, 'Buku Gambar, A4', 'BG-A4', 'A4', '', '2025-01-01 15:14:00', '2025-01-01 15:14:00'),
(147, 4, 9, 'Amplop Putih Polos | Merk Paperline Tipe 90', '17299553682.png', 'AMPLOP PUTIH PAPERLINE 90\n\nSpesifikasi:\n1. Produk merk paperline tipe 90\n2. Amplop berwarna putih polos \n3. 1 pack isi 100 lembar \n4. Harga tertera adalah harga per pcs \n5. Produk sangat berkualitas dan tidak mudah sobek\n\n** Happy Shopping **', 5, 1000, 'Amplop Putih Paperline 90', 'AP-PP104', 'P 11cmx L 23mm', '', '2025-01-01 15:19:00', '2025-01-01 15:19:00'),
(148, 4, 9, 'Memo Stick | Sticky Note | Memo Tempel Joyko Tipe MMS-2', '17299554447.png', 'MEMO STICK JOYKO TIPE MMS-2\n\nSpesifikasi :\n1. Memo stick berbahan kertas \n2. Isi 100 sheet per warna \n3. 1 Plastik memo stick berisi 4 warna \n4. Harga tertera adalah harga per pcs\n5. Produk berkualitas dan mudah direkatkan saat penggunaan\n\n** Happy Shopping **', 75, 7000, 'Memo Stick Joyko Tipe MMS-2', 'MS-JMMS2', '75mm x 18.75mm', '', '2025-01-01 15:23:00', '2025-01-01 15:23:00'),
(149, 4, 9, 'Pembatas Buku | Merk Joyko Tipe IM-32 | Isi 7 Warna', '17299555235.png', 'PEMBATAS BUKU JOKYO TIPE IM-32\n\nSpesifikasi:\n1. Produk berbahan dasar kertas \n2. Sangat mudah digunakan dan direkatkan\n3. Terdiri dari 7 warna dalam 1 plastik \n4. Isi 25 lembar setiap sheet \n5. Harga tertera adalah harga per plastik\n\n** Happy Shopping **', 25, 5000, 'Pembatas Buku Joyko Tipe IM-32', 'PB-JIM-32', '4.5cm x 1.2cm', '', '2025-01-01 15:26:00', '2025-01-01 15:26:00'),
(150, 4, 9, 'Penggaris Segitiga Butterfly | Tipe No 12 | Isi 2 Pcs', '17299555943.png', 'PENGGARIS SEGITIGA BUTTERFLY TIPE 12\n\nSpesifikasi:\n1. Produk merk butterfly tipe 12\n2. Penggaris berbahan dasar plastik \n3. Terdapar 2 pcs dalam 1 plastik \n4. Harga tertera adalah harga per plastik \n5. Produk berkualitas, tidak mudah patah, dan praktis dibawa kemana saja\n\n** Happy Shopping **', 140, 20000, 'Penggaris Segitiga Butterfly Tipe 12', 'PSB-T12', '2 Ukuran', '', '2025-01-01 15:28:00', '2025-01-01 15:28:00'),
(151, 4, 9, 'Bolpoin Standart C 88 | Isi 12 Pcs/Pack', '17299557426.png', 'BOLPOIN STANDART C88\n\nSpesifikasi:\n1. Bolpoin merk standar tipe c-88\n2. Produk berkualitas, tinta hitam pekat dan jelas \n3. 1 Pack isi 12 pcs + 1 bonus \n4. Harga tertera adalah harga per pcs\n5. Bolpoin adalah warna hitam\n\n** Happy Shopping **', 15, 2000, 'Bolpoin Standar C-88', 'BP-C88', 'Sedang', '', '2025-01-01 15:31:00', '2025-01-01 15:31:00'),
(152, 4, 9, 'Pensil Mekanik Joyko | Tipe MP-01', '17299558358.png', 'PENSIL MEKANIK JOYKO TIPE MP-01\n\nSpesifikasi:\n1. Pensil mekanik merk joyko tipe Mp-01\n2. Pensil dengan ukuran panjang 14.2 cm dan diameter 0.8cm \n3. Biasanya pensil menggunakan isi ukuran 0.5mm\n4. Dilengkapi penghapus pada ujung atas pensil \n5. Harga tertera adalah harga per pcs\n\n** Happy Shopping **', 18, 2500, 'Pensil Mekanik Joyko, Tipe MP-01', 'PMJ-MP01', 'P 14.2cm', '', '2025-01-01 15:34:00', '2025-01-01 15:34:00'),
(153, 4, 9, 'Isi Pensil Mekanik | Merk Joyko 0.5mm', '17299558938.png', 'ISI PENSIL MEKANIK JOYKO 0.5MM\n\nSpesifikasi:\n1. Produk merk joyko \n2. Ketebalan pensil 0.5mm\n3. Isi pensil berjumlah 12 tubes\n4. Isi pensil kuat dan tidak mudah patah\n\n** Happy Shopping **', 10, 1500, 'Isi Pensil Mekanik Joyko 0.5mm', 'IPM-J0.5', 'P 6cm x D 0.5mm', '', '2025-01-01 15:38:00', '2025-01-01 15:38:00'),
(154, 1, 1, 'X Banner 2 | Cetak X-Banner Stand | Flexy Korea 380gsm', '17300698677.png', 'CETAK X-Banner\nSpesifikasi \n1. Bahan Flexy Korea 380gsm(Penggunaan Outdoor)\n2.Ukuran Khusus 60cmx160cm\n3.Stand Rangka X-Banner Premium\n\nProses Pengerjaan:\n1. Jika sudah memiliki desain dan siap cetak, akan diproses di hari saat orderan masuk.\n2. Jika belum memiliki desain. Ada jasa pengerjaan desain dan produk di kirim 2-3hari\n\n** Enjoy Your Shopping **', 1000, 67000, 'X-banner,Flexy Korea 380gsm,60x160', 'RB-011', '60cm x 160cm', '', '2025-01-02 02:57:00', '2025-01-02 02:57:00'),
(155, 1, 1, 'X Banner 3 | Cetak X-Banner Stand | Albatros', '17300704031.png', 'CETAK X-Banner\nSpesifikasi \n1. Bahan Albatros(Penggunaan Indoor)\n2.Ukuran Khusus 80cmx180cm\n3.Stand Rangka X-Banner Premium\n\nProses Pengerjaan:\n1. Jika sudah memiliki desain dan siap cetak, akan diproses di hari saat orderan masuk.\n2. Jika belum memiliki desain. Ada jasa pengerjaan desain dan produk di kirim 2-3hari\n\n** Enjoy Your Shopping **', 1800, 104000, 'X-banner,Albatros,80x180', 'RB-012', '80cm x 180cm', '', '2025-01-02 03:06:00', '2025-01-02 03:06:00'),
(156, 1, 1, 'X Banner 4 | Cetak X-Banner Stand | Flexy Korea 380gsm', '17300704867.png', 'CETAK X-Banner\nSpesifikasi \n1. Bahan Flexy Korea 380gsm\n2.Ukuran Khusus 80cmx180cm\n3.Stand Rangka X-Banner Premium\n\nProses Pengerjaan:\n1. Jika sudah memiliki desain dan siap cetak, akan diproses di hari saat orderan masuk.\n2. Jika belum memiliki desain. Ada jasa pengerjaan desain dan produk di kirim 2-3hari\n\n** Enjoy Your Shopping **', 1800, 95000, 'X-banner,Flexy Korea 380gsm,80x180', 'RB-013', '80cm x 180cm', '', '2025-01-02 03:08:00', '2025-01-02 03:08:00'),
(157, 4, 9, 'Tipe-x kertas Joyko | Tipe-x Tape 12m', '17302801341.png', 'TIPE-X KERTAS JOYKO TAPE 12M \n\nSpesifikasi: \n1. Merk produk joyko tipe CT-522 \n2. Mudah kering saat penggunaan \n3. Harga tertera adalah harga per-pcs \n4. Murah, praktis, dan terjangkau \n\n** Happy Shopping **', 55, 5000, 'Tipe-x Kertas Joyko', 'TP-JK-12', 'Standar', '', '2025-01-02 03:22:00', '2025-01-02 03:22:00');
INSERT INTO `products` (`id`, `id_kategori`, `id_subkategori`, `nama_produk`, `gambar`, `deskripsi`, `berat`, `harga`, `tags`, `sku`, `ukuran`, `satuan`, `created_at`, `updated_at`) VALUES
(158, 4, 9, 'Pensil Warna Kenko | Isi 12 warna | Kenko CP-12', '17302802259.png', 'PENSIL WARNA KENKO ISI 12 PCS \n\nSpesifikasi: \n1.Produk merk kenko tipe Cp-12 \n2. Warna bagus dan terang \n3. Produk kuat dan tidak mudah patah \n4. Harga tertera adalah harga 1 set isi 12 pcs \n5. Ukuran mini sehingga mudah dibawa\n\n** Happy Shopping **', 44, 12000, 'Pensil Warna Kenko CP-12, Isi 12', 'PWK-CP12', 'Kecil', '', '2025-01-02 03:25:00', '2025-01-02 03:25:00'),
(159, 2, 7, 'Costum Stampel Otomatis | Free Design | Ukuran Sedang', '17302986102.png', 'COSTUM STAMPEL OTOMATIS \n\nSpesifikasi:\n1. Stampel bisa langsung digunakan tinggal cap saja\n2. Tidak perlu ada bantala cap tinta \n3. Tinta sangat pekat dan jelas \n4. Produk berkualitas dan praktis \n5. Harga tertera adalah harga per pcs\n6. Terdapat 3 pilihan warna tinta yaitu hitam, merah, dan ungu. Silahkan pilihan cantumkan pada catatan\n\n** Happy Shopping **', 80, 35000, 'Costum Stampel Otomatis', 'CSO-001', 'Kotak(22x55) , Bulat 40mm', '', '2025-01-02 03:27:00', '2025-01-02 03:27:00'),
(160, 4, 9, 'Kertas Karton Manila | Ukuran 61cm x 86cm | Beraneka Warna', '17303006357.png', 'KERTAS KARTON MANILA \n\nSpesifikasi:\n1. Ukuran kertas manila 61cm x 86cm\n2. Produk dibungkus plastik jadi tidak mudah kotor\n3. Harga tertera adalah harga per pcs\n4. Produk berkualitas dan cocok untuk kebutuhan anda \n\n** Happy Shopping **', 75, 5000, 'Kertas Karton Manila', 'KKM-001', 'Merah, Kuning,Hijau, Hitam ,Biru, Putih, Oren, Pink, Kuning Muda, Ungu', '', '2025-01-02 03:33:00', '2025-01-02 03:33:00'),
(161, 4, 9, 'Kertas Karton Buffalo | Ukuran A4 | High Quality dan Aneka Warna', '17303014987.png', 'KERTAS KARTON BUFFALO\n\nSpesifikasi:\n1. Motif kertas polos berwarna tidak ada corak \n2. Produk berukuran A4\n3. Harga tertera adalah harga per pcs\n4. Kertas lebih tebal dan tidak mudah robek \n5. Cocok digunakan untuk cover jilid buku \n6. Terdapat 7 pilihan warna\n\n** Happy Shopping **', 15, 2000, 'Kertas Karton Bufalo,A4', 'KKB-001', 'Merah, Hijau, Biru, Kuning, Putih, Pink, Sky Blue', '', '2025-01-02 03:37:00', '2025-01-02 03:37:00'),
(162, 4, 9, 'Kertas Karton Buffalo | Ukuran f4 | High Quality dan Aneka Warna', '17303015498.png', 'KERTAS KARTON BUFFALO\n\nSpesifikasi:\n1. Motif kertas polos berwarna tidak ada corak \n2. Produk berukuran F4\n3. Harga tertera adalah harga per pcs\n4. Kertas lebih tebal dan tidak mudah robek \n5. Cocok digunakan untuk cover jilid buku \n6. Terdapat 7 pilihan warna\n\n** Happy Shopping **', 15, 4000, 'Kertas Karton Bufalo,F4', 'KKB-002', 'Merah, Hijau, Biru, Kuning, Putih, Pink, Sky Blue', '', '2025-01-02 03:43:00', '2025-01-02 03:43:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_member` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `review` text NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_slider` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sliders`
--

INSERT INTO `sliders` (`id`, `nama_slider`, `deskripsi`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'Zahra Printing', '\" Halo! Mari Cetak Sesuatu yang Istimewa dengan Layanan Digital Printing Terbaik \"', '17290673854.png', '2024-12-28 04:34:49', '2025-01-08 05:28:09'),
(2, 'Exclusive Products', '\" Temukan Kepuasan Dalam Setiap Cetakan Anda \"', '17290672957.png', '2024-12-28 04:38:07', '2025-01-08 05:28:19'),
(3, 'Enjoy Online Shopping', '\" Selamat Berkreasi dan Berbelanja Cetak Digital dengan Kemudahan \"', '17290673741.png', '2024-12-28 04:41:24', '2025-01-08 05:28:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama_subkategori` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `subcategories`
--

INSERT INTO `subcategories` (`id`, `id_kategori`, `nama_subkategori`, `deskripsi`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 1, 'Roll Banner', 'Roll Banner', '17298661357.png', '2024-12-28 09:49:31', '2024-12-28 09:49:31'),
(2, 1, 'Sablon', 'Sablon', '17298661495.png', '2024-12-28 09:50:00', '2024-12-28 09:50:00'),
(3, 1, 'Spanduk & Banner', 'Spanduk dan Banner', '17298661646.png', '2024-12-28 09:50:21', '2024-12-28 09:50:21'),
(4, 1, 'Backdrop', 'Backdrop', '17298664383.png', '2024-12-28 09:50:49', '2024-12-28 09:50:49'),
(5, 1, 'Stiker', 'Stiker', '17298662046.png', '2024-12-28 09:51:38', '2024-12-28 09:51:38'),
(6, 1, 'Flayer Art', 'Flayer Art', '17298662152.png', '2024-12-28 09:52:07', '2024-12-28 09:52:07'),
(7, 2, 'Peralatan Kantor', 'Peralatan Kantor', '17298662295.png', '2024-12-28 09:52:42', '2024-12-28 09:52:42'),
(8, 3, 'Cetak Buku', 'Cetak Buku', '17298662422.png', '2024-12-28 09:53:00', '2024-12-28 09:53:00'),
(9, 4, 'Alat Tulis & Kertas', 'Alat Tulis dan Kertas', '17298662546.png', '2024-12-28 09:53:20', '2024-12-28 09:53:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'muslim@admin.com', '2024-12-28 04:29:29', '$2y$10$pJ5aUNxAKg0ZOwNLkjeMoegXdPxwINLchq23U.zRlfFB1XSqo5BmC', NULL, '2024-12-28 04:29:29', '2024-12-28 04:29:29');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cls`
--
ALTER TABLE `cls`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `about`
--
ALTER TABLE `about`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT untuk tabel `cls`
--
ALTER TABLE `cls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT untuk tabel `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT untuk tabel `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=569;

--
-- AUTO_INCREMENT untuk tabel `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
