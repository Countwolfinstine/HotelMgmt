-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 05, 2017 at 12:47 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `RestaurantMgmt`
--

-- --------------------------------------------------------

--
-- Table structure for table `currentorder`
--

CREATE TABLE `currentorder` (
  `cookid` varchar(20) NOT NULL,
  `orderid` varchar(10) NOT NULL,
  `progress` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedid` int(2) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `ratefood` int(1) NOT NULL,
  `rateservice` int(1) NOT NULL,
  `feedback` varchar(100) NOT NULL,
  `time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fooditems`
--

CREATE TABLE `fooditems` (
  `fid` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `cost` int(5) NOT NULL,
  `ingid` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE `ingredient` (
  `ingid` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `userid` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `phoneno` int(10) NOT NULL,
  `authorization` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `rating` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orderlog`
--

CREATE TABLE `orderlog` (
  `oid` varchar(10) NOT NULL,
  `tableno` int(2) NOT NULL,
  `time` date NOT NULL,
  `waiterid` varchar(20) NOT NULL,
  `fid` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `currentorder`
--
ALTER TABLE `currentorder`
  ADD KEY `cook` (`cookid`),
  ADD KEY `order` (`orderid`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedid`),
  ADD KEY `user` (`userid`);

--
-- Indexes for table `fooditems`
--
ALTER TABLE `fooditems`
  ADD PRIMARY KEY (`fid`),
  ADD KEY `ingredient` (`ingid`);

--
-- Indexes for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`ingid`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `orderlog`
--
ALTER TABLE `orderlog`
  ADD PRIMARY KEY (`oid`),
  ADD KEY `waiter` (`waiterid`),
  ADD KEY `food` (`fid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedid` int(2) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `currentorder`
--
ALTER TABLE `currentorder`
  ADD CONSTRAINT `cook` FOREIGN KEY (`cookid`) REFERENCES `login` (`userid`),
  ADD CONSTRAINT `order` FOREIGN KEY (`orderid`) REFERENCES `orderlog` (`oid`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `user` FOREIGN KEY (`userid`) REFERENCES `login` (`userid`);

--
-- Constraints for table `fooditems`
--
ALTER TABLE `fooditems`
  ADD CONSTRAINT `ingredient` FOREIGN KEY (`ingid`) REFERENCES `ingredient` (`ingid`);

--
-- Constraints for table `orderlog`
--
ALTER TABLE `orderlog`
  ADD CONSTRAINT `food` FOREIGN KEY (`fid`) REFERENCES `fooditems` (`fid`),
  ADD CONSTRAINT `waiter` FOREIGN KEY (`waiterid`) REFERENCES `login` (`userid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
