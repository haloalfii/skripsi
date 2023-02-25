-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2023 at 07:09 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `id_user` varchar(25) NOT NULL,
  `id_invoice` varchar(30) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(255) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `harga` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `id_user`, `id_invoice`, `id_brg`, `nama_brg`, `jumlah`, `harga`) VALUES
(27, '11', 'INV-78583340', 2, 'Sepatu New Era', 1, 300000),
(28, '11', 'INV-78583340', 4, 'Baju Kemeja Wanita', 1, 150000),
(29, '11', 'INV-72127037', 5, 'HP Spectre X-360', 2, 7850000),
(30, '11', 'INV-55721252', 5, 'HP Spectre X-360', 1, 7850000),
(31, '11', 'INV-55721252', 4, 'Baju Kemeja Wanita', 1, 150000),
(32, '11', 'INV-104939107', 1, 'Sepatu Converse', 1, 100000),
(33, '11', 'INV-87302458', 2, 'Sepatu New Era', 1, 300000),
(34, '11', 'INV-71209212', 1, 'Sepatu Converse', 2, 100000);

--
-- Triggers `cart`
--
DELIMITER $$
CREATE TRIGGER `pesanan_penjualan` AFTER INSERT ON `cart` FOR EACH ROW BEGIN
	UPDATE product SET stok = stok-NEW.jumlah
    WHERE id_brg = NEW.id_brg;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `kategori` varchar(60) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(4) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id_brg`, `nama_brg`, `keterangan`, `kategori`, `harga`, `stok`, `gambar`) VALUES
(1, 'Sepatu Converse', 'Sepatu Santai Pria Converse', 'Shoes', 100000, 4, 'sepatu.jpg'),
(2, 'Sepatu New Era', 'Sepatu Santai Pria New Era', 'Shoes', 300000, 11, 'era.jpg'),
(4, 'Baju Kemeja Wanita', 'Kemeja Style Modis Wanita', 'T-Shirt', 150000, -1, 'baju.jpg'),
(5, 'HP Spectre X-360', 'Laptop HP Spectre X-360', 'Electronic', 7850000, -1, 'image624ea5989d1e8.png');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `order_id` char(30) NOT NULL,
  `id_user` varchar(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(225) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `mobile_phone` varchar(15) NOT NULL,
  `city` varchar(255) NOT NULL,
  `kode_pos` varchar(100) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `ekspedisi` varchar(100) NOT NULL,
  `tracking_id` varchar(30) NOT NULL,
  `transaction_time` datetime DEFAULT NULL,
  `payment_limit` datetime DEFAULT NULL,
  `status` varchar(2) NOT NULL,
  `gambar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`order_id`, `id_user`, `name`, `email`, `alamat`, `mobile_phone`, `city`, `kode_pos`, `payment_method`, `ekspedisi`, `tracking_id`, `transaction_time`, `payment_limit`, `status`, `gambar`) VALUES
('INV-104939107', '11', 'Abdullah Azzam', 'official.ferdiansyah@gmail.com', 'qwerree', '232', 'Singkawang', '23235', 'Direct Bank Transfer', 'J&T Express', '17191483964', '2023-02-24 19:22:29', '2023-02-25 19:22:29', '0', NULL),
('INV-36969353', '11', 'Abdullah Azzam', 'official.ferdiansyah@gmail.com', '13213131', '12313131', 'Bangka Barat', '132131', 'Direct Bank Transfer', 'JNE', '484834686085', '2023-02-23 22:12:34', '2023-02-24 22:12:34', '1', NULL),
('INV-55721252', '11', 'Abdullah Azzam', 'official.ferdiansyah@gmail.com', 'PALAGAN', '087838876890', 'Bintan', '15154', 'Direct Bank Transfer', 'J&T Express', '801462388974', '2023-02-23 22:09:11', '2023-02-24 22:09:11', '1', NULL),
('INV-71209212', '11', 'Abdullah Azzam', 'official.ferdiansyah@gmail.com', 'PALAGAN', '087131375431', 'Gunung Kidul', '2131313', 'Direct Bank Transfer', 'ANTERAJA', '209997551524', '2023-02-24 23:12:27', '2023-02-25 23:12:27', '0', NULL),
('INV-72127037', '11', 'Abdullah Azzam', 'official.ferdiansyah@gmail.com', 'PALAGAN', '2232551`2313414', 'Bangli', '151514', 'Direct Bank Transfer', 'J&T Express', '1087917728333', '2023-02-23 17:42:32', '2023-02-24 17:42:32', '1', NULL),
('INV-78583340', '11', 'Abdullah Azzam', 'official.ferdiansyah@gmail.com', 'Jl. Bias no 11', '087838876890', 'Sleman', '15154', 'Direct Bank Transfer', 'JNE', '939753064966', '2023-02-23 03:31:55', '2023-02-24 03:31:55', '1', NULL),
('INV-87302458', '11', 'Abdullah Azzam', 'official.ferdiansyah@gmail.com', '23131', '231231315', 'Pandeglang', '4123', 'Direct Bank Transfer', 'J&T Express', '301710965549', '2023-02-24 23:09:03', '2023-02-25 23:09:03', '0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `email`, `password`, `level`, `avatar`) VALUES
(6, 'Helpdesk Shoppify', 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '1', 'user.png'),
(11, 'Abdullah Azzam', 'official.ferdiansyah@gmail.com', '5ccd416b20ca46e517ab5b59c26b67a8', '2', 'user.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
