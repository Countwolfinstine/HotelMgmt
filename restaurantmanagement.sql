-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2017 at 06:41 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurantmanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `currentorder`
--

CREATE TABLE IF NOT EXISTS `currentorder` (
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currentorder`
--

INSERT INTO `currentorder` (`order_id`, `item_id`) VALUES
(29, 2),
(17, 3),
(35, 3),
(20, 4),
(32, 4),
(38, 4),
(2, 5),
(5, 5),
(14, 5),
(8, 10),
(11, 10),
(26, 10),
(23, 13);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `userid` int(11) NOT NULL,
  `feedback` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE IF NOT EXISTS `ingredients` (
  `ing_id` int(11) NOT NULL,
  `ing_name` varchar(30) NOT NULL,
  `quantity` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`ing_id`, `ing_name`, `quantity`) VALUES
(1, 'Batter ', 1000),
(2, 'Butter ', 10),
(4, 'Milk', 20),
(6, 'choco', 500);

-- --------------------------------------------------------

--
-- Table structure for table `ingredients_required`
--

CREATE TABLE IF NOT EXISTS `ingredients_required` (
  `ing_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `ing_quantity_required` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ingredients_required`
--

INSERT INTO `ingredients_required` (`ing_id`, `item_id`, `ing_quantity_required`) VALUES
(1, 1, 5),
(1, 17, 5);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `item_name` varchar(20) NOT NULL,
  `item_id` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_name`, `item_id`, `price`) VALUES
('Dosa', 1, 25),
('Idli', 2, 20),
('Vada', 3, 20),
('Biriyani', 4, 40),
('Dal Makhani', 5, 50),
('Dal', 6, 20),
('Mixed Veg', 7, 50),
('Aalo Gobhi', 8, 40),
('Pav Bhaji', 9, 30),
('Paalak Paneer', 10, 40),
('Chole-Bhature', 11, 50),
('Puri', 12, 20),
('Naan', 13, 25),
('Roti', 15, 10),
('stones', 16, 10),
('golmal', 17, 100);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `tableid` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`tableid`, `orderid`, `userid`, `itemid`, `quantity`, `time`) VALUES
(4, 1, 15, 1, 1, '2017-09-08 11:44:18'),
(2, 2, 36, 5, 4, '2017-09-08 04:22:40'),
(3, 3, 17, 1, 4, '2017-09-08 15:25:13'),
(1, 4, 40, 13, 3, '2017-09-08 16:42:07'),
(1, 5, 47, 5, 2, '2017-09-08 04:09:18'),
(3, 6, 16, 4, 3, '2017-09-08 02:00:31'),
(3, 7, 46, 1, 1, '2017-09-08 06:44:04'),
(3, 8, 29, 10, 2, '2017-09-08 13:42:20'),
(3, 9, 11, 7, 1, '2017-09-08 14:24:25'),
(4, 10, 21, 8, 3, '2017-09-08 10:22:31'),
(2, 11, 14, 10, 3, '2017-09-08 10:01:35'),
(1, 12, 19, 12, 1, '2017-09-08 07:54:52'),
(3, 13, 24, 9, 3, '2017-09-08 04:14:12'),
(1, 14, 25, 5, 1, '2017-09-08 15:02:51'),
(3, 15, 32, 4, 1, '2017-09-08 08:50:58'),
(2, 16, 23, 11, 1, '2017-09-08 12:48:46'),
(3, 17, 45, 3, 4, '2017-09-08 15:49:09'),
(4, 18, 35, 12, 3, '2017-09-08 02:49:15'),
(3, 19, 39, 6, 1, '2017-09-08 05:31:37'),
(4, 20, 5, 4, 1, '2017-09-08 07:49:04'),
(1, 21, 11, 14, 2, '2017-09-08 08:43:46'),
(1, 22, 23, 6, 2, '2017-09-08 05:44:49'),
(2, 23, 25, 13, 1, '2017-09-08 09:57:34'),
(4, 24, 12, 4, 4, '2017-09-08 06:00:55'),
(3, 25, 27, 2, 4, '2017-09-08 02:22:09'),
(3, 26, 26, 10, 2, '2017-09-08 16:44:02'),
(4, 27, 14, 6, 2, '2017-09-08 03:14:23'),
(2, 28, 14, 9, 1, '2017-09-08 13:26:02'),
(3, 29, 39, 2, 4, '2017-09-08 05:47:03'),
(3, 30, 44, 1, 2, '2017-09-08 05:23:34'),
(3, 31, 43, 4, 2, '2017-09-08 02:56:02'),
(2, 32, 5, 4, 1, '2017-09-08 16:32:32'),
(3, 33, 41, 7, 2, '2017-09-08 10:38:07'),
(4, 34, 43, 8, 4, '2017-09-08 14:51:37'),
(3, 35, 33, 3, 2, '2017-09-08 02:19:27'),
(2, 36, 37, 7, 4, '2017-09-08 11:16:57'),
(4, 37, 38, 9, 4, '2017-09-08 03:46:40'),
(3, 38, 32, 4, 4, '2017-09-08 14:22:56'),
(2, 39, 33, 2, 4, '2017-09-08 07:51:32'),
(2, 40, 47, 8, 3, '2017-09-08 08:21:30');

-- --------------------------------------------------------

--
-- Table structure for table `orderlog`
--

CREATE TABLE IF NOT EXISTS `orderlog` (
  `orderid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderlog`
--

INSERT INTO `orderlog` (`orderid`, `userid`, `itemid`, `quantity`, `time`) VALUES
(1, 15, 1, 1, '2017-09-08 11:44:18'),
(2, 36, 5, 4, '2017-09-08 04:22:40'),
(3, 17, 1, 4, '2017-09-08 15:25:13'),
(4, 40, 13, 3, '2017-09-08 16:42:07'),
(5, 47, 5, 2, '2017-09-08 04:09:18'),
(6, 16, 4, 3, '2017-09-08 02:00:31'),
(7, 46, 1, 1, '2017-09-08 06:44:04'),
(8, 29, 10, 2, '2017-09-08 13:42:20'),
(9, 11, 7, 1, '2017-09-08 14:24:25'),
(10, 21, 8, 3, '2017-09-08 10:22:31'),
(11, 14, 10, 3, '2017-09-08 10:01:35'),
(12, 19, 12, 1, '2017-09-08 07:54:52'),
(13, 24, 9, 3, '2017-09-08 04:14:12'),
(14, 25, 5, 1, '2017-09-08 15:02:51'),
(15, 32, 4, 1, '2017-09-08 08:50:58'),
(16, 23, 11, 1, '2017-09-08 12:48:46'),
(17, 45, 3, 4, '2017-09-08 15:49:09'),
(18, 35, 12, 3, '2017-09-08 02:49:15'),
(19, 39, 6, 1, '2017-09-08 05:31:37'),
(20, 5, 4, 1, '2017-09-08 07:49:04'),
(21, 11, 14, 2, '2017-09-08 08:43:46'),
(22, 23, 6, 2, '2017-09-08 05:44:49'),
(23, 25, 13, 1, '2017-09-08 09:57:34'),
(24, 12, 4, 4, '2017-09-08 06:00:55'),
(25, 27, 2, 4, '2017-09-08 02:22:09'),
(26, 26, 10, 2, '2017-09-08 16:44:02'),
(27, 14, 6, 2, '2017-09-08 03:14:23'),
(28, 14, 9, 1, '2017-09-08 13:26:02'),
(29, 39, 2, 4, '2017-09-08 05:47:03'),
(30, 44, 1, 2, '2017-09-08 05:23:34'),
(31, 43, 4, 2, '2017-09-08 02:56:02'),
(32, 5, 4, 1, '2017-09-08 16:32:32'),
(33, 41, 7, 2, '2017-09-08 10:38:07'),
(34, 43, 8, 4, '2017-09-08 14:51:37'),
(35, 33, 3, 2, '2017-09-08 02:19:27'),
(36, 37, 7, 4, '2017-09-08 11:16:57'),
(37, 38, 9, 4, '2017-09-08 03:46:40'),
(38, 32, 4, 4, '2017-09-08 14:22:56'),
(39, 33, 2, 4, '2017-09-08 07:51:32'),
(40, 47, 8, 3, '2017-09-08 08:21:30');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE IF NOT EXISTS `rating` (
  `userid` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`userid`, `item_id`, `rating`) VALUES
(5, 4, 3),
(11, 7, 2),
(11, 14, 4),
(12, 4, 4),
(14, 6, 2),
(14, 9, 1),
(14, 10, 2),
(15, 1, 2),
(16, 4, 1),
(17, 1, 2),
(19, 12, 1),
(21, 8, 4),
(23, 6, 3),
(23, 11, 2),
(24, 9, 1),
(25, 5, 1),
(25, 13, 4),
(26, 10, 3),
(27, 2, 4),
(29, 10, 3),
(32, 4, 1),
(35, 12, 1),
(36, 5, 2),
(39, 2, 4),
(39, 6, 2),
(40, 13, 4),
(43, 4, 1),
(44, 1, 2),
(45, 3, 4),
(46, 1, 1),
(47, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `emailid` varchar(40) NOT NULL,
  `userid` int(11) NOT NULL,
  `password` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `autorization` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`emailid`, `userid`, `password`, `username`, `autorization`) VALUES
('Surya.Shankar93@live.com', 1, 'WnqIcnlA', 'Surya', 'Waiter'),
('Rajesh.Kumar15@hotmail.com', 2, 'ZmfiPvBZ', 'Rajesh', 'Waiter'),
('Ram.Jain50@hotmail.com', 3, 'RoJUZXW', 'Ram', 'Waiter'),
('Surya.Jain88@hotmail.com', 4, 'IrbrkKiOY', 'Surya', 'Customer'),
('Ram.Kumar80@live.com', 5, 'fGFNQtX', 'Ram', 'Customer'),
('Sam.Prasad75@live.com', 6, 'ONzTaFAjn', 'Sam', 'Waiter'),
('Ramesh.John80@gmail.com', 7, 'QSxJkcrT', 'Ramesh', 'Waiter'),
('Tom.Prasad13@hotmail.com', 8, 'YBbILjBB', 'Tom', 'Waiter'),
('Rajesh.Shankar92@yahoo.com', 9, 'RFDEwhXO', 'Rajesh', 'Customer'),
('Ramesh.John69@hotmail.com', 10, 'vqjFAjJwI', 'Ramesh', 'Waiter'),
('Rajesh.Jain78@gmail.com', 11, 'hTxJfNgzR', 'Rajesh', 'Customer'),
('Ramesh.Iyer23@live.com', 12, 'txMYMRViY', 'Ramesh', 'Customer'),
('Sam.Shankar68@yahoo.com', 13, 'gozBpLcc', 'Sam', 'Waiter'),
('Tom.Prasad43@gmail.com', 14, 'zSFJalPzZ', 'Tom', 'Customer'),
('Tom.Jain23@yahoo.com', 15, 'xOdIqTh', 'Tom', 'Customer'),
('Sham.Shankar9@yahoo.com', 16, 'sbgaGCxR', 'Sham', 'Customer'),
('Rajesh.Iyer32@yahoo.com', 17, 'SeWuCfLN', 'Rajesh', 'Customer'),
('Sham.Jain65@yahoo.com', 18, 'qQfvzicU', 'Sham', 'Customer'),
('Ram.Shankar78@gmail.com', 19, 'blAKCXC', 'Ram', 'Customer'),
('Ram.Prasad41@gmail.com', 20, 'cEZYoiFA', 'Ram', 'Customer'),
('Sam.Iyer94@yahoo.com', 21, 'AsGWREZ', 'Sam', 'Customer'),
('Ram.Shankar2@live.com', 22, 'ikhMAHuo', 'Ram', 'Customer'),
('Rajesh.Kumar84@yahoo.com', 23, 'ZtsfVlL', 'Rajesh', 'Customer'),
('Sham.John15@hotmail.com', 24, 'QJQiYHB', 'Sham', 'Customer'),
('Rajesh.Jain36@live.com', 25, 'fTEfGft', 'Rajesh', 'Customer'),
('Rajesh.Iyer93@hotmail.com', 26, 'jjhaoOnK', 'Rajesh', 'Customer'),
('Sham.Shankar75@live.com', 27, 'mDhyTmxrj', 'Sham', 'Customer'),
('Tom.Iyer55@yahoo.com', 28, 'WrvDPzCel', 'Tom', 'Customer'),
('Rajesh.Iyer64@live.com', 29, 'QKBVgzqb', 'Rajesh', 'Customer'),
('Rajesh.Prasad57@live.com', 30, 'gScyVrNJR', 'Rajesh', 'Customer'),
('Ramesh.John3@yahoo.com', 31, 'JPmauFRVW', 'Ramesh', 'Customer'),
('Sham.Shankar98@hotmail.com', 32, 'zjnAxyff', 'Sham', 'Customer'),
('Sham.John16@hotmail.com', 33, 'XncLJfZX', 'Sham', 'Customer'),
('Sam.Prasad3@yahoo.com', 34, 'nRVnKfx', 'Sam', 'Customer'),
('Rajesh.Prasad47@yahoo.com', 35, 'UXjeCNY', 'Rajesh', 'Customer'),
('Ramesh.Shankar71@gmail.com', 36, 'KIbAFFdk', 'Ramesh', 'Customer'),
('Tom.Bhat6@gmail.com', 37, 'hBcgIFCvT', 'Tom', 'Customer'),
('Sham.Jain6@hotmail.com', 38, 'GDPGoAO', 'Sham', 'Customer'),
('Tom.John18@yahoo.com', 39, 'WqukViqCN', 'Tom', 'Customer'),
('Sam.Shankar98@yahoo.com', 40, 'XurVXHFm', 'Sam', 'Customer'),
('Ram.John62@live.com', 41, 'xqxSTJV', 'Ram', 'Customer'),
('Sham.John76@live.com', 42, 'gwuqaYeH', 'Sham', 'Customer'),
('Rajesh.Iyer87@yahoo.com', 43, 'HVNaYiw', 'Rajesh', 'Customer'),
('Ram.Prasad30@live.com', 44, 'fyBrVKvU', 'Ram', 'Customer'),
('Ramesh.Shankar22@gmail.com', 45, 'qXUQOXqEI', 'Ramesh', 'Customer'),
('Tom.Jain29@live.com', 46, 'UtmaAWq', 'Tom', 'Customer'),
('Surya.John51@gmail.com', 47, 'yegIdCIW', 'Surya', 'Customer'),
('Surya.Prasad96@yahoo.com', 48, 'YThshkdA', 'Surya', 'Customer'),
('Surya.Bhat83@gmail.com', 49, 'ZbfWmrQM', 'Surya', 'Customer'),
('Sham.John52@live.com', 50, 'JWdVVGj', 'Sham', 'Customer'),
('a@gmail.com', 51, 'asdfa', 'adfa', 'Customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `currentorder`
--
ALTER TABLE `currentorder`
  ADD PRIMARY KEY (`order_id`,`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`ing_id`),
  ADD KEY `ing_id` (`ing_id`);

--
-- Indexes for table `ingredients_required`
--
ALTER TABLE `ingredients_required`
  ADD KEY `ingredient_mapping1` (`ing_id`),
  ADD KEY `ingredient_mapping2` (`item_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`orderid`,`userid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `orderlog`
--
ALTER TABLE `orderlog`
  ADD PRIMARY KEY (`orderid`,`userid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`userid`,`item_id`),
  ADD KEY `rating_mapping1` (`item_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `emailid` (`emailid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `ing_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=52;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `currentorder`
--
ALTER TABLE `currentorder`
  ADD CONSTRAINT `currentorder_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  ADD CONSTRAINT `order_mapping` FOREIGN KEY (`order_id`) REFERENCES `order` (`orderid`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);

--
-- Constraints for table `ingredients_required`
--
ALTER TABLE `ingredients_required`
  ADD CONSTRAINT `Relational_mapping1` FOREIGN KEY (`ing_id`) REFERENCES `ingredients` (`ing_id`),
  ADD CONSTRAINT `Relational_mapping2` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);

--
-- Constraints for table `orderlog`
--
ALTER TABLE `orderlog`
  ADD CONSTRAINT `orderlog_ibfk_2` FOREIGN KEY (`orderid`) REFERENCES `order` (`orderid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
