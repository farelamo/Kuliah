-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Sep 2021 pada 13.12
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
-- Database: `data_universitas`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_data` (IN `nims` VARCHAR(3), IN `namas` VARCHAR(225), IN `dosen_ids` INT)  BEGIN
	INSERT INTO mahasiswa (nim,nama,dosen_id) VALUES (nims,namas,dosen_ids);
    
	SELECT*FROM mahasiswa;
END$$

--
-- Fungsi
--
CREATE DEFINER=`root`@`localhost` FUNCTION `mhs` (`nilai` VARCHAR(3)) RETURNS VARCHAR(3) CHARSET utf8mb4 BEGIN

DECLARE result varchar(3);

IF nilai >=81 && nilai <= 100 THEN SET result = 'A';

ELSEIF nilai >=76 AND nilai < 81 THEN SET result = 'B+';

ELSEIF nilai >=70  AND nilai < 76 THEN SET result = 'B';

ELSEIF nilai >=61  AND nilai < 70 THEN SET result = 'C+';

ELSEIF nilai >=56  AND nilai < 61 THEN SET result = 'C';

ELSEIF nilai >=51  AND nilai < 56 THEN SET result = 'D+';

ELSEIF nilai >=45  AND nilai < 51 THEN SET result = 'D';

ELSE SET result = 'E';

END IF;

RETURN result;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `id` int(11) NOT NULL,
  `nama_dosen` varchar(225) NOT NULL,
  `tanggal_masuk` date DEFAULT NULL,
  `jml_mahasiswa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`id`, `nama_dosen`, `tanggal_masuk`, `jml_mahasiswa`) VALUES
(1, 'bayu wicaksono', '2021-09-05', 1),
(2, 'aaaa', '2021-09-04', 1),
(3, 'aaaa', '2021-09-05', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `nim` varchar(3) NOT NULL,
  `nama` varchar(225) NOT NULL,
  `dosen_id` int(11) NOT NULL,
  `nilai` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nim`, `nama`, `dosen_id`, `nilai`) VALUES
(1, '001', 'fariz', 1, 100),
(2, '002', 'fahmi', 1, 80),
(4, '003', 'faturachmad', 1, 70),
(6, '005', 'Kirana', 1, 20);

--
-- Trigger `mahasiswa`
--
DELIMITER $$
CREATE TRIGGER `update_trigger` AFTER UPDATE ON `mahasiswa` FOR EACH ROW BEGIN 
	UPDATE dosen
    SET jml_mahasiswa = (SELECT count(NEW.dosen_id) FROM mahasiswa
    WHERE dosen.id = mahasiswa.dosen_id);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_kedua`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_kedua` (
`nim` varchar(3)
,`nama` varchar(225)
,`nilai` int(4)
,`nama_dosen` varchar(225)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_pertama`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_pertama` (
`nim` varchar(3)
,`nama` varchar(225)
,`nilai` int(4)
,`nama_dosen` varchar(225)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `view_kedua`
--
DROP TABLE IF EXISTS `view_kedua`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_kedua`  AS SELECT `view_pertama`.`nim` AS `nim`, `view_pertama`.`nama` AS `nama`, `view_pertama`.`nilai` AS `nilai`, `view_pertama`.`nama_dosen` AS `nama_dosen` FROM `view_pertama` WHERE `view_pertama`.`nilai` = (select max(`view_pertama`.`nilai`) from `view_pertama`) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_pertama`
--
DROP TABLE IF EXISTS `view_pertama`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_pertama`  AS SELECT `mhs`.`nim` AS `nim`, `mhs`.`nama` AS `nama`, `mhs`.`nilai` AS `nilai`, `dsn`.`nama_dosen` AS `nama_dosen` FROM (`mahasiswa` `mhs` join `dosen` `dsn`) WHERE `mhs`.`dosen_id` = `dsn`.`id` ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `search_key` (`nama_dosen`,`jml_mahasiswa`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dosen_id` (`dosen_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `dosen_id` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
