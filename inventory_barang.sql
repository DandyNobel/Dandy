-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 07, 2026 at 05:24 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_barang`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `category_id` varchar(11) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nm_kat` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_id`, `nm_kat`) VALUES
(5, 'K001', 'Peliharaan'),
(6, 'K002', 'Makanan'),
(7, 'K003', 'Sepatu'),
(9, 'K004', 'Alat Musik'),
(10, 'K005', 'Game Pad');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `category_id` varchar(11) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `product_Code` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `product_name` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `stock` int NOT NULL DEFAULT '5',
  `min_stock` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_id` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `product_Code`, `product_name`, `stock`, `min_stock`, `price`, `gambar`, `created_id`, `update_at`) VALUES
(4, 'K001', 'P001', 'Kucing Anggora', 7, 5, 8000000, 'cdc37749f0abc9272db2cb478bbe2573.jpg', '2026-06-01 11:57:33', NULL),
(5, 'K001', 'P002', 'Anjing Tibetan Mastiff', 5, 4, 14000000, '31d05c53a5b7e1795ad8af97a290850d.jpg', '2026-06-01 11:59:02', NULL),
(6, 'K001', 'P003', 'Blue & Yellow Macaw', 3, 3, 25000000, 'c53d3976fdf47a954b4f9f39ecbf0bbf.jpg', '2026-06-01 12:03:48', NULL),
(7, 'K001', 'P004', 'Arwana Super Red', 10, 5, 8000000, '8d4233e9b569b8bb0a938bd78c80b251.jpg', '2026-06-01 12:11:50', NULL),
(8, 'K001', 'P005', 'Kelinci Fuzzy Lop', 9, 10, 300000, '5c554054f148cf7ad672d916e7330cfe.jpg', '2026-06-01 12:20:09', NULL),
(9, 'K002', 'P006', 'Nasi Uduk', 15, 5, 10000, '52051dd8cacb3fbdb3a357dd3c39f9d1.jpg', '2026-06-01 12:40:08', NULL),
(10, 'K002', 'P007', 'KFC', 10, 10, 49999, '52fa2e7a45f7e45b6b00111ce67670ff.jpg', '2026-06-01 12:41:27', NULL),
(11, 'K002', 'P008', 'Richeese Factory', 20, 10, 70000, '77111afb455f4108f4c27f1f8a3551da.jpg', '2026-06-01 12:42:51', NULL),
(12, 'K002', 'P009', 'Pizza Hut', 10, 10, 120000, 'acc6dccffcf3c864582c6eca003ae5c4.jpg', '2026-06-01 12:43:48', NULL),
(13, 'K002', 'P010', 'Mie Ayam', 20, 5, 12000, '5bb533929317ba907ffc8c22878edfef.jpg', '2026-06-01 12:44:44', NULL),
(14, 'K003', 'P011', 'Sepatu Adidas', 10, 5, 500000, '9a61147b61fde7b5bd899e8aefa58bb9.jpg', '2026-06-01 12:59:41', NULL),
(15, 'K003', 'P012', 'Sepatu Nike', 15, 5, 600000, 'b42ec8ed13e3256f5d1e12b978313e2d.jpg', '2026-06-01 13:00:31', NULL),
(16, 'K003', 'P013', 'Sepatu Converse', 5, 5, 1000000, '2830d7c6baedb4ca70fda04ea6463ebd.jpg', '2026-06-01 13:01:22', NULL),
(17, 'K003', 'P014', 'Sepatu Vans', 10, 10, 1500000, 'c5483e7c8a6b9e660f800bd530e85798.jpg', '2026-06-01 13:03:48', NULL),
(18, 'K003', 'P015', 'Sepatu New Balance', 20, 5, 800000, 'b8659e7831c71067d1345e23d75c223a.jpg', '2026-06-01 13:05:32', NULL),
(19, 'K004', 'P016', 'Grand Piano Akustik', 5, 2, 20000000, '65302accf161888c32cad8e2d57567a9.jpg', '2026-06-01 13:16:22', NULL),
(20, 'K004', 'P017', 'Gitar Akustik', 10, 5, 2000000, '4b76d4117e52702cd2d780b51cd4f156.jpg', '2026-06-01 13:17:19', NULL),
(21, 'K004', 'P018', 'Biola', 1, 1, 1500000, '558b0d3c06c04719d37d4ddbdf763ddb.jpg', '2026-06-01 13:18:17', NULL),
(22, 'K004', 'P019', 'Saksofon', 5, 2, 4000000, '1e8b425a9c9242e67d7a4e643bf54034.jpg', '2026-06-01 13:19:12', NULL),
(23, 'K004', 'P020', 'Drum Set', 1, 1, 7000000, '780d8e96dfe4b9560509c4e54a0f6b9a.jpg', '2026-06-01 13:20:06', NULL),
(24, 'K005', 'P021', 'Logitech F710', 20, 5, 750000, 'ebdcd2658cf1d85973c0cb4419d35045.jpg', '2026-06-01 13:25:14', NULL),
(25, 'K005', 'P022', 'Fantech WGP13', 10, 10, 280000, '7773254c9fef0b576df7e914481819c7.jpg', '2026-06-01 13:26:03', NULL),
(26, 'K005', 'P023', 'Rexus Daxa Dyron AX9', 5, 5, 700000, '858eb1935783fac6fc32050f3968bd79.jpg', '2026-06-01 13:26:42', NULL),
(27, 'K005', 'P024', '8BitDo Ultimate 2C Wireless', 10, 5, 350000, 'f27e466194e6ba48d0824c66522b0519.jpg', '2026-06-01 13:27:44', NULL),
(28, 'K005', 'P025', 'NYK Nemesis Rogue GP200', 25, 5, 250000, '2c26dbdf4637f8e84bd47dbf07404981.jpg', '2026-06-01 13:28:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stock_logs`
--

CREATE TABLE `stock_logs` (
  `id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `change_type` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `stock_before` int DEFAULT NULL,
  `stock_after` int DEFAULT NULL,
  `note` text COLLATE utf8mb4_general_ci,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock_logs`
--

INSERT INTO `stock_logs` (`id`, `product_id`, `change_type`, `qty`, `stock_before`, `stock_after`, `note`, `created_by`, `created_at`) VALUES
(2, 28, 'ADD', 5, 20, 25, '', 3, '2026-06-01 13:29:50'),
(3, 8, 'REDUCE', 1, 10, 9, 'Hewan Mati', 3, '2026-06-01 13:31:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `role` enum('admin','staff') COLLATE utf8mb4_general_ci DEFAULT 'staff',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `is_active`, `created_at`) VALUES
(3, 'DandyNobel', 'strukturdata@gmail.com', '$2y$10$cEG1cuNJk698faeuNpta6etKr4OEX5UjaJOdZQcNOXCcBCCXboPUa', 'admin', 1, '2026-05-13 07:20:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_logs`
--
ALTER TABLE `stock_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `stock_logs`
--
ALTER TABLE `stock_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
