-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2026 at 09:51 AM
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
-- Database: `kritsada_4293`
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `DeptID` char(3) NOT NULL,
  `DeptName` varchar(300) DEFAULT NULL,
  `Budget` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`DeptID`, `DeptName`, `Budget`) VALUES
('D01', 'ไอทีและพัฒนาระบบ', 500000.00),
('D02', 'การตลาดดิจิทัล', 300000.00),
('D03', 'ทรัพยากรบุคคล', 150000.00);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmpID` char(5) NOT NULL,
  `EmpName` varchar(100) DEFAULT NULL,
  `Position` varchar(50) DEFAULT NULL,
  `DeptID` char(3) DEFAULT NULL,
  `EntryDate` date DEFAULT NULL,
  `BaseSalary` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmpID`, `EmpName`, `Position`, `DeptID`, `EntryDate`, `BaseSalary`) VALUES
('E1001', 'สมหวัง ใจดี', 'Senior Developer', 'D01', '2022-01-15', 55000.00),
('E1002', 'นภาวรรณ รัตนศิริ', 'Sales Executive', 'D02', '2021-05-20', 48000.00),
('E1003', 'สมควร ประสบโชค', 'HR Specialist', 'D03', '2023-11-01', 28000.00),
('E1004', 'กฤษณ์ กัญจนาทิพย์', 'System Analyst', 'D01', '2020-08-10', 35000.00),
('E1005', 'เดชชาติ ทาศิลป์', 'Sales Executive', 'D02', '2024-02-14', 25000.00),
('E1006', 'สมชาย ใจดี', 'Senior Developer', 'D01', '2024-03-01', 30000.00),
('E1007', 'ธัชชัย ลิ้มปัญญากุล', 'System Analyst', 'D01', '2024-03-15', 40000.00),
('E1008', 'วสุพล พรมพนานุรักษ์', 'HR Specialist', 'D03', '2022-01-15', 21000.00);

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

CREATE TABLE `payroll` (
  `RefNo` char(10) NOT NULL,
  `EmpID` char(5) DEFAULT NULL,
  `BaseSalary` decimal(10,2) DEFAULT NULL,
  `Social_Security` decimal(10,2) DEFAULT NULL,
  `Bonus` decimal(10,2) DEFAULT NULL,
  `PayDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `payroll`
--

INSERT INTO `payroll` (`RefNo`, `EmpID`, `BaseSalary`, `Social_Security`, `Bonus`, `PayDate`) VALUES
('P001', 'E1001', 55000.00, 2750.00, 1650.00, '2025-01-31'),
('P002', 'E1002', 48000.00, 2400.00, 1440.00, '2025-01-31'),
('P003', 'E1003', 28000.00, 1400.00, 840.00, '2025-01-31'),
('P004', 'E1004', 35000.00, 1750.00, 1050.00, '2025-01-31'),
('P005', 'E1005', 25000.00, 1250.00, 750.00, '2025-01-31'),
('P006', 'E1006', 30000.00, 1500.00, 900.00, '2025-01-31'),
('P007', 'E1007', 40000.00, 2000.00, 1200.00, '2025-01-31'),
('P008', 'E1008', 21000.00, 1210.00, 2100.00, '2025-01-31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`DeptID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmpID`),
  ADD KEY `DeptID` (`DeptID`);

--
-- Indexes for table `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`RefNo`),
  ADD KEY `EmpID` (`EmpID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`DeptID`) REFERENCES `departments` (`DeptID`);

--
-- Constraints for table `payroll`
--
ALTER TABLE `payroll`
  ADD CONSTRAINT `payroll_ibfk_1` FOREIGN KEY (`EmpID`) REFERENCES `employee` (`EmpID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
