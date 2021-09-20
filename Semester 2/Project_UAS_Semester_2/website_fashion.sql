-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 07, 2021 at 01:09 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id16970380_anklebitter`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang_order`
--

CREATE TABLE `barang_order` (
  `id_barang_order` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang_order`
--

INSERT INTO `barang_order` (`id_barang_order`, `id_produk`, `id_order`, `harga`) VALUES
(16, 37, 27, 299000),
(17, 35, 27, 949000),
(18, 37, 28, 299000),
(19, 37, 29, 299000),
(20, 26, 29, 2199000),
(21, 29, 30, 1299000);

-- --------------------------------------------------------

--
-- Table structure for table `brand_produk`
--

CREATE TABLE `brand_produk` (
  `id_brand_produk` int(11) NOT NULL,
  `brand` varchar(45) NOT NULL,
  `gambar_brand` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brand_produk`
--

INSERT INTO `brand_produk` (`id_brand_produk`, `brand`, `gambar_brand`) VALUES
(1, 'Nike', 'nike.png'),
(4, 'Adidas', 'adidas.png'),
(5, 'Converse', 'converse.png'),
(6, 'Vans', 'vans.png'),
(7, 'Trasher', 'thraser.png'),
(9, 'Onitsuka Tiger', 'onitsuka-tiger.png');

-- --------------------------------------------------------

--
-- Table structure for table `bukti_pembayaran`
--

CREATE TABLE `bukti_pembayaran` (
  `id_bukti_pembayaran` int(11) NOT NULL,
  `nomor_rekening_customer` varchar(45) NOT NULL,
  `nama_rekening_customer` varchar(45) NOT NULL,
  `bank` varchar(45) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `id_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bukti_pembayaran`
--

INSERT INTO `bukti_pembayaran` (`id_bukti_pembayaran`, `nomor_rekening_customer`, `nama_rekening_customer`, `bank`, `foto`, `id_order`) VALUES
(3, '1234567890', 'Rully Afrizal Alwin', 'Panin Bank', '27_Rully Afrizal Alwin_cover_fuzzy.jpg', 27),
(4, '123456789', 'Fariz Fahmi ', 'Bank Mandiri', '28_Fariz Fahmi _25_asu_rafli.png', 28),
(5, '321456789', 'Rully Afrizal Alwin', 'BCA', '29_Rully Afrizal Alwin_1200px-Mangekyou_Sharingan_Kakashi.svg.png', 29);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(225) DEFAULT NULL,
  `kode_pos` varchar(6) DEFAULT NULL,
  `nomor_telepon` varchar(15) DEFAULT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_customer`, `nama`, `alamat`, `kode_pos`, `nomor_telepon`, `id_user`) VALUES
(5, 'Customer Pertama', 'Jl. Merdeka Selatan No.143, Jakarta Pusat', '61253', '081234567890', 13),
(6, 'Rully Afrizal', 'Griya Candramas CA-32, Pepe, Sedati , Sidoarjo.', '18975', '081232345678', 14),
(7, 'Rully Afrizal', NULL, NULL, NULL, 15),
(8, 'Haris Jaya', 'GRAHA CANDI MAS JL KALASAN III C-35 CANDI', '61271', '123456', 16),
(9, 'Fariz Fahmi', NULL, NULL, NULL, 17);

-- --------------------------------------------------------

--
-- Table structure for table `kategori_produk`
--

CREATE TABLE `kategori_produk` (
  `id_kategori_produk` int(11) NOT NULL,
  `kategori` varchar(20) NOT NULL,
  `gambar_kategori` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori_produk`
--

INSERT INTO `kategori_produk` (`id_kategori_produk`, `kategori`, `gambar_kategori`) VALUES
(1, 'Tops', 'tshirt.svg'),
(2, 'Accessories', 'backpack.svg'),
(3, 'Sneakers', 'categories-sneaker.png');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang_belanja`
--

CREATE TABLE `keranjang_belanja` (
  `id_keranjang_belanja` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `keranjang_belanja`
--

INSERT INTO `keranjang_belanja` (`id_keranjang_belanja`, `id_customer`, `id_produk`, `created_at`) VALUES
(67, 5, 30, '2021-06-04 14:34:50');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id_order` int(11) NOT NULL,
  `penerima` varchar(45) NOT NULL,
  `ordered_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `alamat_pengiriman` varchar(225) NOT NULL,
  `status` varchar(40) NOT NULL DEFAULT 'Menunggu Bukti Pembayaran',
  `total_harga` varchar(45) NOT NULL,
  `telepon_penerima` varchar(15) NOT NULL,
  `resi_pengiriman` varchar(45) DEFAULT NULL,
  `catatan` varchar(100) DEFAULT NULL,
  `id_rekening_pembayaran` int(11) DEFAULT NULL,
  `id_customer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id_order`, `penerima`, `ordered_at`, `alamat_pengiriman`, `status`, `total_harga`, `telepon_penerima`, `resi_pengiriman`, `catatan`, `id_rekening_pembayaran`, `id_customer`) VALUES
(27, 'Rully Afrizal Alwin', '2021-06-04 13:32:03', 'Jl. Merdeka Selatan No.143, Jakarta Pusat kodepos: 61253', 'Pembayaran Diverifikasi', '1391575', '081234567890', NULL, '', 3, 5),
(28, 'Fariz Fahmi', '2021-06-04 21:39:22', 'GRAHA CANDI MAS JL KALASAN III C-35 CANDI kodepos: 61271', 'Pesanan Dikirim', '347781', '0812-3463-1783', 'rully.png', 'Pake bubble wrap ya gan !!', 3, 9),
(29, 'Rully Afrizal', '2021-06-05 08:14:56', 'Griya Candramas CA-32, Pepe, Sedati , Sidoarjo. kodepos: 18975', 'Pembayaran Diverifikasi', '2766685', '081232345678', NULL, 'Tolong sepatunya dikirim secepatnya', 1, 6),
(30, 'Rully Afrizal Alwin', '2021-06-06 11:43:15', 'Griya Candramas CA-32, Pepe, Sedati , Sidoarjo. kodepos: 18975', 'Menunggu Bukti Pembayaran', '1447404', '081232345678', NULL, '', 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` varchar(45) NOT NULL,
  `stok` int(45) UNSIGNED NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `id_kategori_produk` int(11) NOT NULL,
  `id_brand_produk` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `title`, `nama`, `deskripsi`, `harga`, `stok`, `gambar`, `created_at`, `updated_at`, `id_kategori_produk`, `id_brand_produk`, `user_id`) VALUES
(8, 'Converse Chuck 70s OX Burgundy', 'Converse Chuck 70s OX Burgundy', '<div style=\"color: rgb(51, 51, 51); font-family: \" encode=\"\" sans=\"\" condensed\",=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\"><span style=\"font-family: &quot;Source Sans Pro&quot;;\">ï»¿</span>Detail</div><ul style=\"margin-bottom: 10px;\"><li>Colorway : Dark Burgundy</li><li>Article : (162059C)</li><li>Brand New in Box (BNIB) / Tag (BNWT)</li></ul><div style=\"color: rgb(51, 51, 51); font-family: \" encode=\"\" sans=\"\" condensed\",=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Material</div><ul style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: \" encode=\"\" sans=\"\" condensed\",=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\"><li>Upper Kanvas</li><li>Insole Sintetis</li><li>Rubber Outsole</li></ul><div style=\"color: rgb(51, 51, 51); font-family: \" encode=\"\" sans=\"\" condensed\",=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\"><div>Technology</div><ul style=\"margin-bottom: 10px;\"><li>Ortholite</li></ul></div>', '750000', 4, 'anklebitter.id_162236698250478.jpg', '2021-06-04 07:06:37', '2021-06-04 07:06:37', 3, 5, 5),
(9, 'Nike Classic Cortez Leather Black White', 'Nike Classic Cortez Leather Black White', '<p><span style=\"color: rgb(0, 0, 0); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 12px; letter-spacing: 0.6px;\">Classic running shoes in dual tone. Full-grain leather upper for durability and comfort. Foam midsole for lightweight cushioning. Rubber outsole with herringbone pattern. Lace up fastening</span><span style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\">Â </span></p><p><span style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\">Best for lifestyle</span><br style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\"><span style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\">- Running-inspired leather sneakers</span><br style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\"><span style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\">- Full-grain leather upper for durability and comfort</span><br style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\"><span style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\">- Textile insole</span><br style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\"><span style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\">- Foam midsole for lightweight cushioning</span><br style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\"><span style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\">- Rubber outsole with herringbone pattern</span><br></p>', '945000', 10, 'anklebitter.id_1622366646097417.jpg', '2021-06-04 07:08:18', '2021-06-04 07:08:18', 3, 1, 5),
(10, 'Nike Cortez Forrest Gump', 'Nike Cortez Forrest Gump', '<p><span style=\"color: rgb(0, 0, 0); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 12px; letter-spacing: 0.6px;\">Classic running shoes in dual tone. Full-grain leather upper for durability and comfort. Foam midsole for lightweight cushioning. Rubber outsole with herringbone pattern. Lace up fastening</span></p><p><span style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\">- Best for lifestyle</span><br style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\"><span style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\">- Running-inspired leather sneakers</span><br style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\"><span style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\">- Full-grain leather upper for durability and comfort</span><br style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\"><span style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\">- Textile insole</span><br style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\"><span style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\">- Foam midsole for lightweight cushioning</span><br style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\"><span style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\">- Rubber outsole with herringbone pattern</span><span style=\"color: rgb(0, 0, 0); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 12px; letter-spacing: 0.6px;\"><br></span><br></p>', '1199000', 4, 'anklebitter.id_1622366669654263.jpg', '2021-06-04 07:09:20', '2021-06-04 07:09:20', 3, 1, 5),
(11, 'Nike Classic Cortez Leather White Black', 'Nike Classic Cortez Leather White Black', '<p><span style=\"color: rgb(0, 0, 0); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 12px; letter-spacing: 0.6px;\">Classic running shoes in dual tone. Full-grain leather upper for durability and comfort. Foam midsole for lightweight cushioning. Rubber outsole with herringbone pattern. Lace up fastening</span><span style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\"><br></span></p><p><span style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\">- Best for lifestyle</span><br style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\"><span style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\">- Running-inspired leather sneakers</span><br style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\"><span style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\">- Full-grain leather upper for durability and comfort</span><br style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\"><span style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\">- Textile insole</span><br style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\"><span style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\">- Foam midsole for lightweight cushioning</span><br style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\"><span style=\"color: rgb(38, 38, 38); font-family: Apercu, \"Gill Sans MT\", \"Gill Sans\", Arial, sans-serif; font-size: 11px; letter-spacing: 0.6px;\">- Rubber outsole with herringbone pattern</span><br></p>', '1099000', 7, 'anklebitter.id_1622366681796471.jpg', '2021-06-04 07:11:39', '2021-06-04 07:11:39', 3, 1, 5),
(12, 'Vans Authentic Black White', 'Vans Authentic Black White', '<p><font color=\"#000000\">Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem.</font></p><p><font color=\"#000000\"><br></font></p><p><font color=\"#000000\">- Sneakers bermotif kotak untuk daily look dengan kesan OG</font></p><p><font color=\"#000000\">- Kombinasi warna hitam dan putih</font></p><p><font color=\"#000000\">- Upper tekstil</font></p><p><font color=\"#000000\">- Insole sintetis</font></p><p><font color=\"#000000\">- Rubber outsole</font></p><p><font color=\"#000000\"><br></font></p><p><font color=\"#000000\">Available Size (38-42)</font></p>', '450000', 5, 'anklebitter.id_1622366691585344.jpg', '2021-06-04 07:15:20', '2021-06-04 07:15:20', 3, 6, 5),
(13, 'Vans Authentic Classic All Black', 'Vans Authentic Classic All Black', '<p>Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem.</p><p><br></p><p>- Sneakers bermotif kotak untuk daily look dengan kesan OG</p><p>- Kombinasi warna hitam dan putih</p><p>- Upper tekstil</p><p>- Insole sintetis</p><p>- Rubber outsole</p><p><br></p><p>Available Size (38-42)</p>', '550000', 10, 'anklebitter.id_1622366710697338.jpg', '2021-06-04 07:37:33', '2021-06-04 07:37:33', 3, 6, 5),
(14, 'Vans Slip On Checkerboard', 'Vans Slip On Checkerboard', '<p>Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem.</p><p><br></p><p>- Sneakers bermotif kotak untuk daily look dengan kesan OG</p><p>- Kombinasi warna hitam dan putih</p><p>- Upper tekstil</p><p>- Insole sintetis</p><p>- Rubber outsole</p><p><br></p><p>Available Size (38-42)</p>', '650000', 4, 'anklebitter.id_1622366724639387.jpg', '2021-06-04 07:38:52', '2021-06-04 07:38:52', 3, 6, 5),
(15, 'Adidas Superstar White Strip Black', 'Adidas Superstar White Strip Black', '<p>Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem.</p><p><br></p><p>- Sneakers bermotif kotak untuk daily look dengan kesan OG</p><p>- Kombinasi warna hitam dan putih</p><p>- Upper tekstil</p><p>- Insole sintetis</p><p>- Rubber outsole</p><p><br></p><p>Available Size (38-42)</p>', '1599000', 4, 'anklebitter.id_1622366733579749.jpg', '2021-06-04 07:39:29', '2021-06-04 07:39:29', 3, 4, 5),
(16, 'Adidas Questar Flow All Black Orange', 'Adidas Questar Flow All Black Orange', '<p>Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem.</p><p><br></p><p>- Sneakers bermotif kotak untuk daily look dengan kesan OG</p><p>- Kombinasi warna hitam dan putih</p><p>- Upper tekstil</p><p>- Insole sintetis</p><p>- Rubber outsole</p><p><br></p><p>Available Size (38-42)</p>', '1499000', 7, 'anklebitter.id_1622366786365454.jpg', '2021-06-04 07:40:34', '2021-06-04 07:40:34', 3, 4, 5),
(17, 'Adidas Stan Smith White Navy', 'Adidas Stan Smith White Navy', '<p>Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem.</p><p><br></p><p>- Sneakers bermotif kotak untuk daily look dengan kesan OG</p><p>- Kombinasi warna hitam dan putih</p><p>- Upper tekstil</p><p>- Insole sintetis</p><p>- Rubber outsole</p><p><br></p><p>Available Size (38-42)</p>', '1099000', 12, 'anklebitter.id_1622366791660838.jpg', '2021-06-04 07:41:14', '2021-06-04 07:41:14', 3, 4, 5),
(18, 'Adidas Gazelle Leather Black White Sol Gum', 'Adidas Gazelle Leather Black White Sol Gum', '<p>Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Cras ultricies ligula sed magna dictum porta. Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus.</p><p><br></p><p>- Sneakers bermotif kotak untuk daily look dengan kesan OG</p><p>- Kombinasi warna hitam dan putih</p><p>- Upper tekstil</p><p>- Insole sintetis</p><p>- Rubber outsole</p><p><br></p><p>Available Size (38-42)</p>', '899000', 7, 'anklebitter.id_1622366799210218.jpg', '2021-06-04 07:42:16', '2021-06-04 07:42:16', 3, 4, 5),
(19, 'Nike Air Force 1 All White', 'Nike Air Force 1 All White', '<p>Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Cras ultricies ligula sed magna dictum porta.&nbsp;</p><p><br></p><p>- Sneakers bermotif kotak untuk daily look dengan kesan OG</p><p>- Kombinasi warna hitam dan putih</p><p>- Upper tekstil</p><p>- Insole sintetis</p><p>- Rubber outsole</p><p><br></p><p>Available Size (38-42)</p>', '1599000', 2, 'anklebitter.id_1622366807766360.jpg', '2021-06-04 07:43:01', '2021-06-04 07:43:01', 3, 1, 5),
(20, 'Vans Oldskool Pro Black Gum', 'Vans Oldskool Pro Black Gum', '<p>Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Cras ultricies ligula sed magna dictum porta.&nbsp;</p><p><br></p><p>- Sneakers bermotif kotak untuk daily look dengan kesan OG</p><p>- Kombinasi warna hitam dan putih</p><p>- Upper tekstil</p><p>- Insole sintetis</p><p>- Rubber outsole</p><p><br></p><p>Available Size (38-42)</p>', '899000', 6, 'anklebitter.id_1622366832234487.jpg', '2021-06-04 07:43:43', '2021-06-04 07:43:43', 3, 6, 5),
(21, 'Thrasher Magazine S/S Tee', 'Thrasher Magazine S/S Tee', '<p>Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Cras ultricies ligula sed magna dictum porta.&nbsp;</p><p><br></p><p>- Sneakers bermotif kotak untuk daily look dengan kesan OG</p><p>- Kombinasi warna hitam dan putih</p><p>- Upper tekstil</p><p>- Insole sintetis</p><p>- Rubber outsole</p><p><br></p><p>Available Size (S-XL)</p>', '450000', 20, 'anklebitter.id_1622366923115718.jpg', '2021-06-04 07:45:10', '2021-06-04 07:45:10', 1, 7, 5),
(22, 'Thrasher Hometown Ribbon S/S Tee', 'Thrasher Hometown Ribbon S/S Tee', '<p>Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Cras ultricies ligula sed magna dictum porta.&nbsp;</p><p><br></p><p>- Sneakers bermotif kotak untuk daily look dengan kesan OG</p><p>- Kombinasi warna hitam dan putih</p><p>- Upper tekstil</p><p>- Insole sintetis</p><p>- Rubber outsole</p><p><br></p><p>Available Size (S-L)</p>', '425000', 12, 'anklebitter.id_1622366949841636.jpg', '2021-06-04 07:45:47', '2021-06-04 07:45:47', 1, 7, 5),
(23, 'Converse 70s Ox Sunflower', 'Converse 70s Ox Sunflower', '<p>Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Cras ultricies ligula sed magna dictum porta.&nbsp;</p><p><br></p><p>- Sneakers bermotif kotak untuk daily look dengan kesan OG</p><p>- Kombinasi warna hitam dan putih</p><p>- Upper tekstil</p><p>- Insole sintetis</p><p>- Rubber outsole</p><p><br></p><p>Available Size (38-42)</p>', '750000', 4, 'anklebitter.id_1622366990285224.jpg', '2021-06-04 07:46:25', '2021-06-04 07:46:25', 3, 5, 5),
(24, 'Converse 70s Ox Black Egret', 'Converse 70s Ox Black Egret', '<p>Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Cras ultricies ligula sed magna dictum porta.&nbsp;</p><p><br></p><p>- Sneakers bermotif kotak untuk daily look dengan kesan OG</p><p>- Kombinasi warna hitam dan putih</p><p>- Upper tekstil</p><p>- Insole sintetis</p><p>- Rubber outsole</p><p><br></p><p>Available Size (38-42)</p>', '799000', 7, 'anklebitter.id_1622367004854971.jpg', '2021-06-04 07:47:05', '2021-06-04 07:47:05', 3, 5, 5),
(25, 'Vans x HarryPotter Slip On \"HufflePuff\"', 'Vans x HarryPotter Slip On \"HufflePuff\"', '<p>Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Cras ultricies ligula sed magna dictum porta.&nbsp;</p><p><br></p><p>- Sneakers bermotif kotak untuk daily look dengan kesan OG</p><p>- Kombinasi warna hitam dan putih</p><p>- Upper tekstil</p><p>- Insole sintetis</p><p>- Rubber outsole</p><p><br></p><p>Available Size (38-42)</p>', '1799000', 2, 'anklebitter.id_1622367045991681.jpg', '2021-06-04 07:48:05', '2021-06-04 07:48:05', 3, 6, 5),
(26, 'Vans x NASA Oldskool Space Voyager \"Firecracker\"', 'Vans x NASA Oldskool Space Voyager \"Firecracker\"', '<p>Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Cras ultricies ligula sed magna dictum porta.&nbsp;</p><p><br></p><p>- Sneakers bermotif kotak untuk daily look dengan kesan OG</p><p>- Kombinasi warna hitam dan putih</p><p>- Upper tekstil</p><p>- Insole sintetis</p><p>- Rubber outsole</p><p><br></p><p>Available Size (38-42)</p>', '2199000', 4, 'anklebitter.id_1622367075913980.jpg', '2021-06-04 07:48:54', '2021-06-04 07:48:54', 3, 6, 5),
(27, 'Onitsuka Tiger Mexico 66 Black Caravan', 'Onitsuka Tiger Mexico 66 Black Caravan', '<p>Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Cras ultricies ligula sed magna dictum porta.&nbsp;</p><p><br></p><p>- Sneakers bermotif kotak untuk daily look dengan kesan OG</p><p>- Kombinasi warna hitam dan putih</p><p>- Upper tekstil</p><p>- Insole sintetis</p><p>- Rubber outsole</p><p><br></p><p>Available Size (38-42)</p>', '2499000', 3, 'anklebitter.id_1622367092424712.jpg', '2021-06-04 07:49:42', '2021-06-04 07:49:42', 3, 9, 5),
(28, 'Onitsuka Tiger Mexico 66 Leather Birch Green Red Yellow', 'Onitsuka Tiger Mexico 66 Leather Birch Green Red Yellow', '<p>Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Cras ultricies ligula sed magna dictum porta.&nbsp;</p><p><br></p><p>- Sneakers bermotif kotak untuk daily look dengan kesan OG</p><p>- Kombinasi warna hitam dan putih</p><p>- Upper tekstil</p><p>- Insole sintetis</p><p>- Rubber outsole</p><p><br></p><p>Available Size (38-42)</p>', '2399000', 0, 'anklebitter.id_1622367111175799.jpg', '2021-06-04 07:50:27', '2021-06-04 07:50:27', 3, 9, 5),
(29, 'Vans Oldskool Flame Cut', 'Vans Oldskool Flame Cut', '<p>Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Cras ultricies ligula sed magna dictum porta.&nbsp;</p><p><br></p><p>- Sneakers bermotif kotak untuk daily look dengan kesan OG</p><p>- Kombinasi warna hitam dan putih</p><p>- Upper tekstil</p><p>- Insole sintetis</p><p>- Rubber outsole</p><p><br></p><p>Available Size (38-42)</p>', '1299000', 5, 'anklebitter.id_1622367124741387.jpg', '2021-06-04 07:53:27', '2021-06-04 07:53:27', 3, 6, 5),
(30, 'Vans Oldskool Black', 'Vans Oldskool Black', '<p>Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Cras ultricies ligula sed magna dictum porta.&nbsp;</p><p><br></p><p>- Sneakers bermotif kotak untuk daily look dengan kesan OG</p><p>- Kombinasi warna hitam dan putih</p><p>- Upper tekstil</p><p>- Insole sintetis</p><p>- Rubber outsole</p><p><br></p><p>Available Size (38-42)</p>', '649000', 21, 'anklebitter.id_1622367234089564.jpg', '2021-06-04 07:54:32', '2021-06-04 07:54:32', 3, 6, 5),
(31, 'Vans Oldskool Black Hi', 'Vans Oldskool Black Hi', '<p>Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Cras ultricies ligula sed magna dictum porta.&nbsp;</p><p><br></p><p>- Sneakers bermotif kotak untuk daily look dengan kesan OG</p><p>- Kombinasi warna hitam dan putih</p><p>- Upper tekstil</p><p>- Insole sintetis</p><p>- Rubber outsole</p><p><br></p><p>Available Size (38-42)</p>', '669000', 17, 'anklebitter.id_1622367219670288.jpg', '2021-06-04 07:55:51', '2021-06-04 07:55:51', 3, 6, 5),
(32, 'Thrasher Hometown Ribbon S/S Tee Black', 'Thrasher Hometown Ribbon S/S Tee Black', '<p><span style=\"color: rgb(53, 51, 47); font-family: ProximaNova-Semibold, Helvetica, Roboto, Arial, sans-serif; font-size: 13px;\">What started out as a monthly skateboarding magazine, Thrasher - founded in January 1981 by Kevin Thatcher, Eric Swenson, and Fausto Vitello - has held impressive influence over skate culture.&nbsp;</span></p><p><font color=\"#35332f\" face=\"ProximaNova-Semibold, Helvetica, Roboto, Arial, sans-serif\"><span style=\"font-size: 13px;\">Available Size (S-XL)</span></font><br><br></p>', '549000', 9, '40-BM135EI051013-HometownRibbonS-STee-Black_5_800x.jpg', '2021-06-04 07:58:05', '2021-06-04 07:58:05', 1, 7, 5),
(33, 'Thrasher Gonz SS Black', 'Thrasher Gonz SS Black', '<p>Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Cras ultricies ligula sed magna dictum porta.&nbsp;</p><p><br></p><p>- Sneakers bermotif kotak untuk daily look dengan kesan OG</p><p>- Kombinasi warna hitam dan putih</p><p>- Upper tekstil</p><p>- Insole sintetis</p><p>- Rubber outsole</p><p><br></p><p>Available Size (M-XL)</p><p><br></p>', '559000', 4, '04-GONS-BLACK_52_800x.jpg', '2021-06-04 08:00:20', '2021-06-04 08:00:20', 1, 7, 5),
(34, 'Thrasher Flame Satin Coach Jacket', 'Thrasher Flame Satin Coach Jacket', '<p>Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Cras ultricies ligula sed magna dictum porta.&nbsp;</p><p><br></p><p>All Size</p><p><br></p>', '1699000', 3, '46-BM123EG022012-FlameSatinCoachJacket-Black_1_800x.jpg', '2021-06-04 08:03:00', '2021-06-04 08:03:00', 1, 7, 5),
(35, 'Thrasher Flame Waist Bag', 'Thrasher Flame Waist Bag', '<p>Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Cras ultricies ligula sed magna dictum porta.&nbsp;</p><p><br></p>', '949000', 2, '62-BM151EK181010-FlameWaistBag-Black_5_800x.jpg', '2021-06-04 08:03:56', '2021-06-04 08:03:56', 2, 7, 5),
(36, 'Thrasher Still Watchin Old Timer Hat Black', 'Thrasher Still Watchin Old Timer Hat Black', '<p>Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Cras ultricies ligula sed magna dictum porta.&nbsp;</p><p><br></p>', '549000', 1, '10-STILWATCCHINOLDTIMERHAT-BLACK_53_800x.jpg', '2021-06-04 08:05:20', '2021-06-04 08:05:20', 2, 7, 5),
(37, 'Paris Saint-Germain Heritage86', 'Paris Saint-Germain Heritage86', '<p>The Paris Saint-Germain Heritage86 Hat keeps you comfortably covered all day while letting everyone know who you support. A classic 6-panel design delivers a timeless look, while an adjustable strap offers the perfect fit.</p><p><br></p><ul><li>Colour Shown: Midnight Navy/University Red</li><li>Style: DH2394-410</li></ul>', '299000', 7, 'paris-saint-germain-heritage86-hat-wW75JC.jpg', '2021-06-04 08:08:03', '2021-06-04 08:08:03', 2, 1, 5),
(38, 'Nike Sportswear', 'Nike Sportswear', '<p>The Nike Sportswear Backpack is a new spin on an old classic. Its durable design features two large compartments and two external pockets for small-item storage, while the padded shoulder straps offer supportive comfort.</p><p><br></p><ul><li>Colour Shown: Black/Black/White</li><li>Style: BA5876-082</li></ul>', '449000', 6, 'sportswear-backpack-qx2qfM.jpg', '2021-06-04 08:10:36', '2021-06-04 08:10:36', 2, 1, 5),
(39, 'Sepatu Sport Adidas 2021', 'Sport Adidas 2021', '<p>Tersedia untuk jenis ukuran : </p><ul><li>39</li><li>40</li><li>41</li><li>42</li><li>43</li><li>44</li></ul>', '50000', 3, 'default.png', '2021-06-04 21:49:38', '2021-06-04 21:49:38', 3, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rekening_pembayaran`
--

CREATE TABLE `rekening_pembayaran` (
  `id_rekening_pembayaran` int(11) NOT NULL,
  `nama_rekening` varchar(45) NOT NULL,
  `bank` varchar(45) NOT NULL,
  `nomor_rekening` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rekening_pembayaran`
--

INSERT INTO `rekening_pembayaran` (`id_rekening_pembayaran`, `nama_rekening`, `bank`, `nomor_rekening`) VALUES
(1, 'Alana Fawwaz Ghaly', 'BCA', '341225001837'),
(3, 'PT. Anklebitter Fashionista', 'Mandiri', '10410077822387');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role` enum('admin','customer') DEFAULT NULL,
  `foto` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `email`, `password`, `role`, `foto`) VALUES
(1, 'Fariz Fahmi Faturachmad', 'farizfahmi674@student.ub.ac.id', '827ccb0eea8a706c4c34a16891f84e7b', 'admin', 'fariz.png'),
(2, 'Bernardus Angelo Johan Fernandy', 'lilo.fernandi87@student.ub.ac.id', 'e10adc3949ba59abbe56e057f20f883e', 'admin', 'lilo.png'),
(3, 'Rafli Arizal Rifandi', 'rafliarizal14@student.ub.ac.id', 'fcea920f7412b5da7be0cf42b8c93759', 'admin', 'rafli.png'),
(5, 'Rully Afrizal Alwin', 'rullyafrizal@student.ub.ac.id', '32e30f3bfc127ca25fb6cfcb97d0ecee', 'admin', 'rully.png'),
(6, 'Auriga Daffa Fernanda', 'aurigadaffa@student.ub.ac.id', '827ccb0eea8a706c4c34a16891f84e7b', 'admin', 'daffa.png'),
(13, 'Customer Pertama', 'customer1@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'customer', ''),
(14, 'Rully Afrizal', 'rully@gmail.com', '32e30f3bfc127ca25fb6cfcb97d0ecee', 'customer', NULL),
(15, 'Rully Afrizal', 'rully1@gmail.com', '32e30f3bfc127ca25fb6cfcb97d0ecee', 'customer', NULL),
(16, 'Haris Jaya', 'harisjayaa@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'customer', NULL),
(17, 'Fariz Fahmi', 'fariz@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'customer', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang_order`
--
ALTER TABLE `barang_order`
  ADD PRIMARY KEY (`id_barang_order`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_order` (`id_order`);

--
-- Indexes for table `brand_produk`
--
ALTER TABLE `brand_produk`
  ADD PRIMARY KEY (`id_brand_produk`);

--
-- Indexes for table `bukti_pembayaran`
--
ALTER TABLE `bukti_pembayaran`
  ADD PRIMARY KEY (`id_bukti_pembayaran`),
  ADD KEY `id_order` (`id_order`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `kategori_produk`
--
ALTER TABLE `kategori_produk`
  ADD PRIMARY KEY (`id_kategori_produk`);

--
-- Indexes for table `keranjang_belanja`
--
ALTER TABLE `keranjang_belanja`
  ADD PRIMARY KEY (`id_keranjang_belanja`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `relasi_produk` (`id_produk`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_rekening_pembayaran` (`id_rekening_pembayaran`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_brand_produk` (`id_brand_produk`),
  ADD KEY `id_kategori_produk` (`id_kategori_produk`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `rekening_pembayaran`
--
ALTER TABLE `rekening_pembayaran`
  ADD PRIMARY KEY (`id_rekening_pembayaran`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang_order`
--
ALTER TABLE `barang_order`
  MODIFY `id_barang_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `brand_produk`
--
ALTER TABLE `brand_produk`
  MODIFY `id_brand_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `bukti_pembayaran`
--
ALTER TABLE `bukti_pembayaran`
  MODIFY `id_bukti_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `kategori_produk`
--
ALTER TABLE `kategori_produk`
  MODIFY `id_kategori_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `keranjang_belanja`
--
ALTER TABLE `keranjang_belanja`
  MODIFY `id_keranjang_belanja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `rekening_pembayaran`
--
ALTER TABLE `rekening_pembayaran`
  MODIFY `id_rekening_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang_order`
--
ALTER TABLE `barang_order`
  ADD CONSTRAINT `relasi_orders` FOREIGN KEY (`id_order`) REFERENCES `order` (`id_order`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relasi_products` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bukti_pembayaran`
--
ALTER TABLE `bukti_pembayaran`
  ADD CONSTRAINT `relasi_order` FOREIGN KEY (`id_order`) REFERENCES `order` (`id_order`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `relasi_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keranjang_belanja`
--
ALTER TABLE `keranjang_belanja`
  ADD CONSTRAINT `relasi_customers` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relasi_produk` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `relasi_customer` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relasi_rekening` FOREIGN KEY (`id_rekening_pembayaran`) REFERENCES `rekening_pembayaran` (`id_rekening_pembayaran`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `relasi_brand_produk` FOREIGN KEY (`id_brand_produk`) REFERENCES `brand_produk` (`id_brand_produk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relasi_kategori_produk` FOREIGN KEY (`id_kategori_produk`) REFERENCES `kategori_produk` (`id_kategori_produk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relasi_user_produk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
