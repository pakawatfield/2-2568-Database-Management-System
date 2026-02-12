-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 11, 2026 at 07:45 AM
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
-- Database: `stock_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` varchar(10) NOT NULL,
  `cat_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`) VALUES
('C01', 'เครื่องดื่ม'),
('C02', 'ขนมขบเคี้ยว'),
('C03', 'ของใช้ในครัวเรือน'),
('C04', 'อาหารสำเร็จรูป'),
('C05', 'เครื่องเขียน');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `p_id` varchar(10) NOT NULL,
  `p_name` varchar(100) NOT NULL,
  `p_detail` text DEFAULT NULL,
  `p_unit` varchar(50) DEFAULT NULL,
  `p_stock` int(11) DEFAULT NULL,
  `p_price` decimal(10,2) DEFAULT NULL,
  `p_min_stock` int(11) DEFAULT NULL,
  `cat_id` varchar(10) DEFAULT NULL,
  `replacement_p_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`p_id`, `p_name`, `p_detail`, `p_unit`, `p_stock`, `p_price`, `p_min_stock`, `cat_id`, `replacement_p_id`) VALUES
('P001', 'น้ำดื่มตราสิงห์', '600 มล.', 'ขวด', 100, 10.00, 20, 'C01', 'P002'),
('P002', 'น้ำดื่มตราเนสท์เล่', '600 มล.', 'ขวด', 80, 10.00, 20, 'C01', 'P001'),
('P003', 'เลย์รสเลิศ', 'ห่อใหญ่', 'ซอง', 50, 30.00, 10, 'C02', NULL),
('P004', 'น้ำยาล้างจานซันไลต์', 'ถุงเติม', 'ถุง', 40, 25.00, 5, 'C03', NULL),
('P005', 'มาม่ารสต้มยำกุ้ง', 'แบบซอง', 'ซอง', 200, 7.00, 50, 'C04', 'P006'),
('P006', 'ไวไวรสหมูสับ', 'แบบซอง', 'ซอง', 150, 7.00, 50, 'C04', 'P005');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `s_id` int(11) NOT NULL,
  `p_id` varchar(10) DEFAULT NULL,
  `s_qty` int(11) DEFAULT NULL,
  `s_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`s_id`, `p_id`, `s_qty`, `s_date`) VALUES
(101, 'P001', 5, '2026-02-01'),
(102, 'P003', 2, '2026-02-01'),
(103, 'P004', 1, '2026-02-02'),
(104, 'P001', 10, '2026-02-02'),
(105, 'P005', 12, '2026-02-03'),
(106, 'P006', 6, '2026-02-03'),
(107, 'P002', 4, '2026-02-04'),
(108, 'P003', 5, '2026-02-04'),
(109, 'P004', 2, '2026-02-05'),
(110, 'P005', 20, '2026-02-05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `fk_category` (`cat_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`s_id`),
  ADD KEY `fk_product` (`p_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `fk_product` FOREIGN KEY (`p_id`) REFERENCES `products` (`p_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
