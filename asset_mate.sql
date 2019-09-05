-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2019 at 03:48 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asset_mate`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminId` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `departmentIdFK` int(11) NOT NULL,
  `mobileNumber` varchar(50) NOT NULL,
  `emailId` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminId`, `firstName`, `lastName`, `departmentIdFK`, `mobileNumber`, `emailId`, `password`, `createdOn`, `updatedOn`, `isDeleted`) VALUES
(1, 'Ajay', 'Patil', 1, '9561093814', 'ajay@stackmint.com', 'ajay123', '2019-07-16 06:06:35', '2019-07-17 07:22:46', 0);

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `answerId` int(11) NOT NULL,
  `assetmentIdFK` int(11) NOT NULL,
  `questionIdFK` int(11) NOT NULL,
  `value` varchar(50) NOT NULL,
  `isDanger` int(2) NOT NULL DEFAULT '0',
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`answerId`, `assetmentIdFK`, `questionIdFK`, `value`, `isDanger`, `createdOn`, `updatedOn`, `isDeleted`) VALUES
(1, 5, 1, 'abc', 1, '2019-07-18 10:04:33', '2019-07-18 13:45:09', 0),
(2, 6, 1, 'abc', 1, '2019-07-18 10:06:09', '2019-07-18 10:06:09', 0),
(3, 7, 1, 'abc', 1, '2019-07-18 10:06:26', '2019-07-18 10:06:26', 0),
(4, 8, 2, '17-06-93', 1, '2019-07-18 10:08:28', '2019-07-18 10:48:57', 0),
(5, 9, 3, 'Male', 1, '2019-07-18 10:40:30', '2019-07-18 10:40:30', 0),
(6, 10, 4, 'Blue', 1, '2019-07-18 10:49:45', '2019-07-18 10:49:45', 0);

-- --------------------------------------------------------

--
-- Table structure for table `asset`
--

CREATE TABLE `asset` (
  `assetId` int(11) NOT NULL,
  `assetTitle` varchar(255) NOT NULL,
  `modelNumber` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(255) NOT NULL,
  `installationDate` date NOT NULL,
  `installationLocationTypeIdFK` int(11) NOT NULL,
  `installedLocation` varchar(255) NOT NULL,
  `userGuideBook` varchar(255) NOT NULL,
  `checkingDuration` varchar(50) NOT NULL,
  `durationTypeIdFK` int(11) NOT NULL,
  `assetCode` varchar(255) NOT NULL,
  `warrenty` varchar(50) NOT NULL,
  `warrantyDurationTypeIdFK` int(11) NOT NULL,
  `supplierIdFK` int(11) NOT NULL,
  `departmentIdFK` int(11) NOT NULL,
  `manufracturerIdFK` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `asset`
--

INSERT INTO `asset` (`assetId`, `assetTitle`, `modelNumber`, `description`, `image`, `installationDate`, `installationLocationTypeIdFK`, `installedLocation`, `userGuideBook`, `checkingDuration`, `durationTypeIdFK`, `assetCode`, `warrenty`, `warrantyDurationTypeIdFK`, `supplierIdFK`, `departmentIdFK`, `manufracturerIdFK`, `createdOn`, `updatedOn`, `isDeleted`) VALUES
(1, 'Eco Fire ABC Powder Fire Extinguisher', ' INV54439834', 'ECO FIRE ABC Powder Type (Stored Pressure) Fire Extinguisher 4 Kg. Capacity ISI Mark IS: 15683 operating temperature (-0) ºC to (+55) ºC and Fire Rating 2A & 21B type of fire filled with MAP Powder', '41rw7lJQ3aL.jpg', '2019-07-25', 3, 'Pune', 'hand-portable-dry-chemical-extinguishers-eaf8ef21.pdf', '3', 3, 'MOD548781235', '2', 3, 1, 1, 1, '2019-07-17 08:49:48', '2019-07-17 10:42:08', 0);

-- --------------------------------------------------------

--
-- Table structure for table `assetcatrelation`
--

CREATE TABLE `assetcatrelation` (
  `assetCatRelationId` int(11) NOT NULL,
  `assetIdFK` int(11) NOT NULL,
  `categoryIdFK` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assetcatrelation`
--

INSERT INTO `assetcatrelation` (`assetCatRelationId`, `assetIdFK`, `categoryIdFK`, `createdOn`, `updatedOn`, `isDeleted`) VALUES
(1, 1, 3, '2019-07-18 06:19:54', '2019-07-18 06:19:54', 0);

-- --------------------------------------------------------

--
-- Table structure for table `assetment`
--

CREATE TABLE `assetment` (
  `assetmentId` int(11) NOT NULL,
  `assetIdFK` int(11) NOT NULL,
  `assetmentTypeIdFK` int(11) NOT NULL,
  `onDate` datetime NOT NULL,
  `doneBy` int(11) NOT NULL DEFAULT '0',
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assetment`
--

INSERT INTO `assetment` (`assetmentId`, `assetIdFK`, `assetmentTypeIdFK`, `onDate`, `doneBy`, `createdOn`, `updatedOn`, `isDeleted`) VALUES
(1, 1, 1, '2019-07-17 10:16:00', 2, '2019-07-17 12:05:12', '2019-07-17 12:29:34', 0),
(2, 1, 2, '2019-07-17 08:12:00', 2, '2019-07-17 12:05:12', '2019-07-17 12:29:47', 0),
(5, 1, 1, '2019-07-18 15:07:33', 1, '2019-07-18 10:04:33', '2019-07-18 10:04:33', 0),
(6, 1, 1, '2019-07-18 15:07:09', 1, '2019-07-18 10:06:09', '2019-07-18 10:06:09', 0),
(7, 1, 1, '2019-07-18 15:07:26', 1, '2019-07-18 10:06:26', '2019-07-18 10:06:26', 0),
(8, 1, 2, '2019-07-18 15:07:28', 1, '2019-07-18 10:08:28', '2019-07-18 10:08:28', 0),
(9, 1, 2, '2019-07-18 16:07:29', 1, '2019-07-18 10:40:29', '2019-07-18 10:40:29', 0),
(10, 1, 1, '2019-07-18 16:07:45', 1, '2019-07-18 10:49:45', '2019-07-18 10:49:45', 0);

-- --------------------------------------------------------

--
-- Table structure for table `assetmenttype`
--

CREATE TABLE `assetmenttype` (
  `assetmentTypeId` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assetmenttype`
--

INSERT INTO `assetmenttype` (`assetmentTypeId`, `title`, `createdOn`, `updatedOn`, `isDeleted`) VALUES
(1, 'Audit/Inspection', '2019-07-17 11:49:23', '2019-07-17 11:49:23', 0),
(2, 'Maintenance', '2019-07-17 11:49:23', '2019-07-17 11:49:23', 0);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryId` int(11) NOT NULL,
  `parentId` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryId`, `parentId`, `title`, `createdOn`, `updatedOn`, `isDeleted`) VALUES
(1, 1, 'Electronic', '2019-07-18 06:18:36', '2019-07-18 06:18:36', 0),
(2, 2, 'Fire Brigade', '2019-07-18 06:18:36', '2019-07-18 06:18:36', 0),
(3, 2, 'Gas', '2019-07-18 06:18:36', '2019-07-18 06:18:36', 0),
(4, 2, 'Tank', '2019-07-18 06:18:36', '2019-07-18 06:18:36', 0),
(5, 3, 'Furniture', '2019-07-18 06:18:36', '2019-07-18 06:18:36', 0);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `departmentId` int(11) NOT NULL,
  `organizationIdFK` int(11) NOT NULL,
  `parentId` int(11) NOT NULL,
  `departmentTitle` varchar(255) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentId`, `organizationIdFK`, `parentId`, `departmentTitle`, `createdOn`, `updatedOn`, `isDeleted`) VALUES
(1, 1, 1, 'Purchasing', '2019-07-16 06:04:57', '2019-07-17 07:06:39', 0);

-- --------------------------------------------------------

--
-- Table structure for table `durationtype`
--

CREATE TABLE `durationtype` (
  `durationTypeId` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `durationtype`
--

INSERT INTO `durationtype` (`durationTypeId`, `title`, `createdOn`, `updatedOn`, `isDeleted`) VALUES
(1, 'Day', '2019-07-17 07:19:00', '2019-07-17 07:19:00', 0),
(2, 'Month', '2019-07-17 07:19:00', '2019-07-17 07:19:00', 0),
(3, 'Year', '2019-07-17 07:19:00', '2019-07-17 07:19:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `installationlocationtype`
--

CREATE TABLE `installationlocationtype` (
  `installationLocationTypeId` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `installationlocationtype`
--

INSERT INTO `installationlocationtype` (`installationLocationTypeId`, `title`, `createdOn`, `updatedOn`, `isDeleted`) VALUES
(1, 'Home', '2019-07-17 07:18:01', '2019-07-17 07:18:01', 0),
(2, 'Store', '2019-07-17 07:18:01', '2019-07-17 07:18:01', 0),
(3, 'Office', '2019-07-17 07:18:01', '2019-07-17 07:18:01', 0);

-- --------------------------------------------------------

--
-- Table structure for table `manufracturer`
--

CREATE TABLE `manufracturer` (
  `manufracturerId` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manufracturer`
--

INSERT INTO `manufracturer` (`manufracturerId`, `title`, `createdOn`, `updatedOn`, `isDeleted`) VALUES
(1, 'Volkswagen Group', '2019-07-17 07:05:22', '2019-07-17 07:16:46', 0);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notificationId` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notificationId`, `title`, `image`, `message`, `createdOn`, `updatedOn`, `isDeleted`) VALUES
(1, 'Test Notification', 'user.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2019-07-16 12:45:15', '2019-07-16 13:02:38', 0),
(2, 'Test Notification 1', 'user.png', 'Test Notification 1', '2019-07-16 13:16:19', '2019-07-16 13:16:19', 0);

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE `organization` (
  `organizationId` int(11) NOT NULL,
  `organizationName` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`organizationId`, `organizationName`, `description`, `createdOn`, `updatedOn`, `isDeleted`) VALUES
(1, 'Volkswagen', 'Headquartered in Pune, Maharashtra, the Volkswagen Group in India is represented by five brands: SKODA, Volkswagen, Audi, Porsche and Lamborghini. The Indian journey began with the launch of SKODA in 2001. Audi and Volkswagen entered in 2007, while Lamborghini and Porsche were introduced in 2012. Today, the Group upholds its mantle of superior engineering, with plants in Pune and Aurangabad working seamlessly to manufacture the world\'s most loved cars.', '2019-07-16 06:04:15', '2019-07-17 07:11:42', 0);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `questionId` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `questionTypeIdFK` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`questionId`, `title`, `questionTypeIdFK`, `createdOn`, `updatedOn`, `isDeleted`) VALUES
(1, 'What is your Name?', 1, '2019-07-17 13:56:52', '2019-07-17 13:56:52', 0),
(2, 'What is your DOB?', 2, '2019-07-17 13:56:52', '2019-07-17 13:56:52', 0),
(3, 'Your Gender?', 3, '2019-07-17 13:56:52', '2019-07-17 13:56:52', 0),
(4, 'What you Like?', 4, '2019-07-17 13:56:52', '2019-07-17 13:56:52', 0);

-- --------------------------------------------------------

--
-- Table structure for table `questioncatrelation`
--

CREATE TABLE `questioncatrelation` (
  `questionCatRelationId` int(11) NOT NULL,
  `questionIdFK` int(11) NOT NULL,
  `categoryIdFK` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questioncatrelation`
--

INSERT INTO `questioncatrelation` (`questionCatRelationId`, `questionIdFK`, `categoryIdFK`, `createdOn`, `updatedOn`, `isDeleted`) VALUES
(1, 2, 3, '2019-07-18 06:20:56', '2019-07-18 06:20:56', 0),
(2, 1, 3, '2019-07-18 06:20:56', '2019-07-18 06:20:56', 0),
(3, 4, 3, '2019-07-18 06:20:56', '2019-07-18 06:20:56', 0),
(4, 3, 3, '2019-07-18 06:20:56', '2019-07-18 06:20:56', 0);

-- --------------------------------------------------------

--
-- Table structure for table `questionoption`
--

CREATE TABLE `questionoption` (
  `questionOptionId` int(11) NOT NULL,
  `questionIdFK` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `isDanger` int(2) NOT NULL DEFAULT '0',
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questionoption`
--

INSERT INTO `questionoption` (`questionOptionId`, `questionIdFK`, `title`, `isDanger`, `createdOn`, `updatedOn`, `isDeleted`) VALUES
(1, 3, 'Male', 0, '2019-07-17 14:04:47', '2019-07-17 14:04:47', 0),
(2, 3, 'Female', 0, '2019-07-17 14:04:47', '2019-07-17 14:04:47', 0),
(3, 4, 'Red', 0, '2019-07-18 06:05:19', '2019-07-18 06:05:19', 0),
(4, 4, 'Green', 0, '2019-07-18 06:05:19', '2019-07-18 06:05:19', 0),
(5, 4, 'Blue', 0, '2019-07-18 06:05:19', '2019-07-18 06:05:19', 0),
(6, 4, 'Orange', 0, '2019-07-18 06:05:19', '2019-07-18 06:05:19', 0);

-- --------------------------------------------------------

--
-- Table structure for table `questiontype`
--

CREATE TABLE `questiontype` (
  `questionTypeId` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questiontype`
--

INSERT INTO `questiontype` (`questionTypeId`, `title`, `createdOn`, `updatedOn`, `isDeleted`) VALUES
(1, 'Input', '2019-07-17 13:54:56', '2019-07-17 13:54:56', 0),
(2, 'Date', '2019-07-17 13:54:56', '2019-07-17 13:54:56', 0),
(3, 'SingleOption', '2019-07-17 13:54:56', '2019-07-17 13:54:56', 0),
(4, 'MultiOption', '2019-07-17 13:54:56', '2019-07-17 13:54:56', 0);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `statusId` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplierId` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `businessName` varchar(255) NOT NULL,
  `mobileNumber` varchar(50) NOT NULL,
  `emailId` varchar(100) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplierId`, `firstName`, `lastName`, `businessName`, `mobileNumber`, `emailId`, `createdOn`, `updatedOn`, `isDeleted`) VALUES
(1, 'Spectrum ', 'Mapping', 'Motor Mechanic', '9999696595', 'spectrum.mapping@gmail.com', '2019-07-17 07:01:37', '2019-07-17 07:15:24', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `profileImage` varchar(255) NOT NULL,
  `departmentIdFK` int(11) NOT NULL,
  `mobileNumber` varchar(50) NOT NULL,
  `emailId` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `firstName`, `lastName`, `profileImage`, `departmentIdFK`, `mobileNumber`, `emailId`, `password`, `createdOn`, `updatedOn`, `isDeleted`) VALUES
(1, 'Ajay', 'Khatavkar', 'user.png', 1, '9579368483', 'ajaykhatavkar24@gmail.com', '123456789', '2019-07-16 06:07:26', '2019-07-16 06:43:01', 0),
(2, 'Mahesh', 'Lipane', 'user.png', 1, '9561093815', 'mahesh@stackmint.com', 'mahesh', '2019-07-16 09:52:43', '2019-07-16 09:53:04', 0),
(3, 'Shital', 'Powar', 'user.png', 1, '9632123652', 'shital@stackmint.com', 'shital123', '2019-07-16 12:42:08', '2019-07-16 12:42:23', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminId`),
  ADD KEY `departmentIdFK` (`departmentIdFK`);

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`answerId`),
  ADD KEY `assetmentIdFK` (`assetmentIdFK`),
  ADD KEY `questionIdFK2` (`questionIdFK`);

--
-- Indexes for table `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`assetId`),
  ADD KEY `installationLocationTypeIdFK` (`installationLocationTypeIdFK`),
  ADD KEY `durationTypeIdFK` (`durationTypeIdFK`),
  ADD KEY `warrentDurationTypeIdFK` (`warrantyDurationTypeIdFK`),
  ADD KEY `supplierIdFK` (`supplierIdFK`),
  ADD KEY `departmentIdFK2` (`departmentIdFK`),
  ADD KEY `manufracturerIdFK` (`manufracturerIdFK`);

--
-- Indexes for table `assetcatrelation`
--
ALTER TABLE `assetcatrelation`
  ADD PRIMARY KEY (`assetCatRelationId`),
  ADD KEY `assetIdFK` (`assetIdFK`),
  ADD KEY `categoryIdFK` (`categoryIdFK`);

--
-- Indexes for table `assetment`
--
ALTER TABLE `assetment`
  ADD PRIMARY KEY (`assetmentId`),
  ADD KEY `assetIdFK1` (`assetIdFK`),
  ADD KEY `assetmentTypeIdFK` (`assetmentTypeIdFK`),
  ADD KEY `doneByFK` (`doneBy`);

--
-- Indexes for table `assetmenttype`
--
ALTER TABLE `assetmenttype`
  ADD PRIMARY KEY (`assetmentTypeId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryId`),
  ADD KEY `parentIdFK1` (`parentId`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`departmentId`),
  ADD KEY `organizationIdFK` (`organizationIdFK`),
  ADD KEY `parentIdFK` (`parentId`);

--
-- Indexes for table `durationtype`
--
ALTER TABLE `durationtype`
  ADD PRIMARY KEY (`durationTypeId`);

--
-- Indexes for table `installationlocationtype`
--
ALTER TABLE `installationlocationtype`
  ADD PRIMARY KEY (`installationLocationTypeId`);

--
-- Indexes for table `manufracturer`
--
ALTER TABLE `manufracturer`
  ADD PRIMARY KEY (`manufracturerId`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notificationId`);

--
-- Indexes for table `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`organizationId`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`questionId`),
  ADD KEY `questionTypeIdFK` (`questionTypeIdFK`);

--
-- Indexes for table `questioncatrelation`
--
ALTER TABLE `questioncatrelation`
  ADD PRIMARY KEY (`questionCatRelationId`),
  ADD KEY `questionIdFK1` (`questionIdFK`),
  ADD KEY `categoryIdFK1` (`categoryIdFK`);

--
-- Indexes for table `questionoption`
--
ALTER TABLE `questionoption`
  ADD PRIMARY KEY (`questionOptionId`),
  ADD KEY `questionIdFK` (`questionIdFK`);

--
-- Indexes for table `questiontype`
--
ALTER TABLE `questiontype`
  ADD PRIMARY KEY (`questionTypeId`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`statusId`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplierId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `emailId` (`emailId`),
  ADD KEY `departmentIdFK1` (`departmentIdFK`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `answerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `asset`
--
ALTER TABLE `asset`
  MODIFY `assetId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `assetcatrelation`
--
ALTER TABLE `assetcatrelation`
  MODIFY `assetCatRelationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `assetment`
--
ALTER TABLE `assetment`
  MODIFY `assetmentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `assetmenttype`
--
ALTER TABLE `assetmenttype`
  MODIFY `assetmentTypeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `departmentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `durationtype`
--
ALTER TABLE `durationtype`
  MODIFY `durationTypeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `installationlocationtype`
--
ALTER TABLE `installationlocationtype`
  MODIFY `installationLocationTypeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `manufracturer`
--
ALTER TABLE `manufracturer`
  MODIFY `manufracturerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notificationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `organization`
--
ALTER TABLE `organization`
  MODIFY `organizationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `questionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `questioncatrelation`
--
ALTER TABLE `questioncatrelation`
  MODIFY `questionCatRelationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `questionoption`
--
ALTER TABLE `questionoption`
  MODIFY `questionOptionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `questiontype`
--
ALTER TABLE `questiontype`
  MODIFY `questionTypeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `statusId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplierId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `departmentIdFK` FOREIGN KEY (`departmentIdFK`) REFERENCES `department` (`departmentId`);

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `assetmentIdFK` FOREIGN KEY (`assetmentIdFK`) REFERENCES `assetment` (`assetmentId`),
  ADD CONSTRAINT `questionIdFK2` FOREIGN KEY (`questionIdFK`) REFERENCES `question` (`questionId`);

--
-- Constraints for table `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `departmentIdFK2` FOREIGN KEY (`departmentIdFK`) REFERENCES `department` (`departmentId`),
  ADD CONSTRAINT `durationTypeIdFK` FOREIGN KEY (`durationTypeIdFK`) REFERENCES `durationtype` (`durationTypeId`),
  ADD CONSTRAINT `installationLocationTypeIdFK` FOREIGN KEY (`installationLocationTypeIdFK`) REFERENCES `installationlocationtype` (`installationLocationTypeId`),
  ADD CONSTRAINT `manufracturerIdFK` FOREIGN KEY (`manufracturerIdFK`) REFERENCES `manufracturer` (`manufracturerId`),
  ADD CONSTRAINT `supplierIdFK` FOREIGN KEY (`supplierIdFK`) REFERENCES `supplier` (`supplierId`),
  ADD CONSTRAINT `warrentDurationTypeIdFK` FOREIGN KEY (`warrantyDurationTypeIdFK`) REFERENCES `durationtype` (`durationTypeId`);

--
-- Constraints for table `assetcatrelation`
--
ALTER TABLE `assetcatrelation`
  ADD CONSTRAINT `assetIdFK` FOREIGN KEY (`assetIdFK`) REFERENCES `asset` (`assetId`),
  ADD CONSTRAINT `categoryIdFK` FOREIGN KEY (`categoryIdFK`) REFERENCES `category` (`categoryId`);

--
-- Constraints for table `assetment`
--
ALTER TABLE `assetment`
  ADD CONSTRAINT `assetIdFK1` FOREIGN KEY (`assetIdFK`) REFERENCES `asset` (`assetId`),
  ADD CONSTRAINT `assetmentTypeIdFK` FOREIGN KEY (`assetmentTypeIdFK`) REFERENCES `assetmenttype` (`assetmentTypeId`),
  ADD CONSTRAINT `doneByFK` FOREIGN KEY (`doneBy`) REFERENCES `user` (`userId`);

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `parentIdFK1` FOREIGN KEY (`parentId`) REFERENCES `category` (`categoryId`);

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `organizationIdFK` FOREIGN KEY (`organizationIdFK`) REFERENCES `organization` (`organizationId`),
  ADD CONSTRAINT `parentIdFK` FOREIGN KEY (`parentId`) REFERENCES `department` (`departmentId`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `questionTypeIdFK` FOREIGN KEY (`questionTypeIdFK`) REFERENCES `questiontype` (`questionTypeId`);

--
-- Constraints for table `questioncatrelation`
--
ALTER TABLE `questioncatrelation`
  ADD CONSTRAINT `categoryIdFK1` FOREIGN KEY (`categoryIdFK`) REFERENCES `category` (`categoryId`),
  ADD CONSTRAINT `questionIdFK1` FOREIGN KEY (`questionIdFK`) REFERENCES `question` (`questionId`);

--
-- Constraints for table `questionoption`
--
ALTER TABLE `questionoption`
  ADD CONSTRAINT `questionIdFK` FOREIGN KEY (`questionIdFK`) REFERENCES `question` (`questionId`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `departmentIdFK1` FOREIGN KEY (`departmentIdFK`) REFERENCES `department` (`departmentId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
