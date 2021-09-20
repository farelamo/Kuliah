-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Sep 2021 pada 04.23
-- Versi server: 10.4.20-MariaDB
-- Versi PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `latihan_fulltext`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `wisata_indonesia`
--

CREATE TABLE `wisata_indonesia` (
  `id_wisata` int(11) NOT NULL,
  `tempat_wisata` varchar(225) NOT NULL,
  `deskripsi_wisata` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `wisata_indonesia`
--

INSERT INTO `wisata_indonesia` (`id_wisata`, `tempat_wisata`, `deskripsi_wisata`) VALUES
(1, 'bahari', 'ada di lamongan'),
(2, 'KBS', 'ada di surabaya'),
(3, 'kebun sari', 'ada di sidoarjo'),
(4, 'kebun apel', 'ada di pandaan'),
(5, 'kebun apel', 'ada di malang'),
(6, 'bonbin malang', 'ada di malang'),
(7, 'tambak pecabean', 'ada di sidoarjo'),
(8, 'pantai selatan', 'ada di yogyakarta'),
(9, 'bonbin khusus komodo', 'ada di pulau komodo'),
(10, 'pantai bali', 'ada di bali');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `wisata_indonesia`
--
ALTER TABLE `wisata_indonesia`
  ADD PRIMARY KEY (`id_wisata`);
ALTER TABLE `wisata_indonesia` ADD FULLTEXT KEY `cari_kata` (`tempat_wisata`,`deskripsi_wisata`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `wisata_indonesia`
--
ALTER TABLE `wisata_indonesia`
  MODIFY `id_wisata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
