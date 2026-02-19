-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2026 at 02:09 AM
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
-- Database: `labtest`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmpID` char(4) NOT NULL,
  `EmpName` varchar(100) NOT NULL,
  `Position` varchar(50) DEFAULT NULL,
  `Salary` int(11) DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  `PhoneNum` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmpID`, `EmpName`, `Position`, `Salary`, `HireDate`, `PhoneNum`) VALUES
('E001', 'สมชาย ใจดี', 'Manager', 35000, '2023-01-10', '0812345678'),
('E002', 'ปรีชา มีสุข', 'Waiter', 18000, '2024-05-20', '0987654321'),
('E003', 'สุดา เก่งงาน', 'Cashier', 22000, '2023-11-01', '0654321098'),
('E004', 'มานะ ขยัน', 'Chef', 30000, '2022-08-15', '0919876543'),
('E005', 'อารีย์ ยิ้มหวาน', 'Waiter', 18500, '2024-03-01', '0636547890'),
('E006', 'ชัยชนะ โตไว', 'Waiter', 19000, '2024-06-01', '0954433221');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `MenuID` char(5) NOT NULL,
  `MenuName` varchar(100) NOT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `PrepTime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`MenuID`, `MenuName`, `Category`, `Price`, `PrepTime`) VALUES
('M001', 'กะเพราไก่ไข่ดาว', 'Main', 75, 10),
('M002', 'อเมริกาโน่เย็น', 'Drink', 60, 2),
('M003', 'ต้มยำกุ้ง', 'Main', 150, 15),
('M004', 'ข้าวผัดสับปะรด', 'Main', 99, 12),
('M005', 'น้ำเปล่า', 'Drink', 20, 1),
('M006', 'มอคาร้อน', 'Drink', 70, 6),
('M007', 'ยูสุโคลด์บลูว์', 'Drink', 85, 5);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` char(8) NOT NULL,
  `OrderDate` date DEFAULT NULL,
  `TableNum` int(11) DEFAULT NULL,
  `EmpID` char(4) DEFAULT NULL,
  `MenuID` char(5) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `OrderDate`, `TableNum`, `EmpID`, `MenuID`, `Quantity`) VALUES
('O2025001', '2025-10-15', 5, 'E001', 'M001', 2),
('O2025002', '2025-10-15', 10, 'E002', 'M003', 1),
('O2025003', '2025-10-15', 10, 'E002', 'M002', 3),
('O2025004', '2025-10-16', 3, 'E005', 'M006', 4),
('O2025005', '2025-10-16', 8, 'E006', 'M004', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmpID`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`MenuID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `EmpID` (`EmpID`),
  ADD KEY `MenuID` (`MenuID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`EmpID`) REFERENCES `employee` (`EmpID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`MenuID`) REFERENCES `menu` (`MenuID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
