-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2024 at 06:58 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `marketing`
--

-- --------------------------------------------------------

--
-- Table structure for table `area_masters`
--

CREATE TABLE `area_masters` (
  `Code` varchar(24) DEFAULT NULL,
  `ID` int(3) NOT NULL,
  `CLSSTATUS` varchar(10) DEFAULT NULL,
  `daystatus` varchar(2) DEFAULT NULL,
  `daystatus1` varchar(2) DEFAULT NULL,
  `othday` varchar(50) DEFAULT NULL,
  `othsttime` varchar(8) DEFAULT NULL,
  `othentime` varchar(8) DEFAULT NULL,
  `half` varchar(1) DEFAULT NULL,
  `full` varchar(1) DEFAULT NULL,
  `CompanyCode` varchar(255) NOT NULL,
  `Zone_ID` bigint(20) NOT NULL,
  `CreatedAt` varchar(10) DEFAULT NULL,
  `UpdatedAt` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `area_masters`
--

INSERT INTO `area_masters` (`Code`, `ID`, `CLSSTATUS`, `daystatus`, `daystatus1`, `othday`, `othsttime`, `othentime`, `half`, `full`, `CompanyCode`, `Zone_ID`, `CreatedAt`, `UpdatedAt`) VALUES
('BARASAT', 1, '', '5', '-1', 'thursday & monday', '', '', '0', '1', 'NSPL', 2, '', ''),
('BARUIPUR', 2, '', '', '', '', '', '', '', '', 'NSPL', 1, '', ''),
('BEHALA', 3, '', '5', '-1', 'Thursday Closed', '', '', '0', '1', 'NSPL', 1, '', ''),
('BHOWANIPUR', 4, '', '1', '-1', 'Sunday Closed', '', '', '0', '1', 'NSPL', 1, '', ''),
('BURROWBAZAR', 5, '', '1', '-1', 'Sunday Closed', '', '', '0', '1', 'NSPL', 1, '', ''),
('GARIA', 6, '', '5', '-1', '', '', '', '0', '0', 'NSPL', 1, '', ''),
('HOWRAH', 7, '', '5', '-1', 'SHALKIA', '', '', '0', '0', 'NSPL', 1, '', ''),
('RASHBEHARI', 8, '', '1', '-1', '', '', '', '0', '1', 'NSPL', 1, '', ''),
('SONARPUR', 10, '', '-1', '-1', 'Monday', '', '', '0', '1', 'NSPL', 1, '', ''),
('SHYAMBAZAR', 11, '', '1', '-1', 'Sunday Closed', '', '', '0', '1', 'NSPL', 1, '', ''),
('SALTLAKE', 13, '', '1', '-1', '', '', '', '0', '0', 'NSPL', 1, '', ''),
('RANIGUNG', 14, '', '5', '-1', '', '', '', '0', '1', 'NSPL', 1, '', ''),
('SAKCHI', 15, '', '3', '-1', '', '', '', '0', '1', 'NSPL', 1, '', ''),
('CAMACSTREET', 17, '', '1', '6', '', '', '', '0', '1', 'NSPL', 1, '', ''),
('BOWBAZAR (700012)', 18, '', '1', '-1', 'Sunday Closed', '', '', '0', '1', 'NSPL', 1, '', ''),
('GARIAHAT', 19, '', '1', '2', '', '10:00:00', '14:00:00', '1', '1', 'NSPL', 1, '', ''),
('BANGLADESH', 21, '', '', '', '', '', '', '', '', 'NSPL', 1, '', ''),
('JAMSHEDPUR', 22, '', '3', '-1', '', '', '', '0', '1', 'NSPL', 1, '', ''),
('ORISSA', 23, '', '', '', '', '', '', '', '', 'NSPL', 1, '', ''),
('DURGAPUR', 24, '', '2', '-1', '', '', '', '0', '1', 'NSPL', 1, '', ''),
('ALIPUR ROAD', 25, '', '', '', '', '', '', '', '', 'NSPL', 1, '', ''),
('COLLEGE STREET', 26, '', '1', '-1', 'Sunday Closed', '', '', '0', '1', 'NSPL', 1, '', ''),
('PARK STREET', 27, '', '1', '-1', '', '', '', '0', '1', 'NSPL', 1, '', ''),
('FORTNOX (700017)', 28, '', '-1', '-1', '', '', '', '0', '0', 'NSPL', 1, '', ''),
('DHARMATALA', 29, '', '', '', '', '', '', '', '', 'NSPL', 1, '', ''),
('BURDWAN', 30, '', '1', '7', 'Sunday Fullday Closed', '', '', '1', '1', 'NSPL', 1, '', ''),
('CENTRAL AVENUE', 31, '', '1', '-1', 'Sunday closed', '', '', '0', '1', 'NSPL', 1, '', ''),
('RANCHI', 32, '', '1', '-1', '', '', '', '0', '1', 'NSPL', 1, '', ''),
('SILIGURI', 33, '', '1', '-1', 'Sunday', '10:00:00', '08:00:00', '0', '1', 'NSPL', 1, '', ''),
('DARJEELING', 34, '', '', '', '', '', '', '', '', 'NSPL', 1, '', ''),
('CUTTACK (ORISSA)', 35, '', '-1', '-1', '', '', '', '0', '0', 'NSPL', 1, '', ''),
('BHUBANESWAR(ORISSA)', 36, '', '-1', '-1', '', '', '', '0', '0', 'NSPL', 1, '', ''),
('CHINSURAH', 37, '', '6', '5', '', '', '', '0', '0', 'NSPL', 1, '', ''),
('CHANDANNAGAR', 38, '', '3', '-1', 'Thursday Fullday Closed & daily 1 to 5 pm closed', '', '', '0', '1', 'NSPL', 1, '', ''),
('A.C.MARKET', 39, '', '', '', '', '', '', '', '', 'NSPL', 1, '', ''),
('RAHARA', 40, '', '', '', '', '', '', '', '', 'NSPL', 1, '', ''),
('BELGHORIA', 41, '', '5', '-1', 'thursday closed', '', '', '0', '1', 'NSPL', 1, '', ''),
('SODEPUR', 42, '', '5', '-1', 'Thursday Closed', '', '', '0', '1', 'NSPL', 1, '', ''),
('PARKCIRCUS', 43, '', '1', '-1', '', '', '', '0', '1', 'NSPL', 1, '', ''),
('BISTUPUR', 46, '', '3', '-1', 'Tuesday', '', '', '0', '1', 'NSPL', 1, '', ''),
('NEW ALIPUR', 47, '', '', '', '', '', '', '', '', 'NSPL', 1, '', ''),
('DUMDUM', 48, '', '', '', '', '', '', '', '', 'NSPL', 1, '', ''),
('RAJARHAT', 49, '', '3', '-1', '', '', '', '0', '0', 'NSPL', 1, '', ''),
('NAGER BAZAR', 50, '', '', '', '', '', '', '', '', 'NSPL', 1, '', ''),
('KANKINARA', 51, '', '2', '-1', 'daily 2 to 5pm closed', '', '', '0', '1', 'NSPL', 1, '', ''),
('DUNLOP', 52, '', '', '', '', '', '', '', '', 'NSPL', 1, '', ''),
('BARRACKPORE', 53, '', '5', '-1', 'daily 2 to 5pm closed', '', '', '0', '1', 'NSPL', 1, '', ''),
('SHAMNAGAR', 54, '', '1', '-1', '', '', '', '0', '1', 'NSPL', 1, '', ''),
('UTTARPARA', 55, '', '5', '-1', 'Thursday Closed & daily 1 to 5pm closed', '', '', '0', '1', 'NSPL', 1, '', ''),
('BELUR', 56, '', '5', '-1', 'daily 1 to 5 pm closed', '', '', '0', '1', 'NSPL', 1, '', ''),
('SRIRAMPORE', 57, '', '5', '-1', 'Thursday Closed', '', '', '0', '1', 'NSPL', 1, '', ''),
('RISHRA', 58, '', '5', '-1', '', '', '', '0', '0', 'NSPL', 1, '', ''),
('BANDEL', 59, '', '3', '4', '', '', '', '0', '0', 'NSPL', 1, '', ''),
('DUM DUM CANTT', 60, '', '2', '-1', '', '', '', '0', '1', 'NSPL', 1, '', ''),
('MADHYAMGRAM', 61, '', '-1', '-1', '', '', '', '0', '0', 'NSPL', 1, '', ''),
('BARISHA', 62, '', '2', '-1', 'Monday Fullday Closed', '', '', '0', '1', 'NSPL', 1, '', ''),
('JAIPUR', 63, '', '-1', '-1', '', '', '', '0', '0', 'NSPL', 1, '', ''),
('NAIHATI', 64, '', '2', '-1', 'all day 10:30 to 2pm and 5 to 8pm', '', '', '0', '1', 'NSPL', 1, '', ''),
('BENACHITY', 65, '', '2', '-1', 'Monday Closed', '', '', '0', '1', 'NSPL', 1, '', ''),
('ASANSOL', 66, '', '5', '1', 'Thursday Fullday Closed', '', '', '0', '1', 'NSPL', 1, '', ''),
('CHHATTISGARH', 67, '', '-1', '-1', '', '', '', '0', '0', 'NSPL', 1, '', ''),
('ULUBERIA', 68, '', '5', '-1', 'Thursday Closed & 2 pm to 5 pm closed others day', '', '', '0', '1', 'NSPL', 1, '', ''),
('BELEGHATA', 69, '', '5', '-1', 'Thursday Closed', '', '', '0', '1', 'NSPL', 1, '', ''),
('ULTADANGA', 70, '', '-1', '-1', '', '', '', '0', '0', 'NSPL', 1, '', ''),
('PASCHIM MIDNAPORE', 71, '', '5', '-1', '', '', '', '0', '1', 'NSPL', 1, '', ''),
('KHARAGPUR', 72, '', '2', '-1', 'Gate Bazar (Mon),Gole,Malancha,Kharida(Thus)-Close', '', '', '0', '1', 'NSPL', 1, '', ''),
('CONTAI', 73, '', '7', '-1', 'Saturday Closed', '', '', '0', '1', 'NSPL', 1, '', ''),
('DURGACHAK', 74, '', '-1', '-1', 'daile 2 to 6pm closed', '', '', '0', '0', 'NSPL', 1, '', ''),
('SHIBPUR', 81, '', '5', '-1', 'Thursday Closed', '', '', '0', '1', 'NSPL', 1, '', ''),
('BAGHAJATIN', 83, '', '-1', '-1', '', '', '', '0', '1', 'NSPL', 1, '', ''),
('KHARDHA', 85, '', '5', '-1', 'Daily closed 1:30 to 5:30 pm', '', '', '0', '1', 'NSPL', 1, '', ''),
('DHANBAD', 86, '', '1', '-1', 'Sunday', '', '', '0', '1', 'NSPL', 1, '', ''),
('LAKE GARDENS', 89, '', '-1', '-1', '', '', '', '0', '1', 'NSPL', 1, '', ''),
('NEW MARKET', 90, '', '-1', '-1', '', '', '', '0', '1', 'NSPL', 1, '', ''),
('CHAS', 91, '', '-1', '-1', '', '', '', '0', '1', 'NSPL', 1, '', ''),
('BOKARO', 92, '', '-1', '-1', '', '', '', '0', '1', 'NSPL', 1, '', ''),
('BIDHAN SARANI', 94, '', '1', '-1', 'BIDHAN SARANI', '', '', '0', '1', 'NSPL', 1, '', ''),
('KOLKATA', 96, '', '-1', '-1', '', '', '', '0', '1', 'NSPL', 1, '', ''),
('KAKURGACHI (700054)', 99, '', '-1', '-1', '', '', '', '0', '1', 'NSPL', 1, '', ''),
('HABRA', 100, '', '5', '-1', '', '', '', '0', '1', 'NSPL', 1, '', ''),
('CHAKDAHA', 101, '', '-1', '-1', '', '', '', '0', '1', 'NSPL', 1, '', ''),
('RANAGHAT', 102, '', '2', '-1', '', '', '', '0', '1', 'NSPL', 1, '', ''),
('GIRISH PARK', 103, '', '1', '-1', '', '', '', '0', '1', 'NSPL', 1, '', ''),
('LEE ROAD', 104, '', '-1', '-1', '', '', '', '0', '0', 'NSPL', 1, '', ''),
('HALDIA (PURBA  MEDNIPUR)', 106, '', '2', '3', 'tuesday morning half closed', '', '', '0', '0', 'NSPL', 1, '', ''),
('LAKE TOWN (700089)', 107, '', '1', '-1', 'Sunday Closed', '', '', '0', '1', 'NSPL', 1, '', ''),
('BAGUIATI (700059)', 108, '', '1', '-1', 'Sunday Closed', '', '', '0', '1', 'NSPL', 1, '', ''),
('KHIDDERPORE', 109, '', '1', '-1', 'Sunday', '', '', '0', '1', 'NSPL', 1, '', ''),
('BARANAGAR', 110, '', '-1', '-1', '', '', '', '0', '0', 'NSPL', 1, '', ''),
('JHARKHAND', 112, '', '-1', '-1', '', '', '', '0', '0', 'NSPL', 1, '', ''),
('ALAMBAZAR', 113, '', '-1', '-1', '', '', '', '0', '0', 'NSPL', 1, '', ''),
('SINTHI MORE', 114, '', '1', '-1', '', '', '', '0', '0', 'NSPL', 1, '', ''),
('BAGNAN', 115, '', '-1', '-1', '', '', '', '0', '0', 'NSPL', 1, '', ''),
('AMTALA', 116, '', '-1', '-1', '', '', '', '0', '0', 'NSPL', 1, '', ''),
('SINGUR', 117, '', '-1', '-1', '', '', '', '0', '0', 'NSPL', 1, '', ''),
('MALDA', 118, '', '1', '-1', 'Sunday', '', '', '0', '1', 'NSPL', 1, '', ''),
('RAIPUR', 119, '', '1', '-1', 'Sunday Fullday', '', '', '0', '1', 'NSPL', 1, '', ''),
('BASIRHAT', 120, '', '7', '-1', 'Saturday Closed', '', '', '0', '1', 'NSPL', 1, '', ''),
('BIRATI', 124, '', '5', '-1', '', '', '', '0', '0', 'NSPL', 1, '', ''),
('KALNA', 173, '', '1', '-1', '', '', '', '0', '1', 'NSPL', 1, '', ''),
('TYYUFYUFGYU', 174, 'rtyrt', NULL, NULL, 'Monday', '02:20', '22:24', '1', '0', 'NSPL', 1, '2024-11-06', '2024-11-06');

-- --------------------------------------------------------

--
-- Table structure for table `business_masters`
--

CREATE TABLE `business_masters` (
  `ID` bigint(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `business_masters`
--

INSERT INTO `business_masters` (`ID`, `description`, `code`, `createdAt`, `updatedAt`) VALUES
(1, 'Large', 'A', '2024-11-25 13:49:15', '2024-11-25 13:49:15'),
(2, 'Medium', 'B', '2024-11-25 13:49:15', '2024-11-25 13:49:15'),
(3, 'Small', 'C', '2024-11-25 13:49:15', '2024-11-25 13:49:15');

-- --------------------------------------------------------

--
-- Table structure for table `city_masters`
--

CREATE TABLE `city_masters` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `id_state` bigint(20) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city_masters`
--

INSERT INTO `city_masters` (`ID`, `NAME`, `id_state`, `createdAt`, `updatedAt`) VALUES
(1, 'Kolkata', 28, '2024-11-07 08:02:12', '2024-11-07 08:02:12'),
(2, 'BANKURA', 28, '2024-11-13 10:39:57', '2024-11-13 10:39:57'),
(3, 'BURDWAN', 1, '2024-11-13 10:40:29', '2024-11-13 10:40:29'),
(4, 'DURGAPUR', 1, '2024-11-13 10:49:53', '2024-11-13 10:49:53'),
(5, 'DHAKA', 29, '2024-12-10 04:59:31', '2024-12-10 04:59:31');

-- --------------------------------------------------------

--
-- Table structure for table `companymasters`
--

CREATE TABLE `companymasters` (
  `CompanyCode` varchar(255) NOT NULL,
  `LoginCode` bigint(20) NOT NULL,
  `UUID` varchar(255) NOT NULL,
  `companyName` varchar(255) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `ContactNumber` varchar(255) DEFAULT NULL,
  `GSTIN` varchar(255) DEFAULT NULL,
  `PANNo` varchar(255) DEFAULT NULL,
  `Country` varchar(255) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `companymasters`
--

INSERT INTO `companymasters` (`CompanyCode`, `LoginCode`, `UUID`, `companyName`, `Address`, `ContactNumber`, `GSTIN`, `PANNo`, `Country`, `Status`, `createdAt`, `updatedAt`) VALUES
('NSPL', 9999999999, '6621fcc9-ca62-4616-b75d-3987213f5de5', 'Nimbus Systems Pvt Ltd', '2/140, Bosepukur Purbapara, Ground Floor, A-road, Haltu, Haltu, Kolkata, West Bengal 700078', '033 3297 7815', '06BZAHM6385P6Z2', 'POIU5698K', 'INDIA', 1, '2024-10-17 11:30:44', '2024-10-17 11:30:44'),
('XYZ', 1234567890, '6621fcc9-ca62-4616-b75d-3987213f5de5', 'Sample Company', '123 Sample Street, Sample City, Country', '+1234567890', 'GSTIN1234567', 'ABCDE1234F', 'BANGLADESH', 1, '2024-12-06 08:09:00', '2024-12-06 08:09:00'),
('ABC', 8888888888, '1eed823e-f543-4b6c-b2e5-8e89256fb0fc', 'ABC Company', 'Jaipur', '8888888888', '887gjhg', 'jhgjh677678', 'BANGLADESH', 1, '2024-12-29 00:00:00', '2024-12-23 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `country_masters`
--

CREATE TABLE `country_masters` (
  `ID` bigint(20) NOT NULL,
  `Country_name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `country_masters`
--

INSERT INTO `country_masters` (`ID`, `Country_name`, `createdAt`, `updatedAt`) VALUES
(1, 'India', '2024-11-07 06:57:01', '2024-11-07 06:57:01'),
(6, 'CHINA', '2024-11-12 13:20:27', '2024-11-12 13:20:27'),
(7, 'RUSSIA', '2024-11-12 13:26:09', '2024-11-12 13:26:09'),
(8, 'BANGLADESH', '2024-12-09 00:00:00', '2024-12-09 00:00:00'),
(9, 'USA', '2024-12-10 12:36:03', '2024-12-10 12:36:03'),
(10, 'JAPAN', '2024-12-10 12:37:27', '2024-12-10 12:37:27'),
(11, 'AUSTRALIA', '2024-12-10 12:39:01', '2024-12-10 12:39:01');

-- --------------------------------------------------------

--
-- Table structure for table `customer_details`
--

CREATE TABLE `customer_details` (
  `ID` int(3) NOT NULL,
  `Vounum` varchar(6) DEFAULT NULL,
  `Voudate` varchar(10) DEFAULT NULL,
  `vousrl` int(2) DEFAULT NULL,
  `Id_Name` int(4) DEFAULT NULL,
  `Acctdate` varchar(10) DEFAULT NULL,
  `detail` varchar(194) DEFAULT NULL,
  `PMODE` int(1) DEFAULT NULL,
  `CompanyCode` varchar(4) DEFAULT NULL,
  `CreatedAt` varchar(10) DEFAULT NULL,
  `UpdatedAt` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_details`
--

INSERT INTO `customer_details` (`ID`, `Vounum`, `Voudate`, `vousrl`, `Id_Name`, `Acctdate`, `detail`, `PMODE`, `CompanyCode`, `CreatedAt`, `UpdatedAt`) VALUES
(1, '072067', '11/01/2019', 6, 3160, '27/02/2019', 'he said now his jewellery buseness is closed, so not need', 1, 'NSPL', '', ''),
(2, '072068', '11/01/2019', 22, 1830, '23/01/2019', 'number not connecting', 1, 'NSPL', '', ''),
(3, '072069', '11/01/2019', 10, 1242, '14/01/2019', 'number not connecting', 1, 'NSPL', '', ''),
(4, '072070', '11/01/2019', 12, 2596, '07/02/2019', 'he said he use other jewellery software, so not need', 1, 'NSPL', '', ''),
(5, '072071', '11/01/2019', 4, 2773, '30/01/2019', 'receive call and listeing all and said not need he happy with his manually work,', 1, 'NSPL', '', ''),
(6, '072072', '11/01/2019', 19, 486, '30/01/2019', 'he listeing all about this software, then he said he need some time for thinking about this software', 1, 'NSPL', '', ''),
(7, '072073', '11/01/2019', 37, 226, '14/01/2019', 'he said he can not know software, and never send a/c number', 1, 'NSPL', '', ''),
(8, '072074', '11/01/2019', 5, 2767, '15/01/2019', 'receive call and said hello then cut the call', 1, 'NSPL', '', ''),
(9, '072075', '11/01/2019', 18, 545, '15/01/2019', 'he said he is a software developer, so not need', 1, 'NSPL', '', ''),
(10, '072076', '11/01/2019', 21, 2754, '12/01/2019', 'he said he was busy with customer, need to call late', 1, 'NSPL', '', ''),
(11, '072077', '11/01/2019', 9, 555, '23/04/2020', '1st number was not excited, and 2nd number was wrong', 1, 'NSPL', '', ''),
(12, '072078', '11/01/2019', 15, 90, '23/01/2019', 'one leady receive  the call, said hello then put down the call to listeing the name of nimbus', 1, 'NSPL', '', ''),
(13, '072079', '11/01/2019', 18, 1273, '09/09/2020', 'this number not excited', 1, 'NSPL', '', ''),
(14, '072080', '11/01/2019', 15, 1183, '16/01/2019', 'number not connecting', 1, 'NSPL', '', ''),
(15, '072081', '11/01/2019', 14, 1855, '12/01/2019', '1st call receive only little girl and cut call, then kalidas babu receive call and said he was busy with famlily, follow up', 1, 'NSPL', '', ''),
(16, '072082', '11/01/2019', 8, 990, '12/01/2019', 'he said he was busy with customer, need to call later', 1, 'NSPL', '', ''),
(17, '072083', '11/01/2019', 3, 2382, '17/01/2019', 'one leady stuff receive the call and said there use rn jewellery software, so no requirement', 1, 'NSPL', '', ''),
(18, '072084', '11/01/2019', 8, 94, '12/01/2019', 'ringing bt not ans the call', 1, 'NSPL', '', ''),
(19, '072085', '11/01/2019', 2, 2338, '12/01/2019', 'one stuff receive the call, he said no body present in shop right now, need to call  later.', 1, 'NSPL', '', ''),
(20, '072086', '11/01/2019', 6, 1483, '12/01/2019', 'he said he was busy with customer', 1, 'NSPL', '', ''),
(21, '072087', '11/01/2019', 5, 1879, '12/01/2019', 'mr.baag said call back next day between 10 to 11 am.', 1, 'NSPL', '', ''),
(22, '072088', '11/01/2019', 6, 2051, '17/01/2019', 'he said he think about software when he will call back to us', 1, 'NSPL', '', ''),
(23, '072089', '11/01/2019', 4, 2313, '15/01/2019', 'put down the call listeing the name of nimbus', 1, 'NSPL', '', ''),
(24, '072090', '11/01/2019', 5, 2463, '12/01/2019', 'he said he was busy and cut the call', 1, 'NSPL', '', ''),
(25, '072091', '11/01/2019', 5, 2604, '31/01/2019', 'he said not interested', 1, 'NSPL', '', ''),
(26, '072092', '11/01/2019', 18, 298, '14/01/2019', 'ringing bt not ans the call', 1, 'NSPL', '', ''),
(27, '072093', '11/01/2019', 16, 3153, '14/01/2019', 'receive and cut the call', 1, 'NSPL', '', ''),
(28, '072094', '11/01/2019', 59, 2187, '14/01/2019', 'one stuff receive the call and said owner not present, need to call monday', 1, 'NSPL', '', ''),
(29, '072095', '11/01/2019', 22, 3167, '14/01/2019', 'one stuff receive call and said v.k.barma not present. need call later', 1, 'NSPL', '', ''),
(30, '072096', '11/01/2019', 36, 3135, '14/01/2019', 'he said next day he will come in exhibition', 1, 'NSPL', '', ''),
(31, '072097', '11/01/2019', 31, 3092, '14/01/2019', 'ringing bt not ans the call', 1, 'NSPL', '', ''),
(32, '072059', '11/01/2019', 9, 2014, '14/01/2019', 'he said his boss not present right now, he will come 5pm, need to call  this time, 2nd time call again, ringing bt not pick up the call', 1, 'NSPL', '', ''),
(33, '072098', '14/01/2019', 30, 1190, '16/01/2019', 'number not connecting', 1, 'NSPL', '', ''),
(34, '072099', '14/01/2019', 5, 3072, '15/01/2019', 'he receive the call and said hello then he cut the call', 1, 'NSPL', '', ''),
(35, '072100', '14/01/2019', 11, 1826, '16/01/2019', 'ringing bt not ans the call', 1, 'NSPL', '', ''),
(36, '072101', '14/01/2019', 14, 3011, '14/01/2019', 'one leady stuff receive the call and said no one present right now, need to call evening.', 1, 'NSPL', '', ''),
(37, '072102', '14/01/2019', 7, 2978, '16/01/2019', 'sagar majumdar said that his business was not big, he said need to some time for thinking about the software, when he also call back us', 1, 'NSPL', '', ''),
(38, '072103', '14/01/2019', 6, 3341, '15/01/2019', 'ringing bt not ans the call', 1, 'NSPL', '', ''),
(39, '072104', '14/01/2019', 3, 2065, '15/01/2019', 'number not connecting', 1, 'NSPL', '', ''),
(40, '072105', '14/01/2019', 10, 2777, '15/01/2019', 'one leady stuff receive call and said need to call late', 1, 'NSPL', '', ''),
(41, '072106', '14/01/2019', 7, 1483, '15/01/2019', 'he said he was busy with customer', 1, 'NSPL', '', ''),
(42, '072107', '14/01/2019', 6, 2463, '16/01/2019', 'he said he busy with customer, need to call late', 1, 'NSPL', '', ''),
(43, '072108', '14/01/2019', 11, 3145, '22/01/2019', '1st number was not respoinding, 2nd number was busy, then cfew minutes late call back from 2nd number, he said he use software, bt i conva our software details, he said he will come our office .', 1, 'NSPL', '', ''),
(44, '072109', '14/01/2019', 9, 94, '15/01/2019', 'ringing bt not ans the call', 1, 'NSPL', '', ''),
(45, '072110', '14/01/2019', 30, 2308, '24/01/2019', 'had a conversation with shibu babu, he said not interested', 1, 'NSPL', '', ''),
(46, '072111', '14/01/2019', 6, 2983, '22/01/2019', 'he said he non-registreted from gst, need to call later', 1, 'NSPL', '', ''),
(47, '072112', '14/01/2019', 11, 2390, '22/01/2019', 'he said he transfar my number his accountent', 1, 'NSPL', '', ''),
(48, '072113', '14/01/2019', 17, 2499, '16/01/2019', 'he said not need', 1, 'NSPL', '', ''),
(49, '072114', '14/01/2019', 50, 1961, '18/01/2019', 'not decided yet. when he decided about software he will call us', 1, 'NSPL', '', ''),
(50, '072115', '14/01/2019', 20, 1516, '22/01/2019', 'one leady receive call and talk very rud, and cut the call', 1, 'NSPL', '', ''),
(51, '072116', '14/01/2019', 6, 3074, '15/01/2019', 'he said owner not present, need to call late', 1, 'NSPL', '', ''),
(52, '072117', '14/01/2019', 8, 3188, '24/01/2019', 'had a conversation with mr.banka ji, he said not need', 1, 'NSPL', '', ''),
(53, '072118', '14/01/2019', 11, 1935, '23/01/2019', 'number not connecting', 1, 'NSPL', '', ''),
(54, '072119', '14/01/2019', 15, 1268, '14/01/2019', 'one stuff receive the call and said owner not present right now call back at 5pm', 1, 'NSPL', '', ''),
(55, '072120', '14/01/2019', 40, 109, '22/01/2019', 'he said this time no requierment', 1, 'NSPL', '', ''),
(56, '072121', '14/01/2019', 17, 931, '22/01/2019', 'receive and said hello then put down the call', 1, 'NSPL', '', ''),
(57, '072122', '14/01/2019', 15, 2786, '15/01/2019', 'all lines are busy', 1, 'NSPL', '', ''),
(58, '072123', '14/01/2019', 29, 247, '30/01/2019', 'he said not interested', 1, 'NSPL', '', ''),
(59, '072124', '14/01/2019', 60, 2187, '16/01/2019', 'one stuff receive the call, he give udyanal ji  number (9434055256), bt he can not receive the call', 1, 'NSPL', '', ''),
(60, '072125', '14/01/2019', 19, 298, '17/01/2019', 'he cut the call', 1, 'NSPL', '', ''),
(61, '072126', '14/01/2019', 9, 1116, '30/01/2019', 'he said no requierment', 1, 'NSPL', '', ''),
(62, '072127', '14/01/2019', 17, 3153, '17/01/2019', 'onne leady receive the call, she said  she can\'t understand the software', 1, 'NSPL', '', ''),
(63, '072128', '14/01/2019', 26, 1033, '13/11/2019', 'he said this time he will not prepaid to use software, he said he call next year', 1, 'NSPL', '', ''),
(64, '072129', '14/01/2019', 15, 2993, '22/01/2019', 'he said he trensfer my number in is boss', 1, 'NSPL', '', ''),
(65, '072130', '14/01/2019', 39, 1239, '22/01/2019', 'he said he need some time for decided about  this software', 1, 'NSPL', '', ''),
(66, '072131', '14/01/2019', 15, 1855, '28/01/2019', 'he said he was busy with customer', 1, 'NSPL', '', ''),
(67, '072132', '14/01/2019', 9, 990, '24/01/2019', 'they are using manuelly works, he want to know about this software', 1, 'NSPL', '', ''),
(68, '072133', '14/01/2019', 6, 1879, '17/01/2019', 'ninging bt not ans thr call, then she cut thr call', 1, 'NSPL', '', ''),
(69, '072134', '14/01/2019', 36, 1920, '15/01/2019', 'ringing bt not ans thr csll. need to call later', 1, 'NSPL', '', ''),
(70, '072135', '14/01/2019', 8, 2738, '15/01/2019', 'he receive and cut thr call', 1, 'NSPL', '', ''),
(71, '072136', '14/01/2019', 10, 2902, '15/01/2019', 'disconnected the call', 1, 'NSPL', '', ''),
(72, '072137', '14/01/2019', 24, 2473, '16/01/2019', 'he said need to call late', 1, 'NSPL', '', ''),
(73, '072138', '14/01/2019', 9, 2535, '20/02/2019', 'he said his main business was medicen shop, he use other software he sajusted a jewellery software, so he said he not need bt his medicens business software was mainly use', 1, 'NSPL', '', ''),
(74, '072139', '14/01/2019', 28, 790, '17/01/2019', 'he said he was busy with customer', 1, 'NSPL', '', ''),
(75, '072140', '14/01/2019', 40, 753, '15/01/2019', 'today naresh ji said his requierment, he need a kacha paka sagmented, he said his son want to see demo, bt he was busy this time, naresh ji tack his son and than he say the demo date', 1, 'NSPL', '', ''),
(76, '072141', '14/01/2019', 23, 3167, '24/01/2019', 'today he said this time he was very much busy, when he was free he will call to us fort demo', 1, 'NSPL', '', ''),
(77, '072142', '14/01/2019', 16, 2193, '21/01/2019', 'he said he will come back sunday. i need to call monday for fixed final demo date', 1, 'NSPL', '', ''),
(78, '072143', '14/01/2019', 17, 35, '14/01/2019', 'he said need to call 6pm', 1, 'NSPL', '', ''),
(79, '072144', '14/01/2019', 8, 488, '17/01/2019', 'he said need to call 2days later', 1, 'NSPL', '', ''),
(80, '072145', '14/01/2019', 25, 2588, '15/01/2019', 'ringing bt not ans the call', 1, 'NSPL', '', ''),
(81, '072146', '14/01/2019', 9, 3385, '25/01/2019', 'today he said this person not present he tack this s/w matter, so need to call later', 1, 'NSPL', '', ''),
(82, '072147', '14/01/2019', 7, 3395, '15/01/2019', 'ringing bt not ans the call', 1, 'NSPL', '', ''),
(83, '072148', '14/01/2019', 30, 2987, '25/01/2019', 'today he said call back 10days late because he busy his school sporce, so need to set 2nd time demo date in his shop.', 1, 'NSPL', '', ''),
(84, '072149', '14/01/2019', 17, 2871, '15/01/2019', 'today i talk his shop owner he said ansu was not present, he said he talk to ansu ji than he fixed demo.', 1, 'NSPL', '', ''),
(85, '072150', '14/01/2019', 9, 2758, '30/01/2019', 'today call he said need some time ', 1, 'NSPL', '', ''),
(86, '072151', '14/01/2019', 7, 3374, '30/01/2019', 'he said this time he use other software, he said when he needed he will contact us', 1, 'NSPL', '', ''),
(87, '072152', '14/01/2019', 15, 1282, '29/01/2019', 'he said he was busy with customer', 1, 'NSPL', '', ''),
(88, '072153', '14/01/2019', 8, 3163, '16/01/2019', 'he said he just come back today, need to call wednesday', 1, 'NSPL', '', ''),
(89, '072154', '14/01/2019', 13, 598, '15/01/2019', 'today call not connected', 1, 'NSPL', '', ''),
(90, '072155', '14/01/2019', 15, 1653, '15/01/2019', 'number was switch off', 1, 'NSPL', '', ''),
(91, '072156', '15/01/2019', 10, 94, '15/01/2019', 's.soni not present the shop. one stuff (pannalal) receive the call and said soni ji will come 2hrs later, need to call 2hrs later', 1, 'NSPL', '', ''),
(92, '072157', '15/01/2019', 12, 2693, '16/01/2019', 'receive and put down the call, can not talk any think', 1, 'NSPL', '', ''),
(93, '072158', '15/01/2019', 7, 3074, '17/01/2019', 'ringing bt not ans the call', 1, 'NSPL', '', ''),
(94, '072159', '15/01/2019', 7, 3341, '16/01/2019', 'ringing bt not ans the call', 1, 'NSPL', '', ''),
(95, '072160', '15/01/2019', 6, 3072, '17/01/2019', 'he said he was busy with customer, need to call later', 1, 'NSPL', '', ''),
(96, '072162', '15/01/2019', 35, 139, '16/01/2019', 'he said he was busy right now, so he said call back next dat at 12.30pm. need to call next day', 1, 'NSPL', '', ''),
(97, '072163', '15/01/2019', 13, 1955, '16/01/2019', 'ringing bt not ans the call', 1, 'NSPL', '', ''),
(98, '072164', '15/01/2019', 8, 1483, '16/01/2019', 'all lines are busy', 1, 'NSPL', '', ''),
(99, '072165', '15/01/2019', 11, 2777, '30/01/2019', 'surayjit day said there shop not gst register, he said any time he decided about software he will call us', 1, 'NSPL', '', ''),
(100, '072166', '15/01/2019', 11, 2902, '23/01/2019', 'put down the call listeing the name of nimbus', 1, 'NSPL', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer_masters`
--

CREATE TABLE `customer_masters` (
  `ID` int(4) NOT NULL,
  `id_area` int(3) DEFAULT NULL,
  `CoName` varchar(49) DEFAULT NULL,
  `Address` varchar(83) DEFAULT NULL,
  `Contact_Name` varchar(50) DEFAULT NULL,
  `Busi_size` bigint(20) DEFAULT NULL,
  `PinCode` varchar(6) DEFAULT NULL,
  `Mobile` varchar(10) DEFAULT NULL,
  `PhNo` varchar(13) DEFAULT NULL,
  `Remarks` varchar(112) DEFAULT NULL,
  `EMAIL` varchar(48) DEFAULT NULL,
  `ID_Country` bigint(20) DEFAULT NULL,
  `id_state` varchar(11) DEFAULT NULL,
  `id_city` varchar(10) DEFAULT NULL,
  `ID_Salesman` bigint(20) DEFAULT NULL,
  `ID_Industry` bigint(20) DEFAULT NULL,
  `REFNAME` varchar(255) DEFAULT NULL,
  `CompanyCode` varchar(4) DEFAULT NULL,
  `CreatedAt` varchar(10) DEFAULT NULL,
  `UpdatedAt` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_masters`
--

INSERT INTO `customer_masters` (`ID`, `id_area`, `CoName`, `Address`, `Contact_Name`, `Busi_size`, `PinCode`, `Mobile`, `PhNo`, `Remarks`, `EMAIL`, `ID_Country`, `id_state`, `id_city`, `ID_Salesman`, `ID_Industry`, `REFNAME`, `CompanyCode`, `CreatedAt`, `UpdatedAt`) VALUES
(2, 1, 'DAS&SONS JEWELLERS(BARASAT)', '9/12, K.N.C.Road, Barasat (N 24 Parganas) Near Bidhan Cinema ', 'DINESH BERA', 1, '', '9804879722', '', 'GOLD N SILVER/25621621/8013318011', 'dinesh.bera48@gmail.com', 1, '28', '1', 2, 1, NULL, 'NSPL', '', ''),
(3, 1, 'Invalid - P.C. ROY JAHUREE(BARASAT)', '96, K.B.Basu Road,Barsat ', 'Ashok Roy ', 2, '700124', '9231663904', '9231663904', '.....', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(4, 1, 'ROY BROTHERS JEWELLERS(BARASAT)', '23/2, K.B. Bose Road Barasat ', 'Parthapratim Roy ', 2, '700124', '9903573797', '03322562716', 'no comp', 'parthapratimroy@rediffmail.com', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(5, 1, 'NEW KALIMATA JEWELLERS(BARASAT)', '74/A, Pioneer Park, Barakpur Road, Barasat ', 'Sankar Kr Bakshi ', 1, '700124', '', '03325425253', 'interested', '', 1, '28', '1', 2, 1, NULL, 'NSPL', '', ''),
(6, 1, 'NEW LOKNATH JEWELLERS(BARASAT)', '14/1, K..B.Bosu Road (Beauti Market), Barasat ', ' B.K.Dhar', 2, '700124', '9831084197', '', '.........', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(7, 1, 'RITOMA JEWELLERS(BARASAT)', '33, K.B. Basu Road Haritala(Santiniketan Market ) Barasat ', 'Ritom Karmakar', 1, '700124', '9883236407', '9674095793', '..', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(8, 1, 'NEW LUCKY JEWELLERS (BARASAT)', '14a k.b. basu road, barasat (n 24 parganas) ', 'tapan chudhury ', 1, '0', '', '03325521628', '....', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(9, 1, 'BISWAKARMA JEWELLERY SHILPALAYA(BARASAT)', '12 No Rail Gate, Sangam Market, Barasat,(N 24 Parganas) ', 'Joytishghar ', 1, '700126', '9830272486', '03325244876', '....', '', 1, '28', '1', 4, 1, NULL, 'NSPL', '', ''),
(10, 1, 'H.BANIK JEWELLERS(BARASAT)', '74a/4, Pioneer Park 12 No Rail Gate(Colony More) Barasat ', 'DEEPAK BANIK', 1, '700125', '9830246272', '0332542 3390', ';;', '', 1, '28', '1', 3, 1, NULL, 'NSPL', '', ''),
(11, 1, 'Invalid - MANDIRA GOLD MEUSEUM(BARASAT)', '34/a, K.B.Basu Road,Barasat, ', 'Tapan Banik ', 1, '700124', '', '', ' .....', '', 1, '28', '1', 3, 1, NULL, 'NSPL', '', ''),
(13, 1, 'INVALID -APAN JEWELLERS (BARASAT)', '3, k.b. basu road, loknath market ', ' ', 1, '700124', '', '', 'bronze pack/9830092056/2552 5841', '', 1, '28', '1', 3, 1, NULL, 'NSPL', '', ''),
(14, 1, 'RADHA KRISHNA JEWELLERS(BARASAT)', '15 No K.B. Basu Road, Barasat', 'Subrata Malakar ', 1, '700124', '9432562322', '0335521653', 'no comp', '', 1, '28', '1', 3, 1, NULL, 'NSPL', '', ''),
(17, 2, 'KRISHNA KALI JEWELLERS(BARUIPUR)', 'baripur station road,kalitala (west) ', 'samarnath patra ', 1, '0', '9830065688', '98300 65688 ', ' CALL', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(20, 2, 'MAA JEWELLERS(BARUIPUR)', 'baruipur kachari bazar(between baruipur court&rail gate) ', 'ratna karmakar ', 1, '700144', '9831872184', '03324339416', 'after diwali ', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(21, 2, 'P.K. JEWELLERS(BARUIPUR)', 'bariuipur kachari bazar (near syndicate bank) m ', 'k. karmakar ', 1, '743302', '9433126533', '', 'after diwali ', '', 1, '28', '1', 4, 1, NULL, 'NSPL', '', ''),
(22, 2, 'LILA BACHAPATI JEWELLERS(BARUIPUR)', 'barupur kachaibazar ', 'chandi charan bhattacharjee/sougata bhattacharjee ', 1, '700144', '', '', 'after diwali /2433 0710 ', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(23, 3, 'PRATIMA JEWELLERS(BEHALA)', '4, roy bahadur road, behala, (near 14 no bus stand ', ' ', 1, '700034', '', '0334689755', '....', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(24, 3, 'NEW RAJLAKSHMI SILPA MANDIR(BEHALA)', '307, Dimond Harbour Road, (Near Behala Thana) ', ' ', 1, '700034', '', '0334786766', 'they ring back. Shop also in bowbazar', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(25, 3, 'DHAKESWARI GOLD MUSIUM(BEHALA)', '476,d.h.road, behala tram depo. ', 'subrata pal ', 1, '700034', '9830853082', '03323995773', 'No Computer', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(26, 3, 'INVALID -THE KUNDU JEWELLERS(BEHALA)', '1, Souren Roy Road, Behala Tram Depo, Near Elora Cinema Hall ', 'Subhash Kundu ', 1, '700034', '923062884', '', 'market down, so need time ', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(27, 3, 'TIRUPATI GOLD HOUSE(BEHALA)', '264, D.H.Road (Oppsit Behala Thana) ', 'DHIRAJ JI', 1, '700034', '9830243257', '03323491168', 'they ring back', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(28, 3, 'RAJLAKSMI JEWELLERY HOUSE(BEHALA)', '474/A, D.H. Road, Behala Tram Depo ', 'Shyamal Karmakar ', 1, '700034', '9830659398', '', 'Bikram', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(29, 3, 'RAJLAXMI SILPALAYA JEWELLERS(BEHALA)', '492, dimond harbour road,(beside behala flower market) ', 'sunil krishno karmakar ', 1, '700034', '2404 3729', '03323979197', 'cpu yes', '', 8, '28', '1', 1, 1, NULL, 'XYZ', '', ''),
(30, 3, 'SWARNA MANDIR JEWELLERS(BEHALA)', '5/A, Roy Bahadur Road, Behala ', 'Sandip Roy ', 1, '700034', '9830020880', '', 'interested, but no computer. Later ring back', '', 8, '28', '1', 1, 1, NULL, 'XYZ', '', ''),
(31, 3, 'M. B. BROTHERS JEWELLERS(BEHALA)', '264, D.H. Road ( Oppo  Behala Thana) ', ' S.N. Bharati', 1, '700034', '9836748605', '03323984276', ' ....', '', 8, '28', '1', 1, 1, NULL, 'XYZ', '', ''),
(32, 3, 'RAJLAKSMI SWARNALAYA(BEHALA)', '476, d.h. road(beside behala flower market) ', 'rabindra nath karmakar ', 1, '700034', '', '03324573805', 'interested.after demo purchase computer.', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(33, 3, 'VRIGURAM JEWELLERY(BEHALA)', '1, souren roy road(behala tram depot) ', ' ', 1, '700034', '', '03324453915', 'said ring back', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(34, 3, 'INVALID - NEW MATRI JEWELLERS(BEHALA)', '266a, D.H. Road, (Oppo-Behala P.S) ', ' ', 1, '700034', '', '03324683725', 'non existant', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(35, 3, 'M.K.JEWELLERS(BEHALA)', '6/2 roy bahadur road(between jems long and roynagar ', ' ', 1, '700034', '9330861567', '9330861567', ' CALL', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(36, 3, 'MATRI JEWELLERS(BEHALA)', '280, d.h. road,behala(oppo-14 no bus stand ', ' ', 1, '700034', '', '03324680251', 'Card_Survey', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(37, 3, 'B. BASAK & SONS(BEHALA)', '17, Souren Roy Road(Behala Tram Depot) ', 'S. Basak ', 1, '700034', '9831040577', '9831040577', 'have laptop.interested 20k package.ring back 19.9.08 ', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(38, 3, 'INVALID -NASKAR &SONS JEWELLERS(BEHALA)', '1/4, D.H.Road, Behala, ', 'Utpal Naskar ', 1, '700034', '', '', 'Visit at august. They ring back /9433236736/9433236736/2397 9425 ', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(39, 4, 'LAKSHMI JEWELLERS(BHOWANIPUR)', '138A, A.T.M ROAD(BHOWANIPUR)', 'SUBIR DEY', 1, '700025', '9051818278', '', '...', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(40, 139, 'INVALID -DFFGJ', 'XC', '', 1, '', '', '', 'XXGF', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(43, 6, 'KIRON JEWELLERY WORKS(GARIA)', '1/300,naktala ', 'puhpal karmakar ', 1, '700047', '9433789126', '9433789126', 'interested', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(44, 6, 'SHYAM SUNDAR JEWELLERY(GARIA)', '139,kanungo park, goria (5 no bustand) ', 'nikhil dhar', 1, '700084', '', '03324302254', 'big/ intrsted', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(45, 6, 'SANANDA JEWELLERS(GARIA)', 'P-78, RAJA S. C. MALLICK ROAD, GARIA ', 'SUBRATA PAUL', 1, '700084', '9836020451', '03324286556', '..', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(46, 7, 'MD NATH & OTHERS JEWELLES ', 'ramcharan seth road (ramrajatala road) ', 'goutam debnath ', 1, '711104', '', '0332627 2739 ', ' ', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(47, 7, 'MAITY GUINEA PALACE', '143/1/a, narasingha dutta road, shreema market, kadamtala ', ' SWAPON MAITEY', 1, '711101', '9830218632', '9830218632', 'he call back later.computer have.', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(48, 7, 'NEW ROY JEWELLERS ', '143/1/a, narasingha dutta road, kadamtala(oppo- kadamtala bustand shreema marker ) ', 'ashis roy ', 1, '711101', '9830727433', '9830727433', ' CALL', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(49, 7, 'A.M. JEWELLERS', '166/3,belilius road, kadamtala ', ' ', 1, '711101', '', '03326434323', ' ...', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(50, 7, 'WECO HOUE OF JEWELLARY', '157/4, narasingha dutta road, (near santi cinema) ', ' ', 1, '711101', 'small shop', '03328770780', ' DON\'T KNOW', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(51, 7, 'BISHALAKSHMI GOLD PALACE', '13, netaji subhash road,', 'Ajay Dutta/ partha dutta ', 1, '711101', '26509282', '03326410382', 'v.interested. must ring back after diwali', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(52, 7, 'TILOTTAMA GUINEA PALACE', 'ramcharan seth road, ramrajatala, ', 't. mitra ', 1, '711104', '9836770526', '0336272081', 'now motherboard problem.ring back 21.9.08 ', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(53, 7, 'GIRISH PALACE', '339,netaji subhas road, ', 'arun adhya ', 1, '711101', '9830253649', '03326412020', ' interest on cataloguewant demo. Price given 41k for catalogue,in lan every machine 13k., ring back after diwali', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(54, 7, 'DULAL CHANDRA SEN JEWELLERS', '31, g.t. road (south)dulalsen market ', 'Goutam Sen,Indrajit sen ', 1, '711101', '9830072128', '9830077674', 'Bikram', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(55, 7, 'INVALID -N.C. BASAK & SONNS', '346,netaji subhash road ', 'd. basak ', 1, '711101', '', '', 'ring back after 15.9.08.9831274673/2641 3132/9831274673', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(56, 7, 'R B. JEWELLERY', '44. Netaji subhas road(kalibabur bazar) ', 'joydeep pain ', 1, '711101', '', '', 'NO PC/033 2640 2434 ', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(57, 7, 'RATHNA BHANDAR JEWELLERS', '56, netaji subhas road ( near siddheswari mandir ) ', 'saurab jana ', 1, '711101', '9830816162', '', 'after durga puja visit there', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(58, 7, 'GOLD AND SILVER JEWELLERS', '280, netaji subhas road (oppo khuroot post office) ', 'amit manna', 1, '711101', '8013309082', '9433921209', 'after diwali ', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(59, 7, 'GOLD MUSEUM JEWELLERS', '142/2,narasingh dutta road, kadamtala,(bizali balak sangh club) ', 'sandip kolay ', 1, '711101', '9830683985', '9830683985', 'after diwali ', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(60, 7, 'GIRISH JEWELLERY CORNER', '493b/3, g.t.road (south) ', ' amit kr addhya', 1, '711102', '9830086733', '03326414514', 'ring back 19.9.08 ', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(61, 7, 'NILIMA JEWELLERY WORKS ', '180, g.t.road(south) ', 'prabir ghosh ', 1, '711102', '9831198577', '9831198577', 'interested, ring back after 2 pm.ring back 19.9.08 ', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(63, 8, 'K.B. PAULS & SONS JEWELLERS ', '159/1b, rash behari avenue(hindusthan mart no 1) ', ' ', 1, '700029', '', '033425506', 'interested', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(64, 4, 'G.C.DEY & SONS JEWELLERS(BHOWANIPUR)', '8A,.S.P.Mukherjee Road ', 'Chandra Dey & Kamal Dey ', 1, '700025', '9830237613', '9836023491', 'interested', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(65, 8, 'G.D. JEWELLERS', '220d, rash behari avenue(near garia hat market ) ', 'samir saha ', 1, '700019', '', '', '..', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(67, 17, 'INVALID -MALLIK JEWELLERS(CAMACSTREET)', 'anandlok\' flat no. 306, 227,a.j.c.bose roas,3rd floor, ', 'mrs ganguli ', 1, '700020', '', '', ' v.v.interested, ring back at corporate office (22836138).2283-6138 ', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(69, 10, 'NEW JEWELLERS MUSEUM', 'h.C. sarani, sonarpur ', 'GOBINDA PAUL', 1, '700150', '9433765198', '03324347258', 'interested', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(70, 10, 'INVALID -GOLD MANSION JEWELLERS', 'h.c. sarani, ', ' ', 1, '700150', '', '', 'interested/2434 3484 ', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(71, 10, 'MANIKANCHAN JEWELLERS', 'h.c. sarani ', 'lakshman ghosh ', 1, '700150', '9903235900', '', ' CALL', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(72, 10, 'N.P.JEWELLERS(SONARPUR)', 'h.c.sarani ', 'partha ghosh ', 1, '700150', '9831026830', '03324348469', 'SILVER PACK', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(73, 10, 'JEWELLERY MUSEUM', 'sonarpur, chandmari bridge ', 'Bholanath Paul', 1, '700150', '9831720776', '03324342884 ', 'interested', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(74, 10, 'ASHA GOLD PALACE(SONARPUR)', '', '', 1, '', '9748478800', '9830561753', 'after diwali ring back', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(75, 1, 'GOLD PLAZA(BARASAT)', '', 'Mr. Swapan Dhar', 1, '', '', '03325520150', 'interested in catalogue software', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(76, 7, 'S.B.JEWELLERS', '', 'Sukumar Banerjee', 1, '', '', '03326431983', 'highly interested of 20k,no computer, after diwali. (kadamtala)', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(77, 7, 'SRI BISHNU JEWELLERS', '', 'nanda das', 1, '', '9830646361', '9830646361', 'ring back after diwali. no computer', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(78, 11, 'DUTTA GUINEA MANSION(SHYAMBAZAR)', 'shyambazar,Near-Tram depu,behind- deam land nurshinghome.', 'Subra Dutta/Subhashish.', 1, '700004', '9831072465', '03325556776', 'Have pc', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(79, 11, 'SATHI JEWELLERS', '', 'Rana Saha', 1, '', '', '03325305202', 'interested ', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(80, 11, 'MANIKANCHAN JEWELLERS (PVT.) LTD.', '132/2A, BIDHAN SARANI, KOLKATA', 'R.PANDEY', 1, '', '', '03325303976', 'computer have.interested in software', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(81, 11, 'MODERN SEN JEWELLERS(SHYAMBAZAR)', '98/c,Arabinda Sarani, Kolkata,Hatibagan', 'Partha Sen', 1, '700006', '9830085057', '03325551276', 'Bikram', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(83, 4, 'S.DUTTA  & BROTHS JEWELLERS(BHOWANIPUR)', '138/C,Asutosh Mukherjee Road,', 'A.DUTTA', 1, '700025', '9830859614', '03324553026', '.....', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(84, 11, 'GHOSH JEWELLERS(SHYAMBAZAR)', '133,Bidhan Sarani (Fariapukur Junction) Kolkata', 'Subrata Ghosh(9831125042)', 1, '700004', '25541012', '03325430561', 'interested.computer have', 'ghosh_jewellers@yahoo.com', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(85, 11, 'SEN BROS', '101, Bidhan Sarani', 'Malay Paul', 1, '700004', '9732679797', '03325553611', 'interested,computer have', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(86, 11, 'GOLD QUEEN JEWELLERS (SHYAMBAZAR)', '1/1b, Naya Ratna Lane (Near Tram Depo, Dream land nursing home)', 'P Dhar', 1, '700004', '9831061078', '03325552725', 'interested ring back', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(88, 4, 'PRASAD GOLD PALACE(BHOWANIPUR)', '136-B,Ashutosh Mukherjee  Road', 'Shankar Karmakar', 1, '700025', '', '03324541831', 'two branch /other in gariahat no24403465 /has entry in marketting s/w', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(91, 13, 'BASAK JEWELLERY MUSEUM', 'AE-337, SALTLAKE, KOLKATA', 'A.K. BASAK', 1, '700064', '', '03323347192', 'Not Known', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(92, 5, 'B.RAMDEV & CO.(BHATTER)/UTHER SHOPE-BURROWBAZAR.', 'BURROWBAZAR,22,KALAKA STREET,NEAR-ICICI BANK.', 'Pawan Kr. Bhattar ', 1, '700064', '9831015078', '03323212105', 'Not Known', 'bramdeo_bhatter@yahoo.co.in', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(93, 13, 'BENOD BEHARI DUTT PVT.LTD.', 'BE-103,Saltlake(Kwality)', '', 1, '700064', '', '03323212055', 'Not Known', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(94, 13, 'SUHAG JEWELLERS', 'BE_99,Sector-I', 'S.SONI', 1, '700064', '983067130', '03323347130', 'Not Known', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(95, 13, 'SARKAR & SONS', 'AE-335,Salt Lake,Sec-1', 'BAPI HALDER', 1, '700064', '9830609071', '', 'Not Konwn', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(98, 11, 'SILPA BHARATI', '136/3A,Bidhan Sarani', 'S.Talukdar', 1, '700004', '', '03325435648', 'Not Known', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(100, 8, 'A.C. PAUL & BROS.', '203,Rashbehari Avenue,Ballygunge', 'Surajit Paul', 1, '700019', '(M)', '03324407907', 'no comp, but interested ', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(101, 8, 'DHAR & SONS JEWELLERS', '203,Rashbehari Avenue', 'partha dhar', 1, '700019', '9903120667', '03324402111', 'Not Known', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(102, 8, 'EAST BEGAL JEWELLERY MANSION', '193/2 Rasgbehari Avenue', 'aniruddha babu', 1, '700019', '9831473097', '03324405477', 'Not known', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(103, 8, 'TRIPURESW ARI JEWELLERY & WATCH CO', '193/2, Rash behari Avenue', '', 1, '700019', '', '03324405558', 'Not Known', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(104, 19, 'SURABALA SILPA MANDIR JEWELLERS', '226/C, Rashbehari Avenue ', 'sourav roy', 1, '700019', '', '03324408547', 'Not Known', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(105, 8, 'SENCO JEWELLERY EMPORIUM', '195/2,Rashbehari Avenue', '', 1, '700019', '', '03324409523', 'Not Known', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(106, 5, 'MAHABIR JEWELLERS (P) LTD(BURROWBAZAR)', '31/B,Adi Banstalla,BurraBazar/E-304,3rd floor,E block,City centre,Saltlake.', 'Arvind Danwar/Amit soni', 1, '', '9830226207', '03322737042', 'call', 'info@mahabirjewellers.com,,mj.arvind@yahoo.co.in', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(107, 14, 'SHREA JEWELLERS', '', '', 1, '', '', '', 'Visit at office ', 'paresh_pal2@yahoo.com', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(279, 19, 'MONIRAJ JEWELLERS(GARIAHAT)', '1/7A,dover lane,kolkata-700029', 'sulay dey', 1, '', '9903729818', '', 'they call us.manish da told dat dont calll them', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(672, 18, 'B.D. GOLD JEWELLERY(BOWBAZAR)', '162, bb ganguly street', 'joydeb saha', 1, '700012', '9830324917', '', 'have comp', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(674, 18, 'B DUTTA & SONS(BOWBAZAR)', '', 'M.Sardar', 1, '', '', '03323500518', 'no comp', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(902, 168, 'ANJALI JEWELLERS  (SHOP OPEN 10:00 AM  TO 8:30PM)', 'Akash Ganga Market Complex, Stall No 43, Manjushree More, Haldia, Purba Mednipur', '', 1, '', '0', '', 'No Comp', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(920, 107, 'G.D.PAUL & CO', 'P-129, Lake Town, Block-A,1st Floor, Kolkata,West Bengal,India,(Opp. Jaya Cinema)', 'dhruba paul', 1, '700089', '', '03325349043', '.........', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(921, 108, 'FANCY GOLD MUSEUM(BAGUIATI )', 'Baguiati A.C. Market, Shop No-G7,EB-21,Deshbandhu Nagar,Kolkata', 'Mira Karmakar', 1, '700059', '9231969857', '', '...........', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(1246, 72, 'MA KALI GUINEA PALACE(KHARAGPUR)', 'Golebazar,KHARAGPUR', '', 1, '', '', '03222227772', '....', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(1247, 72, 'GUPTA JEWELLERY HOUSE(KHARAGPUR)', '117, golebazar, near bhandari chowk, kharagpur', 'tapan gupta/ dipak gupta', 1, '721301', '9475884495', '033256453', '.....', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(1248, 72, 'GOURI SHANKAR JEWELLERS(KHARAGPUR)', 'KHARAGPUR,116,GOLE BAZAR', 'RAHUL GUPTA & LABH GUPTADURGAPRASAD GUPTA', 1, '', '', '033222256757', '......', 'soniankitarya@gmail.com', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(1249, 72, 'SUNNY JEWELLERS(KHARAGPUR)', 'Kharagpur', 'ANKIT SONI', 1, '', '9333412430', '033222255036', '........', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(1250, 72, 'SHIBSHANKAR JEWELLERS(KHARAGPUR)', 'Gole bazar,Kharagpur', '', 1, '', '9332466718', '', '......', '', 1, '28', '1', 1, 1, NULL, 'NSPL', '', ''),
(1251, 2, 'PWC pvt. Ltd.', '364, Ho Chi Minh Sarani\n37/1 Jayashree Park', 'Debolina Halder', 1, '700061', '9477850981', '9477850981', 'SADadasd', NULL, 1, '28', '1', 1, 1, 'gykukytuky', 'NSPL', '2024-11-07', '2024-11-07'),
(1252, 1, 'Das Bros & Co.', '37/1 Jayashree Park\nGreen field city', 'Debolina Halder', 1, '700061', '9477850981', '9477850981', 'afsfghfghfgh', NULL, 1, '28', '1', 1, 1, 'sdsdfaas', 'NSPL', '2024-11-07', '2024-11-07');

-- --------------------------------------------------------

--
-- Table structure for table `cust_type_masters`
--

CREATE TABLE `cust_type_masters` (
  `ID` bigint(20) NOT NULL,
  `type` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cust_type_masters`
--

INSERT INTO `cust_type_masters` (`ID`, `type`, `createdAt`, `updatedAt`) VALUES
(1, 'Retailer', '2024-11-26 05:35:08', '2024-11-26 05:35:08');

-- --------------------------------------------------------

--
-- Table structure for table `fbtype_masters`
--

CREATE TABLE `fbtype_masters` (
  `ID` bigint(20) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fbtype_masters`
--

INSERT INTO `fbtype_masters` (`ID`, `type_name`, `createdAt`, `updatedAt`) VALUES
(3, 'Fresh', '2024-11-26 06:56:35', '2024-11-26 06:56:35'),
(4, 'Again Call', '2024-11-26 06:56:45', '2024-11-26 06:56:45'),
(5, 'Ring Back', '2024-11-26 06:57:05', '2024-11-26 06:57:05');

-- --------------------------------------------------------

--
-- Table structure for table `feedback_transactions`
--

CREATE TABLE `feedback_transactions` (
  `id` bigint(20) NOT NULL,
  `Vounum` varchar(8) DEFAULT NULL,
  `Voudate` varchar(10) DEFAULT NULL,
  `ID_Customer` bigint(20) DEFAULT NULL,
  `Actiondate` date DEFAULT NULL,
  `Cust_Status` bigint(20) NOT NULL,
  `Remarks` varchar(255) DEFAULT NULL,
  `ID_USER` varchar(2) DEFAULT NULL,
  `CompanyCode` varchar(255) NOT NULL,
  `CreatedAt` varchar(10) DEFAULT NULL,
  `UpdatedAt` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `feedback_transactions`
--

INSERT INTO `feedback_transactions` (`id`, `Vounum`, `Voudate`, `ID_Customer`, `Actiondate`, `Cust_Status`, `Remarks`, `ID_USER`, `CompanyCode`, `CreatedAt`, `UpdatedAt`) VALUES
(1, '075621', '15/07/2019', 1, '0000-00-00', 3, '', '19', 'NSPL', '', ''),
(2, '073763', '18/04/2019', 2, '0000-00-00', 3, '', '19', 'NSPL', '', ''),
(3, '073456', '05/04/2019', 1, '0000-00-00', 3, '', '19', 'NSPL', '', ''),
(4, '076537', '17/07/2020', 2, '0000-00-00', 4, '', '17', 'NSPL', '', ''),
(5, '076157', '07/08/2019', 4477, '0000-00-00', 5, '', '19', 'NSPL', '', ''),
(6, '072357', '24/01/2019', 4478, '0000-00-00', 4, '', '17', 'NSPL', '', ''),
(7, '072323', '22/01/2019', 4479, '0000-00-00', 3, '', '17', 'NSPL', '', ''),
(8, '072324', '22/01/2019', 4480, '0000-00-00', 3, '', '17', 'NSPL', '', ''),
(9, '074470', '20/05/2019', 4481, '0000-00-00', 3, '', '19', 'NSPL', '', ''),
(10, '072961', '09/02/2019', 3260, '0000-00-00', 3, '', '17', 'NSPL', '', ''),
(11, '075671', '16/07/2019', 4483, '0000-00-00', 3, '', '15', 'NSPL', '', ''),
(12, '075672', '16/07/2019', 4484, '0000-00-00', 3, '', '15', 'NSPL', '', ''),
(13, '076359', '31/08/2019', 1970, '0000-00-00', 3, '', '19', 'NSPL', '', ''),
(14, '075673', '16/07/2019', 4485, '0000-00-00', 3, '', '15', 'NSPL', '', ''),
(15, '076225', '12/08/2019', 139, '0000-00-00', 3, '  ', '19', 'NSPL', '', ''),
(16, '00061354', '09/06/2018', 37, '0000-00-00', 3, '  ', '16', 'NSPL', '', ''),
(17, '00007268', '04/12/2012', 132, '0000-00-00', 3, ' RAJIB DA ', '6', 'NSPL', '', ''),
(18, '075481', '06/07/2019', 51, '0000-00-00', 3, '  ', '19', 'NSPL', '', ''),
(19, '00045824', '18/05/2015', 53, '0000-00-00', 3, ' BIKRAM ', '12', 'NSPL', '', ''),
(20, '00062557', '18/07/2018', 143, '0000-00-00', 3, ' RAJIB DA ', '16', 'NSPL', '', ''),
(21, '00016646', '10/10/2014', 144, '0000-00-00', 3, '  ', '6', 'NSPL', '', ''),
(22, '00000011', '07/12/2008', 104, '0000-00-00', 3, '  ', '', 'NSPL', '', ''),
(23, '076127', '06/08/2019', 145, '0000-00-00', 3, '  ', '19', 'NSPL', '', ''),
(24, '075226', '27/06/2019', 134, '0000-00-00', 3, '  ', '19', 'NSPL', '', ''),
(25, '00061769', '22/06/2018', 146, '0000-00-00', 3, '  ', '16', 'NSPL', '', ''),
(26, '00000016', '09/12/2008', 147, '0000-00-00', 3, '  ', '', 'NSPL', '', ''),
(27, '00001173', '24/12/2010', 149, '0000-00-00', 3, '  ', '6', 'NSPL', '', ''),
(28, '00049087', '28/08/2015', 416, '0000-00-00', 3, '  ', '12', 'NSPL', '', ''),
(29, '073053', '13/02/2019', 417, '0000-00-00', 3, '  ', '17', 'NSPL', '', ''),
(30, '00047027', '22/06/2015', 418, '0000-00-00', 3, '  ', '12', 'NSPL', '', ''),
(31, '00003332', '18/07/2011', 420, '0000-00-00', 3, '  ', '6', 'NSPL', '', ''),
(32, '00049085', '28/08/2015', 421, '0000-00-00', 3, '  ', '12', 'NSPL', '', ''),
(33, '00060909', '29/05/2018', 422, '0000-00-00', 3, '  ', '16', 'NSPL', '', ''),
(34, '00061667', '20/06/2018', 423, '0000-00-00', 3, '  ', '16', 'NSPL', '', ''),
(35, '074734', '28/05/2019', 424, '0000-00-00', 3, '  ', '19', 'NSPL', '', ''),
(36, '074841', '04/06/2019', 425, '0000-00-00', 3, '  ', '19', 'NSPL', '', ''),
(37, '00001488', '27/12/2010', 426, '0000-00-00', 3, '  ', '6', 'NSPL', '', ''),
(38, '00049107', '28/08/2015', 427, '0000-00-00', 3, '  ', '12', 'NSPL', '', ''),
(39, '00049116', '29/08/2015', 428, '0000-00-00', 3, '  ', '12', 'NSPL', '', ''),
(40, '00000223', '11/02/2009', 430, '0000-00-00', 3, '  ', '', 'NSPL', '', ''),
(41, '00062181', '04/07/2018', 105, '0000-00-00', 3, ' MANISH DA ', '16', 'NSPL', '', ''),
(42, '00043114', '23/02/2015', 101, '0000-00-00', 3, '  ', '12', 'NSPL', '', ''),
(43, '00049165', '31/08/2015', 153, '0000-00-00', 3, '  ', '12', 'NSPL', '', ''),
(44, '00061097', '05/06/2018', 9, '0000-00-00', 3, '  ', '16', 'NSPL', '', ''),
(45, '00014248', '05/07/2014', 3, '0000-00-00', 3, ' BIKRAM ', '10', 'NSPL', '', ''),
(46, '00061262', '07/06/2018', 205, '0000-00-00', 3, ' RAJIV DA ', '16', 'NSPL', '', ''),
(47, '072728', '02/02/2019', 212, '0000-00-00', 3, '  ', '17', 'NSPL', '', ''),
(48, '076208', '08/08/2019', 214, '0000-00-00', 3, ' BIKRAM ', '19', 'NSPL', '', ''),
(49, '00062561', '18/07/2018', 216, '0000-00-00', 3, '  ', '16', 'NSPL', '', ''),
(50, '00007293', '04/12/2012', 121, '0000-00-00', 3, ' RAJIB DA ', '6', 'NSPL', '', ''),
(51, '072558', '29/01/2019', 217, '0000-00-00', 3, ' BIKRAM ', '17', 'NSPL', '', ''),
(52, '074317', '14/05/2019', 135, '0000-00-00', 3, '  ', '19', 'NSPL', '', ''),
(53, '00062562', '18/07/2018', 142, '0000-00-00', 3, ' RAJIV DA ', '16', 'NSPL', '', ''),
(54, '076176', '07/08/2019', 116, '0000-00-00', 3, '  ', '19', 'NSPL', '', ''),
(55, '00062555', '18/07/2018', 129, '0000-00-00', 3, '  ', '16', 'NSPL', '', ''),
(56, '075316', '01/07/2019', 115, '0000-00-00', 3, '  ', '19', 'NSPL', '', ''),
(57, '00056384', '27/06/2016', 219, '0000-00-00', 3, '  ', '12', 'NSPL', '', ''),
(58, '00062563', '18/07/2018', 220, '0000-00-00', 3, ' BIKRAM ', '16', 'NSPL', '', ''),
(59, '075508', '08/07/2019', 222, '0000-00-00', 3, '  ', '19', 'NSPL', '', ''),
(60, '00007495', '11/12/2012', 223, '0000-00-00', 3, '  ', '6', 'NSPL', '', ''),
(61, '072192', '16/01/2019', 224, '0000-00-00', 3, '  ', '17', 'NSPL', '', ''),
(62, '00062875', '30/07/2018', 227, '0000-00-00', 3, '  ', '16', 'NSPL', '', ''),
(63, '00005530', '05/03/2012', 84, '0000-00-00', 3, '  ', '10', 'NSPL', '', ''),
(64, '00006645', '09/10/2012', 123, '0000-00-00', 3, '  ', '11', 'NSPL', '', ''),
(65, '075312', '01/07/2019', 64, '0000-00-00', 3, '  ', '19', 'NSPL', '', ''),
(66, '00016712', '13/10/2014', 5, '0000-00-00', 3, '  ', '6', 'NSPL', '', ''),
(67, '00061099', '05/06/2018', 75, '0000-00-00', 3, '  ', '16', 'NSPL', '', ''),
(68, '00009364', '05/06/2013', 2, '0000-00-00', 3, ' RAJIB SIR ', '6', 'NSPL', '', ''),
(69, '076520', '13/07/2020', 6, '0000-00-00', 3, '  ', '17', 'NSPL', '', ''),
(70, '073106', '18/03/2019', 7, '0000-00-00', 3, '  ', '19', 'NSPL', '', ''),
(71, '00061768', '22/06/2018', 83, '0000-00-00', 3, '  ', '16', 'NSPL', '', ''),
(72, '070723', '19/11/2018', 930, '0000-00-00', 3, '  ', '12', 'NSPL', '', ''),
(73, '072605', '31/01/2019', 931, '0000-00-00', 3, '  ', '17', 'NSPL', '', ''),
(74, '072930', '08/02/2019', 204, '0000-00-00', 3, '  ', '17', 'NSPL', '', ''),
(75, '00062856', '30/07/2018', 4, '0000-00-00', 3, '  ', '16', 'NSPL', '', ''),
(76, '00013041', '24/05/2014', 40, '0000-00-00', 3, '  ', '6', 'NSPL', '', ''),
(77, '075081', '18/06/2019', 39, '0000-00-00', 3, '  ', '19', 'NSPL', '', ''),
(78, '076027', '01/08/2019', 10, '0000-00-00', 3, '  ', '19', 'NSPL', '', ''),
(79, '00014228', '05/07/2014', 177, '0000-00-00', 3, '  ', '10', 'NSPL', '', ''),
(80, '00013680', '18/06/2014', 24, '0000-00-00', 3, '  ', '6', 'NSPL', '', ''),
(81, '00013681', '18/06/2014', 26, '0000-00-00', 3, '  ', '6', 'NSPL', '', ''),
(82, '00049285', '03/09/2015', 27, '0000-00-00', 3, '  ', '12', 'NSPL', '', ''),
(83, '00061753', '22/06/2018', 28, '0000-00-00', 3, '  ', '16', 'NSPL', '', ''),
(84, '00000979', '23/12/2010', 34, '0000-00-00', 3, '  ', '6', 'NSPL', '', ''),
(85, '00061763', '22/06/2018', 31, '0000-00-00', 3, ' BIKRAM ', '16', 'NSPL', '', ''),
(86, '00061166', '06/06/2018', 30, '0000-00-00', 3, '  ', '16', 'NSPL', '', ''),
(87, '00013693', '18/06/2014', 38, '0000-00-00', 3, '  ', '6', 'NSPL', '', ''),
(88, '073104', '27/02/2019', 207, '0000-00-00', 3, ' RAJIB DA ', '12', 'NSPL', '', ''),
(89, '00005556', '26/03/2012', 259, '0000-00-00', 3, '  ', '6', 'NSPL', '', ''),
(90, '00060501', '15/05/2018', 260, '0000-00-00', 3, '  ', '11', 'NSPL', '', ''),
(91, '00007349', '06/12/2012', 267, '0000-00-00', 3, '  ', '6', 'NSPL', '', ''),
(92, '00049144', '29/08/2015', 268, '0000-00-00', 3, '  ', '12', 'NSPL', '', ''),
(93, '00007892', '14/01/2013', 269, '0000-00-00', 3, ' BIKRAM ', '6', 'NSPL', '', ''),
(94, '00007575', '21/12/2012', 270, '0000-00-00', 3, '  ', '6', 'NSPL', '', ''),
(95, '00001237', '24/12/2010', 264, '0000-00-00', 3, '  ', '6', 'NSPL', '', ''),
(96, '00000127', '06/07/2009', 76, '0000-00-00', 3, '  ', '', 'NSPL', '', ''),
(97, '073443', '05/04/2019', 57, '0000-00-00', 3, '  ', '19', 'NSPL', '', ''),
(98, '075191', '24/06/2019', 49, '0000-00-00', 3, '  ', '19', 'NSPL', '', ''),
(99, '074467', '20/05/2019', 52, '0000-00-00', 3, '  ', '19', 'NSPL', '', ''),
(100, '00049266', '03/09/2015', 271, '0000-00-00', 3, '  ', '12', 'NSPL', '', ''),
(101, 'FST1', '2024-11-06', 2, NULL, 3, NULL, NULL, '', '2024-11-06', '2024-11-06'),
(102, 'FST2', '2024-11-06', 4, NULL, 3, NULL, NULL, '', '2024-11-06', '2024-11-06'),
(103, 'FST4', '2024-11-26', 3, '2024-11-12', 3, NULL, '1', '', '2024-11-26', '2024-11-26'),
(104, 'FST5', '2024-11-26', 9, '2024-11-07', 4, NULL, '1', '', '2024-11-26', '2024-11-26'),
(105, 'FST6', '2024-11-26', 20, '2024-11-20', 3, NULL, '1', '', '2024-11-26', '2024-11-26'),
(106, 'FST8', '2024-12-10', 29, '2024-12-10', 3, NULL, '3', '', '2024-12-10', '2024-12-10'),
(107, 'FST9', '2024-12-10', 30, '2024-12-11', 4, NULL, '3', '', '2024-12-10', '2024-12-10'),
(108, 'FST10', '2024-12-10', 29, '2024-12-11', 4, NULL, '3', '', '2024-12-10', '2024-12-10'),
(109, 'FST11', '2024-12-10', 31, '2024-12-18', 4, 'hiii', '3', '', '2024-12-10', '2024-12-10'),
(110, 'FST12', '2024-12-10', 29, '2024-12-24', 4, 'hlw taraaaa....', '3', '', '2024-12-10', '2024-12-10');

-- --------------------------------------------------------

--
-- Table structure for table `industry_masters`
--

CREATE TABLE `industry_masters` (
  `ID` int(2) NOT NULL,
  `NAME` varchar(21) DEFAULT NULL,
  `CreatedAt` varchar(10) DEFAULT NULL,
  `UpdatedAt` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `industry_masters`
--

INSERT INTO `industry_masters` (`ID`, `NAME`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'Jewellery Retail', '2024-11-22', '2024-11-22'),
(2, 'Garments', '2024-11-22', '2024-11-22'),
(3, 'Steel', '2024-11-22', '2024-11-22'),
(4, 'Food beverage', '2024-11-22', '2024-11-22'),
(5, 'WOOD', '2024-11-26', '2024-11-26');

-- --------------------------------------------------------

--
-- Table structure for table `month_masters`
--

CREATE TABLE `month_masters` (
  `ID` bigint(20) NOT NULL,
  `MonthName` varchar(255) NOT NULL,
  `MonthCode` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `month_masters`
--

INSERT INTO `month_masters` (`ID`, `MonthName`, `MonthCode`, `createdAt`, `updatedAt`) VALUES
(1, 'January', 'JAN', '2024-11-26 05:02:43', '2024-11-26 05:02:43'),
(2, 'February', 'FEB', '2024-11-26 05:02:43', '2024-11-26 05:02:43'),
(3, 'March', 'MAR', '2024-11-26 05:02:43', '2024-11-26 05:02:43'),
(4, 'April', 'APR', '2024-11-26 05:02:43', '2024-11-26 05:02:43'),
(5, 'May', 'MAY', '2024-11-26 05:02:43', '2024-11-26 05:02:43'),
(6, 'June', 'JUN', '2024-11-26 05:02:43', '2024-11-26 05:02:43'),
(7, 'July', 'JUL', '2024-11-26 05:02:43', '2024-11-26 05:02:43'),
(8, 'August', 'AUG', '2024-11-26 05:02:43', '2024-11-26 05:02:43'),
(9, 'September', 'SEP', '2024-11-26 05:02:43', '2024-11-26 05:02:43'),
(10, 'October', 'OCT', '2024-11-26 05:02:43', '2024-11-26 05:02:43'),
(11, 'November', 'NOV', '2024-11-26 05:02:43', '2024-11-26 05:02:43'),
(12, 'December', 'DEC', '2024-11-26 05:02:43', '2024-11-26 05:02:43'),
(13, 'January', 'JAN', '2024-11-26 10:16:03', '2024-11-26 10:16:03'),
(14, 'February', 'FEB', '2024-11-26 10:16:03', '2024-11-26 10:16:03'),
(15, 'March', 'MAR', '2024-11-26 10:16:03', '2024-11-26 10:16:03'),
(16, 'April', 'APR', '2024-11-26 10:16:03', '2024-11-26 10:16:03'),
(17, 'May', 'MAY', '2024-11-26 10:16:03', '2024-11-26 10:16:03'),
(18, 'June', 'JUN', '2024-11-26 10:16:03', '2024-11-26 10:16:03'),
(19, 'July', 'JUL', '2024-11-26 10:16:03', '2024-11-26 10:16:03'),
(20, 'August', 'AUG', '2024-11-26 10:16:03', '2024-11-26 10:16:03'),
(21, 'September', 'SEP', '2024-11-26 10:16:03', '2024-11-26 10:16:03'),
(22, 'October', 'OCT', '2024-11-26 10:16:03', '2024-11-26 10:16:03'),
(23, 'November', 'NOV', '2024-11-26 10:16:03', '2024-11-26 10:16:03'),
(24, 'December', 'DEC', '2024-11-26 10:16:03', '2024-11-26 10:16:03'),
(25, 'January', 'JAN', '2024-11-26 10:16:32', '2024-11-26 10:16:32'),
(26, 'February', 'FEB', '2024-11-26 10:16:32', '2024-11-26 10:16:32'),
(27, 'March', 'MAR', '2024-11-26 10:16:32', '2024-11-26 10:16:32'),
(28, 'April', 'APR', '2024-11-26 10:16:32', '2024-11-26 10:16:32'),
(29, 'May', 'MAY', '2024-11-26 10:16:32', '2024-11-26 10:16:32'),
(30, 'June', 'JUN', '2024-11-26 10:16:32', '2024-11-26 10:16:32'),
(31, 'July', 'JUL', '2024-11-26 10:16:32', '2024-11-26 10:16:32'),
(32, 'August', 'AUG', '2024-11-26 10:16:32', '2024-11-26 10:16:32'),
(33, 'September', 'SEP', '2024-11-26 10:16:32', '2024-11-26 10:16:32'),
(34, 'October', 'OCT', '2024-11-26 10:16:32', '2024-11-26 10:16:32'),
(35, 'November', 'NOV', '2024-11-26 10:16:32', '2024-11-26 10:16:32'),
(36, 'December', 'DEC', '2024-11-26 10:16:32', '2024-11-26 10:16:32'),
(37, 'January', 'JAN', '2024-11-26 10:16:35', '2024-11-26 10:16:35'),
(38, 'February', 'FEB', '2024-11-26 10:16:35', '2024-11-26 10:16:35'),
(39, 'March', 'MAR', '2024-11-26 10:16:35', '2024-11-26 10:16:35'),
(40, 'April', 'APR', '2024-11-26 10:16:35', '2024-11-26 10:16:35'),
(41, 'May', 'MAY', '2024-11-26 10:16:35', '2024-11-26 10:16:35'),
(42, 'June', 'JUN', '2024-11-26 10:16:35', '2024-11-26 10:16:35'),
(43, 'July', 'JUL', '2024-11-26 10:16:35', '2024-11-26 10:16:35'),
(44, 'August', 'AUG', '2024-11-26 10:16:35', '2024-11-26 10:16:35'),
(45, 'September', 'SEP', '2024-11-26 10:16:35', '2024-11-26 10:16:35'),
(46, 'October', 'OCT', '2024-11-26 10:16:35', '2024-11-26 10:16:35'),
(47, 'November', 'NOV', '2024-11-26 10:16:35', '2024-11-26 10:16:35'),
(48, 'December', 'DEC', '2024-11-26 10:16:35', '2024-11-26 10:16:35'),
(49, 'January', 'JAN', '2024-11-26 10:18:05', '2024-11-26 10:18:05'),
(50, 'February', 'FEB', '2024-11-26 10:18:05', '2024-11-26 10:18:05'),
(51, 'March', 'MAR', '2024-11-26 10:18:05', '2024-11-26 10:18:05'),
(52, 'April', 'APR', '2024-11-26 10:18:05', '2024-11-26 10:18:05'),
(53, 'May', 'MAY', '2024-11-26 10:18:05', '2024-11-26 10:18:05'),
(54, 'June', 'JUN', '2024-11-26 10:18:05', '2024-11-26 10:18:05'),
(55, 'July', 'JUL', '2024-11-26 10:18:05', '2024-11-26 10:18:05'),
(56, 'August', 'AUG', '2024-11-26 10:18:05', '2024-11-26 10:18:05'),
(57, 'September', 'SEP', '2024-11-26 10:18:05', '2024-11-26 10:18:05'),
(58, 'October', 'OCT', '2024-11-26 10:18:05', '2024-11-26 10:18:05'),
(59, 'November', 'NOV', '2024-11-26 10:18:05', '2024-11-26 10:18:05'),
(60, 'December', 'DEC', '2024-11-26 10:18:05', '2024-11-26 10:18:05');

-- --------------------------------------------------------

--
-- Table structure for table `salesman_masters`
--

CREATE TABLE `salesman_masters` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `PHONE` bigint(20) DEFAULT NULL,
  `FAX` bigint(20) DEFAULT NULL,
  `CONTACTPERSON` varchar(255) DEFAULT NULL,
  `LISCENCENO` varchar(255) DEFAULT NULL,
  `TrgAmt` double DEFAULT NULL,
  `vat_no` varchar(255) DEFAULT NULL,
  `CompanyCode` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salesman_masters`
--

INSERT INTO `salesman_masters` (`ID`, `NAME`, `ADDRESS`, `PHONE`, `FAX`, `CONTACTPERSON`, `LISCENCENO`, `TrgAmt`, `vat_no`, `CompanyCode`, `createdAt`, `updatedAt`) VALUES
(1, 'Anirban Debnath', '', 9999999980, NULL, NULL, NULL, NULL, NULL, 'NSPL', '2024-11-22 00:00:00', '2024-11-22 00:00:00'),
(2, 'Shiv sankar mondal ', '', 9999999981, NULL, NULL, NULL, NULL, NULL, 'NSPL', '2024-11-22 00:00:00', '2024-11-22 00:00:00'),
(3, 'Janarul islam', '', 9999999982, NULL, NULL, NULL, NULL, NULL, 'NSPL', '2024-11-22 00:00:00', '2024-11-22 00:00:00'),
(4, 'Indranuj roy chowdhury ', '', 9999999983, NULL, NULL, NULL, NULL, NULL, 'NSPL', '2024-11-22 00:00:00', '2024-11-22 00:00:00'),
(5, 'Adrish Bhurishrestha', '', 9999999984, NULL, NULL, NULL, NULL, NULL, 'NSPL', '2024-11-22 00:00:00', '2024-11-22 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `serial_infos`
--

CREATE TABLE `serial_infos` (
  `SRL` bigint(20) NOT NULL,
  `TRANCODE` varchar(255) DEFAULT NULL,
  `LASTSERIAL` bigint(20) DEFAULT NULL,
  `NARATION` varchar(255) DEFAULT NULL,
  `PRINTVOUCHER` varchar(255) DEFAULT NULL,
  `PRINT_STATUS` varchar(255) DEFAULT NULL,
  `CompanyCode` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `serial_infos`
--

INSERT INTO `serial_infos` (`SRL`, `TRANCODE`, `LASTSERIAL`, `NARATION`, `PRINTVOUCHER`, `PRINT_STATUS`, `CompanyCode`, `createdAt`, `updatedAt`) VALUES
(1, 'FST', 12, NULL, NULL, NULL, 'NSPL', '2024-11-06 14:59:20', '2024-12-10 10:20:22'),
(2, 'FST', 12, NULL, NULL, NULL, 'XYZ', '2024-12-10 00:00:00', '2024-12-10 10:20:22');

-- --------------------------------------------------------

--
-- Table structure for table `state_masters`
--

CREATE TABLE `state_masters` (
  `ID` bigint(20) NOT NULL,
  `State_name` varchar(255) NOT NULL,
  `id_country` bigint(20) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `state_masters`
--

INSERT INTO `state_masters` (`ID`, `State_name`, `id_country`, `createdAt`, `updatedAt`) VALUES
(1, 'Andhra Pradesh', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(2, ' Arunachal Pradesh', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(3, ' Assam', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(4, ' Bihar', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(5, ' Chhattisgarh', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(6, ' Goa', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(7, ' Gujarat', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(8, ' Haryana', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(9, ' Himachal Pradesh', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(10, ' Jharkhand', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(11, ' Karnataka', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(12, ' Kerala', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(13, ' Madhya Pradesh', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(14, ' Maharashtra', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(15, ' Manipur', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(16, ' Meghalaya', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(17, ' Mizoram', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(18, ' Nagaland', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(19, ' Odisha', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(20, ' Punjab', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(21, ' Rajasthan', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(22, ' Sikkim', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(23, ' Tamil Nadu', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(24, ' Telangana', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(25, ' Tripura', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(26, ' Uttarakhand', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(27, ' Uttar Pradesh', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(28, 'West Bengal', 1, '2024-11-07 12:31:17', '2024-11-07 12:31:17'),
(29, 'DHAKA DIVISION', 8, '2024-12-10 04:58:37', '2024-12-10 04:58:37');

-- --------------------------------------------------------

--
-- Table structure for table `usermasters`
--

CREATE TABLE `usermasters` (
  `ID` bigint(20) NOT NULL,
  `LoginCode` bigint(20) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `UUid` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `PhoneNumber` bigint(20) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `ID_Country` bigint(20) DEFAULT NULL,
  `Pass` varchar(255) NOT NULL,
  `Utype` bigint(20) DEFAULT NULL,
  `LogOut` tinyint(4) DEFAULT NULL,
  `Active` tinyint(4) DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `CompanyCode` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usermasters`
--

INSERT INTO `usermasters` (`ID`, `LoginCode`, `Name`, `UUid`, `Email`, `PhoneNumber`, `Password`, `ID_Country`, `Pass`, `Utype`, `LogOut`, `Active`, `EndDate`, `CompanyCode`, `createdAt`, `updatedAt`) VALUES
(1, 9999999999, 'Debolina Halder', '6621fcc9-ca62-4616-b75d-3987213f5de5', 'debolina@gmail.com', 9477850981, 'Abc@123', 1, 'Abc@123', 1, 0, 1, NULL, 'NSPL', '2024-10-17 13:51:34', '2024-12-09 05:49:14'),
(2, 1234567999, 'Sample User', 'bed73478-fb91-457e-a759-e0ced113115c', 'sample@example.com', 0, 'Abc@123', 1, '', 2, 0, 1, NULL, 'sampleCompanyCode', '2024-12-06 09:53:22', '2024-12-09 12:29:37'),
(3, 8509416944, 'Syed Tarique Abedin', '2afe5980-5401-41e1-bd00-2b949a3bb1f6', 'syedtarique20@gmail.com', 0, 'Abc@123', 8, '', 2, 0, 1, NULL, 'XYZ', '2024-12-06 13:18:43', '2024-12-09 12:29:37');

-- --------------------------------------------------------

--
-- Table structure for table `user_type_masters`
--

CREATE TABLE `user_type_masters` (
  `ID` bigint(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `is_salesman` tinyint(20) NOT NULL,
  `is_area` tinyint(4) NOT NULL,
  `is_companyreg` int(11) NOT NULL,
  `is_location` int(20) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_type_masters`
--

INSERT INTO `user_type_masters` (`ID`, `description`, `is_salesman`, `is_area`, `is_companyreg`, `is_location`, `createdAt`, `updatedAt`) VALUES
(1, 'All Country', 1, 1, 1, 1, '2024-12-10 13:17:41', '2024-12-10 13:17:41'),
(2, 'One own country', 1, 0, 0, 0, '2024-12-10 13:17:41', '2024-12-10 13:17:41'),
(3, 'Some State', 1, 0, 0, 0, '2024-12-10 13:17:41', '2024-12-10 13:17:41'),
(4, 'Only Individual', 0, 0, 0, 0, '2024-12-10 13:17:41', '2024-12-10 13:17:41');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_masters`
--

CREATE TABLE `vendor_masters` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `week_masters`
--

CREATE TABLE `week_masters` (
  `ID` bigint(20) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `week_masters`
--

INSERT INTO `week_masters` (`ID`, `type_name`, `createdAt`, `updatedAt`) VALUES
(1, 'Monday', '2024-11-20 13:07:07', '2024-11-20 13:07:07'),
(2, 'Tuesday', '2024-11-20 13:07:07', '2024-11-20 13:07:07'),
(3, 'Wednesday', '2024-11-20 13:07:07', '2024-11-20 13:07:07'),
(4, 'Thursday', '2024-11-20 13:07:07', '2024-11-20 13:07:07'),
(5, 'Friday', '2024-11-20 13:07:07', '2024-11-20 13:07:07'),
(6, 'Saturday', '2024-11-20 13:07:07', '2024-11-20 13:07:07'),
(7, 'Sunday', '2024-11-20 13:07:07', '2024-11-20 13:07:07');

-- --------------------------------------------------------

--
-- Table structure for table `year_masters`
--

CREATE TABLE `year_masters` (
  `ID` bigint(20) NOT NULL,
  `Session` varchar(255) NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `year_masters`
--

INSERT INTO `year_masters` (`ID`, `Session`, `startDate`, `endDate`, `status`, `createdAt`, `updatedAt`) VALUES
(1, '2023-2024', '2023-04-01 00:00:00', '2024-03-31 00:00:00', 0, '2024-11-26 05:42:52', '2024-11-26 05:42:52');

-- --------------------------------------------------------

--
-- Table structure for table `zone_masters`
--

CREATE TABLE `zone_masters` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `Parent_zone` bigint(20) DEFAULT NULL,
  `id_city` bigint(20) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `zone_masters`
--

INSERT INTO `zone_masters` (`ID`, `NAME`, `Parent_zone`, `id_city`, `createdAt`, `updatedAt`) VALUES
(1, 'Sakuntala', 1, 1, '2024-11-07 08:02:58', '2024-11-07 08:02:58'),
(2, 'GARIA', 3, 3, '2024-11-13 11:48:37', '2024-11-13 11:48:37'),
(5, 'INDAS', 2, 2, '2024-12-09 11:59:14', '2024-12-09 11:59:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `area_masters`
--
ALTER TABLE `area_masters`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Code` (`Code`),
  ADD KEY `ibfk_zonemasters_2` (`Zone_ID`);

--
-- Indexes for table `business_masters`
--
ALTER TABLE `business_masters`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `city_masters`
--
ALTER TABLE `city_masters`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `id_state` (`id_state`);

--
-- Indexes for table `country_masters`
--
ALTER TABLE `country_masters`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `customer_details`
--
ALTER TABLE `customer_details`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `customer_masters`
--
ALTER TABLE `customer_masters`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ibfk_customermaster_6` (`Busi_size`);

--
-- Indexes for table `cust_type_masters`
--
ALTER TABLE `cust_type_masters`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `fbtype_masters`
--
ALTER TABLE `fbtype_masters`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `feedback_transactions`
--
ALTER TABLE `feedback_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ibfk_feedbacktrans_2` (`Cust_Status`);

--
-- Indexes for table `industry_masters`
--
ALTER TABLE `industry_masters`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `month_masters`
--
ALTER TABLE `month_masters`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `salesman_masters`
--
ALTER TABLE `salesman_masters`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `serial_infos`
--
ALTER TABLE `serial_infos`
  ADD PRIMARY KEY (`SRL`),
  ADD KEY `CompanyCode` (`CompanyCode`(191));

--
-- Indexes for table `state_masters`
--
ALTER TABLE `state_masters`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `id_country` (`id_country`);

--
-- Indexes for table `usermasters`
--
ALTER TABLE `usermasters`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ibfk_usermaster_7` (`ID_Country`),
  ADD KEY `ibfk_usermaster_8` (`Utype`);

--
-- Indexes for table `user_type_masters`
--
ALTER TABLE `user_type_masters`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `vendor_masters`
--
ALTER TABLE `vendor_masters`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `week_masters`
--
ALTER TABLE `week_masters`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `year_masters`
--
ALTER TABLE `year_masters`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `zone_masters`
--
ALTER TABLE `zone_masters`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `id_city` (`id_city`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `area_masters`
--
ALTER TABLE `area_masters`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT for table `business_masters`
--
ALTER TABLE `business_masters`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `city_masters`
--
ALTER TABLE `city_masters`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `country_masters`
--
ALTER TABLE `country_masters`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `customer_details`
--
ALTER TABLE `customer_details`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `customer_masters`
--
ALTER TABLE `customer_masters`
  MODIFY `ID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1253;

--
-- AUTO_INCREMENT for table `cust_type_masters`
--
ALTER TABLE `cust_type_masters`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fbtype_masters`
--
ALTER TABLE `fbtype_masters`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `feedback_transactions`
--
ALTER TABLE `feedback_transactions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `industry_masters`
--
ALTER TABLE `industry_masters`
  MODIFY `ID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `month_masters`
--
ALTER TABLE `month_masters`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `salesman_masters`
--
ALTER TABLE `salesman_masters`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `state_masters`
--
ALTER TABLE `state_masters`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `usermasters`
--
ALTER TABLE `usermasters`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_type_masters`
--
ALTER TABLE `user_type_masters`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vendor_masters`
--
ALTER TABLE `vendor_masters`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `week_masters`
--
ALTER TABLE `week_masters`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `year_masters`
--
ALTER TABLE `year_masters`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `zone_masters`
--
ALTER TABLE `zone_masters`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `area_masters`
--
ALTER TABLE `area_masters`
  ADD CONSTRAINT `ibfk_zonemasters_2` FOREIGN KEY (`Zone_ID`) REFERENCES `zone_masters` (`ID`);

--
-- Constraints for table `customer_masters`
--
ALTER TABLE `customer_masters`
  ADD CONSTRAINT `ibfk_customermaster_6` FOREIGN KEY (`Busi_size`) REFERENCES `business_masters` (`ID`);

--
-- Constraints for table `feedback_transactions`
--
ALTER TABLE `feedback_transactions`
  ADD CONSTRAINT `ibfk_feedbacktrans_2` FOREIGN KEY (`Cust_Status`) REFERENCES `fbtype_masters` (`ID`);

--
-- Constraints for table `usermasters`
--
ALTER TABLE `usermasters`
  ADD CONSTRAINT `ibfk_usermaster_7` FOREIGN KEY (`ID_Country`) REFERENCES `country_masters` (`ID`),
  ADD CONSTRAINT `ibfk_usermaster_8` FOREIGN KEY (`Utype`) REFERENCES `user_type_masters` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
