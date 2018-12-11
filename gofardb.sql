-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2018 at 01:22 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gofardb`
--

-- --------------------------------------------------------

--
-- Table structure for table `auto`
--

CREATE TABLE `auto` (
  `AutoId` int(11) NOT NULL,
  `Vin` varchar(50) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Year` int(11) NOT NULL,
  `Manufactor` varchar(50) NOT NULL,
  `Price` decimal(2,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Surname` varchar(50) NOT NULL,
  `Adresas` varchar(100) NOT NULL,
  `PostCode` varchar(10) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Country` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `SaleId` int(11) NOT NULL,
  `ClientId` int(11) NOT NULL,
  `SellerId` int(11) NOT NULL,
  `AutoId` int(11) NOT NULL,
  `PVM` float NOT NULL,
  `SPrice` decimal(8,2) NOT NULL,
  `PAutoId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `SId` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `SurName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `test`
-- (See below for the actual view)
--
CREATE TABLE `test` (
`saleId` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `test`
--
DROP TABLE IF EXISTS `test`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `test`  AS  select `sales`.`SaleId` AS `saleId` from `sales` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`AutoId`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`SaleId`),
  ADD KEY `FK_SALES_AUTO` (`AutoId`),
  ADD KEY `FK_SALES_CLIENT` (`ClientId`),
  ADD KEY `FK_SALES_SELLER` (`SellerId`),
  ADD KEY `FK_SALES_PSELLER` (`PAutoId`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`SId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auto`
--
ALTER TABLE `auto`
  MODIFY `AutoId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `SaleId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `SId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `FK_SALES_AUTO` FOREIGN KEY (`AutoId`) REFERENCES `auto` (`AutoId`),
  ADD CONSTRAINT `FK_SALES_CLIENT` FOREIGN KEY (`ClientId`) REFERENCES `client` (`Id`),
  ADD CONSTRAINT `FK_SALES_PSELLER` FOREIGN KEY (`PAutoId`) REFERENCES `auto` (`AutoId`),
  ADD CONSTRAINT `FK_SALES_SELLER` FOREIGN KEY (`SellerId`) REFERENCES `seller` (`SId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
