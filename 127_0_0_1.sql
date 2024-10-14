-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2024 at 10:22 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dataobat`
--
CREATE DATABASE IF NOT EXISTS `dataobat` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dataobat`;

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id` int(11) NOT NULL,
  `obat_id` int(11) NOT NULL,
  `komentar` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `obatobatan`
--

CREATE TABLE `obatobatan` (
  `kode_obat` int(11) NOT NULL,
  `nama_obat` varchar(255) NOT NULL,
  `jenis_obat` varchar(255) NOT NULL,
  `pembuat` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `obatobatan`
--

INSERT INTO `obatobatan` (`kode_obat`, `nama_obat`, `jenis_obat`, `pembuat`, `foto`) VALUES
(1, 'paracetamol', 'pil', 'kimia farma', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'ananda123', '$2y$10$PKCfWqpA4Sv5MDFONCgY3.UWw/vSVPIT8YUEQ.P8D8k6NSPXGfB4C'),
(3, 'ananda123', '$2y$10$yLuKhse789nXhVzd7W1BmeIPId1uylzU6jqP5wq5rOK1RFxktmd0q'),
(4, 'diyan', '$2y$10$UQa02FbS1AKq.4PMhMi0EOaQO7nJJNUrGe2P0arv0UJiFZjjxHW4e'),
(5, 'diyan', '$2y$10$W85P/J40lnddajIkQ/b6HOZqNty.7kPUYiJgmszUpfVd1moSo6xRS'),
(6, 'diyan', '$2y$10$4r5qUTPY7tjzt9yIHMvHm.FIDvDMlmFF29aZvWQfFz9Y2ORNE1MZa'),
(7, 'didik', '$2y$10$4iXmxaFIo6CZ5PsPC6HTYOciuJTOXSHKG/wXQjY40LtqGAAb/P2Hm'),
(8, 'kita', '$2y$10$n7ga5c/v9uT4.eusD28ZhO6id1..uUIuiNmB8ObrGrEWfyU5MUbBi'),
(9, 'kiko', '$2y$10$JiJQOFbryjY5JszQMK1QeONQQlSRqgdoiANN5BHAGTH4jkXl4zw26'),
(10, 'siti', '$2y$10$zPR1rxXkF8xlIYFxuknIBOGXYQg9srAyyDFaoExhVI9iJvkwXN7XS'),
(11, 'aurora', '$2y$10$NXA2KCMhSH2ESsTEg2P9/OFu2ap.IpHnaCOnqAV2pNqudw1KIbA8m'),
(12, 'ima', '$2y$10$iTWiFGLiZrHqQ4kDO9pXP.wdW8GTV2xkNHZpG.IYlA8PEIq6tGSbe'),
(13, 'ima', '$2y$10$NNsMBcZ30iv0MdoabMbNIuJCpvO7qa1yXRizhal5sHyqJfUuPyt4m'),
(14, 'ima', '$2y$10$hDEEGzaPX3iwLytJPoJo6ehQy.nTTTbx3WQmRPHEluSjgOMma3l7K');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `obatobatan`
--
ALTER TABLE `obatobatan`
  ADD PRIMARY KEY (`kode_obat`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `obatobatan`
--
ALTER TABLE `obatobatan`
  MODIFY `kode_obat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Database: `diyan`
--
CREATE DATABASE IF NOT EXISTS `diyan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `diyan`;

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id`, `username`, `email`, `password`) VALUES
(1, 'kasa', '', '$2y$10$iVx38G34xrUKdMEblPzH4e5b9.23M74Umx9uM8Vyf2/CoSKFwUjaG'),
(2, 'ima', '', '$2y$10$VaKsfl6pdhaR2Si8lpxjceCpNgyOCz3iJwb8DxgYZvsZIZpFOGGSe'),
(3, 'ima', '', '$2y$10$ePcmydFqqwJb5Ef83JPbC.JeZhHuvmW3EkG8gQzZgkt6j8Yvvx.zq'),
(4, 'nelvia', '', '$2y$10$TQnK.45gumCvLuIEQjD/p.Uk8dnzYj4cKfAu9p9dZKXmIGSD1.stm'),
(5, 'salsa', '', '$2y$10$XBiO1BNUe9KYCCrrpeOfM.9be6nqs5AcZ1NLcvuON7iT3k4gZHa/m'),
(6, 'kekey', '', '$2y$10$.PgmKyCwn1XcUqkzC297EeCP9/IUK8l/v9Msh3X4vFwatzt1nFq9u'),
(7, 'abah', '', '$2y$10$GvlfPjoGmDVDTn7Sf1orBeJHLeSdMDpmLlKSvQex9J.LCAE.N9JLK');

-- --------------------------------------------------------

--
-- Table structure for table `apotek`
--

CREATE TABLE `apotek` (
  `kode_obat` varchar(11) NOT NULL,
  `nama_obat` varchar(255) NOT NULL,
  `jenis_obat` varchar(255) NOT NULL,
  `pembuat_obat` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `harga` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `apotek`
--

INSERT INTO `apotek` (`kode_obat`, `nama_obat`, `jenis_obat`, `pembuat_obat`, `foto`, `harga`) VALUES
('2', 'panadol', 'pil', 'kimia farma', 'dr heart.jpg.jfif', 10000.00),
('3', 'panadol', 'sirup', 'apotek bali', 'tambah.jpeg', 20000.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `apotek`
--
ALTER TABLE `apotek`
  ADD PRIMARY KEY (`kode_obat`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Database: `galeri`
--
CREATE DATABASE IF NOT EXISTS `galeri` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `galeri`;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_album`
--

CREATE TABLE `gallery_album` (
  `AlbumID` int(11) NOT NULL,
  `NamaAlbum` varchar(255) NOT NULL,
  `Deskripsi` text NOT NULL,
  `TanggalDibuat` date NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gallery_album`
--

INSERT INTO `gallery_album` (`AlbumID`, `NamaAlbum`, `Deskripsi`, `TanggalDibuat`, `UserID`) VALUES
(6, 'kal', 'kumpulan kalung', '2024-10-08', 0),
(7, 'anting', 'kumpulan anting', '2024-10-08', 0),
(8, 'pandora', 'gelang pandora', '2024-10-08', 0),
(10, 'Gelang', 'Kumpulan DIY gelang', '2024-10-09', 0);

-- --------------------------------------------------------

--
-- Table structure for table `gallery_foto`
--

CREATE TABLE `gallery_foto` (
  `FotoID` int(11) NOT NULL,
  `JudulFoto` varchar(255) NOT NULL,
  `DeskripsiFoto` text NOT NULL,
  `TanggalUnggah` date NOT NULL,
  `LokasiFile` varchar(255) NOT NULL,
  `AlbumID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gallery_foto`
--

INSERT INTO `gallery_foto` (`FotoID`, `JudulFoto`, `DeskripsiFoto`, `TanggalUnggah`, `LokasiFile`, `AlbumID`, `UserID`) VALUES
(0, 'diy', 'kreasi gelang', '2024-10-10', 'images/gel.jpg', 10, 1),
(11, 'Gelang manik kerang', 'DIY gelang manik-manik', '2024-10-09', 'images/Cuddorable Mixed Bear Butterfly Starfish Sea Beaded Bracelet - Etsy Canada.jfif', 10, 1),
(12, 'anting manik', 'diy anting dari manik-manik', '2024-10-09', 'images/1c94c286-fdf3-49a1-9d04-9b71b6846ce6.jfif', 7, 1),
(13, 'anting-anting', 'anting dari mote ', '2024-10-09', 'images/TERPERCAYA, SEGERA WA 085742778390 Gelang Manik Aesthetic__Klik https__wa_me_6285742778390.jfif', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `gallery_komentarfoto`
--

CREATE TABLE `gallery_komentarfoto` (
  `KomentarID` int(11) NOT NULL,
  `FotoID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `IsiKomentar` text NOT NULL,
  `TanggalKomentar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gallery_komentarfoto`
--

INSERT INTO `gallery_komentarfoto` (`KomentarID`, `FotoID`, `UserID`, `IsiKomentar`, `TanggalKomentar`) VALUES
(0, 4, 1, 'wah good', '2024-10-08'),
(0, 2, 1, 'halo mamii', '2024-10-08'),
(0, 2, 1, 'neneknya lucuk', '2024-10-08'),
(0, 6, 1, 'mmmm', '2024-10-08'),
(0, 6, 1, 'bagus kak', '2024-10-08'),
(0, 12, 1, 'dian cantik', '2024-10-09'),
(0, 12, 1, 'spill onlne shope nya dong\r\n', '2024-10-09'),
(0, 12, 0, '', '0000-00-00'),
(0, 12, 1, 'akakk\r\n', '2024-10-09'),
(0, 12, 1, 'manisnyee senyuman akakk~~\r\nmana adeeee =\'\'=', '2024-10-09'),
(0, 11, 1, 'catik bangett', '2024-10-10'),
(0, 0, 1, 'spil keranjang nya kak\r\n', '2024-10-10'),
(0, 12, 1, 'cantik banget kkakkk\r\n', '2024-10-10');

-- --------------------------------------------------------

--
-- Table structure for table `gallery_likefoto`
--

CREATE TABLE `gallery_likefoto` (
  `LikeID` int(11) NOT NULL,
  `FotoID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `TanggalLike` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gallery_likefoto`
--

INSERT INTO `gallery_likefoto` (`LikeID`, `FotoID`, `UserID`, `TanggalLike`) VALUES
(0, 3, 1, '2024-10-08'),
(0, 2, 1, '2024-10-08'),
(0, 4, 1, '2024-10-08'),
(0, 8, 1, '2024-10-08'),
(0, 6, 1, '2024-10-08'),
(0, 5, 1, '2024-10-08'),
(0, 11, 1, '0000-00-00'),
(0, 11, 1, '0000-00-00'),
(0, 0, 1, '0000-00-00'),
(0, 12, 1, '0000-00-00'),
(0, 12, 1, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Nama_Lengkap` varchar(255) NOT NULL,
  `Alamat` text NOT NULL,
  `role` enum('user','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Username`, `Password`, `Email`, `Nama_Lengkap`, `Alamat`, `role`) VALUES
(0, 'binar', '$2y$10$Z86Qwchs9hwoIG6r8jkl1OzeXGWFE/YxGZEXf/ZeI3L1hdIQW0UN.', 'diantynur9@gmail.com', 'bintang mahreno', 'kepulauan riau\r\nbatu besar, nongsa', 'user'),
(1, 'kinara', '$2y$10$GIE1JGb1EV0606UM0tdP5.eJSXJn2Hbaz/yvTBxYG26yV7q.JSy.q', 'diantynur9@gmail.com', 'bintang mahreno', 'kepulauan riau\r\nbatu besar, nongsa', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gallery_album`
--
ALTER TABLE `gallery_album`
  ADD PRIMARY KEY (`AlbumID`);

--
-- Indexes for table `gallery_foto`
--
ALTER TABLE `gallery_foto`
  ADD PRIMARY KEY (`FotoID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);
--
-- Database: `galerifoto`
--
CREATE DATABASE IF NOT EXISTS `galerifoto` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `galerifoto`;

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `AlbumID` int(11) NOT NULL,
  `NamaAlbum` varchar(255) NOT NULL,
  `Deskripsi` text NOT NULL,
  `TanggalDibuat` date NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`AlbumID`, `NamaAlbum`, `Deskripsi`, `TanggalDibuat`, `UserID`) VALUES
(0, 'gelang', 'kumpulan aksesors gelang', '2024-10-09', 1),
(0, 'mmll', 'll', '2024-10-10', 1),
(0, 'd', 'ss', '2024-10-10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `foto`
--

CREATE TABLE `foto` (
  `FotoID` int(11) NOT NULL,
  `JudulFoto` varchar(255) NOT NULL,
  `DeskripsiFoto` text NOT NULL,
  `TanggalUnggah` date NOT NULL,
  `LokasiFile` varchar(255) NOT NULL,
  `AlbumID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foto`
--

INSERT INTO `foto` (`FotoID`, `JudulFoto`, `DeskripsiFoto`, `TanggalUnggah`, `LokasiFile`, `AlbumID`, `UserID`) VALUES
(0, 'diy', 'l', '2024-10-10', '../images/gel.jpg', 0, 0),
(0, 'diy', 'm', '2024-10-10', '../images/lol.jpg', 0, 0),
(0, 'diy manik', 'mm', '2024-10-10', '../images/lol.jpg', 0, 0),
(0, 'b', 'ff', '2024-10-10', '../images/ll.jpg', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `komentarfoto`
--

CREATE TABLE `komentarfoto` (
  `KomentarID` int(11) NOT NULL,
  `FotoID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `IsiKomentar` text NOT NULL,
  `TanggalKomentar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likefoto`
--

CREATE TABLE `likefoto` (
  `LikeID` int(11) NOT NULL,
  `FotoID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `TanggalLike` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `NamaLengkap` varchar(255) NOT NULL,
  `Alamat` text NOT NULL,
  `Level` enum('admin','user') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Username`, `Password`, `Email`, `NamaLengkap`, `Alamat`, `Level`) VALUES
(0, 'binar', '$2y$10$dxJ/mFs31cF9Zrqy/lqEhezansJwbQ4baFFdGgI3rjiZoqAi./Kz.', 'binar@gmail.com', 'binar candy', 'palangkaraya', 'admin'),
(0, 'binar', '$2y$10$9EPL5Txwg.owOymWjM/.pOTzIfAw2qwseBwDFQUDlc3RMvEg0sF7e', 'binar@gmail.com', 'binar candy', 'palangkaraya', 'admin'),
(0, 'koko', '$2y$10$491xLx9Y4UhDqdzEMls5p.r.OKlEB/ndGT5/0.LcINOW2CaLljHdW', 'koko@gmail.com', 'kokonoi', 'jepang', 'user'),
(0, 'koko', '$2y$10$45alS5oGakPNh8/YqkHAf.AXAkBk6DX4bu/.aZDKInIexg4pp1W4C', 'koko@gmail.com', 'kokonoi', 'jepang', 'user'),
(0, 'dita', '$2y$10$5wQ5DSysxsk92uU5.pDm7.Boy4JkBmmFK1K2RWB/kT7pgwZ2YVV5q', 'dita@gmail.com', 'dita', 'dirumah', 'user'),
(0, 'ari', '$2y$10$YZfyZYiAV1jB.mxJpurpHuaXrRCzrgrqxmLBvkOZM6ZhZwkIlrT7K', 'ari@gmail.com', 'ariari', 'ari ari', 'user'),
(0, 'ari', '$2y$10$dXWW78.CnTpgSmjZ6QE.e.7bMAhKAl0YqAC.x95dO21Mgpu0LOyAa', 'ari@gmail.com', 'ariari', 'kkk', 'admin'),
(0, 'pia', '$2y$10$rZXf7AEpGYIBPCeacjbkGOvtQGim111TprRATttPtky.yi4/bYO7q', 'pia@gmail.com', 'piandr', 'bengkong', 'user'),
(0, 'pia', '$2y$10$xmvjQGGirVv9UH5hjDNnneiaXgTxAMmB4bpw.8EBedt1Nh2bTZ2t2', 'pia@gmail.com', 'piandr', 'bengkong', 'admin'),
(0, 'loly', '$2y$10$YlURQQkUQ9z5x1ME9DOGDedjx0bPdfwRo8/aEjtCvYl5xJq1.bzf.', 'loly@gmail.com', 'laura', 'nggaktau', 'admin'),
(0, 'vadel', '$2y$10$j3mN7YTVw5laFcBdmWqZmefpY88ueREjX7FbMNsd5qWAV1hIrAF9K', 'vadel@gmail.com', 'vadel badjideh', 'jalan mokondo', 'user'),
(0, 'nikmir', '$2y$10$9nPLqQcTmt3Icjk02pmgSuphJabIte2VoGz7i8F4P/LOyKZokqmBC', 'nikmir@gmail.com', 'Nikita Mirzani', 'dimana aja la', 'admin'),
(0, 'hanum', '$2y$10$YINAKOXjpNcs1LzB2XPB4OksYhs33N7kL39nQDlaGNgTSVwJN44x6', 'hanum@gmail.com', 'hanum', 'dd', 'user'),
(0, 'ying', '$2y$10$HN1OpHC9alYsf3rg2NjeL.JkVlT10yochBYRr0WnDH0yOoQFbv8.i', 'ying@gmail.com', 'ying ', 'sssssssss', 'admin'),
(0, 'yaya', '$2y$10$0HCeViieSlImImFQ2fHCYeX2g22Nl3BVMGk9o3CLZwDik0BIg175m', 'yaya@gmail.com', 'yaya', 'dssss', 'user'),
(0, 'ying', '$2y$10$rB7Hj6ngz7YHihO9cA9RRuQg2ffaumLAnmfeyXkIio0Dip600G/Ay', 'ying@gmail.com', 'ying ', 'sssssssss', 'admin'),
(0, 'jija', '$2y$10$xLqrvxQ4JlWZ.LiD7hoWvePxRKkMWmGQCB8Fi18d7CdXWm0LO8Ere', 'oja@gmail.com', 'ajizah', 'ssss', 'admin');
--
-- Database: `gallery`
--
CREATE DATABASE IF NOT EXISTS `gallery` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gallery`;

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `AlbumID` int(11) NOT NULL,
  `NamaAlbum` varchar(255) NOT NULL,
  `Deskripsi` text NOT NULL,
  `TanggalDibuat` date NOT NULL,
  `UserID` int(11) NOT NULL,
  `Uploader` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`AlbumID`, `NamaAlbum`, `Deskripsi`, `TanggalDibuat`, `UserID`, `Uploader`) VALUES
(15, 'Kalung', 'Kumpulan DIY Kalung', '2024-10-13', 18, 'admin bintang'),
(16, 'Anting', 'Kumpulan DIY Anting-anting', '2024-10-13', 18, 'admin bintang'),
(17, 'Cincin', 'Kumpulan DIY Cincin', '2024-10-13', 18, 'admin bintang');

-- --------------------------------------------------------

--
-- Table structure for table `foto`
--

CREATE TABLE `foto` (
  `FotoID` int(11) NOT NULL,
  `JudulFoto` varchar(255) NOT NULL,
  `DeskripsiFoto` text NOT NULL,
  `TanggalUnggah` date NOT NULL,
  `LokasiFile` varchar(255) NOT NULL,
  `AlbumID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Uploader` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foto`
--

INSERT INTO `foto` (`FotoID`, `JudulFoto`, `DeskripsiFoto`, `TanggalUnggah`, `LokasiFile`, `AlbumID`, `UserID`, `Uploader`) VALUES
(24, 'DIY Anting Bunga', 'Ide kreasi membuat anting ', '2024-10-13', 'images/anting bunga.jpg', 16, 18, 'admin bintang'),
(25, 'Kreasi Cincin ', 'DIY Cincin dari Mote Pasir', '2024-10-13', 'images/cin.jpg', 17, 18, 'admin bintang'),
(27, 'Kalung Liontin Love ', 'DIY Kalung dari Batu Alam dan Tali Giok', '2024-10-13', 'images/kalungbatualam.jpg', 15, 18, 'admin bintang');

-- --------------------------------------------------------

--
-- Table structure for table `komentarfoto`
--

CREATE TABLE `komentarfoto` (
  `KomentarID` int(11) NOT NULL,
  `FotoID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `IsiKomentar` text NOT NULL,
  `TanggalKomentar` date NOT NULL,
  `NamaPengomentar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `komentarfoto`
--

INSERT INTO `komentarfoto` (`KomentarID`, `FotoID`, `UserID`, `IsiKomentar`, `TanggalKomentar`, `NamaPengomentar`) VALUES
(1, 1, 1, 'CANTIK BANGET KAK\r\n', '2024-10-10', ''),
(2, 4, 2, 'te', '2024-10-10', ''),
(3, 7, 2, 'cantik bangett', '2024-10-10', ''),
(4, 7, 4, 'mmmm', '2024-10-11', ''),
(5, 7, 4, 'cantikk', '2024-10-11', ''),
(6, 11, 0, 'd', '2024-10-11', ''),
(8, 16, 0, 'spil keranjang kakk', '2024-10-11', 'admin nayanika'),
(11, 16, 0, 'mau kakkk', '2024-10-11', 'admin nayanika'),
(12, 16, 0, 'cuakepp bangetttt', '2024-10-11', 'admin nayanika'),
(13, 19, 0, 'ddd', '2024-10-11', 'admin nayanika'),
(15, 20, 0, 'hai', '2024-10-12', 'admin bintang'),
(16, 20, 0, 'hai', '2024-10-12', 'admin bintang'),
(17, 20, 0, 'hai', '2024-10-12', 'admin bintang'),
(18, 22, 0, 'tutorial nya kak', '2024-10-13', 'user jono'),
(19, 27, 0, 'beli diman akaj?', '2024-10-14', 'user jono');

-- --------------------------------------------------------

--
-- Table structure for table `likefoto`
--

CREATE TABLE `likefoto` (
  `LikeID` int(11) NOT NULL,
  `FotoID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `TanggalLike` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likefoto`
--

INSERT INTO `likefoto` (`LikeID`, `FotoID`, `UserID`, `TanggalLike`) VALUES
(1, 1, 1, '0000-00-00'),
(2, 1, 1, '0000-00-00'),
(3, 4, 2, '0000-00-00'),
(4, 4, 2, '0000-00-00'),
(5, 6, 2, '0000-00-00'),
(6, 6, 2, '0000-00-00'),
(7, 6, 2, '0000-00-00'),
(8, 6, 2, '0000-00-00'),
(9, 6, 2, '0000-00-00'),
(10, 6, 2, '0000-00-00'),
(11, 6, 2, '0000-00-00'),
(21, 15, 0, '0000-00-00'),
(22, 16, 0, '0000-00-00'),
(23, 19, 0, '0000-00-00'),
(24, 20, 0, '0000-00-00'),
(25, 20, 0, '0000-00-00'),
(26, 22, 0, '0000-00-00'),
(27, 22, 0, '0000-00-00'),
(28, 22, 0, '0000-00-00'),
(31, 27, 0, '0000-00-00'),
(46, 24, 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `NamaLengkap` varchar(255) NOT NULL,
  `Alamat` text NOT NULL,
  `Level` enum('user','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Username`, `Password`, `Email`, `NamaLengkap`, `Alamat`, `Level`) VALUES
(18, 'admin', '$2y$10$HqZ/aSpbi4bAq2vvL7TuC.6xWKysAnaavJJasemzySVvmf.kPIT8e', 'diantynur9@gmail.com', 'bintang mahreno', 'kepulauan riau\r\nbatu besar, nongsa', 'admin'),
(19, 'user', '$2y$10$IJbq7Fp5uhPfoSuSP19e7.55j435LKIkIHJIXDTafcXnnjdDCnTfq', 'jono@gmail.com', 'jononi', 'depok', 'user'),
(20, 'admin', '$2y$10$Vv9SRYrSWDm.0hWorAiuFO/ebG11bwwlby71iD3EQdGZivwiMSLYC', 'jaka@gmail.com', 'jaka tarub', 'jawa', 'admin'),
(21, 'user', '$2y$10$1V0gQ7WR37Z4Jo2cpkC1fesber1aSH4tS6mSKr4g5JtEPtHWyFcN.', 'ros@gmail.com', 'rostina', 'belakang padang', 'user'),
(22, 'wa', '$2y$10$pOypjqbHbhIvmyO6wNrRru.nE573Mf1886xUuGEmyzDFLPqBluiB2', 'wa@gmail.com', 'wawan', 'cendana', 'user'),
(23, 'user', '$2y$10$.oaBTPisRvAM.F/RVhlhUeG35y2DMRd2kMDhue7oJC7wmhf4dCIba', 'rani@gmail.com', 'rani ranah', 'jakarta', 'user'),
(24, 'admin', '$2y$10$3ecaMHLy3n27IYhpEMQaqOWhZiEXnCDC4m1wQxp3nvhHcTMkIQCLG', 'rere@gmail.com', 'rere sunandar', 'depok', 'admin'),
(25, 'user', '$2y$10$3M6stAHFM5uXV1H546AzM.NJXys4p2gdpYE89PLxE7iBcS1wWDele', 'wee@gmail.com', 'weeeeeeeeeeeeeeeeeeeeeeeeeeeeee', 'weeeeeee', 'user'),
(26, 'user', '$2y$10$0qLpdxMkwp4/qdcGJoYpdOWzJiIbyd7khPSD2mw6WKhpE6XA0kpF2', 'lina@gmail.com', 'marlina', 'belitong', 'user'),
(27, 'user', '$2y$10$pLBalZEDn/1ozAst7kamVuZsMYIESxrhL1hJI6TlYugr74u/vFRLa', 'indro@gmail.com', 'indro', 'dki', 'user'),
(28, 'admin', '$2y$10$.r.TuX9CyAKNFNMj4V33Gu.7PyTn8ouFnB6g0ElMBmciq/u6ZxQ7O', 'dono@gmail.com', 'dono', 'dki juga', 'admin'),
(29, 'user', '$2y$10$p7JPd4QgKHta0eX0VSFp0eEVink3Q/2fvWbSBLPtyFe1ZHAZJwZiC', 'nanda@gmail.com', 'ananda', 'ameria 1', 'user'),
(30, 'admin', '$2y$10$OBMVKfNYnn0CBJEW.LeNQ.Plloc1BC0U.K5GsF5SbPqAPUQnKuQ1W', 'nur@gmail.com', 'nur azizah', 'kamel', 'admin'),
(31, 'user', '$2y$10$y2ND/Y9gB87K91gGHCC2leEl7psIgD4fimp6PlduIMIi0AJd0KCcm', 'toro@gmail.com', 'toro', 'we', 'user'),
(32, 'user', '$2y$10$a.mQ/pc.IXx7Jgu92g9bDunxHrUC09GQYh5uUY/a2qSR6CFxW5tx.', 'alex@gmail.com', 'alexander', 'sekolah', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`AlbumID`);

--
-- Indexes for table `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`FotoID`);

--
-- Indexes for table `komentarfoto`
--
ALTER TABLE `komentarfoto`
  ADD PRIMARY KEY (`KomentarID`);

--
-- Indexes for table `likefoto`
--
ALTER TABLE `likefoto`
  ADD PRIMARY KEY (`LikeID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `AlbumID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `foto`
--
ALTER TABLE `foto`
  MODIFY `FotoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `komentarfoto`
--
ALTER TABLE `komentarfoto`
  MODIFY `KomentarID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `likefoto`
--
ALTER TABLE `likefoto`
  MODIFY `LikeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- Database: `langka`
--
CREATE DATABASE IF NOT EXISTS `langka` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `langka`;

-- --------------------------------------------------------

--
-- Table structure for table `fauna`
--

CREATE TABLE `fauna` (
  `nama` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `spesies` varchar(255) NOT NULL,
  `habitat` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `kode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flora`
--

CREATE TABLE `flora` (
  `nama` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `spesies` varchar(255) NOT NULL,
  `habitat` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `kode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flora`
--

INSERT INTO `flora` (`nama`, `foto`, `spesies`, `habitat`, `deskripsi`, `kode`) VALUES
('AYAM', 'WhatsApp Image 2024-08-29 at 03.28.59.jpeg', 'reptil', 'kampung', 'dia ayam', 'a2'),
('ada', '6168039088708501135.jpg', 'lol', 'dde,mfcnjwx', 'mcimmmmmmmmm', 'o0'),
('fffd', '6237588941536608864-removebg-preview.png', 'ddd', 'qqqqqqqqqq', 'qqqqqq', 'r4'),
('jalak bali', '6168039088708501135.jpg', 'reptil', 'hutan', 'kkk', '0p'),
('entok', 'desain.png', 'ddd', 'hutan', 'pemalas', 'o0');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, '', '', '$2y$10$/ixbBPKEBVXfbRncFI.pJ.GWbrCXht00mxIh38yjYujsAfcL9LBSC'),
(2, 'yanti', 'yanti@gmail.com', '$2y$10$LiChWABDSu3dGDVbz0qIkukMluik63lEpJMvPFaBjQxJjMQJfEyxu'),
(3, 'yanti', 'yanti@gmail.com', '$2y$10$zaTzdHsdjicTTTt6Eva/SOFUmhinmHAfFhektpYtTs04ip9U9iQty'),
(4, 'yanti', 'yanti@gmail.com', '$2y$10$TRGxTVhyfZlptWIBZoJJZepr4lBVD65JbGIVoVgG5jqEv/4fG0amC'),
(5, 'aku', '', '$2y$10$.tMltJwRykFf5pBRvd4MIuqQG89XAJGkgHEcZY8ULertGyhzm0fju'),
(6, 'paladin', '', '$2y$10$K0OE2zVI1MYYdLLDVWBYbOAjmwyV6UppYMsVXHnMz1oceDMLAibA2'),
(7, 'makan', '', '$2y$10$eoIzYhajixiWdJI0m7EzAOw.MhfskK.tKnLoiFuYGKhwrAWnv0x0u'),
(8, 'cimi', '', '$2y$10$fiJ6RIVwhxxFu8Nv24hXg.6Gu7HCd3Us5mMh06KWCz9UB60pPLDl2'),
(9, 'lol', '', '$2y$10$gWV7iDpewojy7xI6xx3KQODj6A5xTpZogvJfAO87frrKu.3JVv5XW');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Database: `latihanukk`
--
CREATE DATABASE IF NOT EXISTS `latihanukk` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `latihanukk`;

-- --------------------------------------------------------

--
-- Table structure for table `bukuaku`
--

CREATE TABLE `bukuaku` (
  `kode` varchar(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `pengarang` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
--
-- Database: `nlvia`
--
CREATE DATABASE IF NOT EXISTS `nlvia` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `nlvia`;

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `kode_obat` int(11) NOT NULL,
  `nama_obat` varchar(255) NOT NULL,
  `jenis_obat` varchar(255) NOT NULL,
  `pembuat` varchar(255) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
(1, 'kiya', '', '$2y$10$oh6u5fDlALz77yNDvvQ9T.Tt/BiSzie3WHe620Q4sUtyam4r8DqZO');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`kode_obat`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `kode_obat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `obat`
--
CREATE DATABASE IF NOT EXISTS `obat` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `obat`;

-- --------------------------------------------------------

--
-- Table structure for table `daftarobat`
--

CREATE TABLE `daftarobat` (
  `kode_obat` int(11) NOT NULL,
  `nama_obat` varchar(100) NOT NULL,
  `jenis_obat` varchar(100) NOT NULL,
  `pembuat_obat` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daftarobat`
--

INSERT INTO `daftarobat` (`kode_obat`, `nama_obat`, `jenis_obat`, `pembuat_obat`) VALUES
(4, 'minyak kapak', 'minyak herbal', 'abidin'),
(5, 'flu', 'pil', 'arya'),
(10, 'panadol', 'pil', 'dr tina');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftarobat`
--
ALTER TABLE `daftarobat`
  ADD PRIMARY KEY (`kode_obat`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftarobat`
--
ALTER TABLE `daftarobat`
  MODIFY `kode_obat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"diyan\",\"table\":\"apotek\"},{\"db\":\"diyan\",\"table\":\"anggota\"},{\"db\":\"dataobat\",\"table\":\"komentar\"},{\"db\":\"dataobat\",\"table\":\"obatobatan\"},{\"db\":\"dataobat\",\"table\":\"user\"},{\"db\":\"diyan\",\"table\":\"register\"},{\"db\":\"obat\",\"table\":\"daftarobat\"},{\"db\":\"udin\",\"table\":\"book\"},{\"db\":\"salsa\",\"table\":\"siswa\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-08-16 12:21:06', '{\"Console\\/Mode\":\"collapse\",\"ThemeDefault\":\"metro\",\"NavigationWidth\":0}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `pmr`
--
CREATE DATABASE IF NOT EXISTS `pmr` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pmr`;

-- --------------------------------------------------------

--
-- Table structure for table `data_pasien`
--

CREATE TABLE `data_pasien` (
  `id_pasien` int(11) NOT NULL,
  `nama_pasien` varchar(255) NOT NULL,
  `umur` int(11) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `keluhan` text NOT NULL,
  `obat_diberikan` varchar(100) NOT NULL,
  `tanggal_periksa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stok_obat`
--

CREATE TABLE `stok_obat` (
  `id_obat` int(11) NOT NULL,
  `nama_obat` varchar(255) NOT NULL,
  `jenis_obat` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stok_obat`
--

INSERT INTO `stok_obat` (`id_obat`, `nama_obat`, `jenis_obat`, `stok`, `foto`) VALUES
(1, 'paracetamol', 'pil', 2, '6168039088708501135.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','staff','user') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `role`, `created_at`) VALUES
(1, 'cimi', '$2y$10$YAMzgh0eO45lzRG.9CUoIeu4Cj1nesN9Mgj1WFTYo6Rsu9JcaeDQO', 'staff', '2024-09-08 14:49:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_pasien`
--
ALTER TABLE `data_pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `stok_obat`
--
ALTER TABLE `stok_obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_pasien`
--
ALTER TABLE `data_pasien`
  MODIFY `id_pasien` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stok_obat`
--
ALTER TABLE `stok_obat`
  MODIFY `id_obat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `salsa`
--
CREATE DATABASE IF NOT EXISTS `salsa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `salsa`;

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `nama_siswa` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`);
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `tugas`
--
CREATE DATABASE IF NOT EXISTS `tugas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tugas`;

-- --------------------------------------------------------

--
-- Table structure for table `florafauna`
--

CREATE TABLE `florafauna` (
  `kode` varchar(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `spesies` varchar(255) NOT NULL,
  `habitat` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `florafauna`
--

INSERT INTO `florafauna` (`kode`, `nama`, `spesies`, `habitat`, `deskripsi`, `foto`) VALUES
('fla1', 'Bunga Bangkai', 'Suku Talas-talasan', 'Hutan Hujan Tropis Sumatera', 'Bunga Bangkai tergolong bunga raksasa yang mengeluarkan bau busuk seperti bangkai. Bau busuk tersebut bertujuan untuk mengundang serangga yang membantu proses penyerbukan.', 'jagung.jpg'),
('fa1', 'Jalak Bali', 'Leucopsar rothschildi stressmann 1912', 'Hutan mangrove, hutan rawa, hutan musim dataran rendah dan daerah savana', 'Di daerah asalnya pulai Bali disebut sebagai Curik Burung ini memiliki ukuran tubuh agak besar, panjang tubuh dari kepala sampai ekor bisa mencapai 25cm', 'jalakbali.jpg'),
('fla2', ' Rafflesia Arnoldi', 'Holoparasit', 'Hutan Hujan tropis', 'Rafflesia merupakan bunga raksasa dengan bau busuk yang menyengat. Bunga ini tumbuh melebar ke samping, ketika mekar bisa mencapai 1 meter dan berat mencapai 10kg', 'raflesia.jpg'),
('fa2', 'Harimau Sumatera', 'Panthera tigris sumatrae', 'Hutan Hujan, padang rumput, sabana dan rawa bakau', 'Harimau Sumatera merupakan harimau yang memiliki ukuran terkecil dibandingkan subspesies lainnya. Harimau sumatera mempunyai warna paling gelap di antara semua subspesies harimau, dengan pola hitam yang berukuran lebar dan jaraknya rapat dan juga berhimpitan', 'harimau.jpg'),
('fa3', 'Kakatua Hitam', 'Cacatua Atrata', 'Hutan Hujan Tropis, Hutan Mangrove dan Hutan Sekunder', 'Kakatua Hitam Jambul Hitam (Cacatua atrata) adalah spesies endemik Papua dan pulau-pulau sekitarnya dengan bulu dan jambul hitam pekat. Berukuran sekitar 40-50 cm, burung ini sering ditemukan di hutan hujan tropis dan hutan sekunder. Kakatua ini sosial, memakan biji, buah, kacang, dan serangga. Spesies ini terancam oleh deforestasi dan perdagangan ilegal, dengan upaya konservasi fokus pada perlindungan habitat dan program penangkaran.', 'kakaktuahitam.jfif'),
('fla3', 'Kayu Putih', 'Myrtaceae', 'Hutan Mangrove, Hutan Rawa, Daerah Pesisir', 'Kayu Putih (Melaleuca leucadendra) adalah pohon dari keluarga Myrtaceae yang tumbuh di hutan mangrove, hutan rawa, dan daerah pesisir tropis. Dikenal dengan kulitnya yang berwarna putih keperakan dan daun yang beraroma, kayu putih menghasilkan minyak esensial dengan sifat antiseptik dan anti-inflamasi. Tumbuhan ini ditemukan di Indonesia, Australia, dan Papua New Guinea.', 'kayuputih.jfif');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
(1, 'lol', '', '$2y$10$neQTy7ozavdU9iKH0zJq7uEXZo6mJfX3Bw8wU8kv9LvrB7K2fEqAm'),
(2, 'kinara', '', '$2y$10$NYOPOpqIVyzUp//g6DZTOOowKo0nsp1FlIm3/p4JIwjGliZrnXcly');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `udin`
--
CREATE DATABASE IF NOT EXISTS `udin` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `udin`;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id_buku` int(11) NOT NULL,
  `judul_buku` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id_buku`, `judul_buku`) VALUES
(4, 'hujan'),
(6, 'kau aku dan sepucuk ampao merah'),
(7, 'bulan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id_buku`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Database: `ukaju`
--
CREATE DATABASE IF NOT EXISTS `ukaju` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ukaju`;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kode_barang` varchar(11) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `tgl_masuk` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uks`
--

CREATE TABLE `uks` (
  `kode_obat` varchar(11) NOT NULL,
  `nama_obat` varchar(255) NOT NULL,
  `jenis_obat` varchar(255) NOT NULL,
  `pembuat_obat` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `harga` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `ukknelvia`
--
CREATE DATABASE IF NOT EXISTS `ukknelvia` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ukknelvia`;

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `AlbumID` int(11) NOT NULL,
  `NamaAlbum` varchar(255) NOT NULL,
  `Deskripsi` text NOT NULL,
  `TanggalDibuat` date NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`AlbumID`, `NamaAlbum`, `Deskripsi`, `TanggalDibuat`, `UserID`) VALUES
(1, 'kalung', 'g', '2024-10-13', 1),
(2, 'dd', 'eeeeee', '2024-10-14', 2);

-- --------------------------------------------------------

--
-- Table structure for table `foto`
--

CREATE TABLE `foto` (
  `FotoID` int(11) NOT NULL,
  `JudulFoto` varchar(255) NOT NULL,
  `DeskripsiFoto` text NOT NULL,
  `TanggalUnggah` date NOT NULL,
  `LokasiFile` varchar(255) NOT NULL,
  `AlbumID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foto`
--

INSERT INTO `foto` (`FotoID`, `JudulFoto`, `DeskripsiFoto`, `TanggalUnggah`, `LokasiFile`, `AlbumID`, `UserID`) VALUES
(1, 'mami', 'fffffffff', '2024-10-13', 'images/cinmote.jpg', 1, 1),
(2, 'eeeeee', 'ffffffff', '2024-10-14', 'images/cin.jpg', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `komentarfoto`
--

CREATE TABLE `komentarfoto` (
  `KomentarID` int(11) NOT NULL,
  `FotoID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `IsiKomentar` text NOT NULL,
  `TanggalKomentar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `komentarfoto`
--

INSERT INTO `komentarfoto` (`KomentarID`, `FotoID`, `UserID`, `IsiKomentar`, `TanggalKomentar`) VALUES
(1, 1, 1, 'hII', '0000-00-00'),
(2, 1, 1, 'haii', '0000-00-00'),
(3, 1, 1, 'cdcs', '0000-00-00'),
(4, 2, 2, 'sss', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `likefoto`
--

CREATE TABLE `likefoto` (
  `LikeID` int(11) NOT NULL,
  `FotoID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `TanggalLike` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `NamaLengkap` varchar(255) NOT NULL,
  `Alamat` text NOT NULL,
  `Level` enum('admin','user') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Username`, `Password`, `Email`, `NamaLengkap`, `Alamat`, `Level`) VALUES
(1, 'dokja', '$2y$10$JcnXS8uHmsZnouJ/1GUb..p5PQB2UcivTBKctqURfb/4i5kcPvTE6', 'dokja@gmail.com', 'dokja geol geol', 'manhwaa', 'admin'),
(2, 'sopi', '$2y$10$AeeBP3PmZOmeH0Bw0e9LQeuXGMO/3OurE.wAbOkhfAypWh844IcZi', 'sopi@gmail.com', 'sopi robbiya', 'kda', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`AlbumID`);

--
-- Indexes for table `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`FotoID`);

--
-- Indexes for table `komentarfoto`
--
ALTER TABLE `komentarfoto`
  ADD PRIMARY KEY (`KomentarID`);

--
-- Indexes for table `likefoto`
--
ALTER TABLE `likefoto`
  ADD PRIMARY KEY (`LikeID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `AlbumID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `foto`
--
ALTER TABLE `foto`
  MODIFY `FotoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `komentarfoto`
--
ALTER TABLE `komentarfoto`
  MODIFY `KomentarID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `likefoto`
--
ALTER TABLE `likefoto`
  MODIFY `LikeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
