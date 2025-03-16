-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2025 at 07:17 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_rg_salanatin`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_ID` int(2) NOT NULL,
  `adminRole_ID` int(2) NOT NULL,
  `admin_username` varchar(30) NOT NULL,
  `admin_password` varchar(30) NOT NULL,
  `effectivity_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_ID`, `adminRole_ID`, `admin_username`, `admin_password`, `effectivity_date`) VALUES
(3, 3, 'Travis', 'Scott', '2025-03-14'),
(4, 4, 'John', 'Joe', '2025-03-14'),
(10, 1, 'christopher', 'password', '2025-03-11'),
(11, 2, 'John', 'password', '2025-03-11');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_adminrole`
--

CREATE TABLE `tbl_adminrole` (
  `adminRole_ID` int(2) NOT NULL,
  `adminRol_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_adminrole`
--

INSERT INTO `tbl_adminrole` (`adminRole_ID`, `adminRol_name`) VALUES
(1, 'Head Admin'),
(2, 'Head Admin'),
(3, 'Head Admin'),
(4, 'Head Admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_approval`
--

CREATE TABLE `tbl_approval` (
  `admin_ID` int(11) NOT NULL,
  `approval_ID` int(5) NOT NULL,
  `approval_date` datetime NOT NULL,
  `approval_remarks` text NOT NULL,
  `request_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_approval`
--

INSERT INTO `tbl_approval` (`admin_ID`, `approval_ID`, `approval_date`, `approval_remarks`, `request_type`) VALUES
(10, 1, '2025-03-11 12:13:22', 'Pending', 'Fuel');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_deliverytruck`
--

CREATE TABLE `tbl_deliverytruck` (
  `truck_licensePlateNumber` varchar(6) NOT NULL,
  `truck_model` varchar(20) NOT NULL,
  `truck_fuelLevel` int(10) NOT NULL,
  `truck_mileage` int(10) NOT NULL,
  `truck_status` varchar(20) NOT NULL,
  `truck_fuelType` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_deliverytruck`
--

INSERT INTO `tbl_deliverytruck` (`truck_licensePlateNumber`, `truck_model`, `truck_fuelLevel`, `truck_mileage`, `truck_status`, `truck_fuelType`) VALUES
('NBG123', 'Isuzu FVM34', 85, 150000, 'In Service', 'Diesel');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_driver`
--

CREATE TABLE `tbl_driver` (
  `driver_ID` int(2) NOT NULL,
  `driver_licenseNumber` varchar(20) NOT NULL,
  `driver_username` varchar(20) NOT NULL,
  `driver_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_driver`
--

INSERT INTO `tbl_driver` (`driver_ID`, `driver_licenseNumber`, `driver_username`, `driver_password`) VALUES
(1, 'D12-34-567890', 'driver_juan', 'DriveSafe2024!'),
(2, 'DL1234567890', 'driver_2', 'pass123'),
(3, 'DL0987654321', 'driver_3', 'secure456'),
(4, 'DL5678901234', 'driver_4', 'mypassword789'),
(5, 'DL3456789012', 'driver_5', 'driverpass321'),
(6, 'DL2345678901', 'driver_6', 'testpass654');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee`
--

CREATE TABLE `tbl_employee` (
  `employee_ID` int(2) NOT NULL,
  `staff_firstName` varchar(25) NOT NULL,
  `staff_lastName` varchar(25) NOT NULL,
  `staff_address` text NOT NULL,
  `staffRole_ID` int(2) NOT NULL,
  `staff_contactNo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Employee Table';

--
-- Dumping data for table `tbl_employee`
--

INSERT INTO `tbl_employee` (`employee_ID`, `staff_firstName`, `staff_lastName`, `staff_address`, `staffRole_ID`, `staff_contactNo`) VALUES
(1, 'John', 'De Guzman', 'Quezon City, Philippines', 5, '+63 912 345 6789'),
(2, 'Maria', 'Santos', 'Quezon City, NCR', 6, '09229876543'),
(3, 'Jose', 'Reyes', 'Cebu City, Philippines', 7, '09331239876'),
(4, 'Ana', 'Mendoza', 'Davao City, Philippines', 8, '09451230987');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jobsite`
--

CREATE TABLE `tbl_jobsite` (
  `whMan_ID` int(2) NOT NULL,
  `jobsite_ID` int(2) NOT NULL,
  `jobsite_location` text NOT NULL,
  `jobsite_client` text NOT NULL,
  `jobsite_startDate` datetime NOT NULL,
  `jobsite_endDate` datetime NOT NULL,
  `jobsite_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_jobsite`
--

INSERT INTO `tbl_jobsite` (`whMan_ID`, `jobsite_ID`, `jobsite_location`, `jobsite_client`, `jobsite_startDate`, `jobsite_endDate`, `jobsite_status`) VALUES
(1, 1, 'Matina Crossing, Davao City', 'Sari-Sari', '2025-03-12 02:47:45', '2025-03-12 02:47:45', 'Ongoing');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_materialrequest`
--

CREATE TABLE `tbl_materialrequest` (
  `materialReq_ID` int(2) NOT NULL,
  `materialReq_date` datetime NOT NULL,
  `materialReq_status` text NOT NULL,
  `jobsite_ID` int(2) NOT NULL,
  `employee_ID` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_materialrequest`
--

INSERT INTO `tbl_materialrequest` (`materialReq_ID`, `materialReq_date`, `materialReq_status`, `jobsite_ID`, `employee_ID`) VALUES
(1, '2025-03-12 02:53:59', 'Pending', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchaseorder`
--

CREATE TABLE `tbl_purchaseorder` (
  `admin_ID` int(5) NOT NULL,
  `approval_ID` int(5) NOT NULL,
  `po_ID` int(5) NOT NULL,
  `po_type` varchar(10) NOT NULL,
  `po_dateIssued` date NOT NULL,
  `total_amount` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_purchaseorder`
--

INSERT INTO `tbl_purchaseorder` (`admin_ID`, `approval_ID`, `po_ID`, `po_type`, `po_dateIssued`, `total_amount`) VALUES
(10, 1, 1, 'Material', '2025-03-11', 20);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tripticket`
--

CREATE TABLE `tbl_tripticket` (
  `tripTicket_ID` int(2) NOT NULL,
  `driver_ID` int(2) NOT NULL,
  `employee_ID` int(2) NOT NULL,
  `admin_ID` int(2) NOT NULL,
  `truck_licenseNumber` varchar(6) NOT NULL,
  `jobsite_ID` int(2) NOT NULL,
  `trip_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_tripticket`
--

INSERT INTO `tbl_tripticket` (`tripTicket_ID`, `driver_ID`, `employee_ID`, `admin_ID`, `truck_licenseNumber`, `jobsite_ID`, `trip_date`) VALUES
(1, 1, 0, 10, 'NBG123', 0, '2025-03-14');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tripticketdetails`
--

CREATE TABLE `tbl_tripticketdetails` (
  `employee_ID` int(2) NOT NULL,
  `tripTicket_ID` int(2) NOT NULL,
  `driver_ID` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_tripticketdetails`
--

INSERT INTO `tbl_tripticketdetails` (`employee_ID`, `tripTicket_ID`, `driver_ID`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tripticket_request`
--

CREATE TABLE `tbl_tripticket_request` (
  `tripTicket_ID` int(2) NOT NULL,
  `driver_ID` int(2) NOT NULL,
  `employee_ID` int(2) NOT NULL,
  `truck_licenseNumber` varchar(6) NOT NULL,
  `jobsite_ID` int(2) NOT NULL,
  `trip_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_tripticket_request`
--

INSERT INTO `tbl_tripticket_request` (`tripTicket_ID`, `driver_ID`, `employee_ID`, `truck_licenseNumber`, `jobsite_ID`, `trip_date`) VALUES
(2, 2, 2, 'GSB302', 2, '2025-09-30'),
(50, 1, 1, 'NBG120', 5, '2025-05-23');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_whmanjobsite`
--

CREATE TABLE `tbl_whmanjobsite` (
  `employee_ID` int(2) NOT NULL,
  `whMan_ID` int(2) NOT NULL,
  `whMan_firstName` varchar(50) NOT NULL,
  `whMan_lastName` varchar(50) NOT NULL,
  `whMan_username` varchar(50) NOT NULL,
  `whMan_password` varchar(20) NOT NULL,
  `jobsite_ID` int(2) NOT NULL,
  `effective_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Warehouse Man Jobsite Table';

--
-- Dumping data for table `tbl_whmanjobsite`
--

INSERT INTO `tbl_whmanjobsite` (`employee_ID`, `whMan_ID`, `whMan_firstName`, `whMan_lastName`, `whMan_username`, `whMan_password`, `jobsite_ID`, `effective_date`) VALUES
(1, 1, 'Antonio', 'Domingo', 'antoniowarehouse', 'antwarehouse', 1, '2025-03-12 09:51:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_ID`),
  ADD UNIQUE KEY `adminRole_ID` (`adminRole_ID`);

--
-- Indexes for table `tbl_adminrole`
--
ALTER TABLE `tbl_adminrole`
  ADD PRIMARY KEY (`adminRole_ID`);

--
-- Indexes for table `tbl_approval`
--
ALTER TABLE `tbl_approval`
  ADD PRIMARY KEY (`approval_ID`),
  ADD UNIQUE KEY `admin_ID` (`admin_ID`);

--
-- Indexes for table `tbl_deliverytruck`
--
ALTER TABLE `tbl_deliverytruck`
  ADD PRIMARY KEY (`truck_licensePlateNumber`);

--
-- Indexes for table `tbl_driver`
--
ALTER TABLE `tbl_driver`
  ADD PRIMARY KEY (`driver_ID`);

--
-- Indexes for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  ADD PRIMARY KEY (`employee_ID`,`staffRole_ID`),
  ADD UNIQUE KEY `staffRole_ID` (`staffRole_ID`);

--
-- Indexes for table `tbl_jobsite`
--
ALTER TABLE `tbl_jobsite`
  ADD PRIMARY KEY (`jobsite_ID`);

--
-- Indexes for table `tbl_materialrequest`
--
ALTER TABLE `tbl_materialrequest`
  ADD PRIMARY KEY (`materialReq_ID`),
  ADD UNIQUE KEY `jobsite_ID` (`jobsite_ID`,`employee_ID`),
  ADD KEY `employee_ID` (`employee_ID`);

--
-- Indexes for table `tbl_purchaseorder`
--
ALTER TABLE `tbl_purchaseorder`
  ADD PRIMARY KEY (`po_ID`),
  ADD UNIQUE KEY `admin_ID` (`admin_ID`,`approval_ID`),
  ADD KEY `fk_purchaseorder_approval` (`approval_ID`);

--
-- Indexes for table `tbl_tripticket`
--
ALTER TABLE `tbl_tripticket`
  ADD PRIMARY KEY (`tripTicket_ID`,`driver_ID`,`employee_ID`),
  ADD UNIQUE KEY `admin_ID` (`admin_ID`),
  ADD UNIQUE KEY `truck_licenseNumber` (`truck_licenseNumber`),
  ADD KEY `driver_ID` (`driver_ID`);

--
-- Indexes for table `tbl_tripticketdetails`
--
ALTER TABLE `tbl_tripticketdetails`
  ADD PRIMARY KEY (`driver_ID`),
  ADD UNIQUE KEY `employee_ID` (`employee_ID`),
  ADD UNIQUE KEY `tripTicket_ID` (`tripTicket_ID`);

--
-- Indexes for table `tbl_tripticket_request`
--
ALTER TABLE `tbl_tripticket_request`
  ADD PRIMARY KEY (`tripTicket_ID`,`driver_ID`,`employee_ID`,`jobsite_ID`);

--
-- Indexes for table `tbl_whmanjobsite`
--
ALTER TABLE `tbl_whmanjobsite`
  ADD PRIMARY KEY (`whMan_ID`),
  ADD UNIQUE KEY `employee_ID` (`employee_ID`),
  ADD KEY `jobsite_ID` (`jobsite_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_ID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_adminrole`
--
ALTER TABLE `tbl_adminrole`
  MODIFY `adminRole_ID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_approval`
--
ALTER TABLE `tbl_approval`
  MODIFY `admin_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD CONSTRAINT `tbl_admin_ibfk_1` FOREIGN KEY (`adminRole_ID`) REFERENCES `tbl_adminrole` (`adminRole_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_approval`
--
ALTER TABLE `tbl_approval`
  ADD CONSTRAINT `tbl_approval_ibfk_1` FOREIGN KEY (`admin_ID`) REFERENCES `tbl_admin` (`admin_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  ADD CONSTRAINT `tbl_employee_ibfk_1` FOREIGN KEY (`staffRole_ID`) REFERENCES `tbl_staffrole` (`staffRole_ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tbl_materialrequest`
--
ALTER TABLE `tbl_materialrequest`
  ADD CONSTRAINT `tbl_materialrequest_ibfk_1` FOREIGN KEY (`jobsite_ID`) REFERENCES `tbl_whmanjobsite` (`jobsite_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_materialrequest_ibfk_2` FOREIGN KEY (`employee_ID`) REFERENCES `tbl_whmanjobsite` (`employee_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_purchaseorder`
--
ALTER TABLE `tbl_purchaseorder`
  ADD CONSTRAINT `fk_purchaseorder_admin` FOREIGN KEY (`admin_ID`) REFERENCES `tbl_admin` (`admin_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_purchaseorder_approval` FOREIGN KEY (`approval_ID`) REFERENCES `tbl_approval` (`approval_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_purchaseorder_ibfk_1` FOREIGN KEY (`approval_ID`) REFERENCES `tbl_approvedrequestdetails` (`approval_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_tripticket`
--
ALTER TABLE `tbl_tripticket`
  ADD CONSTRAINT `tbl_tripticket_ibfk_1` FOREIGN KEY (`admin_ID`) REFERENCES `tbl_admin` (`admin_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_tripticket_ibfk_2` FOREIGN KEY (`truck_licenseNumber`) REFERENCES `tbl_deliverytruck` (`truck_licensePlateNumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_tripticket_ibfk_3` FOREIGN KEY (`driver_ID`) REFERENCES `tbl_tripticketdetails` (`driver_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_tripticketdetails`
--
ALTER TABLE `tbl_tripticketdetails`
  ADD CONSTRAINT `tbl_tripticketdetails_ibfk_1` FOREIGN KEY (`employee_ID`) REFERENCES `tbl_employee` (`employee_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_tripticketdetails_ibfk_2` FOREIGN KEY (`tripTicket_ID`) REFERENCES `tbl_tripticket` (`tripTicket_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_tripticketdetails_ibfk_3` FOREIGN KEY (`driver_ID`) REFERENCES `tbl_driver` (`driver_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_whmanjobsite`
--
ALTER TABLE `tbl_whmanjobsite`
  ADD CONSTRAINT `tbl_whmanjobsite_ibfk_1` FOREIGN KEY (`employee_ID`) REFERENCES `tbl_employee` (`employee_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_whmanjobsite_ibfk_2` FOREIGN KEY (`jobsite_ID`) REFERENCES `tbl_jobsite` (`jobsite_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
