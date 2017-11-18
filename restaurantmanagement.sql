-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2017 at 05:53 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

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
-- Table structure for table `current_orders`
--

CREATE TABLE `current_orders` (
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `current_orders`
--

INSERT INTO `current_orders` (`order_id`, `item_id`) VALUES
(250, 4),
(251, 1);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `userid` int(11) NOT NULL,
  `feedback` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `ing_id` int(11) NOT NULL,
  `ing_name` varchar(30) NOT NULL,
  `quantity` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`ing_id`, `ing_name`, `quantity`) VALUES
(1, 'Dosa Batter', 50),
(2, 'Potato', 100),
(3, 'Curry Leaves', 50),
(4, 'Tamrind', 20),
(5, 'Tomato', 100),
(6, 'Idli Batter', 40),
(7, 'Onion', 44),
(8, 'Rice', 95),
(9, 'Garam Masala', 60),
(10, 'Chilly Powder', 40),
(11, 'Rajma', 43),
(12, 'Urad Dal', 20),
(13, 'Lentils', 37),
(14, 'Turmeric', 45),
(15, 'Toor Dal', 37),
(16, 'Beans', 40),
(17, 'Gobhi', 25),
(18, 'Pav', 100),
(19, 'Paalak', 50),
(20, 'Paneer', 20),
(21, 'Wheat', 50),
(22, 'Capsicum', 30),
(23, 'Noodles', 100),
(24, 'Cheese', 50);

-- --------------------------------------------------------

--
-- Table structure for table `ingredients_required`
--

CREATE TABLE `ingredients_required` (
  `ing_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `ing_quantity_required` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ingredients_required`
--

INSERT INTO `ingredients_required` (`ing_id`, `item_id`, `ing_quantity_required`) VALUES
(1, 1, 5),
(1, 2, 2),
(1, 3, 3),
(1, 4, 1),
(1, 5, 2),
(2, 6, 5),
(2, 4, 2),
(2, 5, 2),
(3, 6, 3),
(3, 3, 2),
(3, 7, 2),
(4, 8, 6),
(4, 9, 3),
(4, 10, 1),
(5, 11, 4),
(5, 12, 2),
(5, 9, 2),
(6, 13, 5),
(6, 9, 2),
(6, 7, 3),
(7, 14, 2),
(7, 15, 2),
(7, 5, 2),
(7, 7, 2),
(8, 16, 3),
(8, 2, 2),
(8, 5, 2),
(9, 2, 4),
(9, 17, 4),
(9, 7, 3),
(10, 18, 4),
(10, 5, 2),
(10, 2, 3),
(11, 19, 6),
(11, 20, 5),
(11, 7, 3),
(12, 8, 6),
(12, 7, 3),
(12, 5, 4),
(13, 21, 5),
(14, 21, 5),
(14, 8, 6),
(14, 8, 6),
(14, 22, 3),
(14, 7, 4),
(15, 21, 5),
(16, 8, 6),
(16, 22, 2),
(16, 7, 4),
(17, 23, 10),
(17, 22, 4),
(17, 7, 3),
(18, 24, 5),
(18, 8, 6),
(18, 7, 3),
(19, 8, 6),
(19, 7, 2),
(19, 5, 3),
(20, 24, 6),
(20, 7, 3),
(20, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_name` varchar(20) NOT NULL,
  `item_id` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
('Tava Pulav', 14, 80),
('Roti', 15, 10),
('fried rice', 16, 45),
('noodles', 17, 50),
('Cheese Tava Pulav', 18, 100),
('Triple Fried Rice', 19, 80),
('Cheese Sandwich', 20, 35);

-- --------------------------------------------------------

--
-- Table structure for table `orders_log`
--

CREATE TABLE `orders_log` (
  `orderid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_log`
--

INSERT INTO `orders_log` (`orderid`, `userid`, `itemid`, `quantity`, `time`) VALUES
(1, 32, 4, 3, '2017-09-09 03:05:15'),
(2, 54, 19, 2, '2017-09-09 14:07:25'),
(3, 12, 13, 3, '2017-09-09 10:29:55'),
(4, 26, 17, 3, '2017-09-09 10:02:45'),
(5, 28, 3, 4, '2017-09-09 13:44:10'),
(6, 60, 6, 3, '2017-09-09 03:49:56'),
(7, 44, 5, 4, '2017-09-09 05:46:45'),
(9, 14, 8, 2, '2017-09-09 10:10:46'),
(11, 55, 10, 3, '2017-09-09 06:32:40'),
(12, 43, 19, 1, '2017-09-09 14:28:15'),
(14, 58, 8, 2, '2017-09-09 03:05:25'),
(15, 56, 17, 2, '2017-09-09 14:10:30'),
(16, 60, 1, 4, '2017-09-09 07:35:29'),
(17, 65, 16, 2, '2017-09-09 08:35:03'),
(18, 29, 14, 1, '2017-09-09 08:33:39'),
(19, 27, 8, 1, '2017-09-09 06:59:10'),
(20, 45, 17, 4, '2017-09-09 16:43:18'),
(21, 4, 14, 2, '2017-09-10 12:03:55'),
(22, 40, 14, 3, '2017-09-10 02:47:44'),
(23, 26, 13, 4, '2017-09-10 03:06:58'),
(24, 28, 20, 1, '2017-09-10 02:40:35'),
(25, 21, 18, 2, '2017-09-10 12:21:27'),
(26, 54, 2, 3, '2017-09-10 09:44:02'),
(27, 64, 9, 3, '2017-09-10 14:22:30'),
(28, 45, 14, 4, '2017-09-10 16:51:08'),
(30, 51, 15, 1, '2017-09-10 12:37:02'),
(31, 15, 11, 1, '2017-09-10 13:53:25'),
(32, 34, 13, 2, '2017-09-10 09:02:30'),
(33, 38, 18, 2, '2017-09-10 11:08:27'),
(34, 44, 11, 4, '2017-09-10 14:26:13'),
(35, 38, 8, 3, '2017-09-10 03:44:34'),
(36, 38, 12, 1, '2017-09-10 04:47:54'),
(37, 31, 5, 3, '2017-09-10 09:35:45'),
(38, 15, 7, 1, '2017-09-10 13:29:14'),
(39, 15, 20, 1, '2017-09-10 06:10:49'),
(40, 54, 13, 4, '2017-09-10 11:42:34'),
(41, 62, 14, 1, '2017-09-11 15:36:22'),
(42, 42, 15, 1, '2017-09-11 11:36:11'),
(44, 43, 9, 1, '2017-09-11 05:53:28'),
(45, 23, 3, 1, '2017-09-11 02:49:01'),
(46, 12, 18, 4, '2017-09-11 15:45:45'),
(47, 23, 11, 2, '2017-09-11 04:20:58'),
(48, 40, 8, 4, '2017-09-11 10:51:51'),
(49, 33, 15, 1, '2017-09-11 11:57:00'),
(50, 46, 13, 3, '2017-09-11 16:15:50'),
(51, 31, 6, 2, '2017-09-11 09:56:15'),
(52, 38, 9, 2, '2017-09-11 16:27:20'),
(53, 59, 10, 1, '2017-09-11 13:18:07'),
(54, 35, 2, 1, '2017-09-11 06:55:42'),
(55, 51, 18, 3, '2017-09-11 08:39:38'),
(56, 53, 16, 4, '2017-09-11 07:00:09'),
(57, 4, 1, 4, '2017-09-11 02:19:41'),
(58, 39, 18, 1, '2017-09-11 05:15:44'),
(59, 39, 3, 1, '2017-09-11 15:21:51'),
(60, 10, 17, 2, '2017-09-11 02:42:34'),
(61, 23, 20, 4, '2017-09-11 09:24:54'),
(62, 48, 12, 1, '2017-09-11 15:06:15'),
(63, 49, 4, 1, '2017-09-11 15:32:47'),
(64, 62, 18, 4, '2017-09-11 06:45:39'),
(65, 54, 18, 1, '2017-09-11 16:46:10'),
(66, 51, 13, 3, '2017-09-11 03:26:46'),
(67, 45, 14, 4, '2017-09-11 06:47:04'),
(68, 34, 12, 4, '2017-09-11 14:51:13'),
(69, 23, 20, 4, '2017-09-11 11:45:03'),
(70, 22, 16, 1, '2017-09-11 16:28:12'),
(71, 40, 20, 1, '2017-09-11 02:56:06'),
(73, 38, 19, 4, '2017-09-11 11:42:01'),
(74, 46, 11, 2, '2017-09-11 15:02:32'),
(75, 17, 10, 4, '2017-09-11 03:00:02'),
(76, 51, 18, 1, '2017-09-12 05:15:46'),
(77, 44, 4, 4, '2017-09-12 11:56:39'),
(78, 56, 8, 2, '2017-09-12 13:55:28'),
(79, 49, 17, 4, '2017-09-12 12:35:41'),
(80, 60, 19, 3, '2017-09-12 07:48:30'),
(81, 17, 1, 2, '2017-09-12 03:38:26'),
(82, 24, 2, 3, '2017-09-12 04:55:24'),
(83, 5, 10, 3, '2017-09-12 06:59:17'),
(85, 65, 11, 2, '2017-09-12 11:38:43'),
(86, 61, 16, 2, '2017-09-12 10:00:16'),
(88, 31, 11, 2, '2017-09-12 05:43:58'),
(89, 18, 2, 3, '2017-09-12 12:36:03'),
(90, 65, 4, 2, '2017-09-12 04:48:59'),
(91, 53, 11, 1, '2017-09-13 03:36:48'),
(92, 30, 2, 4, '2017-09-13 04:31:54'),
(93, 30, 7, 1, '2017-09-13 14:03:21'),
(95, 22, 8, 4, '2017-09-13 15:52:10'),
(96, 38, 19, 1, '2017-09-13 09:34:29'),
(97, 40, 17, 1, '2017-09-13 06:04:46'),
(98, 40, 18, 1, '2017-09-13 02:42:55'),
(99, 32, 9, 4, '2017-09-13 14:27:15'),
(100, 19, 6, 1, '2017-09-13 14:51:27'),
(101, 42, 19, 3, '2017-09-13 09:33:22'),
(102, 23, 18, 4, '2017-09-13 07:31:43'),
(103, 60, 14, 4, '2017-09-13 13:31:19'),
(104, 59, 8, 4, '2017-09-13 13:32:02'),
(105, 44, 2, 2, '2017-09-13 11:29:03'),
(106, 42, 15, 3, '2017-09-13 04:15:50'),
(107, 27, 18, 2, '2017-09-13 11:46:56'),
(108, 30, 17, 4, '2017-09-13 06:01:47'),
(109, 29, 4, 4, '2017-09-13 02:58:42'),
(110, 21, 19, 3, '2017-09-13 08:29:22'),
(111, 48, 18, 3, '2017-09-13 10:30:05'),
(112, 56, 15, 2, '2017-09-13 11:48:06'),
(113, 53, 4, 3, '2017-09-13 15:13:46'),
(114, 18, 4, 2, '2017-09-13 08:51:02'),
(116, 10, 2, 4, '2017-09-13 11:19:30'),
(117, 25, 8, 4, '2017-09-13 03:43:19'),
(118, 48, 7, 1, '2017-09-13 16:41:44'),
(119, 49, 4, 1, '2017-09-13 08:53:47'),
(120, 50, 1, 3, '2017-09-13 04:53:25'),
(121, 15, 20, 3, '2017-09-13 10:24:52'),
(122, 27, 19, 3, '2017-09-13 08:22:19'),
(123, 59, 6, 1, '2017-09-13 08:35:01'),
(124, 23, 12, 4, '2017-09-13 13:32:26'),
(125, 31, 8, 1, '2017-09-13 09:46:32'),
(126, 38, 19, 2, '2017-09-13 04:47:48'),
(127, 62, 19, 3, '2017-09-13 16:38:46'),
(128, 48, 15, 2, '2017-09-13 04:29:01'),
(129, 63, 6, 4, '2017-09-13 09:23:15'),
(130, 26, 11, 1, '2017-09-13 08:18:38'),
(131, 45, 20, 3, '2017-09-13 13:52:47'),
(132, 61, 16, 3, '2017-09-13 16:52:10'),
(133, 58, 14, 2, '2017-09-13 08:34:53'),
(134, 14, 17, 3, '2017-09-13 10:15:21'),
(135, 17, 11, 3, '2017-09-13 13:01:49'),
(136, 17, 16, 4, '2017-09-13 06:59:11'),
(137, 62, 20, 4, '2017-09-13 16:52:54'),
(138, 26, 11, 2, '2017-09-13 13:08:58'),
(139, 23, 5, 2, '2017-09-13 13:41:31'),
(140, 58, 17, 1, '2017-09-13 13:46:21'),
(141, 4, 14, 3, '2017-09-14 12:21:44'),
(142, 40, 6, 1, '2017-09-14 12:22:10'),
(143, 63, 14, 4, '2017-09-14 03:21:53'),
(144, 30, 9, 3, '2017-09-14 12:42:05'),
(145, 26, 10, 2, '2017-09-14 03:16:32'),
(146, 40, 6, 1, '2017-09-14 10:20:50'),
(147, 28, 5, 1, '2017-09-14 05:16:32'),
(148, 36, 7, 4, '2017-09-14 04:53:07'),
(149, 31, 18, 4, '2017-09-14 03:31:55'),
(150, 10, 15, 1, '2017-09-14 06:42:40'),
(151, 40, 16, 2, '2017-09-14 09:37:54'),
(153, 52, 20, 4, '2017-09-14 11:25:12'),
(154, 45, 18, 3, '2017-09-14 16:36:04'),
(155, 61, 8, 4, '2017-09-14 11:00:18'),
(156, 19, 15, 4, '2017-09-14 06:41:17'),
(157, 58, 2, 2, '2017-09-14 09:43:58'),
(158, 19, 10, 1, '2017-09-14 05:41:23'),
(159, 55, 8, 3, '2017-09-14 09:25:59'),
(160, 39, 7, 3, '2017-09-14 11:24:58'),
(161, 45, 1, 2, '2017-09-14 11:28:06'),
(162, 57, 9, 2, '2017-09-14 04:07:30'),
(163, 52, 17, 4, '2017-09-14 03:20:31'),
(164, 59, 5, 2, '2017-09-14 04:50:45'),
(165, 48, 20, 2, '2017-09-14 03:44:23'),
(166, 49, 3, 1, '2017-09-14 09:09:58'),
(167, 59, 19, 3, '2017-09-14 14:23:50'),
(168, 63, 3, 1, '2017-09-14 12:45:16'),
(169, 40, 12, 2, '2017-09-14 02:42:16'),
(171, 27, 5, 2, '2017-09-14 10:17:32'),
(172, 15, 3, 4, '2017-09-14 11:18:25'),
(173, 56, 18, 3, '2017-09-14 04:30:27'),
(174, 45, 12, 4, '2017-09-14 08:11:37'),
(175, 63, 20, 1, '2017-09-14 09:36:02'),
(176, 63, 15, 4, '2017-09-14 09:45:55'),
(177, 36, 8, 1, '2017-09-14 04:50:04'),
(178, 51, 1, 2, '2017-09-14 15:10:27'),
(179, 47, 3, 2, '2017-09-14 10:25:23'),
(180, 17, 5, 3, '2017-09-14 07:31:25'),
(181, 5, 3, 2, '2017-09-15 08:28:02'),
(182, 5, 12, 1, '2017-09-15 10:01:27'),
(183, 5, 16, 2, '2017-09-15 15:35:51'),
(184, 9, 19, 3, '2017-09-15 08:46:46'),
(185, 9, 13, 3, '2017-09-15 04:08:00'),
(186, 9, 9, 4, '2017-09-15 08:15:33'),
(187, 11, 13, 4, '2017-09-15 08:08:37'),
(188, 11, 16, 3, '2017-09-15 12:02:55'),
(189, 11, 15, 3, '2017-09-15 02:39:32'),
(190, 16, 14, 2, '2017-09-15 03:36:58'),
(191, 16, 16, 1, '2017-09-15 02:40:46'),
(192, 16, 2, 4, '2017-09-15 02:44:31'),
(193, 19, 8, 2, '2017-09-15 05:03:31'),
(194, 19, 16, 3, '2017-09-15 13:01:37'),
(195, 19, 13, 3, '2017-09-15 15:09:17'),
(196, 20, 4, 2, '2017-09-15 15:58:13'),
(197, 20, 8, 3, '2017-09-15 04:47:29'),
(198, 20, 13, 1, '2017-09-15 02:44:35'),
(199, 22, 13, 3, '2017-09-15 09:18:04'),
(200, 22, 11, 4, '2017-09-15 04:37:57'),
(201, 22, 7, 3, '2017-09-15 16:57:08'),
(202, 24, 8, 2, '2017-09-15 12:54:30'),
(203, 24, 12, 2, '2017-09-15 02:30:12'),
(204, 24, 9, 3, '2017-09-15 13:56:00'),
(205, 25, 4, 2, '2017-09-15 09:42:17'),
(206, 25, 15, 2, '2017-09-15 04:26:58'),
(207, 25, 13, 2, '2017-09-15 06:12:49'),
(208, 33, 13, 2, '2017-09-15 04:44:18'),
(209, 33, 6, 3, '2017-09-15 03:13:14'),
(210, 33, 11, 2, '2017-09-15 04:10:57'),
(211, 34, 10, 4, '2017-09-15 06:35:55'),
(212, 34, 9, 1, '2017-09-15 04:07:46'),
(213, 34, 9, 4, '2017-09-15 08:57:34'),
(214, 35, 8, 3, '2017-09-15 13:56:06'),
(215, 35, 20, 4, '2017-09-15 14:31:50'),
(216, 35, 19, 3, '2017-09-15 06:28:34'),
(217, 36, 10, 3, '2017-09-15 07:35:57'),
(218, 36, 20, 4, '2017-09-15 15:22:00'),
(219, 36, 4, 2, '2017-09-15 04:23:42'),
(220, 37, 16, 2, '2017-09-15 08:51:57'),
(221, 37, 4, 3, '2017-09-15 15:52:49'),
(222, 37, 1, 1, '2017-09-15 02:48:31'),
(223, 41, 10, 1, '2017-09-15 04:58:42'),
(224, 41, 11, 1, '2017-09-15 09:01:41'),
(225, 41, 3, 1, '2017-09-15 14:53:15'),
(226, 46, 7, 3, '2017-09-15 02:23:46'),
(227, 46, 16, 2, '2017-09-15 10:19:35'),
(228, 46, 11, 2, '2017-09-15 03:14:32'),
(229, 47, 20, 3, '2017-09-15 14:44:35'),
(230, 47, 6, 4, '2017-09-15 11:58:25'),
(231, 47, 3, 1, '2017-09-15 04:15:05'),
(232, 50, 6, 1, '2017-09-15 08:52:37'),
(233, 50, 3, 1, '2017-09-15 04:07:28'),
(234, 50, 19, 3, '2017-09-15 07:11:56'),
(235, 55, 10, 2, '2017-09-15 03:23:02'),
(236, 55, 14, 4, '2017-09-15 03:42:08'),
(237, 55, 2, 3, '2017-09-15 05:18:00'),
(238, 61, 8, 3, '2017-09-15 05:56:37'),
(239, 61, 5, 2, '2017-09-15 15:05:06'),
(240, 61, 16, 1, '2017-09-15 06:53:54'),
(241, 64, 14, 4, '2017-09-15 13:26:55'),
(242, 64, 13, 1, '2017-09-15 07:20:51'),
(243, 64, 16, 3, '2017-09-15 04:05:10'),
(244, 66, 2, 2, '2017-09-15 07:11:41'),
(245, 66, 11, 1, '2017-09-15 02:53:59'),
(246, 66, 2, 4, '2017-09-15 11:41:39'),
(247, 11, 11, 1, '2017-09-16 03:00:00'),
(248, 54, 10, 1, '2017-09-15 03:13:00'),
(249, 11, 3, 1, '2017-09-16 03:15:00'),
(250, 54, 4, 1, '2017-09-16 03:20:00'),
(251, 1, 1, 0, '2017-11-12 13:53:08');

-- --------------------------------------------------------

--
-- Table structure for table `order_billing`
--

CREATE TABLE `order_billing` (
  `tableid` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_billing`
--

INSERT INTO `order_billing` (`tableid`, `orderid`, `userid`, `itemid`, `quantity`, `time`) VALUES
(1, 247, 11, 11, 1, '2017-09-16 03:00:00'),
(2, 248, 54, 10, 1, '2017-09-16 03:13:00'),
(1, 249, 11, 3, 1, '2017-09-16 03:15:00'),
(2, 250, 54, 4, 1, '2017-09-16 03:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `userid` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`userid`, `item_id`, `rating`) VALUES
(4, 1, 1),
(4, 14, 4),
(5, 3, 3),
(5, 10, 2),
(5, 12, 1),
(5, 16, 4),
(9, 9, 1),
(9, 13, 1),
(9, 19, 4),
(10, 2, 3),
(10, 17, 2),
(11, 13, 4),
(11, 15, 4),
(11, 16, 4),
(12, 13, 2),
(12, 18, 3),
(14, 8, 4),
(14, 17, 1),
(15, 7, 4),
(15, 11, 4),
(15, 20, 3),
(16, 2, 2),
(16, 14, 3),
(16, 16, 3),
(17, 1, 3),
(17, 11, 3),
(17, 16, 2),
(18, 2, 3),
(18, 4, 3),
(19, 6, 4),
(19, 8, 1),
(19, 13, 4),
(19, 16, 4),
(20, 4, 2),
(20, 8, 1),
(20, 13, 4),
(21, 18, 2),
(21, 19, 4),
(22, 7, 2),
(22, 8, 4),
(22, 11, 4),
(22, 13, 3),
(23, 3, 1),
(23, 5, 2),
(23, 11, 2),
(23, 12, 1),
(23, 16, 3),
(23, 18, 2),
(23, 20, 1),
(24, 2, 4),
(24, 8, 4),
(24, 9, 2),
(24, 12, 2),
(25, 4, 1),
(25, 8, 1),
(25, 13, 1),
(25, 15, 1),
(26, 10, 3),
(26, 11, 1),
(26, 13, 4),
(26, 17, 2),
(27, 8, 3),
(27, 18, 1),
(27, 19, 4),
(28, 3, 2),
(28, 20, 3),
(29, 4, 1),
(29, 14, 1),
(30, 2, 2),
(30, 7, 2),
(30, 9, 1),
(30, 17, 1),
(31, 5, 1),
(31, 6, 3),
(31, 8, 2),
(31, 11, 2),
(32, 4, 4),
(32, 9, 3),
(33, 6, 4),
(33, 11, 2),
(33, 13, 2),
(33, 15, 3),
(34, 9, 2),
(34, 10, 2),
(34, 13, 1),
(35, 2, 4),
(35, 8, 4),
(35, 19, 3),
(35, 20, 2),
(36, 4, 1),
(36, 10, 4),
(36, 19, 4),
(36, 20, 4),
(37, 1, 2),
(37, 4, 3),
(37, 16, 2),
(38, 8, 3),
(38, 9, 2),
(38, 12, 4),
(38, 18, 2),
(38, 19, 4),
(39, 3, 3),
(39, 18, 4),
(40, 6, 3),
(40, 8, 2),
(40, 14, 4),
(40, 17, 3),
(40, 18, 2),
(41, 3, 4),
(41, 10, 1),
(41, 11, 4),
(42, 15, 4),
(42, 19, 4),
(43, 9, 2),
(43, 19, 4),
(44, 2, 2),
(44, 4, 2),
(44, 5, 2),
(44, 11, 2),
(45, 14, 4),
(45, 17, 4),
(45, 20, 3),
(46, 7, 4),
(46, 11, 4),
(46, 13, 1),
(46, 16, 4),
(47, 3, 3),
(47, 6, 3),
(47, 20, 4),
(48, 7, 4),
(48, 12, 2),
(48, 15, 2),
(48, 18, 4),
(49, 4, 1),
(49, 17, 4),
(50, 1, 4),
(50, 3, 3),
(50, 6, 4),
(50, 19, 1),
(51, 13, 3),
(51, 15, 4),
(51, 17, 4),
(51, 18, 2),
(52, 8, 1),
(52, 17, 4),
(53, 4, 4),
(53, 11, 4),
(53, 16, 3),
(54, 2, 1),
(54, 13, 1),
(54, 18, 3),
(54, 19, 3),
(55, 2, 3),
(55, 10, 2),
(55, 14, 1),
(56, 8, 3),
(56, 11, 4),
(56, 15, 3),
(56, 17, 4),
(58, 8, 4),
(58, 14, 3),
(58, 17, 2),
(59, 6, 4),
(59, 8, 4),
(59, 10, 1),
(60, 1, 3),
(60, 6, 3),
(60, 14, 4),
(60, 19, 4),
(61, 5, 2),
(61, 8, 4),
(61, 16, 4),
(62, 14, 3),
(62, 18, 1),
(62, 19, 2),
(62, 20, 2),
(63, 6, 2),
(63, 14, 3),
(64, 9, 2),
(64, 13, 3),
(64, 14, 2),
(64, 16, 2),
(65, 4, 1),
(65, 11, 3),
(65, 16, 4),
(66, 2, 2),
(66, 11, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `emailid` varchar(40) NOT NULL,
  `userid` int(11) NOT NULL,
  `password` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `autorization` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
('a@gmail.com', 51, 'asdfa', 'adfa', 'Customer'),
('Ram.Prasad20@hotmail.com', 52, 'YlMdrYBXw', 'Ram', 'Customer'),
('Ram.Shankar0@yahoo.com', 53, 'LXhGOBP', 'Ram', 'Customer'),
('Rajesh.John60@gmail.com', 54, 'DzfEVHyZZ', 'Rajesh', 'Customer'),
('Rajesh.Jain64@gmail.com', 55, 'TJGNaZhIL', 'Rajesh', 'Customer'),
('Sam.Kumar95@hotmail.com', 56, 'wiDGubSea', 'Sam', 'Customer'),
('Rajesh.Prasad6@live.com', 57, 'wKMDaxDs', 'Rajesh', 'Customer'),
('Sham.Jain30@live.com', 58, 'NQcRSXBYH', 'Sham', 'Customer'),
('Sam.Bhat84@hotmail.com', 59, 'MHtQdfS', 'Sam', 'Customer'),
('Tom.Jain58@hotmail.com', 60, 'hQKRchVG', 'Tom', 'Customer'),
('Surya.Jain50@hotmail.com', 61, 'vSltHeQ', 'Surya', 'Customer'),
('Surya.Iyer68@gmail.com', 62, 'tKQBhyJNV', 'Surya', 'Customer'),
('Sham.Kumar8@yahoo.com', 63, 'augwwZoB', 'Sham', 'Customer'),
('Surya.Bhat94@live.com', 64, 'gJXaRqPP', 'Surya', 'Customer'),
('Sam.Prasad16@live.com', 65, 'bubHRmH', 'Sam', 'Customer'),
('Sam.Iyer51@hotmail.com', 66, 'wJYiQjUYl', 'Sam', 'Customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `current_orders`
--
ALTER TABLE `current_orders`
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
-- Indexes for table `orders_log`
--
ALTER TABLE `orders_log`
  ADD PRIMARY KEY (`orderid`,`userid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `order_billing`
--
ALTER TABLE `order_billing`
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
  MODIFY `ing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `orders_log`
--
ALTER TABLE `orders_log`
  MODIFY `orderid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;
--
-- AUTO_INCREMENT for table `order_billing`
--
ALTER TABLE `order_billing`
  MODIFY `orderid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `current_orders`
--
ALTER TABLE `current_orders`
  ADD CONSTRAINT `current_orders_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`);

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
-- Constraints for table `orders_log`
--
ALTER TABLE `orders_log`
  ADD CONSTRAINT `orders_log_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);

--
-- Constraints for table `order_billing`
--
ALTER TABLE `order_billing`
  ADD CONSTRAINT `order_billing_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
