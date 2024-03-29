-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2024 at 07:39 PM
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
-- Database: `e-commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `ProductId` varchar(500) DEFAULT NULL,
  `ProductName` varchar(20) NOT NULL,
  `ProductPrice` varchar(200) DEFAULT NULL,
  `ProductPhoto` varchar(200) NOT NULL,
  `ProductQuantity` varchar(20) NOT NULL,
  `CustomerId` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ordertable`
--

CREATE TABLE `ordertable` (
  `id` int(11) NOT NULL,
  `ProductName` varchar(20) NOT NULL,
  `ProductPhoto` varchar(200) NOT NULL,
  `ProductPrice` varchar(20) NOT NULL,
  `Total` varchar(20) NOT NULL,
  `CustomerId` varchar(20) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) NOT NULL DEFAULT '1',
  `OrderStatus` varchar(20) NOT NULL DEFAULT 'Success',
  `payment_gateway` varchar(150) NOT NULL DEFAULT 'COD',
  `razorpay_payment_id` varchar(200) DEFAULT NULL,
  `uniqueId` varchar(150) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ordertable`
--

INSERT INTO `ordertable` (`id`, `ProductName`, `ProductPhoto`, `ProductPrice`, `Total`, `CustomerId`, `date`, `status`, `OrderStatus`, `payment_gateway`, `razorpay_payment_id`, `uniqueId`, `created_at`) VALUES
(10, 'Rajasd', 'user_profiles/asd.jpg', '13', '23', '5', '2023-04-14 23:30:39', '1', 'Success', 'Razorpay', 'pay_LdlM7Sf8mmk4AX', 'wEbRr', '2023-04-14 23:30:39'),
(11, 'Raj', 'user_profiles/thumbnail.jpg', '12', '35', '5', '2023-04-14 23:31:18', '1', 'Success', 'Razorpay', 'pay_LdlMkI38JWWHCZ', 'WoRlq', '2023-04-14 23:31:18'),
(12, 'Rajasd', 'user_profiles/asd.jpg', '13', '35', '5', '2023-04-14 23:31:18', '1', 'Success', 'Razorpay', 'pay_LdlMkI38JWWHCZ', 'WoRlq', '2023-04-14 23:31:18'),
(13, 'Rajasd', 'user_profiles/asd.jpg', '13', '23', '5', '2023-04-15 12:07:15', '1', 'Success', 'COD', NULL, 'mGv7Q', '2023-04-15 12:07:15'),
(14, 'Raj', 'user_profiles/thumbnail.jpg', '12', '22', '20', '2024-02-03 19:56:08', '1', 'Success', 'COD', NULL, 'BnooG', '2024-02-03 19:56:08');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Id` int(11) NOT NULL,
  `ProductName` varchar(20) NOT NULL,
  `ProductDescription` varchar(20) NOT NULL,
  `ProductPrice` varchar(20) NOT NULL,
  `ProductImage` varchar(200) NOT NULL,
  `ProductCategory` varchar(20) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Id`, `ProductName`, `ProductDescription`, `ProductPrice`, `ProductImage`, `ProductCategory`, `created`) VALUES
(1, 'Raj', 'hjkhj', '12', 'user_profiles/thumbnail.jpg', 'abc', '2023-03-19 21:12:24'),
(2, 'Rajasd', 'sadasd', '13', 'user_profiles/asd.jpg', 'xyz', '2023-03-20 00:57:41');

-- --------------------------------------------------------

--
-- Table structure for table `userregistration`
--

CREATE TABLE `userregistration` (
  `id` int(11) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Image` varchar(500) DEFAULT NULL,
  `DateOfBirth` varchar(20) NOT NULL,
  `Gender` varchar(20) NOT NULL,
  `Address` varchar(20) NOT NULL,
  `Number` varchar(20) NOT NULL,
  `admin` varchar(5) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userregistration`
--

INSERT INTO `userregistration` (`id`, `FirstName`, `LastName`, `Email`, `Password`, `Image`, `DateOfBirth`, `Gender`, `Address`, `Number`, `admin`, `created_at`) VALUES
(1, 'Raj', 'Mehta', 'admin@admin.com', '123456', 'user_profiles/thumbnail.jpg', '2022-02-13', 'male', 'sadasd', '9727896254', '1', '2023-03-19 23:25:54'),
(2, 'Raj', 'Mehta', 'admin12@admin.com', '123456', 'user_profiles/thumbnail1.jpg', '2023-03-20', 'female', 'near sai baba temple', '9727896254', '0', '2023-03-20 00:01:54'),
(3, 'nirmal', 'jadeja', 'nirmal@gmail.com', '123456', 'user_profiles/verna.jpg', '2023-04-15', '', 'abc', '8238483354', '0', '2023-04-01 13:09:10'),
(4, 'nirmal', 'jadeja', 'nirmaljadeja16@gmail', '123456', 'user_profiles/verna.jpg', '2023-04-05', '', 'Narsontekre', '9874563209', '0', '2023-04-04 12:31:32'),
(5, 'demo', 'demo', 'demo@gmail.com', '123456', 'user_profiles/verna.jpg', '2023-04-13', 'Male', 'abc', '9874563210', '0', '2023-04-13 16:44:48'),
(10, 'Ayush', 'Walekar', 'ayushwalekar03@gmail', '$2b$10$OGoiT.ezv.nbd', 'undefined', '', '', 'Loni Kalbhor', '', '0', '2024-02-03 12:18:09'),
(19, 'Ayush', 'Walekar', 'demo01@gmail.com', '$2b$10$3uRJ9Znersvf0', 'undefined', '', '', 'Loni Kalbhor', '', '0', '2024-02-03 19:50:10'),
(20, 'Ayush', 'Walekar', 'demo02@gmail.com', '$2b$10$C5Eg/Sb8Dy7sc9NIVRfnC.9MIADlq8j2BL2FdY0uKE47BorjaX3Ie', 'undefined', '', '', 'Loni Kalbhor', '', '0', '2024-02-03 19:53:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertable`
--
ALTER TABLE `ordertable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `userregistration`
--
ALTER TABLE `userregistration`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `ordertable`
--
ALTER TABLE `ordertable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `userregistration`
--
ALTER TABLE `userregistration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
