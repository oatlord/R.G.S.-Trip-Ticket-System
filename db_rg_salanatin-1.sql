-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2025 at 11:22 PM
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
-- Table structure for table `tbl_approvedfuelrequestdetails`
--

CREATE TABLE `tbl_approvedfuelrequestdetails` (
  `approval_ID` int(5) NOT NULL,
  `fuelReq_ID` int(5) NOT NULL,
  `supplier_ID` int(5) NOT NULL,
  `time` datetime NOT NULL,
  `derived_cost` smallint(6) NOT NULL,
  `approved_fuelAmount` decimal(10,0) NOT NULL,
  `reciept_Number` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_approvedrequestdetails`
--

CREATE TABLE `tbl_approvedrequestdetails` (
  `approval_ID` int(2) NOT NULL,
  `materialReq_ID` int(2) NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_approvedrequestdetails`
--

INSERT INTO `tbl_approvedrequestdetails` (`approval_ID`, `materialReq_ID`, `time`) VALUES
(1, 1, '07:54:15');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_approvedrequestdetailswarehouse`
--

CREATE TABLE `tbl_approvedrequestdetailswarehouse` (
  `approval_ID` int(5) NOT NULL,
  `materialReqDetails_ID` int(5) NOT NULL,
  `material_quantity` int(5) NOT NULL,
  `total_cost` int(5) NOT NULL,
  `subtotal` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='After Material Request Details';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_damagedetails`
--

CREATE TABLE `tbl_damagedetails` (
  `description_ID` int(2) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `tbl_deliverytruckdetails`
--

CREATE TABLE `tbl_deliverytruckdetails` (
  `tripTicket_ID` int(2) NOT NULL,
  `truck_fuelLevelBefore` decimal(10,2) NOT NULL,
  `truck_fuelLevelAfter` decimal(10,2) NOT NULL,
  `truck_mileageBefore` int(10) NOT NULL,
  `truck_mileageAfter` int(10) NOT NULL,
  `truck_distanceTraveled` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `tbl_fuelrequest`
--

CREATE TABLE `tbl_fuelrequest` (
  `fuelReq_ID` int(5) NOT NULL,
  `tripTicket_ID` int(5) NOT NULL,
  `fuelReq_amount` decimal(10,2) NOT NULL,
  `fuelReq_pricePerLiter` decimal(10,2) NOT NULL,
  `fuel_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_fuelrequest`
--

INSERT INTO `tbl_fuelrequest` (`fuelReq_ID`, `tripTicket_ID`, `fuelReq_amount`, `fuelReq_pricePerLiter`, `fuel_type`) VALUES
(1, 1, 100.00, 51.10, 'Diesel');

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
-- Table structure for table `tbl_materialrequestdetails`
--

CREATE TABLE `tbl_materialrequestdetails` (
  `material_ID` int(5) NOT NULL,
  `materialReq_ID` int(5) NOT NULL,
  `materialReqDetails_ID` int(5) NOT NULL,
  `material_quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='After Material Request';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_materialwarehouse`
--

CREATE TABLE `tbl_materialwarehouse` (
  `material_ID` int(2) NOT NULL,
  `material_unit` varchar(50) NOT NULL,
  `material_condition` text NOT NULL,
  `material_cost` decimal(7,2) NOT NULL,
  `material_description` text NOT NULL,
  `material_quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_materialwarehouse`
--

INSERT INTO `tbl_materialwarehouse` (`material_ID`, `material_unit`, `material_condition`, `material_cost`, `material_description`, `material_quantity`) VALUES
(1, 'Wood Planks', 'Good Condition', 10000.00, 'General 2x4', 50);

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
-- Table structure for table `tbl_purchaseorderdetails`
--

CREATE TABLE `tbl_purchaseorderdetails` (
  `materialReqDetails_ID` int(5) NOT NULL,
  `po_ID` int(5) NOT NULL,
  `po_price` int(5) NOT NULL,
  `po_quantity` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_staffrole`
--

CREATE TABLE `tbl_staffrole` (
  `staffRole_ID` int(2) NOT NULL,
  `staff_roleName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Staff Role Table';

--
-- Dumping data for table `tbl_staffrole`
--

INSERT INTO `tbl_staffrole` (`staffRole_ID`, `staff_roleName`) VALUES
(5, 'Driver Ticket Manager'),
(6, 'Driver Assistant'),
(7, 'Driver Assistant'),
(8, 'Driver Assistant'),
(9, 'Driver Assistant'),
(10, 'Driver Assistant'),
(11, 'Driver Assistant'),
(12, 'Driver Assistant');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stockout`
--

CREATE TABLE `tbl_stockout` (
  `supply_ID` int(2) NOT NULL,
  `inventorySupplier_ID` int(2) NOT NULL,
  `whMan_ID` int(2) NOT NULL,
  `admin_ID` int(2) NOT NULL,
  `date` date NOT NULL,
  `total_amount` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stockoutdamagedequipment`
--

CREATE TABLE `tbl_stockoutdamagedequipment` (
  `stockout_ID` int(2) NOT NULL,
  `admin_ID` int(2) NOT NULL,
  `whMan_ID` int(2) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stockoutdetails`
--

CREATE TABLE `tbl_stockoutdetails` (
  `stockout_ID` int(2) NOT NULL,
  `material_ID` int(2) NOT NULL,
  `description_ID` int(2) NOT NULL,
  `quantity` int(5) NOT NULL,
  `cost_of_material` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier`
--

CREATE TABLE `tbl_supplier` (
  `supplier_ID` int(5) NOT NULL,
  `contact_number` text NOT NULL,
  `location` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supply`
--

CREATE TABLE `tbl_supply` (
  `supply_ID` int(2) NOT NULL,
  `inventorySupplier_ID` int(2) NOT NULL,
  `whMan_ID` int(2) NOT NULL,
  `admin_ID` int(2) NOT NULL,
  `total` int(5) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplydetails`
--

CREATE TABLE `tbl_supplydetails` (
  `supply_ID` int(2) NOT NULL,
  `material_ID` int(2) NOT NULL,
  `quantity` int(5) NOT NULL,
  `cost_of_materials` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `tbl_whmanmain`
--

CREATE TABLE `tbl_whmanmain` (
  `employee_ID` int(2) NOT NULL,
  `whMan_ID` int(2) NOT NULL,
  `whMan_firstName` varchar(50) NOT NULL,
  `whMan_lastName` varchar(50) NOT NULL,
  `whMan_username` varchar(50) NOT NULL,
  `whMan_password` varchar(50) NOT NULL,
  `effective_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Warehouse Man Main';

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
-- Indexes for table `tbl_approvedfuelrequestdetails`
--
ALTER TABLE `tbl_approvedfuelrequestdetails`
  ADD UNIQUE KEY `approval_ID` (`approval_ID`,`fuelReq_ID`,`supplier_ID`),
  ADD KEY `fuelReq_ID` (`fuelReq_ID`),
  ADD KEY `supplier_ID` (`supplier_ID`);

--
-- Indexes for table `tbl_approvedrequestdetails`
--
ALTER TABLE `tbl_approvedrequestdetails`
  ADD UNIQUE KEY `approval_ID` (`approval_ID`,`materialReq_ID`),
  ADD KEY `materialReq_ID` (`materialReq_ID`);

--
-- Indexes for table `tbl_approvedrequestdetailswarehouse`
--
ALTER TABLE `tbl_approvedrequestdetailswarehouse`
  ADD UNIQUE KEY `approval_ID` (`approval_ID`,`materialReqDetails_ID`),
  ADD KEY `materialReqDetails_ID` (`materialReqDetails_ID`);

--
-- Indexes for table `tbl_damagedetails`
--
ALTER TABLE `tbl_damagedetails`
  ADD PRIMARY KEY (`description_ID`);

--
-- Indexes for table `tbl_deliverytruck`
--
ALTER TABLE `tbl_deliverytruck`
  ADD PRIMARY KEY (`truck_licensePlateNumber`);

--
-- Indexes for table `tbl_deliverytruckdetails`
--
ALTER TABLE `tbl_deliverytruckdetails`
  ADD UNIQUE KEY `tripTicket_ID` (`tripTicket_ID`);

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
-- Indexes for table `tbl_fuelrequest`
--
ALTER TABLE `tbl_fuelrequest`
  ADD PRIMARY KEY (`fuelReq_ID`),
  ADD UNIQUE KEY `tripTicket_ID` (`tripTicket_ID`);

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
-- Indexes for table `tbl_materialrequestdetails`
--
ALTER TABLE `tbl_materialrequestdetails`
  ADD PRIMARY KEY (`materialReqDetails_ID`),
  ADD UNIQUE KEY `material_ID` (`material_ID`,`materialReq_ID`),
  ADD KEY `materialReq_ID` (`materialReq_ID`);

--
-- Indexes for table `tbl_materialwarehouse`
--
ALTER TABLE `tbl_materialwarehouse`
  ADD PRIMARY KEY (`material_ID`);

--
-- Indexes for table `tbl_purchaseorder`
--
ALTER TABLE `tbl_purchaseorder`
  ADD PRIMARY KEY (`po_ID`),
  ADD UNIQUE KEY `admin_ID` (`admin_ID`,`approval_ID`),
  ADD KEY `fk_purchaseorder_approval` (`approval_ID`);

--
-- Indexes for table `tbl_purchaseorderdetails`
--
ALTER TABLE `tbl_purchaseorderdetails`
  ADD UNIQUE KEY `materialReqDetails_ID` (`materialReqDetails_ID`,`po_ID`),
  ADD KEY `po_ID` (`po_ID`);

--
-- Indexes for table `tbl_staffrole`
--
ALTER TABLE `tbl_staffrole`
  ADD PRIMARY KEY (`staffRole_ID`);

--
-- Indexes for table `tbl_stockout`
--
ALTER TABLE `tbl_stockout`
  ADD UNIQUE KEY `supply_ID` (`supply_ID`),
  ADD UNIQUE KEY `inventorySupplier_ID` (`inventorySupplier_ID`),
  ADD UNIQUE KEY `whMan_ID` (`whMan_ID`),
  ADD UNIQUE KEY `admin_ID` (`admin_ID`);

--
-- Indexes for table `tbl_stockoutdamagedequipment`
--
ALTER TABLE `tbl_stockoutdamagedequipment`
  ADD PRIMARY KEY (`stockout_ID`),
  ADD UNIQUE KEY `admin_ID` (`admin_ID`),
  ADD UNIQUE KEY `whMan_ID` (`whMan_ID`);

--
-- Indexes for table `tbl_stockoutdetails`
--
ALTER TABLE `tbl_stockoutdetails`
  ADD UNIQUE KEY `stockout_ID` (`stockout_ID`),
  ADD UNIQUE KEY `material_ID` (`material_ID`),
  ADD UNIQUE KEY `description_ID` (`description_ID`);

--
-- Indexes for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  ADD PRIMARY KEY (`supplier_ID`);

--
-- Indexes for table `tbl_supply`
--
ALTER TABLE `tbl_supply`
  ADD PRIMARY KEY (`supply_ID`),
  ADD UNIQUE KEY `inventorySupplier_ID` (`inventorySupplier_ID`),
  ADD UNIQUE KEY `admin_ID` (`admin_ID`),
  ADD UNIQUE KEY `whMan_ID` (`whMan_ID`);

--
-- Indexes for table `tbl_supplydetails`
--
ALTER TABLE `tbl_supplydetails`
  ADD UNIQUE KEY `supply_ID` (`supply_ID`,`material_ID`),
  ADD KEY `material_ID` (`material_ID`);

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
-- Indexes for table `tbl_whmanmain`
--
ALTER TABLE `tbl_whmanmain`
  ADD PRIMARY KEY (`employee_ID`,`whMan_ID`);

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
-- AUTO_INCREMENT for table `tbl_staffrole`
--
ALTER TABLE `tbl_staffrole`
  MODIFY `staffRole_ID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
-- Constraints for table `tbl_approvedfuelrequestdetails`
--
ALTER TABLE `tbl_approvedfuelrequestdetails`
  ADD CONSTRAINT `tbl_approvedfuelrequestdetails_ibfk_1` FOREIGN KEY (`approval_ID`) REFERENCES `tbl_approval` (`approval_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_approvedfuelrequestdetails_ibfk_2` FOREIGN KEY (`fuelReq_ID`) REFERENCES `tbl_fuelrequest` (`fuelReq_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_approvedfuelrequestdetails_ibfk_3` FOREIGN KEY (`supplier_ID`) REFERENCES `tbl_supplier` (`supplier_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_approvedrequestdetails`
--
ALTER TABLE `tbl_approvedrequestdetails`
  ADD CONSTRAINT `tbl_approvedrequestdetails_ibfk_1` FOREIGN KEY (`materialReq_ID`) REFERENCES `tbl_materialrequest` (`materialReq_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_approvedrequestdetails_ibfk_2` FOREIGN KEY (`approval_ID`) REFERENCES `tbl_approval` (`approval_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_approvedrequestdetailswarehouse`
--
ALTER TABLE `tbl_approvedrequestdetailswarehouse`
  ADD CONSTRAINT `tbl_approvedrequestdetailswarehouse_ibfk_1` FOREIGN KEY (`materialReqDetails_ID`) REFERENCES `tbl_materialrequestdetails` (`materialReqDetails_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_approvedrequestdetailswarehouse_ibfk_2` FOREIGN KEY (`approval_ID`) REFERENCES `tbl_approvedrequestdetails` (`approval_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_deliverytruckdetails`
--
ALTER TABLE `tbl_deliverytruckdetails`
  ADD CONSTRAINT `tbl_deliverytruckdetails_ibfk_1` FOREIGN KEY (`tripTicket_ID`) REFERENCES `tbl_tripticket` (`tripTicket_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `tbl_materialrequestdetails`
--
ALTER TABLE `tbl_materialrequestdetails`
  ADD CONSTRAINT `tbl_materialrequestdetails_ibfk_1` FOREIGN KEY (`materialReq_ID`) REFERENCES `tbl_materialrequest` (`materialReq_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_materialrequestdetails_ibfk_2` FOREIGN KEY (`material_ID`) REFERENCES `tbl_materialwarehouse` (`material_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_purchaseorder`
--
ALTER TABLE `tbl_purchaseorder`
  ADD CONSTRAINT `fk_purchaseorder_admin` FOREIGN KEY (`admin_ID`) REFERENCES `tbl_admin` (`admin_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_purchaseorder_approval` FOREIGN KEY (`approval_ID`) REFERENCES `tbl_approval` (`approval_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_purchaseorder_ibfk_1` FOREIGN KEY (`approval_ID`) REFERENCES `tbl_approvedrequestdetails` (`approval_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_purchaseorderdetails`
--
ALTER TABLE `tbl_purchaseorderdetails`
  ADD CONSTRAINT `tbl_purchaseorderdetails_ibfk_1` FOREIGN KEY (`po_ID`) REFERENCES `tbl_purchaseorder` (`po_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_purchaseorderdetails_ibfk_2` FOREIGN KEY (`materialReqDetails_ID`) REFERENCES `tbl_materialrequestdetails` (`materialReqDetails_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_stockout`
--
ALTER TABLE `tbl_stockout`
  ADD CONSTRAINT `tbl_stockout_ibfk_1` FOREIGN KEY (`supply_ID`) REFERENCES `tbl_supply` (`supply_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_stockout_ibfk_2` FOREIGN KEY (`inventorySupplier_ID`) REFERENCES `tbl_supply` (`inventorySupplier_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_stockout_ibfk_3` FOREIGN KEY (`admin_ID`) REFERENCES `tbl_supply` (`admin_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_stockout_ibfk_4` FOREIGN KEY (`whMan_ID`) REFERENCES `tbl_stockoutdamagedequipment` (`whMan_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_stockoutdetails`
--
ALTER TABLE `tbl_stockoutdetails`
  ADD CONSTRAINT `tbl_stockoutdetails_ibfk_1` FOREIGN KEY (`stockout_ID`) REFERENCES `tbl_stockoutdamagedequipment` (`stockout_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_stockoutdetails_ibfk_2` FOREIGN KEY (`description_ID`) REFERENCES `tbl_damagedetails` (`description_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_supply`
--
ALTER TABLE `tbl_supply`
  ADD CONSTRAINT `tbl_supply_ibfk_1` FOREIGN KEY (`whMan_ID`) REFERENCES `tbl_stockout` (`whMan_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_supply_ibfk_2` FOREIGN KEY (`admin_ID`) REFERENCES `tbl_stockoutdamagedequipment` (`admin_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_supplydetails`
--
ALTER TABLE `tbl_supplydetails`
  ADD CONSTRAINT `tbl_supplydetails_ibfk_1` FOREIGN KEY (`supply_ID`) REFERENCES `tbl_supply` (`supply_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_supplydetails_ibfk_2` FOREIGN KEY (`material_ID`) REFERENCES `tbl_materialwarehouse` (`material_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

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

--
-- Constraints for table `tbl_whmanmain`
--
ALTER TABLE `tbl_whmanmain`
  ADD CONSTRAINT `tbl_whmanmain_ibfk_1` FOREIGN KEY (`employee_ID`) REFERENCES `tbl_employee` (`employee_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_whmanmain_ibfk_2` FOREIGN KEY (`whMan_ID`) REFERENCES `tbl_supply` (`whMan_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
