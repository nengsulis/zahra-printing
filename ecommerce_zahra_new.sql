-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2024 at 08:52 AM
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
(1, 'Zahra Printing', '17245591402.png', 'Zahra Printing adalah', 'Rawamangun Jakarta Timur', 'zahra145@gmail.com', '0897654323233', NULL, '2024-08-25 05:22:20', 'Muslimin', '1234-1234-1234-1234');

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
(92, 5, 44, NULL, NULL, '1', '30mx30m', 1, 123680, 1, '2024-10-06 08:35:58', '2024-10-06 08:36:36');

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
(1, 'DESIGN GRAFIS', '#CetakDisini', '17245874723.jpg', '2024-08-24 04:45:04', '2024-08-25 05:04:32'),
(2, 'ALAT TULIS', 'Temukan semua kebutuhan alat tulis Anda di sini!', '17245000372.png', '2024-08-24 04:47:17', '2024-08-24 04:47:17'),
(3, 'RAGAM KERTAS', '\" Ragam Kertas Berkualitas \"', '17245001387.jpg', '2024-08-24 04:48:58', '2024-08-24 04:48:58'),
(4, 'gfdgd', 'dfgdg', '17263017614.jpeg', '2024-09-14 01:16:01', '2024-09-14 01:16:01');

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
(1, 'bca', 'alfia', '12345678908765', '17265210035.jpeg', NULL, '2024-09-16 14:10:03'),
(2, 'asddfghj', 'tryuiop', '4567890', '17265188421.png', '2024-09-16 13:34:02', '2024-09-16 14:09:46');

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
(3, 'Adila Rahma', '089789656876', 'Adila15@gmail.com', '$2y$10$tuBcNZUULc2jZtqHVBcJveGeeeV2jXrQRghQCoFyKbxy.dhTjKiRi', '2024-08-25 06:42:23', '2024-08-25 06:42:23'),
(4, 'Bagas Saputra', '087654345678', 'bagasputra@gmail.com', '$2y$10$/o7vnOxOTzhW5KaO6SNG8eHFVw4T0.zTf0cLh.8OuCSoSqO.9GSJG', '2024-08-25 07:33:29', '2024-08-25 07:33:29'),
(5, 'Alfia', '085748637242', 'alfia@gmail.com', '$2y$10$s2Cd/7w09vIACndmKMhltuvCKeuA8w222Em/baYem88XVdcRVYi5u', '2024-09-09 22:03:04', '2024-09-09 22:03:04');

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
(24, '2024_08_28_123713_add_id_member_to_payments', 8);

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
(14, 3, 24082812, 0, 153680, '0', '0', '', NULL, 0, '2024-08-28 07:18:12', '2024-08-28 07:20:53', 'Selesai'),
(15, 3, 24082925, 0, 187360, '0', '0', '', NULL, 0, '2024-08-29 06:15:25', '2024-09-13 02:50:22', 'Selesai'),
(16, 3, 24082949, 0, 261040, '0', '0', '', NULL, 0, '2024-08-29 06:16:49', '2024-09-13 02:49:36', 'Dikonfirmasi'),
(17, 5, 24091354, 0, 182913, '0', '0', '', NULL, 0, '2024-09-13 06:33:54', '2024-09-16 14:46:00', 'Dikonfirmasi'),
(18, 5, 24091333, 0, 243040, '0', '0', '', NULL, 0, '2024-09-13 10:14:33', '2024-09-19 02:17:18', 'Dikonfirmasi'),
(19, 5, 24091443, 0, 109233, '0', '0', '', NULL, 0, '2024-09-13 17:18:43', '2024-09-19 02:17:25', 'Dikonfirmasi'),
(20, 5, 24091422, 12, 95680, '5', '135', 'kjjdbhgdvkwqlnq', NULL, 0, '2024-09-13 21:41:22', NULL, 'Baru'),
(21, 5, 24091423, 30, 350699, '6', '153', 'sfdghjkliuytrdfxcvbn', NULL, 0, '2024-09-13 22:55:23', NULL, 'Baru'),
(22, 5, 24091406, 30, 325699, '9', '104', 'sfdghjkliuytrdfxcvbn', NULL, 0, '2024-09-13 22:56:06', NULL, 'Baru'),
(23, 5, 24091400, 15, 159233, '4', '294', 'dfghjkl;', NULL, 0, '2024-09-13 23:00:00', NULL, 'Baru'),
(24, 5, 24091441, 15, 200233, '7', '361', 'dfghjkl;', NULL, 0, '2024-09-13 23:05:41', NULL, 'Baru'),
(25, 5, 24091438, 15, 143233, '11', '178', 'sdfghm,', NULL, 0, '2024-09-13 23:21:38', NULL, 'Baru'),
(26, 5, 24091427, 15, 200233, '7', '88', 'dfgh', NULL, 0, '2024-09-14 00:14:27', NULL, 'Baru'),
(27, 5, 24091437, 15, 214466, '10', '177', 'iuytredcvbnmkl', NULL, 0, '2024-09-14 00:19:37', NULL, 'Baru'),
(28, 5, 24091654, 12, 163680, '6', '154', 'safdftyghkj', NULL, 0, '2024-09-16 14:12:54', NULL, 'Baru'),
(29, 5, 24091628, 15, 142233, '10', '209', 'sdfsdfsfsdf', NULL, 0, '2024-09-16 14:38:28', '2024-09-19 02:46:22', 'Dikonfirmasi'),
(30, 5, 24091752, 27, 233913, '6', '154', 'wdewdwedwdwe', NULL, 0, '2024-09-16 21:16:52', '2024-09-19 02:45:30', 'Dikonfirmasi'),
(31, 5, 24091951, 12, 88680, 'Banten', 'Serang', 'dfsfsddfsf', 'kj2131231312123', 80000, '2024-09-18 20:26:51', '2024-10-01 19:17:35', 'Dikemas'),
(32, 5, 24092047, 15, 145233, 'Jawa Tengah', 'Blora', 'dqwdqwdqwdqw', NULL, 0, '2024-09-20 02:19:47', NULL, 'Baru'),
(33, 5, 24092052, 12, 162680, 'Bengkulu', 'Bengkulu Utara', 'erteteteter', NULL, 0, '2024-09-20 02:26:52', NULL, 'Baru'),
(34, 5, 24092038, 12, 153680, 'Jambi', 'Muaro Jambi', 'dwqdqwdqw', NULL, 0, '2024-09-20 02:29:38', NULL, 'Baru'),
(35, 5, 24092016, 12, 163680, 'DKI Jakarta', 'Jakarta Selatan', 'fdghjkl;lkjhgf', NULL, 0, '2024-09-20 02:54:16', NULL, 'Baru'),
(36, 5, 24092023, 12, 174680, 'Kalimantan Selatan', 'Kotabaru', 'sdsadasdasda', NULL, 0, '2024-09-20 03:02:23', '2024-09-20 03:02:23', 'Baru'),
(37, 5, 24092158, 24, 320360, 'Gorontalo', 'Gorontalo', 'fsfdfddsfssf', NULL, 0, '2024-09-20 19:59:58', '2024-09-20 19:59:58', 'Baru'),
(38, 5, 24092139, 24, 269360, 'Bali', 'Badung', 'fsdfsfsd', NULL, 0, '2024-09-20 20:02:39', '2024-09-20 20:02:39', 'Baru'),
(39, 5, 24092145, 12, 203680, 'Gorontalo', 'Gorontalo', 'asasdasd', NULL, 0, '2024-09-20 20:11:45', '2024-09-20 20:11:45', 'Baru'),
(40, 5, 24092134, 12, 203680, 'Gorontalo', 'Gorontalo', 'asasdasd', NULL, 0, '2024-09-20 20:12:34', '2024-09-20 20:12:34', 'Baru'),
(41, 5, 24092158, 12, 138680, 'Banten', 'Lebak', 'asasdasdadadas', NULL, 0, '2024-09-20 20:12:58', '2024-09-20 20:12:58', 'Baru'),
(42, 5, 24092116, 12, 163680, 'DKI Jakarta', 'Jakarta Utara', 'dgergererrgv', NULL, 0, '2024-09-20 20:19:16', '2024-09-20 20:19:16', 'Baru'),
(43, 5, 24092115, 30, 282699, 'DI Yogyakarta', 'Kulon Progo', 'sdfxghjkl;ugyf', NULL, 0, '2024-09-20 20:23:15', '2024-09-20 20:23:15', 'Baru'),
(44, 5, 24092103, 24, 220360, 'Jawa Barat', 'Bandung', 'asassasasa', NULL, 0, '2024-09-20 21:57:03', '2024-09-20 21:57:03', 'Baru'),
(45, 5, 24092211, 12, 163680, 'DKI Jakarta', 'Jakarta Barat', 'jl sumarti', NULL, 0, '2024-09-22 06:24:11', '2024-09-22 06:24:11', 'Baru'),
(46, 5, 24092239, 12, 220360, 'Gorontalo', 'Gorontalo', 'gfhvjhb', NULL, 0, '2024-09-22 06:39:39', '2024-09-22 06:39:39', 'Baru'),
(47, 5, 24100243, 12, 146680, 'Jawa Timur', 'Kediri', 'qsqsqsqwqw', NULL, 0, '2024-10-02 01:05:43', '2024-10-02 23:24:27', 'Dikonfirmasi'),
(48, 5, 24100309, 12, 215808, 'Jambi', 'Sarolangun', 'fnm,', '3463643645', 8000, '2024-10-03 05:43:09', '2024-10-03 05:48:44', 'Dikirim'),
(49, 5, 24100636, 24, 262360, 'Banten', 'Serang', 'ghjkl', NULL, 0, '2024-10-06 08:36:36', '2024-10-06 08:36:36', 'Baru');

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
(11, 14, 45, 0, '', '', 1, '(50m x 30m)', 73680, '2024-08-28 21:26:21', '2024-08-28 21:26:26'),
(12, 15, 44, 0, '', '', 2, '30mx30m', 147360, NULL, NULL),
(13, 16, 44, 0, '', '', 3, '30mx30m', 221040, NULL, NULL),
(14, 17, 44, 0, '', '', 1, '30mx30m', 73680, NULL, NULL),
(15, 17, 52, 0, '', '', 1, '30m x 50m', 70233, NULL, NULL),
(16, 18, 44, 0, '', '', 1, '30mx30m', 73680, NULL, NULL),
(17, 18, 44, 0, '', '', 1, '30mx30m', 73680, NULL, NULL),
(18, 18, 44, 0, '', '', 1, '30mx30m', 73680, NULL, NULL),
(19, 19, 52, 0, '', '', 1, '30m x 50m', 70233, NULL, NULL),
(20, 20, 44, 0, '', '', 1, '30mx30m', 73680, NULL, NULL),
(21, 21, 52, 0, '', '', 1, '30m x 50m', 120233, NULL, NULL),
(22, 21, 52, 0, '', '', 2, '30m x 50m', 190466, NULL, NULL),
(23, 22, 52, 0, '', '', 1, '30m x 50m', 120233, NULL, NULL),
(24, 22, 52, 0, '', '', 2, '30m x 50m', 190466, NULL, NULL),
(25, 23, 52, 0, '', '', 1, '30m x 50m', 120233, NULL, NULL),
(26, 24, 52, 0, '', '', 1, '30m x 50m', 120233, NULL, NULL),
(27, 25, 52, 0, '', '', 1, '30m x 50m', 120233, NULL, NULL),
(28, 26, 52, 0, '', '', 1, '30m x 50m', 120233, NULL, NULL),
(29, 27, 52, 0, '', '', 2, '30m x 50m', 190466, NULL, NULL),
(30, 28, 44, 0, '', '', 1, '30mx30m', 123680, NULL, NULL),
(31, 29, 52, 0, '', '', 1, '30m x 50m', 120233, NULL, NULL),
(32, 30, 52, 1, NULL, NULL, 1, '30m x 50m', 120233, NULL, NULL),
(33, 30, 44, 0, 'uploads/FG1xmjWUToMMz3XxChh21dIgos7j4wwM6CsXD3bX.jpg', 'ddadadasda', 1, '30mx30m', 73680, NULL, NULL),
(34, 31, 44, 0, 'uploads/up7nRNmlP2vKQZX2knWqBCIUyJscbe000mG1uqAz.png', 'efwfewfw', 1, '30mx30m', 73680, NULL, NULL),
(35, 32, 52, 1, NULL, NULL, 1, '30m x 50m', 120233, NULL, NULL),
(36, 33, 44, 1, NULL, NULL, 1, '30mx30m', 123680, NULL, NULL),
(37, 34, 44, 1, NULL, NULL, 1, '30mx30m', 123680, '2024-09-20 16:29:38', '2024-09-20 16:29:38'),
(38, 35, 44, 1, NULL, NULL, 1, '30mx30m', 123680, NULL, NULL),
(39, 42, 44, 1, NULL, NULL, 1, '30mx30m', 123680, '2024-09-21 03:19:16', '2024-09-21 03:19:16'),
(40, 43, 52, 1, NULL, NULL, 2, '30m x 50m', 190466, '2024-09-21 03:23:15', '2024-09-21 03:23:15'),
(41, 43, 52, 0, 'uploads/BsnOoOQlLGt2aGfNjzifd1kyhqpKeATbaM7mXe5Z.png', NULL, 1, '30m x 50m', 70233, '2024-09-21 03:23:15', '2024-09-21 03:23:15'),
(42, 44, 44, 0, 'uploads/l3k5dHrzKaf2IXRg5I59wc0yAWcw5e4NwjgPEPC0.jpg', 'undefined', 1, '30mx30m', 73680, '2024-09-21 04:57:03', '2024-09-21 04:57:03'),
(43, 44, 44, 0, 'uploads/UdYDNIE1MLrqgI5Dz3wiVzSI1tKsxErRTBt0L2pq.png', 'asdasdassd', 1, '30mx30m', 73680, '2024-09-21 04:57:03', '2024-09-21 04:57:03'),
(44, 45, 44, 1, NULL, NULL, 1, '30mx30m', 123680, '2024-09-22 13:24:11', '2024-09-22 13:24:11'),
(45, 46, 44, 0, 'uploads/Do5ZEIkrctQ07SVwyK7Ivi6AUWuI3S6kLnRYvwFN.jpg', 'kjhkjhuyu', 2, '30mx30m', 147360, '2024-09-22 13:39:39', '2024-10-03 08:25:50'),
(46, 47, 44, 1, NULL, NULL, 1, '30mx30m', 123680, '2024-10-02 08:05:43', '2024-10-02 08:05:43'),
(47, 48, 44, 1, 'uploads/k49KUdno0fQDSYIDbfLhzdyHDeFkgtOuKQCn2EkE.jpg', NULL, 1, '30mx30m', 123680, '2024-10-03 12:43:09', '2024-10-03 12:45:53'),
(48, 48, 47, 0, NULL, NULL, 1, '(50m x 30m)', 62128, '2024-10-03 12:43:09', '2024-10-03 12:43:09'),
(49, 49, 44, 1, 'uploads/N4E4f5NMhx2W3RR8aR7lhXUtf3KVI0qmJEKV47FN.jpg', NULL, 1, '30mx30m', 123680, '2024-10-06 15:36:36', '2024-10-06 16:41:13'),
(50, 49, 44, 1, NULL, NULL, 1, '30mx30m', 123680, '2024-10-06 15:36:36', '2024-10-06 15:36:36');

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
(8, 14, 'order', 153680, 1, '7', 'DITERIMA', '2024-08-28 07:19:32', '2024-08-28 07:20:11', 3),
(9, 14, 'order', 153680, 1, '6', 'DITERIMA', '2024-08-29 06:17:33', '2024-08-29 06:18:41', 3),
(10, 17, 'order', 4567890, 1, '3', 'DITERIMA', '2024-09-13 06:50:57', '2024-09-19 09:50:03', 5),
(11, 17, 'order', 182913, 1, 'bukti_pembayaran/xElflylKIZqTXDPtNCWcbsxIqXzySIrxbAESgWAx.png', 'DITERIMA', '2024-09-13 22:16:15', '2024-09-20 01:56:31', 5),
(12, 28, 'order', 163680, 1, 'bukti_pembayaran/GycWEojitioQ4pejByOFj1OvV3QaYPTtsGM8thO7.png', 'DITERIMA', '2024-09-16 14:37:11', '2024-09-20 01:42:16', 5),
(13, 29, 'order', 142233, 2, 'bukti_pembayaran/lgz5lBnyBLpKTR6qx3altDyh9wT1CfuPDBM1TyW7.jpg', 'DITERIMA', '2024-09-16 14:39:03', '2024-09-19 23:57:09', 5),
(14, 31, 'order', 88680, 1, 'bukti_pembayaran/J29lwipXvfERKovHILwl6Y7zrrjJgav5VDQ02IKr.png', 'DITERIMA', '2024-09-18 20:27:15', '2024-09-20 00:20:46', 5),
(15, 32, 'order', 145233, 1, 'bukti_pembayaran/4LEC1goEX1k7JW92AQNlL4VYWx7HkLxnexsAvpji.jpg', 'MENUNGGU', '2024-09-20 02:23:12', '2024-09-20 02:23:12', 5),
(16, 33, 'order', 162680, 1, 'bukti_pembayaran/kY0X6khXUvRthN5fkv4iLRG3annu7JzXs8zb8BKZ.png', 'MENUNGGU', '2024-09-20 02:27:10', '2024-09-20 02:27:10', 5),
(17, 34, 'order', 153680, 1, 'bukti_pembayaran/CFHzNma7sJSPdmYQHsZbxjAwhdTr2D4ECUjAA1cd.png', 'MENUNGGU', '2024-09-20 02:29:52', '2024-09-20 02:29:52', 5),
(18, 35, 'order', 163680, 1, 'bukti_pembayaran/0gxlQPJUZ0wBTbNgSEvW5fp8hAUnlEbQa0475nnS.png', 'MENUNGGU', '2024-09-20 02:54:31', '2024-09-20 02:54:31', 5),
(19, 38, 'order', 269360, 2, 'bukti_pembayaran/BcnqXWNCYRlgNzeLORa3vJAZgsfxUnFiAavjdNh2.png', 'MENUNGGU', '2024-09-20 20:07:19', '2024-09-20 20:07:19', 5),
(20, 38, 'order', 269360, 2, 'bukti_pembayaran/FfutHXHYn4Yup57QyXBcjcHcmiEf3YhVCDGd65o7.png', 'MENUNGGU', '2024-09-20 20:11:12', '2024-09-20 20:11:12', 5),
(21, 42, 'order', 163680, 2, 'bukti_pembayaran/kH8hdEKdbLVmAebYzKvnSibvWmdnAmVq5ywqydYo.png', 'MENUNGGU', '2024-09-20 20:19:29', '2024-09-20 20:19:29', 5),
(22, 43, 'order', 282699, 2, 'bukti_pembayaran/4eQUBuyKHoipebehERm4HvWbw36iP3ateVBChBci.png', 'MENUNGGU', '2024-09-20 20:23:29', '2024-09-20 20:23:29', 5),
(23, 44, 'order', 220360, 2, 'bukti_pembayaran/PnOFmiAaU4iyP3jY1sBqWg1C4SoNbTUj08WMVKyt.png', 'MENUNGGU', '2024-09-20 21:57:22', '2024-09-20 21:57:22', 5),
(24, 45, 'order', 163680, 2, 'bukti_pembayaran/SN47fP4B9a2zQUvHkVE19sWQEk3qlZ4FGT7gYXpL.jpg', 'MENUNGGU', '2024-09-22 06:24:52', '2024-09-22 06:24:52', 5),
(25, 46, 'order', 220360, 1, 'bukti_pembayaran/qGN3j4khHPs6WdJihqQlVNinNdurgpN53aGu8fXJ.jpg', 'MENUNGGU', '2024-09-22 06:40:43', '2024-09-22 06:40:43', 5),
(26, 47, 'order', 146680, 2, 'bukti_pembayaran/f964X5VD74vexVQ9gyPIpi0gKAsvmKtiavomnK4B.png', 'MENUNGGU', '2024-10-02 01:07:41', '2024-10-02 01:07:41', 5),
(27, 31, 'order', 80000, 2, 'bukti_pembayaran/wygW49BthwVN5YN3EajZkZhxzPQwhMC9tvN6t10z.jpg', 'MENUNGGU', '2024-10-02 01:22:15', '2024-10-02 01:22:15', 5),
(28, 31, 'charge', 80000, 2, 'bukti_pembayaran/7HljOincWwQaCN76R3aDR2B2i8VoDiswPd5yOXPI.jpg', 'MENUNGGU', '2024-10-02 01:24:27', '2024-10-02 01:24:27', 5),
(29, 48, 'order', 215808, 1, 'bukti_pembayaran/Rs0lgiYmHgJOnIJlM427DgVbvkwoayHBk6yd29J8.jpg', 'MENUNGGU', '2024-10-03 05:43:38', '2024-10-03 05:43:38', 5),
(30, 49, 'order', 262360, 1, 'bukti_pembayaran/qw0MOVifMkPnbKkXLXzBaOlpvSmFSITf4aCZOGHL.jpg', 'MENUNGGU', '2024-10-06 09:21:42', '2024-10-06 09:21:42', 5);

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
(42, 1, 9, 'SPANDUK KEMERDEKAAN', '17245775985.jpg', 'lorem ipsum dolor sit amet', 0, 14328, 'lorem,ipsum,dolor,sit,amet', 'VjekQLPH', '(50m x 30m)', '2024-08-24 09:43:27', '2024-08-25 02:19:58'),
(43, 1, 10, 'BANNER PRAMUKA', '17245554362.jpg', 'lorem ipsum dolor sit amet', 0, 89269, 'lorem,ipsum,dolor,sit,amet', 'ZlfbSXWX', '(50m x 30m), (30m x 50m)', '2024-08-24 09:43:27', '2024-08-24 20:10:36'),
(44, 1, 2, 'Roll Banner 1', '17246554151.jpg', 'lorem ipsum dolor sit amet', 12, 73680, 'lorem,ipsum,dolor,sit,amet', 'mUtHEc0e', '30mx30m, 50mx30m', '2024-08-24 09:43:27', '2024-08-25 23:56:55'),
(45, 1, 9, 'SPANDUK NIKAHAN', '17245555222.jpg', 'lorem ipsum dolor sit amet', 0, 73680, 'lorem,ipsum,dolor,sit,amet', 'mUtHEc0e', '(50m x 30m), (30m x 50m)', '2024-08-24 09:43:27', '2024-08-24 20:12:02'),
(46, 3, 1, 'lorem ipsum dolor sit amet', 'shop_image_5.jpg', 'lorem ipsum dolor sit amet', 0, 97596, 'lorem,ipsum,dolor,sit,amet', '8pen9FNq', '(50m x 30m), (30m x 50m)', '2024-08-24 09:43:27', '2024-08-24 09:43:27'),
(47, 2, 1, 'lorem ipsum dolor sit amet', 'shop_image_6.jpg', 'lorem ipsum dolor sit amet', 0, 62128, 'lorem,ipsum,dolor,sit,amet', 'CVY6vriE', '(50m x 30m), (30m x 50m)', '2024-08-24 09:43:27', '2024-08-24 09:43:27'),
(48, 3, 1, 'lorem ipsum dolor sit amet', 'shop_image_7.jpg', 'lorem ipsum dolor sit amet', 0, 68777, 'lorem,ipsum,dolor,sit,amet', 'rQ3poYfB', '(50m x 30m), (30m x 50m)', '2024-08-24 09:43:27', '2024-08-24 09:43:27'),
(49, 2, 5, 'lorem ipsum dolor sit amet', 'shop_image_8.jpg', 'lorem ipsum dolor sit amet', 0, 82498, 'lorem,ipsum,dolor,sit,amet', '0ixBu08d', '(50m x 30m), (30m x 50m)', '2024-08-24 09:43:27', '2024-08-24 09:43:27'),
(50, 2, 3, 'lorem ipsum dolor sit amet', 'shop_image_9.jpg', 'lorem ipsum dolor sit amet', 0, 54306, 'lorem,ipsum,dolor,sit,amet', 'EEa2TWiJ', '(50m x 30m), (30m x 50m)', '2024-08-24 09:43:27', '2024-08-24 09:43:27'),
(51, 1, 5, 'lorem ipsum dolor sit amet', 'shop_image_10.jpg', 'lorem ipsum dolor sit amet', 0, 21392, 'lorem,ipsum,dolor,sit,amet', 'LEmYz8NF', '(50m x 30m), (30m x 50m)', '2024-08-24 09:43:27', '2024-08-24 09:43:27'),
(52, 1, 2, 'Roll Banner 2', '17246556054.jpg', 'lorem ipsum dolor sit amet', 15, 70233, 'lorem,ipsum,dolor,sit,amet', 'M4Kerpcd', '30m x 50m , 40m x 50m', '2024-08-24 09:43:27', '2024-08-26 00:00:05'),
(53, 2, 7, 'lorem ipsum dolor sit amet', 'shop_image_12.jpg', 'lorem ipsum dolor sit amet', 0, 34636, 'lorem,ipsum,dolor,sit,amet', '1jQvG6Q4', '(50m x 30m), (30m x 50m)', '2024-08-24 09:43:27', '2024-08-24 09:43:27'),
(54, 3, 4, 'lorem ipsum dolor sit amet', 'shop_image_13.jpg', 'lorem ipsum dolor sit amet', 0, 5580, 'lorem,ipsum,dolor,sit,amet', 'FFUgojEm', '(50m x 30m), (30m x 50m)', '2024-08-24 09:43:27', '2024-08-24 09:43:27'),
(55, 1, 4, 'lorem ipsum dolor sit amet', 'shop_image_14.jpg', 'lorem ipsum dolor sit amet', 0, 38072, 'lorem,ipsum,dolor,sit,amet', '57KUvvBJ', '(50m x 30m), (30m x 50m)', '2024-08-24 09:43:27', '2024-08-24 09:43:27'),
(56, 3, 3, 'lorem ipsum dolor sit amet', 'shop_image_15.jpg', 'lorem ipsum dolor sit amet', 0, 75545, 'lorem,ipsum,dolor,sit,amet', 'holbBGiv', '(50m x 30m), (30m x 50m)', '2024-08-24 09:43:27', '2024-08-24 09:43:27'),
(57, 3, 5, 'lorem ipsum dolor sit amet', 'shop_image_16.jpg', 'lorem ipsum dolor sit amet', 0, 50851, 'lorem,ipsum,dolor,sit,amet', 'XzweF8pu', '(50m x 30m), (30m x 50m)', '2024-08-24 09:43:27', '2024-08-24 09:43:27'),
(58, 3, 8, 'lorem ipsum dolor sit amet', 'shop_image_17.jpg', 'lorem ipsum dolor sit amet', 0, 99658, 'lorem,ipsum,dolor,sit,amet', 'pVOBYdxi', '(50m x 30m), (30m x 50m)', '2024-08-24 09:43:27', '2024-08-24 09:43:27'),
(59, 3, 4, 'lorem ipsum dolor sit amet', 'shop_image_18.jpg', 'lorem ipsum dolor sit amet', 0, 57766, 'lorem,ipsum,dolor,sit,amet', 'YWMUe0lK', '(50m x 30m), (30m x 50m)', '2024-08-24 09:43:27', '2024-08-24 09:43:27'),
(60, 1, 7, 'lorem ipsum dolor sit amet', '17245868553.jpg', 'lorem ipsum dolor sit amet', 0, 10986, 'lorem,ipsum,dolor,sit,amet', 'b0XCEhE0', '(50m x 30m), (30m x 50m)', '2024-08-24 09:43:27', '2024-08-25 04:54:15');

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
(1, '\" Zahra Printing \"', 'Halo! Mari Cetak Sesuatu yang Istimewa dengan Layanan Digital Printing Terbaik', '17244997413.jpg', '2024-08-24 04:34:49', '2024-08-24 04:42:21'),
(2, 'Exclusive Products', '\" Temukan Kepuasan dalam Setiap Cetakan Anda \"', '17244994874.png', '2024-08-24 04:38:07', '2024-08-24 04:38:07'),
(3, 'Enjoy Online Shopping', 'Selamat Berkreasi dan Berbelanja Cetak Digital dengan Kemudahan', '17244997305.jpg', '2024-08-24 04:41:24', '2024-08-24 04:42:10');

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
(1, 2, 'ALAT TULIS', 'lorem ipsum dolor sit amet', '17245725171.jpg', '2024-08-24 04:51:07', '2024-08-25 00:55:17'),
(2, 1, 'ROLL BANNER', 'lorem ipsum dolor sit amet', '17245725378.jpg', '2024-08-24 04:51:33', '2024-08-25 00:55:37'),
(3, 1, 'Flayer Art', 'lorem ipsum dolor sit amet', '17245003211.jpg', '2024-08-24 04:52:01', '2024-08-24 04:52:01'),
(4, 1, 'Stiker', 'lorem ipsum dolor sit amet', '17245003423.jpg', '2024-08-24 04:52:22', '2024-08-24 04:52:22'),
(5, 1, 'Sablon', 'lorem ipsum dolor sit amet', '17245004626.jpg', '2024-08-24 04:54:06', '2024-08-24 04:54:22'),
(6, 1, 'Undangan', 'lorem ipsum dolor sit amet', '17245004993.jpg', '2024-08-24 04:54:59', '2024-08-24 04:54:59'),
(7, 1, 'Tali Id Card', 'lorem ipsum dolor sit amet', '17245005413.jpg', '2024-08-24 04:55:41', '2024-08-24 04:55:41'),
(8, 3, 'Map', 'lorem ipsum dolor sit amet', '17245008864.jpg', '2024-08-24 05:01:26', '2024-08-24 05:01:26'),
(9, 1, 'SPANDUK', 'lorem ipsum dolor sit amet', '17245728403.jpg', '2024-08-24 10:01:45', '2024-08-25 01:00:40'),
(10, 1, 'Banner', 'lorem ipsum dolor sit amet', '17245189062.jpg', '2024-08-24 10:01:46', '2024-08-24 10:01:46');

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
(1, 'Administrator', 'ayu@admin.com', '2024-08-24 04:29:29', '$2y$10$s2Cd/7w09vIACndmKMhltuvCKeuA8w222Em/baYem88XVdcRVYi5u', NULL, '2024-08-24 04:29:29', '2024-08-24 04:29:29');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
