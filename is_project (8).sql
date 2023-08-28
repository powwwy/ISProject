-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2023 at 09:02 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `is_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `admin_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`admin_id`, `name`, `email`, `password`) VALUES
(1001, 'RichBoy', 'rich@gmail.com', '$2y$10$HyTcZdtvtXUKXNWTX96nfOU9g.82D4tg9eTge0c13BTkKtTgtkbom'),
(1003, 'John', 'john@gmail.com', '$2y$10$gZ6q/D4YuvLutasm.PJKyOdIBfp.UdligNZByqu3zpqgiPR0PzGiC');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `report_id` int(11) NOT NULL,
  `guard_id` int(11) NOT NULL,
  `report` text DEFAULT NULL,
  `report_date` date DEFAULT NULL,
  `reportStud` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`report_id`, `guard_id`, `report`, `report_date`, `reportStud`) VALUES
(11, 10800, 'tried to come in with an unregistered vehicle for the third time this week.', '2023-08-27', 152531),
(12, 10800, 'Drove badly', '2023-08-28', 153045),
(15, 10801, 'Tried to do a flip with his vehicle!!!', '2023-08-23', 150736);

-- --------------------------------------------------------

--
-- Table structure for table `security`
--

CREATE TABLE `security` (
  `guard_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `security`
--

INSERT INTO `security` (`guard_id`, `name`, `password`) VALUES
(10800, 'Jane Doe', '$2y$10$COuUZpsm9.CBcHDV2Mh5x.e.W1qu0fpnWlwrO6oijRSh/mkoKPeTO'),
(10801, 'Nelson ', '$2y$10$GrFXAsIG3cjkPFs8oZmdPedtia.edoNMxs6SJuODmZWD.ffflsclq');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `course` varchar(100) NOT NULL,
  `isDisabled` tinyint(1) NOT NULL DEFAULT 0,
  `registeredCar` varchar(20) DEFAULT NULL,
  `access_status` tinyint(1) NOT NULL,
  `warnings` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `name`, `email`, `password`, `course`, `isDisabled`, `registeredCar`, `access_status`, `warnings`) VALUES
(150736, 'Andrew', 'andrew@gmail.com', '$2y$10$EgRjDI5X1ERY/ZPDVg6ane6PgL1UXusSIhe/zEiIKoq0h/2b/u7Me', 'BBIT', 0, 'KCZ111A', 0, 1),
(152531, 'maxwell', 'maxwell@gmail.com', '$2y$10$GNVpRmZ1zlZpBwhPigVy1eFTsQhSMJstDxa0DP7veqQsP4HVjEJtW', 'DBIT', 0, 'KCR111A', 1, 4),
(152536, 'John Doe', 'johndoe@gmail.com', '$2y$10$py/dzY/7o2olDCYf4QK0WO0S9aRLC/.EIQYbfUc.gvbuurynQqHPq', 'DBM', 0, NULL, 0, 0),
(152538, 'lucas', 'lucu@gmail.com', '$2y$10$ZjkNfRxacFPfgtG/lWCRiucfU7xypO0VDtC77IyOnQIlgqebJITe2', 'BCOM', 1, 'KCD111A', 0, 0),
(153045, 'joshua', 'joshua@gmail.com', '$2y$10$/D2p8..DYzM3q7JEU9.RVewssxBMQX73ANLlOzSBpfTUI/O8yT3/m', 'DBIT', 1, 'KBQ911L', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `numberPlate` varchar(20) NOT NULL,
  `make` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `ownerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`numberPlate`, `make`, `model`, `color`, `ownerID`) VALUES
('KBQ911L', 'AUDI', 'V11', 'Black carbon', 153045),
('KCD111A', 'Mercedes', 'Corolla', 'silver', 152538),
('KCR111A', 'Toyota', 'corolla', 'red', 152531),
('KCZ111A', 'Mercedes', 'X 90', 'green', 150736);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `guardID` (`guard_id`),
  ADD KEY `fk_reports_students` (`reportStud`);

--
-- Indexes for table `security`
--
ALTER TABLE `security`
  ADD PRIMARY KEY (`guard_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `registeredCar` (`registeredCar`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`numberPlate`) USING BTREE,
  ADD KEY `fk_ownerID` (`ownerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1004;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `fk_reports_students` FOREIGN KEY (`reportStud`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`guard_id`) REFERENCES `security` (`guard_id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`registeredCar`) REFERENCES `vehicles` (`numberPlate`) ON DELETE SET NULL;

--
-- Constraints for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `fk_ownerID` FOREIGN KEY (`ownerID`) REFERENCES `students` (`student_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
