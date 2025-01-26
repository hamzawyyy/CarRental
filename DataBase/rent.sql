-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2024 at 07:23 PM
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
-- Database: `carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `rent`
--

CREATE TABLE `rent` (
  `rent_ID` int(11) NOT NULL,
  `office_ID` int(11) NOT NULL,
  `pickup_date` date NOT NULL,
  `return_date` date NOT NULL,
  `customer_ID` int(11) NOT NULL,
  `car_plate` varchar(20) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `Status` enum('Reserved','Picked Up','Returned','Cancelled','Confirmed') NOT NULL,
  `rent_created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rent`
--

INSERT INTO `rent` (`rent_ID`, `office_ID`, `pickup_date`, `return_date`, `customer_ID`, `car_plate`, `cost`, `Status`, `rent_created_at`) VALUES
(2, 1, '2025-01-01', '2025-01-05', 11, 'ABD 2244', 800.00, 'Confirmed', '2024-12-27 19:25:25'),
(9, 1, '2025-01-08', '2025-01-11', 11, 'ABD 2244', 2.00, 'Picked Up', '2024-12-28 14:41:42'),
(11, 1, '2025-01-13', '2025-01-23', 11, 'ABD 2244', 8000.00, 'Cancelled', '2024-12-28 14:49:33'),
(12, 1, '2025-01-24', '2025-01-30', 11, 'ABD 2244', 4800.00, 'Returned', '2024-12-28 14:51:51'),
(13, 1, '2025-02-10', '2025-03-01', 11, 'ABD 2244', 15200.00, 'Confirmed', '2024-12-28 18:24:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rent`
--
ALTER TABLE `rent`
  ADD PRIMARY KEY (`rent_ID`),
  ADD KEY `customer_ID` (`customer_ID`),
  ADD KEY `car_plate` (`car_plate`),
  ADD KEY `office_ID` (`office_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `rent`
--
ALTER TABLE `rent`
  MODIFY `rent_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rent`
--
ALTER TABLE `rent`
  ADD CONSTRAINT `rent_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `customers` (`CustomerID`),
  ADD CONSTRAINT `rent_ibfk_2` FOREIGN KEY (`car_plate`) REFERENCES `car` (`Car_plate`),
  ADD CONSTRAINT `rent_ibfk_3` FOREIGN KEY (`office_ID`) REFERENCES `offices` (`OfficeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
