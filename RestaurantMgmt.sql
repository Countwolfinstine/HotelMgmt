-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 26, 2017 at 04:18 AM
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

--
-- Dumping data for table `currentorder`
--

INSERT INTO `currentorder` (`cookid`, `orderid`, `progress`) VALUES
('3', '2', 1),
('3', '1', 2);

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

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedid`, `userid`, `ratefood`, `rateservice`, `feedback`, `time`) VALUES
(1, '1', 3, 4, 'good', '2017-10-11'),
(2, '2', 5, 5, 'excellent', '2017-10-09');

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

--
-- Dumping data for table `fooditems`
--

INSERT INTO `fooditems` (`fid`, `name`, `cost`, `ingid`) VALUES
('1', 'dosa', 20, '1'),
('2', 'idli', 10, '2');

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE `ingredient` (
  `ingid` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`ingid`, `name`, `quantity`) VALUES
('1', 'onion', 10),
('2', 'batter', 100),
('3', 'potato', 50);

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

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`userid`, `password`, `phoneno`, `authorization`, `address`, `dob`, `rating`) VALUES
('1', '1', 1234567890, 'manager', 'xyz', '2017-10-10', 5),
('2', '1234', 1234567890, 'customer', 'abc', '2017-10-25', 3),
('3', '1234', 1234567890, 'cook', 'abcd', '2017-10-12', 3);

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
-- Dumping data for table `orderlog`
--

INSERT INTO `orderlog` (`oid`, `tableno`, `time`, `waiterid`, `fid`) VALUES
('1', 3, '2017-10-25', '2', '1'),
('2', 3, '2017-10-25', '3', '1');

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
  MODIFY `feedid` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
