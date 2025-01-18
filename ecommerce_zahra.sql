-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2024 at 04:38 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

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
-- Table structure for table `about`
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
-- Dumping data for table `about`
--

INSERT INTO `about` (`id`, `judul_website`, `logo`, `deskripsi`, `alamat`, `email`, `telepon`, `created_at`, `updated_at`, `atas_nama`, `no_rekening`) VALUES
(1, 'Zahra Printing', '17245591402.png', 'Zahra Printing hadir sejak tahun 2018 sebagai solusi percetakan yang berkualitas dan terpercaya. \r\nUntuk memenuhi berbagai kebutuhan anda, toko kami menawarkan layanan lengkap mulai dari jasa desain grafis, percetakan, fotocopy bisa dilayani di tempat kami. \r\nMulai dari roll banner, x banner, spanduk, kartu nama, id card, kebutuhan kantor, kebutuhan alat tulis, dan berbagai produk lainnya . \r\nDengan pelayanan yang terbaik, Zahra Printing siap mendukung kebutuhan cetak anda. \r\n \r\nZahra Printing memang solusi terbaik untuk kebutuhan desain dan cetak :)', 'Jl.Gading Raya No 86 Pisangan Timur\r\nPulogadung, Jakarta Timur\r\nJam Operasional :\r\nSenin - Jumat: 06.30 - 23.00\r\nSabtu-Minggu: 08.00 - 23.00', 'milafc84@gmail.com', '081398290684 - Muslim\r\n085855343008 - Mila', NULL, '2024-10-30 14:03:11', 'Muslimin', '1234-1234-1234-1234');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
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
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `id_member`, `id_produk`, `file`, `note`, `jumlah`, `ukuran`, `is_need_design`, `total`, `is_checkout`, `created_at`, `updated_at`) VALUES
(18, 3, 45, NULL, NULL, '1', '(50m x 30m)', 0, 73680, 1, '2024-08-28 07:16:55', '2024-08-29 06:16:49'),
(19, 3, 44, NULL, NULL, '2', '30mx30m', 0, 147360, 1, '2024-08-29 06:13:04', '2024-08-29 06:16:49'),
(20, 3, 44, NULL, NULL, '3', '30mx30m', 0, 221040, 1, '2024-08-29 06:16:27', '2024-08-29 06:16:49'),
(21, 3, 52, NULL, NULL, '1', '30m x 50m', 0, 70233, 0, '2024-08-29 06:20:44', '2024-08-29 06:20:44'),
(22, 3, 52, NULL, NULL, '1', '30m x 50m', 0, 70233, 0, '2024-08-29 06:38:30', '2024-08-29 06:38:30'),
(55, 5, 44, 'uploads/gcaenoRajXEzhz9unZcmYqu5yeGLbSFvUr1UWMfY.jpg', 'wcwedw', '1', '30mx30m', 0, 73680, 1, '2024-09-13 02:34:08', '2024-10-06 08:36:36'),
(56, 5, 52, NULL, NULL, '1', '30m x 50m', 1, 70233, 1, '2024-09-13 05:42:58', '2024-10-06 08:36:36'),
(57, 5, 44, 'uploads/xkbwPIMzmaEXvy4atmil4EcNA931w4J52dB0XhYM.jpg', 'dfgbn', '1', '30mx30m', 0, 73680, 1, '2024-09-13 08:34:36', '2024-10-06 08:36:36'),
(58, 5, 44, 'uploads/Y1kQW1nSqB25ina129kwnxqdUZBQIV2SdaCNP0rw.jpg', 'dfgbn', '1', '30mx30m', 0, 73680, 1, '2024-09-13 08:34:37', '2024-10-06 08:36:36'),
(59, 5, 44, 'uploads/NqGj9rFpxd717SBZbWpiY5SQsNm40dtPvjjyaT2a.jpg', 'dfgbn', '1', '30mx30m', 0, 73680, 1, '2024-09-13 10:01:19', '2024-10-06 08:36:36'),
(60, 5, 52, 'uploads/lF8CAHt0JeHbMVh5lcQ6IPZfZRU4P6aYB3QjtAvZ.jpg', 'sdfgngfsd', '1', '30m x 50m', 0, 70233, 1, '2024-09-13 17:16:25', '2024-10-06 08:36:36'),
(61, 5, 44, 'uploads/ZSqwM7lUtzvnprwXdY1uPnEdfo7hImS2fT1DGfGP.png', 'swwwss', '1', '30mx30m', 0, 73680, 1, '2024-09-13 21:25:11', '2024-10-06 08:36:36'),
(62, 5, 52, NULL, NULL, '1', '30m x 50m', 1, 120233, 1, '2024-09-13 22:25:40', '2024-10-06 08:36:36'),
(63, 5, 52, NULL, NULL, '2', '30m x 50m', 1, 190466, 1, '2024-09-13 22:28:27', '2024-10-06 08:36:36'),
(64, 5, 52, NULL, NULL, '1', '30m x 50m', 1, 120233, 1, '2024-09-13 22:59:24', '2024-10-06 08:36:36'),
(65, 5, 52, NULL, NULL, '1', '30m x 50m', 1, 120233, 1, '2024-09-13 23:21:00', '2024-10-06 08:36:36'),
(66, 5, 52, NULL, NULL, '1', '30m x 50m', 1, 120233, 1, '2024-09-14 00:05:34', '2024-10-06 08:36:36'),
(67, 5, 52, NULL, NULL, '2', '30m x 50m', 1, 190466, 1, '2024-09-14 00:19:11', '2024-10-06 08:36:36'),
(68, 5, 44, NULL, NULL, '1', '30mx30m', 1, 123680, 1, '2024-09-16 14:11:28', '2024-10-06 08:36:36'),
(69, 5, 52, NULL, NULL, '1', '30m x 50m', 1, 120233, 1, '2024-09-16 14:38:13', '2024-10-06 08:36:36'),
(70, 5, 52, NULL, NULL, '1', '30m x 50m', 1, 120233, 1, '2024-09-16 21:15:56', '2024-10-06 08:36:36'),
(71, 5, 44, 'uploads/FG1xmjWUToMMz3XxChh21dIgos7j4wwM6CsXD3bX.jpg', 'ddadadasda', '1', '30mx30m', 0, 73680, 1, '2024-09-16 21:16:28', '2024-10-06 08:36:36'),
(72, 5, 44, 'uploads/up7nRNmlP2vKQZX2knWqBCIUyJscbe000mG1uqAz.png', 'efwfewfw', '1', '30mx30m', 0, 73680, 1, '2024-09-18 20:26:30', '2024-10-06 08:36:36'),
(73, 5, 52, NULL, NULL, '1', '30m x 50m', 1, 120233, 1, '2024-09-20 02:19:29', '2024-10-06 08:36:36'),
(74, 5, 44, NULL, NULL, '1', '30mx30m', 1, 123680, 1, '2024-09-20 02:26:32', '2024-10-06 08:36:36'),
(75, 5, 44, NULL, NULL, '1', '30mx30m', 1, 123680, 1, '2024-09-20 02:29:20', '2024-10-06 08:36:36'),
(76, 5, 44, NULL, NULL, '1', '30mx30m', 1, 123680, 1, '2024-09-20 02:53:56', '2024-10-06 08:36:36'),
(77, 5, 44, NULL, NULL, '1', '30mx30m', 1, 123680, 1, '2024-09-20 03:02:05', '2024-10-06 08:36:36'),
(78, 5, 44, NULL, NULL, '1', '30mx30m', 1, 123680, 1, '2024-09-20 19:59:35', '2024-10-06 08:36:36'),
(79, 5, 44, NULL, NULL, '1', '30mx30m', 1, 123680, 1, '2024-09-20 20:04:40', '2024-10-06 08:36:36'),
(80, 5, 44, NULL, NULL, '1', '30mx30m', 1, 123680, 1, '2024-09-20 20:07:45', '2024-10-06 08:36:36'),
(81, 5, 44, NULL, NULL, '1', '30mx30m', 1, 123680, 1, '2024-09-20 20:11:27', '2024-10-06 08:36:36'),
(82, 5, 52, NULL, NULL, '2', '30m x 50m', 1, 190466, 1, '2024-09-20 20:22:21', '2024-10-06 08:36:36'),
(83, 5, 52, 'uploads/BsnOoOQlLGt2aGfNjzifd1kyhqpKeATbaM7mXe5Z.png', NULL, '1', '30m x 50m', 0, 70233, 1, '2024-09-20 20:22:47', '2024-10-06 08:36:36'),
(84, 5, 44, 'uploads/l3k5dHrzKaf2IXRg5I59wc0yAWcw5e4NwjgPEPC0.jpg', 'undefined', '1', '30mx30m', 0, 73680, 1, '2024-09-20 21:55:25', '2024-10-06 08:36:36'),
(85, 5, 44, 'uploads/UdYDNIE1MLrqgI5Dz3wiVzSI1tKsxErRTBt0L2pq.png', 'asdasdassd', '1', '30mx30m', 0, 73680, 1, '2024-09-20 21:56:24', '2024-10-06 08:36:36'),
(86, 5, 44, NULL, NULL, '1', '30mx30m', 1, 123680, 1, '2024-09-22 06:22:39', '2024-10-06 08:36:36'),
(87, 5, 44, 'uploads/5N7OtOin9fxWQMbENJLRj3MpAbaf1g8Gb0p8kcFV.png', 'kjhkjhuyu', '2', '30mx30m', 0, 147360, 1, '2024-09-22 06:36:35', '2024-10-06 08:36:36'),
(88, 5, 44, NULL, NULL, '1', '30mx30m', 1, 123680, 1, '2024-10-02 01:05:21', '2024-10-06 08:36:36'),
(89, 5, 44, NULL, NULL, '1', '30mx30m', 1, 123680, 1, '2024-10-03 05:39:58', '2024-10-06 08:36:36'),
(90, 5, 47, NULL, NULL, '1', '(50m x 30m)', 0, 62128, 1, '2024-10-03 05:40:39', '2024-10-06 08:36:36'),
(91, 5, 44, NULL, NULL, '1', '30mx30m', 1, 123680, 1, '2024-10-03 06:52:46', '2024-10-06 08:36:36'),
(92, 5, 44, NULL, NULL, '1', '30mx30m', 1, 123680, 1, '2024-10-06 08:35:58', '2024-10-06 08:36:36'),
(93, 6, 44, NULL, NULL, '1', '30mx30m', 1, 123680, 1, '2024-10-15 09:43:47', '2024-10-31 13:55:39'),
(98, 6, 52, NULL, NULL, '1', '30m x 50m', 1, 120233, 1, '2024-10-15 21:40:36', '2024-10-31 13:55:39'),
(100, 6, 44, NULL, NULL, '1', '30mx30m', 1, 123680, 1, '2024-10-16 04:47:44', '2024-10-31 13:55:39'),
(101, 6, 44, 'uploads/xIESBWZwBHzpY2dtqLt8jPYGWXodjfX7pRkwsUqj.png', NULL, '1', '30mx30m', 0, 73680, 1, '2024-10-16 05:42:59', '2024-10-31 13:55:39'),
(102, 6, 61, 'uploads/kChKr8BlA4WlPUJ91A5bACJmaGU5pscuNNuIUWba.jpg', NULL, '1', '60cm x 160 cm', 0, 150000, 1, '2024-10-16 12:28:03', '2024-10-31 13:55:39'),
(103, 6, 63, NULL, NULL, '1', '60cm x 160 cm', 0, 178000, 1, '2024-10-17 06:33:35', '2024-10-31 13:55:39'),
(114, 6, 61, 'uploads/CREeDaTBLuY9YLEpoUUCGoPyxzn6grFysN958QsC.jpg', NULL, '2', '60cm x 160 cm', 0, 350000, 1, '2024-10-31 13:33:12', '2024-10-31 13:55:39'),
(115, 6, 63, 'uploads/9ia69sjvsOdpOXxvfYz3PPydsH0lhOP3gVe5heIw.jpg', 'Cetak 2 kali dengan ukuran sama ya', '2', '60cm x 160 cm', 0, 370000, 1, '2024-10-31 13:43:04', '2024-10-31 13:55:39'),
(116, 6, 89, 'uploads/ptptqraShZAGsR4g3pO2B5gaQY9Q6QxCkuVxQ4VT.jpg', 'Cetak ukuran 4x4 sebanyak 5 lembar', '5', '3.5 x 3.5', 0, 75000, 1, '2024-10-31 13:43:59', '2024-10-31 13:55:39'),
(117, 6, 132, NULL, NULL, '3', 'Standart (P 15.1cm x D 1cm )', 0, 6000, 1, '2024-10-31 13:44:32', '2024-10-31 13:55:39'),
(119, 6, 136, NULL, NULL, '1', '30cm', 0, 2000, 1, '2024-10-31 13:52:59', '2024-10-31 13:55:39'),
(120, 6, 101, NULL, NULL, '2', '-', 0, 14000, 1, '2024-10-31 13:53:21', '2024-10-31 13:55:39'),
(121, 6, 89, 'uploads/VkHVBfnfyQU2ay2DMzCMsM0LknrYkAG9dcjOpChF.jpg', 'Cetak Ukuran 6x6 dalam 10lembar ya', '10', '3.5 x 3.5', 0, 150000, 1, '2024-10-31 13:54:11', '2024-10-31 13:55:39');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
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
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `nama_kategori`, `deskripsi`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'DESIGN GRAFIS', 'Design Grafis', '17298660335.png', '2024-10-19 06:49:12', '2024-10-25 14:20:33'),
(2, 'PERALATAN KANTOR', 'Temukan Semua Kebutuhan Kantor Disini', '17298660443.png', '2024-10-16 09:46:13', '2024-10-25 14:20:44'),
(3, 'CETAK BUKU', 'Cetak Buku Berkualitas', '17298660557.png', '2024-10-16 09:46:57', '2024-10-25 14:20:55'),
(4, 'ALAT TULIS & KERTAS', 'Alat Tulis & Kertas', '17298660669.png', '2024-10-16 09:47:55', '2024-10-25 14:21:06');

-- --------------------------------------------------------

--
-- Table structure for table `cls`
--

CREATE TABLE `cls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `gateways`
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
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `nama_bank`, `atas_nama`, `rekening`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'Bank BCA', 'Muslimin', '0940896444', '17290633728.jpg', NULL, '2024-10-19 07:13:46'),
(2, 'Bank BRI', 'Jamilatun Maghfiroh', '119201006085509', '17290634169.jpg', '2024-09-16 13:34:02', '2024-10-19 06:09:05');

-- --------------------------------------------------------

--
-- Table structure for table `members`
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
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `nama_member`, `no_hp`, `email`, `password`, `created_at`, `updated_at`) VALUES
(6, 'Ayu Sulis', '0987653245666', 'ayusulis@gmail.com', '$2y$10$HvUwAOqN.ZoHKK.Bovl8G.kG6Mco4bMBT/uQu3Tc/K1dc9gPPKbaC', '2024-10-15 09:42:35', '2024-10-15 09:42:35'),
(8, 'Muslimin', '081398290684', 'milafc84@gmail.com', '$2y$10$v7w3rt1POZ0s8HKTzast8.zj/fnlUv5F8gfpZe.uOged2M3EJ/qiy', '2024-10-17 07:21:31', '2024-10-17 07:21:31'),
(9, 'Syafa Nafiza', '09898238893', 'Syafa@gmail.com', '$2y$10$RiACpNDijMW3TtggqfhTeeryDwh5BkAebwNN0C5U7evNj9E/Qt346', '2024-10-19 07:06:06', '2024-10-19 07:06:06'),
(10, 'Malabay', '081268482410', 'mala231071@gmail.com', '$2y$10$qZ5rs6G5VB76o5hvY4/yIukdRlHwXDQiPmWlWK7KzKxWlZakqTlPu', '2024-11-01 12:52:12', '2024-11-01 12:52:12');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
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
-- Table structure for table `orders`
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
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `id_member`, `invoice`, `berat`, `grand_total`, `provinsi`, `kota`, `detail_alamat`, `no_resi`, `charge`, `created_at`, `updated_at`, `status`) VALUES
(53, 6, 24101626, 12, 83680, 'Jawa Barat', 'Bekasi', 'Bekasi', NULL, 0, '2024-10-16 05:43:26', '2024-10-16 05:46:32', 'Selesai'),
(54, 6, 24101608, 650, 190000, 'DKI Jakarta', 'Jakarta Selatan', 'Jl Pengasingan no 14, Kelurahan Cikuya , Jakarta Selatan', '123456789', 0, '2024-10-16 12:29:08', '2024-10-16 12:34:35', 'Selesai'),
(72, 6, 24103142, 4000, 390000, 'Jawa Barat', 'Bekasi', 'Jl Mustang No 16 Rt 1/Rw 13, Jaladhapura , Margahayu\r\nBekasi Timur, Jawa Barat 17113', 'CM25134842555', 0, '2024-10-31 13:36:42', '2024-10-31 14:11:08', 'Selesai'),
(74, 6, 24103152, 3310, 491000, 'Jawa Barat', 'Bekasi', 'Jl Mustang No 16a Rt 1/Rw 13 Jaladhapura, Margahayu\r\nBekasi Timur, Jawa Barat 17113', 'CM25134842445', 0, '2024-10-31 13:48:52', '2024-10-31 14:11:11', 'Baru'),
(76, 6, 24103139, 450, 176000, 'Jawa Barat', 'Bekasi', 'Jl Mustang No 16a Rt 1/Rw 13 Jaladhapura, Margahayu\r\nBekasi Timur, Jawa Barat 17113', 'CM25134842456', 0, '2024-10-31 13:55:39', '2024-10-31 14:11:14', 'Selesai');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `is_need_design` int(11) NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `jumlah` int(11) NOT NULL,
  `size` varchar(255) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `id_order`, `id_produk`, `is_need_design`, `file`, `note`, `jumlah`, `size`, `total`, `created_at`, `updated_at`) VALUES
(54, 53, 44, 0, 'uploads/xIESBWZwBHzpY2dtqLt8jPYGWXodjfX7pRkwsUqj.png', NULL, 1, '30mx30m', 73680, '2024-10-16 12:43:26', '2024-10-16 12:43:26'),
(55, 54, 61, 0, 'uploads/kChKr8BlA4WlPUJ91A5bACJmaGU5pscuNNuIUWba.jpg', NULL, 1, '60cm x 160 cm', 150000, '2024-10-16 19:29:08', '2024-10-16 19:29:08'),
(57, 72, 61, 0, 'uploads/CREeDaTBLuY9YLEpoUUCGoPyxzn6grFysN958QsC.jpg', NULL, 2, '60cm x 160 cm', 350000, '2024-10-31 20:36:42', '2024-10-31 20:36:42'),
(61, 74, 63, 0, 'uploads/9ia69sjvsOdpOXxvfYz3PPydsH0lhOP3gVe5heIw.jpg', 'Cetak 2 kali dengan ukuran sama ya', 2, '60cm x 160 cm', 370000, '2024-10-31 20:48:52', '2024-10-31 20:48:52'),
(62, 74, 89, 0, 'uploads/ptptqraShZAGsR4g3pO2B5gaQY9Q6QxCkuVxQ4VT.jpg', 'Cetak ukuran 4x4 sebanyak 5 lembar', 5, '3.5 x 3.5', 75000, '2024-10-31 20:48:52', '2024-10-31 20:48:52'),
(63, 74, 132, 0, NULL, NULL, 3, 'Standart (P 15.1cm x D 1cm )', 6000, '2024-10-31 20:48:52', '2024-10-31 20:48:52'),
(67, 76, 136, 0, NULL, NULL, 1, '30cm', 2000, '2024-10-31 20:55:39', '2024-10-31 20:55:39'),
(68, 76, 101, 0, NULL, NULL, 2, '-', 14000, '2024-10-31 20:55:39', '2024-10-31 20:55:39'),
(69, 76, 89, 0, 'uploads/VkHVBfnfyQU2ay2DMzCMsM0LknrYkAG9dcjOpChF.jpg', 'Cetak Ukuran 6x6 dalam 10lembar ya', 10, '3.5 x 3.5', 150000, '2024-10-31 20:55:39', '2024-10-31 20:55:39');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
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
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `id_order`, `kategori`, `jumlah`, `id_gateway`, `bukti_pembayaran`, `status`, `created_at`, `updated_at`, `id_member`) VALUES
(34, 53, 'order', 83680, 2, 'bukti_pembayaran/IzLVodAx2rH4C8E0CekSvlTruhDSpJmfiVEcWUYC.png', 'DITERIMA', '2024-10-16 05:43:44', '2024-10-16 05:47:05', 6),
(35, 54, 'order', 190000, 1, 'bukti_pembayaran/uE1gHjjqSXv0N2BfaKJLT2oDI1NRNqiUjxNhHxRq.png', 'DITERIMA', '2024-10-16 12:29:31', '2024-10-16 12:29:58', 6),
(37, 72, 'order', 390000, 1, 'bukti_pembayaran/9KUKlLfjxJ9goddgF9FCbo528Agz6ZMnzbLfp5Mn.jpg', 'DITERIMA', '2024-10-31 13:37:50', '2024-10-31 14:01:40', 6),
(38, 74, 'order', 491000, 1, 'bukti_pembayaran/1UCept3eClQXqcDx4jBoQLkgpZBm9nX1O4PQ1faV.jpg', 'DITERIMA', '2024-10-31 13:51:57', '2024-10-31 14:01:48', 6),
(39, 76, 'order', 176000, 2, 'bukti_pembayaran/29wLPYou7OHOAluuKAgS2ZuGqvl1bA6KzHi9Q7EW.jpg', 'DITERIMA', '2024-10-31 13:56:11', '2024-10-31 14:01:55', 6);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
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
-- Table structure for table `products`
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `id_kategori`, `id_subkategori`, `nama_produk`, `gambar`, `deskripsi`, `berat`, `harga`, `tags`, `sku`, `ukuran`, `created_at`, `updated_at`) VALUES
(61, 1, 1, 'Roll Up Banner 1 | Stand Banner Alumunium(Moving Roll Up) | Bahan Flexy Korea 380gsm', '17298667319.png', 'CETAK ROLL UP BANNER\r\nSpesifikasi \r\n1. Bahan Flexy Korea 380gsm\r\n2.Ukuran Khusus 60cmx160cm\r\n3.Tiang Roll Banner Menggunakan Alumunium(Moving Roll Up)\r\n\r\nProses Pengerjaan:\r\n1. Jika sudah memiliki desain dan siap cetak, akan diproses di hari saat orderan masuk.\r\n2. Jika belum memiliki desain. Ada jasa pengerjaan desain dan produk di kirim 2-3 hari\r\n\r\n** Happy Shopping **', 2000, 175000, 'Roll Up Banner,Flexy Korea 380gsm,60x160', 'RB-001', '60cm x 160 cm', '2024-10-16 11:42:51', '2024-10-30 07:21:53'),
(62, 1, 1, 'Roll Up Banner 2 | Stand Banner Alumunium(Moving Roll Up) | Bahan Flexy Korea 440gsm', '17298668597.png', 'CETAK ROLL UP BANNER\r\nSpesifikasi \r\n1. Bahan Flexy Korea 440gsm\r\n2.Ukuran Khusus 60cmx160cm\r\n3.Tiang Roll Banner Menggunakan Alumunium(Moving Roll Up)\r\n\r\nProses Pengerjaan:\r\n1. Jika sudah memiliki desain dan siap cetak, akan diproses di hari saat orderan masuk.\r\n2. Jika belum memiliki desain. Ada jasa pengerjaan desain dan produk di kirim 2-3 hari\r\n\r\n** Happy Shopping **', 2000, 198000, 'Roll Up Banner,Flexy Korea 440gsm,60x160', 'RB-002', '60cm x 160 cm', '2024-10-16 12:53:56', '2024-10-30 07:22:01'),
(63, 1, 1, 'Roll Up Banner 3 | Stand Banner Alumunium(Moving Roll Up) | Bahan Albatros', '17298669121.png', 'CETAK ROLL UP BANNER\r\nSpesifikasi \r\n1. Bahan Albatros\r\n2.Ukuran Khusus 60cmx160cm\r\n3.Tiang Roll Banner Menggunakan Alumunium(Moving Roll Up)\r\n\r\nProses Pengerjaan:\r\n1. Jika sudah memiliki desain dan siap cetak, akan diproses di hari saat orderan masuk.\r\n2. Jika belum memiliki desain. Ada jasa pengerjaan desain dan produk di kirim 2-3 hari\r\n\r\n** Happy Shopping **', 1600, 185000, 'Roll Up Banner, Albatros,60x160', 'RB-003', '60cm x 160 cm', '2024-10-16 12:56:46', '2024-10-30 07:22:37'),
(64, 1, 1, 'Roll Up Banner 4 | Stand Banner Alumunium(Moving Roll Up) | Bahan  Luster', '17298669416.png', 'CETAK ROLL UP BANNER\r\nSpesifikasi \r\n1. Bahan Luster\r\n2.Ukuran Khusus 60cmx160cm\r\n3.Tiang Roll Banner Menggunakan Alumunium(Moving Roll Up)\r\n\r\nProses Pengerjaan:\r\n1. Jika sudah memiliki desain dan siap cetak, akan diproses di hari saat orderan masuk.\r\n2. Jika belum memiliki desain. Ada jasa pengerjaan desain dan produk di kirim 2-3 hari\r\n\r\n** Happy Shopping **', 2000, 200000, 'Roll Up Banner, Luster,60x160', 'RB-004', '60cm x 160 cm', '2024-10-16 12:59:33', '2024-10-30 07:22:47'),
(65, 1, 1, 'Roll Up Banner 5 | Stand Banner Alumunium(Moving Roll Up) | Bahan Flexy Korea 380gsm', '17302712241.png', 'CETAK ROLL UP BANNER\r\nSpesifikasi \r\n1. Bahan Flexy Korea 380gsm \r\n2.Terdapat 2 ukuran dengan harga sama yaitu khusus 85cm x 200cm dan 80cm x200cm\r\n3.Tiang Roll Banner Menggunakan Alumunium(Moving Roll Up)\r\n\r\nProses Pengerjaan:\r\n1. Jika sudah memiliki desain dan siap cetak, akan diproses di hari saat orderan masuk.\r\n2. Jika belum memiliki desain. Ada jasa pengerjaan desain dan produk di kirim 2-3 hari\r\n\r\n** Happy Shopping **', 3000, 222000, 'Roll Up Banner,Flexy Korea 380gsm,85x200,80x200', 'RB-005', '85cm x 200cm,  80cm x 200cm', '2024-10-16 13:01:36', '2024-10-31 12:32:20'),
(66, 1, 1, 'Roll Up Banner 6 | Stand Banner Alumunium(Moving Roll Up) | Bahan Flexy Korea 440gsm', '17298671601.png', 'CETAK ROLL UP BANNER\r\nSpesifikasi \r\n1. Bahan Flexy Korea 440gsm\r\n2.Terdapat 2 ukuran dengan harga sama yaitu khusus 85cm x 200cm dan 80cm x200cm\r\n3.Tiang Roll Banner Menggunakan Alumunium(Moving Roll Up)\r\n\r\nProses Pengerjaan:\r\n1. Jika sudah memiliki desain dan siap cetak, akan diproses di hari saat orderan masuk.\r\n2. Jika belum memiliki desain. Ada jasa pengerjaan desain dan produk di kirim 2-3 hari\r\n\r\n** Happy Shopping **', 3000, 245000, 'Roll Up Banner, Flexy Korea 440, 85x200,80x200', 'RB-006', '85cm x 200 cm, 80cm x 200cm', '2024-10-16 13:04:06', '2024-10-31 12:32:51'),
(67, 1, 1, 'Roll Up Banner 7 | Stand Banner Alumunium(Moving Roll Up) | Bahan Luster', '17302681129.png', 'CETAK ROLL UP BANNER\r\nSpesifikasi \r\n1. Bahan Luster\r\n2.Terdapat 2 ukuran dengan harga sama yaitu khusus 85cm x 200cm dan 80cm x200cm\r\n3.Tiang Roll Banner Menggunakan Alumunium(Moving Roll Up)\r\n\r\nProses Pengerjaan:\r\n1. Jika sudah memiliki desain dan siap cetak, akan diproses di hari saat orderan masuk.\r\n2. Jika belum memiliki desain. Ada jasa pengerjaan desain dan produk di kirim 2-3 hari\r\n\r\n** Happy Shopping **', 3000, 270000, 'Roll Up Banner, Luster,80x200,85x200', 'RB-007', '80cm x 200cm, 85cm x 200cm', '2024-10-16 13:06:56', '2024-10-31 12:32:59'),
(68, 1, 1, 'Roll Up Banner 8 | Stand Banner Alumunium(Moving Roll Up) | Bahan Albatros', '17302706969.png', 'CETAK ROLL UP BANNER\r\nSpesifikasi \r\n1. Bahan Albatros & Flexy Korea 380gsm\r\n2.Terdapat 2 ukuran dengan harga sama yaitu khusus 85cm x 200cm dan 80cm x200cm\r\n3.Tiang Roll Banner Menggunakan Alumunium(Moving Roll Up)\r\n\r\nProses Pengerjaan:\r\n1. Jika sudah memiliki desain dan siap cetak, akan diproses di hari saat orderan masuk.\r\n2. Jika belum memiliki desain. Ada jasa pengerjaan desain dan produk di kirim 2-3 hari\r\n\r\n** Happy Shopping **', 3000, 220000, 'Roll Up Banner ,Albatros, 80x200 x 85x200', 'RB-008', '80cm x 200cm,85cm x 200cm', '2024-10-16 13:06:56', '2024-10-31 12:33:07'),
(69, 1, 1, 'Roll Up Banner 9 | Stand Banner Alumunium(Moving Roll Up) | Bahan Flexy Korea 440gsm', '17300682325.png', 'CETAK ROLL UP BANNER\r\nSpesifikasi \r\n1. Bahan Flexy Korea 440gsm\r\n2.Ukuran Khusus 80mx200cm\r\n3.Tiang Roll Banner Menggunakan Alumunium(Moving Roll Up)\r\n\r\nProses Pengerjaan:\r\n1. Jika sudah memiliki desain dan siap cetak, akan diproses di hari saat orderan masuk.\r\n2. Jika belum memiliki desain. Ada jasa pengerjaan desain dan produk di kirim 2-3hari\r\n\r\n** Happy Shopping **', 3000, 247000, 'Roll Up Banner ,Bahan Flexy Korea 440gsm,80x200', 'RB-009', '80cm x 200cm', '2024-10-16 13:06:56', '2024-10-31 12:33:18'),
(71, 1, 1, 'X Banner 1 | Cetak X-Banner Stand | Albatros', '17298674756.png', 'CETAK X-BANNER\r\nSpesifikasi \r\n1. Bahan Albatros (penggunaan indoor)\r\n2.Ukuran Khusus 60cmx160cm\r\n3.Stand rangka X-banner premiun\r\n\r\nProses Pengerjaan:\r\n1. Jika sudah memiliki desain dan siap cetak, akan diproses di hari saat orderan masuk.\r\n2. Jika belum memiliki desain. Ada jasa pengerjaan desain dan produk di kirim 2-3hari\r\n\r\n** Happy Shopping **', 1000, 81000, 'X-banner,Albatros,60x160', 'RB-010', '60cm x 160cm', '2024-10-16 13:06:56', '2024-10-31 12:33:45'),
(72, 1, 2, 'Cetak Sablon Tali Lanyard | Full Printing | Sisi Depan | 1 Sisi', '17298679532.png', 'CETAK SABLON TALI LANYARD\r\n\r\nSpesifikasi:\r\n1. Ukuran MentahTali 90cm(45cm setelah jadi)\r\n2. Kait Cantelan Besi di Ujung Tali Lanyard\r\n3. Bahan Nilon Lebar 2cm\r\n4. Full Printing\r\n5. Minimal Order 10pcs\r\n6. Harga tertera adalah harga per pcs\r\n\r\nCatatan:\r\n-Pilihan Sablon 1 sisi(Tulisan hanya bagian depan, belakang polos)\r\n-Jika sudah memiliki desain bisa diunggah langsung pada button tersedia\r\n\r\n** Happy Shopping **', 20, 10000, 'Sablon Tali Lanyard , 1 Sisi', 'LNY-001', 'Merah, Kuning,Hijau, Hitam, Biru, Putih', '2024-10-16 13:06:56', '2024-10-31 12:34:12'),
(73, 1, 2, 'Cetak Sablon Tali Lanyard | Full Printing | Sisi Depan Belakang | 2 Sisi', '17298680075.png', 'CETAK SABLON TALI LANYARD 2 SISI\r\n\r\nSpesifikasi:\r\n1. Ukuran MentahTali 90cm(45cm setelah jadi)\r\n2. Kait Cantelan Besi di Ujung Tali Lanyard\r\n3. Bahan Nilon Lebar 2cm\r\n4. Full Printing\r\n5. Minimal Order 10pcs\r\n6. Harga tertera adalah harga per pcs\r\n\r\nCatatan:\r\n-Pilihan Sablon 2 sisi(Tulisan  ada bagian depan dan belakang )\r\n-Jika sudah memiliki desain bisa diunggah langsung pada button tersedia\r\n\r\n** Happy Shopping **', 20, 20000, 'Sablon Tali Lanyard, Sablon 2 Sisi', 'LNY-002', 'Merah, Kuning,Hijau, Hitam , Biru, Putih', '2024-10-16 13:06:56', '2024-10-31 12:34:25'),
(74, 1, 2, 'Cetak Sablon Tali Lanyard Costum | Sisi Depan Belakang | 2 Sisi', '17298681071.png', 'CETAK SABLON TALI LANYARD 2 SISI\r\n\r\nSpesifikasi:\r\n1. Bahan Nilom lebar 2 cm\r\n2. Ukuran mentah 90cm(Ukuran Tali Jadi 45cm)\r\n3. Full Printing\r\n4.  Kait cantelan besi di ujung tali lanyard\r\n5. Minimal Order 10pcs\r\n6. Harga tertera adalah harga per pcs\r\n\r\nCara order:\r\n-Pilihan Sablon 2  sisi dengan costum corak warna yang banyak(Tulisan ada dibagian depan dan belakang)\r\n-Jika sudah memiliki desain bisa diunggah langsung pada button tersedia\r\n\r\n** Happy Shopping **', 20, 23000, 'Sablon Tali Lanyard Costum, Sablon 2 Sisi', 'LNY-013', 'Merah, Kuning,Hijau, Hitam , Biru, Putih', '2024-10-16 13:06:56', '2024-10-31 12:34:33'),
(75, 1, 2, 'Cetak Sablon Tali Lanyard Costum | Sisi Depan | 1 Sisi', '17298681737.png', 'CETAK SABLON TALI LANYARD 1 SISI\r\n\r\nSpesifikasi:\r\n1. Bahan Nilom lebar 2 cm\r\n2. Ukuran mentah 90cm(Ukuran Tali Jadi 45cm)\r\n3. Full Printing\r\n4.  Kait cantelan besi di ujung tali lanyard\r\n5. Minimal Order 10pcs\r\n6. Harga tertera adalah harga per pcs\r\n\r\nCara order:\r\n-Pilihan Sablon 1  sisi dengan costum corak warna yang banyak(Tulisan hanya bagian depan, belakang polos)\r\n-Jika sudah memiliki desain bisa diunggah langsung pada button tersedia\r\n\r\n** Happy Shopping **', 20, 12000, 'Sablon Tali Lanyard Costum, Sablon 1 Sisi', 'LNY-019', 'Merah, Kuning,Hijau, Hitam , Biru, Putih', '2024-10-16 13:06:56', '2024-10-31 12:34:41'),
(76, 1, 2, 'ID Card PVC | SISI DEPAN | PVC Premium', '17298685274.png', 'CETAK ID CARD PVC 1 SISI\r\n\r\nSpesifikasi:\r\n1. Minimal order 10 pcs\r\n2. Menggunakan Bahan PCV dengan ketebalan 0,76 micron\r\n3. Cetak untuk 1 sisi\r\n4. Produk kuat dan tahan lama\r\n5. Terdapat lubang pengait pada bagian tengah atas \r\n6. Harga tertera adalah harga per pcs\r\n\r\n** Happy Shopping **', 7, 5000, 'ID Card PVC, 1 Sisi', 'ICP-001', '8.6cm x 5.4cm', '2024-10-16 13:06:56', '2024-10-31 12:35:01'),
(77, 1, 2, 'ID Card PVC | SISI DEPAN BELAKANG | PVC Premium', '17298686017.png', 'CETAK ID CARD PVC 2 SISI\r\n\r\nSpesifikasi:\r\n1. Minimal order 10 pcs\r\n2. Menggunakan Bahan PCV dengan ketebalan 0,76 micron\r\n3. Cetak untuk 2 sisi yaitu tampak depan dan belakang\r\n4. Produk kuat dan tahan lama\r\n5. Terdapat lubang pengait pada bagian tengah atas\r\n6. Harga tertera adalah harga per pcs\r\n\r\n** Happy Shopping **', 7, 10000, 'ID Card PVC, 2 Sisi', 'ICP-002', '8.6cm x 5.4cm', '2024-10-16 13:06:56', '2024-10-31 12:35:08'),
(78, 1, 2, 'Casing ID Card | Card Holder', '17298688057.png', 'CASING ID CARD / CARD HOLDER \r\n\r\nSpesifikasi:\r\n1. Casing id card terbuat dari plastik tebal yang tidak mudah ditekuk atau dilipat. \r\n2. Casing Id Card transparan untuk bagian depan. identitas ukuran kartu standar\r\n3. Ukuran casing : 11cm x 7cm\r\n4. Ukuran kartu dalam : 5,4cm x 8,5cm\r\n5. Harga diatas harga card per pcs tanpa tambahan tali\r\n\r\n** Happy Shopping **', 28, 4000, 'Casing ID Card', 'CID-001', 'Merah, Kuning,Hijau, Hitam, Biru, Putih', '2024-10-16 13:06:56', '2024-10-31 12:35:24'),
(79, 1, 3, 'Cetak Spanduk | Bahan Flexy 340gram | Ukuran 1x1(permeter)', '17298689611.png', 'CETAK SPANDUK SESUAI UKURAN \r\n\r\nSpesifikasi: \r\n1. Cetak spanduk dengan harga per meter adalah 30rb \r\n2. Bahan menggunakan flexy 340gsm yang berkualitas \r\n3, Finishing menggunakan 4 mata ayam di setiap ujung nya. Jika tidak menggunakan harap cantumkan catatan \r\n4. Perhitungan harga tertera adalah per meter\r\n\r\nDetail Order :\r\n1. Harga 1 meter persegi (100cm x 100cm) \r\n2. Jika pesan ukuran 0.5 x 1m. Pemesanan dilakukan 1 kali add\r\n3. Jika pesan ukuran 2 x 1.5 m. Pemesanan di lakukan 4 kali add(panjang dan lebar ditambah lalu dibulatkan karena hitungan bahan permeter)\r\n4. Jika sudah mempunyai desain, bisa langsung diunggah dan akan diproses dihari yang sama \r\n5. Jika belum memiliki desain, harap menambahkan jasa desain dan bisa mengunggah desain kasar\r\n\r\n** Happy Shopping **', 400, 30000, 'Spanduk, Flexy 340', 'SPD-001', '1mx1m', '2024-10-25 15:09:21', '2024-10-31 12:35:40'),
(80, 1, 3, 'Cetak Spanduk | Bahan Flexy 440gsm | Ukuran 1x1(permeter)', '17298690153.png', 'CETAK SPANDUK SESUAI UKURAN \r\n\r\nSpesifikasi: \r\n1. Cetak spanduk dengan harga per meter adalah 35rb \r\n2. Bahan menggunakan flexy 440gsm yang berkualitas \r\n3, Finishing menggunakan 4 mata ayam di setiap ujung nya. Jika tidak menggunakan harap cantumkan catatan \r\n4. Perhitungan harga tertera adalah per meter\r\n\r\nDetail Order :\r\n1. Harga 1 meter persegi (100cm x 100cm) \r\n2. Jika pesan ukuran 0.5 x 1m. Pemesanan dilakukan 1 kali add\r\n3. Jika pesan ukuran 2 x 1.5 m. Pemesanan di lakukan 4 kali add(panjang dan lebar ditambah lalu dibulatkan karena hitungan bahan permeter)\r\n4. Jika sudah mempunyai desain, bisa langsung diunggah dan akan diproses dihari yang sama \r\n5. Jika belum memiliki desain, harap menambahkan jasa desain dan bisa mengunggah desain kasar\r\n\r\n** Happy Shopping **', 500, 35000, 'Spanduk, Flexy 440', 'SPD-002', '1mx1m', '2024-10-25 15:10:15', '2024-10-31 12:35:57'),
(81, 1, 3, 'Cetak Banner | Bahan Flexy 340gsm | Ukuran 1x1(permeter)', '17298690734.png', 'CETAK BANNER SESUAI UKURAN \r\n\r\nSpesifikasi: \r\n1. Cetak spanduk dengan harga per meter adalah 30rb \r\n2. Bahan menggunakan flexy 340gsm yang berkualitas \r\n3, Finishing menggunakan 4 mata ayam di setiap ujung nya. Jika tidak menggunakan harap cantumkan catatan \r\n4. Perhitungan harga tertera adalah per meter\r\n\r\nDetail Order :\r\n1. Harga 1 meter persegi (100cm x 100cm) \r\n2. Jika pesan ukuran 0.5 x 1m. Pemesanan dilakukan 1 kali add\r\n3. Jika pesan ukuran 2 x 1.5 m. Pemesanan di lakukan 4 kali add(panjang dan lebar ditambah lalu dibulatkan karena hitungan bahan permeter)\r\n4. Jika sudah mempunyai desain, bisa langsung diunggah dan akan diproses dihari yang sama \r\n5. Jika belum memiliki desain, harap menambahkan jasa desain dan bisa mengunggah desain kasar\r\n\r\n** Happy Shopping **', 400, 30000, 'Banner, Flexy 340', 'BAN-001', '1mx1m', '2024-10-25 15:11:13', '2024-10-31 12:36:17'),
(82, 1, 3, 'Cetak Banner | Bahan Flexy 440gsm | Ukuran 1x1(permeter)', '17298691132.png', 'CETAK BANNER SESUAI UKURAN \r\n\r\nSpesifikasi: \r\n1. Cetak spanduk dengan harga per meter adalah 35rb \r\n2. Bahan menggunakan flexy 440gsm yang berkualitas \r\n3, Finishing menggunakan 4 mata ayam di setiap ujung nya. Jika tidak menggunakan harap cantumkan catatan \r\n4. Perhitungan harga tertera adalah per meter\r\n\r\nDetail Order :\r\n1. Harga 1 meter persegi (100cm x 100cm) \r\n2. Jika pesan ukuran 0.5 x 1m. Pemesanan dilakukan 1 kali add\r\n3. Jika pesan ukuran 2 x 1.5 m. Pemesanan di lakukan 4 kali add(panjang dan lebar ditambah lalu dibulatkan karena hitungan bahan permeter)\r\n4. Jika sudah mempunyai desain, bisa langsung diunggah dan akan diproses dihari yang sama \r\n5. Jika belum memiliki desain, harap menambahkan jasa desain dan bisa mengunggah desain kasar\r\n\r\n** Happy Shopping **', 500, 35000, 'Banner, Flexy 440', 'BAN-002', '1mx1m', '2024-10-25 15:11:53', '2024-10-31 12:36:25'),
(83, 1, 4, 'Cetak Backdrop | Bahan Flexy 280gsm | Ukuran 1mx1m', '17299378862.png', 'CETAK BACKDROP UKURAN 1X1\r\n\r\nSpesifikasi: \r\n1. Cetak backdrop khusus ukuran 1m x 1m\r\n2. Bahan menggunakan flexy 280gsm yang berkualitas \r\n3, Finishing menggunakan 4 mata ayam di setiap ujung nya. Jika tidak menggunakan harap cantumkan catatan \r\n4. Produk berkualitas dan high resolution\r\n\r\n** Happy Shopping **', 1000, 50000, 'Backdrop,Flexy 280gs,,1mx1m', 'BDP-001', '1mx1m', '2024-10-26 10:18:06', '2024-10-31 12:37:12'),
(84, 1, 4, 'Cetak Backdrop | Bahan Flexy 280gsm | Ukuran 1mx1,5m', '17299379305.png', 'CETAK BACKDROP UKURAN 1X1.5\r\n\r\nSpesifikasi: \r\n1. Cetak backdrop khusus ukuran 1m x 1.5m\r\n2. Bahan menggunakan flexy 280gsm yang berkualitas \r\n3, Finishing menggunakan 4 mata ayam di setiap ujung nya. Jika tidak menggunakan harap cantumkan catatan \r\n4. Produk berkualitas dan high resolution\r\n\r\n** Happy Shopping **', 3, 70000, 'Backdrop,Flexy 280gs,,1mx1.5m', 'BDP-002', '1mx1.5m', '2024-10-26 10:18:50', '2024-10-30 07:40:57'),
(85, 1, 4, 'Cetak Backdrop | Bahan Flexy 280gsm | Ukuran 1mx2m', '17299379776.png', 'CETAK BACKDROP UKURAN 1X2\r\n\r\nSpesifikasi: \r\n1. Cetak backdrop khusus ukuran 1m x 2m\r\n2. Bahan menggunakan flexy 280gsm yang berkualitas \r\n3, Finishing menggunakan 4 mata ayam di setiap ujung nya. Jika tidak menggunakan harap cantumkan catatan \r\n4. Produk berkualitas dan high resolution\r\n\r\n** Happy Shopping **', 3, 85000, 'Backdrop,Flexy 280gs,,1mx2m', 'BDP-003', '1mx2m', '2024-10-26 10:19:37', '2024-10-30 07:41:07'),
(86, 1, 4, 'Cetak Backdrop | Bahan Flexy 280gsm | Ukuran 1.5mx1.5m', '17299380667.png', 'CETAK BACKDROP UKURAN 1.5X1.5\r\n\r\nSpesifikasi: \r\n1. Cetak backdrop khusus ukuran 1.5m x 1.5m\r\n2. Bahan menggunakan flexy 280gsm yang berkualitas \r\n3, Finishing menggunakan 4 mata ayam di setiap ujung nya. Jika tidak menggunakan harap cantumkan catatan \r\n4. Produk berkualitas dan high resolution\r\n\r\n** Happy Shopping **', 3, 95000, 'Backdrop,Flexy 280gsm,1.5mx1.5m', 'BDP-004', '1.5mx1.5m', '2024-10-26 10:21:06', '2024-10-30 07:41:15'),
(87, 1, 4, 'Cetak Backdrop | Bahan Flexy 280gsm | Ukuran 2mx1.5m', '17299381308.png', 'CETAK BACKDROP UKURAN 2X1.5\r\n\r\nSpesifikasi: \r\n1. Cetak backdrop khusus ukuran 2m x 1.5m\r\n2. Bahan menggunakan flexy 280gsm yang berkualitas \r\n3, Finishing menggunakan 4 mata ayam di setiap ujung nya. Jika tidak menggunakan harap cantumkan catatan \r\n4. Produk berkualitas dan high resolution\r\n\r\n** Happy Shopping **', 3, 115000, 'Backdrop,Flexy 280gsm,2mx1.5m', 'BDP-005', '2mx1,5m', '2024-10-26 10:22:10', '2024-10-30 07:43:04'),
(88, 1, 4, 'Cetak Backdrop | Bahan Flexy 280gsm | Ukuran 2mx2m', '17299381844.png', 'CETAK BACKDROP UKURAN 2X2\r\n\r\nSpesifikasi: \r\n1. Cetak backdrop khusus ukuran 2m x 2m\r\n2. Bahan menggunakan flexy 280gsm yang berkualitas \r\n3, Finishing menggunakan 4 mata ayam di setiap ujung nya. Jika tidak menggunakan harap cantumkan catatan \r\n4. Produk berkualitas dan high resolution\r\n\r\n** Happy Shopping **', 2500, 130000, 'Backdrop,Flexy 280gsm,2mx2m', 'BDP-006', '2mx2m', '2024-10-26 10:23:04', '2024-10-31 12:37:57'),
(89, 1, 5, 'Cetak Stiker Chromo A3 | Stiker Bulat | Free Cutting', '17299383317.png', 'CETAK STIKER A3 BAHAN CHROMO - BULAT\r\n\r\nSpesifikasi:\r\n1. Ukuran stiker pada lembar A3\r\n2. Bahan chromo anti air\r\n3. Minimal order 3 lembar\r\n4. Free Cutting. Jika tidak dicutting, cantumkan catatan. \r\n5. Stiker dicetak sesuai ketentuan\r\n\r\nDetail Ukuran:\r\n1. 3.5cm x 3.5cm = 77 pcs/lembar\r\n2. 4cm x 4cm = 80 pcs/lembar\r\n3. 5cm x 5cm = 40 pcs/lembar\r\n4. 6cm x 6cm = 28 pcs/lembar\r\n5. 7cm x 7cm = 24 pcs/lembar\r\n6. 8cm x 8cm = 15 pcs/lembar\r\n7. 9cm x 9cm = 12 pcs/lembar\r\n\r\n** Happy Shopping **', 10, 15000, 'Stiker Bulat Chromo A3', 'BLT-A3-CRM-001', '3.5 x 3.5, 4x4, 5x5, 6 x 6 ,7x7, 8x8,9x9', '2024-10-26 10:25:31', '2024-10-31 12:38:14'),
(90, 1, 5, 'Cetak Stiker Chromo A3 | Stiker Kotak | Free Cutting', '17299385519.png', 'CETAK STIKER A3 BAHAN CHROMO - KOTAK\r\n\r\nSpesifikasi:\r\n1. Ukuran stiker pada lembar A3\r\n2. Bahan chromo anti air\r\n3. Minimal order 3 lembar\r\n4. Free Cutting. Jika tidak dicutting, cantumkan catatan. \r\n5. Stiker dicetak sesuai ketentuan\r\n\r\nDetail Ukuran:\r\n1. 3.5cm x 3.5cm = 88 pcs/lembar\r\n2. 4cm x 4cm = 60 pcs/lembar\r\n3. 5cm x 5cm = 40 pcs/lembar\r\n4. 6cm x 6cm = 28 pcs/lembar\r\n5. 7cm x 7cm = 24 pcs/lembar\r\n6. 8cm x 8cm = 15 pcs/lembar\r\n7. 9cm x 9cm = 12 pcs/lembar\r\n\r\n** Happy Shopping **', 10, 15000, 'Stiker Kotak Chromo A3', 'KTK-A3-CRM-002', '3.5 x 3.5, 4x4, 5x5, 6 x 6 ,7x7, 8x8,9x9', '2024-10-26 10:29:11', '2024-10-31 12:38:37'),
(91, 1, 5, 'Cetak Stiker Chromo A3 | Stiker Persegi | Free Cutting', '17299386184.png', 'CETAK STIKER A3 BAHAN CHROMO - PERSEGI\r\n\r\nSpesifikasi:\r\n1. Ukuran stiker pada lembar A3\r\n2. Bahan chromo anti air\r\n3. Minimal order 3 lembar\r\n4. Free Cutting. Jika tidak dicutting, cantumkan catatan. \r\n5. Stiker dicetak sesuai ketentuan\r\n\r\nDetail Ukuran:\r\n1. 3.5cm x 3.5cm = 77 pcs/lembar\r\n2. 4cm x 4cm = 52 pcs/lembar\r\n3. 5cm x 5cm = 40 pcs/lembar\r\n4. 6cm x 6cm = 30 pcs/lembar\r\n5. 7cm x 7cm = 24 pcs/lembar\r\n6. 8cm x 8cm = 20 pcs/lembar\r\n7. 9cm x 9cm = 16 pcs/lembar\r\n\r\n** Happy Shopping **', 10, 15000, 'Stiker Persegi Chromo A3', 'PSG-A3-CRM-001', '3.5 x 3.5, 4x4, 5x5, 6 x 6 ,7x7, 8x8,9x9', '2024-10-26 10:30:18', '2024-10-31 12:38:44'),
(92, 1, 5, 'Cetak Stiker Chromo A3 | Stiker Oval | Free Cutting', '17299386651.png', 'CETAK STIKER A3 BAHAN CHROMO - OVAL\r\n\r\nSpesifikasi:\r\n1. Ukuran stiker pada lembar A3\r\n2. Bahan chromo anti air\r\n3. Minimal order 3 lembar\r\n4. Free Cutting. Jika tidak dicutting, cantumkan catatan. \r\n5. Stiker dicetak sesuai ketentuan\r\n\r\nDetail Ukuran:\r\n1. 3.5cm x 3.5cm = 65 pcs/lembar\r\n2. 4cm x 4cm = 54 pcs/lembar\r\n3. 5cm x 5cm = 40 pcs/lembar\r\n4. 6cm x 6cm = 24 pcs/lembar\r\n5. 7cm x 7cm = 21 pcs/lembar\r\n6. 8cm x 8cm = 16 pcs/lembar\r\n7. 9cm x 9cm = 9 pcs/lembar\r\n\r\n** Happy Shopping **', 10, 15000, 'Stiker Oval Chromo A3', 'OVL-A3-CRM-001', '3.5 x 3.5, 4x4, 5x5, 6 x 6 ,7x7, 8x8,9x9', '2024-10-26 10:31:05', '2024-10-31 12:38:54'),
(93, 1, 6, 'Flayer Art  Paper | Sisi Depan | A4', '17301056076.png', 'FLAYER ART PAPER 1 SISI\r\n\r\nSpesifikasi:\r\n1. Bahan Art Paper dengan 150Gsm\r\n2. Ukuran Flayer art A4(21cm x 29.7cm)\r\n3. Order minimal 100pcs\r\n4. Jika sudah memiliki desain maka boleh langsung diunggah\r\n\r\n** Happy Shopping **', 25, 3000, 'Flayer Art, 1 Sisi, A4', 'FL-A4-1M', '21cm x 29.7cm (A4)', '2024-10-26 10:33:44', '2024-10-31 12:39:15'),
(94, 1, 6, 'Flayer Art Paper | Sisi Depan Belakang | A4', '17301056415.png', 'FLAYER ART PAPER 2 SISI\r\n\r\nSpesifikasi:\r\n1. Bahan Art Paper dengan 150Gsm\r\n2. Ukuran Flayer art A4(21cm x 29.7cm)\r\n3. Order minimal 100pcs\r\n4. Jika sudah memiliki desain maka boleh langsung diunggah\r\n\r\n** Happy Shopping **', 25, 6000, 'Flayer Art, 2 Sisi, A4', 'FL-A4-2M', '21cm x 29,7cm (A4)', '2024-10-26 10:34:28', '2024-10-31 12:39:20'),
(95, 1, 6, 'Flayer Art Paper | Sisi Depan | A5', '17301056514.png', 'FLAYER ART PAPER 2 SISI\r\n\r\nSpesifikasi:\r\n1. Bahan Art Paper dengan 150Gsm\r\n2. Ukuran Flayer art A5(21cm x 14.8cm)\r\n3. Order minimal 100pcs\r\n4. Jika sudah memiliki desain maka boleh langsung diunggah\r\n\r\n** Happy Shopping **', 25, 2000, 'Flayer Art, 1 Sisi, A5', 'FL-A5-3M', '21cm x 14,8cm (A5)', '2024-10-26 10:35:36', '2024-10-31 12:39:28'),
(96, 1, 6, 'Flayer Art Paper | Sisi Depan Belakang | A5', '17301056617.png', 'FLAYER ART PAPER 2 SISI\r\n\r\nSpesifikasi:\r\n1. Bahan Art Paper dengan 150Gsm\r\n2. Ukuran Flayer art A5(21cm x 14,8cm)\r\n3. Order minimal 100pcs\r\n4. Jika sudah memiliki desain maka boleh langsung diunggah\r\n\r\n** Happy Shopping **', 25, 4000, 'Flayer Art, 2 Sisi, A5', 'FL-A5-4M', '21cm x 14,8cm(A5)', '2024-10-26 10:36:14', '2024-10-31 12:39:35'),
(97, 2, 7, 'Map L Folio F4 | Folder One', '17299392141.png', 'MAP L FOLIO UKURAN F4\r\n\r\nSpesifikasi:\r\n1. Ukuran Produk F4(23x34cm)\r\n2. Pembelian 1 pack Isi 12 pcs\r\n3. Map L biasa untuk penyimpanan dokumen, kertas, dll\r\n4. Merk Produk: Folder One\r\n5. Harga tertera adalah harga per pcs\r\n\r\n** Happy Shopping **', 15, 2000, 'Map L Folio', 'MP-F4', 'Merah, Kuning,Hijau, Biru,Putih', '2024-10-26 10:40:14', '2024-10-31 12:39:49'),
(98, 2, 7, 'Map Kertas Biasa | Isi 50 pcs', '17299393768.png', 'MAP KERTAS BIASA \r\n\r\nSpesifikasi:\r\n1. Pembelian 1 pack isi 50pcs\r\n2. Terdapat 4 pilihan warna \r\n3. Biasa digunakan untuk menyimpan dokumen, kertas, dll\r\n4. Produk bagus dan berkualitas \r\n5. Harga tertera adalah harga per pcs', 35, 3000, 'Map Kertas Biasa', 'MP-50', 'Merah, Kuning,Hijau, Biru', '2024-10-26 10:42:56', '2024-10-31 12:40:02'),
(99, 2, 7, 'Paper Clip Joyko | Penjepit Kertas No 3', '17299395511.png', 'PAPER CLIP PENJEPIT KERTAS\r\n\r\nSpesifikasi:\r\n1. Paper clip untuk menjepit kertas\r\n2. Merk Joyko\r\n3. Harga tertera adalah harga 1 dus kecil\r\n\r\n** Happy Shopping **', 40, 2000, 'Paper Clip', 'PC-3', '25mm', '2024-10-26 10:45:51', '2024-10-31 12:40:14'),
(100, 2, 7, 'Folder One | Map Plastik F4', '17299396649.png', 'MAP PLASTIK F4\r\n\r\nSpesifikasi:\r\n1. Map plastik bening berukuran folio\r\n2. Tersedia 4 Macam Warna\r\n3. Pembelian 1 pack isi 12 pcs\r\n4. Merk Folder One\r\n5. Harga tertera  adalah harga per pcs\r\n\r\n** Happy Shopping **', 40, 3000, 'Map Plastik F4', 'MP-12', 'Merah, Kuning,Hijau, Biru', '2024-10-26 10:47:44', '2024-10-31 12:40:33'),
(101, 2, 7, 'Gunting Joyko SC-828 | Gunting Kecil', '17299397546.png', 'GUNTING JOYKO SC-828\r\n\r\nSpesifikasi:\r\n1. Gunting tajam , berkualitas dan tidak mudah berkarat\r\n2. Harga diatas adalah harga per pcs\r\n3. Ukuran : P 12cm x L 6,5cm\r\n4. Material stainless stell\r\n\r\n** Happy Shopping **', 50, 7000, 'Gunting 828 Joyko', 'GT-JYK-828', '-', '2024-10-26 10:49:14', '2024-10-31 12:40:46'),
(102, 2, 7, 'Isi Steples | No 10', '17299398162.png', 'ISI STEPLES NO 10\r\n\r\nSpesifikasi:\r\n1. Refill stepler No 10\r\n2. Merk Kenko\r\n3. Biasa digunakan untuk stapler HD 10\r\n4. Harga tertera adalah harga per 1 dus kecil\r\n\r\n** Happy Shopping **', 35, 3000, 'Isi Steples No 10', 'ISP-10', '-', '2024-10-26 10:50:16', '2024-10-31 12:41:00'),
(103, 2, 7, 'Binder Clip No 111 | Isi 12 pcs', '17299399057.png', 'BINDER CLIP NO 111 ISI 12 PCS\r\n\r\nSpesifikasi:\r\n1. Merk Joyko \r\n2. Biasa digunakan penjepit kertas \r\n3. 1 dus isi 12 pcs\r\n4. Harga tertera adalah harga per dus\r\n\r\n** Happy Shopping **', 60, 15000, 'Binder Clip No 111', 'BC-111', 'Kecil', '2024-10-26 10:51:45', '2024-10-31 12:41:16'),
(104, 2, 7, 'Lem Stick | Glue Stick Kenko 8gr', '17299399916.png', 'LEM STICK KENKO \r\n\r\nSpesifikasi:\r\n1. Lem sangat mudah digunakan \r\n2. Cocok untuk merekatkan kertas, foto, dan bahan lainnya\r\n3. Kecil dan praktis untuk dibawa kemana saja \r\n4. Harga tertera adalah harga per pcs\r\n\r\n** Happy Shopping **', 60, 2500, 'Lem Stick Kenko', 'LS-KN-8', 'P 8cm x D 2cm', '2024-10-26 10:53:11', '2024-10-31 12:41:31'),
(105, 2, 7, 'Map Coklat Tali', '17299509756.png', 'MAP COKLAT TALI \r\n\r\nSpesifikasi:\r\n1. Amplop coklat bertali \r\n2. Harga diatas adalah harga per-pcs\r\n3. Varian coklat polos dengan garis pada tepian \r\n\r\n** Happy Shopping **', 10, 2000, 'Map Coklat Tali', 'MCT-001', '19.5cm X 27.5cm(Folio)', '2024-10-26 13:56:15', '2024-10-31 12:41:45'),
(106, 2, 7, 'Map Plastik Resleting | Folio Zipper Bag', '17299510461.png', 'MAP PLASTIK RESLETING \r\n\r\nSpesifikasi:\r\n1. Terdapat 4 pilihan warna \r\n2. Cocok digunakan untuk penyimpanan dokumen \r\n3. Ukuran : 39cm x 27cm x 3 cm\r\n4. Terdapat jaring pemisah didalam map yang bisa muat lebih banyak dan luas\r\n\r\n** Happy Shopping **', 175, 10000, 'Map Plastik Resleting', 'MPR-001', 'Merah(F4), Kuning(F4),Hijau(F4), Biru(F4)', '2024-10-26 13:57:26', '2024-10-31 12:41:57'),
(107, 2, 7, 'Inter Bussines File F4 Folio | 1 pcs', '17299511999.png', 'INTER BUSSINES FILE F4\r\n\r\nSpesifikasi:\r\n1. Produk tanpa pocket berbahan plastik lentur\r\n2. Ukuran produk 34cm x 23,5cm\r\n3. Terdapat 7 pilihan warna \r\n4. Harga tertera harga per-pcs\r\n5. Penggunaan penyimpanan kertas ukuran folio dengan kapasitas +-50lembar\r\n\r\n** Happy Shopping **', 50, 3000, 'Inter Bussines File F4', 'IBF-F4', 'Merah, Kuning,Hijau, Abu-Abu, Biru, Putih, Ungu', '2024-10-26 13:59:59', '2024-10-31 12:42:11'),
(108, 2, 7, 'Lakban 90yard | Bening Coklat | Lebar 2 inch', '17299513506.png', 'LAKBAN 90 YARD \r\n\r\nSpesifikasi:\r\n1. Terdapat 2 pilihan warna yaitu coklat dan bening \r\n2. Produk berkualitas, aman, dan daya rekat yang kuat \r\n3. Harga tertera harga per-pcs\r\n\r\n** Happy Shopping **', 170, 6000, 'Lakban 90yard', 'LK90-BN-CKT', 'Bening, Coklat', '2024-10-26 14:02:30', '2024-10-31 12:42:22'),
(109, 2, 7, 'Staples Hd 10 | Tokyo Design | Original', '17299514344.png', 'STAPLES HD 10 TOKYO DESIGN \r\n\r\nSpesifikasi:\r\n1. Staples gede model HD 10ML\r\n2. Produk terbuat dari plastik dan besi sehingga kokok, tahan lama, dan awet\r\n3. Terdapat 6 pilihan warna. dikirim random sesuai stok toko\r\n4. Produk simple dan mudah digunakan\r\n\r\n** Happy Shopping **', 150, 15000, 'Staples Hd 10 Tokyo Design', 'SH10-TD', '9cmx 4.2cm', '2024-10-26 14:03:54', '2024-10-31 12:43:04'),
(110, 2, 7, 'Nota Kontan Paperline | 2 Ply', '17299515602.png', 'NOTA KONTAN PAPERLINE - 2 PLY\r\n\r\nSpesifikasi:\r\n1. Produk merk paperline \r\n2. Terdiri dari 2 ply sehingga mudah penggunaan\r\n3. Terbuat dari bhan HVS & NCR\r\n4. Isi 25set(50lembar)\r\n5. Harga tertera adalah harga per-pcs\r\n\r\n** Happy Shopping **', 130, 5000, 'Nota Paperline,2ply', 'NKP-2', '16cm x 21 cm', '2024-10-26 14:06:00', '2024-10-31 12:43:26'),
(111, 2, 7, 'Kwitansi Besar  | Paperline 1 ply | 40sheet', '17299516468.png', 'KWITANSI PAPERLINE ISI 40SHEET\r\n\r\nSpesifikasi :\r\n1. Produk merk paperline\r\n2. Produk tipe ukuran 31.5cm x 10.1cm\r\n3. Warna kertas hijau putih\r\n4. Harga tertera adalah harga per-pcs\r\n5. Kwitansi berisi 40sheet\r\n\r\n** Happy Shopping **', 140, 13000, 'Kwitansi,1ply,40sheet', 'KW1-40', '31.5cm x 10.1cm', '2024-10-26 14:07:26', '2024-10-31 12:44:00'),
(112, 2, 7, 'Gunting Besar | Kenko KS-848', '17301251445.png', 'GUNTING KENKO BESAR \r\n\r\nSpesifikasi:\r\n1. Tipe produk kenko ks-848\r\n2. Terbuat dari bahan stainless jadi awet dan tajam \r\n3. Harga tertera adalah harga per-pcs\r\n\r\n** Happy Shopping **', 165, 13000, 'Gunting Kenko 848', 'GB-KN848', 'Besar(20.5cm x 7.6cm)', '2024-10-26 14:08:52', '2024-10-31 12:44:28'),
(113, 2, 7, 'Isolasi Kecil | Nachi | Bening Transparan', '17299518078.png', 'ISOLASI KECIL \r\n\r\nSpesifikasi:\r\n1. Produk berwarna bening transparan \r\n2. Produk merk nachi \r\n3. Harga tertera adalah harga per-pcs\r\n\r\n** Happy Shopping **', 10, 2000, 'Isolasi Kecil Nachi', 'ISK-NH', '25yard(1/2\")', '2024-10-26 14:10:07', '2024-10-31 12:44:42'),
(114, 2, 7, 'Map Tenteng Kancing | Jaring Berkantong | Tipe 2 Kancing', '17299518938.png', 'MAP TENTENG BERKANCING 2\r\n\r\nSpesifikasi:\r\n1. Produk merk folder one\r\n2. Map terdiri 2 kancing kanan kiri \r\n3. Terdapat 4 pilihan warna.\r\n4. Produk berkualitas dan mudah dibawa\r\n\r\n** Happy Shopping **', 110, 13000, 'Map Tenteng 2 Kancing', 'MTK-2', 'Merah, Kuning,Hijau, Biru', '2024-10-26 14:11:33', '2024-10-31 12:44:57'),
(115, 3, 8, 'Buku Yasin 176 Halaman | Cover Bludru | Isi Glossy', '17301263855.png', 'BUKU YASIN BLUDRU\r\n\r\nSpesifikasi :\r\n1. Sampul produk bludru tebal \r\n2. Isi halaman 176\r\n3. Kertas isi glossy\r\n4. Terdapat pita pemisah \r\n5. Minimal order 10pcs\r\n6. Harga tertera adalah harga per pcs\r\n\r\n** Happy Shopping **', 150, 20000, 'Buku Yasin Bludru,176H', 'BY-BL-176', '16cm x 12 cm', '2024-10-26 14:14:13', '2024-10-31 12:45:14'),
(116, 3, 8, 'Buku Yasin 176 Halaman | Cover RCP | Isi Glossy', '17301267487.png', 'BUKU YASIN COVER BAHAN RCP \r\n\r\nSpesifikasi : \r\n1. Sampul produk halusan bahan rcp\r\n2. Isi halaman 176 \r\n3. Kertas isi glossy \r\n4. Terdapat pita pemisah\r\n 5. Minimal order 10pcs\r\n6. Harga tertera adalah harga per pcs\r\n\r\n** Happy Shopping **', 150, 18000, 'Buku Yasin RCP,176H', 'BY-RCP-176', '16cm x 12 cm', '2024-10-26 14:15:54', '2024-10-31 12:47:06'),
(117, 3, 8, 'Nota Costum 1 ply | Nota 50 Lembar | Potrait/Landscape | 1/4 Folio', '17299523221.png', 'NOTA COSTUM 50 LEMBAR \r\n\r\nSpesifikasi:\r\n1. Nota costum isi 50 lembar 1 ply\r\n2. Ukuran nota 1/4 Folio\r\n3. Bisa request bentuk potrait/landscape\r\n4. Jika sudah punya desain bisa di unggah langsung\r\n5. Bahan kertas hvs\r\n6. Harga tertera adalah harga per pcs\r\n\r\n** Happy Shopping **', 200, 7000, 'Nota 1ply,50lembar,1/4F', 'NT1-50-1/4F', '10cm x 16cm', '2024-10-26 14:18:42', '2024-10-31 12:47:26'),
(118, 3, 8, 'Nota Costum 1ply | Nota 50 Lembar | Potrait/Landscape | 1/6 Folio', '17299524755.png', 'NOTA COSTUM 50 LEMBAR \r\nSpesifikasi: \r\n1. Nota costum isi 50 lembar 1 ply \r\n2. Ukuran nota 1/6 Folio \r\n3. Bisa request bentuk potrait/landscape \r\n4. Jika sudah punya desain bisa di unggah langsung \r\n5. Bahan kertas hvs\r\n6. Harga tertera adalah harga per pcs \r\n\r\n** Happy Shopping **', 75, 6000, 'Nota 1ply,50lembar,1/6F', 'NT1-50-1/6F', '10cm x 11cm', '2024-10-26 14:21:15', '2024-10-31 12:47:35'),
(119, 3, 8, 'Nota Costum 2 ply | Nota 50 Lembar | Potrait/Landscape | 1/4 Folio |', '17299526079.png', 'NOTA COSTUM 50 LEMBAR \r\n\r\nSpesifikasi: \r\n1. Nota costum isi 50 lembar 2 ply \r\n2. Ukuran nota 1/4 Folio \r\n3. Bisa request bentuk potrait/landscape \r\n4. Jika sudah punya desain bisa di unggah langsung \r\n5. Bahan kertas hvs\r\n6. Harga tertera adalah harga per pcs\r\n\r\n** Happy Shopping **', 1, 7500, 'Nota 2ply,50lembar,1/4F', 'NT2-50-1/4F', '10cm x 16cm', '2024-10-26 14:23:27', '2024-10-30 08:38:30'),
(120, 3, 8, 'Nota Costum 2ply | Nota 50 Lembar | Potrait/Landscape | 1/6 Folio', '17299526644.png', 'NOTA COSTUM 50 LEMBAR \r\n\r\nSpesifikasi: \r\n1. Nota costum isi 50 lembar 2ply \r\n2. Ukuran nota 1/4 Folio \r\n3. Bisa request bentuk potrait/landscape \r\n4. Jika sudah punya desain bisa di unggah langsung \r\n5. Bahan kertas NCR 55gr sehingga bisa tembus kebawah saat penulisan\r\n6. Harga tertera adalah harga per pcs\r\n\r\n** Happy Shopping **', 1, 6500, 'Nota 2 ply,50lembar,1/6F', 'NT2-50-1/6F', '10cm x 11cm', '2024-10-26 14:24:24', '2024-10-30 08:38:11'),
(121, 3, 8, 'Nota Costum 1 ply | Nota 100 Lembar | Potrait/Landscape | 1/4 Folio', '17299528351.png', 'NOTA COSTUM 100 LEMBAR \r\n\r\nSpesifikasi: \r\n1. Nota costum isi 100 lembar 1 ply \r\n2. Ukuran nota 1/4 Folio \r\n3. Bisa request bentuk potrait/landscape \r\n4. Jika sudah punya desain bisa di unggah langsung \r\n5. Bahan kertas hvs\r\n6. Harga tertera adalah harga per pcs\r\n\r\n** Happy Shopping **', 1, 14000, 'Nota 1ply,100lembar,1/4F', 'NT1-100-1/4F', '10cm x 16cm', '2024-10-26 14:26:57', '2024-10-30 08:37:54'),
(122, 3, 8, 'Nota Costum 1 ply | Nota 100 Lembar | Potrait/Landscape | 1/6Folio', '17299529342.png', 'NOTA COSTUM 100 LEMBAR \r\n\r\nSpesifikasi: \r\n1. Nota costum isi 100 lembar 1 ply \r\n2. Ukuran nota 1/6 Folio \r\n3. Bisa request bentuk potrait/landscape \r\n4. Jika sudah punya desain bisa di unggah langsung \r\n5. Bahan kertas hvs\r\n6. Harga tertera adalah harga per pcs\r\n\r\n** Happy Shopping **', 1, 12000, 'Nota 1ply,100lembar,1/6F', 'NT1-100-1/6F', '10cm x 11cm', '2024-10-26 14:28:54', '2024-10-30 08:37:31'),
(123, 3, 8, 'Nota Costum 2 ply | Nota 100 Lembar | Potrait/Landscape | 1/4Folio', '17299529789.png', 'NOTA COSTUM 100 LEMBAR \r\n\r\nSpesifikasi: \r\n1. Nota costum isi 100 lembar 2 ply \r\n2. Ukuran nota 1/4 Folio \r\n3. Bisa request bentuk potrait/landscape \r\n4. Jika sudah punya desain bisa di unggah langsung \r\n5. Bahan kertas NCR 55gr sehingga bisa tembuh kebawah saat penulisan\r\n6. Harga tertera adalah harga per pcs\r\n\r\n** Happy Shopping **', 1, 15000, 'Nota 2ply,100lembar,1/4F', 'NT2-100-1/4F', '10cm x 16cm', '2024-10-26 14:29:38', '2024-10-30 08:37:13'),
(124, 3, 8, 'Nota Costum 2 ply | Nota 100 Lembar | Potrait/Landscape | 1/6Folio', '17299530188.png', 'NOTA COSTUM 100 LEMBAR  \r\n\r\nSpesifikasi: \r\n1. Nota costum isi 100 lembar 2 ply \r\n2. Ukuran nota 1/6 Folio \r\n3. Bisa request bentuk potrait/landscape \r\n4. Jika sudah punya desain bisa di unggah langsung \r\n5. Bahan kertas NCR 55gr sehingga bisa tembuh kebawah saat penulisan\r\n6. Harga tertera adalah adalah harga pcs\r\n\r\n** Happy Shopping **', 1, 13000, 'Nota 2ply,100lembar,1/6F', 'NT2-100-1/6F', '10cm x 11cm', '2024-10-26 14:30:18', '2024-10-30 08:36:57'),
(125, 3, 8, 'Kalender Meja Duduk | Potrait/Landscape | Ukuran A5', '17299531386.png', 'KALENDER MEJA DUDUK A5\r\n\r\nSpesifikasi:\r\n1. Produk berbahan kualitas yaitu Art Carton 260GSM\r\n2. Produk berisi 1 cover dan kalender 12 bulan \r\n3. Finishing menggunakan spiral sebagai pengait \r\n4. Cetak full color\r\n5. Bisa request potrait/landscape cantumkan pada catatan\r\n6. Harga tertera adalah harga per pcs\r\n\r\n** Happy Shopping **', 350, 42000, 'Kalender Meja, A5', 'KM-A5', 'A5(21cm x 14.8cm)', '2024-10-26 14:32:18', '2024-10-31 12:47:58'),
(126, 3, 8, 'Cetak Kartu Nama | Free box | Isi 100pcs | 1 sisi', '17299532428.png', 'CETAK KARTU NAMA 1 SISI \r\n\r\nSpesifikasi:\r\n1. Kartu nama berbahan dasar Art Carton 260gsm\r\n2. Finishing menggunakan laminating glossy \r\n3. Ukuran tertera adalah ukuran standart\r\n4. Pembelian min 100 pcs dan free box\r\n5. Produk cetak 1 sisi depan saja belakang polos mengikuti warna\r\n6. Harga tertera adalah harga per pcs\r\n\r\n** Happy Shopping **', 185, 36000, 'Kartu Nama, 1Sisi', 'KN-1S', '9cmx5.5cm', '2024-10-26 14:34:02', '2024-10-31 12:48:15'),
(127, 3, 8, 'Cetak Kartu Nama | Free box | Isi 100pcs | 2 sisi', '17299532935.png', 'CETAK KARTU NAMA 1 SISI \r\n\r\nSpesifikasi:\r\n1. Kartu nama berbahan dasar Art Carton 260gsm\r\n2. Finishing menggunakan laminating glossy \r\n3. Ukuran tertera adalah ukuran standart\r\n4. Pembelian min 100 pcs dan free box\r\n5. Produk cetak 2 sisi depan belakang\r\n6. Harga tertera adalah harga 100pcs\r\n\r\n** Happy Shopping **', 185, 71000, 'Kartu Nama, 2Sisi', 'KN-2S', '9cmx5.5cm', '2024-10-26 14:34:53', '2024-10-31 12:48:27'),
(128, 3, 8, 'Notebook Costum A5 | Spiral Block Note | 50 Lembar(100 halaman)', '17299534476.png', 'NOTEBOOK COSTUM A5\r\n\r\nSpesifikasi:\r\n1. Produk berbahan dasar art carton 260gsm\r\n2. Bagian cover polos . Pilihan coklat dan hitam. cantumkan pada catatan \r\n3. Produk Isi 50lembar = 100halaman, \r\n4. Proses finishing menggunakan spiral putih\r\n5. Ukuran produk A5\r\n6. Harga tertera adalah harga per pcs \r\n\r\n** Happy Shopping **', 150, 15000, 'Notebook 50, A5, Spiral', 'NB-50-A5', '21cmx15cm(Kertas Polos), 21cmx15cm(Kertas Bergaris)', '2024-10-26 14:37:27', '2024-10-31 12:48:41'),
(129, 3, 8, 'Notebook Costum A5 | Spiral Block Note | 100 Lembar(200 halaman)', '17299535144.png', 'NOTEBOOK COSTUM A5\r\n\r\nSpesifikasi:\r\n1. Produk berbahan dasar art carton 260gsm\r\n2. Bagian cover polos . Pilihan coklat dan hitam. cantumkan pada catatan \r\n3. Produk Isi 100lembar = 200halaman\r\n4. Proses finishing menggunakan spiral putih\r\n5. Ukuran produk A5\r\n6. Harga tertera adalah harga per pcs\r\n\r\n** Happy Shopping **', 260, 30000, 'Notebook 100, A5, Spiral', 'NB-100-A5', '21cmx15cm(Kertas Polos), 21cmx15cm(Kertas Bergaris)', '2024-10-26 14:38:34', '2024-10-31 12:48:54'),
(130, 3, 8, 'Note Pocket Spiral Small | Notebook Mini | Isi 50 Lembar(100 halaman) | Buku Agenda', '17299536308.png', 'CETAK NOTEBOOK MINI / BUKU AGENDA\r\n\r\nSpesifikasi:\r\n1. Produk berbahan dasar art carton 260gsm\r\n2. Bagian cover bisa costum design\r\n3. Produk Isi 50lembar atau 100 halaman\r\n4. Proses finishing menggunakan spiral putih\r\n5. Ukuran produk B7\r\n6. Harga tertera adalah harga per pcs\r\n7. Terdapat 2 pilihan kertas dibagian dalam yaitu kertas polos dan kertas bergaris\r\n\r\n** Happy Shopping **', 1, 6000, 'Note Spiral, 50, B7', 'NS-50-B7', '9cmx12cm(Kertas Polos), 9cmx12cm(Kertas Bergaris),', '2024-10-26 14:40:30', '2024-10-30 08:57:41'),
(131, 4, 9, 'Pensil Faber Castel | 2B Castell | Pensil Ujian', '17299537046.png', 'PENSIL FABER CASTELL 2B\r\n\r\nSpesifikasi:\r\n1. Merk faber castell\r\n2. Warna hitam 2b\r\n3. 1 pack isi 12 pcs\r\n4. Kualitas terbaik dan dapat dibaca\r\n5. Harga tertera adalah harga per pcs\r\n\r\n** Happy Shopping **', 18, 4000, 'Pensil,Faber Castel', 'PS-FC', 'Leads 2.5mm', '2024-10-26 14:41:44', '2024-10-31 12:58:24'),
(132, 4, 9, 'Bolpoin Joyko Jk-100 | Bolpoin Gel | Ketebalan 0.5mm', '17299538232.png', 'BOLPOIN JOYKO JK-100\r\n\r\nSpesifikasi :\r\n1. Produk tipe joyko jk-100\r\n2. Tinta warna hitam \r\n3. Harga tertera adalah harga per pcs\r\n4. Ketebalan 0.5mm\r\n5. 1pack isi 12 pcs\r\n\r\n** Happy Shopping **', 20, 2000, 'Bolpoin Joyko Jk-100', 'BP-JY100', 'Standart (P 15.1cm x D 1cm )', '2024-10-26 14:43:43', '2024-10-31 12:58:38'),
(133, 4, 9, 'Spidol Permanent Snowman | Snowman Marker | AG 12 Snowman', '17299538965.png', 'SPIDOL SNOWMAN PERMANENT\r\n\r\nSpesifikasi:\r\n1. Type produk  AG12\r\n2. Harga tertera adalah harga per pcs\r\n3. Terdapat 3 pilihan warna yaitu hitam, merah, biru\r\n4. Cantumkan pilihan warna pada catatan atau dikirim random \r\n5. 1 pack isi 12 pcs\r\n\r\n** Happy Shopping **', 20, 5000, 'Spidol Snowman Permanent', 'SS-PM', 'Standart', '2024-10-26 14:44:56', '2024-10-31 12:58:57'),
(134, 4, 9, 'Spidol Non Permanent Snowman | Snowman Marker | ABG 12 Snowman', '17299539444.png', 'SPIDOL SNOWMAN NON PERMANENT\r\n\r\nSpesifikasi: \r\n1. Type produk ABG12 \r\n2. Harga tertera adalah harga per pcs \r\n3. Terdapat 3 pilihan warna yaitu hitam, merah, biru \r\n4. Cantumkan pilihan warna pada catatan atau dikirim random \r\n5. 1 pack isi 12 pcs\r\n\r\n** Happy Shopping **', 20, 6000, 'Spidol Snowman Non Permanent', 'SS-NPM', 'Standart', '2024-10-26 14:45:44', '2024-10-31 12:59:04'),
(135, 4, 9, 'Spidol Kecil Artline | Spidol Marker Pensil', '17299543132.png', 'SPIDOL KECIL ARTLINE SNOWMAN \r\n\r\nSpesifikasi :\r\n1. Produk berkualitas dan tinta pekat \r\n2. Harga tertera adalah harga per pcs\r\n3. Terdapat 3 pilihan warna yaitu hitam, merah, biru. Silahkan cantumkan pada catatan \r\n4. Isi 1 pack adalah 12pcs\r\n\r\n** Happy Shopping **', 11, 1000, 'Spidol Kecil Snowman', 'SPK-SN', 'Kecil', '2024-10-26 14:51:53', '2024-10-31 12:59:18'),
(136, 4, 9, 'Penggaris 30cm | Penggaris Butterfly | Mika Glass Ruller', '17299544052.png', 'PENGGARIS BUTTERFLY UKURAN 30 CM\r\n\r\nSpesifikasi:\r\n1. Produk merk butterfly\r\n2. Produk ukuran 30cm\r\n3. Bahan plastik mika \r\n4. Harga tertera adalah harga per pcs\r\n5. 1 Pack isi 12 pcs\r\n\r\n** Happy Shopping **', 250, 2000, 'Penggaris 30cm Butterfly', 'PG-30BT', '30cm', '2024-10-26 14:53:25', '2024-10-31 12:59:32'),
(137, 4, 9, 'Penghapus Joyko 526 B40P | Putih Kecil', '17299544696.png', 'PENGHAPUS JOYKO 526 B40P \r\n\r\nSpesifikasi:\r\n1. Produk berwarna putih \r\n2. Produk merk joyko \r\n3. Harga tertera adalah harga per pcs\r\n4. 1 Pack isi 40pcs\r\n5. Penghapus berkualitas dan bersih\r\n\r\n** Happy Shopping **', 45, 1000, 'Penghapus Joyko 526, Putih', 'PG-JY526', 'Kecil', '2024-10-26 14:54:29', '2024-10-31 12:59:46'),
(138, 4, 9, 'Penghapus Faber Castel | Warna Putih', '17299545879.png', 'PENGHAPUS FABER CASTEL\r\n\r\nSpesifikasi :\r\n1. Produk bermerk faber castel\r\n2. Penghapus warna putih \r\n3. 1 Pack isi 12pcs\r\n4. Harga tertera adalah harga per pcs\r\n5. Produk berkualitas dan bersih\r\n\r\n** Happy Shopping **', 10, 2000, 'Penghapus Faber Castel', 'PH-FC', '3.3cm x 1cm x 1.3cm', '2024-10-26 14:56:27', '2024-10-31 12:59:58'),
(139, 4, 9, 'Tipe-x Cair Kenko | Kenko 108 Mini', '17299548328.png', 'TIPE -X CAIR KENKO MINI \r\n\r\nSpesifikasi :\r\n1. Produk berukuran mini dan praktis \r\n2. Mudah digunakan dan praktis dibawa kemana saja \r\n3, Cepat kering saat digunakan \r\n4. Harga tertera adalah harga per-pcs\r\n\r\n** Happy Shopping **', 22, 4000, 'Tipe-x Kenko Mini', 'TPK-M', 'Mini', '2024-10-26 15:00:32', '2024-10-31 13:00:12'),
(141, 4, 9, 'Buku Tulis Sinar Dunia | Isi 38 lembar', '17299549868.png', 'BUKU TULIS ISI 38 LEMBAR \r\n\r\nSpesifikasi:\r\n1. Buku merk sinar dunia isi 38 lembar \r\n2. Produk berkualitas dan halus\r\n3. Harga tertera adalah harga per pcs\r\n4. 1 Pack isi 10 pcs\r\n\r\n** Happy Shopping **', 88, 4000, 'Buku Tulis,Sinar Dunia ,38 lembar,', 'BT-38', '21cm X 16cm', '2024-10-26 15:03:06', '2024-10-31 13:00:29'),
(142, 4, 9, 'Buku Tulis Sinar Dunia | Isi 58 lembar | 1 Pack Isi 10 buku', '17299550457.png', 'BUKU TULIS ISI 58 LEMBAR \r\n\r\nSpesifikasi:\r\n1. Buku merk sinar dunia isi 58 lembar \r\n2. Produk dengan kertas tebal, halus dan berkualitas \r\n3. Harga tertera adalah harga per pack \r\n4. Tinta tidak mudah tembus belakang\r\n5. 1 Pack isi 10 pcs\r\n\r\n** Happy Shopping **', 130, 6000, 'Buku Tulis,Sinar Dunia,58 lembar,', 'BT-58', '21cm X 16cm', '2024-10-26 15:04:05', '2024-10-31 13:00:42'),
(143, 4, 9, 'Buku Tulis Campus | Isi 50 lembar', '17299551183.png', 'BUKU TULIS CAMPUS ISI 50 LEMBAR \r\n\r\nSpesifikasi:\r\n1. Produk buku tulis merk campus \r\n2, Isi buku 50 lembar dengan ukuran lebih panjang\r\n3. Ukuran standart, cover bagus dan tidak mudah robek\r\n4. Harga tertera adalah harga per pack\r\n5. 1 pack isi 10 buku\r\n\r\n** Happy Shopping **', 195, 7000, 'Buku Tulis Campus,50 lembar', 'BTC-58', '25cm x 18cm', '2024-10-26 15:05:18', '2024-10-31 13:00:55'),
(145, 4, 9, 'Pensil Warna Faber Castel | Isi 12 pcs |  Faber Castell Classic 12 pcs', '17299552386.png', 'PENSIL WARNA FABER CASTELL ISI 12 PCS\r\n\r\nSpesifikasi:\r\n1. Produk merk faber castel isi 12 pcs\r\n2. Warna nya cerah dan banyak varian \r\n3. Produk ukuran lebih panjang dan tidak mudah patah\r\n4. Harga tertera adalah harga per set isi 12 pcs\r\n5. Sangat mudah digunakan dan praktis dibawa kemana saja\r\n\r\n** Happy Shopping **', 181, 30000, 'Pensil Warna Faber Castell,12 pcs', 'PW-FB12', 'Panjang', '2024-10-26 15:07:18', '2024-10-31 13:01:28'),
(146, 4, 9, 'Buku Gambar A4 | Merk Sinar Dunia | Isi Lembar', '17299553128.png', 'BUKU GAMBAR A4\r\n\r\nSpesifikasi :\r\n1. Buku gambar merk sinar dunia\r\n2. Produk ukuran A4\r\n3. Kertas bersih dan berkualitas \r\n4. 1 Pack isi 5 pcs\r\n5. Harga tertera adalah harga per pcs\r\n\r\n** Happy Shopping **', 250, 7000, 'Buku Gambar, A4', 'BG-A4', 'A4', '2024-10-26 15:08:32', '2024-10-31 13:01:47'),
(147, 4, 9, 'Amplop Putih Polos | Merk Paperline Tipe 90', '17299553682.png', 'AMPLOP PUTIH PAPERLINE 90\r\n\r\nSpesifikasi:\r\n1. Produk merk paperline tipe 90\r\n2. Amplop berwarna putih polos \r\n3. 1 pack isi 100 lembar \r\n4. Harga tertera adalah harga per pcs \r\n5. Produk sangat berkualitas dan tidak mudah sobek\r\n\r\n** Happy Shopping **', 5, 1000, 'Amplop Putih Paperline 90', 'AP-PP104', 'P 11cmx L 23mm', '2024-10-26 15:09:28', '2024-10-31 13:06:44'),
(148, 4, 9, 'Memo Stick | Sticky Note | Memo Tempel Joyko Tipe MMS-2', '17299554447.png', 'MEMO STICK JOYKO TIPE MMS-2\r\n\r\nSpesifikasi :\r\n1. Memo stick berbahan kertas \r\n2. Isi 100 sheet per warna \r\n3. 1 Plastik memo stick berisi 4 warna \r\n4. Harga tertera adalah harga per pcs\r\n5. Produk berkualitas dan mudah direkatkan saat penggunaan\r\n\r\n** Happy Shopping **', 75, 7000, 'Memo Stick Joyko Tipe MMS-2', 'MS-JMMS2', '75mm x 18.75mm', '2024-10-26 15:10:44', '2024-10-31 13:06:56'),
(149, 4, 9, 'Pembatas Buku | Merk Joyko Tipe IM-32 | Isi 7 Warna', '17299555235.png', 'PEMBATAS BUKU JOKYO TIPE IM-32\r\n\r\nSpesifikasi:\r\n1. Produk berbahan dasar kertas \r\n2. Sangat mudah digunakan dan direkatkan\r\n3. Terdiri dari 7 warna dalam 1 plastik \r\n4. Isi 25 lembar setiap sheet \r\n5. Harga tertera adalah harga per plastik\r\n\r\n** Happy Shopping **', 25, 5000, 'Pembatas Buku Joyko Tipe IM-32', 'PB-JIM-32', '4.5cm x 1.2cm', '2024-10-26 15:12:03', '2024-10-31 13:07:15'),
(150, 4, 9, 'Penggaris Segitiga Butterfly | Tipe No 12 | Isi 2 Pcs', '17299555943.png', 'PENGGARIS SEGITIGA BUTTERFLY TIPE 12\r\n\r\nSpesifikasi:\r\n1. Produk merk butterfly tipe 12\r\n2. Penggaris berbahan dasar plastik \r\n3. Terdapar 2 pcs dalam 1 plastik \r\n4. Harga tertera adalah harga per plastik \r\n5. Produk berkualitas, tidak mudah patah, dan praktis dibawa kemana saja\r\n\r\n** Happy Shopping **', 140, 20000, 'Penggaris Segitiga Butterfly Tipe 12', 'PSB-T12', '2 Ukuran', '2024-10-26 15:13:14', '2024-10-31 13:07:30'),
(151, 4, 9, 'Bolpoin Standart C 88 | Isi 12 Pcs/Pack', '17299557426.png', 'BOLPOIN STANDART C88\r\n\r\nSpesifikasi:\r\n1. Bolpoin merk standar tipe c-88\r\n2. Produk berkualitas, tinta hitam pekat dan jelas \r\n3. 1 Pack isi 12 pcs + 1 bonus \r\n4. Harga tertera adalah harga per pcs\r\n5. Bolpoin adalah warna hitam\r\n\r\n** Happy Shopping **', 15, 2000, 'Bolpoin Standar C-88', 'BP-C88', 'Sedang', '2024-10-26 15:15:42', '2024-10-31 13:07:42'),
(152, 4, 9, 'Pensil Mekanik Joyko | Tipe MP-01', '17299558358.png', 'PENSIL MEKANIK JOYKO TIPE MP-01\r\n\r\nSpesifikasi:\r\n1. Pensil mekanik merk joyko tipe Mp-01\r\n2. Pensil dengan ukuran panjang 14.2 cm dan diameter 0.8cm \r\n3. Biasanya pensil menggunakan isi ukuran 0.5mm\r\n4. Dilengkapi penghapus pada ujung atas pensil \r\n5. Harga tertera adalah harga per pcs\r\n\r\n** Happy Shopping **', 18, 2500, 'Pensil Mekanik Joyko, Tipe MP-01', 'PMJ-MP01', 'P 14.2cm', '2024-10-26 15:17:15', '2024-10-31 13:07:55'),
(153, 4, 9, 'Isi Pensil Mekanik | Merk Joyko 0.5mm', '17299558938.png', 'ISI PENSIL MEKANIK JOYKO 0.5MM\r\n\r\nSpesifikasi:\r\n1. Produk merk joyko \r\n2. Ketebalan pensil 0.5mm\r\n3. Isi pensil berjumlah 12 tubes\r\n4. Isi pensil kuat dan tidak mudah patah\r\n\r\n** Happy Shopping **', 10, 1500, 'Isi Pensil Mekanik Joyko 0.5mm', 'IPM-J0.5', 'P 6cm x D 0.5mm', '2024-10-26 15:18:13', '2024-10-31 13:08:08'),
(154, 1, 1, 'X Banner 2 | Cetak X-Banner Stand | Flexy Korea 380gsm', '17300698677.png', 'CETAK X-Banner\r\nSpesifikasi \r\n1. Bahan Flexy Korea 380gsm(Penggunaan Outdoor)\r\n2.Ukuran Khusus 60cmx160cm\r\n3.Stand Rangka X-Banner Premium\r\n\r\nProses Pengerjaan:\r\n1. Jika sudah memiliki desain dan siap cetak, akan diproses di hari saat orderan masuk.\r\n2. Jika belum memiliki desain. Ada jasa pengerjaan desain dan produk di kirim 2-3hari\r\n\r\n** Enjoy Your Shopping **', 1000, 67000, 'X-banner,Flexy Korea 380gsm,60x160', 'RB-011', '60cm x 160cm', '2024-10-27 22:57:47', '2024-10-31 13:08:24');
INSERT INTO `products` (`id`, `id_kategori`, `id_subkategori`, `nama_produk`, `gambar`, `deskripsi`, `berat`, `harga`, `tags`, `sku`, `ukuran`, `created_at`, `updated_at`) VALUES
(155, 1, 1, 'X Banner 3 | Cetak X-Banner Stand | Albatros', '17300704031.png', 'CETAK X-Banner\r\nSpesifikasi \r\n1. Bahan Albatros(Penggunaan Indoor)\r\n2.Ukuran Khusus 80cmx180cm\r\n3.Stand Rangka X-Banner Premium\r\n\r\nProses Pengerjaan:\r\n1. Jika sudah memiliki desain dan siap cetak, akan diproses di hari saat orderan masuk.\r\n2. Jika belum memiliki desain. Ada jasa pengerjaan desain dan produk di kirim 2-3hari\r\n\r\n** Enjoy Your Shopping **', 1800, 104000, 'X-banner,Albatros,80x180', 'RB-012', '80cm x 180cm', '2024-10-27 23:06:43', '2024-10-31 13:08:42'),
(156, 1, 1, 'X Banner 4 | Cetak X-Banner Stand | Flexy Korea 380gsm', '17300704867.png', 'CETAK X-Banner\r\nSpesifikasi \r\n1. Bahan Flexy Korea 380gsm\r\n2.Ukuran Khusus 80cmx180cm\r\n3.Stand Rangka X-Banner Premium\r\n\r\nProses Pengerjaan:\r\n1. Jika sudah memiliki desain dan siap cetak, akan diproses di hari saat orderan masuk.\r\n2. Jika belum memiliki desain. Ada jasa pengerjaan desain dan produk di kirim 2-3hari\r\n\r\n** Enjoy Your Shopping **', 1800, 95000, 'X-banner,Flexy Korea 380gsm,80x180', 'RB-013', '80cm x 180cm', '2024-10-27 23:08:06', '2024-10-31 13:08:57'),
(157, 4, 9, 'Tipe-x kertas Joyko | Tipe-x Tape 12m', '17302801341.png', 'TIPE-X KERTAS JOYKO TAPE 12M \r\n\r\nSpesifikasi: \r\n1. Merk produk joyko tipe CT-522 \r\n2. Mudah kering saat penggunaan \r\n3. Harga tertera adalah harga per-pcs \r\n4. Murah, praktis, dan terjangkau \r\n\r\n** Happy Shopping **', 55, 5000, 'Tipe-x Kertas Joyko', 'TP-JK-12', 'Standar', '2024-10-30 09:22:14', '2024-10-31 13:09:11'),
(158, 4, 9, 'Pensil Warna Kenko | Isi 12 warna | Kenko CP-12', '17302802259.png', 'PENSIL WARNA KENKO ISI 12 PCS \r\n\r\nSpesifikasi: \r\n1.Produk merk kenko tipe Cp-12 \r\n2. Warna bagus dan terang \r\n3. Produk kuat dan tidak mudah patah \r\n4. Harga tertera adalah harga 1 set isi 12 pcs \r\n5. Ukuran mini sehingga mudah dibawa\r\n\r\n** Happy Shopping **', 44, 12000, 'Pensil Warna Kenko CP-12, Isi 12', 'PWK-CP12', 'Kecil', '2024-10-30 09:23:45', '2024-10-31 13:09:23'),
(159, 2, 7, 'Costum Stampel Otomatis | Free Design | Ukuran Sedang', '17302986102.png', 'COSTUM STAMPEL OTOMATIS \r\n\r\nSpesifikasi:\r\n1. Stampel bisa langsung digunakan tinggal cap saja\r\n2. Tidak perlu ada bantala cap tinta \r\n3. Tinta sangat pekat dan jelas \r\n4. Produk berkualitas dan praktis \r\n5. Harga tertera adalah harga per pcs\r\n6. Terdapat 3 pilihan warna tinta yaitu hitam, merah, dan ungu. Silahkan pilihan cantumkan pada catatan\r\n\r\n** Happy Shopping **', 80, 35000, 'Costum Stampel Otomatis', 'CSO-001', 'Kotak(22x55) , Bulat 40mm', '2024-10-30 14:30:10', '2024-10-31 13:09:36'),
(160, 4, 9, 'Kertas Karton Manila | Ukuran 61cm x 86cm | Beraneka Warna', '17303006357.png', 'KERTAS KARTON MANILA \r\n\r\nSpesifikasi:\r\n1. Ukuran kertas manila 61cm x 86cm\r\n2. Produk dibungkus plastik jadi tidak mudah kotor\r\n3. Harga tertera adalah harga per pcs\r\n4. Produk berkualitas dan cocok untuk kebutuhan anda \r\n\r\n** Happy Shopping **', 75, 5000, 'Kertas Karton Manila', 'KKM-001', 'Merah, Kuning,Hijau, Hitam ,Biru, Putih, Oren, Pink, Kuning Muda, Ungu', '2024-10-30 15:03:55', '2024-10-30 15:07:00'),
(161, 4, 9, 'Kertas Karton Buffalo | Ukuran A4 | High Quality dan Aneka Warna', '17303014987.png', 'KERTAS KARTON BUFFALO\r\n\r\nSpesifikasi:\r\n1. Motif kertas polos berwarna tidak ada corak \r\n2. Produk berukuran A4\r\n3. Harga tertera adalah harga per pcs\r\n4. Kertas lebih tebal dan tidak mudah robek \r\n5. Cocok digunakan untuk cover jilid buku \r\n6. Terdapat 7 pilihan warna\r\n\r\n** Happy Shopping **', 15, 2000, 'Kertas Karton Bufalo,A4', 'KKB-001', 'Merah, Hijau, Biru, Kuning, Putih, Pink, Sky Blue', '2024-10-30 15:18:18', '2024-10-31 13:09:50'),
(162, 4, 9, 'Kertas Karton Buffalo | Ukuran f4 | High Quality dan Aneka Warna', '17303015498.png', 'KERTAS KARTON BUFFALO\r\n\r\nSpesifikasi:\r\n1. Motif kertas polos berwarna tidak ada corak \r\n2. Produk berukuran F4\r\n3. Harga tertera adalah harga per pcs\r\n4. Kertas lebih tebal dan tidak mudah robek \r\n5. Cocok digunakan untuk cover jilid buku \r\n6. Terdapat 7 pilihan warna\r\n\r\n** Happy Shopping **', 15, 4000, 'Kertas Karton Bufalo,F4', 'KKB-002', 'Merah, Hijau, Biru, Kuning, Putih, Pink, Sky Blue', '2024-10-30 15:19:09', '2024-10-31 13:09:57');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
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
-- Table structure for table `sliders`
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
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `nama_slider`, `deskripsi`, `gambar`, `created_at`, `updated_at`) VALUES
(1, '\" Zahra Printing \"', 'Halo! Mari Cetak Sesuatu yang Istimewa dengan Layanan Digital Printing Terbaik', '17290673854.png', '2024-08-24 04:34:49', '2024-10-16 08:29:45'),
(2, 'Exclusive Products', '\" Temukan Kepuasan dalam Setiap Cetakan Anda \"', '17290672957.png', '2024-08-24 04:38:07', '2024-10-16 08:28:15'),
(3, 'Enjoy Online Shopping', 'Selamat Berkreasi dan Berbelanja Cetak Digital dengan Kemudahan', '17290673741.png', '2024-08-24 04:41:24', '2024-10-16 08:29:34');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
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
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `id_kategori`, `nama_subkategori`, `deskripsi`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 1, 'Roll Banner', 'Roll Banner', '17298661357.png', '2024-10-16 09:49:31', '2024-10-25 14:22:15'),
(2, 1, 'Sablon', 'Sablon', '17298661495.png', '2024-10-16 09:50:00', '2024-10-25 14:22:29'),
(3, 1, 'Spanduk & Banner', 'Spanduk dan Banner', '17298661646.png', '2024-10-16 09:50:21', '2024-10-25 14:22:44'),
(4, 1, 'Backdrop', 'Backdrop', '17298664383.png', '2024-10-16 09:50:49', '2024-10-25 14:27:18'),
(5, 1, 'Stiker', 'Stiker', '17298662046.png', '2024-10-16 09:51:38', '2024-10-25 14:23:24'),
(6, 1, 'Flayer Art', 'Flayer Art', '17298662152.png', '2024-10-16 09:52:07', '2024-10-25 14:23:35'),
(7, 2, 'Peralatan Kantor', 'Peralatan Kantor', '17298662295.png', '2024-10-16 09:52:42', '2024-10-25 14:23:49'),
(8, 3, 'Cetak Buku', 'Cetak Buku', '17298662422.png', '2024-10-16 09:53:00', '2024-10-25 14:24:02'),
(9, 4, 'Alat Tulis & Kertas', 'Alat Tulis dan Kertas', '17298662546.png', '2024-10-16 09:53:20', '2024-10-25 14:24:14');

-- --------------------------------------------------------

--
-- Table structure for table `users`
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
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'muslim@admin.com', '2024-08-24 04:29:29', '$2y$10$HvUwAOqN.ZoHKK.Bovl8G.kG6Mco4bMBT/uQu3Tc/K1dc9gPPKbaC', NULL, '2024-08-24 04:29:29', '2024-08-24 04:29:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cls`
--
ALTER TABLE `cls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about`
--
ALTER TABLE `about`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `cls`
--
ALTER TABLE `cls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
