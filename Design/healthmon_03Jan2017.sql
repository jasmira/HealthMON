-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2017 at 10:40 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `healthmon`
--

-- --------------------------------------------------------

--
-- Table structure for table `hm_actor`
--

CREATE TABLE `hm_actor` (
  `Actor_id` int(10) UNSIGNED NOT NULL,
  `Actor_desc` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_actor`
--

INSERT INTO `hm_actor` (`Actor_id`, `Actor_desc`) VALUES
(1, 'Health Officer'),
(2, 'Medical Officer'),
(3, 'ANM'),
(4, 'ASHA'),
(5, 'patient');

-- --------------------------------------------------------

--
-- Table structure for table `hm_actor_tasks`
--

CREATE TABLE `hm_actor_tasks` (
  `Actor_Tasks_id` int(10) UNSIGNED NOT NULL,
  `Actor_id` int(10) UNSIGNED NOT NULL,
  `Programs_id` int(10) UNSIGNED NOT NULL,
  `Actor_Task_Name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Actor_Task_Description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hm_allergy_item`
--

CREATE TABLE `hm_allergy_item` (
  `Allergy_Item_id` int(10) UNSIGNED NOT NULL,
  `Allergy_Type_id` int(10) UNSIGNED DEFAULT NULL,
  `AllergyItemName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_allergy_item`
--

INSERT INTO `hm_allergy_item` (`Allergy_Item_id`, `Allergy_Type_id`, `AllergyItemName`) VALUES
(1, 1, 'Peanuts'),
(2, 2, 'Penicilin'),
(3, 3, 'Beg bugs'),
(4, 4, 'Pollen grains'),
(5, 1, 'Mushrooms'),
(6, 1, 'Strawberries');

-- --------------------------------------------------------

--
-- Table structure for table `hm_allergy_type`
--

CREATE TABLE `hm_allergy_type` (
  `Allergy_Type_id` int(10) UNSIGNED NOT NULL,
  `AllergyTypeName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_allergy_type`
--

INSERT INTO `hm_allergy_type` (`Allergy_Type_id`, `AllergyTypeName`) VALUES
(1, 'Food'),
(2, 'Medicine'),
(3, 'House dust mites'),
(4, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `hm_appointments`
--

CREATE TABLE `hm_appointments` (
  `Appointment_id` int(10) UNSIGNED NOT NULL,
  `User_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Patient_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Appointment_Date` datetime DEFAULT NULL,
  `Appointment_new_old_flag` tinyint(1) DEFAULT NULL,
  `Appointment_accepted_by` tinyint(1) DEFAULT NULL,
  `Created_Date` datetime DEFAULT NULL,
  `Created_By` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Referred` tinyint(1) DEFAULT NULL,
  `AcceptedFlag` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_appointments`
--

INSERT INTO `hm_appointments` (`Appointment_id`, `User_id`, `Patient_id`, `Appointment_Date`, `Appointment_new_old_flag`, `Appointment_accepted_by`, `Created_Date`, `Created_By`, `Referred`, `AcceptedFlag`) VALUES
(9, 'MO1', 'asha1510', '2016-09-08 19:26:54', 0, NULL, '2016-09-08 19:26:54', 'anm1', 1, 1),
(10, 'MO1', 'asha1512', '2016-09-12 13:22:50', 0, NULL, '2016-09-12 13:22:50', 'anm1', 1, 1),
(11, 'MO1', 'asha1511', '2016-09-12 18:27:29', 0, NULL, '2016-09-12 18:27:29', 'anm1', 1, 0),
(12, 'MO1', 'asha1513', '2016-09-12 18:28:00', 0, NULL, '2016-09-12 18:28:00', 'anm1', 1, 0),
(13, 'MO1', 'asha1511', '2016-09-13 18:37:22', 0, NULL, '2016-09-13 18:37:22', 'anm1', 1, 1),
(14, 'MO1', 'asha1512', '2016-09-14 10:17:30', 0, NULL, '2016-09-14 10:17:30', 'anm1', 1, 1),
(15, 'MO1', 'asha1511', '2016-09-14 10:17:39', 0, NULL, '2016-09-14 10:17:39', 'anm1', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hm_cast_category`
--

CREATE TABLE `hm_cast_category` (
  `Cast_Category_Id` int(10) UNSIGNED NOT NULL,
  `Cast_Category_NM` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Cast_Category_Desc` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_cast_category`
--

INSERT INTO `hm_cast_category` (`Cast_Category_Id`, `Cast_Category_NM`, `Cast_Category_Desc`) VALUES
(1, 'SC', 'schedule caste'),
(2, 'ST', 'schedule tribe'),
(3, 'Open', 'Open category');

-- --------------------------------------------------------

--
-- Table structure for table `hm_city`
--

CREATE TABLE `hm_city` (
  `Country_ID` int(10) UNSIGNED NOT NULL,
  `State_ID` int(10) UNSIGNED NOT NULL,
  `District_id` int(10) UNSIGNED NOT NULL,
  `City_id` int(10) UNSIGNED NOT NULL,
  `City_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_city`
--

INSERT INTO `hm_city` (`Country_ID`, `State_ID`, `District_id`, `City_id`, `City_name`) VALUES
(1, 1, 1, 1, 'PuneCity'),
(1, 1, 1, 2, 'Khadki'),
(1, 1, 1, 3, 'Pimpri'),
(1, 1, 1, 4, 'Hadapsar'),
(1, 1, 1, 5, 'Aundh'),
(1, 1, 2, 6, 'NagpurCity'),
(1, 1, 2, 7, 'Ramtek'),
(1, 1, 2, 8, 'Kamtee'),
(1, 1, 2, 9, 'Umred'),
(1, 1, 2, 10, 'Sioner');

-- --------------------------------------------------------

--
-- Table structure for table `hm_country`
--

CREATE TABLE `hm_country` (
  `Country_ID` int(10) UNSIGNED NOT NULL,
  `Country_NM` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Country_Desc` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_country`
--

INSERT INTO `hm_country` (`Country_ID`, `Country_NM`, `Country_Desc`) VALUES
(1, 'India', 'All states of India');

-- --------------------------------------------------------

--
-- Table structure for table `hm_cp_category`
--

CREATE TABLE `hm_cp_category` (
  `Template_id` int(10) UNSIGNED NOT NULL,
  `Category_id` int(10) UNSIGNED NOT NULL,
  `Category_Desc` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Created_By` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Created_Date` datetime DEFAULT NULL,
  `Updated_By` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Updated_Date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_cp_category`
--

INSERT INTO `hm_cp_category` (`Template_id`, `Category_id`, `Category_Desc`, `Created_By`, `Created_Date`, `Updated_By`, `Updated_Date`) VALUES
(1, 1, 'Condition Specific Care Management', 'ANM1', '2016-06-20 00:00:00', NULL, NULL),
(1, 2, 'Vaccines', 'ANM2', '2016-06-20 00:00:00', NULL, NULL),
(1, 3, 'Self Management', 'ANM1', '2016-06-20 00:00:00', NULL, NULL),
(1, 4, 'Medication Adherence', 'ANM1', '2016-06-17 00:00:00', NULL, NULL),
(2, 5, 'Condition Specific Care Management', 'MO1', '2016-07-08 00:00:00', NULL, NULL),
(2, 6, 'Vaccines', 'MO1', '2016-07-09 00:00:00', NULL, NULL),
(2, 7, 'Self Management', 'MO1', '2016-07-10 00:00:00', NULL, NULL),
(2, 8, 'Medication Adherence', 'MO1', '2016-07-10 00:00:00', NULL, NULL),
(3, 9, 'Condition Specific Care Management', 'MO1', '2016-07-21 00:00:00', NULL, NULL),
(3, 10, 'General Care', 'MO1', '2016-07-22 00:00:00', NULL, NULL),
(3, 11, 'LabsScreening', 'MO1', '2016-07-15 00:00:00', NULL, NULL),
(3, 12, 'Vaccines', 'MO1', '2016-07-17 00:00:00', NULL, NULL),
(3, 13, 'Self Management', 'MO1', '2016-07-11 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hm_cp_frequency`
--

CREATE TABLE `hm_cp_frequency` (
  `Frequency_id` int(10) UNSIGNED NOT NULL,
  `Template_id` int(10) UNSIGNED NOT NULL,
  `Category_id` int(10) UNSIGNED NOT NULL,
  `Template_Task_id` int(10) UNSIGNED NOT NULL,
  `frequency_detail_id` int(10) UNSIGNED NOT NULL,
  `Created_By` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Created_Date` datetime DEFAULT NULL,
  `Updated_By` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Updated_Date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_cp_frequency`
--

INSERT INTO `hm_cp_frequency` (`Frequency_id`, `Template_id`, `Category_id`, `Template_Task_id`, `frequency_detail_id`, `Created_By`, `Created_Date`, `Updated_By`, `Updated_Date`) VALUES
(1, 1, 1, 1, 3, 'ANM1', '2016-06-19 00:00:00', NULL, NULL),
(2, 1, 2, 2, 1, 'ANM2', '2016-06-10 00:00:00', NULL, NULL),
(3, 1, 3, 3, 2, 'ANM1', '2016-06-07 00:00:00', NULL, NULL),
(4, 1, 2, 4, 3, 'ANM1', '2016-06-20 00:00:00', NULL, NULL),
(5, 1, 2, 5, 1, 'MO1', '2016-06-09 00:00:00', NULL, NULL),
(6, 1, 2, 6, 3, 'ANM1', '2016-06-08 00:00:00', NULL, NULL),
(7, 1, 2, 7, 3, 'ANM1', '2016-06-14 00:00:00', NULL, NULL),
(8, 1, 4, 8, 2, 'MO1', '2016-06-16 00:00:00', NULL, NULL),
(9, 2, 1, 9, 3, 'ANM1', '2016-06-14 00:00:00', NULL, NULL),
(10, 2, 1, 10, 1, 'ANM1', '2016-06-14 00:00:00', NULL, NULL),
(11, 2, 2, 11, 2, 'ANM1', '2016-06-14 00:00:00', NULL, NULL),
(12, 2, 3, 12, 2, 'ANM1', '2016-06-14 00:00:00', NULL, NULL),
(13, 2, 4, 14, 3, 'ANM1', '2016-06-14 00:00:00', NULL, NULL),
(14, 3, 9, 15, 3, 'ANM1', '2016-06-14 00:00:00', NULL, NULL),
(15, 3, 9, 16, 1, 'ANM1', '2016-06-14 00:00:00', NULL, NULL),
(16, 3, 10, 17, 2, 'ANM1', '2016-06-14 00:00:00', NULL, NULL),
(17, 3, 11, 18, 2, 'ANM1', '2016-06-14 00:00:00', NULL, NULL),
(18, 3, 11, 19, 3, 'ANM1', '2016-06-14 00:00:00', NULL, NULL),
(19, 2, 11, 20, 3, 'ANM1', '2016-06-14 00:00:00', NULL, NULL),
(20, 2, 12, 21, 1, 'ANM1', '2016-06-14 00:00:00', NULL, NULL),
(21, 2, 12, 22, 2, 'ANM1', '2016-06-14 00:00:00', NULL, NULL),
(22, 2, 13, 23, 2, 'ANM1', '2016-06-14 00:00:00', NULL, NULL),
(23, 2, 13, 24, 3, 'ANM1', '2016-06-14 00:00:00', NULL, NULL),
(24, 1, 2, 25, 1, 'ANM1', '2016-06-14 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hm_cp_frequency_details`
--

CREATE TABLE `hm_cp_frequency_details` (
  `frequency_detail_id` int(10) UNSIGNED NOT NULL,
  `frequency_Desc` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_cp_frequency_details`
--

INSERT INTO `hm_cp_frequency_details` (`frequency_detail_id`, `frequency_Desc`) VALUES
(1, 'Once'),
(2, 'Daily'),
(3, 'Weekly'),
(4, 'Bi-weekly'),
(5, 'Monthly'),
(6, 'Quarterly'),
(7, 'Annually');

-- --------------------------------------------------------

--
-- Table structure for table `hm_cp_patient`
--

CREATE TABLE `hm_cp_patient` (
  `Patient_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Template_id` int(10) UNSIGNED NOT NULL,
  `Category_id` int(10) UNSIGNED NOT NULL,
  `Template_Task_id` int(10) UNSIGNED NOT NULL,
  `Frequency_id` int(10) UNSIGNED DEFAULT NULL,
  `frequency_detail_id` int(10) UNSIGNED NOT NULL,
  `User_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Created_By` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Created_Date` datetime DEFAULT NULL,
  `Updated_By` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Updated_Date` datetime DEFAULT NULL,
  `Approved` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_cp_patient`
--

INSERT INTO `hm_cp_patient` (`Patient_id`, `Template_id`, `Category_id`, `Template_Task_id`, `Frequency_id`, `frequency_detail_id`, `User_id`, `role`, `Created_By`, `Created_Date`, `Updated_By`, `Updated_Date`, `Approved`) VALUES
('asha1510', 1, 1, 1, NULL, 1, NULL, 'asha', 'MO1', '2016-09-12 18:10:17', 'MO1', '2016-09-12 18:10:17', 0),
('asha1511', 2, 5, 9, NULL, 3, NULL, 'ANM', 'MO1', '2016-09-12 07:36:48', 'MO1', '2016-09-12 07:36:48', 0),
('asha1511', 2, 5, 10, NULL, 1, NULL, 'ANM', 'MO1', '2016-09-12 07:36:48', 'MO1', '2016-09-12 07:36:48', 0),
('asha1511', 2, 6, 11, NULL, 2, NULL, 'ASHA', 'MO1', '2016-09-12 07:36:48', 'MO1', '2016-09-12 07:36:48', 0),
('asha1511', 2, 7, 12, NULL, 2, NULL, 'ANM', 'MO1', '2016-09-12 07:36:48', 'MO1', '2016-09-12 07:36:48', 0),
('asha1511', 2, 8, 14, NULL, 3, NULL, 'ASHA', 'MO1', '2016-09-12 07:36:48', 'MO1', '2016-09-12 07:36:48', 0),
('asha1511', 3, 11, 20, NULL, 3, NULL, 'ANM', 'MO1', '2016-09-12 07:36:48', 'MO1', '2016-09-12 07:36:48', 0),
('asha1511', 3, 12, 21, NULL, 1, NULL, 'patient', 'MO1', '2016-09-12 07:36:48', 'MO1', '2016-09-12 07:36:48', 0),
('asha1511', 3, 12, 22, NULL, 2, NULL, 'patient', 'MO1', '2016-09-12 07:36:48', 'MO1', '2016-09-12 07:36:48', 0),
('asha1511', 3, 13, 23, NULL, 2, NULL, 'Medical Officer', 'MO1', '2016-09-12 07:36:48', 'MO1', '2016-09-12 07:36:48', 0),
('asha1511', 3, 13, 24, NULL, 3, NULL, 'ANM', 'MO1', '2016-09-12 07:36:48', 'MO1', '2016-09-12 07:36:48', 0),
('asha1512', 1, 1, 1, NULL, 3, NULL, 'ASHA', 'MO1', '2016-09-12 17:00:32', 'MO1', '2016-09-12 17:00:32', 0),
('asha1512', 1, 2, 2, NULL, 1, NULL, 'ANM', 'MO1', '2016-09-12 17:00:32', 'MO1', '2016-09-12 17:00:32', 0),
('asha1512', 1, 2, 4, NULL, 3, NULL, 'ASHA', 'MO1', '2016-09-12 17:00:32', 'MO1', '2016-09-12 17:00:32', 0),
('asha1512', 1, 2, 5, NULL, 1, NULL, 'ASHA', 'MO1', '2016-09-12 17:00:32', 'MO1', '2016-09-12 17:00:32', 0),
('asha1512', 1, 2, 6, NULL, 3, NULL, 'ASHA', 'MO1', '2016-09-12 17:00:32', 'MO1', '2016-09-12 17:00:32', 0),
('asha1512', 1, 2, 7, NULL, 3, NULL, 'ANM', 'MO1', '2016-09-12 17:00:32', 'MO1', '2016-09-12 17:00:32', 0),
('asha1512', 1, 2, 25, NULL, 1, NULL, 'ANM', 'MO1', '2016-09-12 17:00:32', 'MO1', '2016-09-12 17:00:32', 0),
('asha1512', 1, 3, 3, NULL, 2, NULL, 'ASHA', 'MO1', '2016-09-12 17:00:32', 'MO1', '2016-09-12 17:00:32', 0),
('asha1512', 1, 4, 8, NULL, 2, NULL, 'ANM', 'MO1', '2016-09-12 17:00:32', 'MO1', '2016-09-12 17:00:32', 0),
('asha1512', 2, 5, 9, NULL, 3, NULL, 'ANM', 'MO1', '2016-09-12 17:01:36', 'MO1', '2016-09-12 17:01:36', 0),
('asha1512', 2, 5, 10, NULL, 1, NULL, 'ANM', 'MO1', '2016-09-12 17:01:36', 'MO1', '2016-09-12 17:01:36', 0),
('asha1512', 2, 6, 11, NULL, 2, NULL, 'ASHA', 'MO1', '2016-09-12 17:01:36', 'MO1', '2016-09-12 17:01:36', 0),
('asha1512', 2, 7, 12, NULL, 2, NULL, 'ANM', 'MO1', '2016-09-12 17:01:36', 'MO1', '2016-09-12 17:01:36', 0),
('asha1512', 2, 8, 14, NULL, 3, NULL, 'ASHA', 'MO1', '2016-09-12 17:01:36', 'MO1', '2016-09-12 17:01:36', 0),
('asha1512', 3, 11, 20, NULL, 3, NULL, 'ANM', 'MO1', '2016-09-12 17:01:36', 'MO1', '2016-09-12 17:01:36', 0),
('asha1512', 3, 12, 21, NULL, 1, NULL, 'patient', 'MO1', '2016-09-12 17:01:36', 'MO1', '2016-09-12 17:01:36', 0),
('asha1512', 3, 12, 22, NULL, 2, NULL, 'patient', 'MO1', '2016-09-12 17:01:36', 'MO1', '2016-09-12 17:01:36', 0),
('asha1512', 3, 13, 23, NULL, 2, NULL, 'Medical Officer', 'MO1', '2016-09-12 17:01:36', 'MO1', '2016-09-12 17:01:36', 0),
('asha1512', 3, 13, 24, NULL, 3, NULL, 'ANM', 'MO1', '2016-09-12 17:01:36', 'MO1', '2016-09-12 17:01:36', 0),
('asha1514', 1, 1, 1, NULL, 3, NULL, 'ASHA', 'MO1', '2016-09-12 01:59:15', 'MO1', '2016-09-12 01:59:15', 1),
('asha1514', 1, 2, 2, NULL, 1, NULL, 'ANM', 'MO1', '2016-09-12 01:59:15', 'MO1', '2016-09-12 01:59:15', 1),
('asha1514', 1, 2, 4, NULL, 3, NULL, 'ASHA', 'MO1', '2016-09-12 01:59:15', 'MO1', '2016-09-12 01:59:15', 1),
('asha1514', 1, 2, 5, NULL, 1, NULL, 'ASHA', 'MO1', '2016-09-12 01:59:15', 'MO1', '2016-09-12 01:59:15', 1),
('asha1514', 1, 2, 6, NULL, 3, NULL, 'ASHA', 'MO1', '2016-09-12 01:59:15', 'MO1', '2016-09-12 01:59:15', 1),
('asha1514', 1, 2, 7, NULL, 3, NULL, 'ANM', 'MO1', '2016-09-12 01:59:15', 'MO1', '2016-09-12 01:59:15', 1),
('asha1514', 1, 2, 25, NULL, 1, NULL, 'ANM', 'MO1', '2016-09-12 01:59:15', 'MO1', '2016-09-12 01:59:15', 1),
('asha1514', 1, 3, 3, NULL, 2, NULL, 'ASHA', 'MO1', '2016-09-12 01:59:15', 'MO1', '2016-09-12 01:59:15', 1),
('asha1514', 1, 4, 8, NULL, 2, NULL, 'ANM', 'MO1', '2016-09-12 01:59:15', 'MO1', '2016-09-12 01:59:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hm_cp_tasks`
--

CREATE TABLE `hm_cp_tasks` (
  `Template_Task_id` int(10) UNSIGNED NOT NULL,
  `Template_id` int(10) UNSIGNED NOT NULL,
  `Category_id` int(10) UNSIGNED NOT NULL,
  `Programs_id` int(10) UNSIGNED NOT NULL,
  `Actor_id` int(10) UNSIGNED NOT NULL,
  `Template_Task_Desc` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Created_By` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Created_Date` datetime DEFAULT NULL,
  `Updated_By` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Updated_Date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_cp_tasks`
--

INSERT INTO `hm_cp_tasks` (`Template_Task_id`, `Template_id`, `Category_id`, `Programs_id`, `Actor_id`, `Template_Task_Desc`, `Created_By`, `Created_Date`, `Updated_By`, `Updated_Date`) VALUES
(1, 1, 1, 1, 4, 'Measure Heamoglobin(Hb)', 'ANM1', '2016-06-09 00:00:00', NULL, NULL),
(2, 1, 2, 1, 3, 'TT1', 'ANM', '2016-06-12 00:00:00', NULL, NULL),
(3, 1, 3, 1, 4, 'Drink 2 glass of milk', 'ANM2', '2016-06-04 00:00:00', NULL, NULL),
(4, 1, 1, 1, 4, 'Measure Girth', 'ANM2', '2016-06-01 00:00:00', NULL, NULL),
(5, 1, 2, 1, 4, 'TT2', 'ANM2', '2016-06-04 00:00:00', NULL, NULL),
(6, 1, 4, 1, 4, 'IFA', 'ANM1', '2016-06-12 00:00:00', NULL, NULL),
(7, 1, 4, 1, 3, 'Calcium', 'ANM2', '2016-06-12 00:00:00', NULL, NULL),
(8, 1, 3, 1, 3, 'Sleep for 9 hours', 'ANM1', '2016-06-22 00:00:00', NULL, NULL),
(9, 2, 5, 1, 3, 'Measure SpO2', 'ANM1', '2016-07-10 00:00:00', NULL, NULL),
(10, 2, 5, 1, 3, 'Visit HPV (Once)', 'MO1', '2016-07-10 00:00:00', NULL, NULL),
(11, 2, 3, 1, 4, 'Eat Fresh Fruits', 'ANM1', '2016-07-03 00:00:00', NULL, NULL),
(12, 2, 7, 1, 3, 'Take Medications', 'ANM1', '2016-07-16 00:00:00', NULL, NULL),
(14, 2, 5, 1, 4, 'Measure BP', 'MO1', '2016-07-16 00:00:00', NULL, NULL),
(15, 3, 9, 1, 5, 'Visit Podiatrist', 'MO1', '2016-07-10 00:00:00', NULL, NULL),
(16, 3, 9, 1, 5, 'Visit Ophthalmologist', 'MO1', '2016-07-12 00:00:00', NULL, NULL),
(17, 3, 10, 1, 4, 'Schedule an appointment for EKG', 'MO1', '2016-07-12 00:00:00', NULL, NULL),
(18, 3, 11, 1, 5, 'Do albumin and creatinine test', 'MO1', '2016-07-13 00:00:00', NULL, NULL),
(19, 3, 11, 1, 3, 'Take appointment for Egfr', 'MO1', '2016-07-03 00:00:00', NULL, NULL),
(20, 3, 11, 1, 3, 'Do LDL test', 'MO1', '2016-07-22 00:00:00', NULL, NULL),
(21, 3, 12, 1, 5, 'Do Flu Vaccination', 'MO1', '2016-07-14 00:00:00', NULL, NULL),
(22, 3, 12, 1, 5, 'Visit provider for Pneumovax', 'MO1', '2016-07-20 00:00:00', NULL, NULL),
(23, 3, 13, 1, 2, 'Create Diet Plan', 'MO1', '2016-07-15 00:00:00', NULL, NULL),
(24, 3, 13, 1, 3, 'Review foot inspection', 'MO1', '2016-07-23 00:00:00', NULL, NULL),
(25, 1, 2, 1, 3, 'TT_Booster', 'MO1', '2016-07-23 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hm_cp_templates`
--

CREATE TABLE `hm_cp_templates` (
  `Template_id` int(10) UNSIGNED NOT NULL,
  `Programs_id` int(10) UNSIGNED NOT NULL,
  `User_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Template_Name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Created_By` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Created_Date` datetime DEFAULT NULL,
  `Updated_By` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Updated_Date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_cp_templates`
--

INSERT INTO `hm_cp_templates` (`Template_id`, `Programs_id`, `User_id`, `Template_Name`, `Created_By`, `Created_Date`, `Updated_By`, `Updated_Date`) VALUES
(1, 1, 'ANM1', 'Ante Natal Care', 'ANM1', '2016-06-20 00:00:00', NULL, NULL),
(2, 1, 'MO1', 'Post Natal Care', 'MO1', '2016-07-07 00:00:00', NULL, NULL),
(3, 1, 'MO1', 'Diabetes', 'MO1', '2016-07-10 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hm_devices`
--

CREATE TABLE `hm_devices` (
  `Devices_id` int(10) UNSIGNED NOT NULL,
  `Device_long_Name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Device_Short_Name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_devices`
--

INSERT INTO `hm_devices` (`Devices_id`, `Device_long_Name`, `Device_Short_Name`) VALUES
(1, 'Blood pressure device', 'bp'),
(2, 'ECG device', 'ecg'),
(3, 'Pulse oximeter device', 'pulse_oxi'),
(4, 'HB device', 'hb');

-- --------------------------------------------------------

--
-- Table structure for table `hm_device_attributes`
--

CREATE TABLE `hm_device_attributes` (
  `Device_Attributes_id` int(10) UNSIGNED NOT NULL,
  `Devices_id` int(10) UNSIGNED NOT NULL,
  `Device_Attribute_Name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Device_Attribute_short_Name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Device_Attribute_Datatype` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_device_attributes`
--

INSERT INTO `hm_device_attributes` (`Device_Attributes_id`, `Devices_id`, `Device_Attribute_Name`, `Device_Attribute_short_Name`, `Device_Attribute_Datatype`) VALUES
(1, 1, 'hm_systolic', 'bp_sys', 'integer'),
(2, 1, 'hm_diastolic', 'bp_dia', 'integer'),
(3, 1, 'hm_pulseRate', 'bp_pulse', 'integer'),
(4, 2, 'ecg_wavepoints', 'ecg_wavepoints', 'varbinary'),
(5, 3, 'pulse_rate', 'pulse_rate', 'integer'),
(6, 3, 'perfusion_index', 'perfusion_index', 'integer'),
(7, 3, 'SpO2', 'SpO2', 'integer'),
(8, 3, 'pulseox_wave_points', 'pulseox_wave_points', 'varbinary'),
(9, 3, 'pulse_beats_points', 'pulse_beats_points', 'varbinary'),
(10, 4, 'hb', 'hb', 'decimal');

-- --------------------------------------------------------

--
-- Table structure for table `hm_diagnosis`
--

CREATE TABLE `hm_diagnosis` (
  `Diagnosis_id` int(10) UNSIGNED NOT NULL,
  `DiagnosisType` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_diagnosis`
--

INSERT INTO `hm_diagnosis` (`Diagnosis_id`, `DiagnosisType`) VALUES
(1, 'Diabetes');

-- --------------------------------------------------------

--
-- Table structure for table `hm_districts`
--

CREATE TABLE `hm_districts` (
  `Country_ID` int(10) UNSIGNED NOT NULL,
  `State_ID` int(10) UNSIGNED NOT NULL,
  `District_id` int(10) UNSIGNED NOT NULL,
  `District_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_districts`
--

INSERT INTO `hm_districts` (`Country_ID`, `State_ID`, `District_id`, `District_name`) VALUES
(1, 1, 1, 'Pune'),
(1, 1, 2, 'Nagpur');

-- --------------------------------------------------------

--
-- Table structure for table `hm_drugmaster`
--

CREATE TABLE `hm_drugmaster` (
  `DrugId` int(10) UNSIGNED NOT NULL,
  `DrugName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DrugForm` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Route` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Units` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DrugType` int(10) UNSIGNED DEFAULT NULL,
  `DrugDescription` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DrugCategory` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_drugmaster`
--

INSERT INTO `hm_drugmaster` (`DrugId`, `DrugName`, `DrugForm`, `Route`, `Units`, `DrugType`, `DrugDescription`, `DrugCategory`) VALUES
(1, 'Paracetemol', 'tablet', 'oral', 'milligrams', 1, 'Used for mild aches.', 'IFA'),
(2, 'Gelousel', 'capsule', 'oral', 'milligrams', 1, 'Used for acidity.', 'Calcium'),
(3, 'Gelousel 2', 'capsule', 'oral', 'milligrams', 1, 'Used for acidity.', 'Calcium'),
(4, 'Paracetemol 2', 'tablet', 'oral', 'milligrams', 1, 'Used for mild aches.', 'IFA'),
(5, 'Other 2', 'capsule', 'oral', 'milligrams', 1, 'Used for acidity.', 'Other'),
(6, 'Other ', 'tablet', 'oral', 'milligrams', 1, 'Used for mild aches.', 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `hm_gender`
--

CREATE TABLE `hm_gender` (
  `Gender_Id` int(10) UNSIGNED NOT NULL,
  `Gender_Name` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Gender_Short_NM` char(1) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_gender`
--

INSERT INTO `hm_gender` (`Gender_Id`, `Gender_Name`, `Gender_Short_NM`) VALUES
(1, 'Female', 'F'),
(2, 'Male', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `hm_identity_cards`
--

CREATE TABLE `hm_identity_cards` (
  `Card_Type_id` int(10) UNSIGNED NOT NULL,
  `Card_Type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Card_Description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_identity_cards`
--

INSERT INTO `hm_identity_cards` (`Card_Type_id`, `Card_Type`, `Card_Description`) VALUES
(1, 'Aadhar', 'Aadhar card'),
(2, 'PAN', 'PAN card');

-- --------------------------------------------------------

--
-- Table structure for table `hm_investigationtest`
--

CREATE TABLE `hm_investigationtest` (
  `InvestigationTest_id` int(10) UNSIGNED NOT NULL,
  `InvestigationTestType` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_investigationtest`
--

INSERT INTO `hm_investigationtest` (`InvestigationTest_id`, `InvestigationTestType`) VALUES
(1, 'Blood Glucose'),
(2, 'Urine Analysis'),
(3, 'ECG'),
(4, 'Pulse Oximeter'),
(5, 'Fetal Doppler');

-- --------------------------------------------------------

--
-- Table structure for table `hm_learning_content`
--

CREATE TABLE `hm_learning_content` (
  `Learning_id` int(10) UNSIGNED NOT NULL,
  `Programs_id` int(10) UNSIGNED NOT NULL,
  `Program_Details_id` int(10) UNSIGNED NOT NULL,
  `Learning_user_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Learning_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Learning_description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Learning_ext_int` tinyint(1) DEFAULT NULL,
  `learning_content_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `learning_link` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `learning_created_date` datetime DEFAULT NULL,
  `learning_created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_learning_content`
--

INSERT INTO `hm_learning_content` (`Learning_id`, `Programs_id`, `Program_Details_id`, `Learning_user_type`, `Learning_type`, `Learning_description`, `Learning_ext_int`, `learning_content_type`, `learning_link`, `learning_created_date`, `learning_created_by`) VALUES
(1, 1, 1, 'asha', 'education', 'ANC care', 1, 'pdf', 'http://10.51.232.175:4300/educationAndLearning/aonsectionIII_2.pdf', '0000-00-00 00:00:00', NULL),
(2, 1, 2, 'asha', 'training', 'NHM training', 1, 'pdf', 'http://10.51.232.175:4300/educationAndLearning/ASHA_ANM_Booklet_NHM_Education.pdf', '0000-00-00 00:00:00', NULL),
(3, 1, 3, 'asha', 'training', 'ASHA training module', 0, 'video', 'http://nrhm.gov.in/communitisation/asha/resources/asha-training-modules.html', '0000-00-00 00:00:00', NULL),
(4, 1, 4, 'asha', 'education', 'Pregnancy Tips', 0, 'video', ' ', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hm_medication`
--

CREATE TABLE `hm_medication` (
  `HM_MedicationId` int(10) UNSIGNED NOT NULL,
  `PHC_ID` int(10) UNSIGNED DEFAULT NULL,
  `Patient_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DrugId` int(10) UNSIGNED NOT NULL,
  `Medicine_Qty` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Created_Date` datetime DEFAULT NULL,
  `Updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Updated_Date` datetime DEFAULT NULL,
  `Duration_In_Days` int(10) UNSIGNED DEFAULT NULL,
  `DrugCategory` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_medication`
--

INSERT INTO `hm_medication` (`HM_MedicationId`, `PHC_ID`, `Patient_id`, `DrugId`, `Medicine_Qty`, `Created_by`, `Created_Date`, `Updated_by`, `Updated_Date`, `Duration_In_Days`, `DrugCategory`) VALUES
(161, NULL, 'asha1512', 1, '5', 'mo1', '0000-00-00 00:00:00', NULL, NULL, 5, 'IFA');

-- --------------------------------------------------------

--
-- Table structure for table `hm_patient`
--

CREATE TABLE `hm_patient` (
  `Patient_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PinCode` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Village_id` int(10) UNSIGNED NOT NULL,
  `City_id` int(10) UNSIGNED NOT NULL,
  `District_id` int(10) UNSIGNED NOT NULL,
  `State_ID` int(10) UNSIGNED NOT NULL,
  `Country_ID` int(10) UNSIGNED NOT NULL,
  `Card_Type_id` int(10) UNSIGNED DEFAULT NULL,
  `Gender_Id` int(10) UNSIGNED NOT NULL,
  `Cast_Category_Id` int(10) UNSIGNED NOT NULL,
  `Patient_Salutation` char(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Patient_FName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Patient_MName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Patient_LName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Patient_DOB` date DEFAULT NULL,
  `Patient_Age` int(10) UNSIGNED DEFAULT NULL,
  `Patient_Language` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Patient_POB` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Education` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Patient_BPL` int(10) UNSIGNED DEFAULT NULL,
  `Patient_Marital_Status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Patient_Contact` int(10) UNSIGNED DEFAULT NULL,
  `Address_line1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address_line2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Patient_Emergency_number` int(10) UNSIGNED DEFAULT NULL,
  `Patient_Ward` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Patient_Image` longtext COLLATE utf8_unicode_ci,
  `Created_By` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Created_Date` datetime DEFAULT NULL,
  `Updated_By` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Updated_Date` datetime DEFAULT NULL,
  `Card_Number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_patient`
--

INSERT INTO `hm_patient` (`Patient_id`, `PinCode`, `Village_id`, `City_id`, `District_id`, `State_ID`, `Country_ID`, `Card_Type_id`, `Gender_Id`, `Cast_Category_Id`, `Patient_Salutation`, `Patient_FName`, `Patient_MName`, `Patient_LName`, `Patient_DOB`, `Patient_Age`, `Patient_Language`, `Patient_POB`, `Education`, `Patient_BPL`, `Patient_Marital_Status`, `Patient_Contact`, `Address_line1`, `Address_line2`, `Patient_Emergency_number`, `Patient_Ward`, `Patient_Image`, `Created_By`, `Created_Date`, `Updated_By`, `Updated_Date`, `Card_Number`) VALUES
('asha1005', '41001', 1, 1, 1, 1, 1, 1, 2, 1, 'Mr', 'Sunil', 'Kumar', 'Muttepawar', '1998-10-01', 18, 'English', 'Gurugram', 'Literate', 0, 'Married', 4294967295, 'Kaur baugh', '', 1234567890, 'null', '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAKBueIx4ZKCMgoy0qqC+8P//8Nzc8P//////////////\r\n////////////////////////////////////////////2wBDAaq0tPDS8P//////////////////\r\n////////////////////////////////////////////////////////////wAARCAPABQADASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwCGiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAP/9k=', 'asha1', '2015-11-17 13:43:45', 'asha1', '2016-11-15 13:43:45', '123456789012');
INSERT INTO `hm_patient` (`Patient_id`, `PinCode`, `Village_id`, `City_id`, `District_id`, `State_ID`, `Country_ID`, `Card_Type_id`, `Gender_Id`, `Cast_Category_Id`, `Patient_Salutation`, `Patient_FName`, `Patient_MName`, `Patient_LName`, `Patient_DOB`, `Patient_Age`, `Patient_Language`, `Patient_POB`, `Education`, `Patient_BPL`, `Patient_Marital_Status`, `Patient_Contact`, `Address_line1`, `Address_line2`, `Patient_Emergency_number`, `Patient_Ward`, `Patient_Image`, `Created_By`, `Created_Date`, `Updated_By`, `Updated_Date`, `Card_Number`) VALUES
('asha1043', '41001', 7, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Shantabai', 'Prakash', 'Patil', '1984-09-12', 32, 'Marathi', 'Kolhapur', 'Literate', 0, 'Married', 4294967295, 'Kothrud pune', '', 4294967295, '12', '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAKBueIx4ZKCMgoy0qqC+8P//8Nzc8P//////////////\r\n////////////////////////////////////////////2wBDAaq0tPDS8P//////////////////\r\n////////////////////////////////////////////////////////////wAARCAPIBRADASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwCGiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigApaSloAKB1opR1oAdS0lLSAKKKKAEbpTKc3Sm0wCiiig\r\nBKKWigBKWiigBKKWigBKWiigAooooASilooASilooASilooASilooASilooAKSlooASilooASilo\r\noASilooASilooASilooASilooASloooAKSlooASiiloASiiigAooooAKKKKACiiigAooooAKKKKA\r\nCiiigAoopaAEopaKAEpaKKACiiigApKWigBKWiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooASilooASilpKACiiigAooooAKKKKACiiigAoopaAEpa\r\nKKACiiigAooooActOpq06kAUUUUAIaZTzTKAEpaKKYBThTacKQC0tJS0gCiiigYUUUUAFFFFABS0\r\nlLQAUUUUALRSUtAEFFFFUIKKKKACiiigAooooAKKKKACiiigAooooAKWkpRQAUo60lKvWgB1LSUt\r\nIAooooAa3Sm05qbTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAEopaKACiiigApKWigApKWigAoo\r\nooAKKKKACiiigAooooActOpq06kAUUUUAIaZTzTDQAlO7UlL2pgJThTacKQC0tJS0gCiiigYUUUU\r\nAFFFFABS0lLQAUUUUALRSUtAEFFFFUIKKKKACiiigAooooAKKKKACiiigAooooAKXtSU4dKAEpVp\r\nKVaAHUtJS0gCiiigBrU2nNQo+YUwExRg1ZxS4FAFXFGKtYFGBQBVxRirOB6UYFAFbFGKs4HpRgel\r\nAFbFGKs7R6UbR6UAVqKs7R6UbR6UAVqKs7R6CjaPQUAVaKs7F9BRsX0FAFairOxfSjYvpQBWoqzs\r\nX0o2L6UAVqKs7F9KPLX0oArUVY8tfSjy19KAK9FWPLX0o8tfSgCvRVjyl9KPKWgCvRVjylpPKWgC\r\nCip/KWjyloAgoqfyhR5QoAgoqfyhSeUPWgCGipvKHrR5Q9aAIaKm8ketHk+9AENFTeT70eT70AQ0\r\nVL5PvR5PvQBFRUvkn1o8k+tAEVFS+UfWk8o+tAEdFSeUaPKagCOipPKajymoAjop/lNR5bUAMop/\r\nlt6UeW3pQAyin+W3pSeW3pQA2inbG9KNjelADaKdsPpRtPpQA2inbT6UbT6UANopdpo2n0oASilw\r\naMGgBKKXBoxQAlFLijFACUUuKKAEopaKAEopaKAEopaKAEopaKAEopaKAEpaKKAEopaKAEopaKAE\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBy06mrTqQBRRR\r\nQAhphp5phoAKcOlNp6j5aYDTSikNKKQC0tJS0gCiiigYUUUUAFFFFABS0lLQAUUUUAFLSUUAQ0UU\r\nVQgooooAKKKKACiiigAooooAKKKKACiiigApw6U2nfw0AJSrSUq0AOpaKKQBRRRQA1qE+8KG60sf\r\n3xTAsUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUU\r\nUAFFFFABRRRQAUUUUAFGKKKADFGBRRQAYFJgelLRQAmB6UbR6UtFACbR6UbR6UtFACbR6UmxfSnU\r\nUAN2L6UbF9KdRQA3y19KPLWnUUAM8taPLWn0UAM8oUeUKfRQBH5Qo8oVJRQBH5Qo8r3qSigCPyve\r\nk8r3qWigCLyqPKqWigCHyjR5RqaigCHyjSeUanooAg8o0eWanooAr+W1HlmrFFAFfyzRsPpViigC\r\ntsPpRsPpVmjFAFbafSjafSrOKMCgCrtPpRtPpVrApMCgCtg0YNWdo9KNooArYNGKs7R6UbR6UAVs\r\nUYqxsFGwUAVqKs7BULjBoARadTVp1IAooooADUZqQ1GaACng/LTKcvSmAhoFBoFIB1FFLSAKKSlo\r\nAKKKKBhRRRQAUtJRQAtFFFABRRRQBDRRRVCCiiigAooooAKKKKACiiigAooooAKKKKACn44ptO/h\r\npANpVpKctMB1FFFIAooooAa3Wlj++KRutOi++KYE9FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAHpUEnWp6gk60ANWnU1adSAKKKKAENMNPNMNABTh0p\r\ntKOlMANApDSikA6lpKKQBS0lFAxaKKKACiiigAooooAWiiigAooooAhoooqhBRRRQAUUUUAFFFFA\r\nBRRRQAUUUUAFFFFAC07tTRSnpSASnLTactADqKKKACiiigBrdadF9+mnrT4fvUwJqKKKACiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACii\r\nigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqCTrU9QSdaAGrTqat\r\nOpAFFFFAAaYaeaYaAEpwHFNpwPFMBDQKQ0opAOooopALRSUUDFooooAKKKKACiiigBaKSloAKKKK\r\nAIaKKKoQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAopTSDrS0AJTlptOXpQA6iiikAUUUUAMPWpIf\r\nvGoz1qWHqaYEtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAVBJ1qeoJOtADVp1NWnUgCiiigBDTDTzTDQAUo6UlKOlMBKUUlKKQDqKKKQBRS0lAwoopa\r\nACiiigAooooAKWkooAWiiigCGiiiqEFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAKvWlNCfeoNIBKc\r\nvSm04dKAHUUUUAFFFFADD1qWHvUR61LD3pgS0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFF\r\nFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFFFFABRRRQAUUmaXNABRRmkzQAtFJmjNAC0UmaM0ALRRmk3UALRTd1G+gB1FN3UuaAFoozRQAUU\r\nUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRR\r\nQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOtADVp1NWnUgCiiigB\r\nDTDTzTDQAUvakpe1MBKUUlKKQDqKKKQBRRRQMKKKWgBKWiigAooooAKKKKAClpKKAIqKKKoQUUUU\r\nAFFFFABRRRQAUUUUAFFFFABRRRQA5OtBpU6/hSGkAlOHSm08dKAFooooAKKKKAGd6mh6Goamh+6a\r\nYElFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFIWAppcUAPpCcVGz0wsaAJS9NL1HRQA/fRvpl\r\nFAD9xpNxpM0UAODUoamUUATbhRkVFRQA8tTM0lFABmiiigAzS5pKKAHBjSh6ZS0ASh6UEVDSg0AT\r\nUUwPTgc0ALRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOtADVp1NWnUAFFFFI\r\nBDTDUhphoASlHSkpR0pgJSikpRSAdRRRSAKKKKBhRRRQIKKWigYUUUUAFFFFABRRRQBFRRRVCCii\r\nigAooooAKKKKACiiigAooooAKKKKAHJ1P0pDSr3pKACnimU8UgFooooAKKKD0oAZU8P3agqeL7lM\r\nB9FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFFABSZoJxUbPQA8timF6YTSUAKWzSZoooAKKSigBaSiigApaSloAK\r\nWkpRSAKKSloAUUGkopgFFFHagBKWkooAWiiigBaKKKACiiigBaXNJRQIeDT6jXrUlAwooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAqCTrU9QSdaAGrTqatOpAFFFFACGmGnmmGgApQOKSnDpTAbSik\r\npRSAdRRRSAKKKKACiiigBaKKKBhRRRQAUUUUAFFFFAEVFFFUIKKKKACiiigAooooAKKKKACiiigA\r\nooooAcvekpR0NJQAU8UynikAtFFFABQelFB6UAMqeL7lQVYj+4KYDqKKKACiiigAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAozRSHigB\r\naYz4prPUZOaAHM2abSUUALSUUUAFLSUUAFFFJQAtFFFABS5pKKAFzRSUUALRRRSGLRRRQAUhNFIa\r\nBBS0lFMBRRmiigBc0tNpaAFooooAWiijNAhy9akqIVIpyKBi0UUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFF\r\nFABRRRQAVBJ1qeoJOtADVp1NWnUAFFFFIBDTTTjTTQAlKOlJSjpTASlFJQKQD6KKKQBRRRQMKKKK\r\nBBRRRQAUtJS0DCiiigAooooAioooqhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACiiiigAp4pgp9I\r\nBaKKKACg9KKG6UAMqxH9wVXqyn3BTAWiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooprNgUAKxwKhZ80jNmm0AGaKKSgBaKKKACi\r\niigBaSiigApKWigBKWkooAWikooAUGnAgimUtAxcUZoopAGaKKKAA0lOoxQA2inYoxQA2ilooEFK\r\nKSloAWikopgLRSUtACinKcU2lzQIlFFMU0+gYUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABUEnWp6gk\r\n60ANWnU1adSAKKKKACmGnmmGgBKcOlNpw6UwG0Cg0CkA8UUCikAUUUUDCiiigQUUUUAFLSUtABRR\r\nRQMKKKKAIqKKKoQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAtFFFAAKfTB1p9IBaKKKACkbpS0jdK\r\nAGirK/dFVhVlfuimAtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFIaAAnFQu2TSu1RmgApKKKACiiigAooooAKWkooAWikpaACkoooAK\r\nWiigYUUuKMUgEopaMUAJS0YpaBiUuKBS0AJS0UtACYop2KCKAGUYp2KMUCG0U7FJQAUUUUCCiiim\r\nAU6m0UAPFKGpmaWgRIDS1Hml3cUDH0ZqMMaXdQA7NIWppJpDQIeG9adUQp6mgY6iiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqCTr\r\nU9QSdaAGrTqatOoAKKKKQAaYafTDQAlKOlJSjpTASgUUCgB4ooFFSAUUUUAFFFFABRRRQMKWkpaA\r\nCiiigAooooAioooqhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0UUUAA60+mjrTqQC0UUUAFI3Sl\r\npG6UANFWh0FVRVodKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFFFFABRRRQAUUUUAFFFITQAtRO9DvUZNACE0lFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAxaW\r\nkpQKQwpaMUuKAEpaUClxQAmKMU7FGKAG4pcUuKWgBuKXFLRSASilooATFJTqSgBMUmKdQaAG4pCK\r\ndiigBuKSnGkNMVhKKKKYgpwptLmgBxpKSg8UgFpcimUopgOzmkNGcUUAGaKSigRIjU+oRUitmgY6\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACoJOtT1BJ1oAatOpq06gAooopABphp9MNACUUUUwCgUUUAOFLSClqQCiiigAooooAKKKKBhRR\r\nRQAtFJS0AFFFFAEVFFFUIKKKKACiiigAooooAKKKKACiiigAooooAWiiigBR1p1NHWnUgFooooAK\r\nRqWkagBB1qzVZetWaYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFFFFABRRRQAUUUUABqN2pznAqBjzQAhNFFJQAUUUUAFFFFABRRRQAUUUUAFFFFABRRSgUDEpwFO\r\nApQKQxuKXFOooATFLilopDDFFLRTEFFFFABRRRQAUtFFABRRRQAUlFFIAooooASilpKAEpKdSUAN\r\nxSYp1JimISiikoEOUZofrSpSPyaAG0tJRmmAuaXtTaUmgANFJSZoAdSqcU2igCwpyKWoVbBqUHNA\r\nC0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB\r\nUEnWp6gk60ANWnU1adQAUUUUgCmGn0w0AJRRRTAKKKKAHClpBS1IBRRRQAUUUUAFFFFAwooooAWi\r\niigAooooAioooqhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0UUUAKOtOpq9adSAWiiigApGp1Na\r\ngBF+8Ks1XT7wqxTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAo\r\noooAKKKKACg0U1zgUARyNUdKxyabQAUUUUAFFFFABRRRQAUUUUAFFFFABRRTgKQwApwFApaChRRS\r\nUUgFooFLQAUtJS0AFFFFAgooooAKKKKAClpKKACiiigAooooAKKKKACkpaSgYUlLRQAlJS0UANNN\r\npxpDTEIpwaVqbSk0EiUUUlMBaM0UUAFFJRQAtApKUGgB1ORsGo80A0AWQaWo0NSUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABUEnWp6gk60ANWnU1a\r\ndQAUUUUgENNNONNNACUUUUwCiiigBwpaQUtSAUUUUDCiiigQUUUUAFFFFAwpaSloASloooAioooq\r\nhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFLQAUUUUAKtOpq0+kAUUUUAFNbrT6Y3WmAqfeFWKrx/fFW\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqGQ1\r\nI5wKgY80AJSUUUAFFFFABRRRQAUUUUAFFFFABRRTgKQwAp1FFIoKKBS0AFLRS0AFFFFAC0UlFAC0\r\nUlFAC0UlFABS0lFAC0UmaKAClpKKAFpKKKAClpKKACiikoAWikooAKKKKAEpDS0UAMNJTiKQ0xMS\r\nkoopkhRRRQAUUUUAFLSUUALRSUtACg4NWFORVapY2oAlooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKrydasVBJ1oAYtPpi0+gAooopAIaaetONNNACUU\r\nUUwCiiigBwpaQUtSAUUUUDCiiigAooooAKKKKBBS0lFAxaKKSgCOiiiqEFFFFABRRRQAUUUUAFFF\r\nFABRRRQAUtJS0AFFFFACrT6YtPpAFFFFABTW606mt1pgOj++KnqCL74qegAooooAKKKKACiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoopGoAjkNRGnuaZQAlFFFABRRRQAU\r\nUUUAFFFFABRRSigYCnCkFLSKFooopALRRRQAtFJRQAtFFFABRRRQAUtJRQAtFJS0AFFFJQAtFJS0\r\nAFFJS0AJRS0lABRRRQAUUUUAFFFFABRRRQAUlLRQA00hp1IaAGGkpxptMkKKKKYgooooAKKKKACi\r\niigBaUHBptFAFlDkU6oY25qagAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoo\r\nooAKKKKACiiigAqCTrU9QSdaAGLT6avWnUAFFFFIBDTTTqaaAEooopgFApKUUAOFLSClqQCiiigY\r\nUUUUAFFFFABRRRQAUUUUAFFFFAEdFFFUIKKKKACiiigAooooAKKKKACiiigApaKKACiiigBVp9NW\r\nnUgCiiigAprdadTT1pgOi+/U9QxffqagAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigApr9KdTJKAIWNJSmm0AFFFFABRRRQAUUUUAFFFFABSiilFIpC0UtFIYU\r\nUUUAFFFFAxaKSigBaKSlpCClpKKYC0UlLQAUUUUALSUUUALRSUUALRSUUALSUUUAFFLSUAFFFFAB\r\nRRRQAUlFFABRRRQAUlLRQA002n000xDaKU0lMkKKKKACiiigAooooAKKKKAHA4NTo2RVeno2KYE9\r\nFIDmlpAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOt\r\nADV606mLT6ACiiikAhpppxppoASiiimAlLSUooAcKWkFLUgFFFFAwooooAKKKKBBRRRQMKKKKACi\r\niigCOiiiqEFFFFABRRRQAUUUUAFFFFABRRRQAUtJS0AFFFFADlp1NWnUgCiiigApp606mHrTAkh+\r\n9+FTVDD941NQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAVHJUlRSdaAIjSUppKACiiigAooooAKKKKAClFFKKRSClFFFIYtFJRQAtFJS0AFFFLQAUlLRQMSl\r\npcUmKBBRRilpDEooopgLRSUtAgooooAKKKWgAoopKAFooooAKKKKAEopaKAEooooAKSlooASiloo\r\nASilpKAA0006kNADTTaeaaaYmJRRRTJCikpaACiiigAooooAKXNJRQBMjVIDVYHFPVuaYE9FIpyK\r\nWkAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFQSdanqCTrQAxetPpi9a\r\nfQAUUUUgENNNONNNACUUUUwEpRSUooAcKWkFLUgFFJRQMWiiigAooooEFFFFAwooooAKKKKAI6KK\r\nKoQUUUUAFFFFABRRRQAUUUUAFFFFABS0lLQAUUUUAOWnU1elOpAFFFFABTD1p9MPWmBLD1NS1FD1\r\nNS0AFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAB6VA55qV\r\nzxUB60AJSUtJQAUUUUAFFFFABRRSigYCnUlLSGFFFFIYUUUtACUtFFABS0lLQAtFFFAC0UUUAFJS\r\n0UAJRS0lABRRRQAUUUUAFLSUUALRSUUALRRRQAUUUUAFFFFACUUUUAFFJSigAooooAKSlpKACkpa\r\nSgBDSGnU00CG0UppKoQlFLRQIKKSigBaKSloAKKKKAClFJRQBMjVKKrocGpweKYC0UUUgCiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACoJOtT1BJ1oAYvWn0xetPoAKKKKQCGmnrTj\r\nTDQAUUUUwEpRSUooAcKKBRUgFFFFAwopaKACikooAKWkpaACiiigAooooAjoooqhBRRRQAUUUUAF\r\nFFFABRRRQAUUUUALRSUtABRRRQA5elOFNXpThSAKKKKACmd6fTKYEsPepajh6GpKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAI5DUNSPUdAAaSlpKACiiigA\r\nooooAKWkpaQ0LS0lLSKCiiigBaKKKACiiigYtFJS0AFLRRQIWikpaAClpKWgBKKKKAEooppNADqS\r\nmhqdmgBaKKKACiiigBaKKKAFpKKKACkpaSgAooooASlopaAEopaMUAJRS0lACUUtJQAhpKdSUANN\r\nNp5pppiYlJS0lMkWikooAKWkooAWiiigAooooAUVOjcVXp6HBoAsUUi0tAgooooGFFFFABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOtADF60+mL1p9ABRRRSAQ0w080w0AFFFFMBKU\r\nUlKKAHCiiipAKKKKBi0UUUAJRRRQAUtJS0CCiiigYUUUUAR0UUVQgooooAKKKKACiiigAooooAKK\r\nKKAFooooAKKKKAHDpTqaOlOpAFFFFABTKf2plMCaHoakqOH7pqSgAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACg9KKRulAELmmU5qbQMKSiigQUUUUAFFFFAC0tJSi\r\nkUFLRS0hiUtFLQAlFLS4oAbS0YooGFFFFAC0UCloEJRRRQAtFJRQAtJRRQAhNRk05qbTQBSg0lFA\r\niQUtNXpTqQwopKKAFopM0ZoAWikzS5oAWikzS5oAKKKKACiiigAooooAKKKKACkpaSgBKSnUlADT\r\nSGnUlADDRSmkqiWJRRRQIKKKKACiiigBaKKKAClHWkooAnQ5FPFQxtU4pgFFFFIAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACoJOtT1BJ1oAYvWn0xetPoAKKKKQCGmGnmmGgAooopgJSi\r\nkpRQA6igUVIBRRRQMKWkpaBCUUUUDClpKWgQUUUUAFFFFAyOiiiqEFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUtFBoAKKKKAHDpTqQdKWkAUUUUAB6UynnpTKYE8P3afTIvuU+gAooooAKKKKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACkbpS0xzQBE3WmU5utNoGFFFFAgooooAKKKKAFF\r\nLQKKRQopcUClpDDFLSUZoAWikooAWikooGLRSZozQIWlpuaN1AC0Zpu6k3UAOzRTc0uaAFzRmm5o\r\nzQANTKcaSmgYlFFFAiRelLSLwKWkMTNFFJmgAzRSUUALmjNJRQAuaXNMpaAHZozTaKAHbqXdTKKA\r\nH5pc0yjNAD80U3NGaAHUUmaKAFpKKKAEpKWkoAQ02nmmmmJjaKKKZIUUUUAFFFFABS0lLQAUUUUA\r\nKpwasIciq1TRNQBLRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABVeTrViq8nWgB\r\nq9afTF60+gAooopAIaYaeaYaACiiimAlKKSlFADhRQKKkAooooAKKKKBhRRRQAUtJS0AFFFFAgoo\r\nooGR0UUVQgooooAKKKKACiiigAooooAKKKKAFoNFK3WgBKKKKAHDpTqQUtIAooooAD0plPPSmUwJ\r\n4vuU+mxfcFOoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigANRMK\r\nexpp6UDIj1ptObrTaACiiigQUUUUAFKKSlFA0LSikpRUlC0UUUAFFFJQAtFJRQAuaTNJRQAuaM0l\r\nFAC5pKKSmAtJRRQAtGaSigBaKSigBaSlpKAEpyikpwoAdSUUlIApKKSmAUUUUCCiikoAWiiigAop\r\nKWgApaSigYtLSUtIBaKKKAEozS0UAGaM0mKKAFopM0tACU006kNAhtJSmkqiQooooAKKKKACiiig\r\nBaKKKACnIcGm0ooAsqcilqOM8VJQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUCCiiigYVBJ1\r\nqeq8nWgBq9afTF60+gAooopAIaYaeaYaACiiimAlKKSlFADqKBRSAKKKKQwooooEFFFFABS0lFAC\r\n0UUUAFFFFAEdFFFUAUUUUAFFFFABRRRQAUUUUAFFFFACilf71IOtOk4c0ANooooAeKWkFLSAKKKK\r\nAA9KZTz0pgpgWI/uCnU1PuCnUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABQaKQmgBpppPFObpTKRRGaSlNJTEFFFFAgooooAKUUlKKQ0KKWijNIoKKSigBaKKKACiiigBK\r\nKKKYCUUUUAFFJRQIWikooAWikooAWikooAWiiigBRS0lLSGLSUtJQAlJQaKYBSUtJQIKKKKBBRRR\r\nTAKKKKAFopKKQx1LTc0oNAC0tJmjNIYtFJRQAtJS0UANpaKSgBaKKKAGmm08000yWJRRRTEFFFFA\r\nBRRRQAtFFFABRRRQBJGanFVlODVhTkUALRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAgopKWgAooooA\r\nKrydasVBJ1oGMXrT6YvWn0AFFFFIBDTDTzTDQAUUCimAlLSUUALmjNJRQA7NGabRQA7NJmkooAWi\r\nkooAWjNJRQAuaM0lFAC5ozSUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAKOtOkOWNNoPWgAoooo\r\nAeKWkFLSAKKKKABulMFObpTaYFhPuCnUifdFLQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFMY80+o260DQh6UlKabSGMNJSmkpiCiiigQUUUUAApwpBS0hoWm0UUDFoooo\r\nGLRSUUgFpKM0ZoAKSjNJmmIWkoooFcKKSimAtFJS0AFFFFABRRRSAWiiigYtKKSlpDClpKKAENJS\r\nmkpgFJS0lAgooopiCiiigApKKKBC0UlFAC0ZpKKBi5pc02loC47NGabRmkO47NLmm5ozQMdRSUtI\r\nAoooxQAGmGn4ppFMQ2ilpKZIUUUUAFFFFABS0lFAC0UUUAFTRNUNOU4NAFmikU5FLQAUUUUAFFFF\r\nABRRRQAUUUUAFJS0lAgpaSloAKKKKBhUEnWp6rydaAGr1p9MXrT6ACiiikAhphp5phoAVehpDTl6\r\nGmmmAlFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAtFFFABRRRQA8UtIKWkAUUUUAI3Sm05ulNpgWV+6PpS0i/dH0paACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooopAFFFFABRRRQAVGetSHpUTdaBoTvSGgUpoKIzSUppKZIUUUUCCiiigAp\r\naSlpDQUtFFAwopKKAFpKKSgLi0maKSmK4tJRRQIKKKKACiiigAooooAKWkpaBhRRRQAtFFKBSGKK\r\nWgUopDExRTsUhoAbSGnUhoAbSUppKZLCiikpgFFFFAgopaKACiiigBKKWigBKKWkoAKKKKAFopKW\r\ngYtLTaWkMcKWmZp2aQxaaaWkNADTSUppKokKKKKBBRRRQAUUUUALRSUtABSikoFAFiM5FPqKOpaA\r\nCiiigAooooAKKKKACiiigApKWkoAKWkpaBBRRRQMKrydasVXk60ANXrT6YvWn0AFFFFIBDTDTzTD\r\nQA5ehppp6Hg0w9aAEooopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB\r\nRRRQAUUUUAFFFFABS0lFAC0UUUAPFLSCikAtFFFACN0popzdKaKYFpfuiigdBRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUgCiiigAooooAKKKKAA9KhbrUx6VC3WgaEp3amU7tQURt1pKVutJT\r\nJYUUUUCCiiigApaSlpDQUUUUDCkoooEFJRRTEFFFFABRS0UAJRS4oxQAlFLRQAlFLSUAFFFLQAUU\r\nUUhiiniminUmUFOFIKcBQAUhp1IaAG0hFOpDQAwim0800imhMSiiigQUUUtMBKKWikFgxS4oFLmg\r\ndhMUmKdSUAJijFFFACUUtFArCUUYoxTAKKXFGDSASloxS7aBiikpcUUhjTSU4000yWJRRRTEFFFF\r\nABRRRQAUtJS0AFFFFAEkR5qeq8fWrAoAKKKKACiiigAooooAKKKSgBaSikoAWikpaAFopKWgAqvJ\r\n1qxVeTrQA1etPpi9afQAUUUUgENMNPNMNADk6GmmlXvSGmAlFFFABRRRQAUUUUAFFFFABRRRQAUU\r\nUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUALQKKBQA8UUCikAUtJS0AI1NFK\r\n1A60wLI6UUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUgCiiigAooooAKKKKACiiigAPSoW61Maj\r\nagaI6U0d6CKChhpKU0lMlhRRRQIKKKKAFooopFBSUUUCCkpaKYhKWiigYUUtFIBKWiigYUUUUAJR\r\nS0lAgooooAKKKKAClApQKUCgaQCloopFCinU0U8UCYUhpaSgBKQ0tFAxtBFOpDQAwikp5FNxTEJR\r\nRijFAgooxRQAUtJRQMWiiigA4o4oxS4pAJijFOxS4oAbilC07FFAhMUUtFAxKKKKAEooooASmmnG\r\nkpiGUUppKZIUUUUAFFFFABS0lLQAUUUUAOTrVgdKrr1qwOlAC0UUUAFFFFABRRRQAUhpaKAG0UtF\r\nACUUUUAFLSUUALUD9anqB+tADV60+mL1p9ABRSUUgA0w080w0AKKSgUUwEooooAKKKKACiiigAoo\r\nooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBaBRQKAHiigUUgC\r\nlpKWgBrUDqKGoXqKYFmiiigAooooAKKKKACiiigAooooAKKKKQBRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFRsakqFutBSG96WikzQMa3WkpTSUyWFFFFAgoFFKKBoUCjFLRSKG4oxT8UYoEMxRin4oxQAyin7\r\naNtFwGUU7FJigYlFLil20ANop22l20AMop+2kIoAbRTsUbaBDcUoFOxS0DEoopaQwooopAKKcKaK\r\ndTEwpKWigQlFFFAxKKKKBiGjFFFACYoxS0tAhuKNtPooAbto206igBu2jFOooATFGKWigAxRilxS\r\n0xCYopaaaQBSUtJQMQ0lLRQMSiiigQGm06kNADTTacaSmSxKKKKYgooooAKKKKAFooooAUdasL0q\r\ntViM8UAPooooAKKKKACiiigAooooASilNNoAKKSloAKWkpaACoH61PUD9aAGr1p9MXrT6ACkoopA\r\nBphp5phoAKSlpKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFAC0CigUAPooopAFLSUtADWoX7woahfvCmBZooopAFFFFABRRRQAUUUUwCi\r\niikAUlLSUDDNLTaWgBaKSloEFFFFABRRRQAUUUUAIaibrUp6VCetBSCkNBooGNNJSmkpksKKKKBB\r\nThSAU6kUhaKKKQwpaKKAClxRRQAuKMUUtADcUYp1GKAG4pcUuKKAEooooASjFLRQAmKKKKACkpaK\r\nBjaWiikAUCigUwHClFIKdQIKQ0UUCEpKWkoGLRSUtACUUUUDDFFLRQISloooAKWkpaBCUYpaWmAm\r\nKWiloASiikoAKTNFJSGFBpKKBhSUUUAFJS0lAhaSiigBKaacaaaYmJRRRTJCiiigAooooAKWkpaA\r\nCnoeaZSg80AWBS0xDxTqQx1FJRQAtFJRQAtJRRQAUlLSUAJRRSUCHUUlLQAtV361Yqu/WmAi9afT\r\nF606kAUUUUABphp5phoAKSlpKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0CkpRQA+iiikAUtJRQAjdaF+8KRutKv3hQMnzS00U6gBa\r\nKKKBBRRRQAUUUUAFFFFACUhpaSgYlLRRSAKKKKYC0UlLQAtFFFAgooooARulQnrUrdKhPWgpAaBQ\r\naQUDEakpxptMlhRRSigBRTqSlqSgooooGFLSUtABS0lFAC0tJS0CFooFFMQUUtJQAUlLRSASiloo\r\nGJSUtFACUlLSUDCiiikAUtIKdTABTqbS0EhSUtFACUlLSUDEpaSlFAxaSg0ZoELRSUtAC0UUUCCg\r\nUUZpgLRRRQAUUUlAC5pKKSgAooopDEpKWigY2ilNJQAUlLSUAFFFFAhDSGnU00xDaKWkpkhRRRQA\r\nUUUUAFFFFAC0UlLQBIhqTNQL1qUGkMfS0gooAWikpaACiiigAooooAQ0mKdSUCExS0tFABVd+tWK\r\nrv1oARetOpq06gAooooADTDTjTTQAlFFFMAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigApRSUooAfRRRSAKKKKAGt1oX7wobrQOtAEwNOB\r\nqMUoNIokzRmmZpc0CsOopuaM0AOopKKAFooopgFJQaM0gCiiigYlFFFACilpKWmIWikpaBBRRRQA\r\njdKg71O3SoD1oKQGkpaSgYhpKU0lMlhSikpwpAhaKKWkUFFFFAwoopaACiiloAKWkpaBC0tJRTEL\r\nRRSUAFFGaKACikozSGIaKKQ0DDNJmkJpKAHUUCigBwpaSigQtLRS0xCUUtFADaSnUhpDG0Cg0CgY\r\nUlLmg0AGaUGm0A0APopoNLmgQtFJRmgB1FNzS0BYKKSigBaKSigAooooAKSiigYUlFFABSUUUAFF\r\nJS0CCmmlpDTEJSUtJTEFFFFAgooooAKKKKAClpKKAFHWpAajp4NIZIpp1MWnigApaKKAEpaSigBa\r\nKKKACikpM0ALmjNJmigBTUD9amNQt1oARadTV606gQUUUUAIaaacaaaAEooopgFFFFABRRRQAUUU\r\nUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFKKSlFAD6K\r\nKKQBRRRQA09aF+8KD1pY/vCgaJMUYp1FIY3FFLRQAlJmlNJQA4GnCmCnCgB1FFFAhppKcRSYoGJm\r\nilxRigAooxS4oAKWkpaYgpaSigBaKSloEB6VA/Wp6hkHNA0NFIetOWhqChhpKWkpksKeKYKeKTGg\r\npaKKQwooooGFLSUtAC0UlFAC0tJRQIWikooAdSUlFAC0maSkoGOzSUlGaADNITQTTaAFpQKAKdig\r\nQlLRRQMWikpc0ALS5pmaXNArDs0ZpuaTNAWHGkzRmkoADQKKKBi4GaUimgc07FAhpFNNPIppFACZ\r\npQaZS0APzRTc0ZoGOFLTaXNAC0UmaKAFopKKACiikoAU0lFFABSUtJQAUUUUCEooooAKDRRTAbSU\r\nppKCQooopiCiiigAooooAKKKKAFpy02lWkBKKeKjFPFAx1FFFABSUUUgCiiigBDSU6igBMUuKKWm\r\nAmKgfrVg1XfrQAgp1NFOoEFFFFACGmmnGmmgBKKKKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSikpRQA+iiikAUUUUANPWlj+8KQ9a\r\nWP71A0T0lFFIYUUUmKAEJpuacabigBRTxTBTxQA6ikpaYgooooAKKKKACiiigAopCabmgB9FNBpa\r\nAFoopaACopalpkg4oBEY6UhooJoKG0lLSUCYop1NFOoBC0UlLSGFFJS0DFopKKAFooooAKWkooAK\r\nKKKACikooAKKSigApKKSgApQKSnCmIcOKWm5ozSAWkzSZpM0DFzS5ptFFgHZozTc0ZosA7NJmkoo\r\nELmjNNoosA7NOBpmaXNADmpoY0uabmgCQGg0wGlzQA09aSlam0wFpabS0AOopKWkMWikozQA6ikz\r\nRmgBaSiigBKKKKACiiigApKKKBBRRRQAUUUlMANNp1NoJYUUUUxBRRRQAUUUUAFFFFABSikpRQBI\r\nDTwaiFPBpDJAaWowacDQAtFFJSAWikooGLRSUUCFpabmlBpgLVd+tWKrv1oAQU6minUCCiiigBDT\r\nTTjTTQAlFFFMAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigApRSUooAfRRRSAKKKKAGnrSx/epp60+P71A0SilpMUtIAooopgJikxTqKQxu\r\nKUUtFABS0lLTEFFFLQAlLRRQIKQ0tJQMaabin0UhiAU6kpaYgooooAKRulFB6UAQ96KQ9aKChKSl\r\nNJQJiilpBS0AhaKKSkMWikooAWlpKKBi0UUUAFFJRQAtJmikoAWikzRQAUUUlMQUUUUAFLmkooAM\r\n0ZpKKBXDNGaSimK4uaWm0tIdxaKSloAKKSigBaKSkoC4uaM0lFMVxc0ZpKKAuOozSUUh3FpKcKCK\r\nAG0UUUALS02loGLmikpaAClpKKQC5opKKBi0UlFAC0lFFAgooooAKKKKYBRRRQISkpaSgTEooopi\r\nCiiigAooooAKKKKAClpKWgBRTqaKWkMcDTgajFOBpDH0tMzS5oAdRSZpaACiiigAoFFJQIdUD9am\r\nzUDdaYAKdTRTqBBRRRQAhpppxppoASiiimAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUopKUUAPooopAFFFFADD1p8f3qYetPj60DRLS\r\n02lzSGGaM0lFAC5pabS0ALRSUmaAHUtMzSg0AOpabS0xC0UlFAC0lFJQAUUUUhhRRRQAUUUUAFFF\r\nFMCFutC0sg5pFoGDCmVI3SmUCYLS0gpaAFpKKKBhRRRQAUUUUALRSUZpDFopKKACikopiCiiigAo\r\nopKBBS0lKBQAooNKKQ0hjaKKKZIlFFLTASilpKAFooopAFFFFABSUUUwCiiigQUUtFAwoopaQCil\r\npBTqRQ0im1IRTSKYDaKKKBC0UlLQAUUUUDFopKWgAooooAKKSloAKSiigBaKSloAKSlooEJSGlpD\r\nQJiUUUUxBRRRQAUUUUAFFFFABSikpRQAtFGKWkMKBRRQMXNLmm5opAPBpc0zNLmgB4NLTAadmgBa\r\nQ0tIaAGk1Gae1RmmhMUU6miloELRSUtACGmmnGm0AJRRRTAKKKKACiiigAooooAKKKKACiiigAoo\r\nooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKUUlKKAH0UUUgCiiigBh605Ot\r\nNp8Q5NA0SUUuKMUhiUUuKMUAFJTsUYoASkxTsUYoAZilAp+KMUBcSloxRTEFLRRQIQ0maDTaQx1F\r\nIKWgYUUUUAFFFFABS0UUxDJBxUa1M/3ahHWgaHGoz1p5NMNAwFLSDrS0CCiikoGFFFFABRRRQAUU\r\nUUAFFFFABRRRQAUUlFAgooooAKeBSAUtJjFpppaaaAEooopiCiiigQUUUUAJRS0UwEopaKAEopaK\r\nAEpaKKQBRRRQAUtFFAxRTqQU6kMKaRS0UAMNJTjTaYgooooAWikpaACiiigYUUUUAFFFFABRRRQA\r\nUUUUALRSUtAhKSlNJQJiUUUUxBRRRQAUUUUAFFFFABSikpRQA6ilAyKB1pFCGkqTbSbaQDKKcRSY\r\npgJRmjFFADgacDUdKDSAlBopgNOzQAhqI1IajNNCYopaQUtAgpaSloAaaQ0ppDQAlFFFMAooooAK\r\nKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigApR\r\nSUooAfRRRSAKKKKAGVLD3qKpoe9MY+jFLRSAMUYopaAEpaKKBBRRRQAUUUUAFFFFABRRRQAhpMU6\r\n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\r\nCilFAC0UUUhhRSUUAFJRRTAKKKKBBRRRQAUUUUDCiiigQlJS0lMQUUUUCCiiigAooooAKUUlKKAH\r\nE8UgoNFIoXNJRRQMKDRRQIKM0mKKAHZpc02iiwDs0Cm0qmkBIBRigGloAYw4qM1Kw4qI00JiilpB\r\nS0CCiiigBDTacabQAUUUUwCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACnCm04UALS0lLSAKQ9KWkPSgBtPUcUypox8lDGhlGakK1GVpDD\r\ndShqYRRTAmBpwqFTUgNAh9FJmjNAC0lJmjNIYtFNzRmgB1GabupN1AD6KZuo3UAPopu6jdQA4mmM\r\naQtTCaYCHrSUUUCAU8GmUtAEmaaxpM0maBhSUtFACUtJRQAtFFFAwooooAKKKKBBRRRQMKKKKAFp\r\nabS0ALSGiikAlFLRTAKKKKAFopKKQBRSUUwFopKKAFopKKAFopKKAFozSUUALmjNJRQAtFJRQAtF\r\nJRQAtFJRQAUtJRQAtJRS0AJS0UtACYopaKQCUUUUAFJRRTAKKKKACiiigQUUUUAFFFFABRRRQAZo\r\nIzSUooEAFNNOzSGgBKKKKYgooooAKUUlLQNCmgUUopDCkpaKBiUCiigQ/HFIVp68ilxSAiIpMVIR\r\nTTQA2lAoAp4FMQoFOpMUtIBD0qA9anPSoD1poGKKWkFLQIKKKKAENNpxptMAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKcKbThQ\r\nAtLSUUgFpD0paQ9KAG1PF9wVBU8X3BQxjqQinUhpARMKYalaozQMQU8GmgU4CmA4GjNJRSAXNJSg\r\nUuKAG0lPxSEUAMJpM0rCmUwHZo3U2igVxc0ZpKKAuLmigU4CgYgWnbacBSikIZsoK1JSYoGRbaTF\r\nS4prCgBlFFFMYlFLSUCFopKWgYUUUUAFFFFABRRRQAUUUUAFFFFAC0UlLQAtJRRSAKSlpKYC0lFF\r\nABRRRQAUUlFAhaKSigBaKSigAooooAKKKKAClpKKAFpKKKACiiigBaKKKACiiigBRS0CikMKKKKA\r\nEpKWkpgFFFFAgooooAKKKKACiiigAoopKACiiigQGiiigBVGaGoBwaQnNACUUUUxBRRRQAUtFFIY\r\ntKKbTqBhQKKBQMDSUppKAJEPFPqJTzUlIQhphpxNNNAAKetMFPFAh1FFFACHpUB61O3SoD1poBVp\r\naQUtAgooooAQ02nGm0wCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigApwptOFAC0UUUgFpD0paQ9KAG1PH9wVBUinCihjRITSE0wtT\r\nd1IY4mkpM0ooAUUopKWgBaUCkzS5oAWikzRmgBaQ0maaTQANUdOJptNCYUUUUxBRRRSGKKeKaKcK\r\nQxwp1MFGaAH0ZpmaM0AOprdKXNNJoGMooNFMApKWkoEwpaSigBaKKKBhRRRQAUUUUCCiiigAoooo\r\nGFLSUtABS0gpaQBSUtJigBKKWimAlFLRQA2ilooEJRRRQAUUUUCCiiigAooooAKKKKACiiloGFFF\r\nLQAlFLilFAxMUuKWikAUUUlABSUUUAJRRRTEFFFFABRRRQAUUUUAFFFFABSUUUAFJRRTJFopKWgA\r\npKKKACiiigAooooAWiiikMWlpKUUDA0Cg0ooGBptOpDQAlPB4plKKBDiabTsUYpAAFOFAFLQIWii\r\nigBG6VAetTt0qA9aaAUUtIKWgQUUUUAIabTjTaYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU4U2nCgBaKKKQC0h6UtIelADaeB\r\nxTKmQfKKGNEZBpMVMRTCKVwGCnCkxRTGLmjNNzRmgB2aM03NGaLAOzRupuaSiwXHZpM0lFAhaMUo\r\np1AEeKKeRTaAEpaSlFACinCminA0hi0lLSUDCiiigAoPSikNADaKKKYBSUtJQJhRRRQAUtJSigAo\r\noooGFFFFAgooooAKKKKACiiigYtFFFAC0UlLSAKKKKAEopaKAEpMU6jFADaKXFGKYDaKWjFAhKKd\r\nijFADaWlxS4oAbRTsUYoGNxS4p2KMUgExRS0UAJS0UUAFFJRQAtJRRQAlFFJTAKKKKBBRRRQAUlL\r\nSUAFLSUUAFFFFABRRSUCCiiimIUUUUUgEooopgFFFFABSikpaBi0lFLSGFFFFAxadSLTqAExQRTq\r\nCOKAIjQOtOIptAEo6UuKROlOoEJS0lApCFoopaAGt0qA9anbpUB600AopaQUtAgooooAQ02nGm0w\r\nCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK\r\nKKKACiiigApwptOFAC0UUUgFpG6UtI3SgBtTp90VBUq/dFDGh9IRS0UhjMU0ipcUjCgCE0lOIpMU\r\nxCUUYpcUAJRTtpo2UANpadspNtAAKdTQKWkMU000tJigBKUUmKKYC0UlFADs0opopwFIYtJRiikA\r\nUhoopgNNFFFMBKKKKBBRRRTEFFJS0gFopKWgYUUUlABS0lFAC0UUUAFFFFABS0lFAxaWkpaQBRRR\r\nQAUtJS0AFFFFABSYpaKAExRS0hoAKWkFLQAUUUUAFFFFABS0UUAJRRRQAUUUlABRRRQAlFFJTAWk\r\noooEFFFJQAUUUUAFFFFABRRRQAUUUUCCkoopiCiiigBaWkpQKQxKSlNGKYCUUUtABRRRSGFLQKKB\r\nhRRRQA5KkqJTzUgoELRRRSAYaYakamGmMchp5qJTg1L2oEITQDTWpM0gJM0ZpgNFACseKiNPPSmU\r\n0JiilpBS0CCiiigBDTacabTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACnCm04UALRRRSAWkbpS0jdKAG1Mo+UVDVhR8ooY0FKK\r\nMUtIBKDS0lMCMijbT8UuKQDNlG2pMUlADdtLilooAMUhFOpKAGEUmKfRSGMxS4p1FADMUbafiigB\r\nm2jbT6KAGhaXFLRQAmKaRTzTDQA00lKaTFMBKKKKYwpKWigBKKKKCRKKKKYC0UCikMWiiigYlLSU\r\nUCFopKWgAoopKAFopKWgApaSigY6ikopALRSUtAC0UlGaAFoozSZoAWikooAKKKSgYtFFFABS0lF\r\nAC0UmaM0CFpKKKACikooAKKKSmAUUUUCEooooAKKKKACiiigQUUUUDCiiigQUlLSUwCiiigQUUUU\r\nAKKUGkopDFNFJT05FAxlFKwwaSgApaSloAWkpaSgYUUUUAFSKeKjp6GgB9FFFIQjVGakNMNAxtSA\r\n8VHTlNMBWplPamgUCFAp2KBThSENYcVEambpUJpgKKWkFLQIKKKKAENNpxptMAooooAKKKKACiii\r\ngAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKcKbT\r\nhQAtFFFIBaRulFDUANqyv3R9KrVZX7ooGLRRS0AJRRRQAlLSUUgFpKM0maAFopM0UDFpaSigQUUU\r\nUDEooooAKWkopAFLSZooAWkoppNACk000hNFMAxSgUopRQBEwpKlccVFTGFFJS0AJRRRQISilpKY\r\ngpaSigBaKKKQwooooAKKKKACiiigAooooAWikpaACiiigYtFJRQAtFJRQAtFJRQAuaWm0UALRSUU\r\nALRSUUALmjNJRQAtJRRQAuaSiigAooooAKKKKBBSUUUAFFFFAgooooAKKKKACiiigAooooASiiim\r\nIKKKKACiiigBRSkUCnYpFDKcpwaSkoAc1JQaKACgUUUDFpKXNJQAUUoGaDQAlOU802gUATUUg6Ut\r\nIBKa1OpDQAw0lKaSmBIORSUIaDSEKDS5pmaUGgBWPFRGnk8Uw0xMUUtIKWgQUUUUAIabTjTaYBRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAU4U2nCgBaKKKQBSGlpDQAlWh0FVatDoKBhRRRQAUUtJQAhphNPNRtxSGLmjNMzS0AOzRm\r\nm0UAPzRuqPNJuoAk3UZqPNANFgJc0ZqPNLmgB2aN1MJpuaAJN1G6o80ZosFyQtTS1MzRTsFxc0oN\r\nNoBoESg0uajzS5pDHnmo260u6kNMBKKSloGJRRRQIKSlopiEopaSgBaKSloAKKKKBhRRRSAKKKKA\r\nCiiigAooooAKWkooAWikooAWikooAKKKKAClpKKAFopKKAFopKKAFopKKACiiigAooooAWkoooAK\r\nKKKACiiigQUUUUAFFFFABRRRQAUUUUAFJS0lABRRRTEFFFFABSikpRQMdilFHakpDEPWkoNFAC0l\r\nLSUALRSUtABRSUtACrQaSigYUUUtACqadmmCnUAOpDSZopANNJSmkpgKDSmm07tQAhpM0GkoEKTT\r\naWkoEOFLSCloEFFFFACGm0ppKYBRRRQAUUUUAFFLRQAlFLRQAlFLRQAUUUUgCiiigAooooAKKKKA\r\nEooopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFOFNpRQA6ikpaQBSGlpDQAlWh0qqKsjpTGLRRR\r\nSAWkoozQAVG1PJpjUhjKKMUuKACilxSYoAQ02lNJTQgpaQUtAxaKKWkA0im1KRTCKYhtFFFMQUUY\r\npQKQxMUYp+KMUXCwyin4pMUANozS4pMUAFFFFAwooooAKKKKACkpaSmIKKKKAFopKKAFopKKAFoo\r\nopAFFFFABRRRQAUUUUAFFFFABRRRQMKKKKACiiigAooooAKKKKACiiigAooooAKKKKBBRRRQAUUU\r\nUAFFFFABRRRQAUUUUAFFFFABRRRQAUlLSUxBRRRQAUUUUAFFFFAx60GkBopDA0lKaSgBaSlpKACl\r\npKKACnCm0tACkUlLmkoGFFFFABThTactAC0UtGKQDTSGn4pCKAGUopCKUUwA02nkZppFBIlJSmkp\r\niHCikFLSAKKKKAEpKWkpgFFFFABRRRQAtFFFIAooooAKKKKACiiigAooooAKKKKACiiigBKKKKYB\r\nRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSikpRQAtFFFIBaQ0tIaAEFWRVYdas0DQtFJS0AJRRRQA\r\nhpppxpKQxAKXFKKKAExQRS0UAMIphFSmmkUAMopSKSgBRSim04UAOppFPpDTEREUYpxFAoAQClpQ\r\nKWkMSiijNABSUZooAMUmKdSUAJikIp4oYcUwGUlFFABRRRQAUUUUwEooooEFFFFABRRRQAUUUUAF\r\nLSUUALRSUtABRSUUALRRRQAlFLRQAUUUUAFFFFABRRSUALRRSUALRSUUALRRRQAUUUUAFFFFABRR\r\nRQAUUUUgCiiigAoopKAFooooAKKKKACkpaSmIKKKKACiiigAooooGKKWkpaQwpKWkoAWkoooAKKK\r\nKACloooGFFFFABRRRQAtA60lFAEgpaap4p1ABTTTqQ0hDaMUZozQMdikNANITQIQ0ynE02mJiilp\r\nBS0CCiiigBKSlpKYBRRRQAUUUUALRRRSAKKKKACiiigAooooAKKKKACiiigAooooASiiimAUUUUA\r\nFFFFABRRRQAUUUUAFFFFABRRRQAUopKUUALRRRSAWkNLSGgBB1qzVYVNmhjQ7NGaYTSbqQyTNFMD\r\nUuaAHUlFFAC0UlFAC0UlGaACg0ZpKAEIpMU6koAbSig02gB+aM0zNGaYCmgUmaAaQD6KbmlzQAhp\r\nKCaSgBc0maSimA7NGaSigBwNDHim0GgBKKKKACiiigAooooASiiimIKKKKACilpKACiiigAooooA\r\nKKKKACiiigAooooAWikooAWikooAWikooAWiikoAWikooAKKKKAFopKKAFopKKAFopKKAFpKKKAF\r\npKKKACiiigAooooAKWkpaACiiikAUlLSUxBRRRQAUUUpoASlpKKBhS0lKKAFooopDCkoooAKKKKA\r\nFooooGFFFFABRRRQAUUUUAOU07NR07NADs0hNNooAKKSnCgBKQmlJppoEFJS0lMkUUtIKWgAooop\r\nAJSUtJTAKKKKACiiigBaKKKQBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACUUUUwCiiigAooooAKKK\r\nKACiiigAooooAKKKKAClFJSigBaKKKQBQaKQ0AFSVGKkxQxoQ02nEU00DFFOFMpwpAPFFJQKAFpa\r\nSigAooooAKKSloAKSlooAaaaaeaYaBDaKKKYBS0lFADs0maKKBhSUtJQIKKKKACiiloAKKKKBiUU\r\ntFACUUUUAFFFFMAooFLQAlFFJQIWkoooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigQUUUUAFFFFABRRRQAUUUUDCloopAFFFFABSUtJTAKKKKB\r\nBSmkooGFFFLQAlKKKKAFooopDEooooAKKKKAClpKWgYUUUUAFFFFABRRRQAUtJRQAtFFAoAWilpp\r\npAIaBRQKYARTae3SmUEiilpBS0xBRRRSASkpaSmAUUUUAFLSUtABRRRSAKKKKACiiigAooooAKKK\r\nKACiiigAooooASiiimAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUopKUUALRRRSAKQ0tIaAAdalq\r\nIdamoY0NNNNPNNNIBtOFJSimAopabmjNIY7NFNzRmgB9FNzRmgB1FNzS5oAWikzRmgANNNKTTCaA\r\nENFFApiFApcUq07FAxmKMU/FGKAI8UVJikKUAR0op22lAoAQLShKXNJuoACAKbSmkoKA02lpKBMK\r\nKKKYgFLSUUAFFFFAhKKKWgBKKWkoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKBBRRRQAUUUU\r\nAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQMKWiikAUUUUAFFFFABRRRQAlFFFMAoopa\r\nAEpaKKACiiigBaKBRikUFJS0lAgooooAKWkooAWiiigYUUUUAFFFFABRRRQA4UUgpaAFppp1IaAG\r\n0UUtAA3SmU89KZTJYopaQUtAgooopAJSUtJTAKKKKAClpKWgAooopAFFFFABRRRQAUUUUAFFFFAB\r\nRRRQAUUUUAJRRRTAKKKKACiiigAooooAKKKKACiiigAooooAKUUlKKAFooopAFIaWkNAAOoqaoR1\r\nqWgaCmmlpDQAlFFLSASkp1JTASilpKADNGaMUoFAwzS0AU4CkAlGKdiigBpFNIqSmmgCOgCnEUAU\r\nxCinCkopDHUUzNLmgY+mk0hNNJpjHZozTQaWgAJzQBQKXFMBKSnEUAZpANIpKkxTStMQ2kNLQaBD\r\naKWigQlFFFABS0lFAC0lFFABRRS0AJRRRQAUUUUCCiiigYUUUUAFFFFABRRRQIKKKKBhRRRQAUUU\r\nUCCiiigAooooAKKKKACiiigAooooAKKKKBhRRRQAUtJRQAtFFFIAooooAKKKKACkpaKAEpRSUopg\r\nBooNFIAooooGKKWm08UDEpDTqaaAEooooEFFFFAC0UUUDCiiigAooooGFFFLQIQU+m0ooAWkoopA\r\nJRQaSmMCabTjTaZDFFLSCloEFFFFIBKSlpKYBRRRQAUtJS0AFFFFIAooooAKKKKACiiigAooooAK\r\nKKKACiiigBKKKKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSikpRQAtFFFIApDS0hoAB1qTNRCn\r\nUDQ7NJmkooAWikooAWikooAKUCilAoGKBRilFLSATFLSUtAC0UmaKACkNFIaACikpQaACg0tJTGJ\r\nRRRigYlJTsUpFADRQRTlFDntQA0Gn5xUdOBpiHMaaDQTmigY7NNJopKAENFLSUgEooopkhSUUtAh\r\nKKWigBKKWkoAKWkpaACiikoAWkopaAEopaSgAooooAKKKKACiiloASiiigAooooAKKKKACiiigAo\r\noooAKKKKBBRRRQAUUUUAFFFFAwooooAWikpaACiiikAUUUUAFFFFABRRRQAlKKSlpgLSUUUhhRRR\r\nQAU4Gm0ooAWkNLSGgYUlFFAgooooAKWkooAWikpaBhRRRQAUUUUALQKSloAWigUtIBppKcabTAQ0\r\nlKaSmSxRS0CigQUUUUgEpKWkpgFFFFABS0lLQAUUUUgCiiigAooooAKKKKACiiigAooooAKKKKAE\r\nooopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFKKSloAWikpaACkNLSGgBBTqaOtPpDCjFFFIBKK\r\nWkpgFKKSlFAxcUtApaQBRmikoAKWiigBaKKSgApppTTSaADNApKcBTGLRRRQMKKKSgYuaSg0CgBw\r\n4FMPWgmgUCFxxSU7NNoAKKUCigAoopKAFpDRS0wG0lKaMUCY2lpKKCRaKKKACiiigAxS4oozQMSi\r\niigAooooAKKKKBBSUtFACUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUtJRQAtJS0UAJRS4pKACiii\r\ngAoopaAEoopaACiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUwCgUUUALRRRSKEooooJCi\r\niimAUUUUhhS0lFAxaKKKAAUppKWgBKWkooAdS00UtIBaaaWkNMBDTaU0lMli0tJS0CCiiikAlJS0\r\nlMAooooAKWkpaACiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAlFFFMAooooAKKKKACiiigAoo\r\nooAKKKKACiiigApaKKACiiigBaQ0UUAA60+iikxoKMUUUhhSUUUAJSiiimA4UtFFIAooooAKWiig\r\nAppoooAQ0lFFAxQKWiimMKSiigYUmaKKACjtRRQISloooAWjFFFAxaSiigQUGiigBKXNFFACUCii\r\nmA00lFFBDCiiigApaKKACiiigYUUUUAFFFFIAooopgFFFFABSUUUCCiiigAooooAKWiigBKKKKAC\r\niiigAooooAKWiigAooooAKKKKAEooooAWiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAF\r\nJRRTAKKKKAFpaKKBiGiiikAUUUUxBRRRSGFFFFABS0UUDCgUUUABooooAKWiigAooooAaaSiimSx\r\naWiigQUUUUAJSUUUAFFFFABS0UUAFFFFIAooooAKKKKACiiigAooooAKKKKACiiigD//2Q==', 'asha1', '2015-07-14 18:21:44', 'asha1', '2016-09-12 18:21:44', 'wasqfrtgyhug'),
('asha1053', '41001', 8, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Suman', 'Sudas', 'Jadav', '1987-09-12', 29, 'Marathi', 'Akola', 'Literate', 0, 'Married', 4294967295, 'Akola market gali', '', 4294967295, '12', '', 'asha1', '2016-10-05 11:08:09', 'asha1', '2015-08-19 11:08:09', 'qawsqawsedrf'),
('asha11', '41001', 3, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Kamla', 'Vijay', 'Mala', '1986-11-19', 30, 'Marathi', 'Pune', 'Illiterate', 0, 'Married', 4294967295, 'Ghfhgfgd dga daf fff', '', 4294967295, 'null', '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAKBueIx4ZKCMgoy0qqC+8P//8Nzc8P//////////////\n////////////////////////////////////////////2wBDAaq0tPDS8P//////////////////\n////////////////////////////////////////////////////////////wAARCADwAUADASIA\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwBKbJ2p\n2R6imvzjHNADKKXB9DRg+hoASnx96bg+hpycZzxQA6ijI9RRkeooAKbJ2p2R6imvzjHNADKKXB9D\nRg+hoASnx96bg+hpycZzxQA6ijI9RRkeooAKbJ2p2R6imvzjHNADKKXB9DRg+hoASnx96bg+hpyc\nZzxQA6ijI9RRkeooAKbJ2p2R6imvzjHNADKKXB9DRg+hoASnx96bg+hpycZzxQA6ijI9RRkeooAK\nbJ2p2R6imvzjHNADKKXB9DRg+hoASnx96bg+hpycZzxQA6ijI9RRkeooAip8femU+PvQA6iiigAp\nsnanU2TtQAyiiigAp8femU+PvQA6iiigApsnanU2TtQAyiiigAp8femU+PvQA6iiigApsnanU2Tt\nQAyiiigAp8femU+PvQA6iiigApsnanU2TtQAyiiigAp8femU+PvQA6iiigApsnanU2TtQAyiiigA\np8femYNPTjOaAHUUZFGRQAU2TtTsimvzjFADKKMGjBoAKfH3pmDT04zmgB1FGRRkUAFNk7U7Ipr8\n4xQAyijBowaACnx96Zg09OM5oAdRRkUZFABTZO1OyKa/OMUAMoowaMGgAp8femYNPTjOaAHUUZFG\nRQAU2TtTsimvzjFADKKMGjBoAKfH3pmDT04zmgB1FGRRkUAFNk7U7Ipr84xQAyijBowaAJabJ2p1\nNk7UAMooooAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKfH3plPj70AOooooAKbJ2p1Nk7UAMoo\nooAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKfH3p\nlPj70AOooooAKbJ2p1Nk7UAMooooAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKfH3plPj70AOo\noooAKbJ2p1Nk7UAMooooAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKfH3plPj70AOooooAKbJ2\np1Nk7UAMooooAKfH3plPj70AOooooAip8femU+PvQA6iiigApsnanU2TtQAyiiigAp8femU+PvQA\n6iiigAooopMTCiiikSFFFFABRRRQAUUUUAFRnqakqM9TTQ0JT4+9Mp8femUOooooAKbJ2p1Nk7UA\nMooooAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKf\nH3plPj70AOooooAKKKKTEwooopEhRRRQAUUUUAFFFFABUZ6mpKjPU00NCU+PvTKfH3plDqKKKACm\nydqdTZO1ADKKKKACnx96ZT4+9ADqKKKACmydqdTZO1ADKKKKAJcCmvxjFOpsnagBmTRk0UUAGTT0\n5zmmU+PvQA7AowKKKADApr8YxTqbJ2oAZk0ZNFFABk1IOgqOpB0FJiYtFFFIkKKKKACiiigAoooo\nAKMUUU0NBgU1+MYp1Nk7UyhmTRk0UUAGTT05zmmU+PvQA7AowKKKADApr8YxTqbJ2oAZk0ZNFFAB\nk09Oc5plPj70AOwKMCiigApsnanU2TtQAyiiigAp8femU+PvQA6iiigApsnanU2TtQAyiiigAqQd\nBUdSDoKTExaKKKRIUUUUAFFFFABRRRQAUUUU0NBTZO1OpsnamUMooooAKfH3plPj70AOooooAKbJ\n2p1Nk7UAMooooAKfH3plPj70AOooooAjyfU05Oc55plPj70AOwPQUYHoKKKADA9BTX4xjinU2TtQ\nA3J9TRk+ppKKAFyfU05Oc55plPj70AOwPQUYHoKKKADA9BRRRSYmFFFFIkKKKKACiiigAooooAKj\nJOTyakqM9TTQ0GT6mnJznPNMp8femUOwPQUYHoKKKADA9BTX4xjinU2TtQA3J9TRk+ppKKAFyfU0\n5Oc55plPj70AOwPQUYHoKKKADA9BTX4xjinU2TtQA3J9TRk+ppKKACnx96ZT4+9ADqKKKACmydqd\nTZO1ADKKKKACnx96ZT4+9ADqKKKACmydqdTZO1ADKKKKACnx96ZT4+9ADqKKKACmydqdTZO1ADKK\nKKACnx96ZT4+9ADqKKKACmydqdTZO1ADKKKKACnx96ZT4+9ADqKKKACmydqdTZO1ADKKKKAJNo9K\nRvlxjinU2TtQA3cfWjcfWkooAXcfWnL82c80ynx96AF2j0o2j0paKAE2j0pG+XGOKdTZO1ADdx9a\nNx9aSigBdx9acvzZzzTKfH3oAXaPSjaPSlooATaPSkb5cY4p1Nk7UAN3H1o3H1pKKAF3H1py/NnP\nNMp8fegBdo9KNo9KWigBNo9KRvlxjinU2TtQA3cfWjcfWkooAXcfWnL82c80ynx96AF2j0o2j0pa\nKAE2j0pG+XGOKdTZO1ADdx9aNx9aSigBdx9acvzZzzTKfH3oAXaPSjaPSlooAKbJ2p1Nk7UAMooo\noAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKfH3pl\nPj70AOooooAKbJ2p1Nk7UAMooooAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKfH3plPj70AOoo\nooAj3H1py/N15plPj70ALtHpRtHpS0UAJtHpSN8vTinU2TtQA3cfWjcfWkooAXcfWnL83XmmU+Pv\nQAu0elG0elLRQAm0elI3y9OKdTZO1ADdx9aNx9aSigBdx9acvzdeaZT4+9AC7R6UbR6UtFACbR6U\njfL04p1Nk7UAN3H1o3H1pKKAF3H1py/N15plPj70ALtHpRtHpS0UAJtHpSN8vTinU2TtQA3cfWjc\nfWkooAXcfWnL83XmmU+PvQAu0elG0elLRQAm0elI3y9OKdTZO1ADdx9aNx9aSigAp8femU+PvQA6\niiigApsnanU2TtQAyiiigAp8femU+PvQA6iiigApsnanU2TtQAyiiigAp8femU+PvQA6iiigApsn\nanU2TtQAyiiigAp8femU+PvQA6iiigApsnanU2TtQAyiiigAp8femU+PvQA6iiigApsnanU2TtQA\nyiiigD//2Q==', 'asha1', '2015-11-11 18:08:56', 'asha1', '2016-11-11 18:08:56', '785412369856'),
('asha1111', '41001', 2, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Suman', 'Sudas', 'Jadav', '1987-09-12', 29, 'Marathi', 'Akola', 'Literate', 0, 'Married', 4294967295, 'Akola market gali', '', 4294967295, '12', '', 'asha1', '2016-10-05 11:08:09', 'asha1', '2016-10-05 11:08:09', 'qawsqawsedrf');
INSERT INTO `hm_patient` (`Patient_id`, `PinCode`, `Village_id`, `City_id`, `District_id`, `State_ID`, `Country_ID`, `Card_Type_id`, `Gender_Id`, `Cast_Category_Id`, `Patient_Salutation`, `Patient_FName`, `Patient_MName`, `Patient_LName`, `Patient_DOB`, `Patient_Age`, `Patient_Language`, `Patient_POB`, `Education`, `Patient_BPL`, `Patient_Marital_Status`, `Patient_Contact`, `Address_line1`, `Address_line2`, `Patient_Emergency_number`, `Patient_Ward`, `Patient_Image`, `Created_By`, `Created_Date`, `Updated_By`, `Updated_Date`, `Card_Number`) VALUES
('asha1231', '41001', 2, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Kantabai', 'Ramdas', 'Tawde', '1989-09-08', 27, 'Marathi', 'Kolhapur', 'Literate', 0, 'Married', 4294967295, 'Kolhapur main road', '', 1478523695, '12', '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAKBueIx4ZKCMgoy0qqC+8P//8Nzc8P//////////////\r\n////////////////////////////////////////////2wBDAaq0tPDS8P//////////////////\r\n////////////////////////////////////////////////////////////wAARCAPIBRADASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwCGiiig\r\nAooooAKKKKACiiigAooooAenWphUCdanFIYtFFFIQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUU\r\nUAFFFFABRRRQAUUUUAFFFFMBaKSigBaKSigBaSiikAUlFFAwoopKACiiigAooooAKKKKACiiigAo\r\nopcUAJS0uKXFFgGUU/FMNOwBQacDQaLAIBTsUgNLmnYQYoxS5ooAQimEYqSmtQA0Cg8U5aGGaVgG\r\n0UqinYosAyinYpCKLDEooopAFFFFABRRRQAUUUUALRmkooAXNFJS0ALSUUtACUlLSGgQUlFFABRR\r\nRTAKKKWgAooooAKKKKACiiigAoopaQCUUtFMBKKWkoAKKKWgAooopAFJS0UwEpKWkoASkpaSgBKK\r\nKKYBS0UUAFFFFABRRRQAUUlLQAVGetSVGetACUUUUAFFFFAC0lFFABS0lFABRRRQAUUUtACUUUUA\r\nFFFFABRS0lABS0lLQAUlLRQAlLRRQAUUUUAJS0lLQAlLRRQAUUUUAJRRRQAUUUUAFFFFABRRRQAU\r\nUUUAOXrUwqFetTCpGLRRRQIKKKKACiiigBaKSigBaKSigBaKSigBaKSigBaKSigBaKSloAKKKKAC\r\niiigAooooAKKSloAKKKSgAooooGFFFJQAUUUUAFFFFABRRRQAUUUUAFFKBQRTsAAU7FNFLmmIWjN\r\nJmmmgB2aa1JzQTQMAaM0A0uKAEFKTSdKMZNADhS5xSDpSE0CFzR1popQKQxRS0lLmmIBThTaTNAD\r\n6SgGigAIqM8GpaawoAYKWnAcU1hilYYUUUUgCiiigAooooAKKKKAFopKWgAooooATFJTqSgQlLRR\r\nTAKKKWgBKWiigAooooAKKKKACiiikAUUUUwCiiigAopKKAFopKKAFpKKKACkopKACkoooASlpKWm\r\nAUtJS0AFFFLQAlJTqSgBKKKKACoz1qTtUZ60AFJS0lABRRRQAtJS0lABRRRQAUtJRQAUUUUAFFFL\r\nQAlLSUUAFLRSUALRRRQAUUUUAJRS0UAFFFFABSUUtABRRRQAUUUUAJRRRQAUUUUAFFFFABRRRQAU\r\nUUUAOXrUoqJetSikwFooopAFFFFABRRRQAtFJRQAtFJRQAtFJRQAtFJRQAtFJRQAtFJRQAtFJRQA\r\ntFJRQAtFJRQAtFFFABRRRQMKSiigAooooAKSiigAooooAWiinAUAIBSEU8UhqrCEBpTSUUAJS0UY\r\noGJmlzRikpABoopM0AIRRmnDmkIoAQc0/FNFLmmAE0hpM0GkA5aXNNHSmk80wH5pai5pQ1AD6TNG\r\n7NKRQAgNOzTKdSAduppbmikIpiHKaU81GOKeDmgBwFGKQU6gBmKKfSEUrAMopTSUhhRRRQAUUUUA\r\nLRSUtABRRRQAlFLSUCClpKKAFooooAKKSimAtFJRQAtFJRQAtFJRQAUUUUAFJRRQAUUUUAFFFJQA\r\nUlLSUAFJS0lMApaKKAClpKWgBaKKKACiiigBKKWkoAQ9KjPWpDUZ60AFJS0lABRRS0AFFFJQAUUU\r\ntABRRRQAUUUUAJS0UUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAJRRRQAUUU\r\nUAFFFFABRRRQAUUUUAKvWpRUQ61KKTAWiiikAUUUUAFFFFAC0UlFAC0UlFAC0UlFAC0UlFAC0UlF\r\nAC0lFFAC0UlFAC0UlFAC0tIKWgYUUUlABRRRQAUUUlAC0lFFABRRRQAUopKcooAUClpaSqEFITSm\r\nm0AJS0lKKBhRRmlzQA3NLmg03FADgKRhSA4p3WgBgOKdwaQik6UAOxSYpN1LuoASg0E0CkAo6U0D\r\nJpSeKBTAXApMUhNANABilBxQDSkZoAXg0YpnIpc0AOxRmkBoNACmm9DSg0jUASDpS5xTEanUCFoF\r\nJS0AI/SmCnv0pFHFACUUHg0VIwooooAKKKKAFopKKAFooooASilpKBBRRSUwFopKKAFopKKAFopK\r\nKAFopKKACiiigAooooAKKKKACkpaKAEpKWigBKKKKYBRRS0AFFFFAC0UUUALSUtJQAUlLSUABqI9\r\nakNRmgApKWkoAWkpaKACikpaACiiigBKKWigApKWigAooooAKKKKACiiigAooooAKKKKACiiigAo\r\noooAKKKKACiiigAooooASiiigAooooAKKKKACiiigAooooAUdakFRipBSYC0UUUgCiiigAooooAK\r\nKKKACikooAWikooAWikpaACiiigAooooAKKKKACnCminigApKWkoGFFFFABRRRQAUlLSUAFFFFAB\r\nRQaQdaAHYpRxSjpSGqELmlpopTQAUUUlAxaSiloAQUuKaOtPPSgCM04Cmnk08DigGJikIxT8UYoE\r\nMzQRQVpM4oGIRQBRmgGkAYpKfwaTFMBtLnikNFAB1NKRQKRjQAUqmkBzQRigCTANIQBTQ1BOaAsK\r\naQGikoGLSkZFApaBDOlPBoxSDigB9ITilFBGRQIZuyaeKiIxTkNAxSMtRilHWnYoEMopSKSpGFFF\r\nFABRRRQAUtJRQAtJS0hoASiiimAUUUUCCiiigAooooAKKKKACiiigAopaKACiiigApKKKAEooooA\r\nKKKKYBRRRQAUtFFABRRRQAUUUUAFJS0lACGo6kPSo6ACiiigBKWiigBKWkpaACiiigBKWiigAooo\r\noAKKKKACkpaKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooASiiigAooooAKKKKACiii\r\ngAooooAUU8UwU8UmAtFFFIAooooAKKKKACiiigAooooAKKSigBaKSigBaKSloAKKKKACiiigBwp4\r\npq06mMDTadSGgQlFFFIYUlLSUAFFFFAC0UlOAoAUCkK04UjdKoQ3NGc03mlAoGPFBpKSgB1JRRQA\r\nUUmaUEUAAFKTRmmnmgAHWnimgU6gGFGaQmmk0CH9aawoBpTQBFSU8ik20ihAaM07FIaYhBThim5o\r\nFIBx6Uw08UEZpiIwcU/qKaVpAcUDH4oxQGpC1ADqQimE04HNACg4p4OaYaBQA8im0ueKQdaAFU0+\r\no+hp9AhrjiowcGpG6VFQNEoNPFRIalFAgPNNIp1IwoYDaKKKkYUUlLQAUUUUAFFFJQAUUUUwCiii\r\ngQUUUUAFFFFABRRRQAUUUUALRSUUALSUUUAFFFJQAUUUUAFFJS0wCiiloAKKKKACiiigAooooAKK\r\nKKAEPSoqlPSoqACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigBKKKKACiiigAooooAKKKKACiiigBRThTacKTAWlpKKQC0UlLQAUUU\r\nlABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0opKcKBiilpKUGgBaSilFMQ2ilNJSGFJRRQAUUUUA\r\nKKdSKKfTQhKQ80tGKYCAUUE00mgANGaaWphagZIWppamZpKAHlqTdTaKAH7qUNTKKAJ1Ip2agBpw\r\negQ4mkzSE5ptIZJS01acKAENJmnGmgUAIaQmnkU0igBAM08CkUc040IQUlGaQNTAUim7afkUEUAR\r\nEEU2psZpClA7kWKcop4WlxQFxppRSN1ozxQAZpRTaUUgBuuadmhulNWmIVulNC5pxFKBigBu2nA0\r\ntLigBTR2oFLQBF3paMZNB4pMYUUUUgEpaSloAKSikoAWlpBS0AJRS0lABRRRTEFFFFABRRRQAUUU\r\nUAFFFFABRRRQAUlFFABSUUUwClpKKAFooooAWiiigAooooAKWiigAopaKAGt0qE9anbpUB60AFFF\r\nFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFFFFACUUUUAFFFFABRRRQAUUUUAFFFFACinCm04UgFooopAFFFFAC0UUUwEopaKAEopaKAEopaK\r\nAEooooAKKKWgBKKWigAFOFIKdSGFFJS0AKKKSlpgFIafTTQIbRRRSGFJRTgM0wHKeKXNMHFOpiCl\r\n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\r\ng0UgG0hpTTaAFFBFFGeKAAUoPNIOtB4oAG60p+7TRyaVjTAQdalB4qIVIvSgB4FIwpVNKaBEdFKa\r\nSpGJRRRQAUtJRQAtLSUtACUUtJTEFFFFABRRRQAUlLRQAlFFFACUUtFMApaKKAClopaACiiigApa\r\nKKACiiigAopKKAEfpUFTP0qGgAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoo\r\nooAKKKKACiiigAooooAKKKKACiiigAooooASiiigAooooAKKKKACiiigAooooAUVKtRCpV6UhjqK\r\nKKYBRRRQIKKKKBiUUtFABRRRSAKKKKACkpaKAEopaKBCGmmnGmGkMKcKbThQAtJS02gBRS0gpaAC\r\nmmlpQM0ACmnUFcUlUIKKDRQMKjapKjegBtJRRQAtFFFABRRRQAUtJRSAWiiigAoopaACiiigAooo\r\noAKKKKAClpKKYC0UUUAFFJRQAtJRRSAKSlpKACkpaSgAooopgFFJRQAtLSUUALRRRQA8UtNWnUAN\r\nxk0EYNOHWkegBD0ptO7U2gBVpGpR0pKQCrSHrQKDTASnoaZSqKAJwKWo1bnFPoEDCmVIeRUZpMBK\r\nKKKQwooooAKWkpaAFpKWigBKKKWmISiiigAooooASiiigAoopaYBS0lLQAtFFFABS0UUAFFFFABR\r\nRRQAlFFFADX6VDUz9KhoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKAEooooAKKKKACiiigAooooAKKKKAFFTL0qEdanXpSGLRS0U\r\nxCUUtFACUUtJQAUUUUAFFFFABRRRQAUUUUAFFFBoAYaaacaaakYCnCminCgANJSmkoAUUtIKWgBK\r\neopg61IKaAU0ynU2mIKKSloGFMapO1RNQA2iiigAooooAKKKKACiiikAtFFFABRRRQAtFJS0AFFF\r\nJQAtFFFABRRRQAUUUUAFFFFABRRSUAFFFFACUUUUAFFFFMBKKKKACiiigBaKSloAenWn1EvWpTQA\r\nnQ0OOKDSn7tADBTTTwKbQADpSCgGikAnenHpSd6eRxTAjFLnFHSgDJoAAeanU5FM28UoOKAJO1Rk\r\nUpal6igQykpTSVIwooooAKKKKAFpaSloAKKKSmIKKKKACiiigBKKKKAFooopgLS0lLQAUtJS0AFF\r\nFFABRS0UAJRS0lABRRRQAx+lQ1O/SoKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK\r\nKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBKKKKACiiigAooooAKKKKACiiigBR1qdelQ\r\nCp16UhjqKKKYgooooAKKKKACkpaKAEopaKACiiigAooooAKQ0tNagBppppTSUhgKcKaKdSAQ0UGi\r\ngBRRQKDQAo60/FRr1qUU0AlJTjTRTEJSijvSigYhqJqlbpUTUANooooAKKKKACiiigApaSlpAFFF\r\nFABS0UUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFJRRQAUUUUAJRS0lABRRRQAlFFFMAooooAKK\r\nKKAFHWpKjFSLSAXHFL/DSseKZ2pgIKKO9LjigBneg0d6U0gG0u6gigLTASnoKULikJxQApNNpM0o\r\nNIA5zUq9Kb1FC9KYCkU2pOophFJiEooopDCiiigBaKSloAWkpaKYCUUtJQIKKKKAEopaKYBRRRQA\r\ntLSUtABS0lFAC0UUUAFLSUUALSUUUAFFFFADZOlQVPJ0qCgAooooAKKKKACiiigAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooASiiigAooooAKKKKACii\r\nigAooooAUVMvSoRUy0hj6KSlpiCikooAWikooAKKKKAFopKKAFooooAKKKKACmNT6Y1AxtIaKKQA\r\nKWkFLSAKSlooAUUGijvQAnSpA1AGRSYqhC0nQ0tBoGFKKbSigBW6VC1THpUTdaBIZRRRSGFFFFMA\r\noopaQBRRS0AFFFFABRRRQAUUUUAFFLRQAlFLSUAFFFFABRRRQAUUUUAFFFFACUUtFACUUtJQAlFL\r\nSUAFJS0UwEopaSgAooooAKkWo6kTpSAXmnY4pQKU9KYXIj1px6Uhpe1ADB1oajvSnmgAWlyBTOlF\r\nIBSabTscUgHNACgUuKUYHWncEUwEWgdaQcGlNAD1pGFCmnHpQIiopTSVIwooooAKWkooAWlpKWgA\r\nooopiEopaKAEooopgFLRRQAUtFFABRRRQAUtJRQAtFFFABRRRQAUUUUANk6VBU8nSoKACiiigAoo\r\nooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiii\r\ngBKKKKACiiigAooooAKKKKACiiigBalWoqlWkMfRSUtMQUUUUAFFFFABRS0UAJRS0UAFFFFABRRR\r\nQAlNanGmGkwGmkpTTaBiinU0U6kAlKKSlFAC0hFOpwFADVJp1BGKbmqELSmminUDEoopRQAdqjap\r\ne1RtQIZSU7FJQMSilxRSAKKKWgAoopaACiiimAUUUUAFFFFABRRRQAUUUUAJRRS0gEooooAKWiig\r\nAooooAKSlooASilpKAEopaSgBKKWkoAKSlpKYBRRRQAU+M80ylU4NAFilqMNxTgaBCMKaKe3SmDg\r\n0DEIpAae3SmGgBTSAc0lGaQCtSqMUgFDHtTARmpVbmm4ooAkNAPFAORSHigBc4NSjkVCKkQ0gBhT\r\nKlPSozQxCUUUUhhRRRQAtAoooAdRSCnUxCUUtJTASilooASilooAKKKKACiiloASilooASilooAK\r\nKKWgBKWiigBknSoKnk6VBQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAJRRRQAUUUUAFFFFABRRRQAUUUUALUqdKiqZOlIY6ilop\r\niEopaKACiiloASloooAKKKKACkpaKAEopaSgBDTDTzTDSYDaSlpDSGKKWkFLQAlKKSlFADxTxTFp\r\nxpoQGoz1qSmsOaYABS03NLQMU0CkoBoAeelRN1qTORTHFAhlFFFAwopKKAFoopaQBRRRTAWikpaA\r\nCiiigApKKKACiiigAooooAKKKKACiiikAUUUUAFFFLQAlFLSUAFFFFABSUtFACUlOpKAG0UuKSgB\r\nKKWkpgFFFFADlNSUxRxTx0pAO7UxuDTu1NNMBuaUc0lKppAIaSnEU0imApNIKAOaU0AHFIRSU88i\r\ngBFNK1NHBp56UAIKXpSCndaQC7+1Bphp68igBtFKaSkAUUUUAFLSUtACinCmU4UALRS0VQhKSnUl\r\nACUUtFACUtFFABRS0UAJRS0UAFFFLQAlLRRQAUUUUARydKgqeTpUBoAKKKKACiiigAooooAKKKKA\r\nCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAEooooAKKKKAC\r\niiigAooooAKWkooAWp06VBU6dKQx9FFFMQUUUUAFFFLQAlLRRQAUUUUAFJS0UAJRS0lACGozUh6V\r\nGaTAaaSnU00hiiloFFACUopKUUASLTsU1KfVIQ3pTSaVjTMc0DFApaM4ooAKKKBSAFpW6Uopr9KY\r\niM0maQmkoGLS02loAdRTc0uaQDqKTNGaAFopM0UALRSZooAWikooAWkoooAWikooAWikooAWikoo\r\nAWiiigAooooAKKKKAClpKKACiiigAooooAKTFLRQA2kpxptACUUUUwHKakHSohUq0gHdqZipD0qO\r\nmIQikxT85oxSGNzSHmnYoxTAZQKdijpSAaRTl5pDzQvWmAMMGnDkU16FbFACkUqmjOaTvQA40q0h\r\noHWkArCm1JjimGgQlFFFIYUtJRQAtKKSigCQUtNBp1MQlFLRTASilooASilooASloooAKKKKACii\r\nigAooooAKKKKAI5elQVPL0qCgAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoo\r\nooAKKKKACiiigAooooAKKKKACiiigAooooASiiigAooooAKKKKACiiigApaSigBanTpUFTJ0pDJK\r\nKKKYgooooAKKKKAFopKKAFopKKAFopKKAFopKKAA1GaeaYaTAbSGlNJigYoooopAJSikpwoAcDin\r\nZpMcUdKoQhooozQMTFLSg0GgBBS0CkJoELmmOadTHoAjooooAKKKKACjNFFAC5ozSUUALmjNJRQM\r\ndRmkopALRSUtAC0UlFAC0UlLQAUUmaM0ALRSUUALRRRQAUUUUAFFJRmgB1FNzRmgB1JSZozQAtFJ\r\nmkzQA7NGaTNGaAFpKM0ZoASkpaSmAVMlQ1JGeaQEpFIFp1FMQwrTM1KRTCKAG5oyacBijFAwPSoy\r\nakqNutAAOlKvWhelA60AOYZFRkVJuppNACL1p3emjrS96AHUo+9SUKfmpAS0xqeaQjimIjopTSVI\r\nwooooAWikpaAFFPFR08GmgHUUlFMQtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAEcvSoKnlqC\r\ngAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKA\r\nCiiigAooooASiiigAooooAKKKKACiiigAooooAWpU6VFUidKQyWikopiFopKWgBaKSigBaKSigBa\r\nKSigBaKSigBaKSigBaaRS5oPNAEdGKDwaAaQBSUtJSGJThTaetADhQaDwKQVQgpMU6jFAxKBSGlW\r\n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\r\n1NNACUlLSUwCiiigQUUUUAKKdTaWgBCKbTzTcUAJRS0UAJS0UUAFJS0UAJRRRQAUtJS0AKKeKjp6\r\n0hjjR2pCaTPFACqKUdaap5qXb3pgBpp6U+mMOaBDO9KaO9BoGIBS4oWhjQAo4pDSZpaQCU7NNpR0\r\noAeDS+5poOKaTmmA7fzTgc0wLTsYoAGHNNp55FMpAFAoopALRSUtABTgabSigB9FJRVCFopKKAFo\r\npKWgAoopKAFopKWgAopKWgCKWoqkl61HQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFA\r\nBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAJS0lFABRRS0AJRRRQAUUUUAFFFFAC09Ol\r\nMp6UhklFFFMQUUUUAJRS0lABRRS0DCiiigQUUtFACUUtFACU004000hjaWiikAlKKSlFAD1pW6Ui\r\n0ppoQxetSA0gWlPSmMQnmndRTOtN3EGgB5OKTNMLZoB4oCwvWigGjvQAvaom61MelQt1oASiiigQ\r\nUUUUAFFFFAwooooEFFFFABS0YpQKBhiilopAFFFLQAUtJS0ALRRRTASilooAaaSnGkpANpKdSGgB\r\nKKKKYBS02loAWikzS0AJRS0lABRRRQAlLRRQAUlLRQAlFFFAgooooAKcpxSUCgY7rTgnFInWnse1\r\nADAMGn7snFNxTgMUAOFNandBUbHmgQlJS9qBSGLnApnU0ppB1oAXbxRTj0ptAABmnngUgOKQnNAC\r\nU5V7mgDvQTQAE05TmmUo4NAx/SmmnjmmkUxDaKKKkAooooAWikpaAHA0U3NLmmA6im5opiHUU3NL\r\nmgBaKSkzQA6ikzRQAtFJmjNAEUnWmU5+tNoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACii\r\nigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAEpaSloASloooASilpKACiiigAooooAW\r\nnpTKctIZJS02lpgFGaSigQtFJRQMWikooAdRSUtABS0lFAhaKKKAENNNONIaQxtFFFIBKUUlKKAJ\r\nFpTSLTqpCEpCadUbHmgA3c0h5pKKBhikNOzgU2gAFOHWm4pVpDHt0qE9albpUR60xCUUUUAFFFLQ\r\nAlFLRQAlFLRSAKXFFKBQAYpaKKYBRRRSAKKKWgAoFFLQAUtFLTASilpKAENNpxpDSASkpaKYDcUl\r\nPpKAG0lOpKAEopaSgBaKSigBaKSigBaKSigBaKKMUgCilpKYCUtFFABRRS0gFU1IOaiFPU80AS4F\r\nGRSdaYTTEP61E33qXNNNA0KaQUdqSkMWk70tBoEL2pKB0paBgaVRmm08cCgQNxSCg8mlHAoAUAUh\r\nFISaUGgBRTjTaXrTAaaSnEU2kAUUUUgClpKKAFopKUUwCilopiEopaSgAooooAM0ZpKKBi5ozSUU\r\nCGP1ptK3WkoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA\r\nKKKKACiiigAooooAKKKKAEooooAWikooAKKWkoAKKKKACiiigAp602nLSGPooopiEooooGFFFFIA\r\npaSloAWlpKWmAUtFFAgooooAQ0hpxpppDG0UtJSASlFJS0APU0+mLTjxVIQhNJtzSZyacDigYwij\r\nFONITxQAxqAKKcBSAKBR3pcUADdKiNSN0qOmAUUUUgCloooAKKWigBKWiloASlopaYCUtFFABRRR\r\nSAKKKKAFpaSlFAC0UUUwCiiigBDSUtJQAlFLRQAlJS0UANxSYp9JigBlFOxSYpAJRilooATFGKXF\r\nLigBuKMU6igBKWjFFABSYpaKAEpKdSUAJS0lLQAUopKKAJVPFKRmowalByKYEbCm1KRxUfegEOC/\r\nLTDU2MLUR60AhKDSnimmkAo6UvahRxQaABRk040L0pD1oAVRQTRnApKACjpS9KSgBRyKAcUgpxxQ\r\nAucimmlFIaAEooopAJS0lLTGFKKSlFACilpBTqEISilopiG4oxTqMUANxRilxRigBuKMU7FGKAIG\r\n60lOfrTaACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACii\r\nigAooooAKKKKACiiigAooooAKKKKACkpaKACkpaKACkoooAWnJTaelIY+jFLRQAmKTFOoxQA3FGK\r\ndijFMBMUuKXFFIBKWilpiCiiigAooooAa1NpzU2kxhSGlptIAooooAepxSls0nam96YDxxTSaKSg\r\nY7tTDUi0MtMRGKWjFKopDFUc049KOBTS2aYhrdKZTmptABRRRSAWlpKWgApaKWgBKWiimAUUUUAF\r\nFFFIAooooAKWkpaAClFJSigBaKKKYBRRS0AJSUppKAEopaSgAooooASilooAbijFLRQA3FFOpKQC\r\nUUtFABRRRQAUUUUAFFFFMBKQ06kNIBtFLSUAFLSUtADhUiVEKepoAeelRr1qQ9KjHDUwRIelRd6l\r\nPSoj1oBCtTSKWikAKcUE5oxSUAPXpSGlXpSHrQAdqBQelAoAWkpRSHrQAuOKSndqb2oAUHigdaB0\r\npcYoAaaSnGm0DClpKWkAUtJS0CFpwplOFAC0UUtUIKKKKACiiigBKKWigCCTrTKfJ1plABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\r\nRQAlLRRQAUUUUAFFFFABRRRQAUUlLQAU9KZT0pDRKKKBS0AJRS0UAJRS0UAJS0lLTEFFFFABRRRQ\r\nAtFJRQAjU2nGm0mMQ02nGmGkAtKKaKUdaAJAOKTFKOlBOKoQmKQigHJpxPFAxoOKcXzTDRSGKTQD\r\nikxQaAAnNOVaaKkHSgTI3plPeo6YC0CilFIBaKKKAFpaSlpgFFFFABRRRQAUUUlIApaSloAKWkpR\r\nQAopaSlpgLRRRQAlLRRQAlJTqbQAUlLSUAFFJRQAtFJRQAtJS0lABRRRQAUlLRQAlFFFIAooooAK\r\nKKKACkNLRQA2kpTSUAFLSUUALSg4NJSd6AJwcimsOaWM8UpFMBm6igrScigYhpM06kxSAVTzTitM\r\n6U7PFAmOBxTTyaBQOtACmkpTSUAKtIetKKRqAFzxSUlL2oAUU6mCnDpQAEZFNp46U00wEoooqQCl\r\npKWgApRSUUAPopuaM0wHUU3NLmmIdRTc0tAC0tJS0AV5OtMp8nWmUAFFFFABRRRQAUUUUAFFFFAB\r\nRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABSUtJQAtJRRQAtPSmU5KQyUUtNFLmgBaKTNGaAFopM0ZoAWikopgLRSUUgFopKKAFopKKYCmm\r\n0tNNIANNNLSGkAlLTaKYEy0jUiGnGmA0cUE0hNIOaBj+tGQKTpSdaBC5zRjNOApcUAMxinjpSEUD\r\npQIjk60ynP1ptAxaUUlKKQC0tJS0AFLSUtMAoopKAFpKKKQBRRRQAUtJS0AFKKKUUAKKWiimAUUU\r\nUAFFFFABSGlpDQAlJS0UAJSUtJQAUUlLSAKWkooAKKKKACkoooAKKKKACiiigAooooAKKKSgANNp\r\n1NoAKKKKAFpKXtSUAPXipQcioAakVqYDyKaVp1FAiIjFKtPYVGOtAxD1p2OKaetPU5FIBBS0Y5pa\r\nACkopCKAFBpGoHWg0AAo7UCjtQAClBpBRQBItNamhsUuc0wDFJTyOKZSAKKKKQC0UUUAFFFLTASi\r\nlxS4piEpRRilFACilpKKAIJOtMp8nWmUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACUtJS0AFFFFABRRRQAUUUlABRRRQAtKtNp\r\nwpAPzS5ptLQMXNGaSigBc0uabRQA6ikooAWiiigApaSigBaKKKYBTTTqaaQCUhpaDSAYaKDRTAeB\r\nS5pENPNADCKBS0lMBetOVajHWpQaAFpCcU6mNQId1FIeKapwacx4oAhbrTaU9aSgYopaQUtIBaWk\r\npaAClpKKAFpKKKACkoooAWiilFABS0UUAFOFJRQA6im5pc0wFpKM0maAFzRmm0uaQDqDSZozTASi\r\nikNAChc0FKVTilLUARd6KD1opALRSUtABRRSUAFFFFMAooopAFFJRQAtFJS0AFFFJQAU2lNJQAUU\r\nUtAAaSlpKAClBptKKAJUanUzGBSg5FMBx6VH3qTtUbCgEKRxTelOU0pWgBu6l60mMU8YHWkMFWhi\r\nKC3pTaYhKKdikIpAAoahaG60AAoFKOlJ3oANpzUirjrSAigtmgAY02lNJigBKKKKQC0UlLQAUopK\r\nWgBwpcULS1QhMUUtFACUUtIaYiCTrTKc/Wm0hhRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFJQAU4\r\nU2nCgB1FFLSGJRS0UAFFFFABS0lLQAUtJRQAtFJS0AFLSUtABTTTqSgBMUGnCkNAEZpKcaaaAFWp\r\nAOKjU81IORQAGkxRQTxTAQ09DxUZpyUAPY0wmnnpUTUAhy80jZxSKcUO2aAGUUUUAKKcKaKWkAtL\r\nSUUALRRRQAUlFFABS0lLQACnAUgpaAFopM0maAFopM0maAHZozSZpM0AOzSZpM0ZoAWikzRmgB2a\r\nM03NLmgB1IaBS0wGjrS0uKDQAw0lKabSAWlptLQAtFFFABRRSUALRRSUAFFFFABRRRQAUUUUAIaS\r\nlpKAClpKWgBKKKSmAU9RTRTxxSAU0KeaSigB9DUgOad1FMCI8Gl3GnkUm2gBhNFOK0BaQxAKfjFK\r\nMCjGaYgpMU7FIaBDR1pDR3pSKQxBQaSnDmgBKUDmjHNKOKADGTT8DFIKQnmmAjCm088im0mAlFFF\r\nIBaWkpaAFFPqOng00IWiiimAUhpaD0oArP1ptOfrTaACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooASi\r\niigApwptOWgB9FFFIYUUUUAFFFFABS0lFAC0UlFAC0UlFADqKSigB1GM0gpwOKAEIIppp5amE0AN\r\nNNNPNNNACU9TUdKp5oAlpCKUGkNMBCKctNp69KABulRmnsaY1AISkNOFBFIBlFFFMBRTqQUUgFoo\r\nooAKKKSgBaKKUUAFLRRQAUmaWmmgBc0mabmkoAdmjNNpaAHZozSZooAXNGaSkoAXNFJRQAuaXNNz\r\nRmgB4NLmo80uaAJM0ZpoNLmgBDTacaSgBKKDRQAtLTaWgBaSiloASiiigAooooAKKKKACkoooAKS\r\niigApaKQ0AFJRRTABTs00UtIBwpTTRS0AC8GpAaZSg0ASdaTFJmk3UxDsCjbTd1JuoAfwKM5qMtR\r\nuNAyTpRTASaeKAGGndqRqTNIBDRml60EUDEzS9aSnDAoAd2pKTOTT+MUxCCkI5o6GlI4oAZRS0lS\r\nAUopKWgBaUGkoFAElFIDS1QgoPSig9KAK79aZTn602gAooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigApKWigAoopKAF\r\npKWigBKctNpy0APooopDClpKWgBKKWigBKKWigBKKWjFACUUtFACUUtJQAopaQU6kA00lKaSgApp\r\np1IaAG0lKaSmIepp1MWnigYYpw6UlOpgMNNPWnGkxk0AIKG6UpFIaQDKKDRTAcKKKKQC0UlFABRR\r\nSgUAKKWkFLQAtFFFMAppFOooAiIoxUhFNxQA2inYpMUgEopSKSgAooooAKKKSmAUUUUAFFLilC0A\r\nAp1AFLSASilopgNIptPpppAFFFFAC0UUUAFFFFABRRRQAUUUUAJRRRQAlFFLQAUhpaKAG0UuKMUA\r\nJS0q06gBBS0lLQAUUtFACGmZqSmlaYDaKdsNNoAM08YxTOtLikA4U7tSAUpoAQmko60YoAUU48im\r\nU4HFADcGgClJzSUAO6CgGkoxQMkPSk7ULyKO9MQ00lOIpKQBRSUtIApaSloAUGn1GKeKaAWkPSig\r\n9KYiu/Wm05utNoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoo\r\nooAKKKKACiiigAooooAKKKKAEpaKKACiiigAooooAKKKKACkpaSgApwptKKAH0tJRSGLRRRQAtFF\r\nFAC0UUUAFFFFABRRRQAUlLRQAoFGKUCnYoER4pKkOMVGaGMSkpaQ0gENNNPpppgIKkBpgp1ADqcK\r\nYKWmA4io84qUUxloAbnNFJjBpaQDDRSnrSUwFpaSikAtFFFAC0tJS0ALRRRQAtFFFMAooooASiii\r\ngBKKWkoASkNOpKQDaKWkoAKMUUtABijFLRQAUtJS0wFooooAKWkpaAENNNOooAZRSmm0gFooooAW\r\nikooAWikooAWkoooAKKKSgApaSloAKKKWgApAM0GgcUABGDTscZpM80uaACiiigBaKKKAEpwPFNN\r\nKDigAZuMVHTm5NCjvTAUDAoUZOaTrTgKQC9KaTTj0pnWgBQacMGmgUuMUAOxTcUA0u6gBMUYpd1K\r\nORQAg96U800mgdKAHKeaXPNNXrTmFMBTgimkUdDS0ANopaSpAKKKKAFpRSUCgB9B6UCg9KoRXbrT\r\nac3Wm0AFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFA\r\nBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUlFFABSikpRQA+iilpDEpaKKAFoopaACiiloAK\r\nKKKACiiigAooooAd0pN1FNouAE0lFFIBKDQaKAEpDS0lACU7NNopgOU06minA0wFpTyKSlHSkAxh\r\nTRTmpBzTAaaSlbrSUALS02lpALS0lLQAUtJRQAtLTaWgBaKSlpgFFFFABRRRQAUlLRigBKSnYpMU\r\nANopaKQCUtFGKACilopgFFFLQAUUUUAFFFFABRRRQAhphp9NNACUtJRSAWiiigAooooAKKKSgAoo\r\nooAKWkpaAFFFFFABRRRSAKKKKYC0UUUALRRRQAhpDSmkpAAp5GBTKeTkUwGqKeRTRT+1ADTg0BaX\r\ngUZpiDFBoBpTQAylApcUoFIYmB2paWkNMQxutAoagdKQxV61JxioqcDQApFFJRmmAGkpxptIAooo\r\npALRRRQA5TSnpTQacelUhFd+tNpW60lABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAF\r\nFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFJS0lABTh1ptO\r\nHWgB9FAopDClpKWgApaSloAKWkooAWiiigAooooAKUUlLQAGm0ppKQCUUUUAJRSmkoAQ0lKaSgAp\r\nKWkpgLmlBptKKAHg04U2jNACOKaDipDzTSKYDWptKaSgApaSlpALRRRQAtFJRQAtLSUUALRRRQAt\r\nFFLTASlozSZoAWikzSbqAHUhpN1GaACilozQAmKWkzRmkAtGKM0ZpgFFLRQAlFFFACUUUUAFFFJS\r\nAWkNFFADaKDRQAUtJS0AFFFFABSUtJQAUUUUAFKKKUUAFLRRQAUlLSUAFFFFAC0UUUALRRRQAUEU\r\no60rdKAGUoODSUUAOGM0FqbTSaYDi1Jkmm0A4pAPyRT1ORTOooBxQBJigmm76TOaYDs0tMFPFIBG\r\nHFNFPNRng0wHEUCk3UZpAOopAadimAdqTFLS0AMopSKSpAWkoooAWlJ+Wm0E8U0BE3WkoPWimIKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigApKWigApR1pKVaAHiigUtIYUUtFABRRS0AJS0UUAFFFFABRR\r\nRQAUtFFACUlLSUgEpaKSgAopQKCMUANNNNOpDQA0UtJSimAlKtFA4oAfSUmc08CgBBS4zRinCmIi\r\ndcUyppOlQ0AFLSUtIYUUUUAFFJRQA7NGabRmgB+aM0zNLmgB2aN1NpKAHZozSUUAFFFFABRmiimA\r\nuaTNJRQAuaM0lFAC5pQabRQA/dS7qjopASA0uajzRmgB9FN3UZoAWkozRQAtJRRQAhooNFABS0lF\r\nAC0UUUAFJRRQAUUUUALThSCloAKKKKACiiigBKWiigAoopaACiinAUANFDGnEU1lxQAlLTaWgBaT\r\nbS0UAIEFDJxSE4pd9ACDg80E0h5pKAClBoCk0EYpjJO1C0D7tApCHUxutPprCmAylFGKBSGL3qQc\r\n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\r\nAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB\r\nSr1pKVetIaJh0p1IKWgAooopiCkpaKBiUUtFAhKKWigAooopAJSUppKQxKKKKAEooooAWkNLSGgB\r\nKaadTTQMUUtNpRQIKQ06koAbRS0lMBaKKKQAOtOptJmmA/rUZpwpGFMBKKKKAFoopaQBRRRQAUUU\r\nUAFFFFACUUtJQAUlLRTASiiigAooooAKKKKAFooopAFLSUtABRRRQAUUUUAFFFLQAlFLRQAlFFFA\r\nBSUUUAFJS0lABThTacKAHilpop1AC0lFFMApaKKQBSUtJQAU4U2lBoAWkzRRQIKKKKBhTTTqQ0AM\r\npRSGlFIBaWkpaYBRRRQAUUUUAIaBS0hoAcTTS1KDSEUAJuoJ4pCKSgBRQaFGaCKBgDS00U6gQq9a\r\nU02loAKetR96k6CgANKOKQCgnmmAhPNI7ZWl601xxSAiooopiCiiigAooooAKKKKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAo\r\noooAKKKKAClXrSUq9aQ0TilpBS0AFFFLTAKKKKACiiigQUUUUDCkpaKQhppKU0lIYlGaDSUDEoop\r\nKAHUlApaAG0UtFAhtKKDSUAOooFFACYpMUuaTNMAooooAKCKM0UgAUvUU2lBpgNPWilakpiFpaQU\r\ntIYUtFFABSUtJQAUUUUAFJS0UAJRS0lABSUtJTAKKKKACiiloAKKKKQBS0lFAC0UUUAFFLRQAUUU\r\nUAFJS0lABRRSUAFFFFABSUtJTAKcKbThSAcKdTRS0ALRSUUALRRRQAUUUCgApQKWigQlFBNJQMWi\r\nkpaACkNFIaAGmlFIaBSAdS0lFMBaKSigBaKSigBaSiikAnSnDkUhoFMBcZph60/tTOpoBDoxQ/Wn\r\nDgVGxpgAopQPlpDSAUcmlNNU4NPJGKAEXrTiaRaGoAcOlJjmgHijNABTXPFLTHpgMooooEFFFFAB\r\nRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFKvWkpV60honHSlpFp1ABRRRTAKKKKACiiigAooooEFFFF\r\n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\r\nWiigAooopAIabTjTaAHClpBS0AFFFFADlFLjmgUE81QhaQmkzSUgCiiigYUUUlABSUtJQMKAaKKA\r\nH5FGKjpQ2KBD8UnFN3UhamA/ijNR5petIB24U2Q5oIxTTQAlFFFMQUUUUAFFFFABRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUU\r\nUAFFFFABRRRQAUq9aSgdaBosr0p1RhuKXNIB2aTNNzRmgAzSZoopAFJRRQAU4UlOFABRRRQAUlOx\r\nSgUwGc0lSEgVGTQISiiikMSilpKAFooooASilpKAEpKWkoAQ0lKaMUwEpwpKUUALRRS0gEooooAK\r\nKKKACiikoAKSlopgJSUtFACUlLRimISilpKACiiigApaSloAWigUGkMTNFFFMQUUUUDCiiigAooo\r\noAKKKKACiiigAooooAKWkpaACiiikAtFFFABRRRQAtFFFACE0ueKKQimIcDmnVGpxS7qAH0UgpaQ\r\nwpKWigBKKWigAooooAKKKKAGmm080ykA4UtIKWgApaAKUimAA0lOAoIpiG0UUUhhRRRQAUlLSUAF\r\nJS0lAwopaKBDSKbUlIRQAyinYpGxTASlWkAzTulIBeppJBinKKbJQIZRRRTAKKKKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAo\r\noooAKKKKACiiigAooooAKBRQKAJRS0i9KWpGJRS0lMAooooAKWiikAopaQUtACgUtJmkzTEKxpMm\r\nkJpKBi0lFFIBKKKKAEooooAWigUUAJRS0lABRilAzTjwKYERpRRjNBBFADT1ooFKaAAU6mCndqTA\r\nKKKKACiiigApKWigBKKKKAEopaSmAUlLRQAlFPUUMtMQykpxFJQAUUUUAKKMUClpDExSYp2KMUAN\r\nop2KMUANop2KQigBKKKKYBRRRQAUUUUAFFFFABS0lLQAUUUUgFooooAKKKKACiiigBaKKKAEPSkH\r\nWnUmcUxC7qeDUPepR0oAWiiikMKKWigAooooAKKKKAGtTKeaZQMcKWkFLSEPWlNNFKTTELmmk0lF\r\nAwooooAKKSigAooooASloooGFFFFAgoxS0UANNNIqQim0AIOBR1NBpVoAcKZJUneo5OtMQyiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACiiigAooooAlXpS01elOqRhRSUUAFFFFABSikpy0AOApeB\r\nSZpKYATmgCkpQaQCGkpTSUAFFFFACUlLSUAFFFBoAUUUgp4GaAGmkp7Ck25p2AFIFNZs07ZTSMUA\r\nANKSMUykoADSUtJQAU4Gm0ooAfRSClpAJRQaSgBaKKKAEooooAKKKKACiiloAF4p/amU5TTAaRTM\r\nVNimstMRHRS0lAwpRSUUALmlzTaKQDs0maMUYoAM0tJiigBKKWkpgFFFFABRRRQAUUUUAFLSUtAB\r\nRRRSAWiiigAooooAWkpaKAEooooAWkNLSUANpQaQ0oGaYh4NKDTcYooGSUUwGnA0gFpaSigAoooo\r\nAaaaacaaaAFFOApq1KOlADcUEU4UE0xDKKKKQxKKKKACiiigApKKKBi0UUUCClpKWkAUUUUwCkNL\r\nRQAw0q8UEUUAOzUbnJoJpppgFFFFAgooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiii\r\ngAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAkXpS0\r\nIuRTttIBtFLjFJQMKKKKQC04U2nUAFJS0lABRRRQAUUUlABSUtJQAUUUhoAKSijFAxRUq9KiHWpM\r\n8UxMQn5qdkVGaKAHM1MNFJQAUlLSUgEpKWkpgFLSUUAOBp1MFOFIANJS0UAFFFFACUUUUAFLSUtA\r\nBRRRQAUA0UUASKc0MOKjzinZJpiGkU0ipCKbimMaBSU6kIoABS8UlFIAzRRRQAUuaMZpDQAtJQKW\r\ngBtFKaSmAUUUUAFFFFABS0lLQAUUUUgFooooAKWkooAWiiigApKWigBKKKKAEp8ZAPNMp6pxTEKx\r\nyabQetFAwooopAOBpQaZRQBJSU3dSFqAHE0003NGaAHipAeKjAp3NAC5pM0UlAC0lFFABRRRQAUl\r\nFFABS0lFAC0UUUgCiiigBaKKKYBRRRQAU0in0lAEZFNp5FMNMAooooEFFFFABRRRQAUUUUAFFFFA\r\nBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAF\r\nFFFABRRRQAUUUUAFFFFAEqNxT91RLTqQxxOaSnDFBWmIZRTgtLtpWGNFOpMUtIBKDSE0UDDNKKaR\r\nSigQtJS0lABTaU0lAwzSUtJQAUUuKKBBThTaeDxQA2iiigBKSlpKACkpaSgBKKWkpgJRS0UAFKDT\r\naWgB1FIDSigYUUtJSEFJS0lABRRRQAtFFFABRRRQAU5SKbRQBISKaaaoJNSFeKoQwikPSnYpCKBj\r\nKUUYpQKQDTRQetLigBBQaXFIaAAUUA4ooAWkpc0hoASiiimAUUUUAFLSUtABRRRSAWiiigAooooA\r\nWiiigAooooAQ0lLSUAJUitxTAM04jFMQZopKWkMKKKKACkJpTTTQISiiimAtGKBTqAHKeKduFR0U\r\n7AOJoptLRYLi0UlLSsFwopKKLDCiiiiwXCiijNFguLRRRSsAUUUlAC0UlLQMWikpaBBRRRQAEVEw\r\nwalqN+tADaKKKYgooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACii\r\nigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAetOpq9KdSGKDTt1MpaAF\r\nzRuptFADs5ozSUYpAJSijFFAC0UlLQAUlJRQMKKKKBBSUtFACUUtJQAUopKUUALSUUUAJRRRQAlF\r\nFFACUlKaSmAUlLSUAFFFFACin0wU4GkAtFFFACUlOoxQAlJTitJQAlLSUUALRRRQAUUUUAOSpKiH\r\nWpBTQg60hFHenUwIyKTFPNIeKBkfenHpSHrSnpQAzPNKeRTaWgApKWgCkAUUEYpRzQMSkpxFJTEJ\r\nRRRQAUtFFABRRRSAKWiigAooooAWiiigApKWkoAKSilFMAXOaUnNPAGKYRzQIKKKKQwoopCaAEJp\r\nKKKYgoopwFAAKWiiqEFFFFABRRRQAtFJRQAtFJRQAUUUUAFFLRQAlLRRQAUUUUrDuFLSUtSMKKKS\r\ngBaKSigBaY3WnUxutACUUUUxBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRR\r\nQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA9elOpq06kM\r\nKKKKACiiikA4UUCigApKWkoAKKKKAEoxS0UAFFFJQAUUUUAFJS0YoASloooAWkoooAKKKbQAtIaW\r\nkNMBtFLiigBKKKKAEpaKKAClFJRQA6lpoNOpAFKvWkoBxQBI3SoqcSTTSKYhKKKKQxaKKKACiiig\r\nBacpplFAEtLTFan5GKoQ00ZzRTWGOaAHYpjmnBs0jDNAyMdacRxSYxQTxQA2nLSU5aQCNQtB5NOQ\r\ncUADdKZTzTSKYCUUUUAFFFFIAoopaACiiigAooooAWiiigApKKKAEpwGabT1bApgGcUlB5ooEFFF\r\nJSGFJQaSmIKKKdiiwCAU6koqhC0UlFAC5pCaSjFABmlpMUYoAXNGaMUmKAFzS02lzQA6im5pc0AL\r\nRTc0ZoAdRTc0ZoAdRTc0ZoAdRTc0uaAFopM0tIAooopWHccBmo361MOlQv1oAbRRRQAUUUUAFFFF\r\nABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAOWnZpopaQxc0ZpKWgBaKSlFADhRRRSAKSgmkzQMWikoo\r\nAWiiigQlFFFABSUtJQAtFFJmgAoopM0AOooFBoAQ0lFFAwooooEJRRRQAUlFFMAooooAKKKKAFpR\r\nTaUUAPxSquaF5FOGBQAYAFRnrTmbsKbQIbRS0lIYUUUUALRRRQAUtJRQAGnKCabTlOKYDgOKD0oL\r\n8UA5FMRFT05ppHNOTigYMtNI4qbrUZHNADKWhhigUgEqQdKYRSjpQMTvS03vThQIaRSU4ikoASlo\r\nooAKKKKACilooASilooASiiigAoooAzTAVRk0N7UpG0U2gQtFJRQMWmk0E0lAgpQKAKdTsISloop\r\ngFJS0UAJRS0UAJRS0lAgopaKBiUtFFACUUtFACUUUUAFFFFABSYpaKAExRilooATFFLRQAlLRRQA\r\noNLmm0tADs1G3WnZpp60gEooopDCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigB69KWkXp\r\nTqQxKKWkoASlFFAoGPpCaM0lIApMUtFACU4UlKKACiiigQlFFBNABSUUhoAKKKMUDCkpaMUAOHSg\r\n00UtACUUtFAgpKWkoAKSlooASiiimAlFFFABRRRQAUUUUDHq1KTUYp2aBC0UlLSAKSlooAaaKdSU\r\nAJS0lLQAUUUUALSGiigBUXNSgYFMSpKoQmBTWXHSlJwaXqKAEB4oNHSl7UARnmkC07vQTigY00Cg\r\n0dBSGIBzT8YpFFOwB1piG4zTSKkyKRsUCI6KWikMKKKKACiiigAooooAKSlooAQ0qnFAGTSsMdKY\r\nhCc0lFFAwoJozTaBBSgUAUtOwhaKKSmAUUUUALRRRQIKKKKBhRRRQAUUUUAFFFFABRRRQIKKKKAE\r\nopaKBiUUtFABSUtJQAUUtFACUtFFABRSUtABTDTqaaTAKKKKQwooooAKKKKACiiigAooooAKKKKA\r\nCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK\r\nKKKACiiigAooooAetOpq0tSMKWkpaACiiimAuKKWikAlJS0lABSim04UAFFFJQAGkopKYxc0lFFI\r\nApaMUUCCiiigBKXFFLQAUlLSUAFJS0UAJRRRQAlJS0UwEooooAKBRRQAUUUUALQKKKQC0tJRQAtF\r\nFFABRRRQA00UppMUwClpKKQC0UUUAKDg1KDxUNPU0wHfxUtApaYhp60vWkJ5pRQA1uDSdaHPNIKB\r\ni4pGp1NNADhSkUi040CI8c0U4nio+hoGKRSUvWkoAKKKSkAtFJRQAtFJRQAtGM0maehGKYDelBOa\r\nccGm0CExSGnU00DClApAKdTJCiiimAUUUUAJS0UUCCiiigAooooGFFFFAgooooAKKKKBhRRRQIKK\r\nKKBhRRRQAUUUUAFFFFABRSUtABSUUUAFFFFACimnrTqYetJgFFFFIYUUUUAFFFFABRRRQAUUUUAF\r\nFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUU\r\nUUAFFFFABRRRQAUUUUAOWnUUUhi0UUUAFAoopAOooooASkoooASlFFFAC0hoooASiiigAooooAKK\r\nKKACiiigApRRRQAUlFFABRRRQAlFFFACUlFFMAooooGFFFFAgpaKKACiiikAtFFFAC0UUUABooop\r\ngBpKKKBiYooopCFooooAKKKKAHK9PL8UUVQCdRS/w0UUCI+9KKKKQxTSUUUwFU08dKKKAYw8GmNR\r\nRQA5elIRRRSASkoooAWiiigApcUUUwFCcZNNPWiigQUUUUDGk0CiimhCiloopiCiiigAooooAKKK\r\nKBBRRRQMKKKKACiiigAooooAKKKKBBRRRQMKKKKACiiigAooooAKKKKACkoooAKKKKAClFFFABTD\r\n1oopAFFFFIYUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAf//Z', 'asha1', '2017-05-17 16:05:54', 'asha1', '2016-09-08 16:05:54', 'qawsedrftgyh');
INSERT INTO `hm_patient` (`Patient_id`, `PinCode`, `Village_id`, `City_id`, `District_id`, `State_ID`, `Country_ID`, `Card_Type_id`, `Gender_Id`, `Cast_Category_Id`, `Patient_Salutation`, `Patient_FName`, `Patient_MName`, `Patient_LName`, `Patient_DOB`, `Patient_Age`, `Patient_Language`, `Patient_POB`, `Education`, `Patient_BPL`, `Patient_Marital_Status`, `Patient_Contact`, `Address_line1`, `Address_line2`, `Patient_Emergency_number`, `Patient_Ward`, `Patient_Image`, `Created_By`, `Created_Date`, `Updated_By`, `Updated_Date`, `Card_Number`) VALUES
('asha1283', '41001', 1, 1, 1, 1, 1, 1, 2, 1, 'Mr', 'Sunil', 'Kumar', 'Muttepawar', '1998-10-01', 18, 'English', 'Gurugram', 'Literate', 0, 'Married', 4294967295, 'Kaur baugh', '', 1234567890, 'null', '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAKBueIx4ZKCMgoy0qqC+8P//8Nzc8P//////////////\n////////////////////////////////////////////2wBDAaq0tPDS8P//////////////////\n////////////////////////////////////////////////////////////wAARCAPABQADASIA\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwCGiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAP/9k=', 'asha1', '2016-12-15 13:43:45', 'asha1', '2016-11-15 13:43:45', '123456789012'),
('asha1284', '41001', 2, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Gangabai', 'Ishwar', 'Aapte', '1988-09-08', 28, 'Marathi', 'Pune', 'Literate', 0, 'Married', 4294967295, 'Kothroud pune null stop', '', 1478523695, '12', '', 'asha1', '2017-04-11 15:59:41', 'asha1', '2016-09-08 15:59:41', 'qawsedrftgyh'),
('asha1344', '41001', 6, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Suman', 'Sudas', 'Jadav', '1987-06-22', 29, 'Marathi', 'Akola', 'Literate', 0, 'Married', 4294967295, 'Akola market gali', '', 4294967295, '12', '', 'asha1', '2015-03-20 11:08:09', 'asha1', '2016-06-22 11:08:09', 'qawsqawsedrf'),
('asha1350', '41001', 6, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Suman', 'Sudas', 'Jadav', '1987-06-22', 29, 'Marathi', 'Akola', 'Literate', 0, 'Married', 4294967295, 'Akola market gali', '', 4294967295, '12', '', 'asha1', '2015-03-20 11:08:09', 'asha1', '2016-10-05 11:08:09', 'qawsqawsedrf'),
('asha1444', '41001', 9, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Suman', 'Sudas', 'Jadav', '1987-09-12', 29, 'Marathi', 'Akola', 'Literate', 0, 'Married', 4294967295, 'Akola market gali', '', 4294967295, '12', '', 'asha1', '2015-06-16 11:08:09', 'asha1', '2016-10-05 11:08:09', 'qawsqawsedrf'),
('asha1456', '41001', 9, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Suman', 'Sudas', 'Jadav', '1987-09-12', 29, 'Marathi', 'Akola', 'Literate', 0, 'Married', 4294967295, 'Akola market gali', '', 4294967295, '12', '', 'asha1', '2016-10-05 11:08:09', 'asha1', '2016-10-05 11:08:09', 'qawsqawsedrf'),
('asha1510', '41001', 2, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Gangabai', 'Ishwar', 'Aapte', '1988-09-08', 28, 'Marathi', 'Pune', 'Literate', 0, 'Married', 4294967295, 'Kothroud pune null stop', '', 1478523695, '12', '', 'asha1', '2016-09-08 15:59:41', 'asha1', '2016-09-08 15:59:41', 'qawsedrftgyh');
INSERT INTO `hm_patient` (`Patient_id`, `PinCode`, `Village_id`, `City_id`, `District_id`, `State_ID`, `Country_ID`, `Card_Type_id`, `Gender_Id`, `Cast_Category_Id`, `Patient_Salutation`, `Patient_FName`, `Patient_MName`, `Patient_LName`, `Patient_DOB`, `Patient_Age`, `Patient_Language`, `Patient_POB`, `Education`, `Patient_BPL`, `Patient_Marital_Status`, `Patient_Contact`, `Address_line1`, `Address_line2`, `Patient_Emergency_number`, `Patient_Ward`, `Patient_Image`, `Created_By`, `Created_Date`, `Updated_By`, `Updated_Date`, `Card_Number`) VALUES
('asha1511', '41001', 2, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Kantabai', 'Ramdas', 'Tawde', '1989-09-08', 27, 'Marathi', 'Kolhapur', 'Literate', 0, 'Married', 4294967295, 'Kolhapur main road', '', 1478523695, '12', '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAKBueIx4ZKCMgoy0qqC+8P//8Nzc8P//////////////\n////////////////////////////////////////////2wBDAaq0tPDS8P//////////////////\n////////////////////////////////////////////////////////////wAARCAPIBRADASIA\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwCGiiig\nAooooAKKKKACiiigAooooAenWphUCdanFIYtFFFIQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUU\nUAFFFFABRRRQAUUUUAFFFFMBaKSigBaKSigBaSiikAUlFFAwoopKACiiigAooooAKKKKACiiigAo\nopcUAJS0uKXFFgGUU/FMNOwBQacDQaLAIBTsUgNLmnYQYoxS5ooAQimEYqSmtQA0Cg8U5aGGaVgG\n0UqinYosAyinYpCKLDEooopAFFFFABRRRQAUUUUALRmkooAXNFJS0ALSUUtACUlLSGgQUlFFABRR\nRTAKKKWgAooooAKKKKACiiigAoopaQCUUtFMBKKWkoAKKKWgAooopAFJS0UwEpKWkoASkpaSgBKK\nKKYBS0UUAFFFFABRRRQAUUlLQAVGetSVGetACUUUUAFFFFAC0lFFABS0lFABRRRQAUUUtACUUUUA\nFFFFABRS0lABS0lLQAUlLRQAlLRRQAUUUUAJS0lLQAlLRRQAUUUUAJRRRQAUUUUAFFFFABRRRQAU\nUUUAOXrUwqFetTCpGLRRRQIKKKKACiiigBaKSigBaKSigBaKSigBaKSigBaKSigBaKSloAKKKKAC\niiigAooooAKKSloAKKKSgAooooGFFFJQAUUUUAFFFFABRRRQAUUUUAFFKBQRTsAAU7FNFLmmIWjN\nJmmmgB2aa1JzQTQMAaM0A0uKAEFKTSdKMZNADhS5xSDpSE0CFzR1popQKQxRS0lLmmIBThTaTNAD\n6SgGigAIqM8GpaawoAYKWnAcU1hilYYUUUUgCiiigAooooAKKKKAFopKWgAooooATFJTqSgQlLRR\nTAKKKWgBKWiigAooooAKKKKACiiikAUUUUwCiiigAopKKAFopKKAFpKKKACkopKACkoooASlpKWm\nAUtJS0AFFFLQAlJTqSgBKKKKACoz1qTtUZ60AFJS0lABRRRQAtJS0lABRRRQAUtJRQAUUUUAFFFL\nQAlLSUUAFLRSUALRRRQAUUUUAJRS0UAFFFFABSUUtABRRRQAUUUUAJRRRQAUUUUAFFFFABRRRQAU\nUUUAOXrUoqJetSikwFooopAFFFFABRRRQAtFJRQAtFJRQAtFJRQAtFJRQAtFJRQAtFJRQAtFJRQA\ntFJRQAtFJRQAtFFFABRRRQMKSiigAooooAKSiigAooooAWiinAUAIBSEU8UhqrCEBpTSUUAJS0UY\noGJmlzRikpABoopM0AIRRmnDmkIoAQc0/FNFLmmAE0hpM0GkA5aXNNHSmk80wH5pai5pQ1AD6TNG\n7NKRQAgNOzTKdSAduppbmikIpiHKaU81GOKeDmgBwFGKQU6gBmKKfSEUrAMopTSUhhRRRQAUUUUA\nLRSUtABRRRQAlFLSUCClpKKAFooooAKKSimAtFJRQAtFJRQAtFJRQAUUUUAFJRRQAUUUUAFFFJQA\nUlLSUAFJS0lMApaKKAClpKWgBaKKKACiiigBKKWkoAQ9KjPWpDUZ60AFJS0lABRRS0AFFFJQAUUU\ntABRRRQAUUUUAJS0UUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAJRRRQAUUU\nUAFFFFABRRRQAUUUUAKvWpRUQ61KKTAWiiikAUUUUAFFFFAC0UlFAC0UlFAC0UlFAC0UlFAC0UlF\nAC0lFFAC0UlFAC0UlFAC0tIKWgYUUUlABRRRQAUUUlAC0lFFABRRRQAUopKcooAUClpaSqEFITSm\nm0AJS0lKKBhRRmlzQA3NLmg03FADgKRhSA4p3WgBgOKdwaQik6UAOxSYpN1LuoASg0E0CkAo6U0D\nJpSeKBTAXApMUhNANABilBxQDSkZoAXg0YpnIpc0AOxRmkBoNACmm9DSg0jUASDpS5xTEanUCFoF\nJS0AI/SmCnv0pFHFACUUHg0VIwooooAKKKKAFopKKAFooooASilpKBBRRSUwFopKKAFopKKAFopK\nKAFopKKACiiigAooooAKKKKACkpaKAEpKWigBKKKKYBRRS0AFFFFAC0UUUALSUtJQAUlLSUABqI9\nakNRmgApKWkoAWkpaKACikpaACiiigBKKWigApKWigAooooAKKKKACiiigAooooAKKKKACiiigAo\noooAKKKKACiiigAooooASiiigAooooAKKKKACiiigAooooAUdakFRipBSYC0UUUgCiiigAooooAK\nKKKACikooAWikooAWikpaACiiigAooooAKKKKACnCminigApKWkoGFFFFABRRRQAUlLSUAFFFFAB\nRQaQdaAHYpRxSjpSGqELmlpopTQAUUUlAxaSiloAQUuKaOtPPSgCM04Cmnk08DigGJikIxT8UYoE\nMzQRQVpM4oGIRQBRmgGkAYpKfwaTFMBtLnikNFAB1NKRQKRjQAUqmkBzQRigCTANIQBTQ1BOaAsK\naQGikoGLSkZFApaBDOlPBoxSDigB9ITilFBGRQIZuyaeKiIxTkNAxSMtRilHWnYoEMopSKSpGFFF\nFABRRRQAUtJRQAtJS0hoASiiimAUUUUCCiiigAooooAKKKKACiiigAopaKACiiigApKKKAEooooA\nKKKKYBRRRQAUtFFABRRRQAUUUUAFJS0lACGo6kPSo6ACiiigBKWiigBKWkpaACiiigBKWiigAooo\noAKKKKACkpaKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooASiiigAooooAKKKKACiii\ngAooooAUU8UwU8UmAtFFFIAooooAKKKKACiiigAooooAKKSigBaKSigBaKSloAKKKKACiiigBwp4\npq06mMDTadSGgQlFFFIYUlLSUAFFFFAC0UlOAoAUCkK04UjdKoQ3NGc03mlAoGPFBpKSgB1JRRQA\nUUmaUEUAAFKTRmmnmgAHWnimgU6gGFGaQmmk0CH9aawoBpTQBFSU8ik20ihAaM07FIaYhBThim5o\nFIBx6Uw08UEZpiIwcU/qKaVpAcUDH4oxQGpC1ADqQimE04HNACg4p4OaYaBQA8im0ueKQdaAFU0+\no+hp9AhrjiowcGpG6VFQNEoNPFRIalFAgPNNIp1IwoYDaKKKkYUUlLQAUUUUAFFFJQAUUUUwCiii\ngQUUUUAFFFFABRRRQAUUUUALRSUUALSUUUAFFFJQAUUUUAFFJS0wCiiloAKKKKACiiigAooooAKK\nKKAEPSoqlPSoqACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK\nKACiiigAooooAKKKKACiiigBKKKKACiiigAooooAKKKKACiiigBRThTacKTAWlpKKQC0UlLQAUUU\nlABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0opKcKBiilpKUGgBaSilFMQ2ilNJSGFJRRQAUUUUA\nKKdSKKfTQhKQ80tGKYCAUUE00mgANGaaWphagZIWppamZpKAHlqTdTaKAH7qUNTKKAJ1Ip2agBpw\negQ4mkzSE5ptIZJS01acKAENJmnGmgUAIaQmnkU0igBAM08CkUc040IQUlGaQNTAUim7afkUEUAR\nEEU2psZpClA7kWKcop4WlxQFxppRSN1ozxQAZpRTaUUgBuuadmhulNWmIVulNC5pxFKBigBu2nA0\ntLigBTR2oFLQBF3paMZNB4pMYUUUUgEpaSloAKSikoAWlpBS0AJRS0lABRRRTEFFFFABRRRQAUUU\nUAFFFFABRRRQAUlFFABSUUUwClpKKAFooooAWiiigAooooAKWiigAopaKAGt0qE9anbpUB60AFFF\nFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\nAFFFFACUUUUAFFFFABRRRQAUUUUAFFFFACinCm04UgFooopAFFFFAC0UUUwEopaKAEopaKAEopaK\nAEooooAKKKWgBKKWigAFOFIKdSGFFJS0AKKKSlpgFIafTTQIbRRRSGFJRTgM0wHKeKXNMHFOpiCl\n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\ng0UgG0hpTTaAFFBFFGeKAAUoPNIOtB4oAG60p+7TRyaVjTAQdalB4qIVIvSgB4FIwpVNKaBEdFKa\nSpGJRRRQAUtJRQAtLSUtACUUtJTEFFFFABRRRQAUlLRQAlFFFACUUtFMApaKKAClopaACiiigApa\nKKACiiigAopKKAEfpUFTP0qGgAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoo\nooAKKKKACiiigAooooAKKKKACiiigAooooASiiigAooooAKKKKACiiigAooooAUVKtRCpV6UhjqK\nKKYBRRRQIKKKKBiUUtFABRRRSAKKKKACkpaKAEopaKBCGmmnGmGkMKcKbThQAtJS02gBRS0gpaAC\nmmlpQM0ACmnUFcUlUIKKDRQMKjapKjegBtJRRQAtFFFABRRRQAUtJRSAWiiigAoopaACiiigAooo\noAKKKKAClpKKYC0UUUAFFJRQAtJRRSAKSlpKACkpaSgAooopgFFJRQAtLSUUALRRRQA8UtNWnUAN\nxk0EYNOHWkegBD0ptO7U2gBVpGpR0pKQCrSHrQKDTASnoaZSqKAJwKWo1bnFPoEDCmVIeRUZpMBK\nKKKQwooooAKWkpaAFpKWigBKKKWmISiiigAooooASiiigAoopaYBS0lLQAtFFFABS0UUAFFFFABR\nRRQAlFFFADX6VDUz9KhoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACi\niigAooooAKKKKACiiigAooooAKKKKAEooooAKKKKACiiigAooooAKKKKAFFTL0qEdanXpSGLRS0U\nxCUUtFACUUtJQAUUUUAFFFFABRRRQAUUUUAFFFBoAYaaacaaakYCnCminCgANJSmkoAUUtIKWgBK\neopg61IKaAU0ynU2mIKKSloGFMapO1RNQA2iiigAooooAKKKKACiiikAtFFFABRRRQAtFJS0AFFF\nJQAtFFFABRRRQAUUUUAFFFFABRRSUAFFFFACUUUUAFFFFMBKKKKACiiigBaKSloAenWn1EvWpTQA\nnQ0OOKDSn7tADBTTTwKbQADpSCgGikAnenHpSd6eRxTAjFLnFHSgDJoAAeanU5FM28UoOKAJO1Rk\nUpal6igQykpTSVIwooooAKKKKAFpaSloAKKKSmIKKKKACiiigBKKKKAFooopgLS0lLQAUtJS0AFF\nFFABRS0UAJRS0lABRRRQAx+lQ1O/SoKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK\nKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBKKKKACiiigAooooAKKKKACiiigBR1qdelQ\nCp16UhjqKKKYgooooAKKKKACkpaKAEopaKACiiigAooooAKQ0tNagBppppTSUhgKcKaKdSAQ0UGi\ngBRRQKDQAo60/FRr1qUU0AlJTjTRTEJSijvSigYhqJqlbpUTUANooooAKKKKACiiigApaSlpAFFF\nFABS0UUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFJRRQAUUUUAJRS0lABRRRQAlFFFMAooooAKK\nKKAFHWpKjFSLSAXHFL/DSseKZ2pgIKKO9LjigBneg0d6U0gG0u6gigLTASnoKULikJxQApNNpM0o\nNIA5zUq9Kb1FC9KYCkU2pOophFJiEooopDCiiigBaKSloAWkpaKYCUUtJQIKKKKAEopaKYBRRRQA\ntLSUtABS0lFAC0UUUAFLSUUALSUUUAFFFFADZOlQVPJ0qCgAooooAKKKKACiiigAooooAKKKKACi\niigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooASiiigAooooAKKKKACii\nigAooooAUVMvSoRUy0hj6KSlpiCikooAWikooAKKKKAFopKKAFooooAKKKKACmNT6Y1AxtIaKKQA\nKWkFLSAKSlooAUUGijvQAnSpA1AGRSYqhC0nQ0tBoGFKKbSigBW6VC1THpUTdaBIZRRRSGFFFFMA\noopaQBRRS0AFFFFABRRRQAUUUUAFFLRQAlFLSUAFFFFABRRRQAUUUUAFFFFACUUtFACUUtJQAlFL\nSUAFJS0UwEopaSgAooooAKkWo6kTpSAXmnY4pQKU9KYXIj1px6Uhpe1ADB1oajvSnmgAWlyBTOlF\nIBSabTscUgHNACgUuKUYHWncEUwEWgdaQcGlNAD1pGFCmnHpQIiopTSVIwooooAKWkooAWlpKWgA\nooopiEopaKAEooopgFLRRQAUtFFABRRRQAUtJRQAtFFFABRRRQAUUUUANk6VBU8nSoKACiiigAoo\nooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiii\ngBKKKKACiiigAooooAKKKKACiiigBalWoqlWkMfRSUtMQUUUUAFFFFABRS0UAJRS0UAFFFFABRRR\nQAlNanGmGkwGmkpTTaBiinU0U6kAlKKSlFAC0hFOpwFADVJp1BGKbmqELSmminUDEoopRQAdqjap\ne1RtQIZSU7FJQMSilxRSAKKKWgAoopaACiiimAUUUUAFFFFABRRRQAUUUUAJRRS0gEooooAKWiig\nAooooAKSlooASilpKAEopaSgBKKWkoAKSlpKYBRRRQAU+M80ylU4NAFilqMNxTgaBCMKaKe3SmDg\n0DEIpAae3SmGgBTSAc0lGaQCtSqMUgFDHtTARmpVbmm4ooAkNAPFAORSHigBc4NSjkVCKkQ0gBhT\nKlPSozQxCUUUUhhRRRQAtAoooAdRSCnUxCUUtJTASilooASilooAKKKKACiiloASilooASilooAK\nKKWgBKWiigBknSoKnk6VBQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\nFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAJRRRQAUUUUAFFFFABRRRQAUUUUALUqdKiqZOlIY6ilop\niEopaKACiiloASloooAKKKKACkpaKAEopaSgBDTDTzTDSYDaSlpDSGKKWkFLQAlKKSlFADxTxTFp\nxpoQGoz1qSmsOaYABS03NLQMU0CkoBoAeelRN1qTORTHFAhlFFFAwopKKAFoopaQBRRRTAWikpaA\nCiiigApKKKACiiigAooooAKKKKACiiikAUUUUAFFFLQAlFLSUAFFFFABSUtFACUlOpKAG0UuKSgB\nKKWkpgFFFFADlNSUxRxTx0pAO7UxuDTu1NNMBuaUc0lKppAIaSnEU0imApNIKAOaU0AHFIRSU88i\ngBFNK1NHBp56UAIKXpSCndaQC7+1Bphp68igBtFKaSkAUUUUAFLSUtACinCmU4UALRS0VQhKSnUl\nACUUtFACUtFFABRS0UAJRS0UAFFFLQAlLRRQAUUUUARydKgqeTpUBoAKKKKACiiigAooooAKKKKA\nCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAEooooAKKKKAC\niiigAooooAKWkooAWp06VBU6dKQx9FFFMQUUUUAFFFLQAlLRRQAUUUUAFJS0UAJRS0lACGozUh6V\nGaTAaaSnU00hiiloFFACUopKUUASLTsU1KfVIQ3pTSaVjTMc0DFApaM4ooAKKKBSAFpW6Uopr9KY\niM0maQmkoGLS02loAdRTc0uaQDqKTNGaAFopM0UALRSZooAWikooAWkoooAWikooAWikooAWikoo\nAWiiigAooooAKKKKAClpKKACiiigAooooAKTFLRQA2kpxptACUUUUwHKakHSohUq0gHdqZipD0qO\nmIQikxT85oxSGNzSHmnYoxTAZQKdijpSAaRTl5pDzQvWmAMMGnDkU16FbFACkUqmjOaTvQA40q0h\noHWkArCm1JjimGgQlFFFIYUtJRQAtKKSigCQUtNBp1MQlFLRTASilooASilooASloooAKKKKACii\nigAooooAKKKKAI5elQVPL0qCgAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoo\nooAKKKKACiiigAooooAKKKKACiiigAooooASiiigAooooAKKKKACiiigApaSigBanTpUFTJ0pDJK\nKKKYgooooAKKKKAFopKKAFopKKAFopKKAFopKKAA1GaeaYaTAbSGlNJigYoooopAJSikpwoAcDin\nZpMcUdKoQhooozQMTFLSg0GgBBS0CkJoELmmOadTHoAjooooAKKKKACjNFFAC5ozSUUALmjNJRQM\ndRmkopALRSUtAC0UlFAC0UlLQAUUmaM0ALRSUUALRRRQAUUUUAFFJRmgB1FNzRmgB1JSZozQAtFJ\nmkzQA7NGaTNGaAFpKM0ZoASkpaSmAVMlQ1JGeaQEpFIFp1FMQwrTM1KRTCKAG5oyacBijFAwPSoy\nakqNutAAOlKvWhelA60AOYZFRkVJuppNACL1p3emjrS96AHUo+9SUKfmpAS0xqeaQjimIjopTSVI\nwooooAWikpaAFFPFR08GmgHUUlFMQtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAEcvSoKnlqC\ngAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKA\nCiiigAooooASiiigAooooAKKKKACiiigAooooAWpU6VFUidKQyWikopiFopKWgBaKSigBaKSigBa\nKSigBaKSigBaKSigBaaRS5oPNAEdGKDwaAaQBSUtJSGJThTaetADhQaDwKQVQgpMU6jFAxKBSGlW\n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\n1NNACUlLSUwCiiigQUUUUAKKdTaWgBCKbTzTcUAJRS0UAJS0UUAFJS0UAJRRRQAUtJS0AKKeKjp6\n0hjjR2pCaTPFACqKUdaap5qXb3pgBpp6U+mMOaBDO9KaO9BoGIBS4oWhjQAo4pDSZpaQCU7NNpR0\noAeDS+5poOKaTmmA7fzTgc0wLTsYoAGHNNp55FMpAFAoopALRSUtABTgabSigB9FJRVCFopKKAFo\npKWgAoopKAFopKWgAopKWgCKWoqkl61HQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFA\nBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAJS0lFABRRS0AJRRRQAUUUUAFFFFAC09Ol\nMp6UhklFFFMQUUUUAJRS0lABRRS0DCiiigQUUtFACUUtFACU004000hjaWiikAlKKSlFAD1pW6Ui\n0ppoQxetSA0gWlPSmMQnmndRTOtN3EGgB5OKTNMLZoB4oCwvWigGjvQAvaom61MelQt1oASiiigQ\nUUUUAFFFFAwooooEFFFFABS0YpQKBhiilopAFFFLQAUtJS0ALRRRTASilooAaaSnGkpANpKdSGgB\nKKKKYBS02loAWikzS0AJRS0lABRRRQAlLRRQAUlLRQAlFFFAgooooAKcpxSUCgY7rTgnFInWnse1\nADAMGn7snFNxTgMUAOFNandBUbHmgQlJS9qBSGLnApnU0ppB1oAXbxRTj0ptAABmnngUgOKQnNAC\nU5V7mgDvQTQAE05TmmUo4NAx/SmmnjmmkUxDaKKKkAooooAWikpaAHA0U3NLmmA6im5opiHUU3NL\nmgBaKSkzQA6ikzRQAtFJmjNAEUnWmU5+tNoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACii\nigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAEpaSloASloooASilpKACiiigAooooAW\nnpTKctIZJS02lpgFGaSigQtFJRQMWikooAdRSUtABS0lFAhaKKKAENNNONIaQxtFFFIBKUUlKKAJ\nFpTSLTqpCEpCadUbHmgA3c0h5pKKBhikNOzgU2gAFOHWm4pVpDHt0qE9albpUR60xCUUUUAFFFLQ\nAlFLRQAlFLRSAKXFFKBQAYpaKKYBRRRSAKKKWgAoFFLQAUtFLTASilpKAENNpxpDSASkpaKYDcUl\nPpKAG0lOpKAEopaSgBaKSigBaKSigBaKSigBaKKMUgCilpKYCUtFFABRRS0gFU1IOaiFPU80AS4F\nGRSdaYTTEP61E33qXNNNA0KaQUdqSkMWk70tBoEL2pKB0paBgaVRmm08cCgQNxSCg8mlHAoAUAUh\nFISaUGgBRTjTaXrTAaaSnEU2kAUUUUgClpKKAFopKUUwCilopiEopaSgAooooAM0ZpKKBi5ozSUU\nCGP1ptK3WkoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA\nKKKKACiiigAooooAKKKKAEooooAWikooAKKWkoAKKKKACiiigAp602nLSGPooopiEooooGFFFFIA\npaSloAWlpKWmAUtFFAgooooAQ0hpxpppDG0UtJSASlFJS0APU0+mLTjxVIQhNJtzSZyacDigYwij\nFONITxQAxqAKKcBSAKBR3pcUADdKiNSN0qOmAUUUUgCloooAKKWigBKWiloASlopaYCUtFFABRRR\nSAKKKKAFpaSlFAC0UUUwCiiigBDSUtJQAlFLRQAlJS0UANxSYp9JigBlFOxSYpAJRilooATFGKXF\nLigBuKMU6igBKWjFFABSYpaKAEpKdSUAJS0lLQAUopKKAJVPFKRmowalByKYEbCm1KRxUfegEOC/\nLTDU2MLUR60AhKDSnimmkAo6UvahRxQaABRk040L0pD1oAVRQTRnApKACjpS9KSgBRyKAcUgpxxQ\nAucimmlFIaAEooopAJS0lLTGFKKSlFACilpBTqEISilopiG4oxTqMUANxRilxRigBuKMU7FGKAIG\n60lOfrTaACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACii\nigAooooAKKKKACiiigAooooAKKKKACkpaKACkpaKACkoooAWnJTaelIY+jFLRQAmKTFOoxQA3FGK\ndijFMBMUuKXFFIBKWilpiCiiigAooooAa1NpzU2kxhSGlptIAooooAepxSls0nam96YDxxTSaKSg\nY7tTDUi0MtMRGKWjFKopDFUc049KOBTS2aYhrdKZTmptABRRRSAWlpKWgApaKWgBKWiimAUUUUAF\nFFFIAooooAKWkpaAClFJSigBaKKKYBRRS0AJSUppKAEopaSgAooooASilooAbijFLRQA3FFOpKQC\n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\nlpKAClpKWgBKKKSmAU9RTRTxxSAU0KeaSigB9DUgOad1FMCI8Gl3GnkUm2gBhNFOK0BaQxAKfjFK\nMCjGaYgpMU7FIaBDR1pDR3pSKQxBQaSnDmgBKUDmjHNKOKADGTT8DFIKQnmmAjCm088im0mAlFFF\nIBaWkpaAFFPqOng00IWiiimAUhpaD0oArP1ptOfrTaACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooASi\niigApwptOWgB9FFFIYUUUUAFFFFABS0lFAC0UlFAC0UlFADqKSigB1GM0gpwOKAEIIppp5amE0AN\nNNNPNNNACU9TUdKp5oAlpCKUGkNMBCKctNp69KABulRmnsaY1AISkNOFBFIBlFFFMBRTqQUUgFoo\nooAKKKSgBaKKUUAFLRRQAUmaWmmgBc0mabmkoAdmjNNpaAHZozSZooAXNGaSkoAXNFJRQAuaXNNz\nRmgB4NLmo80uaAJM0ZpoNLmgBDTacaSgBKKDRQAtLTaWgBaSiloASiiigAooooAKKKKACkoooAKS\niigApaKQ0AFJRRTABTs00UtIBwpTTRS0AC8GpAaZSg0ASdaTFJmk3UxDsCjbTd1JuoAfwKM5qMtR\nuNAyTpRTASaeKAGGndqRqTNIBDRml60EUDEzS9aSnDAoAd2pKTOTT+MUxCCkI5o6GlI4oAZRS0lS\nAUopKWgBaUGkoFAElFIDS1QgoPSig9KAK79aZTn602gAooooAKKKKACiiigAooooAKKKKACiiigA\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigApKWigAoopKAF\npKWigBKctNpy0APooopDClpKWgBKKWigBKKWigBKKWjFACUUtFACUUtJQAopaQU6kA00lKaSgApp\np1IaAG0lKaSmIepp1MWnigYYpw6UlOpgMNNPWnGkxk0AIKG6UpFIaQDKKDRTAcKKKKQC0UlFABRR\nSgUAKKWkFLQAtFFFMAppFOooAiIoxUhFNxQA2inYpMUgEopSKSgAooooAKKKSmAUUUUAFFLilC0A\nAp1AFLSASilopgNIptPpppAFFFFAC0UUUAFFFFABRRRQAUUUUAJRRRQAlFFLQAUhpaKAG0UuKMUA\nJS0q06gBBS0lLQAUUtFACGmZqSmlaYDaKdsNNoAM08YxTOtLikA4U7tSAUpoAQmko60YoAUU48im\nU4HFADcGgClJzSUAO6CgGkoxQMkPSk7ULyKO9MQ00lOIpKQBRSUtIApaSloAUGn1GKeKaAWkPSig\n9KYiu/Wm05utNoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoo\nooAKKKKACiiigAooooAKKKKAEpaKKACiiigAooooAKKKKACkpaSgApwptKKAH0tJRSGLRRRQAtFF\nFAC0UUUAFFFFABRRRQAUlLRQAoFGKUCnYoER4pKkOMVGaGMSkpaQ0gENNNPpppgIKkBpgp1ADqcK\nYKWmA4io84qUUxloAbnNFJjBpaQDDRSnrSUwFpaSikAtFFFAC0tJS0ALRRRQAtFFFMAooooASiii\ngBKKWkoASkNOpKQDaKWkoAKMUUtABijFLRQAUtJS0wFooooAKWkpaAENNNOooAZRSmm0gFooooAW\nikooAWikooAWkoooAKKKSgApaSloAKKKWgApAM0GgcUABGDTscZpM80uaACiiigBaKKKAEpwPFNN\nKDigAZuMVHTm5NCjvTAUDAoUZOaTrTgKQC9KaTTj0pnWgBQacMGmgUuMUAOxTcUA0u6gBMUYpd1K\nORQAg96U800mgdKAHKeaXPNNXrTmFMBTgimkUdDS0ANopaSpAKKKKAFpRSUCgB9B6UCg9KoRXbrT\nac3Wm0AFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFA\nBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUlFFABSikpRQA+iilpDEpaKKAFoopaACiiloAK\nKKKACiiigAooooAd0pN1FNouAE0lFFIBKDQaKAEpDS0lACU7NNopgOU06minA0wFpTyKSlHSkAxh\nTRTmpBzTAaaSlbrSUALS02lpALS0lLQAUtJRQAtLTaWgBaKSlpgFFFFABRRRQAUlLRigBKSnYpMU\nANopaKQCUtFGKACilopgFFFLQAUUUUAFFFFABRRRQAhphp9NNACUtJRSAWiiigAooooAKKKSgAoo\nooAKWkpaAFFFFFABRRRSAKKKKYC0UUUALRRRQAhpDSmkpAAp5GBTKeTkUwGqKeRTRT+1ADTg0BaX\ngUZpiDFBoBpTQAylApcUoFIYmB2paWkNMQxutAoagdKQxV61JxioqcDQApFFJRmmAGkpxptIAooo\npALRRRQA5TSnpTQacelUhFd+tNpW60lABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAF\nFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFJS0lABTh1ptO\nHWgB9FAopDClpKWgApaSloAKWkooAWiiigAooooAKUUlLQAGm0ppKQCUUUUAJRSmkoAQ0lKaSgAp\nKWkpgLmlBptKKAHg04U2jNACOKaDipDzTSKYDWptKaSgApaSlpALRRRQAtFJRQAtLSUUALRRRQAt\nFFLTASlozSZoAWikzSbqAHUhpN1GaACilozQAmKWkzRmkAtGKM0ZpgFFLRQAlFFFACUUUUAFFFJS\nAWkNFFADaKDRQAUtJS0AFFFFABSUtJQAUUUUAFKKKUUAFLRRQAUlLSUAFFFFAC0UUUALRRRQAUEU\no60rdKAGUoODSUUAOGM0FqbTSaYDi1Jkmm0A4pAPyRT1ORTOooBxQBJigmm76TOaYDs0tMFPFIBG\nHFNFPNRng0wHEUCk3UZpAOopAadimAdqTFLS0AMopSKSpAWkoooAWlJ+Wm0E8U0BE3WkoPWimIKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigApKWigApR1pKVaAHiigUtIYUUtFABRRS0AJS0UUAFFFFABRR\nRQAUtFFACUlLSUgEpaKSgAopQKCMUANNNNOpDQA0UtJSimAlKtFA4oAfSUmc08CgBBS4zRinCmIi\ndcUyppOlQ0AFLSUtIYUUUUAFFJRQA7NGabRmgB+aM0zNLmgB2aN1NpKAHZozSUUAFFFFABRmiimA\nuaTNJRQAuaM0lFAC5pQabRQA/dS7qjopASA0uajzRmgB9FN3UZoAWkozRQAtJRRQAhooNFABS0lF\nAC0UUUAFJRRQAUUUUALThSCloAKKKKACiiigBKWiigAoopaACiinAUANFDGnEU1lxQAlLTaWgBaT\nbS0UAIEFDJxSE4pd9ACDg80E0h5pKAClBoCk0EYpjJO1C0D7tApCHUxutPprCmAylFGKBSGL3qQc\n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\nAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB\nSr1pKVetIaJh0p1IKWgAooopiCkpaKBiUUtFAhKKWigAooopAJSUppKQxKKKKAEooooAWkNLSGgB\nKaadTTQMUUtNpRQIKQ06koAbRS0lMBaKKKQAOtOptJmmA/rUZpwpGFMBKKKKAFoopaQBRRRQAUUU\nUAFFFFACUUtJQAUlLRTASiiigAooooAKKKKAFooopAFLSUtABRRRQAUUUUAFFFLQAlFLRQAlFFFA\nBSUUUAFJS0lABThTacKAHilpop1AC0lFFMApaKKQBSUtJQAU4U2lBoAWkzRRQIKKKKBhTTTqQ0AM\npRSGlFIBaWkpaYBRRRQAUUUUAIaBS0hoAcTTS1KDSEUAJuoJ4pCKSgBRQaFGaCKBgDS00U6gQq9a\nU02loAKetR96k6CgANKOKQCgnmmAhPNI7ZWl601xxSAiooopiCiiigAooooAKKKKACiiigAooooA\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAo\noooAKKKKAClXrSUq9aQ0TilpBS0AFFFLTAKKKKACiiigQUUUUDCkpaKQhppKU0lIYlGaDSUDEoop\nKAHUlApaAG0UtFAhtKKDSUAOooFFACYpMUuaTNMAooooAKCKM0UgAUvUU2lBpgNPWilakpiFpaQU\ntIYUtFFABSUtJQAUUUUAFJS0UAJRS0lABSUtJTAKKKKACiiloAKKKKQBS0lFAC0UUUAFFLRQAUUU\nUAFJS0lABRRSUAFFFFABSUtJTAKcKbThSAcKdTRS0ALRSUUALRRRQAUUUCgApQKWigQlFBNJQMWi\nkpaACkNFIaAGmlFIaBSAdS0lFMBaKSigBaKSigBaSiikAnSnDkUhoFMBcZph60/tTOpoBDoxQ/Wn\nDgVGxpgAopQPlpDSAUcmlNNU4NPJGKAEXrTiaRaGoAcOlJjmgHijNABTXPFLTHpgMooooEFFFFAB\nRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFKvWkpV60honHSlpFp1ABRRRTAKKKKACiiigAooooEFFFF\n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\nWiigAooopAIabTjTaAHClpBS0AFFFFADlFLjmgUE81QhaQmkzSUgCiiigYUUUlABSUtJQMKAaKKA\nH5FGKjpQ2KBD8UnFN3UhamA/ijNR5petIB24U2Q5oIxTTQAlFFFMQUUUUAFFFFABRRRQAUUUUAFF\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUU\nUAFFFFABRRRQAUq9aSgdaBosr0p1RhuKXNIB2aTNNzRmgAzSZoopAFJRRQAU4UlOFABRRRQAUlOx\nSgUwGc0lSEgVGTQISiiikMSilpKAFooooASilpKAEpKWkoAQ0lKaMUwEpwpKUUALRRS0gEooooAK\nKKKACiikoAKSlopgJSUtFACUlLRimISilpKACiiigApaSloAWigUGkMTNFFFMQUUUUDCiiigAooo\noAKKKKACiiigAooooAKWkpaACiiikAtFFFABRRRQAtFFFACE0ueKKQimIcDmnVGpxS7qAH0UgpaQ\nwpKWigBKKWigAooooAKKKKAGmm080ykA4UtIKWgApaAKUimAA0lOAoIpiG0UUUhhRRRQAUlLSUAF\nJS0lAwopaKBDSKbUlIRQAyinYpGxTASlWkAzTulIBeppJBinKKbJQIZRRRTAKKKKACiiigAooooA\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAo\noooAKKKKACiiigAooooAKBRQKAJRS0i9KWpGJRS0lMAooooAKWiikAopaQUtACgUtJmkzTEKxpMm\nkJpKBi0lFFIBKKKKAEooooAWigUUAJRS0lABRilAzTjwKYERpRRjNBBFADT1ooFKaAAU6mCndqTA\nKKKKACiiigApKWigBKKKKAEopaSmAUlLRQAlFPUUMtMQykpxFJQAUUUUAKKMUClpDExSYp2KMUAN\nop2KMUANop2KQigBKKKKYBRRRQAUUUUAFFFFABS0lLQAUUUUgFooooAKKKKACiiigBaKKKAEPSkH\nWnUmcUxC7qeDUPepR0oAWiiikMKKWigAooooAKKKKAGtTKeaZQMcKWkFLSEPWlNNFKTTELmmk0lF\nAwooooAKKSigAooooASloooGFFFFAgoxS0UANNNIqQim0AIOBR1NBpVoAcKZJUneo5OtMQyiiigA\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACi\niigAooooAKKKKACiiigAooooAKKKKACiiigAooooAlXpS01elOqRhRSUUAFFFFABSikpy0AOApeB\nSZpKYATmgCkpQaQCGkpTSUAFFFFACUlLSUAFFFBoAUUUgp4GaAGmkp7Ck25p2AFIFNZs07ZTSMUA\nANKSMUykoADSUtJQAU4Gm0ooAfRSClpAJRQaSgBaKKKAEooooAKKKKACiiloAF4p/amU5TTAaRTM\nVNimstMRHRS0lAwpRSUUALmlzTaKQDs0maMUYoAM0tJiigBKKWkpgFFFFABRRRQAUUUUAFLSUtAB\nRRRSAWiiigAooooAWkpaKAEooooAWkNLSUANpQaQ0oGaYh4NKDTcYooGSUUwGnA0gFpaSigAoooo\nAaaaacaaaAFFOApq1KOlADcUEU4UE0xDKKKKQxKKKKACiiigApKKKBi0UUUCClpKWkAUUUUwCkNL\nRQAw0q8UEUUAOzUbnJoJpppgFFFFAgooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiii\ngAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAkXpS0\nIuRTttIBtFLjFJQMKKKKQC04U2nUAFJS0lABRRRQAUUUlABSUtJQAUUUhoAKSijFAxRUq9KiHWpM\n8UxMQn5qdkVGaKAHM1MNFJQAUlLSUgEpKWkpgFLSUUAOBp1MFOFIANJS0UAFFFFACUUUUAFLSUtA\nBRRRQAUA0UUASKc0MOKjzinZJpiGkU0ipCKbimMaBSU6kIoABS8UlFIAzRRRQAUuaMZpDQAtJQKW\ngBtFKaSmAUUUUAFFFFABS0lLQAUUUUgFooooAKWkooAWiiigApKWigBKKKKAEp8ZAPNMp6pxTEKx\nyabQetFAwooopAOBpQaZRQBJSU3dSFqAHE0003NGaAHipAeKjAp3NAC5pM0UlAC0lFFABRRRQAUl\nFFABS0lFAC0UUUgCiiigBaKKKYBRRRQAU0in0lAEZFNp5FMNMAooooEFFFFABRRRQAUUUUAFFFFA\nBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAF\nFFFABRRRQAUUUUAFFFFAEqNxT91RLTqQxxOaSnDFBWmIZRTgtLtpWGNFOpMUtIBKDSE0UDDNKKaR\nSigQtJS0lABTaU0lAwzSUtJQAUUuKKBBThTaeDxQA2iiigBKSlpKACkpaSgBKKWkpgJRS0UAFKDT\naWgB1FIDSigYUUtJSEFJS0lABRRRQAtFFFABRRRQAU5SKbRQBISKaaaoJNSFeKoQwikPSnYpCKBj\nKUUYpQKQDTRQetLigBBQaXFIaAAUUA4ooAWkpc0hoASiiimAUUUUAFLSUtABRRRSAWiiigAooooA\nWiiigAooooAQ0lLSUAJUitxTAM04jFMQZopKWkMKKKKACkJpTTTQISiiimAtGKBTqAHKeKduFR0U\n7AOJoptLRYLi0UlLSsFwopKKLDCiiiiwXCiijNFguLRRRSsAUUUlAC0UlLQMWikpaBBRRRQAEVEw\nwalqN+tADaKKKYgooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACii\nigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAetOpq9KdSGKDTt1MpaAF\nzRuptFADs5ozSUYpAJSijFFAC0UlLQAUlJRQMKKKKBBSUtFACUUtJQAUopKUUALSUUUAJRRRQAlF\nFFACUlKaSmAUlLSUAFFFFACin0wU4GkAtFFFACUlOoxQAlJTitJQAlLSUUALRRRQAUUUUAOSpKiH\nWpBTQg60hFHenUwIyKTFPNIeKBkfenHpSHrSnpQAzPNKeRTaWgApKWgCkAUUEYpRzQMSkpxFJTEJ\nRRRQAUtFFABRRRSAKWiigAooooAWiiigApKWkoAKSilFMAXOaUnNPAGKYRzQIKKKKQwoopCaAEJp\nKKKYgoopwFAAKWiiqEFFFFABRRRQAtFJRQAtFJRQAUUUUAFFLRQAlLRRQAUUUUrDuFLSUtSMKKKS\ngBaKSigBaY3WnUxutACUUUUxBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRR\nQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA9elOpq06kM\nKKKKACiiikA4UUCigApKWkoAKKKKAEoxS0UAFFFJQAUUUUAFJS0YoASloooAWkoooAKKKbQAtIaW\nkNMBtFLiigBKKKKAEpaKKAClFJRQA6lpoNOpAFKvWkoBxQBI3SoqcSTTSKYhKKKKQxaKKKACiiig\nBacpplFAEtLTFan5GKoQ00ZzRTWGOaAHYpjmnBs0jDNAyMdacRxSYxQTxQA2nLSU5aQCNQtB5NOQ\ncUADdKZTzTSKYCUUUUAFFFFIAoopaACiiigAooooAWiiigApKKKAEpwGabT1bApgGcUlB5ooEFFF\nJSGFJQaSmIKKKdiiwCAU6koqhC0UlFAC5pCaSjFABmlpMUYoAXNGaMUmKAFzS02lzQA6im5pc0AL\nRTc0ZoAdRTc0ZoAdRTc0ZoAdRTc0uaAFopM0tIAooopWHccBmo361MOlQv1oAbRRRQAUUUUAFFFF\nABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\nFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAOWnZpopaQxc0ZpKWgBaKSlFADhRRRSAKSgmkzQMWikoo\nAWiiigQlFFFABSUtJQAtFFJmgAoopM0AOooFBoAQ0lFFAwooooEJRRRQAUlFFMAooooAKKKKAFpR\nTaUUAPxSquaF5FOGBQAYAFRnrTmbsKbQIbRS0lIYUUUUALRRRQAUtJRQAGnKCabTlOKYDgOKD0oL\n8UA5FMRFT05ppHNOTigYMtNI4qbrUZHNADKWhhigUgEqQdKYRSjpQMTvS03vThQIaRSU4ikoASlo\nooAKKKKACilooASilooASiiigAoooAzTAVRk0N7UpG0U2gQtFJRQMWmk0E0lAgpQKAKdTsISloop\ngFJS0UAJRS0UAJRS0lAgopaKBiUtFFACUUtFACUUUUAFFFFABSYpaKAExRilooATFFLRQAlLRRQA\noNLmm0tADs1G3WnZpp60gEooopDCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigB69KWkXp\nTqQxKKWkoASlFFAoGPpCaM0lIApMUtFACU4UlKKACiiigQlFFBNABSUUhoAKKKMUDCkpaMUAOHSg\n00UtACUUtFAgpKWkoAKSlooASiiimAlFFFABRRRQAUUUUDHq1KTUYp2aBC0UlLSAKSlooAaaKdSU\nAJS0lLQAUUUUALSGiigBUXNSgYFMSpKoQmBTWXHSlJwaXqKAEB4oNHSl7UARnmkC07vQTigY00Cg\n0dBSGIBzT8YpFFOwB1piG4zTSKkyKRsUCI6KWikMKKKKACiiigAooooAKSlooAQ0qnFAGTSsMdKY\nhCc0lFFAwoJozTaBBSgUAUtOwhaKKSmAUUUUALRRRQIKKKKBhRRRQAUUUUAFFFFABRRRQIKKKKAE\nopaKBiUUtFABSUtJQAUUtFACUtFFABRSUtABTDTqaaTAKKKKQwooooAKKKKACiiigAooooAKKKKA\nCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK\nKKKACiiigAooooAetOpq0tSMKWkpaACiiimAuKKWikAlJS0lABSim04UAFFFJQAGkopKYxc0lFFI\nApaMUUCCiiigBKXFFLQAUlLSUAFJS0UAJRRRQAlJS0UwEooooAKBRRQAUUUUALQKKKQC0tJRQAtF\nFFABRRRQA00UppMUwClpKKQC0UUUAKDg1KDxUNPU0wHfxUtApaYhp60vWkJ5pRQA1uDSdaHPNIKB\ni4pGp1NNADhSkUi040CI8c0U4nio+hoGKRSUvWkoAKKKSkAtFJRQAtFJRQAtGM0maehGKYDelBOa\nccGm0CExSGnU00DClApAKdTJCiiimAUUUUAJS0UUCCiiigAooooGFFFFAgooooAKKKKBhRRRQIKK\nKKBhRRRQAUUUUAFFFFABRSUtABSUUUAFFFFACimnrTqYetJgFFFFIYUUUUAFFFFABRRRQAUUUUAF\nFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUU\nUUAFFFFABRRRQAUUUUAOWnUUUhi0UUUAFAoopAOooooASkoooASlFFFAC0hoooASiiigAooooAKK\nKKACiiigApRRRQAUlFFABRRRQAlFFFACUlFFMAooooGFFFFAgpaKKACiiikAtFFFAC0UUUABooop\ngBpKKKBiYooopCFooooAKKKKAHK9PL8UUVQCdRS/w0UUCI+9KKKKQxTSUUUwFU08dKKKAYw8GmNR\nRQA5elIRRRSASkoooAWiiigApcUUUwFCcZNNPWiigQUUUUDGk0CiimhCiloopiCiiigAooooAKKK\nKBBRRRQMKKKKACiiigAooooAKKKKBBRRRQMKKKKACiiigAooooAKKKKACkoooAKKKKAClFFFABTD\n1oopAFFFFIYUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU\nUUUAFFFFABRRRQAUUUUAf//Z', 'asha1', '2016-05-08 16:05:54', 'asha1', '2016-09-08 16:05:54', 'qawsedrftgyh');
INSERT INTO `hm_patient` (`Patient_id`, `PinCode`, `Village_id`, `City_id`, `District_id`, `State_ID`, `Country_ID`, `Card_Type_id`, `Gender_Id`, `Cast_Category_Id`, `Patient_Salutation`, `Patient_FName`, `Patient_MName`, `Patient_LName`, `Patient_DOB`, `Patient_Age`, `Patient_Language`, `Patient_POB`, `Education`, `Patient_BPL`, `Patient_Marital_Status`, `Patient_Contact`, `Address_line1`, `Address_line2`, `Patient_Emergency_number`, `Patient_Ward`, `Patient_Image`, `Created_By`, `Created_Date`, `Updated_By`, `Updated_Date`, `Card_Number`) VALUES
('asha1512', '41001', 2, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Shila', 'Haris', 'Pansare', '1991-09-08', 25, 'Marathi', 'Satara', 'Literate', 0, 'Married', 4294967295, 'Satara paragji app', '', 4294967295, 'Df', '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAKBueIx4ZKCMgoy0qqC+8P//8Nzc8P//////////////\n////////////////////////////////////////////2wBDAaq0tPDS8P//////////////////\n////////////////////////////////////////////////////////////wAARCAPIBRADASIA\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwCaikpa\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigApKWkoASilpKAEpjU+mNQBEetFBooAKKKKACii\nigBKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiii\ngAooooAKKKKACnK2KbRQA5uaQHFFFACls0lJRQA4GjNNpaAJENONRpUtAxhpMUrDFIpoAb0pwNKR\nmgCgAzThTaUUAOAooFBoATNFNNIDSAfRQORRQAUhFLRQA0nFAahhTcUAP3U4GouRSg0ASGkoFFAC\n0hFFLQAwikxTiKaeKYCYpynFIDmnAUALSGiigBtG6nY4qMikBKtOxTENPpgJS0maWgBKKWkoAQik\np1NPWkAopaQUGgBaRqBSnkUANBp9MHFPBzQAhpKU0UAJS0UUAJRQaBQAtFJSigBDRQaTNAC000+m\ntTAFNPqIdakHSgAIptPNNNAAKSjOKaTzQA8UEUiGnGkA0U4U2lFAC0hFOpDQA2ilxRigBBTqbS0A\nFJS0lACEU3FSUhFADRTs0hFJmgB4opBThTAik602nSfeptAhKKKKACiiigAooooAKKKKACiiigC3\nRRRQAtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAlJS0lACUxqkpj0AQ96KO9FABRRRQ\nAUlLRQAlFLSUAFFFFABRRRQAUUUUAFFLSUAFFFFABRRRQAUUtJQAUUUUAFFFFABRRS0AJS0UUAJR\nS0UAJRS0UAJRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAD061LUK9amWgBrU2ntTKBjgaWmUucUAKaQ\nUZzSgUALSZpaaaAF60hFKDTqQDAcU4c0EUAUAFFLSUAIaBQaBQApFN20+igBBQaWkNAAKWkFLQAl\nIwpaQ0wGAc1IKQClpAIaWiigApMUtFADRwadnim45p3agBhbmnq2RUTdaVDzTAlpu7mnDpUbdaAJ\nM5opqmnGkAlLSUtABRSUooAa1CtSt0qPoaYEvWikWloAKKKKAA0lBNAoAKcKbThQA1qSnEUmKQBS\nHpS0hpgNHWpB0po60+gANJilopAMaoz1qU00rQAIakqMDFPFMBDSU40mKAFFFJRQAZpaSjNIAxRR\nmloASkp1JQAUUlKKAEIprU+mNTAAacDTAKU0gGscmm0p60lMQUUUUAFFFFABRRRQAUUUUAFFFFAF\nuiiigBaKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBKKWkoASmPT6jegCKiiigAooooAK\nKKKAEopaKAEopaSgAooooAKKKKACiiigApaSloASilpKACiiloASilooASloooAKKKKACiiigAoo\nooAKSlpKAFpKKKAClpKWgBKKWigBKKWkoAKKKKACiiigBRUqtUNKDigCZjxUR607dxTaBig0hoop\nAKpqTtUXSng5oAWgiiigBKcKTFLQMWkoopiFpKWikA2lFIaBQA6iiimAU006kNACiigUUgCkpaKA\nEopKWgYUUUUCCkNFLQAUhpaMUAMK00cGpaZimBIvSmP1pymgjNADFp/agClIoAQUE0UhoAM0tNFO\nPSkAtMZaUHmnHkUwGIeakqPGDT1NAAaKU0lACEUClooAQ0qmmmlWkA6kpabQAUEUtFACDinU2loA\nKKKKAENAopKAHcUU3NANMB1FJRQAGikNANAC0lOooAbTqSikAtFJRQAUlLRQAA01qWkNAAKQ0ooY\nUAR0lKaSmIKKKKACiiigAooooAKKKKACiiigC3S0lFAC0UUUAFFFFABRRRQAUUUUAFFFFABRRRQA\nUUUUAFFFFABSUUUAJTHp9MegCE0UUUAFFFFABRRRQAUUUUAJRRS0AJS0UUAJRS0lABRS0UAJRRRQ\nAUUUtABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAlFLRQAUUUUAFFFFABSUtFABRRSUAFFFF\nABS0lLQAUtJRQAtFFFAwpymm0opDJKSgUtABRSUtMAooopALRRRQIaaUUhpRQMWiiimIKSlpKAFo\noopAFFFFACUUUUDCiiigAooooEGKKKKACiiigBo4pwNBpmaAJBS01TTqAEoIopaYDAMUtBoFADSO\nacDQRSDrQAppAeadTSOaAH0lA6UUAFFFLQA2gUtFIBe1MNPpjCgAFLTRTqACiikoAdSGiigAFBoo\noAaRSZxT6aRmmAA04UzGKUGkApoFIaF60wFpQaKSgB2KSjNGaQBSUppKBi0UlKKBBSEUtFADRxTu\nopDSZ4pgRnrSUp60lAgooooAKKKKACiiigAooooAKKKKALdFFFAC0UUUAFFFFABRRRQAUUUUAFFF\nFABRRRQAUUUUAFFFFACUUUlABUb1JUb0wIqKKKQBRRRQAUUUUAFFFFABSUUtACUUtJQAUUUtACUt\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUU\nUAJRRRQAUtJS0AFFFFAC0UUUhhSjrSUUASCikFOoAKKKSgBaKKSgY6iiigQ00q0GgUDFooopiCk7\n0tJ3oGLRRRSEFJS0hoAKWkpaAEopaSgAooooAKKKKACiiigApCKUUpoAjzg09TmmEUKcUAS0UgOa\nWmAlJ3p1JikAlJ3p2KaaAHjpSGkBpaYBRTScUA80gHUtNzSg0ABpAaU02gB9JSZpaAG4paWm0ALR\nSiigBKKKTNAC0UUtACUYopaAGtTcU80mKADFKBRRQAUUUUDENIM06igApDRRQAAUHilpDQAA0tIK\nWgQlIadSHpTAiNJSmkoEFFFFABRRRQAUUUUAFFFFABRRRQBbooooAKWkooAWikpaACiiigAooooA\nKKKKACiiigApKWkoAKKWigBKSlpKACo3p9RvTAjooopAFFFFABRRRQAUUUUAFFFJQAtFFFABRRRQ\nAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB\nRRRQAlFFFABS0lFAC0UUtABRRRQMKKKKAHLT6ip60gFpaKKYBRiijNAC0lLSUABoFFAoGOpKWkoE\nFJS0lIBaKKKACiiigBKKKWgApKKKACiiloASilpKACiiigYUUtJQIQ0w1JTSKAEQ1JmogKfQAuaW\nm0tAC0hFGaWgBg60+jFFADWFJTqSgBKUGikoAfSUCigApc0lFAC0lIKdQAlFLSUABpmafTGFAxwN\nOqNTT6AFopKWgBDRRRQAUUUUAFFFFABRRRQAYooooAKQ0tJQAoooopoApD0paQ9KYiI0UUlIQUUU\nUAFFFFABRRRQAUUUUAFFFFAFuiiigAoopaAEpaKKACiiigAooooAKKKKACiiigApKWkoAWiiigBK\nSlpKAENRvUhqN6AI6KKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAo\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAEooooAKKKWgApaSigBa\nKKKACiilAyKQxKeKZSg0ASUUgpaYBRRS0DCkpTSUCClFJSigYtJS0lAgpKWkoAWikopALSUtBoAK\nSiloAKSiloASlopKACiiigAooooAKKKKBhSUtFACYopaKAAUtJRQISlFFFMYtFJRQAUYpaKAEpCK\ndSGkAgpaSloAKKKKBC0UmaKAFpKWkoAKQilooGNxThRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRQa\nKACkpaSgApaSlpoApG6UtI3SmIipKWkpCCiiigAooooAKKKKACiiigAooooAuUlLRQAUUUUAFFFF\nABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACGkp1JQA2mPUlRvTAiooopAFFFFABRRRQAUUUUAFFFF\nABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\nFFFFABRRRQAUUUUAJRRRQAUtJS0AFFKKDQAlLmkpaACnCm0UhgetA60tFADxSimrTqAA0A0UAUAL\nTadSUAFKKSlFAxaSlNJQIWm0tJ3oAWkpaSgBaDRSGgApaKSgApaKSgBaKKSgApaSloAKSiigYUUU\nUAFFFFABRRRTEFFFFIYUUUUwCiiigBaKSloAKKKKQCUUppKACiiigAFFFFABRRRQAUUUUAFFFFAB\nRRRQAUUUUAFFFFMAooopAFLRRQAlFFFABSUtFABRSUtABSN0paR+lUIioopKQgooooAKKKKACiii\ngAooooAKKKKALlFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFJS0hoAQ1G9SVG9\nAEVFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\nAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACUUtJQAUtJS0AFLSUtACUtBozQAUoopKQ\nwooooAcKf2qOnrQAtAoNIKBjjSUtJQISnCm04UALSUtJQAtNp1JQAUnelpO9ADqQ0tIaYCUtJS0h\nhRRRQAlLSUtABSUUUAFFFFABRRS0AJRRRQAUUUUAFFFFABRRRQAUUUUwFopKUUALSGiigBKKKKQB\nRS0lABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRTAKKKKQC0UUUwEooooAKKKKQCUtFFABTX6U\n6mv0qhEdJS0lIQUUUUAFFFFABRRRQAUUUUAFFFFAFyiiigAooooAKKKKACiiigAooooAKKKKACii\nigAooooAKKKKACg0UUANNRvUhqN6BEVFFFAwooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigApKWi\ngAooooAKWkooAWikooAWg0UUAApaSigBaUGm0tAyQc0YpAaXNAC0lLSUgEp60ynigANFBoFMApKW\nkFAAaQdacaTvQAtJS0hoAKKKKQwooooAKKKKBBSUtFAwpKKWgAooooAKSlpKACiiigAooooAKKKK\nAAUUtJQAUtJSigAopaQ0xCGiiloGFFFFACUUUUgCiiigAopaSgAooooAKKKKACiiigAooooAKWko\npgLRRSUAFFFFABRRRSAKSlpKAFpr9KdTHpiGUlLSUCCiiigAooooAKKKKACiiigAooooAuUUUUAF\nFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAIaiepTUL0CI6KKKBhRRRQAUUUUAFF\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUU\nUAFFFFABRRRQAUUlLQAUUUUAFFFFABRRRQAUlLRQAUUUUAFFFFABRRRQAoopKKAHZpymmUoNAySi\nmg0uaACnCm08UABoFBoFABSUtJQAtJS0UAFJS0lABRRQKQBRRRQAUUUCgYUUUUAFFFFABRRRQIKS\nlpKBhRRRQAUUUUxBQKKKQwNFAooAKWkpaACilpKYhDQKKWgYUUUUAJS0UUAJS0UUgCiiigBKKWig\nBKKWkoAKKWigBKKKWgBKWkpaACiiimAlFFFABRRRSASilopAFMen0x6oBlJS0lBIUUUUAFFFFABR\nRRQAUUUUAFFFFAFyijNFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACGonqU1\nC9AiOlpKKBhRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\nRRQAUUUUAFFFFABRRRQAUUUlAC0UlFABRRS0AJRRRQAtFFJQAtJS0UAJS0lLQAUUUUAFFFFABRRR\nQAUUUUAFFFFABRRRQAtKDTaWgY+niogakBoAdQKSlFAAaQUtIKAFooooAKKKKAEopaSkAUUUUwCi\nlpKQBRS0lABRRRQMKKKKBBSUtFAxKKWigApKWimAlFLiigAooooASloooAKKKKBBRSUtIYUUUUAF\nFFFMAooopAFFFFMAooopAFFFFACUtFFACUtFFACUUUtABSGlpKYBRRRQAUUUUgCiiikAUx+tPqN+\ntMBtJS0lMkKKKKACiiigAooooAKKKKACiiigC2KWkpaACiiigAooooAKKKKACiiigAooooAKKKKA\nCiiigAooooAKKKKAENQvUxqGSgRHRRRQMKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAEooooAKKKKAClpKKAClpKKAFoopKAFoooo\nAKKKKACiiloASilooGJRS0lAgooooAKKKKACiiigApaSigBacpplLQMkBpwqIGpAaAHUlFFAC0UU\nUAFFFITQAtFIKKQC0lAooAKKKKACiiigAooooAKKKKACiiigYUUUUCCiiimAUUUUAFFFFABRRRQA\nUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUgCiiigYUUUUAFFFFACUtFFABSUtFACUUtFACUUtJ\nQAUUUUAFRv1qSo360CG0lLSUxBRRRQAUUUUAFFFFABRRRQAUUUUAWxS0lLQAUUUUAFFFFABRRRQA\nUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAhqF6lNRPQBHRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUtJQAUUtJQAUUUUAFJS0UAJRRRQAUUUUAFFFFAB\nRRRQAUtFFABRRSigAopcUYpDEop2KMUAJRS4oxQMTFGKdilxQIZijFPxSYoAZikp5FNxQAlFFFMQ\ntJS0UAJRRRQAopymmUoNAyQGnUwGnCgB1FJS0AFJS0lAAKKKKQAKKKKACiiigAooooAKKKKACiii\nmAUUUUgEpaSloGJS0UUAFFFFABRRRQAUUUUwCiiigQUUUUAFFFFIAooopgFFFFIAooopgFFFFIAo\noooAKKKKACiiigYUUUUAFFFFABRRRQAUUUlABS0lFAC1E/WpKjfrQIbSUtJTEFFFFABRRRQAUUUU\nAFFLSUAFFFFAFyiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBpqF6mNQv1\noEMooooGFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUtFABRRR\nQAUlFFABRRRQAUUUUAFJS0UAJRRRQAUUUUAFFFFAC0tIKdSGJilApcUuKAAClxQKWgYUmKWigAxR\niloxQAlFLRQISilooAaRSEU+kIoAjxTTUhFNIoAbSijFFAgIpKU0lMAooooAcDT1NRinKaBklBpM\n0UAGaKb3pwpALRSUUALRRRTAKKKKACiiikAUUUUwCiiikAUUUUAFFFFAwooooAKKKKACiiigAooo\noAKKKKBBRRRQMKKKKBBRRS0wEopaKACkpaKAEooopAFFFFABRRRQAUUUUAFLSUUDCkpaKAEopaKA\nEopaSgAooooAKibrUtRN1oEJSUtJTEFFFFABRS0UAJRRRQAUUUUAFFFFAFyiiigAooooAKKKKACi\niigAooooAKKKKACiiigAooooAKKKKACkpaSgBDUL1K1QN1oASiiigAooooAKKKKACiiigAooooAK\nKKKACiiigAooooAKKKKACiiigAooooAKWkpwpAGKSpNtNxQA2inYpMUANop2KQimAlFFJQAtFFFA\nCUtJRQAUUUUAFFFFABS0lLQACnCkFOApDFFLRS0DClpKWgAopaKBBRS0UAJRS0UAJRS0lABRS0lA\nDSKaafSEUAR0lPIppoAbRRRTEFFFFABSg0lFAEgNLmmA06kMKUU2nCgBaKKKAFooooAWkoooAKKK\nKACiiigAooooAKKKKACiiimMKKKKQBRRRTAKKKKACiilpCCkpaSgAooooAKKKKACloopgFFFFABR\nRRQAUUUUAJRS0lABRRRQAUUUUgClpKKBhRRRQAUUUUAFJS0lABRRRQAVE3U1LUR60xCUlLSUCCii\nigAooooAKKKKACiiigAooooAuUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAlFL\nSUANaoG61O1QN1oASiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAW\nlFJThSAeOlIaUdKQmmAlFGKKAEpCaU000AJRRRQAUUUlAC0lFFABRRRQAUUUtABRRTsUhgKcKTFK\nKBi0tJS0ALRRS0AFLRRQIKKKKYBRRRSAKKKKACkpaSgApKWkoAaaaRUlIRQBERSU8imUAFFFFMQU\nUUUAKKdSAcU6kMSnCjFFAC0UlLQAtFIKdTAKSlooAKKKKACiiigBKKKWkAlFFFABRRRTGFFFFIAo\noopgFFFFABS0lLQIKSlpKQC0lFOAoASilpKAClpKWmAUUUUAFFFFABSGlpDQAUUlLQAlFFLQAlFL\nSUgClpKWgBKKKKACiiigYUlLRQAUlLRQAh6VCetTHpUJoEFJS0lMQUUUUAFFLRQAlFFFABS0lFAB\nRRS0AW6KKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKSgBrVA3Wp26VAetACUU\nUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABThTactIB4pDS0UwEoNF\nIaAENNpTSUAJRS0lABRRRQAUUUUAFFFFABS0lLQAopwpopwpFC0tJS0AKKKKKAFpRSUUAOopKWgQ\nUUlANAC0UUUAFFFFABRRRQAlFFFACUlLSUAIRUZ61KaYwoAZRRRTEFFFAoAeKWm0oNIY6iikpgKK\nWkFOFIApaSimAtFFFABRRRQAUUUUAFFFFIApKWkoASloooGFFFFAgooopjClpKWgQUUlLQAUlLRQ\nAYpaSloAKSlooAKKKKACiiigAooooAKQ0tJQAUUUUAFFFFABQaKSkAUtAooAKKKKACkpaKYCUUUU\ngCiiigBD0qE1M3SoaYBSUtJQIWkoooAKKKWgBKWiigBKWiigBKKKKALlFFFABRRRQAUUUUAFFFFA\nBRRRQAUUUUAFFFFABRRRQAlFLSUAFFLSUANaoD1qdulQN1oASiiigAooooAKKKKACiiigAooooAK\nKKKACiiigAooooAKKKKACiiigAooooAKeKZTgKAH0UCigBD0pppxpKAG0lOxRigBtJSmkoAKKKKA\nCiiigAoopaAClFJTqQ0Ap1JSikMWiiimAtFFLQAUUUUALS00U6gQhpKdTaAFpaQUtABRRRQAUUma\nM0AFFGaTNABRSZpaAEpCKdSGgCIikqRhUZpgFFFA60CHYpcU4dKMUhgBS4oFLTASloooAWkpaKAC\niiigAooooAKKKKACiiigApKWkpAFFIKWgAooooAKKKKAClpKKYC0UlLQAUUUlAC0tJS0AFFFFABR\nRRQAUUUUAFFFFABSUtJQAUUUUAFFFFABSUtJSAKWiigAooopgJS0UUAJS0UlABRRRSARulQ1K33T\nUVMApKWigQUlLSUAFLRRQAlFLRQAUlFFABRS0UAW6KKKACiiigAooooAKKKKACiiigAooooAKKKK\nACiiigAooooASiiigBrdKhfrU5qB+tADaKKKACiiigAooooAKKKKACiiigBaSloIoASiiigAoooo\nAKKKKACiiigAoopaAEp602lFAD6KBRQAlJTqSgBKWjFB4oAjPWkpTSUAFFFFABRRRQAtFFLQAClp\nKKQxc0uabRQMXNLmkApQtABuo3Uu2kK0ALupQ1RkUUASg0uaiBpQ1AEuaSmg0tACigmimmgB26ml\nqSmmgB2+jdTcUoFAC5opQKWgBtANOpMUALmim4pRQApqJhg1LTHFMQylFJQKBEopaaKdSGLRSUtA\nBRRRTAWiiigAooooAKKKKACiiigAooooAKKKSkAUUUUAFFFFABRRRQAUUUUwFopKWgAooooAKWkp\naACiiigAooooAKKKKACiiigApKWkoAKKKKACiiigApKWkpALRSUtABRRRTAKKKKACkpaSgAooooA\na3SoqlfpUVABRRRQIKSlooAKSlooASilooAKKSigApaKKALdFFFABRRRQAUUUUAFFFFABRRRQAUU\nUUAFFFFABRRRQAUUUUAJRS0lACHpUD9anbpUD0ANooooAKKKKACiiigAooooAKBRRQAuKTNOpCKA\nEooooAKKKKACiiigAooooAKKKKAFpRSUooAfRQKKACkpaKACkNLRQBHtpDUlRnrQAlFFFABRRS0A\nFLSUtIYUUtGKAEooooAcKXNMzSgUAOzRmmHigGgB56UzFLQKAEop2KTFAxymnCoxUgoAdTTTqaaB\nDTRQaTNAxaKBQeKAFzRmmg0hNAh+aWowacDQMdRQKWgBKRhxTqQ9KBENFB60UxDgakFRCng0DHUt\nJS0AFFFLQAUUUUAFFFFABSUtJQAtFFFABRRRQAUlBoFIAopaSgAoopaAEooooAKKKWmAlLRRQAUU\nUUALRRRQAUUUUAFFFFABRRRQAUUUUAFJS0lABRRRSAKKKKYBSUtJSAWikpaYBRRRQAUUUUAFFFJQ\nAUUUUgGv0qKpH6VHTAKKKKBBRRRQAUUUUAFFFFABRRSUALRRRQBbooooAKKKKACiiigAooooAKKK\nKACiiigAooooAKKKKACiiigApKWg0ANNQt1qVqhegBKSiigAooooAKKKKACiiigApR1pKBQA/FNJ\npwOaRhQIbRRRQMKKKKACiiigAooooAKWkooAWlFJSjrQA+igdKWgBKKWkoAKKKKAENRnrUhqOgAo\noooASlpKWgBRS0gpaQxQKWgUtIBhptSEU0rTAbUi0ylBxQA5xxUdP60mKAAU7FAFLQMaaKXFBFAD\nRT1puKcKAH0hpaQ0CGGm96kxSFaBgtDdKQcUUANpKfikxQAhoGc04LTgtAAKWlxRQISkNLSGgCI9\naSlbrSUwFp600CngUAOooooAKWiigAooooAKKKKACiiigAooooAKKKKAEopaSgAooopAFFFFABRR\nRTAKKWkoAKWkpaACiiigBaKKKACiiigAooooAKKKKACiiigApKWkoAKKKKACiiigApKWkpALRRRT\nAKKKKACiiigApKWkoAWkoopAMfpUdSSVHTAKKKKBCUtFFABRRRQAUUUUAFFFFABRRRQBbooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACikooAWkNLSGgBrVC3WpWqFutACUUUUAFFFFABRRR\nQAUUUUAFFFFADgKCacOlNYcUANooooAKKKKACiiigAooooAKKKKAFpy0ynKeaAH4opaKAEpaKKAE\npaKKAEqNhg1LUb0ANooooAKKKBQAopaSlpDHClFIKUUDFoIpaKBDNtJtqTFGKBjAKUCnYooATFLi\niigQlJS0lAxKUUUCgB4ooFFAhKKWigBMUYpaWgBm2l206igBMUUtFABSUtJQAUhpaQ0ARN1pVFKR\nSgUAKBTsUgpaYBSUtFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSUtJQAUUUUgCiiigApaKKYBR\nRQaACigUtABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAAaSiigAooooAKKKKACkpaSkAtFFFMAoooo\nAKKKKACkpaKAEooooAZJUdSSdqjoAKKKKBBRRRQAUUUUAFFFFABRRRQAUUUUAW6KKKACiiigAooo\noAKKKKACiiigAooooAKKKKACikpaAENJS0lACig0CigCN6hPWpnqLvQAUlLSUAFFFFABRRRQAUUU\nUAFAoooAk7U1jThzTWFAhtFFFAwooooAKKKKACiiigAooooAKeoplPQ0APopaSgAooooAKKKKAEz\nUbHJp79KjoAKKKKACiiigYtLSClpAKKcKYKcKQx4opKUUwFooooAKKKKACkpaKBDaSlNNNAwpRSU\nooAeKKBRQIKKKKAFooooAKKKKACiiigApKWkoAKSlpKADFFKKaaAHClpgNOBpgLSUtFACUUUUAFF\nFFABRRRQAUUUUAFFFFABRRRQAlFFFIAooooAKKWimAUUUUAFFFFABRRRQAUtJS0AFFFFABRRRQAU\nUUUAFFFFABRRSUAFFFFABRRRQAUUUUAFJS0UgCiiigAooopgFFFFABRRSUALSUUUgI5OtMp8nWmU\nwCiiigQUUUUAFFFFABRRRQAUUUUAFFFFAFuiiigAooooAKKKKACiiigAooooAKKKKACiiigApKWi\ngBKKWigBKKKKAGPUHep36VD3oASilpKACiiigAooooAKKKKACiiigBy9KC2RQpoYcUANooooAKKK\nKACiiigAooooAKKKKACnLTacpxQBIKKM5ooAKKM0UAFBopCaAGMe1NoJyaBQA4Dimmn54ph60AFF\nFFACilpBS0hhSg0lAoGSClpopaAFpaSloAKKKKACiiigQ002lY0goGGKVaDQDzQA+lpBS0CCkoJo\noAKWkpaACiiigAooooAKSikoAKKKUUAFBpaKAGYpRS4opgKKWkFOoAbikp9NNACUUlLQAUUUUAFF\nFFABRRRQAUUUUAFFFJQAUUUtABRRRQAlLRRQAUUUUAFFFFAC0lFFABRRRQAtFJS0AFFJRQAtFFJQ\nAtJRRQAUUUUAFFFFIAooooAKSlooAKKKKACiiimAUUUUgCjFFFACUUtFAET9aZT5OtMpiCiiigAo\noooAKKKKACiiigAooooAKKKKALdFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFJ\nS0lADH6VCetTNUJHNACgUhpelIaAEopaSgAooooAKKKKACiiigAp27IptFABRRRQAUUUUAFFFFAB\nRRRQAUUUUAFFFFADlbFO3VHRQA/NKDUdFAD80hNNooAKKKSgBc0UUCgAop2KaaQBS0lLQMKKKKBj\ngacKZThSAdS0lFADqKSlpgFIxpaQ0CIieaUHFBWjFAxC1ANGKMUAPBp2ajAp+KAELHNAal280baA\nHClpBS0CCiiigApKWkoAKSiigApwptOFAC0UUUwEooooABTqbS0ALSGlpDQIZS0UUDCiiikAUUUU\nwCiiigAooooASilooAKKKKQBRRRTAKKKKACiiigApaSigAopaSgApaSloASiiigAopaSgAooooAK\nKKKACiiigAoopaAEoopaAEooooAWkpaKAEopaKAEpaKKAEpaKKAEopaKAIZOtMp7/eplAgooooAK\nKKKACiiigAooooAKKKKACiiigC3RRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\nRRQAx+lQnrUz1C1ACUUUUAFJRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA\nUUUUAFFFFABRRRQAUUUUAJRRRQAtA60lKKAJKa1Lnimk0gEpaSlFAwooooGLSim04UAOFLTadQAt\nFJRQAtFFFACUmKWkoAMUoFFKKAExTqKKACiiigApaSloEFJRRQAUUUlAwooooAKWkooEOozSCg0w\nFopBS0CCiiigBwoNIKWgBhop2KTFAxKKWigBKKWigBKKWigBKKWigBKKWigBKKWigBKKWigBKKWi\ngAooooAKKKKACiiigAooooASloooAKKKKACkpaKACiiigAooooAKKKKACiiigAoopaAEooooAKKK\nKACiiigAoopaAEoFLRQBA/WmU9+tMoEFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAW6KKKACiiigAo\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAGPUVSvUPegAxSGnUhFADaKXFJQAUUUUAFFF\nFABRRRQAUUUUAFFFFABRRRQAUUUYoAKKMUuKAEopcUYoASilxRigBKKXFGKAEopaSgAooooASiii\ngAooooAXNFJRQAtKKSgUAOpKKKQwpwptLQMdS02lpALmlpKKYC0UmaaTQA7NJmmZpaAH5pQajzSh\nqAJM0UwNS7qAHUUzdS5oAfRSA0tABRRRQAUlFFABRRRQAClxSClzQIUUGkBoNMApaBRQIKKWkNAB\nTqaKdQAUlLSUAJRS0lAwoopaAEoopaAEoopaAEopaKAEoopaACiiigAoxRRQAUUUUCCiiigYUUUU\nAFFFFABRRRQAUUYpaAEooxRigQlLRilxQA2loxS0DEopcUYoEJRS0UAJRS0UAJRS0UAJRilooASj\nFLRQAmKMUtFACUuKKKAK79TTKe/WmUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAW6KKKACiiigAo\noooAKKKKACiiigAooooAKKKKACiiigAooooAKQ0tFADGqIipWqOgBBThSGkpAKRmmEYp9BFAEdFO\n20mKAEopaSmAUUUUALRSUUALRSUUALRSUZoAWikzS5pALSUZozTAWiiikAUUlLQAlFFFABSUUlMB\naSiigAooooAKKKKACiiigBaKKWkAUUUUDClpKKAFzSim0ooGOooooAKTGaU0gNAC7aNtGacKAG7a\nTbUtFAEYWjbUmKMUAR7adinUlACYoFLRQAUUUUAFFFFABRSUE0CFFBpAadigBtGadikxTAVTS0zG\nKUGgB1BooNAhBTgabRQA+kpKWgBKKWlxQA2ilxS4oAbRTqKAEopaKAEopaKAEoopRQAlGKWigBMU\nuKKKADFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB\nRRRQAUUUUAFFFFABRRRQBXfqaZT36mmUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAW6KKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAGPUOeambpUOOTQAuaM0Y4pDSAUGlzTKKA\nHUYptLmgAIptLuozQAlFOpKAEopwFLimAyinYoApAJikqQLQVpgMxRilxTgKQDMUYqXFNIoAZS0u\nKTFABikp46UjUAMNFFJTAKKWigBKKKKACiiigAoopaACilxSYoAKWkoxQA6ko6UUhhRSUtABQKKK\nAHClpBS0hhTTTqTrTAQGnBqTbSYxQBIGpc1GM0vNAD80ZpnNLQA7NJSUtAC0UUUAFJS0lABRRS0A\nFNNOooERg4NSqcioyvNOXigCTHFJinCimITFMPWpO1M70APHSkNKKKAExSU6g0ANpaKKAFFFFFAB\nRRRQAUUUUAFFFFABRRRQAYooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK\nKKQmgBaKQUtABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUHpRSHoaAK79abTmptABRRRQAU\nUUUAFFFFABRRRQAUUUUAFFFFAFuiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACi\nikoAa1RHrUrVFQAmaTNO20m2kAlFLilxQMbSU/bSbKYhtFO20oFIY3BpQuafigUAKFoIxSg0E5pi\nGYpcUUtIYClpKKYCEUClooAUGkaigikAyloxRQAmaaTmlNNoEFFFFMApKKKACiiigAooooAWlApM\nU4UgFppp1GKAEUZp4XikAxTxQMQrUbDFTVG4pgR0UUUALRSUUgHClptKDQA6lApoNOFAxcUYoFLQ\nAYo20tFABijFFLQITFFFFACUUUUDCkopQKADFFLSUCCiiigBcUhHNOFFAApp1Npc0xCmmHrTiab3\noAcOlLQKKACiiigBKWkpaACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiimnN\nADqKaDTs0AFFFJQAtBNJRQAuaKSigAzS5ptBNACk03NFFADhS0CigAooooAKSlxRQAUUUUAFFFFA\nBRRRQAUUUUAFFFFABSHoaWkboaAK7U2nN1ptABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAFuiiigA\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBjdKjxUrdKjFACikp1IaQxKMUUCgA\nxRThQRQA2lC02nigBCKSn000wAUuKaKdSAaRRTjSUAFFGKTvQA7FIwpwoIpgMFPFNIoBoAUimsMV\nJ2qJjSAZRijvSnigBpooopiCiiigApKWigApQKMUopAAoop6igYgHFOp2MCmE80ALilxSA807NAC\nE0080E80ooAiPBpKc/3qbTAKKKKAClpKKQCg04GmUuaBkgNLmowadmgB+aM00GjNADs0uaZmjNAD\n6TNNzS0ALRRRQAYpaKKBBSUtJQAUtJQKAHUUUUwCmNxUlMagABpwqMU7OKAJKKYGpc0AOopM0UCF\nopKKAFopKWgAoopKAFopKWgAooooAKKKKACiiigAooooAKKKKAEopaSgBaKKKADFJS0lABRRRQAU\nUUUAFFJRQAUlLSUAFKKKBQA6iiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKRvumlpH+7\nQBXam0rUlABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAFuiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACkpaSgBG6VH3qQ1HjmgBaWkopDENFLRQACgmg0maADFOFIKdigBM0hoNN70AK\nKWgUuKACgUlKKAFphqSmHrTAFNPpgpwNIBCKSnGmmmAZ4qMnmnE0wdaQCikandqYaACiiimIKKKK\nAClAoAp1IAooooGFOU02kJoAlLDFRMeaQk0lMQu7FLvNNooAXNKGxTaKAFY5NJRRQMKKKKACiiig\nAooooAKWkopALmlzTaUUDDNOGaAtOAoAAKWilpAFFFFMBaKKKBBRRSHpQAmaetQ96lU0AOpKM0tM\nBKa1PprCgBlLSUUDFpabRQA4GnA0yigRJRTAacDQAtLSUtAhKWiigAooooAKKKKACiiigAooooAK\nKKKACiiigAoopKACiiigAJpM0hpKBj6KQGigBaKKKAEooooAKSigUCFoFFAoAdRRRQAUUUUAFFFF\nABRRRQAUUUUAFFFFABRRRQAUUUUAFNf7tOpsn3aAK5pKU0lABRRRQAUUUUAFFFFABRRRQAUUUUAF\nFFFAFuiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACkpaSgBDTKeaSgBMU2pKYet\nAwFLSCnUgENMqQ0ygBy06mKafQA1qZUjVGaAHCnU0U6gBppVpGoFAD6YadmkoAMUUopCKAFpCKBS\n0wI2pgp700UgFPSmVIelR0xBRRRQAtKBQBTqQxKKDQKAFpKKRulMQE02iigAooooAKKKKACiiigA\nooooGFFFFABRRRQAUUUoFIBKUCnBacBQAwLT8UUUDCiiigBaUUlLSAKKKKYBS0lFAhaQ0UpoAZTx\nTO9PFADqSlopgJSE06o2PNACUUUUhhRRRQAUtJRTAWiiigBwNKDTKWgRJRTAacDQAtFFFAgooooA\nKKKKACiiigAooooAKKKKACiikoAKKWkoAQ02nGm0AApwptOFAxaKKKBCUUtFADTRRRQAtA60UCgB\n1FFFABRRRQAUUUmaAFooooAKKKKACiimOeKAHZpc1CpzT80APooFFABTZPu06mSfdoAgNJSmkoAK\nKKKACiiigAooooAKKKKACiiigAooooAt0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\nRRQAUlLSUAIaQUGgUALTTT6YaAEFOFMpwpDFNMpxpAKAAU4GkxQKABqb3pxpo60AOxRS009aAFox\nSCn0ANoFBooAdSGlFFADaAaU02gAYcVH0NS1G4xQAZ4phGKUU4jIoEMooNFMBwNOFRing0hi4pMU\nuaaWpiAnHSmk5oooAKSlooAKKKKACiiigAoopRQAlFFFABS4pKetIYBc0oSniloAj20YxTyKQikM\nQUtJS0AFFFJQAUUUooAWiiimAUUUhOKAAnFIDmk609RxQA4CkNLTWoEIBzThTRS0APopKKADNRnk\n081HQMWiiigAooooGFFFFAhaKKKYBRRRQIKUGkxRigB4anA1HS5oAfRTQadmgQUUUUAFFFFABRRR\nQAUUUUAFJS0lAC0UUUANNNNONNoABThSClFAxaKWkoELSGiigBtFFFABSikpR1oGOoJoqNmoEPzS\n5qLNKDQMe3Sot3NPJ4qI9aBEoPFLmowaUGgZJmjNMzS5oAWmvS01+lAhq9akFRKeakzQA8UtItLQ\nAUyXpTqZL0oAhNJQaKACiiigAooooAKKKKACiiigAooooAKKKKALdFFFABRRRQAUUUUAFFFFABRR\nRQAUUUUAFFFFABRRRQAUUUUAFJS0lADWoFKaaKAHU00tFAxMUlOpDSASlFJThQAGm0+mmmAhoHWi\ngCkA+mNT6aaAEWn0wU+gBDSU6kxTAUUUCigBDSGnUhFIBBSMMilooAh6GnZ4pGHNKBTAaaSlNJQI\nKKKKAFzRSUUAGKKWkoAKKKKACiiigAoooxQAU7tSYp2KQxlFLjmkpgFOWkopDJVp1MU08UCCkNOp\nKAG0UppKQwpDSmm0ALS0gp1ABRRSE0wBjim9aXGacBQAKKdSUtAgph60pOKQc0ALSDrSNxSpQA6l\nopKAA1H3p7GmigYUUYpcUAJRTsUYoC42lxS4ooEGKMUtJQAUtFFABRRRQAUUUUAFKKSigQ7NLTaU\nGgBaKKKYBRRRQAUUUUAFJS0lABRRRQAhptONNoAKcKbTh1oAWiiigAopaQ0ANooooAKKKKAHZqJ+\ntPzUbHmgYopc0ylpAKTTaU0w0APFLTAaXNADqXNNozQA8GkbpSZoPSgCPvUgqM9aetMCVadTVpaB\nBUctSVHL1oAhooooAKKKKACiiigAooooAKKKKACiiigAooooAt0UUUAFFFFABRRRQAUUUUAFFFFA\nBRRRQAUUUUAFFFFABRRRQAUlLRQAhpuKcaSgBtKKDQKQxaQ0tIaYDacKSgUgHU006g0xDKUUYoFI\nY6kIpaKYDQKdRRSAKSlooATNGaKSgBc0ZpKKACkpaSgBppRQaZmmAMOabSk0lABRRRQIKKKcBmgY\n2inEcU2gAooooAKXFApwFADcUooNKKQB0oBoYU0cUASU09aTcaQHmgB+3NNIxTweKU0AMWpAajNO\nU0DJKKKKBCGkpaQ0AIaSg0oFAxRQaWmmgBM0oGaAKUCgBQKWkzRmgQUZpKQmgBrHmnqOKYBk1J0F\nAEbHmnp0qPq1SrwKAFpKKKAENIBSmigAooooAWikooAKKKKACiiigBaKKKBBRRRQMKKKWgQUUtFA\nCUtFFAC0UlGaAFooopgFFFFABSUtFACUtJRQAhptPNMoAKcKSlFAC0tFFABSGlpDQA2iiigAoooo\nAaaYaeaYaBhQKSlFIBc8U2lNIKAFApcUUUAFFFFAC0Yope1AEbdaVaRutKtMCVadTFp9ABUcvWpK\nil60CIqKKKACiiigAooooAKKKKACiiigAooooAKKKKALdFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\nFFFFABRRRQAUUUUAFFFFACUlLSUABpKWkoGLQaKKAEIpMU6jFIAFFFFABikxS0UwCiiigAooooAK\nKKKAENJTjTaQBRRRQAUlLSGmAxjTacaQUANop+KSgBKKKWgYlSRKGWmEVLD900CYxhhiKZipGBLH\nimUANopxptACipFqKpFpDEbrSrSt0pq9aAHMOKj71KelR4+agQbTTasL0qJxzTAQGnA0wUtIZJim\n9DSBqdjNAhytTqi6GnZoAcTTSaSlxQMQU8UzpTh0oAdTWpc00mgQq0ppAaKACiikoAKQ0tIaAFXr\nQxwKVabJQA1RzUw6VHGKkoASiig0AJRRRQIKKKKACiiigAooooAKKKKAClopaBiUuKKWgAoopM0A\nLSUZpM0ALmikpKAHUUUUALRRRQAtFJS0CCiiimAlLRRQAhplPNNoAKUUlKKAHUUUUAFIaWmmgBKK\nKKACkNFFADTTDTzTD1oASnCm0opDFNIKDQKAFooooAUUUUUAFOFNpwoAY3WhaV6RaYEgp9MFPoAK\nil+9UtQy9aBEdFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAFuiiigAooooAKKKKACiiigAoooo\nAKKKKACiiigAooooAQmkzQaKAHUUgpaAEpKWkoAKKKWgYlFLRQAlFLSUALSUtFIBKWkopgFFLRSA\nSilopgFFJS0AJRilpKQDaKdRQA0nFN60NQtMYFabipaYaBCAUEUopaBkeKUUpFNNAC1JD900qYK4\npUG3NAgXqaQKMGn0UCICh25pmKskYXFQUwQ3FPWkoB5pFDjTelPFNYUgHA8UjCkU0/rQA0NSEZpD\nwaetADduKD0p1IaBDO9SDpUfepB0pDENApTSUALSE4paQigBo5NSVGOtPPSmAmaWkHWnUCCikooA\nKKKKACkpaKAF7VG3Jp5poHNAD0HFOpBwKKBBQaKSgAooooAKKKKACiiigAoopaBhS0UUAFFFFABR\nRTSaAFzSZpOtPAoAQClxS0UwCkxS0UCGmlFLSYpDFpKKKAClpKWgBaKSloEFFFFMANMp9MoAKUUl\nKKAHUUCigAppp1NagBKSiigApCaKSgBCaYacabQAU4dKbTqQxDSCg0CgB1FFFAC0UlLQAU9aYael\nADZBxTF61LJ0qJetMCUU8VGKkFAC1BL1NT1BJ96gRHRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\nRQBbooooAKKKKACiiigAooooAKKKKACiiigAooooAKQ0tIaAEopKWgBRS0gpaAEooooAKKKKBhRR\nRQAUUUUAFFFFABSUtJQAtFFFIAooopgFFJRQAtFJS0AJSMcCnVE5oATqacKYtPoGOprClFKaBDKW\nikoGBppp9NNAAp2nNT1XqWNsigTH0UUUCGscCosU+Q84pooBCYpKfimMKBjlpTTFp9IY3vThSGgG\ngAIoHFO7U1utAC0GkU0tADMUvSnUYoAQGlpMUopALSHpS0UCGAc06lpDTASlpBS0AFFFFABRRRQA\nlKKQ0LQAOcUJSP1pY6AJKSlNJQAlFFFAgooooAKKKKBhS0UCgApaKKACikooAKWkopABptOpCKYA\nKfTOlOBoAWiiimIKKKKBhRRS0CGUtDUgpDFopaKACiikoAdQabSnpTEJmios81IDxQMKKKKADNKD\nSUCgB/ao2p/amsKBDaKWigBKKWkNAxCM0mygnFKGoAYRiinnmmkUgCkxSijFACUtLikoAKWiigAp\n6UynKaAFfpUS9akfpUa9aYEtOU0ynLQA6oH6mp6gk60CGUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\nAUUUUAW6KKKACiiigAooooAKKKKACiiigAooooAKKKKACkNLSHpQA2iiigBwpaQUtACUUUUAFFFF\nAwooooAKKKKACiiigApKWkoAKWkopALRSUUwCilooASlopKACon61I3SojzQACnU2gGkMeKdTRTg\naAGkUlPNMNMAzSGlFLigBlKh2tmgigUAP80UeaKjNC9aBWHHls0oFKKKACmNT6QjNIBgNPFMIxSg\n0DFNAoooAcKRhSA06mAwcU4UjDmkBpAPpKWkoAKWkoJoAWkJpCaSgAzS0lJmgB2aAaZSigB9FNzS\ng0CFoooNADSeactM70/tQAxuTUijimAfNUg4oAKKKKBCUUUUDCiiigApaKWgBKWiigApKKKQBRRR\nQAUUUUAFFFFABik6U6kpgKDS02jNMB1FJmlzQAUtJQTQAhpo60poAoAWlpKKQC0hNITQOaAFFB6U\nooIpgQnrTl6UMKQUAOooooAWgUlFAD+1NY0UhGaAEzRmjFLigBM0hNKajJoADSCiikA4Glpop1AC\nilApBTqADFJilooAaabTyKbQACnCkAp4FAEbU0dakccVF0NAD81IlRZp8ZoAlqu/Wp81XfrTENoo\nooAKKKKACiiigAooooAKKKKACiiigAooooAt0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFBo\nooAYaKU0lADhS0gpaAEooooAKKKKQBRRRTGFFFFABRRRQAlFLSUAFFFFIAooopgFLSUUALSUUUAN\nfpUVPc0ygBDSjrSUCgZIKUUgpaAH01hSig0ANFLRiigBDTaU000AKaaOtLmkoAkBp1RqaeKQgNJS\n0lMBGpoNSdRUbDmkA4UGkFLQMKcKbSigBSKjPFS0wigAU0tNFBNACk0lFIaACjNJmigAPNFFLTGF\nFFFABRRRQIUGlJptNNICRaU0idKVjQIFFOpF6UtABRRSUAFFFLQAlLRS0AFFFFABSUhNJmgB1FID\nS0gCiiigAooooAKKKKACiiigBaaadRQA2lzQRSYpgLuooApaADFFFFABRRRQA1qVaCKRaAJKSlpp\npgBFMIxTxQRQAwUtJjmlFIAoopG4pgKKdiog3NSA0AFFFFADWqM1KajIpANop2KQigBKM0uKXZQA\nKeaeKaFxS5xQA6lpgOTT6AENMpxNJigBRS5pKSgBWPFRHrTyaZQAVIlRVIpoAkzxUBPNTZ4qA9aY\nBRRRQIKKKKACiiigAooooAKKKKACiiigAooooAt0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\nFFFFACGm04000AKKdTRS0DCiiigQUUUUgCiiimMKKKKACiiikAlFFFMAooopAFFFLTASiiigApD0\npaa5oAibrQOlHU07FADDQKUikoGPFOpop1ACinUynCgANIaU02kAUhHFLQaYEfel7UjdaBQADrUq\nniojTlNICSkxS0UxCYprCnUUAMpaCOabnFADjQOtNzzThSGOqNjzUg6UxxTAAaDTRRmkAuaQmijF\nMYUYopaACiiigAooooAWkopaAENNpxpo60CJU6UjdacvSgigQL0paBRSAKSgmgUAApaKWgAoopKA\nDNITQTTcZpgB5opwWl20AMpQadijFIBM0tNIoBpAOooooAKKKWgAopKKAFooooAKKKSgBaKKKACi\niigAooooAKSlpDTAcKQikBp1MBBS0UUANNAoNFIBaY44p9NfpTAh71ItM709aAHUUUUAFJinUUgG\n4oxS0UAAFFLRQAh6VGTUjdKiPWgBwp2aZmjNAElApgNOBoAdTDTqBQAwimHrUxHFQt1pgJT1pgpw\npAPJ4qKnGm0wCiiigQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQBbopKKAFooooAKKKKACiiigAooo\n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\ntMBKM0UYoAUGlpBS0AFJS0lMAopaSgBaQrxS0UgIiKeBkUpFLTAjZKbgipqbigCMZpwYin7aTaKA\nE3E00gk1JijFADACKa1TAUFc0AQUVMUppSgCM0lPdcUygQUUUUAFFFFABRRRQAUUUUAFFFFABRRR\nQAUUUUAWqKKKAFooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACkoooAQ0lLRQAlKKSikM\ndSUUUwCiiigAooooAKKKKACiiigAooooAD0qBzUrGoT1oEFFKBSleKBjKctNpRQA88io6kppoAbS\nikooAeKcvWmCpFFAxcUUtNNAh1IRRmjNADO9LmlxmlxigBlBHFOpKAI+lPU0hWkBoGSUhFApaBEf\nSnA5pW6VGOtAEtBNC8ikNACHmm7afRigCPpTlNBFNoGS0xhTgaCM0AMFLSEYNGaBhS0lLQAUUUUA\nJRRSrQA9RTqQdKKBBQKKWgBrGmig8mgUDCiiigAooooAKKKKAEopaKAEooooAKM0UUAOU8UuaYKX\nNSA8Uppimn0CIz1qQHio2605DQA+mGn000ANzS54pcUUAJjNLigUtAAKWkooAWmMKfTWpgKnSnN0\npFpaYiPFLilxSgUAKKaadTD1pAOFFAooAKKKKACkNGaKAEooopgFLRSUAFLRRQAUUUUAFFFFABRR\nRQAUUUUAFFFFABRRRQAopaQUtABRRRQBHN0FQ1NLUNAgooooAKKKKACiiigAooooAKKKKACiiigA\nooooAtUUUUALRSUtABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAlFFFACUUtJQAhopaSgYCl\npKUUgCiiimAUUUUAFFFFABRRRQAUUUGgBjGmEU8im0ANHBpxbNNIoxQAlOWkpAeaAHmm0/qKjPWg\nANJThSUAOQVIKjSnlqQxSaTNNySacBQAU00+mGmAqmnUwU+gBpFKKDSZoAcRUTDBqUU1xQIap4p/\nUVF3qVelAxMU0jFPpduRQIjU0+ozwaepzQMKWg0lACGmEVJTWoARTinbqjpy0AKwpop56Uw9aAHU\nUgpaBhRSUtACU5abT1pAPpDS000xCig9KBTXNACUUgp1AxKKKKACiiigAooooAKKKKAEpaKSgBaS\niigAoNFFIBAcVIpqOjOKAFfrQlNJyaVTg0CJSabu5pMmm96AJQaKRelKaQAKWmg06gAoopaACkNL\nSUAIDzT80w0A0wH0U3NGaYhTTKdQBSAUUUUhNABmlxSCn0AMxRTiKYaYBRSc0UAOpKSl5oAKWmc0\nc0APopnNHNAD6M0zmjmgB9FN5o5oAdmjNNwaMGgB2aKbinAUAFFLijFAAKWiigAooooAjm61DUs3\nWoqBBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQBapaSloAKKKKACiiigAooooAKKKKACiiigA\nooooAKKKKACiiigApKWkoAKSlooASg0UUAJQKDSUhjqKQGloAKKKKYBRRRQAUUUUAFIaWmMeaAFp\nr8U4HimsaQEeaUGkopgKaSlooAeOlMYc5py0MOKAGClpDRQAoo5pV5p+BSGNWnk1ETg1IORTAAaU\nikxzS0AMPBpQaQ9aUCgBTzTTxTjTSKAFVqU800DFPoAiYYpymhxTRwaBEoozSDpQaAGuM00cGn0x\nqBkmeKQ0xTzUlACAUjCn000ARUopSKSgQop2M0wGng0DG9KWkPJpRQMSloIpKAAVIKYKkFIQUlKa\nQUwFph5NPJ4qOgAApaKKBhRRRQAUUUUAFFFFABRRRQAUUUUAJRRRQAUUUUAFIaWjrQAylFKRTaCS\nZcYpjDmlU8UjGkMfH0pW6U1DgUrGkADrTqatOoAKWkooAKKKKAENIBTqKADFLRRQIKKKKACmN1p9\nMamA9aXNItDdKYC5pMUi06gBMUYpaKAExRilooATFGKWigBMUYpaKAExRilooATFGKWigBMUYpaK\nACiiigAooooAKKKKACiiigCKXrUVSy/eqKgQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAWqK\nKKAFooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiikoAKKKKAEooooAKQilooGNpwNNN\nApAOooopgFFFFABRRRQAGoyKkppFADR0pjHmpQtRyDFAADQRTaXNABRSUUAPWhulC0PQAzNJRRQA\nq9alHSol61MOlICNhzTkOBTX60qrTGOJooxS0ANpRQaKQC0UgpaBDDQGpzCoyMUwJOtMYU5TTsZo\nGMU0pOaY3Bpyc0AKKUgYpaaaBEZ4NODUEU3pQMlXmlIpqHinE0AMNMqQ03bzQA2lxS4oNABSUtBN\nIYtNI5oBpaAFUU+mrTqYhKUUlLmgBrmmilY80CgYtJRRTAKKKKQBRRRQAUUUUwCiiigAooopAFJS\n0UAJRS0lABSgUU4CgQ1hxUdSsOKioEOU0HrTRS0gFBpwpg61IOlAxwpabS0WEGaM0YoxRYBpNGaG\nWmjrQMlFLSClpAFFFFAgooooAKQiloNMAWlNNWn0wGgUtFFABRRRQAUUUUAFFFFABRRRQAUUUUAF\nFFFABRRRQAUUUUAFFFFABRRRQAUUUUAQy/eqOpJPvGo6BBRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\nABRRRQBaooooAKWkooAWiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooASiiigBKKKKACii\nigYUhpaCKAGg06m0opALRRRTAKKKDQA3NKKbinCkAtRSVLUT9aAGUUoFBFACUUGkpgPWnN0pimnE\n5FICOlpKWmAdKkU5qOnp0pDHY5paKKYgooooAQ0lLRQMSl3CmtmmZNAE2c01hSr0pTQIizinB6Qi\nm9KBjm5pUOKFGaRuDQBLTD1pFanGgBMZpjcU7PNKVzQBGDipBTCMUA0APpM0A0E0gE60HikzSUDA\nmiiimAUopKBSAfmnA1HSigB9IaUGkamIb1paQUtAwooopgFFLRQAlFFFABRRS0AJRS0lABRS0UgE\nooooAKKKKACnCminigQdqhbrU1RuKCRlLSUUAKOtSgVEKkU0hj6KO1RliKYEtFRoc1LQAhFRkc1J\nTWpAC06mrTqQwooooEFFFFABQelFFADacDSYpRTAWkopaYBRRRQAUUUUAFFFFABRRRQAUUUUAFLR\nRQIKKKKAEopaKBiUUUUAFFLRQAUUUUCIJPvGo6fJ940ygAooooAKKKKACiiigAooooAKKKKACiii\ngAooooAs0UUUALRRRQAtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAlFFFACUUUUAFFF\nFAwooooEIRSU6kIoGANLTKcDSAWiiimA2lFBpoNIBWqPvUvUVGRzQAopDRmmk0AIaSlooABTgM03\nFPUUwEYYplSuMCoqACnoaZTlpAS0UlLQAUUhOBTS1MYpNKKRead0pABHFRMOal7U1hTEIhqSoOhq\nRWoGDCozUpGajK4oECnBoJpMGigYL1qUDio161KDxSAbiloNITTARqZSk5pKAClpKKBhRRRSAKKK\nKACiiigBRRSUtACg0GiimAtFJS0AFFFFAC0UlLTAKKKKACiiigAooooAKKKKACkpaKACiiikAgp4\nplPFAgpGHFLSHpQIhPWilbrSUCCnqaZSg0DJhyKYy0qtTutADE61N2pgHNPoADUbU4mmE0AOWnU1\nadUjCiiigQUUUUAFFLRTASloooAKKKKACiiimAUUUUAFFFFABS0UUCCiiigAooooAKKKKACiiigA\nooooAKKKKACiiigCu/U0ynv1NMoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKALNLRRQAUUUU\nALRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFJS0lACUUUUAFFFFAwooooAKKKKAEIpp\n4p9IRQA3dShqQrSDg0gHnpURODUg6VG45pgPDcUhpgp4pAJimkVJSYoAjpRTiKaeKYC96eo4qNet\nSjpSAZIajqVxUVMApV60lKKAJRSE0inNOFIYgXNIy8U+l60xEanBp9MYYNOU0hiihulFFMRFjmnq\nOKDxTd3NAySkxmgUuaAExUbdal60hUUCIqUNikPWigY7OaKTNLSGNNFLRigBKKXFJTEFLSUUhhRS\n0lABRS0lABRRRQAtLSUUDFooopiFopKWgApaSimAtFJS0AFFFFABRRRQAUUUUAFFFFIBKKKKAFFO\nFNFOoEFBoooERuKZUrdKioEFFFKKAFBpwNNFOFIY8UZoFFACdaMU4UtACAUtFFABS0lLQAUUUlAC\n0UUlAC0lLSUAFFBopgLRRRQAUUUUAFFFLQAUUUUCCiiigAooooAKKKKACiiigAooooAKKKKACkoo\n7GgCu3Wm05qbQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAWQaWm0ooGLS0lLQIKKKKACiii\ngAooooAKKKKACiiigAooooAKKKKACiiigBKKWkoASiiigAooooAKKKKACiiigAooooAKaRTqQ0DE\nFDDNApaQDAtB4p+Ka4oAQU/FMXrT6ADFMdeKfSHpTAiHBqVelMIpynigYrDioSMGpzzUTigQyiii\ngBy9alFRKeakB4pDFNAoozigBH6VGDzTz81AXFMBRQTTScUo5oACCaaRinkgCo2OTQAu6jNNopDH\nhqC1NooAQ0UtJTAKUGkopAOC5pwWhDT6BDGHFR4qQ0hFMBmKKWg0hiClpKXNABSUtFACUtJRQAtF\nJS0ALRSUtAwpaSimIWigUUALRRRTAKKKKACiiigAooooAKKKKQCUUUUAKKdTRTqBBRRSUCEPSou9\nSMeKjoAKcozTaljFADWGKVaWUUxTzQBKKWmilpALS03NLQAtFJQKAFoopKAHUlFFMBaSiikAUUUU\nwEpRRS0AFFFFABRRRQAUUUUAFLSUUALRSUUALRSUUALSUUtABRSUtAhKWkooGLSUtFACUHoaKD90\n0CK7dabSt1pKACiiigAooooAKKKKACiiigAooooAKKKKACiiigCxS02loGOzRTaUUCHUUlLQAUUU\nUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFIaWkoASiiloASiiigAooooGFFFFABRRRQAUwnNDGm\njrSAeBTqaDS5oAWmv0pc0h5oAYvWpKYBg0/NABRiiloAaRTO9SUw0wHA8U1+RQOaUjigCGloNJQA\nU4Nim0oGaBkgbNLjNIop1IAxikpaQnFACMOKZmgnNJTGKTmkoopAFFLSUAFLSUUALSUtFACUUUUx\nCqcVKDmoacppASU00oOaDTAYRQRxTqCKAI6KdtoIpDEpQMimjrUgoAaVpKk601hQAyloooAKKKKA\nFopKKBiilptFMQ6iiigAooooAKKKKACiiigAooooAKKKKAHClpBS0CEpKWigRGxptOem0AKBk1Oo\nwKbGtSUAMkGRUPQ1YNQuKAFU07NMSn0gClpAKdQAUUUUAFLRRQAUUUtMBKWiikAUUUUwCiikoAWi\nkooAKWkooAWikpaACiiigAooooAKKKKACiiigAooooAKWkooAKKKKAChvumihvumgRWbrSUppKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigCelFJSigYtFFFAgpaSlFAC0UUUAFFFFABRRRQAUU\nUUAFFFFABRRRQAUUUUAFIaWkNACUUtJQAtJS0lABRRRQAUUUjGgAJpuaSlpDENFBooGLSUZooAUU\ntApaAEpKWigAzS5ptFADqY1OpDQIRacelNHFKTQMjbrTac1NpiCnrTKctAySlpueKaWpAOLY6U0k\nk0lFAwooooASiiigAooooAKKKKAClpKKAFpDS0UAJRRRTAepp3WoxSgmkA+kNJmgUCEFONLjimMa\nAACl6Ui9acaBgpoIzSdKN1ADcYooPNGKACiiigBKWikoAWiiigAzTqbRmmA6ikFLQAUUUUAFFFFA\nBRRRQAlKKKBQA4dKWkFLSEJSUtFMRG9NHWnNTaALCdKdTENPoASo5BUlIwyKAIlqSoujVKOlIAFL\nRRQAtFFFABRRRQAtFJRQAtFFFMBKKKKACiiigAoopKAFopKKAFooooAWikooAKKKKAFopKWgAooo\noAKKKKACiiigAooooAKR/u0tI/3aBFc0lKaSgAooooAKKKKACiiigAooooAKKKKACiiigAooooAn\npaSloAKWiigAooooAcKKSloAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAENJS0UAJS0lLQAl\nFFFABTHp9NcZoAaKU00U6kMbmloIpKBi0UUUAFLmkpcUAFLRRQAlLRRQAUUUUCENNpxpMUDGNTae\n3SmUxBSikooGOzRSUtIYCl20KKfQBGaKVutC0AJikp5HFMoAKKUCg0AJRRRQAUUUUAFLSUUALSUt\nJTAUUUlKKQDhS0yl60APB4pjCjpSg5oEIvWnE0uKjbrTAM0oFAWlJxSGN6Gl60YzTgMUAMIxSVKe\naYQRQA2ilooASlpKKAFooFLQAUtNNFMBaKKKACiiloASilooAKKKKBCilpBS0gCiilpiGMOKYamN\nRkc0APj6U+mJxT6ACg9KKO1AEDdacpocc00daAJM0uabS0gHUUgpaAFopKWgAoopaYBRRRQAUlLR\nQAlFFFABSGlpDQAlLSUUALS0lFAC0UlFAC0UlFAC0UUUALRSUUALRRRQAUUUUAFFFFABSP8Adpab\nJ92gRAaSlPWkoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAJ6UUlLQAtFFFABRRRQAUopKUU\nALRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAlJSmigBKKKKACiiigYUHpRQaBEZFKKDQKQwop\naSgYUUUlAC0tIKWgAopKKAFopKKAFoopaAExSN0p1IRmgRCTzSU9lxTKYBRRRQAtOAFNpVPNIokA\npDSg0GgQ3GaDxThQRQMaDQaCKQ0AJmjFABpxoAZS4pQKdTAjopT1pKACiiikAUtJQKAFxRS5ooAM\nUA9qAaQ0APIyKZ0NKDig0APHSmMOaVWxTuopiBcYprHmlbimdTQA9SKcelR4IpQ1IBaU9KOKYTQA\nh60UdaMUDEopaSgApQaSigB1JQKU0AFFIKKYC0UlAoAdRQBTgKBCYpRS0UhCUuKKKADFFFFMAppp\n1NNADlp1NWlzQAUtJRQA1xUVSnpUZ60AKKcKaKcKBi06m0tIBaWkpaYgpaSloAKKKKACkoooAKKK\nKACkpaKAG0UGigAooooAKKKKACiiigBaKSigB1FJS0AFLSUUALRRRQAUUUUAFNk+7TqZJ92gRCaS\nlNJQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAT0tFFAC0UUlAC0UUUAFFFFACg0tIKWgAoo\nooAKKKKACiiigAooooAKKKKACiiigBDRRSUAFFFFAC0lFLQMShulLSGgRF3p1IwxSA0hjqKKKBiU\nUuKKAEpcUU4dKAG0AUHrS0AFFFFAC0UlFABRS0GgQxzxUVSPUdMAooooAWlXrSUCkMkzRTQaUUDH\nUdaKKBBimtxTiaY3JoActKRxTRxTieKAGilpByacRTAbjNNIxT6YTQAlFFFIYUUUUAFOptLQAtFJ\nRQA4Cl6UmcCmknNAhSKVDSYzSA4NAD26U1OtO6imdDTAlODTCuKVTSmgBoNGM0Yp3agBhGKUUjU2\nkMU0UlLQAlFLSUAFKKSigBaMUU4CgBMU4ClxRQSFLSUtABRRRQAUUUUAFFFFMApp60tIaAFFOqPO\nKUNQA6iikoADUR61KajbrQACnCmA07NIY4U6milFACilpKUUCFooopgFLSUtABSUtJQAUUUUAFFF\nFADTRQaKACiiigAooooAKKKKACiiigBaKSloAWikpaAClpKKAFooooAKZL0FPpkvQUCIKKKKACii\nigAooooAKKKKACiiigAooooAKKKKACiiigCxRRRQAUtFFABRRRQAUUUUAFKKKKAFooooAKKKKACi\niigAooooAKKKKACiiigBKSiigAooooAWiiigAooooAjfpUYoooGh606iikAUUUUDG96kXpRRQAxq\nBRRQAtJRRQAU4UUUALSGiigRG9R0UUwCiiigApaKKBi04UUUhimkBoopgHWjHNFFAhRSNRRSAROt\nSNRRQBGTzSYoopgBpKKKQBRRRQMKKKKACloooAWgDmiigCQDio2FFFAhBQetFFAxVqSiimISjtRR\nQA3vQ1FFADKUUUUhhRRRQAlKBRRQA4CnUUUCCiiigQUtFFABRRRQAUUUUAFFFFMBDTTRRQA1qTOK\nKKAJFNLRRSAKYwoopgNpRRRQA8UtFFIYtLRRTELRRRQAUUUUAFFFFABRRRQAUlFFACGiiigAoooo\nAKKKKACiiigAooooAKKKKAFooooAWiiigBaKKKACo5u1FFAiGiiigAooooAKKKKACiiigAooooAK\nKKKACiiigAooooA//9k=', 'asha1', '2016-09-08 16:10:59', 'asha1', '2016-09-08 16:10:59', 'qazxsedcvgfr');
INSERT INTO `hm_patient` (`Patient_id`, `PinCode`, `Village_id`, `City_id`, `District_id`, `State_ID`, `Country_ID`, `Card_Type_id`, `Gender_Id`, `Cast_Category_Id`, `Patient_Salutation`, `Patient_FName`, `Patient_MName`, `Patient_LName`, `Patient_DOB`, `Patient_Age`, `Patient_Language`, `Patient_POB`, `Education`, `Patient_BPL`, `Patient_Marital_Status`, `Patient_Contact`, `Address_line1`, `Address_line2`, `Patient_Emergency_number`, `Patient_Ward`, `Patient_Image`, `Created_By`, `Created_Date`, `Updated_By`, `Updated_Date`, `Card_Number`) VALUES
('asha1513', '41001', 6, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Shantabai', 'Prakash', 'Patil', '1984-09-12', 32, 'Marathi', 'Kolhapur', 'Literate', 0, 'Married', 4294967295, 'Kothrud pune', '', 4294967295, '12', '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAKBueIx4ZKCMgoy0qqC+8P//8Nzc8P//////////////\n////////////////////////////////////////////2wBDAaq0tPDS8P//////////////////\n////////////////////////////////////////////////////////////wAARCAPIBRADASIA\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwCGiiig\nAooooAKKKKACiiigAooooAKKKKACiiigApaSloAKB1opR1oAdS0lLSAKKKKAEbpTKc3Sm0wCiiig\nBKKWigBKWiigBKKWigBKWiigAooooASilooASilooASilooASilooASilooAKSlooASilooASilo\noASilooASilooASilooASilooASloooAKSlooASiiloASiiigAooooAKKKKACiiigAooooAKKKKA\nCiiigAoopaAEopaKAEpaKKACiiigApKWigBKWiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooASilooASilpKACiiigAooooAKKKKACiiigAoopaAEpa\nKKACiiigAooooActOpq06kAUUUUAIaZTzTKAEpaKKYBThTacKQC0tJS0gCiiigYUUUUAFFFFABS0\nlLQAUUUUALRSUtAEFFFFUIKKKKACiiigAooooAKKKKACiiigAooooAKWkpRQAUo60lKvWgB1LSUt\nIAooooAa3Sm05qbTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACi\niigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAEopaKACiiigApKWigApKWigAoo\nooAKKKKACiiigAooooActOpq06kAUUUUAIaZTzTDQAlO7UlL2pgJThTacKQC0tJS0gCiiigYUUUU\nAFFFFABS0lLQAUUUUALRSUtAEFFFFUIKKKKACiiigAooooAKKKKACiiigAooooAKXtSU4dKAEpVp\nKVaAHUtJS0gCiiigBrU2nNQo+YUwExRg1ZxS4FAFXFGKtYFGBQBVxRirOB6UYFAFbFGKs4HpRgel\nAFbFGKs7R6UbR6UAVqKs7R6UbR6UAVqKs7R6CjaPQUAVaKs7F9BRsX0FAFairOxfSjYvpQBWoqzs\nX0o2L6UAVqKs7F9KPLX0oArUVY8tfSjy19KAK9FWPLX0o8tfSgCvRVjyl9KPKWgCvRVjylpPKWgC\nCip/KWjyloAgoqfyhR5QoAgoqfyhSeUPWgCGipvKHrR5Q9aAIaKm8ketHk+9AENFTeT70eT70AQ0\nVL5PvR5PvQBFRUvkn1o8k+tAEVFS+UfWk8o+tAEdFSeUaPKagCOipPKajymoAjop/lNR5bUAMop/\nlt6UeW3pQAyin+W3pSeW3pQA2inbG9KNjelADaKdsPpRtPpQA2inbT6UbT6UANopdpo2n0oASilw\naMGgBKKXBoxQAlFLijFACUUuKKAEopaKAEopaKAEopaKAEopaKAEopaKAEpaKKAEopaKAEopaKAE\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBy06mrTqQBRRR\nQAhphp5phoAKcOlNp6j5aYDTSikNKKQC0tJS0gCiiigYUUUUAFFFFABS0lLQAUUUUAFLSUUAQ0UU\nVQgooooAKKKKACiiigAooooAKKKKACiiigApw6U2nfw0AJSrSUq0AOpaKKQBRRRQA1qE+8KG60sf\n3xTAsUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUU\nUAFFFFABRRRQAUUUUAFGKKKADFGBRRQAYFJgelLRQAmB6UbR6UtFACbR6UbR6UtFACbR6UmxfSnU\nUAN2L6UbF9KdRQA3y19KPLWnUUAM8taPLWn0UAM8oUeUKfRQBH5Qo8oVJRQBH5Qo8r3qSigCPyve\nk8r3qWigCLyqPKqWigCHyjR5RqaigCHyjSeUanooAg8o0eWanooAr+W1HlmrFFAFfyzRsPpViigC\ntsPpRsPpVmjFAFbafSjafSrOKMCgCrtPpRtPpVrApMCgCtg0YNWdo9KNooArYNGKs7R6UbR6UAVs\nUYqxsFGwUAVqKs7BULjBoARadTVp1IAooooADUZqQ1GaACng/LTKcvSmAhoFBoFIB1FFLSAKKSlo\nAKKKKBhRRRQAUtJRQAtFFFABRRRQBDRRRVCCiiigAooooAKKKKACiiigAooooAKKKKACn44ptO/h\npANpVpKctMB1FFFIAooooAa3Wlj++KRutOi++KYE9FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\nABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\nFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAHpUEnWp6gk60ANWnU1adSAKKKKAENMNPNMNABTh0p\ntKOlMANApDSikA6lpKKQBS0lFAxaKKKACiiigAooooAWiiigAooooAhoooqhBRRRQAUUUUAFFFFA\nBRRRQAUUUUAFFFFAC07tTRSnpSASnLTactADqKKKACiiigBrdadF9+mnrT4fvUwJqKKKACiiigAo\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACii\nigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqCTrU9QSdaAGrTqat\nOpAFFFFAAaYaeaYaAEpwHFNpwPFMBDQKQ0opAOooopALRSUUDFooooAKKKKACiiigBaKSloAKKKK\nAIaKKKoQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAopTSDrS0AJTlptOXpQA6iiikAUUUUAMPWpIf\nvGoz1qWHqaYEtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\nFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\nABRRRQAVBJ1qeoJOtADVp1NWnUgCiiigBDTDTzTDQAUo6UlKOlMBKUUlKKQDqKKKQBRS0lAwoopa\nACiiigAooooAKWkooAWiiigCGiiiqEFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAKvWlNCfeoNIBKc\nvSm04dKAHUUUUAFFFFADD1qWHvUR61LD3pgS0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFF\nFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\nAFFFFABRRRQAUUmaXNABRRmkzQAtFJmjNAC0UmaM0ALRRmk3UALRTd1G+gB1FN3UuaAFoozRQAUU\nUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRR\nQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOtADVp1NWnUgCiiigB\nDTDTzTDQAUvakpe1MBKUUlKKQDqKKKQBRRRQMKKKWgBKWiigAooooAKKKKAClpKKAIqKKKoQUUUU\nAFFFFABRRRQAUUUUAFFFFABRRRQA5OtBpU6/hSGkAlOHSm08dKAFooooAKKKKAGd6mh6Goamh+6a\nYElFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\nAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFIWAppcUAPpCcVGz0wsaAJS9NL1HRQA/fRvpl\nFAD9xpNxpM0UAODUoamUUATbhRkVFRQA8tTM0lFABmiiigAzS5pKKAHBjSh6ZS0ASh6UEVDSg0AT\nUUwPTgc0ALRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOtADVp1NWnUAFFFFI\nBDTDUhphoASlHSkpR0pgJSikpRSAdRRRSAKKKKBhRRRQIKKWigYUUUUAFFFFABRRRQBFRRRVCCii\nigAooooAKKKKACiiigAooooAKKKKAHJ1P0pDSr3pKACnimU8UgFooooAKKKD0oAZU8P3agqeL7lM\nB9FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA\nUUUUAFFFFABRRRQAUUUUAFFFFABSZoJxUbPQA8timF6YTSUAKWzSZoooAKKSigBaSiigApaSloAK\nWkpRSAKKSloAUUGkopgFFFHagBKWkooAWiiigBaKKKACiiigBaXNJRQIeDT6jXrUlAwooooAKKKK\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA\nKKKKACiiigAooooAKKKKACiiigAqCTrU9QSdaAGrTqatOpAFFFFACGmGnmmGgApQOKSnDpTAbSik\npRSAdRRRSAKKKKACiiigBaKKKBhRRRQAUUUUAFFFFAEVFFFUIKKKKACiiigAooooAKKKKACiiigA\nooooAcvekpR0NJQAU8UynikAtFFFABQelFB6UAMqeL7lQVYj+4KYDqKKKACiiigAooooAKKKKACi\niigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAozRSHigB\naYz4prPUZOaAHM2abSUUALSUUUAFLSUUAFFFJQAtFFFABS5pKKAFzRSUUALRRRSGLRRRQAUhNFIa\nBBS0lFMBRRmiigBc0tNpaAFooooAWiijNAhy9akqIVIpyKBi0UUUAFFFFABRRRQAUUUUAFFFFABR\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFF\nFABRRRQAVBJ1qeoJOtADVp1NWnUAFFFFIBDTTTjTTQAlKOlJSjpTASlFJQKQD6KKKQBRRRQMKKKK\nBBRRRQAUtJS0DCiiigAooooAioooqhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACiiiigAp4pgp9I\nBaKKKACg9KKG6UAMqxH9wVXqyn3BTAWiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooprNgUAKxwKhZ80jNmm0AGaKKSgBaKKKACi\niigBaSiigApKWigBKWkooAWikooAUGnAgimUtAxcUZoopAGaKKKAA0lOoxQA2inYoxQA2ilooEFK\nKSloAWikopgLRSUtACinKcU2lzQIlFFMU0+gYUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABUEnWp6gk\n60ANWnU1adSAKKKKACmGnmmGgBKcOlNpw6UwG0Cg0CkA8UUCikAUUUUDCiiigQUUUUAFLSUtABRR\nRQMKKKKAIqKKKoQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAtFFFAAKfTB1p9IBaKKKACkbpS0jdK\nAGirK/dFVhVlfuimAtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA\nUUUUAFFFFABRRRQAUUUUAFFFIaAAnFQu2TSu1RmgApKKKACiiigAooooAKWkooAWikpaACkoooAK\nWiigYUUuKMUgEopaMUAJS0YpaBiUuKBS0AJS0UtACYop2KCKAGUYp2KMUCG0U7FJQAUUUUCCiiim\nAU6m0UAPFKGpmaWgRIDS1Hml3cUDH0ZqMMaXdQA7NIWppJpDQIeG9adUQp6mgY6iiigAooooAKKK\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqCTr\nU9QSdaAGrTqatOoAKKKKQAaYafTDQAlKOlJSjpTASgUUCgB4ooFFSAUUUUAFFFFABRRRQMKWkpaA\nCiiigAooooAioooqhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0UUUAA60+mjrTqQC0UUUAFI3Sl\npG6UANFWh0FVRVodKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\nAFFFFABRRRQAUUUUAFFFITQAtRO9DvUZNACE0lFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAxaW\nkpQKQwpaMUuKAEpaUClxQAmKMU7FGKAG4pcUuKWgBuKXFLRSASilooATFJTqSgBMUmKdQaAG4pCK\ndiigBuKSnGkNMVhKKKKYgpwptLmgBxpKSg8UgFpcimUopgOzmkNGcUUAGaKSigRIjU+oRUitmgY6\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACoJOtT1BJ1oAatOpq06gAooopABphp9MNACUUUUwCgUUUAOFLSClqQCiiigAooooAKKKKBhRR\nRQAtFJS0AFFFFAEVFFFUIKKKKACiiigAooooAKKKKACiiigAooooAWiiigBR1p1NHWnUgFooooAK\nRqWkagBB1qzVZetWaYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\nAFFFFABRRRQAUUUUABqN2pznAqBjzQAhNFFJQAUUUUAFFFFABRRRQAUUUUAFFFFABRRSgUDEpwFO\nApQKQxuKXFOooATFLilopDDFFLRTEFFFFABRRRQAUtFFABRRRQAUlFFIAooooASilpKAEpKdSUAN\nxSYp1JimISiikoEOUZofrSpSPyaAG0tJRmmAuaXtTaUmgANFJSZoAdSqcU2igCwpyKWoVbBqUHNA\nC0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB\nUEnWp6gk60ANWnU1adQAUUUUgCmGn0w0AJRRRTAKKKKAHClpBS1IBRRRQAUUUUAFFFFAwooooAWi\niigAooooAioooqhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0UUUAKOtOpq9adSAWiiigApGp1Na\ngBF+8Ks1XT7wqxTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAo\noooAKKKKACg0U1zgUARyNUdKxyabQAUUUUAFFFFABRRRQAUUUUAFFFFABRRTgKQwApwFApaChRRS\nUUgFooFLQAUtJS0AFFFFAgooooAKKKKAClpKKACiiigAooooAKKKKACkpaSgYUlLRQAlJS0UANNN\npxpDTEIpwaVqbSk0EiUUUlMBaM0UUAFFJRQAtApKUGgB1ORsGo80A0AWQaWo0NSUAFFFFABRRRQA\nUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABUEnWp6gk60ANWnU1a\ndQAUUUUgENNNONNNACUUUUwCiiigBwpaQUtSAUUUUDCiiigQUUUUAFFFFAwpaSloASloooAioooq\nhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFLQAUUUUAKtOpq0+kAUUUUAFNbrT6Y3WmAqfeFWKrx/fFW\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqGQ1\nI5wKgY80AJSUUUAFFFFABRRRQAUUUUAFFFFABRRTgKQwAp1FFIoKKBS0AFLRS0AFFFFAC0UlFAC0\nUlFAC0UlFABS0lFAC0UmaKAClpKKAFpKKKAClpKKACiikoAWikooAKKKKAEpDS0UAMNJTiKQ0xMS\nkoopkhRRRQAUUUUAFLSUUALRSUtACg4NWFORVapY2oAlooooAKKKKACiiigAooooAKKKKACiiigA\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKrydasVBJ1oAYtPpi0+gAooopAIaaetONNNACUU\nUUwCiiigBwpaQUtSAUUUUDCiiigAooooAKKKKBBS0lFAxaKKSgCOiiiqEFFFFABRRRQAUUUUAFFF\nFABRRRQAUtJS0AFFFFACrT6YtPpAFFFFABTW606mt1pgOj++KnqCL74qegAooooAKKKKACiiigAo\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoopGoAjkNRGnuaZQAlFFFABRRRQAU\nUUUAFFFFABRRSigYCnCkFLSKFooopALRRRQAtFJRQAtFFFABRRRQAUtJRQAtFJS0AFFFJQAtFJS0\nAFFJS0AJRS0lABRRRQAUUUUAFFFFABRRRQAUlLRQA00hp1IaAGGkpxptMkKKKKYgooooAKKKKACi\niigBaUHBptFAFlDkU6oY25qagAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoo\nooAKKKKACiiigAqCTrU9QSdaAGLT6avWnUAFFFFIBDTTTqaaAEooopgFApKUUAOFLSClqQCiiigY\nUUUUAFFFFABRRRQAUUUUAFFFFAEdFFFUIKKKKACiiigAooooAKKKKACiiigApaKKACiiigBVp9NW\nnUgCiiigAprdadTT1pgOi+/U9QxffqagAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigApr9KdTJKAIWNJSmm0AFFFFABRRRQAUUUUAFFFFABSiilFIpC0UtFIYU\nUUUAFFFFAxaKSigBaKSlpCClpKKYC0UlLQAUUUUALSUUUALRSUUALRSUUALSUUUAFFLSUAFFFFAB\nRRRQAUlFFABRRRQAUlLRQA002n000xDaKU0lMkKKKKACiiigAooooAKKKKAHA4NTo2RVeno2KYE9\nFIDmlpAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOt\nADV606mLT6ACiiikAhpppxppoASiiimAlLSUooAcKWkFLUgFFFFAwooooAKKKKBBRRRQMKKKKACi\niigCOiiiqEFFFFABRRRQAUUUUAFFFFABRRRQAUtJS0AFFFFADlp1NWnUgCiiigApp606mHrTAkh+\n9+FTVDD941NQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\nAVHJUlRSdaAIjSUppKACiiigAooooAKKKKAClFFKKRSClFFFIYtFJRQAtFJS0AFFFLQAUlLRQMSl\npcUmKBBRRilpDEooopgLRSUtAgooooAKKKWgAoopKAFooooAKKKKAEopaKAEooooAKSlooASiloo\nASilpKAA0006kNADTTaeaaaYmJRRRTJCikpaACiiigAooooAKXNJRQBMjVIDVYHFPVuaYE9FIpyK\nWkAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFQSdanqCTrQAxetPpi9a\nfQAUUUUgENNNONNNACUUUUwEpRSUooAcKWkFLUgFFJRQMWiiigAooooEFFFFAwooooAKKKKAI6KK\nKoQUUUUAFFFFABRRRQAUUUUAFFFFABS0lLQAUUUUAOWnU1elOpAFFFFABTD1p9MPWmBLD1NS1FD1\nNS0AFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAB6VA55qV\nzxUB60AJSUtJQAUUUUAFFFFABRRSigYCnUlLSGFFFFIYUUUtACUtFFABS0lLQAtFFFAC0UUUAFJS\n0UAJRS0lABRRRQAUUUUAFLSUUALRSUUALRRRQAUUUUAFFFFACUUUUAFFJSigAooooAKSlpKACkpa\nSgBDSGnU00CG0UppKoQlFLRQIKKSigBaKSloAKKKKAClFJRQBMjVKKrocGpweKYC0UUUgCiiigAo\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACoJOtT1BJ1oAYvWn0xetPoAKKKKQCGmnrTj\nTDQAUUUUwEpRSUooAcKKBRUgFFFFAwopaKACikooAKWkpaACiiigAooooAjoooqhBRRRQAUUUUAF\nFFFABRRRQAUUUUALRSUtABRRRQA5elOFNXpThSAKKKKACmd6fTKYEsPepajh6GpKACiiigAooooA\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAI5DUNSPUdAAaSlpKACiiigA\nooooAKWkpaQ0LS0lLSKCiiigBaKKKACiiigYtFJS0AFLRRQIWikpaAClpKWgBKKKKAEooppNADqS\nmhqdmgBaKKKACiiigBaKKKAFpKKKACkpaSgAooooASlopaAEopaMUAJRS0lACUUtJQAhpKdSUANN\nNp5pppiYlJS0lMkWikooAKWkooAWiiigAooooAUVOjcVXp6HBoAsUUi0tAgooooGFFFFABRRRQAU\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOtADF60+mL1p9ABRRRSAQ0w080w0AFFFFMBKU\nUlKKAHCiiipAKKKKBi0UUUAJRRRQAUtJS0CCiiigYUUUUAR0UUVQgooooAKKKKACiiigAooooAKK\nKKAFooooAKKKKAHDpTqaOlOpAFFFFABTKf2plMCaHoakqOH7pqSgAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACg9KKRulAELmmU5qbQMKSiigQUUUUAFFFFAC0tJSi\nkUFLRS0hiUtFLQAlFLS4oAbS0YooGFFFFAC0UCloEJRRRQAtFJRQAtJRRQAhNRk05qbTQBSg0lFA\niQUtNXpTqQwopKKAFopM0ZoAWikzS5oAWikzS5oAKKKKACiiigAooooAKKKKACkpaSgBKSnUlADT\nSGnUlADDRSmkqiWJRRRQIKKKKACiiigBaKKKAClHWkooAnQ5FPFQxtU4pgFFFFIAooooAKKKKACi\niigAooooAKKKKACiiigAooooAKKKKACoJOtT1BJ1oAYvWn0xetPoAKKKKQCGmGnmmGgAooopgJSi\nkpRQA6igUVIBRRRQMKWkpaBCUUUUDClpKWgQUUUUAFFFFAyOiiiqEFFFFABRRRQAUUUUAFFFFABR\nRRQAUtFBoAKKKKAHDpTqQdKWkAUUUUAB6UynnpTKYE8P3afTIvuU+gAooooAKKKKACiiigAooooA\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACkbpS0xzQBE3WmU5utNoGFFFFAgooooAKKKKAFF\nLQKKRQopcUClpDDFLSUZoAWikooAWikooGLRSZozQIWlpuaN1AC0Zpu6k3UAOzRTc0uaAFzRmm5o\nzQANTKcaSmgYlFFFAiRelLSLwKWkMTNFFJmgAzRSUUALmjNJRQAuaXNMpaAHZozTaKAHbqXdTKKA\nH5pc0yjNAD80U3NGaAHUUmaKAFpKKKAEpKWkoAQ02nmmmmJjaKKKZIUUUUAFFFFABS0lLQAUUUUA\nKpwasIciq1TRNQBLRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABVeTrViq8nWgB\nq9afTF60+gAooopAIaYaeaYaACiiimAlKKSlFADhRQKKkAooooAKKKKBhRRRQAUtJS0AFFFFAgoo\nooGR0UUVQgooooAKKKKACiiigAooooAKKKKAFoNFK3WgBKKKKAHDpTqQUtIAooooAD0plPPSmUwJ\n4vuU+mxfcFOoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigANRMK\nexpp6UDIj1ptObrTaACiiigQUUUUAFKKSlFA0LSikpRUlC0UUUAFFFJQAtFJRQAuaTNJRQAuaM0l\nFAC5pKKSmAtJRRQAtGaSigBaKSigBaSlpKAEpyikpwoAdSUUlIApKKSmAUUUUCCiikoAWiiigAop\nKWgApaSigYtLSUtIBaKKKAEozS0UAGaM0mKKAFopM0tACU006kNAhtJSmkqiQooooAKKKKACiiig\nBaKKKACnIcGm0ooAsqcilqOM8VJQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUCCiiigYVBJ1\nqeq8nWgBq9afTF60+gAooopAIaYaeaYaACiiimAlKKSlFADqKBRSAKKKKQwooooEFFFFABS0lFAC\n0UUUAFFFFAEdFFFUAUUUUAFFFFABRRRQAUUUUAFFFFACilf71IOtOk4c0ANooooAeKWkFLSAKKKK\nAA9KZTz0pgpgWI/uCnU1PuCnUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\nFFABQaKQmgBpppPFObpTKRRGaSlNJTEFFFFAgooooAKUUlKKQ0KKWijNIoKKSigBaKKKACiiigBK\nKKKYCUUUUAFFJRQIWikooAWikooAWikooAWiiigBRS0lLSGLSUtJQAlJQaKYBSUtJQIKKKKBBRRR\nTAKKKKAFopKKQx1LTc0oNAC0tJmjNIYtFJRQAtJS0UANpaKSgBaKKKAGmm08000yWJRRRTEFFFFA\nBRRRQAtFFFABRRRQBJGanFVlODVhTkUALRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAgopKWgAooooA\nKrydasVBJ1oGMXrT6YvWn0AFFFFIBDTDTzTDQAUUCimAlLSUUALmjNJRQA7NGabRQA7NJmkooAWi\nkooAWjNJRQAuaM0lFAC5ozSUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAKOtOkOWNNoPWgAoooo\nAeKWkFLSAKKKKABulMFObpTaYFhPuCnUifdFLQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\nFFFFABRRRQAUUUUAFMY80+o260DQh6UlKabSGMNJSmkpiCiiigQUUUUAApwpBS0hoWm0UUDFoooo\nGLRSUUgFpKM0ZoAKSjNJmmIWkoooFcKKSimAtFJS0AFFFFABRRRSAWiiigYtKKSlpDClpKKAENJS\nmkpgFJS0lAgooopiCiiigApKKKBC0UlFAC0ZpKKBi5pc02loC47NGabRmkO47NLmm5ozQMdRSUtI\nAoooxQAGmGn4ppFMQ2ilpKZIUUUUAFFFFABS0lFAC0UUUAFTRNUNOU4NAFmikU5FLQAUUUUAFFFF\nABRRRQAUUUUAFJS0lAgpaSloAKKKKBhUEnWp6rydaAGr1p9MXrT6ACiiikAhphp5phoAVehpDTl6\nGmmmAlFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\nRRQAtFFFABRRRQA8UtIKWkAUUUUAI3Sm05ulNpgWV+6PpS0i/dH0paACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooopAFFFFABRRRQAVGetSHpUTdaBoTvSGgUpoKIzSUppKZIUUUUCCiiigAp\naSlpDQUtFFAwopKKAFpKKSgLi0maKSmK4tJRRQIKKKKACiiigAooooAKWkpaBhRRRQAtFFKBSGKK\nWgUopDExRTsUhoAbSGnUhoAbSUppKZLCiikpgFFFFAgopaKACiiigBKKWigBKKWkoAKKKKAFopKW\ngYtLTaWkMcKWmZp2aQxaaaWkNADTSUppKokKKKKBBRRRQAUUUUALRSUtABSikoFAFiM5FPqKOpaA\nCiiigAooooAKKKKACiiigApKWkoAKWkpaBBRRRQMKrydasVXk60ANXrT6YvWn0AFFFFIBDTDTzTD\nQA5ehppp6Hg0w9aAEooopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB\nRRRQAUUUUAFFFFABS0lFAC0UUUAPFLSCikAtFFFACN0popzdKaKYFpfuiigdBRQAUUUUAFFFFABR\nRRQAUUUUAFFFFABRRRQAUUUUgCiiigAooooAKKKKAA9KhbrUx6VC3WgaEp3amU7tQURt1pKVutJT\nJYUUUUCCiiigApaSlpDQUUUUDCkoooEFJRRTEFFFFABRS0UAJRS4oxQAlFLRQAlFLSUAFFFLQAUU\nUUhiiniminUmUFOFIKcBQAUhp1IaAG0hFOpDQAwim0800imhMSiiigQUUUtMBKKWikFgxS4oFLmg\ndhMUmKdSUAJijFFFACUUtFArCUUYoxTAKKXFGDSASloxS7aBiikpcUUhjTSU4000yWJRRRTEFFFF\nABRRRQAUtJS0AFFFFAEkR5qeq8fWrAoAKKKKACiiigAooooAKKKSgBaSikoAWikpaAFopKWgAqvJ\n1qxVeTrQA1etPpi9afQAUUUUgENMNPNMNADk6GmmlXvSGmAlFFFABRRRQAUUUUAFFFFABRRRQAUU\nUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUALQKKBQA8UUCikAUtJS0AI1NFK\n1A60wLI6UUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUgCiiigAooooAKKKKACiiigAPSoW61Maj\nagaI6U0d6CKChhpKU0lMlhRRRQIKKKKAFooopFBSUUUCCkpaKYhKWiigYUUtFIBKWiigYUUUUAJR\nS0lAgooooAKKKKAClApQKUCgaQCloopFCinU0U8UCYUhpaSgBKQ0tFAxtBFOpDQAwikp5FNxTEJR\nRijFAgooxRQAUtJRQMWiiigA4o4oxS4pAJijFOxS4oAbilC07FFAhMUUtFAxKKKKAEooooASmmnG\nkpiGUUppKZIUUUUAFFFFABS0lLQAUUUUAOTrVgdKrr1qwOlAC0UUUAFFFFABRRRQAUhpaKAG0UtF\nACUUUUAFLSUUALUD9anqB+tADV60+mL1p9ABRSUUgA0w080w0AKKSgUUwEooooAKKKKACiiigAoo\nooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBaBRQKAHiigUUgC\nlpKWgBrUDqKGoXqKYFmiiigAooooAKKKKACiiigAooooAKKKKQBRRRQAUUUUAFFFFABRRRQAUUUU\nAFRsakqFutBSG96WikzQMa3WkpTSUyWFFFFAgoFFKKBoUCjFLRSKG4oxT8UYoEMxRin4oxQAyin7\naNtFwGUU7FJigYlFLil20ANop22l20AMop+2kIoAbRTsUbaBDcUoFOxS0DEoopaQwooopAKKcKaK\ndTEwpKWigQlFFFAxKKKKBiGjFFFACYoxS0tAhuKNtPooAbto206igBu2jFOooATFGKWigAxRilxS\n0xCYopaaaQBSUtJQMQ0lLRQMSiiigQGm06kNADTTacaSmSxKKKKYgooooAKKKKAFooooAUdasL0q\ntViM8UAPooooAKKKKACiiigAooooASilNNoAKKSloAKWkpaACoH61PUD9aAGr1p9MXrT6ACkoopA\nBphp5phoAKSlpKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\nFFABRRRQAUUUUAFFFFAC0CigUAPooopAFLSUtADWoX7woahfvCmBZooopAFFFFABRRRQAUUUUwCi\niikAUlLSUDDNLTaWgBaKSloEFFFFABRRRQAUUUUAIaibrUp6VCetBSCkNBooGNNJSmkpksKKKKBB\nThSAU6kUhaKKKQwpaKKAClxRRQAuKMUUtADcUYp1GKAG4pcUuKKAEooooASjFLRQAmKKKKACkpaK\nBjaWiikAUCigUwHClFIKdQIKQ0UUCEpKWkoGLRSUtACUUUUDDFFLRQISloooAKWkpaBCUYpaWmAm\nKWiloASiikoAKTNFJSGFBpKKBhSUUUAFJS0lAhaSiigBKaacaaaYmJRRRTJCiiigAooooAKWkpaA\nCnoeaZSg80AWBS0xDxTqQx1FJRQAtFJRQAtJRRQAUlLSUAJRRSUCHUUlLQAtV361Yqu/WmAi9afT\nF606kAUUUUABphp5phoAKSlpKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0CkpRQA+iiikAUtJRQAjdaF+8KRutKv3hQMnzS00U6gBa\nKKKBBRRRQAUUUUAFFFFACUhpaSgYlLRRSAKKKKYC0UlLQAtFFFAgooooARulQnrUrdKhPWgpAaBQ\naQUDEakpxptMlhRRSigBRTqSlqSgooooGFLSUtABS0lFAC0tJS0CFooFFMQUUtJQAUlLRSASiloo\nGJSUtFACUlLSUDCiiikAUtIKdTABTqbS0EhSUtFACUlLSUDEpaSlFAxaSg0ZoELRSUtAC0UUUCCg\nUUZpgLRRRQAUUUlAC5pKKSgAooopDEpKWigY2ilNJQAUlLSUAFFFFAhDSGnU00xDaKWkpkhRRRQA\nUUUUAFFFFAC0UlLQBIhqTNQL1qUGkMfS0gooAWikpaACiiigAooooAQ0mKdSUCExS0tFABVd+tWK\nrv1oARetOpq06gAooooADTDTjTTQAlFFFMAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigApRSUooAfRRRSAKKKKAGt1oX7wobrQOtAEwNOB\nqMUoNIokzRmmZpc0CsOopuaM0AOopKKAFooopgFJQaM0gCiiigYlFFFACilpKWmIWikpaBBRRRQA\njdKg71O3SoD1oKQGkpaSgYhpKU0lMlhSikpwpAhaKKWkUFFFFAwoopaACiiloAKWkpaBC0tJRTEL\nRRSUAFFGaKACikozSGIaKKQ0DDNJmkJpKAHUUCigBwpaSigQtLRS0xCUUtFADaSnUhpDG0Cg0CgY\nUlLmg0AGaUGm0A0APopoNLmgQtFJRmgB1FNzS0BYKKSigBaKSigAooooAKSiigYUlFFABSUUUAFF\nJS0CCmmlpDTEJSUtJTEFFFFAgooooAKKKKAClpKKAFHWpAajp4NIZIpp1MWnigApaKKAEpaSigBa\nKKKACikpM0ALmjNJmigBTUD9amNQt1oARadTV606gQUUUUAIaaacaaaAEooopgFFFFABRRRQAUUU\nUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFKKSlFAD6K\nKKQBRRRQA09aF+8KD1pY/vCgaJMUYp1FIY3FFLRQAlJmlNJQA4GnCmCnCgB1FFFAhppKcRSYoGJm\nilxRigAooxS4oAKWkpaYgpaSigBaKSloEB6VA/Wp6hkHNA0NFIetOWhqChhpKWkpksKeKYKeKTGg\npaKKQwooooGFLSUtAC0UlFAC0tJRQIWikooAdSUlFAC0maSkoGOzSUlGaADNITQTTaAFpQKAKdig\nQlLRRQMWikpc0ALS5pmaXNArDs0ZpuaTNAWHGkzRmkoADQKKKBi4GaUimgc07FAhpFNNPIppFACZ\npQaZS0APzRTc0ZoGOFLTaXNAC0UmaKAFopKKACiikoAU0lFFABSUtJQAUUUUCEooooAKDRRTAbSU\nppKCQooopiCiiigAooooAKKKKAFpy02lWkBKKeKjFPFAx1FFFABSUUUgCiiigBDSU6igBMUuKKWm\nAmKgfrVg1XfrQAgp1NFOoEFFFFACGmmnGmmgBKKKKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSikpRQA+iiikAUUUUANPWlj+8KQ9a\nWP71A0T0lFFIYUUUmKAEJpuacabigBRTxTBTxQA6ikpaYgooooAKKKKACiiigAopCabmgB9FNBpa\nAFoopaACopalpkg4oBEY6UhooJoKG0lLSUCYop1NFOoBC0UlLSGFFJS0DFopKKAFooooAKWkooAK\nKKKACikooAKKSigApKKSgApQKSnCmIcOKWm5ozSAWkzSZpM0DFzS5ptFFgHZozTc0ZosA7NJmkoo\nELmjNNoosA7NOBpmaXNADmpoY0uabmgCQGg0wGlzQA09aSlam0wFpabS0AOopKWkMWikozQA6ikz\nRmgBaSiigBKKKKACiiigApKKKBBRRRQAUUUlMANNp1NoJYUUUUxBRRRQAUUUUAFFFFABSikpRQBI\nDTwaiFPBpDJAaWowacDQAtFFJSAWikooGLRSUUCFpabmlBpgLVd+tWKrv1oAQU6minUCCiiigBDT\nTTjTTQAlFFFMAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigApRSUooAfRRRSAKKKKAGnrSx/epp60+P71A0SilpMUtIAooopgJikxTqKQxu\nKUUtFABS0lLTEFFFLQAlLRRQIKQ0tJQMaabin0UhiAU6kpaYgooooAKRulFB6UAQ96KQ9aKChKSl\nNJQJiilpBS0AhaKKSkMWikooAWlpKKBi0UUUAFFJRQAtJmikoAWikzRQAUUUlMQUUUUAFLmkooAM\n0ZpKKBXDNGaSimK4uaWm0tIdxaKSloAKKSigBaKSkoC4uaM0lFMVxc0ZpKKAuOozSUUh3FpKcKCK\nAG0UUUALS02loGLmikpaAClpKKQC5opKKBi0UlFAC0lFFAgooooAKKKKYBRRRQISkpaSgTEooopi\nCiiigAooooAKKKKAClpKWgBRTqaKWkMcDTgajFOBpDH0tMzS5oAdRSZpaACiiigAoFFJQIdUD9am\nzUDdaYAKdTRTqBBRRRQAhpppxppoASiiimAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\nABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUopKUUAPooopAFFFFADD1p8f3qYetPj60DRLS\n02lzSGGaM0lFAC5pabS0ALRSUmaAHUtMzSg0AOpabS0xC0UlFAC0lFJQAUUUUhhRRRQAUUUUAFFF\nFMCFutC0sg5pFoGDCmVI3SmUCYLS0gpaAFpKKKBhRRRQAUUUUALRSUZpDFopKKACikopiCiiigAo\nopKBBS0lKBQAooNKKQ0hjaKKKZIlFFLTASilpKAFooopAFFFFABSUUUwCiiigQUUtFAwoopaQCil\npBTqRQ0im1IRTSKYDaKKKBC0UlLQAUUUUDFopKWgAooooAKKSloAKSiigBaKSloAKSlooEJSGlpD\nQJiUUUUxBRRRQAUUUUAFFFFABSikpRQAtFGKWkMKBRRQMXNLmm5opAPBpc0zNLmgB4NLTAadmgBa\nQ0tIaAGk1Gae1RmmhMUU6miloELRSUtACGmmnGm0AJRRRTAKKKKACiiigAooooAKKKKACiiigAoo\nooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKUUlKKAH0UUUgCiiigBh605Ot\nNp8Q5NA0SUUuKMUhiUUuKMUAFJTsUYoASkxTsUYoAZilAp+KMUBcSloxRTEFLRRQIQ0maDTaQx1F\nIKWgYUUUUAFFFFABS0UUxDJBxUa1M/3ahHWgaHGoz1p5NMNAwFLSDrS0CCiikoGFFFFABRRRQAUU\nUUAFFFFABRRRQAUUlFAgooooAKeBSAUtJjFpppaaaAEooopiCiiigQUUUUAJRS0UwEopaKAEopaK\nAEpaKKQBRRRQAUtFFAxRTqQU6kMKaRS0UAMNJTjTaYgooooAWikpaACiiigYUUUUAFFFFABRRRQA\nUUUUALRSUtAhKSlNJQJiUUUUxBRRRQAUUUUAFFFFABSikpRQA6ilAyKB1pFCGkqTbSbaQDKKcRSY\npgJRmjFFADgacDUdKDSAlBopgNOzQAhqI1IajNNCYopaQUtAgpaSloAaaQ0ppDQAlFFFMAooooAK\nKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigApR\nSUooAfRRRSAKKKKAGVLD3qKpoe9MY+jFLRSAMUYopaAEpaKKBBRRRQAUUUUAFFFFABRRRQAhpMU6\n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\nCilFAC0UUUhhRSUUAFJRRTAKKKKBBRRRQAUUUUDCiiigQlJS0lMQUUUUCCiiigAooooAKUUlKKAH\nE8UgoNFIoXNJRRQMKDRRQIKM0mKKAHZpc02iiwDs0Cm0qmkBIBRigGloAYw4qM1Kw4qI00JiilpB\nS0CCiiigBDTacabQAUUUUwCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\nooooAKKKKACiiigAooooAKKKKACnCm04UALS0lLSAKQ9KWkPSgBtPUcUypox8lDGhlGakK1GVpDD\ndShqYRRTAmBpwqFTUgNAh9FJmjNAC0lJmjNIYtFNzRmgB1GabupN1AD6KZuo3UAPopu6jdQA4mmM\naQtTCaYCHrSUUUCAU8GmUtAEmaaxpM0maBhSUtFACUtJRQAtFFFAwooooAKKKKBBRRRQMKKKKAFp\nabS0ALSGiikAlFLRTAKKKKAFopKKQBRSUUwFopKKAFopKKAFopKKAFozSUUALmjNJRQAtFJRQAtF\nJRQAtFJRQAUtJRQAtJRS0AJS0UtACYopaKQCUUUUAFJRRTAKKKKACiiigQUUUUAFFFFABRRRQAZo\nIzSUooEAFNNOzSGgBKKKKYgooooAKUUlLQNCmgUUopDCkpaKBiUCiigQ/HFIVp68ilxSAiIpMVIR\nTTQA2lAoAp4FMQoFOpMUtIBD0qA9anPSoD1poGKKWkFLQIKKKKAENNpxptMAooooAKKKKACiiigA\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKcKbThQ\nAtLSUUgFpD0paQ9KAG1PF9wVBU8X3BQxjqQinUhpARMKYalaozQMQU8GmgU4CmA4GjNJRSAXNJSg\nUuKAG0lPxSEUAMJpM0rCmUwHZo3U2igVxc0ZpKKAuLmigU4CgYgWnbacBSikIZsoK1JSYoGRbaTF\nS4prCgBlFFFMYlFLSUCFopKWgYUUUUAFFFFABRRRQAUUUUAFFFFAC0UlLQAtJRRSAKSlpKYC0lFF\nABRRRQAUUlFAhaKSigBaKSigAooooAKKKKAClpKKAFpKKKACiiigBaKKKACiiigBRS0CikMKKKKA\nEpKWkpgFFFFAgooooAKKKKACiiigAoopKACiiigQGiiigBVGaGoBwaQnNACUUUUxBRRRQAUtFFIY\ntKKbTqBhQKKBQMDSUppKAJEPFPqJTzUlIQhphpxNNNAAKetMFPFAh1FFFACHpUB61O3SoD1poBVp\naQUtAgooooAQ02nGm0wCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigApwptOFAC0UUUgFpD0paQ9KAG1PH9wVBUinCihjRITSE0wtT\nd1IY4mkpM0ooAUUopKWgBaUCkzS5oAWikzRmgBaQ0maaTQANUdOJptNCYUUUUxBRRRSGKKeKaKcK\nQxwp1MFGaAH0ZpmaM0AOprdKXNNJoGMooNFMApKWkoEwpaSigBaKKKBhRRRQAUUUUCCiiigAoooo\nGFLSUtABS0gpaQBSUtJigBKKWimAlFLRQA2ilooEJRRRQAUUUUCCiiigAooooAKKKKACiiloGFFF\nLQAlFLilFAxMUuKWikAUUUlABSUUUAJRRRTEFFFFABRRRQAUUUUAFFFFABSUUUAFJRRTJFopKWgA\npKKKACiiigAooooAWiiikMWlpKUUDA0Cg0ooGBptOpDQAlPB4plKKBDiabTsUYpAAFOFAFLQIWii\nigBG6VAetTt0qA9aaAUUtIKWgQUUUUAIabTjTaYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\nAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU4U2nCgBaKKKQC0h6UtIelADaeB\nxTKmQfKKGNEZBpMVMRTCKVwGCnCkxRTGLmjNNzRmgB2aM03NGaLAOzRupuaSiwXHZpM0lFAhaMUo\np1AEeKKeRTaAEpaSlFACinCminA0hi0lLSUDCiiigAoPSikNADaKKKYBSUtJQJhRRRQAUtJSigAo\noooGFFFFAgooooAKKKKACiiigYtFFFAC0UlLSAKKKKAEopaKAEpMU6jFADaKXFGKYDaKWjFAhKKd\nijFADaWlxS4oAbRTsUYoGNxS4p2KMUgExRS0UAJS0UUAFFJRQAtJRRQAlFFJTAKKKKBBRRRQAUlL\nSUAFLSUUAFFFFABRRSUCCiiimIUUUUUgEooopgFFFFABSikpaBi0lFLSGFFFFAxadSLTqAExQRTq\nCOKAIjQOtOIptAEo6UuKROlOoEJS0lApCFoopaAGt0qA9anbpUB600AopaQUtAgooooAQ02nGm0w\nCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK\nKKKACiiigApwptOFAC0UUUgFpG6UtI3SgBtTp90VBUq/dFDGh9IRS0UhjMU0ipcUjCgCE0lOIpMU\nxCUUYpcUAJRTtpo2UANpadspNtAAKdTQKWkMU000tJigBKUUmKKYC0UlFADs0opopwFIYtJRiikA\nUhoopgNNFFFMBKKKKBBRRRTEFFJS0gFopKWgYUUUlABS0lFAC0UUUAFFFFABS0lFAxaWkpaQBRRR\nQAUtJS0AFFFFABSYpaKAExRS0hoAKWkFLQAUUUUAFFFFABS0UUAJRRRQAUUUlABRRRQAlFFJTAWk\noooEFFFJQAUUUUAFFFFABRRRQAUUUUCCkoopiCiiigBaWkpQKQxKSlNGKYCUUUtABRRRSGFLQKKB\nhRRRQA5KkqJTzUgoELRRRSAYaYakamGmMchp5qJTg1L2oEITQDTWpM0gJM0ZpgNFACseKiNPPSmU\n0JiilpBS0CCiiigBDTacabTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK\nACiiigAooooAKKKKACiiigAooooAKKKKACnCm04UALRRRSAWkbpS0jdKAG1Mo+UVDVhR8ooY0FKK\nMUtIBKDS0lMCMijbT8UuKQDNlG2pMUlADdtLilooAMUhFOpKAGEUmKfRSGMxS4p1FADMUbafiigB\nm2jbT6KAGhaXFLRQAmKaRTzTDQA00lKaTFMBKKKKYwpKWigBKKKKCRKKKKYC0UCikMWiiigYlLSU\nUCFopKWgAoopKAFopKWgApaSigY6ikopALRSUtAC0UlGaAFoozSZoAWikooAKKKSgYtFFFABS0lF\nAC0UmaM0CFpKKKACikooAKKKSmAUUUUCEooooAKKKKACiiigQUUUUDCiiigQUlLSUwCiiigQUUUU\nAKKUGkopDFNFJT05FAxlFKwwaSgApaSloAWkpaSgYUUUUAFSKeKjp6GgB9FFFIQjVGakNMNAxtSA\n8VHTlNMBWplPamgUCFAp2KBThSENYcVEambpUJpgKKWkFLQIKKKKAENNpxptMAooooAKKKKACiii\ngAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKcKbT\nhQAtFFFIBaRulFDUANqyv3R9KrVZX7ooGLRRS0AJRRRQAlLSUUgFpKM0maAFopM0UDFpaSigQUUU\nUDEooooAKWkopAFLSZooAWkoppNACk000hNFMAxSgUopRQBEwpKlccVFTGFFJS0AJRRRQISilpKY\ngpaSigBaKKKQwooooAKKKKACiiigAooooAWikpaACiiigYtFJRQAtFJRQAtFJRQAuaWm0UALRSUU\nALRSUUALmjNJRQAtJRRQAuaSiigAooooAKKKKBBSUUUAFFFFAgooooAKKKKACiiigAooooASiiim\nIKKKKACiiigBRSkUCnYpFDKcpwaSkoAc1JQaKACgUUUDFpKXNJQAUUoGaDQAlOU802gUATUUg6Ut\nIBKa1OpDQAw0lKaSmBIORSUIaDSEKDS5pmaUGgBWPFRGnk8Uw0xMUUtIKWgQUUUUAIabTjTaYBRR\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\nABRRRQAU4U2nCgBaKKKQBSGlpDQAlWh0FVatDoKBhRRRQAUUtJQAhphNPNRtxSGLmjNMzS0AOzRm\nm0UAPzRuqPNJuoAk3UZqPNANFgJc0ZqPNLmgB2aN1MJpuaAJN1G6o80ZosFyQtTS1MzRTsFxc0oN\nNoBoESg0uajzS5pDHnmo260u6kNMBKKSloGJRRRQIKSlopiEopaSgBaKSloAKKKKBhRRRSAKKKKA\nCiiigAooooAKWkooAWikooAWikooAKKKKAClpKKAFopKKAFopKKAFopKKACiiigAooooAWkoooAK\nKKKACiiigQUUUUAFFFFABRRRQAUUUUAFJS0lABRRRTEFFFFABSikpRQMdilFHakpDEPWkoNFAC0l\nLSUALRSUtABRSUtACrQaSigYUUUtACqadmmCnUAOpDSZopANNJSmkpgKDSmm07tQAhpM0GkoEKTT\naWkoEOFLSCloEFFFFACGm0ppKYBRRRQAUUUUAFFLRQAlFLRQAlFLRQAUUUUgCiiigAooooAKKKKA\nEooopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFOFNpRQA6ikpaQBSGlpDQAlWh0qqKsjpTGLRRR\nSAWkoozQAVG1PJpjUhjKKMUuKACilxSYoAQ02lNJTQgpaQUtAxaKKWkA0im1KRTCKYhtFFFMQUUY\npQKQxMUYp+KMUXCwyin4pMUANozS4pMUAFFFFAwooooAKKKKACkpaSmIKKKKAFopKKAFopKKAFoo\nopAFFFFABRRRQAUUUUAFFFFABRRRQMKKKKACiiigAooooAKKKKACiiigAooooAKKKKBBRRRQAUUU\nUAFFFFABRRRQAUUUUAFFFFABRRRQAUlLSUxBRRRQAUUUUAFFFFAx60GkBopDA0lKaSgBaSlpKACl\npKKACnCm0tACkUlLmkoGFFFFABThTactAC0UtGKQDTSGn4pCKAGUopCKUUwA02nkZppFBIlJSmkp\niHCikFLSAKKKKAEpKWkpgFFFFABRRRQAtFFFIAooooAKKKKACiiigAooooAKKKKACiiigBKKKKYB\nRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSikpRQAtFFFIBaQ0tIaAEFWRVYdas0DQtFJS0AJRRRQA\nhpppxpKQxAKXFKKKAExQRS0UAMIphFSmmkUAMopSKSgBRSim04UAOppFPpDTEREUYpxFAoAQClpQ\nKWkMSiijNABSUZooAMUmKdSUAJikIp4oYcUwGUlFFABRRRQAUUUUwEooooEFFFFABRRRQAUUUUAF\nLSUUALRSUtABRSUUALRRRQAlFLRQAUUUUAFFFFABRRSUALRRSUALRSUUALRRRQAUUUUAFFFFABRR\nRQAUUUUgCiiigAoopKAFooooAKKKKACkpaSmIKKKKACiiigAooooGKKWkpaQwpKWkoAWkoooAKKK\nKACloooGFFFFABRRRQAtA60lFAEgpaap4p1ABTTTqQ0hDaMUZozQMdikNANITQIQ0ynE02mJiilp\nBS0CCiiigBKSlpKYBRRRQAUUUUALRRRSAKKKKACiiigAooooAKKKKACiiigAooooASiiimAUUUUA\nFFFFABRRRQAUUUUAFFFFABRRRQAUopKUUALRRRSAWkNLSGgBB1qzVYVNmhjQ7NGaYTSbqQyTNFMD\nUuaAHUlFFAC0UlFAC0UlGaACg0ZpKAEIpMU6koAbSig02gB+aM0zNGaYCmgUmaAaQD6KbmlzQAhp\nKCaSgBc0maSimA7NGaSigBwNDHim0GgBKKKKACiiigAooooASiiimIKKKKACilpKACiiigAooooA\nKKKKACiiigAooooAWikooAWikooAWikooAWiikoAWikooAKKKKAFopKKAFopKKAFopKKAFpKKKAF\npKKKACiiigAooooAKWkpaACiiikAUlLSUxBRRRQAUUUpoASlpKKBhS0lKKAFooopDCkoooAKKKKA\nFooooGFFFFABRRRQAUUUUAOU07NR07NADs0hNNooAKKSnCgBKQmlJppoEFJS0lMkUUtIKWgAooop\nAJSUtJTAKKKKACiiigBaKKKQBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACUUUUwCiiigAooooAKKK\nKACiiigAooooAKKKKAClFJSigBaKKKQBQaKQ0AFSVGKkxQxoQ02nEU00DFFOFMpwpAPFFJQKAFpa\nSigAooooAKKSloAKSlooAaaaaeaYaBDaKKKYBS0lFADs0maKKBhSUtJQIKKKKACiiloAKKKKBiUU\ntFACUUUUAFFFFMAooFLQAlFFJQIWkoooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\nooooAKKKKACiiigAooooAKKKKACiiigQUUUUAFFFFABRRRQAUUUUDCloopAFFFFABSUtJTAKKKKB\nBSmkooGFFFLQAlKKKKAFooopDEooooAKKKKAClpKWgYUUUUAFFFFABRRRQAUtJRQAtFFAoAWilpp\npAIaBRQKYARTae3SmUEiilpBS0xBRRRSASkpaSmAUUUUAFLSUtABRRRSAKKKKACiiigAooooAKKK\nKACiiigAooooASiiimAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUopKUUALRRRSAKQ0tIaAAdalq\nIdamoY0NNNNPNNNIBtOFJSimAopabmjNIY7NFNzRmgB9FNzRmgB1FNzS5oAWikzRmgANNNKTTCaA\nENFFApiFApcUq07FAxmKMU/FGKAI8UVJikKUAR0op22lAoAQLShKXNJuoACAKbSmkoKA02lpKBMK\nKKKYgFLSUUAFFFFAhKKKWgBKKWkoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKBBRRRQAUUUU\nAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQMKWiikAUUUUAFFFFABRRRQAlFFFMAoopa\nAEpaKKACiiigBaKBRikUFJS0lAgooooAKWkooAWiiigYUUUUAFFFFABRRRQA4UUgpaAFppp1IaAG\n0UUtAA3SmU89KZTJYopaQUtAgooopAJSUtJTAKKKKAClpKWgAooopAFFFFABRRRQAUUUUAFFFFAB\nRRRQAUUUUAJRRRTAKKKKACiiigAooooAKKKKACiiigAooooAKUUlKKAFooopAFIaWkNAAOoqaoR1\nqWgaCmmlpDQAlFFLSASkp1JTASilpKADNGaMUoFAwzS0AU4CkAlGKdiigBpFNIqSmmgCOgCnEUAU\nxCinCkopDHUUzNLmgY+mk0hNNJpjHZozTQaWgAJzQBQKXFMBKSnEUAZpANIpKkxTStMQ2kNLQaBD\naKWigQlFFFABS0lFAC0lFFABRRS0AJRRRQAUUUUCCiiigYUUUUAFFFFABRRRQIKKKKBhRRRQAUUU\nUCCiiigAooooAKKKKACiiigAooooAKKKKBhRRRQAUtJRQAtFFFIAooooAKKKKACkpaKAEpRSUopg\nBooNFIAooooGKKWm08UDEpDTqaaAEooooEFFFFAC0UUUDCiiigAooooGFFFLQIQU+m0ooAWkoopA\nJRQaSmMCabTjTaZDFFLSCloEFFFFIBKSlpKYBRRRQAUtJS0AFFFFIAooooAKKKKACiiigAooooAK\nKKKACiiigBKKKKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSikpRQAtFFFIApDS0hoAB1qTNRCn\nUDQ7NJmkooAWikooAWikooAKUCilAoGKBRilFLSATFLSUtAC0UmaKACkNFIaACikpQaACg0tJTGJ\nRRRigYlJTsUpFADRQRTlFDntQA0Gn5xUdOBpiHMaaDQTmigY7NNJopKAENFLSUgEooopkhSUUtAh\nKKWigBKKWkoAKWkpaACiikoAWkopaAEopaSgAooooAKKKKACiiloASiiigAooooAKKKKACiiigAo\noooAKKKKBBRRRQAUUUUAFFFFAwooooAWikpaACiiikAUUUUAFFFFABRRRQAlKKSlpgLSUUUhhRRR\nQAU4Gm0ooAWkNLSGgYUlFFAgooooAKWkooAWikpaBhRRRQAUUUUALQKSloAWigUtIBppKcabTAQ0\nlKaSmSxRS0CigQUUUUgEpKWkpgFFFFABS0lLQAUUUUgCiiigAooooAKKKKACiiigAooooAKKKKAE\nooopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFKKSloAWikpaACkNLSGgBBTqaOtPpDCjFFFIBKK\nWkpgFKKSlFAxcUtApaQBRmikoAKWiigBaKKSgApppTTSaADNApKcBTGLRRRQMKKKSgYuaSg0CgBw\n4FMPWgmgUCFxxSU7NNoAKKUCigAoopKAFpDRS0wG0lKaMUCY2lpKKCRaKKKACiiigAxS4oozQMSi\niigAooooAKKKKBBSUtFACUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUtJRQAtJS0UAJRS4pKACiii\ngAoopaAEoopaACiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUwCgUUUALRRRSKEooooJCi\niimAUUUUhhS0lFAxaKKKAAUppKWgBKWkooAdS00UtIBaaaWkNMBDTaU0lMli0tJS0CCiiikAlJS0\nlMAooooAKWkpaACiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAlFFFMAooooAKKKKACiiigAoo\nooAKKKKACiiigApaKKACiiigBaQ0UUAA60+iikxoKMUUUhhSUUUAJSiiimA4UtFFIAooooAKWiig\nAppoooAQ0lFFAxQKWiimMKSiigYUmaKKACjtRRQISloooAWjFFFAxaSiigQUGiigBKXNFFACUCii\nmA00lFFBDCiiigApaKKACiiigYUUUUAFFFFIAooopgFFFFABSUUUCCiiigAooooAKWiigBKKKKAC\niiigAooooAKWiigAooooAKKKKAEooooAWiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAF\nJRRTAKKKKAFpaKKBiGiiikAUUUUxBRRRSGFFFFABS0UUDCgUUUABooooAKWiigAooooAaaSiimSx\naWiigQUUUUAJSUUUAFFFFABS0UUAFFFFIAooooAKKKKACiiigAooooAKKKKACiiigD//2Q==', 'asha1', '2016-09-12 18:21:44', 'asha1', '2016-09-12 18:21:44', 'wasqfrtgyhug');
INSERT INTO `hm_patient` (`Patient_id`, `PinCode`, `Village_id`, `City_id`, `District_id`, `State_ID`, `Country_ID`, `Card_Type_id`, `Gender_Id`, `Cast_Category_Id`, `Patient_Salutation`, `Patient_FName`, `Patient_MName`, `Patient_LName`, `Patient_DOB`, `Patient_Age`, `Patient_Language`, `Patient_POB`, `Education`, `Patient_BPL`, `Patient_Marital_Status`, `Patient_Contact`, `Address_line1`, `Address_line2`, `Patient_Emergency_number`, `Patient_Ward`, `Patient_Image`, `Created_By`, `Created_Date`, `Updated_By`, `Updated_Date`, `Card_Number`) VALUES
('asha1514', '41001', 1, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Kamla', 'Purushotam', 'More', '1990-09-12', 26, 'Marathi', 'Satara', 'Literate', 0, 'Married', 4294967295, 'Satara road', '', 4294967295, 'Qa', '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAKBueIx4ZKCMgoy0qqC+8P//8Nzc8P//////////////\n////////////////////////////////////////////2wBDAaq0tPDS8P//////////////////\n////////////////////////////////////////////////////////////wAARCAPIBRADASIA\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwB3mUeZ\nUOaM0wJt9LvqDNGaAJ99G+oM0ZpAT76N9Q5ozTAn3ijeKgyaM0gJ9wo3CoN1G6gCfcKXcKr7qXdQ\nBPuFG4VBuo3UwJ8ijIqDdRvpAT5FGRUG+l30wJs0uag3mjfSAnzRmoN9LvoAmoqHfRvpgTUVDvpf\nMpAS0VFvo30AS0VF5lLvoAkoqPfRvoESUVHvpd9Ax9FM30b6AH0UzfRvoAfRTd4o3CgB1FN3CjcK\nBDqKbuFLuFAC0Um4UbhQAtFJkUZFAC0UmRRmgBaKTNLmgAoozRmgAoozRQMKKKKBBRRRQMKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKQ0tFAhKSnYoxTAjNMqbFJsFAyLFFS7RRsFICKlp+yjZQBBRSUUALSUUUALSUUUAFFFFAC\n0lFFAC0UlFAC0UlFAC0UlFAC0UlFAC0UlFAC0UlFAC0UlFAC0UlFAC0UlFAC0UlFAC0ZpKKAFzRm\nkooAXNGaSigBc0ZNJRQAuTS5pKSgB2aMmkooAXJo3UlFAC7jS7qbRQA7dRuptFADt9G802igB26l\n3mmUUAP30bzTKKYD99G+mUUASb6N9R0UgJN9HmVHRQBL5lHmVFRTAl8yjzKiooAm8yjfUNFAE2+l\n31BmjNAE++jeKgzRmgCfeKN4qDNGTQBY3ijcKgyaMmgCfcKNwqDNGTQBY3CjcKr7jRuNICxuFGRV\nfcaNxpgWM0ZFV9xpdxoAnzRmoN5o3mkBPmlzVfeaXeaYE+aKg3mjzDSAnoqDzKPMNAE9FQeZS+ZQ\nBNRUPmUvmUAS0VF5lHmUAS0VF5lL5lAElFR+ZR5lAiSio/Mo8wUDJKKZvFG8UAPopm8UbxQIfRTd\n4o3igY6im7xRuFADqKTcKNwoELRSbhRuFAxaKTIoyKBC0UmRRkUALRRmjNAwoozRQIKKKKBhRRRQ\nIKKKKACiiigYUUUUCCiiigYUUUUAFFFFAgooooGFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFA\nBRRRQAUUUUAFFFFABRRRQBUooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAo\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAClpKKAFopKKAClpKKAFopKKAFpKKKAFopKK\nAFopKKAFopKKAFopKKAFopKKAFpKKKAFopKKAFopKKAFopKKAFopKKAFopKKAFopKKAFopKKAFop\nKKAFozSUUALmjNJRQAuaMmkooAXJoyaSigB2aMmm0UAO3GjcabRQA7caNxptFADtxpd5plFAD95o\n3mmUUAP3ml8w0yigB/mGjzDUdLQA/wAw0vmGo6KAJPMo8yo6KAJPMpfMqKigCXzKPMqKimBN5lHm\nVDRSAm8wUeZUNFAE/mCjzBUFFMCfeKN4qDNGaAJ94pd4qvmjNAFjeKN4qvmlyaAJ9wpdwqvk0ZpA\nWNwo3Cq+TRuNMCxkUZFV9xo3GkBYyKM1X3GjcaALGaM1BuNG80AT5pc1X3mjeaALGaM1B5ho8w0A\nT0VB5ho8w0AT0VB5hpfMNACbRRtFLS0ihu0UbBT6KAGbaNtPooAj20bafRSAZto20+imAzZRsp9L\nQBHso2VJRQIj2Umw1NSYoAi2mkxUpFJigCPFGDT8UuKAI8UYNSYoxQBHg0YqQimkUAMop1JTEJRR\nRQAUUUUAFFLS4oGNop+KMUgsMop2KXFAWGUU/bRtoCwyin7aNtMBlFP20baAsMop22jbQFhtFO20\nbaAsNop22jbQFhtFLijFAhKKdto20BYbRTttG2gBtFO2mk2mgBKKXBoxQAlFLijFACUUuKSgAooo\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAFpKKKAClpKKAFopKKAClpKKAFopKK\nAClpKKAFopKKAFopKKAFopKKAFopKKAFopKKAFopKKAJaKKKRQopaQUtIAooooAKSlooASiiigBa\nKKKAFooooAKKKSgQGkpaKBjaWiigBKWkpaYBTTTqaaBCUlLRQA00lKaSmIKKKKAFFOFNpwpDFooo\noGFFFLQAUUUtABRRRQISiiigAooooGGKKWigApMUtFADaKWigAxS4oFLSATFLiiimIMUmKWigBMU\nYpaKAExSYp1FADCKaRTzTGoAbSikpRTEOAoxSilpDGYpKcaSmA2ilpKBBRRRQAUUUUAFFFFACgUu\n2gU6kMYRRTzTKAEpcUUooATFGKdS0AMxRin4pQKAsM2mjaakxRii4Ee2kxUuKMUARYoxUmKTFADM\nUYp+KMUAMxRin4pwUUARYNGKn2ikK0AQ4oxUm2nbaAIcUYqbYKNlAEOKMVJtp2ygCHFFSlKaVoAj\n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\nTbSYp26l60BYZikxUmKMUXFYZilApxooGJilxRS0hiYpNtOooAZtoxT6KAsR4op+KQrTuKwylzQR\nSUybC5pKKKBBS5pKB1oAfTs8UmMChOhpDDrSFaDxSg5oAQcCkp56UygAoopaACgUUooGPXpTxTVp\nwoELSUtJQIWiiigAooooAKKKKACiiigAoNFFMCMjmnKKDSikMKWiigQUUUUAFFFFABSUtJQMKa1O\nprUANpaSloGFOFNpwoELQaKDQBEetJSnrRQMSnCmZp6mkAEUwipKQigBqin9qQCloAZRTjTKACg0\n4CgigBlGaUim0wFpKKKACiiimIUGnCmqKkAqRhimkU+kxQAzbS4p2KM0AJRijPNLQAwim09qZTAc\nDQTTaKBAaKKKAHA0uabRQMdRTc0UABpRRinKKAHUtJRSAWkopKYCGkNKaSgBKSloxQAUtFKBQAop\n1IKWgQUUUlAC0lLSGgBKSlNNoGFFFFAgpaSloGFFFFIAooopgFJRRQIKBSUooAWmNT6YaYDaWilA\npAAFOxQKWgYmKMUtGKBCYop1JQA2kNOpDQAlKKSloAWikooAWkoooAQ0YpaKAACn9BTaDxQJjWNN\nozmlApjSACnAUoFLSLQUmaQmmk0A2OJpM02igm4uaSiimK4UoNJRQA8NTqip6mkUmOoxRS0hiUlO\npCKBCA0tJjFKKBhRS0lABRRRQAYppWnUUAM20hGKkNN6imS0AwRTejUdDR1NBI89KahwadnimDrQ\nNEjCmin9RTCeaABjSUdadigBMUoFGKUUDDFGKWikA5adTVp1MQtJRRQAtFFFMQUUUUAFFFFABRSG\nmlqAH5pCaZupC1Idh+aUUxaeKAFooooEFFFFABRRRQAUlFFAwpDS0GgBlFKaSgApwpKUUALQaBQa\nAIj1pCaU000DG05TTaUdaBEgNFIKKQxwpaQUtADWpgp5puKAHCg0CkNAAaYadmmmmAYoxSgU4ikB\nHSgc0u2lApgKop9NFLmkAtFNzRmgBTTTTqQigBop3agCg0AMNJin7aMUwGYpKeelM70CCinY4pMU\nDAClIoFBoASgUUUAOFLTQaUUgH0UtJQAUlLSGmAlJS0lABRS0UAGKUUtFABS0UlAgoopKAFpKKKB\niUhpaSgQUlFFAC0UUZoAWkozSZoAWikozQAtFGaKAEpRSUCgB1NalpDTAbThSU4UgFFLSUtAwooo\n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\nDFpKKKACiiloAMUmKdSUCEooopgNpaKSkMWkIpaKAG4pSaDTTQIenWnMc0i8CjvQMBSGlpDSKGGk\noNFUQKKUUgp4FIpCgUtJSikAUtFLimISiiigApKWigAooooAKKKTNAC03NIWppNADs0mabS0AOBp\naaKWgYtLSUUgFooooAKTFOpKAEopaWgY2lpKKACilpKAFprCnUh6UCYqnIxS45pidakpiFApaBS0\nCEooooAKWkpaACiiimIKDRSGkA00lFFIoKKKKBhRRRQAUUUUAFKKSlFADxRQKKZAUUUUwCiiikAU\n006mtQMZQKDQKAHCnCminCgBaa1OprUCIqQ0402gYlLQBRigYtIaKXFACZpM807HFJigBwoNIDQT\nSAUU4UynA0ALSUZozQAtLTc0uaAFoozRmgAopM0ZoADTSaUmmE0ALmlBplLTAfmlzUeaUGkBJRTQ\naWgAJpM0hptAD91NJpuaUCmAlKKSloAMUYpRSikA2gGnEU00wJKKbS5pALRSZpM0wHUU3NFADqSi\nigBKQ0tIaBCUopMUooAcKDQKWgBpFNNPNNNAxtJS0lAgoopRQAUlLSUAKKWminCgYtFFFAhpptON\nNpiCiiigBaUU2nCkMcKWkooGFLSUtABS0lLSAKKKKYhKSlpKACkpaSgYClpKKAA0gHNLSqKAHAcU\ngpegpKBoKRqWmmkDGUUUVRI5akHSmLT6RQUtITTd1AiSgmoy9NLUAS5pM1HupQ1AD6M03NI1ADwa\nDTVpaBiE0004ikoEJiiikoAXNFGKXFACZozS4pMUAOBpaZ0pwNIYtKDSUlADqKKKAG07NJS0AFFJ\nS9qYXEooopDClpKKAExhqkptOoJY4UUCimIKKKKAClpKWgQUUUUwCkNLTWpDQ2iiikMKKKKACiii\ngYUUUUAFAooFADxS0gpaZAUUUUwCiiikAU1qdTGoGNooooActOFNWnigAprU6mtQIiNJipNtG2gY\ngFLilooAbiilooGJSGloxQA00lPIpMUAAFFLRQAlJingUuKAI8UtSYoxQAyin4oxQBHRzUmKNtAE\ndNxU22k20CI8UYqTbS7aBkWKXFSbaMUAR0uadto20AMNNxUu2jbQBFilxUm2jFAEeKNtSYoxQAzF\nKKdijFADaaRT8UYoAbRS0UCEopaKAEoxS0UAFGKWigBMUYpaKAG4opaSgBaKSimAE0lJRSAKQ06k\nNADaWiigYUlLSUCClBptLmmA7NBNNzRmgANJRRQIKKKKACnCkpRSGLRQKWgYUtJS0ALRRRSAKKKK\nYCUUUlAgpKDSUDCiiloAKUUlLQA7qKSgGloGhKa1OppFADKUUUCmIevSlzSdqKkYhNNp1NpiCiii\nmAUUUlADgadTBTxSGOFFApaQDTSUppDQAhpKWkNMQUmaKXFACZpc0BaXbQAlKKMUAUAOooxRSGAp\naTFAoGLSmkpaBDKcOlIRSjpTEFJS0GgoSiiikAtOFMpwoEx4opBS0yQooooAWiiigQUUUUAFNNOp\npoGhtFFFIYUUtFACUUUUDCiiigAooooAeKWkFLTICiiimAUUUUgEpppxpp60DExQBS0CgBRTqQUt\nABTTTqQ0CEpKWkoGFFFFABSUtFACUUYoxQMKKMUUAFGKWloAQU6iigQUUUtACUUtFMBKWkooAWkp\naKQBRRRTEFFFFABSUUUhhRRRQAUUUUAFFLRQAlFLSUAJRilpaAIc0ZpmaAaAH5ozSZozTAXNGabm\ngGkA+kopKAFzRmm5ozTAdmkzTSaTNAD6SkzRSAKWkooAWkpaSgYUUlLQAtIaKKBDaKKKYgooooAK\nKKKACiigUALRSijFIYCnCm0ooAdRRRSGLRRRQAUUUtADaQ06kNMBtJS0lABS0lLQAUUUUAKKWm04\nUDQUhpe1JSGMNKKCKB1piHdqKKDSGNJpKDRimSGaM0YpcUAJRS4oxQAlSIOaaBUiCgBxFNNOamGg\nEIaSloxSGNoxS0uKYDaKdijFACZozS4oxQAlKBRiloAKKKKQBSUtFAAKWkooADQOKWmnrQA6kNGe\nKKYCUUUUhhSikpaAHrS01TTqZDCiiigBaKKKBBRRRQAU1qdTTQNDaKKKQxaSiigYUUUUAFFFFABR\nRRQA8UtIKWmSFFFFAgooooAQ0w081G1AwzThTKcKAHilpBS0CCkNLQaYDaKdSGkMSilpKACiiloA\nSkp1NJxQAtFN3UbqAHUUzdRuoAkoqPdS7qAH0UzdRuoCw+imhqXNAWFopuaM0AOopu6jdQA+imbq\nXdQFh1JSZpN1ADqKbuo3UAOopuaN1ADqWmbqN1ADqWm5o3UAOopuaM0AOopuaM0BYr0U7FJigAzR\nmkIopgGaM0UUgHZozSUUAIaSnGm0wCiiloASlFFKKQC0uKBS0ANpKdSUDEoxS4oxQAlJSkUhoEJR\nRRTEFFFFABRRRQAUUUUAOFOpgpwNIYtFFFABS0lFIYtLSUtABS0lFAC000tNpgBptLSUALRRRQAU\nUUUAFOAptPWkAlFKabQUI1IOtOPSm96YDxQaBRSAbilpcUYpiEozRijbQIKMUuKcBmgBAKeoxQBi\nnUCGtTKc1NoY0JS0UYpDDFFLRQAlFLiimAmKXFLRQISilooASilpKQxKWiigBDQKWm9DQA6kopaA\nG9qM07tTOhoAWiiigYUtJRQA4daeKjp6mmSxaKKKBC0UUUCCiiigAppp1MNA0JRRRSGFFFLQMKSl\nooASilooASloooAcKWkFLTRLCiiimIKKKKQCGo2qQ1GaBiUopKcKAHCnUgpaACiim0xDqKSikMWk\noooAKWkFLQAlRtTzUZoASm0pNJQMKWkp4HFADaWg0lADqKQUtIAFLmm0tABTqaKXNABSUtJTAKWj\nNJQAtNpaMUAJRmgikoAXNGaBS0gEzRmlxRimACinAUYpAFFLRigBtLmjFFADcUYpaKYDSKaRT6Qi\ngBlLS4pKBC0UUCgANNNOppoAKKSloAWlFJSigB1FJRQAtJRS0DEpaKKAENMIqQ0w0CG0UUUxBRRR\nQAUUUUAFFFFAC0UUUhjhS00GlBoAWiiigYtLSUUgFoopKYBSUUlABRRRQAUUUUAFFFJQAtPWox1q\nQdKTAU0yn000FISm96dTTQA8Uopopy80ALijFPxSGmTcbijFLS0AIBThxRTS1Ah9JQOlKelMBhpt\nONJSKEpaSlHWkAUmacaaRQAZpc0yjNMCSim5ozSAWikooAWiikoAWikpaACmtTqQ9KAAUUgpaBi0\nhFFBoEAopAaU0AJRRRQMWlFJQKBD6UUgpRTJFooooEFFFFABTDT6YaBoSlpKWkMKKKKACiiigAoo\nooGFFFFAhwpaQUtMTCiiimIKKKSkAGozUh6VGaBiU5aSlWgB4paQUtAgptOppoGFFJSigBaQ0tNN\nACg0ppg606gBDTDTqQ0DGGkpTSUCFFOpopaQw70UUUAApTTaWgAzRmmmkzTAfRTc0tAC5pM0hooA\neKXFNzSg0gFApcUoooAaaZTzTDQAtGabRmmA8GlqMU7NIB9FNzSg0AOopM0tABSUtJQAlFLSUwCk\npaKAG0hpxFNNAhtKDSUUAOzTTRRQAlFFLTEApRQBS0hi0UUUDFopKWgApKKKBBTTS5pKYCUlLSUC\nCiiloASiiigAooooAWkopaBgKUUlKKQC0tIKWgYUtJRQAtJS0lABSUtIaBCUUUUALRSUUAFFFJQA\noqQdKjFSDpSGKKaw5p4prdaY0NpCKdSUhgKelMFPWgTJKQ0maTNO5NhaM03NJmgdhWakXk00mlQ4\nNAyXFBNJupDQICaSkzSZoGOozTc0lIB26kzmjFLQAUhFLQaAGdKcDSEUnegB1LTc0tAxc0U2lBoE\nLRSUtAC0UlLQAnQ0UhoBoGLQaKKBCYwaXtRQelACUUUUDClpKWgBwpwpgpwpksdRRRQSFFFFAAaY\naeaYaBoSloopDCiiigAooooAKKKKACiiigBwpaQUtMQUUUUCCkpaKAENRmpDUZoGJThTactADxS0\ngpaBAaaacabQMSlFFFAC0006mtQAi9adTVp1ACGmGnnpTDSGNNNp5puKYBT6ZS0AOppNGaQ0AFLQ\nKWkA00lONJTASngUgFPAoAaRSU40mKQBilAoAp1ABSZoJppNAATTaKXFMBKSlNGKAAU6kApaQBil\npKcKACiikoGOoNIKU0CCikpaYgooooAQ00inmmmgBlGKdSGgBtJTqSgApQKSlFAC0UUUALRRRQMK\nKKSgQtIaKDQA2iikpgFFFFAgpaSloGFJS0lABRRRQIKWkoFAxwpaQU6kAUtJS0hiUUtFMAopaKQD\naQ04000xCUlLRQAlFLSUAFFFFACipF6VFT1NA0SChhSClNAdRlFFFIoKcvSm0ooBimkpTTaBC0ho\npKAENFBoFMBwp9NUZqTFAiMikp5FMIoGJS0mKWkAoooFGaACijNGaAEpCKXNJQA2nUhoFMBaSnUl\nIBaKKWgApaSloARqZT26VHQA8UtNFOoGGaO1FFACCiiigAooooAWnimU5aBMfRRRTICiiimAGmGn\nmmGkNAKKBRSGFFFFABRRRQAUUUUAFFFFADhS0gpaYgooooEFFFFACGo2qQ0xqBjactJTlFADxRQK\nKBAabSmkNAwooFLQAU1qdTDQACnU0U6gBDUZNSNUdAxDRRRQAUGikoAKKTNFAhy06owadmgYhNAN\nJQKAHigtSUhoAeDml7VGtOJ4pAKTTS1JSUwFzRSUtAgFLSUUDClpKUUALS0lApALS0UtAxKSnUmK\nAAUpooNAgooopgFFJRQIKSlpKAEooooGJijFLRigQ3FJTyKbigAzRmkooAXNLmm0UAOopM0ZoAKT\nNFFABRRRQAlLRSUwFooooAKSlpKACiiigQUopKBQA4U6milpDFp1MpQaBjqKTNLQAUUUlIANJRRT\nAMUYpaWgBmKTFPIpKBDcUUtIaAEpR1pKBQMmHSlpimn0gGnrSU402goKKKKADNJmikoAWigUpoEM\nNKKQ0opgSrxSlhUZakzmgVh5am7qSjFAxc0madtoC0ANpaXbTtvFAXGhaNvNPA4oGM0CuRlTSEEV\nLkVGxzQAzOaUUbaBQMcKKBRSAKWkpaACiiigAbpUXepG6UwUwDNPBptKKBjqSiikAopKOlAoAKKK\nKAFpRSUUASClpF6UtMzCiiimAhpppxptIaCiiikMKKKKACiiigAooooAKKKKAHClpBS0yQooooAK\nSlooAQ0xqeajNAwp61HUi0AOooopiA02nGm0hgKWiigAphp5phoABTqaKCaAEY02lpKBhSUUlAC0\nhpRS4oAZRS4pMUCCiiigAopaTFAxRSmgCgigBtLRiloAXFIRRmgmkA2iiimAtJS0UAJTxTKcKAHU\nCkpwFIYUooooELRRRQAUGig0ANooooAKSlpKACiiimAlFKaSgApabSigQtIRS0GgBhptPNNpgJS0\nlLQAUUUUgCiiigAooooAKSiimAUUUUCCiiigAooooAKKKKAFFLSUtIYUUUUAKKWkpaBi0hoooASl\nFJSigQ4UUgpaBgaaadSUANpKWkxQISgUYpQKAHCpM8VEKeDQMcaZT+1NPWkNCUUUUDA0lFFACd6d\n1FNpRQIQjmkp5FNxTAbUsYpm2nAMKBEm3mjbzTdxzS7jQIcRQKYWNJuNA7DyRSFvSm5ooCwBzSZN\nKBRigBuDSgUtLSGJTSKfSGgBBSmig0AJS0lLQAUUUhoAa9NpWptMTHCnCmCnCgaHUUClpDCiiigB\nKKKKACloooActPpi9afTRDCiiimIQ02nGkqRoSiiigYUUUUAFFFFABRRRQAUUUUAOFLSClpkhRRR\nQAUUUUAIaYaeaYaBjakWmU9aAHUUUUxAabTjSUhhRRRQAGmGnmmHrQACgigUtADTTacabQMQiilN\nIaAFFLmmZpaAFpDS0lADaKU0lAhRS4pBTqBhSE0maQ0ALmikpcUAJRSkUUAGKCKWkoAAKXFApRSA\nQCnYpQKKBiAU4UUUCFopKKAClpuaUGgBaQ0tIaAG0tMzS5oAdSUmaTNMB1FJmjNAAaQ0pNNNAgzQ\nDSUUAPzRmmZozQApNJRSUwClpKWgBaKKWkA2ilpKACiikoAKKKKYgooooAKKKKACiiigAooooAKW\nkooGOpKSlpALS02loAdRTc0ZoAWikooAdmlzTM0ZoAfmkpM0UALRRS0DExSYp1GKAEoFFOAoAcOl\nNaloNIY2iiigYUlLSUAFJS0lAh45FNpVpcUwACpBTRS0CYuBScUUxqBJDjim8UlFBQtGaSigBc0t\nIKWkAUUtFACUhp1JQAlFLSUAFFFFACGkNLSUDGmm0402mSxwp1NFOoKQUtFJSAdRRRQAlFLRQAlL\nSUtACjrUgqIVIOlNEsWiiimSIaSlNJSGhKKKKQwooooAKKKKACiiigAooooAcKWkFLTJCiiimAUU\nUUgENNpxppoGJT1plPWgBaKKKYgpKU0lIYUUUUABphp9MNAAKdihRSmgCNqbinMeaKBiU1qXNIaA\nEpRRijFAC5optGaABqSgmigQtGaKSgYtFFBoABThzTKkWgAK0m2pKMUgI8UYpxpKADFAooxQMWii\nloAKWkpaBCUlLSUAJSA0ppKBjxS00U6gRCKM0lLTEFFFJQAuaM0lFAC5pKKSmAUUUUCFpKKKACii\nigApaSloGFLSUUgFpKKKAEopaSmAUUUUCCiiigAooooAKKWkoGFFFFAgooooAKKKKAClpKKBi0UU\nUgCiiigAopKWmAUooxRSAdS03NANAD6KbmlzQAlOFNpy0hoWg0UGgYlJSiigYlJS0UAJRRRQA4Cn\nUgpaBAKWgUtMkKaRT6Q0AR4op+KTFAxuKXFLiigBMUtFLQAlFLSUAFJRRSGFJRSUALSUUlAwopaS\ngBpptPam0yWKtOpq07NBSCkozSgUgFFLSUUALRRRQAlFLSUALUi9Kip6mmJj6KKKZAGmmnGm0hoS\niiikMKKKKACiiigAooooAKKKWgBRS0gpaZIUUUUwCiiikAhphp5plAxB1qQUwdaeKAFooopiCkpa\nSkMKKKKACmmnUw0AOFB6UChqAImNJmlbrTaACilAoIoGJmlzTaKBCmkooxQAUUYooAKBRRQA7FJT\nhSGgYAU8U1acKQDs0UlFAAaMUUUDDFFFFABRSUUALRRRQAUlLSUAFGKKWgAFLSUUgIaKKWqJCiik\noAKKKKAEopaKYCUUtFABRRRQAUUUUAFFFFIApaSloAKSlpKACkpaKYCUUUUCCilooASiiigAopaK\nBiUUtFABSUtFACUUtFACUtFFABRS0UgExRinUUANopTRQAoooooASiikoAdmjNJRQAtOWminCgaH\nUUlGaQwNFBpBQMDRQaSgAoFFFAxQaeKjpQaBMkpRTM0oNMmw7NJRmkoFYXNFJSZoHYXNGabmigYu\naM0lFIBc0ZpKM0ALTc0E0lAC0lFFABS0lLQMKKKKAGmm4p5puKYgpRRiloGFFLRSGFFFFAgpaSig\nBaDRRQISlFJRQMlU5FLUanBqSmQ0BptONNoBCUUUUhhRRRQAUUUUAFFFFABRRSigBRS0CimSFFFF\nMAooopAIaYaeaYaBiDrUgpgp4oAWiiimIKSlpKQwooooAQ0lOppoAUUjGlFNagBhoxSU4UDFApCK\nXNBpAMNJSkUYpgJilHWilFIBSOKYetPJphpgJRRS0CDNFFKBQMctOpAKdSASilpKACiiigYlApcU\nUAGKWiikISiiimAUlLRQMKKKKACilooERYpcU/FGKYhmKTFSYoxQBHtoxUmKTFMCPFGKkxRikAzF\nGKfijFADMUYp2KMUwG4pMU/FGKQDMUuKfijFADMUYp+KMUwGYoxT8UYoAZikxUmKMUAR4oxT8UYo\nAbikxT8UYoAZijFPxRigBuKMU7FGKAG4pMU/FGKAGYoxT8UYoAZijFPxSYpANxRTsUYpgNop2KMU\ngG0tLijFACUmKdijFACUUuKMUANoxTsUYoAbijFOxRQAlKKMUuKBi9qSnYpMUig7UlKBQaAEpKWi\ngBKKKKBhRRS0CEzTg1NNNoAlzRmo807dQIWkozSZoAWim5ozQA6jNNzRmgB2aTNJRQAtFFFABRS4\nooAKKKKBhRRRQAlFFFABRRRQMKWkpaACiiigQUUUUAANLSUUAKaSlpKAFqRTUVOU4piaJDTaWm0i\nUFFFFAwooooAKKKKACiiigApRSUooAcKKBRTJCiiigAooopgIaYaeaYetIYq08UxafQDCiiimIKS\nlpKQBS0UUDEpKWkoAWmNT6Y9AEfenUlKBQMTNGaXFIRSAM0UlLTAKSlxSUAFIadSGgBKKKWgAAp1\nAoNIABpwpopwNAC0lLSUAFLSUtABRRRQAUUUUgEopaSmAtJRRQAUtFFABRRRQAtFFFUIKKKKACkp\naKAEoxS0UAJikp1FADcUYp2KKAG4pcUUtACUUtFACUUtFACUUUUAFJS0lABRRRQAUUlFAC4opM0u\naADFLikzS5oEGKSjNGaACijNFAwooooATFFKaKQWEopcUtFxjcUYp1FFwAcUhoNJSGGKMUUuaAsG\nKMUhNJmgLD9tJtpVOaU8VRI3bS0hOaM0mMKKKTNIY7NNNBooASiiigYlFFFAxaKBRQIRqbTiabTE\nLSUtFACUUtGKAEopcUmKACiloxQAUtAFKBSAAKXFFFABSUtJQMKKKKACiiigBKKKDQAUUgNOoASl\npKWgYUUUUAFFFFAgooooATOKd2pppRQAUtFJQA8HiiminUEhRRRQAUUUUAFFFFABRRRQAUopKUUA\nOooopkhRRRTAKKKKQCGmHrTzTD1oGOXpTqatOoAKKKKYgooopAFFFJQAGkoNIKBjqjan0w9aAExQ\nKWikMUUEUUUAMNANKabTAdTTThQelIBBSkU0daeOlADMUuKfijFADaKdikoASlopaAEopaMUAJS0\nUUDClpKWgQUUUlAC0UlFABRRSUALS0lGaAFopuaAaAH0UUUxBRRRQAUUUUAFLSUUALSUUlAC0UlF\nAC0UlFAC0lFFABRRRQAUUUUAFJS0lABSUtJQAUUUUAFFFFACUZoooAWiiigAooooABTqSloGNPWl\npDQDSGBozQaSgYuacKbTugoExpNAoooGFFFFAgoNANLTsK4nSlzmmmlFAwNJTqSkMWkoFJQAUUUU\nAFFFJQAUUUhPNAC5oLU3NJTE2LmikFKKAFopaKQBRRRQAUUUUAFFFLQAUtJRQAtFJRQMWkoooAKK\nKKACiiigBKKKKAGnilBpDSUxD6WkB4opDFopKWgYUUUUCCiiigAoHFFFAC0UgOKWgApR0pKUUCFo\noooEFFFFABRRRQAUUUUAFKKSlFADqKKKZIUUUUwCiiikAhpnenGm0DHrS01adQAUUUUCCiiigApK\nWkoGIabTjTR1oAdTTTsUYoAbSU7FGKBjTSU/FIVoAZmg0uKNtADaM0/bSbaAG04Uu2gLQAtFGKMU\ngDNJS4o20AJS0YoxQAZooxRigBKWjFGKACijFFAC0lFJRYBaKKKAEpKWjFACZpCadikxTAbSil20\nYoAfRRRSEFFFFAwooooAKKKKACiiigAooooASiiigAopKBQA6ikpaBBRS0lABSUtFMBKSlooAbSU\n40mKADNGaSigAzQKSgUAOpaQUUAFFFApgKKdSAUtIY00gpTSUihTSUvakoAUUE0UlABS0lFABSUt\n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\nlptLQAtFJRQA6lptLSAWikpaACiiigBKKKKAClpKWgAooooAKKKKACiiigApKWkoAO9SDpUY61IK\nYmLRRRTEJRRRQMSkpaQ0hjTRRRSGBptONJTAKdjim0tCExyjmn0xafTExGGajNS0hXNArkVLinbc\nU00DEzSUUUAFFFJSAWiiigApRSUooAcKSlFJQAU006m4piCkpcUmKAClpKWgAooooAWikpaADNOB\nptFMB+acKjBp+aQDqKQUtABRRRQA0rTSKkppoGmMopSKSkMKDRSDk0DFAyakxxTRxSk8UxMQAGkK\nmnClouIixRUhGaYVxVJiEzSh6bRQBIDmlqIGng5qWhit0qMcmnseKRRxQFhr9cUqLQRzThwKYIWg\nUlKKTGBpven009aESxppKcaTtVCQtL2pBS9qllIQ0lONNpFiinUgpe1BLEFOFMp69KYh1FFFIQU1\nqdSGgCOlAopRQMcKWkFLQIKKKKACiiigApDS0hoAYaUUnenYoGKKKBRQAUUUUAIaBQaBQAooPSik\nNADTTGp5phoGIKKSloAXNLTaUUgHUtJS0ALRSUtABRRRQAUUUUAJRRSUALRRRQAlFLRQAlFFFAwo\npaKAEooooAiopaKYhKKWigBKKXFLigQ2loxTgKBiUtLSUAFFFLQAUtFFIApaSloAKSlooAKKKKAC\niiigAooooAKKKKACiiigApKWkoAVetPpq06mIWkpC2KaXphYfRUe40bqQ7D6aaN1HWgBKBShacBi\ngdxuKAtOooFcaVpADUmKTFMQgFOBpKKAHUUmaM0CFpCoNLmigBhSmlKlooAi20baloxQFyPbRtp+\nKMUAN20baDmk+aiwDsUbaZlqNzUWAfto21HvajeaLAP20baZvNG80WAfto200SUvmUAG2k207eKX\ncKAGbaTFS5FHFAEWDRUuKTbQBHSg07bSFaYDhzTqjGRUgpAFFFJQAtIeTRRQAmKY3BqQ0zbk0hoa\nBTgKXAFJmmULTWpc0maBCqTTgaaKWgB1IaTNLmgBhFMPFS00ii4hlGcUEYptMQ8fMak6VGnFSdKT\nGAGMk00mlJpuaCkLTlpmacDxSBj6aetLkUhPNNEMaaKWjtTYkIKcOlMFOBpMoDSUppKChR0pTSCg\n0hMbUq9Ki71KvSmIWiiikIKQ0tIaAG0opDQKBjhS0CigQUUUUwCiiikAUhpaQ0AN706mjrTqBhRR\n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\nF61JSGGKTFLmjNADaKCaTNAxaM03NJmgB+aTNN5pQDQAE0opQtLQAlFLSUgCiiloAKKSigBaKSlo\nAKKKKAAjNRsMGpKQjNNMViKipNtG2ncViOin7aTbRcLDaKUrSYouFgooxRRcLC0UlKKdxD161KKh\nB5qYUmAtFFFIAooooAKaadTTQMSnCmU4UAOopBS0CCiiigAooooAKaadTWoGNoopRQAopaSloAWk\npaQ0AJRRRQAU00tI1ADaaaDSUAFFLiigBKWigCgBKUUu2jpQAYpCKdmjGaBjaKXFLtoENoxT9tKF\noAZzRUm2l20AQ4pcVLtFG2gCLFGKlxRigCLFGKkxRtoAixRipdtG2gCOin7aMUANopaKBhRRRQIS\niiigYtJRRQAUtJSigQUlLRQAlLSUtMBaWm0tIBaKKKAEooopALRSUtMAooooAKKKYxoAUtTh0qMc\nmn9qBjWoTrSNSKcGgCagUmc0A0CHUhFLRTAjNJuwaeRUbCgBxIoBpgFPAoAdmjNJzSikAuaWm4op\ngOxRikFLmgA6UA01jk0A4NAWH0UlLQITFIVp1FAEZWk21LikxQA1RzT6BRQAUlLRQISkxTqSmAmK\nMUtFADcUYp1FADcUYp1FADcUYp1FAxuKMU6igBuKMU6igBuKXFLRQAlI3SnUhFAEPQ08GgrSYNJl\nDiaaTRtNG2kFxuaOTTttPA4oAi2mnBafilxQAyloNJQMWikozSAWkozSUALRSUooAKKKWgAooooA\nKKKKACikzS0AFJSmkoAKKKSgAooooAMUYoopgJimnrT6MUCsIo5qYVGKkFAMWiiigkKKKKAA0w08\n000DG04U2nCgBaWkpaBBRRRQAUUUUAFManU00DEFLRS0AFLSUtAC0006kNADaWkpaAENJjNKaBQA\n0rSbakoxQBHtpdtOpKAE20DrS0YoAKbinYoxQMQCnYoooEFKKSloAWikpaACiiigAooooAKKKMUA\nFFFFABRRRQAlFLijFADKKKKACjFLRQAmKTFOooASkxTqSgBKKWigAopaKAG0UtFACUtFFABS0UUA\nFFFFACUUtFACUtFFADWPFMpzHmmimMegpxpFpTSAjppp5ppFACqadmo6UGgCYGlqNTTwaBC01hmn\nUUwIgOakAoIpRQIMUYpaKAExS4oooAMUhpaDQBGTTc1IVzTdlA7huqQHIpgWngYFAgooooAKKKKA\nCikpaACiiigQUlLRQAlFFFMAooooAKKWkoAKWkopAFFFFABRRS0xiUUtFIBKKKWgBMUYpaKAEpOt\nKelMDUDBjg0oNI2CKaDikMfmgmkzR1oASkzSsCKZigB2aTNJijFABupM0uKTFAADThTRS5oAcKWm\ng08CgYUUtIaQgpKKKBhRRRQAUUUUAFJS0lABRRRQAUUUUAFLSUUDFp60ynKaYmPooopkBRRRSAKa\nadTTQMbSiigUAOpaQUtAgooooAKKKKAEpppxppoGApabmloAdRQKWgAppp1NPSgAFLTQaWgANJS0\nGgAFLTM08UAJRilooASiiigBKKWigAxRS0UAFGKKKADFFLRTASilooASloooAKKKKBBRSUUDFopK\nKAFopKWgQyiiikMKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiikoAWikpaACiiigAo6Cikb\npQBGetAoNOVaYx46UGiikA00004000AJiilpQOaAFUU/FA6U4UyRucUtBGaKBgabnBoNN6mgCUHN\nFNWnUCCiiigAooooAKKKKACiiigAooooAKKKKBBRRRQMKKKKACiiigQUUUUAFJRRTAUUUlLSASil\nooASilooGFFFJQAtFJS0AFFFFABRRRQAhphWn0UDI8GjFPxRikAgpaXFFADSM0m2n0UAMxS7adRQ\nA3bTCuKlpCKAICKKeRzShQKBiKKfSUUABNJmg0lIYtFJSZoAdRSUUALRSCnGgBKSlpKACiiigAoo\noFABRRRQMWlHWm0tAEoopF6UtUZhRRRSAKaadSGgY00Cg0CgB1LSUtABRRRQIKKKKAENNNOpDQMT\nFKBRS0AApaSloEFNNONNNAxKWgUtADaSlNFACCnCm04UALRRRQAlFLSUAFLSUUALRRSUAOpKKKAF\nopKWmIKKKKACiiigAooooASijFLQMSilopAFFFFMQyiiikMSiiigBaKSigBaKSigBaKKKACikooA\nKKKKACiiigBaSlooASiiigBaKSigBaRulKKaTzTAZ3qRelRnrUi9KBh3paaetL2pAIaaacaaaACn\nKKbT1oBjxS0gpaZIUUUUABGaTaKWigAxRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQIKKKKBhR\nRRQIKKKKAEooopgFFFFABS0lLSAKKKKACiiigYlFLRQAlFFLQISloooGFFFFABSUtFACUUUUhhRR\nRQAtFJRQAUUUUAFIaCcCmg5NAC4pKdSGgY2jNBpMcUhgTTc0hzRTAXNFJS0ALRSU6kAUoORTTUiL\ngUxMbSU49abQMKKKKQBQKKKACiiigYUtJS0APQ06o161JTIYUUUUCCmmnGmmgYhoFJSigB1LSUtA\ngooooAKKKKAEpDS0lAwooooAUUtAooEBppp1IaBjRS0lLQAhooNJQAUopKWgBaKSlFAC0UUUAFFF\nFACUUtFABRRRQAUtJS0wCiiigQUUUUAFFFFABRRRQAUUUlAC0UlLQAyikopDCiikoAWiiigAoooo\nAKKKKACiiigBaKSloAKKKSgApaSigAooooAKWkpaACoyeakqNutMANCnFHWk6GgY89KQGlB4pD1p\nAKabRmigAqRelR1IvSgGOpaQUtMkKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA\nKKKKBBRRRQAUlLRQAlFFFABRRRQAtFFJQAtFFFAwooooAKKKKACkpaSgAooooAKWkpaACiiigAoo\nooASilopDEpaKKBBRRRQAxulM6GpSKaVoGJmjBNKFxTqB3EC4pDTqQ0CIWGDSYp702gYUtJS0DCl\npKKAFHWpO1MHWn0hDWptOY02gYUUUUAJS0lKKACiiigYUtJS0AA61KOlRVIvSmSxaKKKCRDTTTjT\nTQMSnCminCgB1FFFAgooooAKKKKAEooNJQMKKKKAHCigUUxBSGlpDSASiiigYhptONNoAWlpKKAC\nlBpKBQA6ikzSCgB9FIKWgAooooAKKKKACiiigBaKKKYgooooAKKKKACiiigAooooAKKKKAIqKSip\nKFopKKAFooooAWikopgLRRRQIKKKKACiiigAooooAKKKKACiiigBaKSloAQ0w09qaaYxopSKTpSg\n0ANzilJoNJSAKdTaWgBakHSox1qQdKYmOFLTaWgQtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\nABRRRQAUUUUAFFFFABRRRQIKKKKACiiigAooooAKKKKACiiigYUUUUAFFFFABRRRQAUUUUAFFFFA\nBRRRQAUUUUAFJRRSGFFFFABRRRQAUUUUAFFFFABSGlpKAGPTKe9MoGhaKKKBhSA5NHWlHFAhy9af\nUWeaeW4pANc80gpM5NKtMYtFFFIApaSjNABRRRQMKWkpaACnrTKctMTH0UUUECGmGnmmGgYCnCmi\nnigApaSloEFFFFMAooopAIaSlNJQMKKSlFADhRRRTEFIaU02kMKKKKAENNpxpKACiiigAooooAKK\nO1FADhS02lFADqKSlpgJRS0lABRRRSAKKKKAClpKKYC0UUUCCikpaACiiigBKWiigCGilpKkoKKK\nKACiiigBaKKKAClpKWmAUUUUCCiiigAooooAKKKKACiiigYUUUUCA02nUhFMY00nSlNJQAZozSUU\nALRSUuaQCr1qUVGvWpBTExaKKWgQUUUUAFFFJQAtFJSUAOzRTc0ZoAdRTc0uaAFopM0ZoAWijNFA\nBRRRQAUUUUAFFFFABRRRQAUUUUCCiiigAooooAKKKKBhRRRQAUUUUAFFFFABRRRQAUUUUAFFJRQA\ntJRRQMKWkopAFFFFABRRRQAUUUUAFGaSkJoAXNJmkzQKBjqKQUtAhj0zNOfrTaBhRilooGFJS5pK\nQC0hNHam0xC09elNAp1AwooNFIAooooAKKKKBhS0lLQAUq9aSigRLRSDpS0yBDTTTjTTQMSnimU4\nUAOooooEFFFFMAooopAIaSlpKBiUoooFADqKKKYgNNNOpppDEBpaQUtACGkpTSUAFFFFABQKKKAC\ngUUCgBaWm0uaAHUUmaWgAopKWgAooopgFFFFABS0lFABS0lLQAUUUUCCiiigAoopM0AMpKWikMbR\nS0lIYUUUUALRSUtABS0lFAC0UUUAFFFFABRRRTAKKKKBBRRRSGFFFFAhaQ0vammmMTFJRS5pgNxR\nTsig4oAbRiiigBydakFRr1qQUCYtLSUtAgooooASilpKAEpKWkNABmkopKAFzRmkozQA7NGabmjN\nADs0uaZmjNAD80ZpuaM0wH5ozTM0uaQDs0uaZmjNAD6KbmjNADqKbmjNADqKbmjNADqKbmjNADqK\nTNGaAFopM0ZoAWikzRmgBaM0lFAxaKSikAUUUUAFFFFABRRRQAUUUUAFFFFABRRSUALSUUUAIaQ0\nGm0hhSikpRQA4UtIKWmIjfrTac/Wm0DQUUUUDCkoJpKBBSigCnAYoGKopaTNGaACiikpALR2pCaQ\nGgB1FANFAwpaKKACiiigB69KdTFNPpkMQ00040w0AJTxTacKAHUUUUCCiiimAUUUUgEoopKBhQKK\nBQA6iiigQU004000DAUUgpaAENGKKBQAEU2nGkoASiloxQAUUCloAQ0UUUAKKWm06gAopKUUALRR\nRQAUUUUwCiiigAooopAFFFFAC0lFJQAE0CjFLigBlFFFACUUUUDEooopAFFFFAC0UUUAFFFFABRR\nRTAWiiigAooopCCiiimAUUUUDFphoooASlxRRQAhpKKKACiiigY9afRRQSxaKKKYhaKKKACiiigB\nKSiigBKQiiigBMUmKKKYBRRRSAKM0UUAGaM0UUAGaM0UUALmjNFFABmjNFFABmlzRRQAZozRRQMM\n0ZoooAM0uaKKACloopAFFFFABS0UUAFFFFABRRRQAUUUUAFFFFABRRRQAUlFFIBKM0UUDCiiigBp\nNJRRTAKUUUUgHCloooERv1plFFMYZozRRQAlKBRRQAvSloooGApaKKQBSUUUAI3WkoopiFFOoooK\nQUtFFIAooooAVetPoopksDTKKKBBThRRQA6iiigQUUUUwCiiikAlJRRQMSlFFFADqKKKBAaaaKKB\niUtFFACUUUUAFFFFACUtFFACUUUUALSUUUABpRRRQAtAoooAWkoooAWjNFFABRRRTAKKKKACiiig\nAooooAKKKKQH/9k=', 'asha1', '2016-09-12 18:25:56', 'asha1', '2016-09-12 18:25:56', 'qawsedrftgyh'),
('asha1517', '41001', 1, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Suman', 'Sudas', 'Jadav', '1987-09-12', 29, 'Marathi', 'Akola', 'Literate', 0, 'Married', 4294967295, 'Akola market gali', '', 4294967295, '12', '', 'asha1', '2016-10-05 11:08:09', 'asha1', '2016-10-05 11:08:09', 'qawsqawsedrf'),
('asha1532', '41001', 6, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Suman', 'Sudas', 'Jadav', '1987-06-22', 29, 'Marathi', 'Akola', 'Literate', 0, 'Married', 4294967295, 'Akola market gali', '', 4294967295, '12', '', 'asha1', '2016-11-16 11:08:09', 'asha1', '2016-10-05 11:08:09', 'qawsqawsedrf');
INSERT INTO `hm_patient` (`Patient_id`, `PinCode`, `Village_id`, `City_id`, `District_id`, `State_ID`, `Country_ID`, `Card_Type_id`, `Gender_Id`, `Cast_Category_Id`, `Patient_Salutation`, `Patient_FName`, `Patient_MName`, `Patient_LName`, `Patient_DOB`, `Patient_Age`, `Patient_Language`, `Patient_POB`, `Education`, `Patient_BPL`, `Patient_Marital_Status`, `Patient_Contact`, `Address_line1`, `Address_line2`, `Patient_Emergency_number`, `Patient_Ward`, `Patient_Image`, `Created_By`, `Created_Date`, `Updated_By`, `Updated_Date`, `Card_Number`) VALUES
('asha1534', '41001', 7, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Shantabai', 'Prakash', 'Patil', '1984-09-12', 32, 'Marathi', 'Kolhapur', 'Literate', 0, 'Married', 4294967295, 'Kothrud pune', '', 4294967295, '12', '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAKBueIx4ZKCMgoy0qqC+8P//8Nzc8P//////////////\r\n////////////////////////////////////////////2wBDAaq0tPDS8P//////////////////\r\n////////////////////////////////////////////////////////////wAARCAPIBRADASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwCGiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigApaSloAKB1opR1oAdS0lLSAKKKKAEbpTKc3Sm0wCiiig\r\nBKKWigBKWiigBKKWigBKWiigAooooASilooASilooASilooASilooASilooAKSlooASilooASilo\r\noASilooASilooASilooASilooASloooAKSlooASiiloASiiigAooooAKKKKACiiigAooooAKKKKA\r\nCiiigAoopaAEopaKAEpaKKACiiigApKWigBKWiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooASilooASilpKACiiigAooooAKKKKACiiigAoopaAEpa\r\nKKACiiigAooooActOpq06kAUUUUAIaZTzTKAEpaKKYBThTacKQC0tJS0gCiiigYUUUUAFFFFABS0\r\nlLQAUUUUALRSUtAEFFFFUIKKKKACiiigAooooAKKKKACiiigAooooAKWkpRQAUo60lKvWgB1LSUt\r\nIAooooAa3Sm05qbTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAEopaKACiiigApKWigApKWigAoo\r\nooAKKKKACiiigAooooActOpq06kAUUUUAIaZTzTDQAlO7UlL2pgJThTacKQC0tJS0gCiiigYUUUU\r\nAFFFFABS0lLQAUUUUALRSUtAEFFFFUIKKKKACiiigAooooAKKKKACiiigAooooAKXtSU4dKAEpVp\r\nKVaAHUtJS0gCiiigBrU2nNQo+YUwExRg1ZxS4FAFXFGKtYFGBQBVxRirOB6UYFAFbFGKs4HpRgel\r\nAFbFGKs7R6UbR6UAVqKs7R6UbR6UAVqKs7R6CjaPQUAVaKs7F9BRsX0FAFairOxfSjYvpQBWoqzs\r\nX0o2L6UAVqKs7F9KPLX0oArUVY8tfSjy19KAK9FWPLX0o8tfSgCvRVjyl9KPKWgCvRVjylpPKWgC\r\nCip/KWjyloAgoqfyhR5QoAgoqfyhSeUPWgCGipvKHrR5Q9aAIaKm8ketHk+9AENFTeT70eT70AQ0\r\nVL5PvR5PvQBFRUvkn1o8k+tAEVFS+UfWk8o+tAEdFSeUaPKagCOipPKajymoAjop/lNR5bUAMop/\r\nlt6UeW3pQAyin+W3pSeW3pQA2inbG9KNjelADaKdsPpRtPpQA2inbT6UbT6UANopdpo2n0oASilw\r\naMGgBKKXBoxQAlFLijFACUUuKKAEopaKAEopaKAEopaKAEopaKAEopaKAEpaKKAEopaKAEopaKAE\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBy06mrTqQBRRR\r\nQAhphp5phoAKcOlNp6j5aYDTSikNKKQC0tJS0gCiiigYUUUUAFFFFABS0lLQAUUUUAFLSUUAQ0UU\r\nVQgooooAKKKKACiiigAooooAKKKKACiiigApw6U2nfw0AJSrSUq0AOpaKKQBRRRQA1qE+8KG60sf\r\n3xTAsUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUU\r\nUAFFFFABRRRQAUUUUAFGKKKADFGBRRQAYFJgelLRQAmB6UbR6UtFACbR6UbR6UtFACbR6UmxfSnU\r\nUAN2L6UbF9KdRQA3y19KPLWnUUAM8taPLWn0UAM8oUeUKfRQBH5Qo8oVJRQBH5Qo8r3qSigCPyve\r\nk8r3qWigCLyqPKqWigCHyjR5RqaigCHyjSeUanooAg8o0eWanooAr+W1HlmrFFAFfyzRsPpViigC\r\ntsPpRsPpVmjFAFbafSjafSrOKMCgCrtPpRtPpVrApMCgCtg0YNWdo9KNooArYNGKs7R6UbR6UAVs\r\nUYqxsFGwUAVqKs7BULjBoARadTVp1IAooooADUZqQ1GaACng/LTKcvSmAhoFBoFIB1FFLSAKKSlo\r\nAKKKKBhRRRQAUtJRQAtFFFABRRRQBDRRRVCCiiigAooooAKKKKACiiigAooooAKKKKACn44ptO/h\r\npANpVpKctMB1FFFIAooooAa3Wlj++KRutOi++KYE9FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAHpUEnWp6gk60ANWnU1adSAKKKKAENMNPNMNABTh0p\r\ntKOlMANApDSikA6lpKKQBS0lFAxaKKKACiiigAooooAWiiigAooooAhoooqhBRRRQAUUUUAFFFFA\r\nBRRRQAUUUUAFFFFAC07tTRSnpSASnLTactADqKKKACiiigBrdadF9+mnrT4fvUwJqKKKACiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACii\r\nigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqCTrU9QSdaAGrTqat\r\nOpAFFFFAAaYaeaYaAEpwHFNpwPFMBDQKQ0opAOooopALRSUUDFooooAKKKKACiiigBaKSloAKKKK\r\nAIaKKKoQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAopTSDrS0AJTlptOXpQA6iiikAUUUUAMPWpIf\r\nvGoz1qWHqaYEtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAVBJ1qeoJOtADVp1NWnUgCiiigBDTDTzTDQAUo6UlKOlMBKUUlKKQDqKKKQBRS0lAwoopa\r\nACiiigAooooAKWkooAWiiigCGiiiqEFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAKvWlNCfeoNIBKc\r\nvSm04dKAHUUUUAFFFFADD1qWHvUR61LD3pgS0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFF\r\nFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFFFFABRRRQAUUmaXNABRRmkzQAtFJmjNAC0UmaM0ALRRmk3UALRTd1G+gB1FN3UuaAFoozRQAUU\r\nUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRR\r\nQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOtADVp1NWnUgCiiigB\r\nDTDTzTDQAUvakpe1MBKUUlKKQDqKKKQBRRRQMKKKWgBKWiigAooooAKKKKAClpKKAIqKKKoQUUUU\r\nAFFFFABRRRQAUUUUAFFFFABRRRQA5OtBpU6/hSGkAlOHSm08dKAFooooAKKKKAGd6mh6Goamh+6a\r\nYElFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFIWAppcUAPpCcVGz0wsaAJS9NL1HRQA/fRvpl\r\nFAD9xpNxpM0UAODUoamUUATbhRkVFRQA8tTM0lFABmiiigAzS5pKKAHBjSh6ZS0ASh6UEVDSg0AT\r\nUUwPTgc0ALRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOtADVp1NWnUAFFFFI\r\nBDTDUhphoASlHSkpR0pgJSikpRSAdRRRSAKKKKBhRRRQIKKWigYUUUUAFFFFABRRRQBFRRRVCCii\r\nigAooooAKKKKACiiigAooooAKKKKAHJ1P0pDSr3pKACnimU8UgFooooAKKKD0oAZU8P3agqeL7lM\r\nB9FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFFABSZoJxUbPQA8timF6YTSUAKWzSZoooAKKSigBaSiigApaSloAK\r\nWkpRSAKKSloAUUGkopgFFFHagBKWkooAWiiigBaKKKACiiigBaXNJRQIeDT6jXrUlAwooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAqCTrU9QSdaAGrTqatOpAFFFFACGmGnmmGgApQOKSnDpTAbSik\r\npRSAdRRRSAKKKKACiiigBaKKKBhRRRQAUUUUAFFFFAEVFFFUIKKKKACiiigAooooAKKKKACiiigA\r\nooooAcvekpR0NJQAU8UynikAtFFFABQelFB6UAMqeL7lQVYj+4KYDqKKKACiiigAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAozRSHigB\r\naYz4prPUZOaAHM2abSUUALSUUUAFLSUUAFFFJQAtFFFABS5pKKAFzRSUUALRRRSGLRRRQAUhNFIa\r\nBBS0lFMBRRmiigBc0tNpaAFooooAWiijNAhy9akqIVIpyKBi0UUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFF\r\nFABRRRQAVBJ1qeoJOtADVp1NWnUAFFFFIBDTTTjTTQAlKOlJSjpTASlFJQKQD6KKKQBRRRQMKKKK\r\nBBRRRQAUtJS0DCiiigAooooAioooqhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACiiiigAp4pgp9I\r\nBaKKKACg9KKG6UAMqxH9wVXqyn3BTAWiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooprNgUAKxwKhZ80jNmm0AGaKKSgBaKKKACi\r\niigBaSiigApKWigBKWkooAWikooAUGnAgimUtAxcUZoopAGaKKKAA0lOoxQA2inYoxQA2ilooEFK\r\nKSloAWikopgLRSUtACinKcU2lzQIlFFMU0+gYUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABUEnWp6gk\r\n60ANWnU1adSAKKKKACmGnmmGgBKcOlNpw6UwG0Cg0CkA8UUCikAUUUUDCiiigQUUUUAFLSUtABRR\r\nRQMKKKKAIqKKKoQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAtFFFAAKfTB1p9IBaKKKACkbpS0jdK\r\nAGirK/dFVhVlfuimAtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFIaAAnFQu2TSu1RmgApKKKACiiigAooooAKWkooAWikpaACkoooAK\r\nWiigYUUuKMUgEopaMUAJS0YpaBiUuKBS0AJS0UtACYop2KCKAGUYp2KMUCG0U7FJQAUUUUCCiiim\r\nAU6m0UAPFKGpmaWgRIDS1Hml3cUDH0ZqMMaXdQA7NIWppJpDQIeG9adUQp6mgY6iiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqCTr\r\nU9QSdaAGrTqatOoAKKKKQAaYafTDQAlKOlJSjpTASgUUCgB4ooFFSAUUUUAFFFFABRRRQMKWkpaA\r\nCiiigAooooAioooqhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0UUUAA60+mjrTqQC0UUUAFI3Sl\r\npG6UANFWh0FVRVodKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFFFFABRRRQAUUUUAFFFITQAtRO9DvUZNACE0lFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAxaW\r\nkpQKQwpaMUuKAEpaUClxQAmKMU7FGKAG4pcUuKWgBuKXFLRSASilooATFJTqSgBMUmKdQaAG4pCK\r\ndiigBuKSnGkNMVhKKKKYgpwptLmgBxpKSg8UgFpcimUopgOzmkNGcUUAGaKSigRIjU+oRUitmgY6\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACoJOtT1BJ1oAatOpq06gAooopABphp9MNACUUUUwCgUUUAOFLSClqQCiiigAooooAKKKKBhRR\r\nRQAtFJS0AFFFFAEVFFFUIKKKKACiiigAooooAKKKKACiiigAooooAWiiigBR1p1NHWnUgFooooAK\r\nRqWkagBB1qzVZetWaYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFFFFABRRRQAUUUUABqN2pznAqBjzQAhNFFJQAUUUUAFFFFABRRRQAUUUUAFFFFABRRSgUDEpwFO\r\nApQKQxuKXFOooATFLilopDDFFLRTEFFFFABRRRQAUtFFABRRRQAUlFFIAooooASilpKAEpKdSUAN\r\nxSYp1JimISiikoEOUZofrSpSPyaAG0tJRmmAuaXtTaUmgANFJSZoAdSqcU2igCwpyKWoVbBqUHNA\r\nC0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB\r\nUEnWp6gk60ANWnU1adQAUUUUgCmGn0w0AJRRRTAKKKKAHClpBS1IBRRRQAUUUUAFFFFAwooooAWi\r\niigAooooAioooqhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0UUUAKOtOpq9adSAWiiigApGp1Na\r\ngBF+8Ks1XT7wqxTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAo\r\noooAKKKKACg0U1zgUARyNUdKxyabQAUUUUAFFFFABRRRQAUUUUAFFFFABRRTgKQwApwFApaChRRS\r\nUUgFooFLQAUtJS0AFFFFAgooooAKKKKAClpKKACiiigAooooAKKKKACkpaSgYUlLRQAlJS0UANNN\r\npxpDTEIpwaVqbSk0EiUUUlMBaM0UUAFFJRQAtApKUGgB1ORsGo80A0AWQaWo0NSUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABUEnWp6gk60ANWnU1a\r\ndQAUUUUgENNNONNNACUUUUwCiiigBwpaQUtSAUUUUDCiiigQUUUUAFFFFAwpaSloASloooAioooq\r\nhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFLQAUUUUAKtOpq0+kAUUUUAFNbrT6Y3WmAqfeFWKrx/fFW\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqGQ1\r\nI5wKgY80AJSUUUAFFFFABRRRQAUUUUAFFFFABRRTgKQwAp1FFIoKKBS0AFLRS0AFFFFAC0UlFAC0\r\nUlFAC0UlFABS0lFAC0UmaKAClpKKAFpKKKAClpKKACiikoAWikooAKKKKAEpDS0UAMNJTiKQ0xMS\r\nkoopkhRRRQAUUUUAFLSUUALRSUtACg4NWFORVapY2oAlooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKrydasVBJ1oAYtPpi0+gAooopAIaaetONNNACUU\r\nUUwCiiigBwpaQUtSAUUUUDCiiigAooooAKKKKBBS0lFAxaKKSgCOiiiqEFFFFABRRRQAUUUUAFFF\r\nFABRRRQAUtJS0AFFFFACrT6YtPpAFFFFABTW606mt1pgOj++KnqCL74qegAooooAKKKKACiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoopGoAjkNRGnuaZQAlFFFABRRRQAU\r\nUUUAFFFFABRRSigYCnCkFLSKFooopALRRRQAtFJRQAtFFFABRRRQAUtJRQAtFJS0AFFFJQAtFJS0\r\nAFFJS0AJRS0lABRRRQAUUUUAFFFFABRRRQAUlLRQA00hp1IaAGGkpxptMkKKKKYgooooAKKKKACi\r\niigBaUHBptFAFlDkU6oY25qagAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoo\r\nooAKKKKACiiigAqCTrU9QSdaAGLT6avWnUAFFFFIBDTTTqaaAEooopgFApKUUAOFLSClqQCiiigY\r\nUUUUAFFFFABRRRQAUUUUAFFFFAEdFFFUIKKKKACiiigAooooAKKKKACiiigApaKKACiiigBVp9NW\r\nnUgCiiigAprdadTT1pgOi+/U9QxffqagAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigApr9KdTJKAIWNJSmm0AFFFFABRRRQAUUUUAFFFFABSiilFIpC0UtFIYU\r\nUUUAFFFFAxaKSigBaKSlpCClpKKYC0UlLQAUUUUALSUUUALRSUUALRSUUALSUUUAFFLSUAFFFFAB\r\nRRRQAUlFFABRRRQAUlLRQA002n000xDaKU0lMkKKKKACiiigAooooAKKKKAHA4NTo2RVeno2KYE9\r\nFIDmlpAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOt\r\nADV606mLT6ACiiikAhpppxppoASiiimAlLSUooAcKWkFLUgFFFFAwooooAKKKKBBRRRQMKKKKACi\r\niigCOiiiqEFFFFABRRRQAUUUUAFFFFABRRRQAUtJS0AFFFFADlp1NWnUgCiiigApp606mHrTAkh+\r\n9+FTVDD941NQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAVHJUlRSdaAIjSUppKACiiigAooooAKKKKAClFFKKRSClFFFIYtFJRQAtFJS0AFFFLQAUlLRQMSl\r\npcUmKBBRRilpDEooopgLRSUtAgooooAKKKWgAoopKAFooooAKKKKAEopaKAEooooAKSlooASiloo\r\nASilpKAA0006kNADTTaeaaaYmJRRRTJCikpaACiiigAooooAKXNJRQBMjVIDVYHFPVuaYE9FIpyK\r\nWkAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFQSdanqCTrQAxetPpi9a\r\nfQAUUUUgENNNONNNACUUUUwEpRSUooAcKWkFLUgFFJRQMWiiigAooooEFFFFAwooooAKKKKAI6KK\r\nKoQUUUUAFFFFABRRRQAUUUUAFFFFABS0lLQAUUUUAOWnU1elOpAFFFFABTD1p9MPWmBLD1NS1FD1\r\nNS0AFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAB6VA55qV\r\nzxUB60AJSUtJQAUUUUAFFFFABRRSigYCnUlLSGFFFFIYUUUtACUtFFABS0lLQAtFFFAC0UUUAFJS\r\n0UAJRS0lABRRRQAUUUUAFLSUUALRSUUALRRRQAUUUUAFFFFACUUUUAFFJSigAooooAKSlpKACkpa\r\nSgBDSGnU00CG0UppKoQlFLRQIKKSigBaKSloAKKKKAClFJRQBMjVKKrocGpweKYC0UUUgCiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACoJOtT1BJ1oAYvWn0xetPoAKKKKQCGmnrTj\r\nTDQAUUUUwEpRSUooAcKKBRUgFFFFAwopaKACikooAKWkpaACiiigAooooAjoooqhBRRRQAUUUUAF\r\nFFFABRRRQAUUUUALRSUtABRRRQA5elOFNXpThSAKKKKACmd6fTKYEsPepajh6GpKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAI5DUNSPUdAAaSlpKACiiigA\r\nooooAKWkpaQ0LS0lLSKCiiigBaKKKACiiigYtFJS0AFLRRQIWikpaAClpKWgBKKKKAEooppNADqS\r\nmhqdmgBaKKKACiiigBaKKKAFpKKKACkpaSgAooooASlopaAEopaMUAJRS0lACUUtJQAhpKdSUANN\r\nNp5pppiYlJS0lMkWikooAKWkooAWiiigAooooAUVOjcVXp6HBoAsUUi0tAgooooGFFFFABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOtADF60+mL1p9ABRRRSAQ0w080w0AFFFFMBKU\r\nUlKKAHCiiipAKKKKBi0UUUAJRRRQAUtJS0CCiiigYUUUUAR0UUVQgooooAKKKKACiiigAooooAKK\r\nKKAFooooAKKKKAHDpTqaOlOpAFFFFABTKf2plMCaHoakqOH7pqSgAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACg9KKRulAELmmU5qbQMKSiigQUUUUAFFFFAC0tJSi\r\nkUFLRS0hiUtFLQAlFLS4oAbS0YooGFFFFAC0UCloEJRRRQAtFJRQAtJRRQAhNRk05qbTQBSg0lFA\r\niQUtNXpTqQwopKKAFopM0ZoAWikzS5oAWikzS5oAKKKKACiiigAooooAKKKKACkpaSgBKSnUlADT\r\nSGnUlADDRSmkqiWJRRRQIKKKKACiiigBaKKKAClHWkooAnQ5FPFQxtU4pgFFFFIAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACoJOtT1BJ1oAYvWn0xetPoAKKKKQCGmGnmmGgAooopgJSi\r\nkpRQA6igUVIBRRRQMKWkpaBCUUUUDClpKWgQUUUUAFFFFAyOiiiqEFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUtFBoAKKKKAHDpTqQdKWkAUUUUAB6UynnpTKYE8P3afTIvuU+gAooooAKKKKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACkbpS0xzQBE3WmU5utNoGFFFFAgooooAKKKKAFF\r\nLQKKRQopcUClpDDFLSUZoAWikooAWikooGLRSZozQIWlpuaN1AC0Zpu6k3UAOzRTc0uaAFzRmm5o\r\nzQANTKcaSmgYlFFFAiRelLSLwKWkMTNFFJmgAzRSUUALmjNJRQAuaXNMpaAHZozTaKAHbqXdTKKA\r\nH5pc0yjNAD80U3NGaAHUUmaKAFpKKKAEpKWkoAQ02nmmmmJjaKKKZIUUUUAFFFFABS0lLQAUUUUA\r\nKpwasIciq1TRNQBLRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABVeTrViq8nWgB\r\nq9afTF60+gAooopAIaYaeaYaACiiimAlKKSlFADhRQKKkAooooAKKKKBhRRRQAUtJS0AFFFFAgoo\r\nooGR0UUVQgooooAKKKKACiiigAooooAKKKKAFoNFK3WgBKKKKAHDpTqQUtIAooooAD0plPPSmUwJ\r\n4vuU+mxfcFOoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigANRMK\r\nexpp6UDIj1ptObrTaACiiigQUUUUAFKKSlFA0LSikpRUlC0UUUAFFFJQAtFJRQAuaTNJRQAuaM0l\r\nFAC5pKKSmAtJRRQAtGaSigBaKSigBaSlpKAEpyikpwoAdSUUlIApKKSmAUUUUCCiikoAWiiigAop\r\nKWgApaSigYtLSUtIBaKKKAEozS0UAGaM0mKKAFopM0tACU006kNAhtJSmkqiQooooAKKKKACiiig\r\nBaKKKACnIcGm0ooAsqcilqOM8VJQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUCCiiigYVBJ1\r\nqeq8nWgBq9afTF60+gAooopAIaYaeaYaACiiimAlKKSlFADqKBRSAKKKKQwooooEFFFFABS0lFAC\r\n0UUUAFFFFAEdFFFUAUUUUAFFFFABRRRQAUUUUAFFFFACilf71IOtOk4c0ANooooAeKWkFLSAKKKK\r\nAA9KZTz0pgpgWI/uCnU1PuCnUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABQaKQmgBpppPFObpTKRRGaSlNJTEFFFFAgooooAKUUlKKQ0KKWijNIoKKSigBaKKKACiiigBK\r\nKKKYCUUUUAFFJRQIWikooAWikooAWikooAWiiigBRS0lLSGLSUtJQAlJQaKYBSUtJQIKKKKBBRRR\r\nTAKKKKAFopKKQx1LTc0oNAC0tJmjNIYtFJRQAtJS0UANpaKSgBaKKKAGmm08000yWJRRRTEFFFFA\r\nBRRRQAtFFFABRRRQBJGanFVlODVhTkUALRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAgopKWgAooooA\r\nKrydasVBJ1oGMXrT6YvWn0AFFFFIBDTDTzTDQAUUCimAlLSUUALmjNJRQA7NGabRQA7NJmkooAWi\r\nkooAWjNJRQAuaM0lFAC5ozSUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAKOtOkOWNNoPWgAoooo\r\nAeKWkFLSAKKKKABulMFObpTaYFhPuCnUifdFLQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFMY80+o260DQh6UlKabSGMNJSmkpiCiiigQUUUUAApwpBS0hoWm0UUDFoooo\r\nGLRSUUgFpKM0ZoAKSjNJmmIWkoooFcKKSimAtFJS0AFFFFABRRRSAWiiigYtKKSlpDClpKKAENJS\r\nmkpgFJS0lAgooopiCiiigApKKKBC0UlFAC0ZpKKBi5pc02loC47NGabRmkO47NLmm5ozQMdRSUtI\r\nAoooxQAGmGn4ppFMQ2ilpKZIUUUUAFFFFABS0lFAC0UUUAFTRNUNOU4NAFmikU5FLQAUUUUAFFFF\r\nABRRRQAUUUUAFJS0lAgpaSloAKKKKBhUEnWp6rydaAGr1p9MXrT6ACiiikAhphp5phoAVehpDTl6\r\nGmmmAlFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAtFFFABRRRQA8UtIKWkAUUUUAI3Sm05ulNpgWV+6PpS0i/dH0paACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooopAFFFFABRRRQAVGetSHpUTdaBoTvSGgUpoKIzSUppKZIUUUUCCiiigAp\r\naSlpDQUtFFAwopKKAFpKKSgLi0maKSmK4tJRRQIKKKKACiiigAooooAKWkpaBhRRRQAtFFKBSGKK\r\nWgUopDExRTsUhoAbSGnUhoAbSUppKZLCiikpgFFFFAgopaKACiiigBKKWigBKKWkoAKKKKAFopKW\r\ngYtLTaWkMcKWmZp2aQxaaaWkNADTSUppKokKKKKBBRRRQAUUUUALRSUtABSikoFAFiM5FPqKOpaA\r\nCiiigAooooAKKKKACiiigApKWkoAKWkpaBBRRRQMKrydasVXk60ANXrT6YvWn0AFFFFIBDTDTzTD\r\nQA5ehppp6Hg0w9aAEooopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB\r\nRRRQAUUUUAFFFFABS0lFAC0UUUAPFLSCikAtFFFACN0popzdKaKYFpfuiigdBRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUgCiiigAooooAKKKKAA9KhbrUx6VC3WgaEp3amU7tQURt1pKVutJT\r\nJYUUUUCCiiigApaSlpDQUUUUDCkoooEFJRRTEFFFFABRS0UAJRS4oxQAlFLRQAlFLSUAFFFLQAUU\r\nUUhiiniminUmUFOFIKcBQAUhp1IaAG0hFOpDQAwim0800imhMSiiigQUUUtMBKKWikFgxS4oFLmg\r\ndhMUmKdSUAJijFFFACUUtFArCUUYoxTAKKXFGDSASloxS7aBiikpcUUhjTSU4000yWJRRRTEFFFF\r\nABRRRQAUtJS0AFFFFAEkR5qeq8fWrAoAKKKKACiiigAooooAKKKSgBaSikoAWikpaAFopKWgAqvJ\r\n1qxVeTrQA1etPpi9afQAUUUUgENMNPNMNADk6GmmlXvSGmAlFFFABRRRQAUUUUAFFFFABRRRQAUU\r\nUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUALQKKBQA8UUCikAUtJS0AI1NFK\r\n1A60wLI6UUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUgCiiigAooooAKKKKACiiigAPSoW61Maj\r\nagaI6U0d6CKChhpKU0lMlhRRRQIKKKKAFooopFBSUUUCCkpaKYhKWiigYUUtFIBKWiigYUUUUAJR\r\nS0lAgooooAKKKKAClApQKUCgaQCloopFCinU0U8UCYUhpaSgBKQ0tFAxtBFOpDQAwikp5FNxTEJR\r\nRijFAgooxRQAUtJRQMWiiigA4o4oxS4pAJijFOxS4oAbilC07FFAhMUUtFAxKKKKAEooooASmmnG\r\nkpiGUUppKZIUUUUAFFFFABS0lLQAUUUUAOTrVgdKrr1qwOlAC0UUUAFFFFABRRRQAUhpaKAG0UtF\r\nACUUUUAFLSUUALUD9anqB+tADV60+mL1p9ABRSUUgA0w080w0AKKSgUUwEooooAKKKKACiiigAoo\r\nooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBaBRQKAHiigUUgC\r\nlpKWgBrUDqKGoXqKYFmiiigAooooAKKKKACiiigAooooAKKKKQBRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFRsakqFutBSG96WikzQMa3WkpTSUyWFFFFAgoFFKKBoUCjFLRSKG4oxT8UYoEMxRin4oxQAyin7\r\naNtFwGUU7FJigYlFLil20ANop22l20AMop+2kIoAbRTsUbaBDcUoFOxS0DEoopaQwooopAKKcKaK\r\ndTEwpKWigQlFFFAxKKKKBiGjFFFACYoxS0tAhuKNtPooAbto206igBu2jFOooATFGKWigAxRilxS\r\n0xCYopaaaQBSUtJQMQ0lLRQMSiiigQGm06kNADTTacaSmSxKKKKYgooooAKKKKAFooooAUdasL0q\r\ntViM8UAPooooAKKKKACiiigAooooASilNNoAKKSloAKWkpaACoH61PUD9aAGr1p9MXrT6ACkoopA\r\nBphp5phoAKSlpKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFAC0CigUAPooopAFLSUtADWoX7woahfvCmBZooopAFFFFABRRRQAUUUUwCi\r\niikAUlLSUDDNLTaWgBaKSloEFFFFABRRRQAUUUUAIaibrUp6VCetBSCkNBooGNNJSmkpksKKKKBB\r\nThSAU6kUhaKKKQwpaKKAClxRRQAuKMUUtADcUYp1GKAG4pcUuKKAEooooASjFLRQAmKKKKACkpaK\r\nBjaWiikAUCigUwHClFIKdQIKQ0UUCEpKWkoGLRSUtACUUUUDDFFLRQISloooAKWkpaBCUYpaWmAm\r\nKWiloASiikoAKTNFJSGFBpKKBhSUUUAFJS0lAhaSiigBKaacaaaYmJRRRTJCiiigAooooAKWkpaA\r\nCnoeaZSg80AWBS0xDxTqQx1FJRQAtFJRQAtJRRQAUlLSUAJRRSUCHUUlLQAtV361Yqu/WmAi9afT\r\nF606kAUUUUABphp5phoAKSlpKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0CkpRQA+iiikAUtJRQAjdaF+8KRutKv3hQMnzS00U6gBa\r\nKKKBBRRRQAUUUUAFFFFACUhpaSgYlLRRSAKKKKYC0UlLQAtFFFAgooooARulQnrUrdKhPWgpAaBQ\r\naQUDEakpxptMlhRRSigBRTqSlqSgooooGFLSUtABS0lFAC0tJS0CFooFFMQUUtJQAUlLRSASiloo\r\nGJSUtFACUlLSUDCiiikAUtIKdTABTqbS0EhSUtFACUlLSUDEpaSlFAxaSg0ZoELRSUtAC0UUUCCg\r\nUUZpgLRRRQAUUUlAC5pKKSgAooopDEpKWigY2ilNJQAUlLSUAFFFFAhDSGnU00xDaKWkpkhRRRQA\r\nUUUUAFFFFAC0UlLQBIhqTNQL1qUGkMfS0gooAWikpaACiiigAooooAQ0mKdSUCExS0tFABVd+tWK\r\nrv1oARetOpq06gAooooADTDTjTTQAlFFFMAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigApRSUooAfRRRSAKKKKAGt1oX7wobrQOtAEwNOB\r\nqMUoNIokzRmmZpc0CsOopuaM0AOopKKAFooopgFJQaM0gCiiigYlFFFACilpKWmIWikpaBBRRRQA\r\njdKg71O3SoD1oKQGkpaSgYhpKU0lMlhSikpwpAhaKKWkUFFFFAwoopaACiiloAKWkpaBC0tJRTEL\r\nRRSUAFFGaKACikozSGIaKKQ0DDNJmkJpKAHUUCigBwpaSigQtLRS0xCUUtFADaSnUhpDG0Cg0CgY\r\nUlLmg0AGaUGm0A0APopoNLmgQtFJRmgB1FNzS0BYKKSigBaKSigAooooAKSiigYUlFFABSUUUAFF\r\nJS0CCmmlpDTEJSUtJTEFFFFAgooooAKKKKAClpKKAFHWpAajp4NIZIpp1MWnigApaKKAEpaSigBa\r\nKKKACikpM0ALmjNJmigBTUD9amNQt1oARadTV606gQUUUUAIaaacaaaAEooopgFFFFABRRRQAUUU\r\nUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFKKSlFAD6K\r\nKKQBRRRQA09aF+8KD1pY/vCgaJMUYp1FIY3FFLRQAlJmlNJQA4GnCmCnCgB1FFFAhppKcRSYoGJm\r\nilxRigAooxS4oAKWkpaYgpaSigBaKSloEB6VA/Wp6hkHNA0NFIetOWhqChhpKWkpksKeKYKeKTGg\r\npaKKQwooooGFLSUtAC0UlFAC0tJRQIWikooAdSUlFAC0maSkoGOzSUlGaADNITQTTaAFpQKAKdig\r\nQlLRRQMWikpc0ALS5pmaXNArDs0ZpuaTNAWHGkzRmkoADQKKKBi4GaUimgc07FAhpFNNPIppFACZ\r\npQaZS0APzRTc0ZoGOFLTaXNAC0UmaKAFopKKACiikoAU0lFFABSUtJQAUUUUCEooooAKDRRTAbSU\r\nppKCQooopiCiiigAooooAKKKKAFpy02lWkBKKeKjFPFAx1FFFABSUUUgCiiigBDSU6igBMUuKKWm\r\nAmKgfrVg1XfrQAgp1NFOoEFFFFACGmmnGmmgBKKKKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSikpRQA+iiikAUUUUANPWlj+8KQ9a\r\nWP71A0T0lFFIYUUUmKAEJpuacabigBRTxTBTxQA6ikpaYgooooAKKKKACiiigAopCabmgB9FNBpa\r\nAFoopaACopalpkg4oBEY6UhooJoKG0lLSUCYop1NFOoBC0UlLSGFFJS0DFopKKAFooooAKWkooAK\r\nKKKACikooAKKSigApKKSgApQKSnCmIcOKWm5ozSAWkzSZpM0DFzS5ptFFgHZozTc0ZosA7NJmkoo\r\nELmjNNoosA7NOBpmaXNADmpoY0uabmgCQGg0wGlzQA09aSlam0wFpabS0AOopKWkMWikozQA6ikz\r\nRmgBaSiigBKKKKACiiigApKKKBBRRRQAUUUlMANNp1NoJYUUUUxBRRRQAUUUUAFFFFABSikpRQBI\r\nDTwaiFPBpDJAaWowacDQAtFFJSAWikooGLRSUUCFpabmlBpgLVd+tWKrv1oAQU6minUCCiiigBDT\r\nTTjTTQAlFFFMAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigApRSUooAfRRRSAKKKKAGnrSx/epp60+P71A0SilpMUtIAooopgJikxTqKQxu\r\nKUUtFABS0lLTEFFFLQAlLRRQIKQ0tJQMaabin0UhiAU6kpaYgooooAKRulFB6UAQ96KQ9aKChKSl\r\nNJQJiilpBS0AhaKKSkMWikooAWlpKKBi0UUUAFFJRQAtJmikoAWikzRQAUUUlMQUUUUAFLmkooAM\r\n0ZpKKBXDNGaSimK4uaWm0tIdxaKSloAKKSigBaKSkoC4uaM0lFMVxc0ZpKKAuOozSUUh3FpKcKCK\r\nAG0UUUALS02loGLmikpaAClpKKQC5opKKBi0UlFAC0lFFAgooooAKKKKYBRRRQISkpaSgTEooopi\r\nCiiigAooooAKKKKAClpKWgBRTqaKWkMcDTgajFOBpDH0tMzS5oAdRSZpaACiiigAoFFJQIdUD9am\r\nzUDdaYAKdTRTqBBRRRQAhpppxppoASiiimAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUopKUUAPooopAFFFFADD1p8f3qYetPj60DRLS\r\n02lzSGGaM0lFAC5pabS0ALRSUmaAHUtMzSg0AOpabS0xC0UlFAC0lFJQAUUUUhhRRRQAUUUUAFFF\r\nFMCFutC0sg5pFoGDCmVI3SmUCYLS0gpaAFpKKKBhRRRQAUUUUALRSUZpDFopKKACikopiCiiigAo\r\nopKBBS0lKBQAooNKKQ0hjaKKKZIlFFLTASilpKAFooopAFFFFABSUUUwCiiigQUUtFAwoopaQCil\r\npBTqRQ0im1IRTSKYDaKKKBC0UlLQAUUUUDFopKWgAooooAKKSloAKSiigBaKSloAKSlooEJSGlpD\r\nQJiUUUUxBRRRQAUUUUAFFFFABSikpRQAtFGKWkMKBRRQMXNLmm5opAPBpc0zNLmgB4NLTAadmgBa\r\nQ0tIaAGk1Gae1RmmhMUU6miloELRSUtACGmmnGm0AJRRRTAKKKKACiiigAooooAKKKKACiiigAoo\r\nooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKUUlKKAH0UUUgCiiigBh605Ot\r\nNp8Q5NA0SUUuKMUhiUUuKMUAFJTsUYoASkxTsUYoAZilAp+KMUBcSloxRTEFLRRQIQ0maDTaQx1F\r\nIKWgYUUUUAFFFFABS0UUxDJBxUa1M/3ahHWgaHGoz1p5NMNAwFLSDrS0CCiikoGFFFFABRRRQAUU\r\nUUAFFFFABRRRQAUUlFAgooooAKeBSAUtJjFpppaaaAEooopiCiiigQUUUUAJRS0UwEopaKAEopaK\r\nAEpaKKQBRRRQAUtFFAxRTqQU6kMKaRS0UAMNJTjTaYgooooAWikpaACiiigYUUUUAFFFFABRRRQA\r\nUUUUALRSUtAhKSlNJQJiUUUUxBRRRQAUUUUAFFFFABSikpRQA6ilAyKB1pFCGkqTbSbaQDKKcRSY\r\npgJRmjFFADgacDUdKDSAlBopgNOzQAhqI1IajNNCYopaQUtAgpaSloAaaQ0ppDQAlFFFMAooooAK\r\nKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigApR\r\nSUooAfRRRSAKKKKAGVLD3qKpoe9MY+jFLRSAMUYopaAEpaKKBBRRRQAUUUUAFFFFABRRRQAhpMU6\r\n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\r\nCilFAC0UUUhhRSUUAFJRRTAKKKKBBRRRQAUUUUDCiiigQlJS0lMQUUUUCCiiigAooooAKUUlKKAH\r\nE8UgoNFIoXNJRRQMKDRRQIKM0mKKAHZpc02iiwDs0Cm0qmkBIBRigGloAYw4qM1Kw4qI00JiilpB\r\nS0CCiiigBDTacabQAUUUUwCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACnCm04UALS0lLSAKQ9KWkPSgBtPUcUypox8lDGhlGakK1GVpDD\r\ndShqYRRTAmBpwqFTUgNAh9FJmjNAC0lJmjNIYtFNzRmgB1GabupN1AD6KZuo3UAPopu6jdQA4mmM\r\naQtTCaYCHrSUUUCAU8GmUtAEmaaxpM0maBhSUtFACUtJRQAtFFFAwooooAKKKKBBRRRQMKKKKAFp\r\nabS0ALSGiikAlFLRTAKKKKAFopKKQBRSUUwFopKKAFopKKAFopKKAFozSUUALmjNJRQAtFJRQAtF\r\nJRQAtFJRQAUtJRQAtJRS0AJS0UtACYopaKQCUUUUAFJRRTAKKKKACiiigQUUUUAFFFFABRRRQAZo\r\nIzSUooEAFNNOzSGgBKKKKYgooooAKUUlLQNCmgUUopDCkpaKBiUCiigQ/HFIVp68ilxSAiIpMVIR\r\nTTQA2lAoAp4FMQoFOpMUtIBD0qA9anPSoD1poGKKWkFLQIKKKKAENNpxptMAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKcKbThQ\r\nAtLSUUgFpD0paQ9KAG1PF9wVBU8X3BQxjqQinUhpARMKYalaozQMQU8GmgU4CmA4GjNJRSAXNJSg\r\nUuKAG0lPxSEUAMJpM0rCmUwHZo3U2igVxc0ZpKKAuLmigU4CgYgWnbacBSikIZsoK1JSYoGRbaTF\r\nS4prCgBlFFFMYlFLSUCFopKWgYUUUUAFFFFABRRRQAUUUUAFFFFAC0UlLQAtJRRSAKSlpKYC0lFF\r\nABRRRQAUUlFAhaKSigBaKSigAooooAKKKKAClpKKAFpKKKACiiigBaKKKACiiigBRS0CikMKKKKA\r\nEpKWkpgFFFFAgooooAKKKKACiiigAoopKACiiigQGiiigBVGaGoBwaQnNACUUUUxBRRRQAUtFFIY\r\ntKKbTqBhQKKBQMDSUppKAJEPFPqJTzUlIQhphpxNNNAAKetMFPFAh1FFFACHpUB61O3SoD1poBVp\r\naQUtAgooooAQ02nGm0wCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigApwptOFAC0UUUgFpD0paQ9KAG1PH9wVBUinCihjRITSE0wtT\r\nd1IY4mkpM0ooAUUopKWgBaUCkzS5oAWikzRmgBaQ0maaTQANUdOJptNCYUUUUxBRRRSGKKeKaKcK\r\nQxwp1MFGaAH0ZpmaM0AOprdKXNNJoGMooNFMApKWkoEwpaSigBaKKKBhRRRQAUUUUCCiiigAoooo\r\nGFLSUtABS0gpaQBSUtJigBKKWimAlFLRQA2ilooEJRRRQAUUUUCCiiigAooooAKKKKACiiloGFFF\r\nLQAlFLilFAxMUuKWikAUUUlABSUUUAJRRRTEFFFFABRRRQAUUUUAFFFFABSUUUAFJRRTJFopKWgA\r\npKKKACiiigAooooAWiiikMWlpKUUDA0Cg0ooGBptOpDQAlPB4plKKBDiabTsUYpAAFOFAFLQIWii\r\nigBG6VAetTt0qA9aaAUUtIKWgQUUUUAIabTjTaYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU4U2nCgBaKKKQC0h6UtIelADaeB\r\nxTKmQfKKGNEZBpMVMRTCKVwGCnCkxRTGLmjNNzRmgB2aM03NGaLAOzRupuaSiwXHZpM0lFAhaMUo\r\np1AEeKKeRTaAEpaSlFACinCminA0hi0lLSUDCiiigAoPSikNADaKKKYBSUtJQJhRRRQAUtJSigAo\r\noooGFFFFAgooooAKKKKACiiigYtFFFAC0UlLSAKKKKAEopaKAEpMU6jFADaKXFGKYDaKWjFAhKKd\r\nijFADaWlxS4oAbRTsUYoGNxS4p2KMUgExRS0UAJS0UUAFFJRQAtJRRQAlFFJTAKKKKBBRRRQAUlL\r\nSUAFLSUUAFFFFABRRSUCCiiimIUUUUUgEooopgFFFFABSikpaBi0lFLSGFFFFAxadSLTqAExQRTq\r\nCOKAIjQOtOIptAEo6UuKROlOoEJS0lApCFoopaAGt0qA9anbpUB600AopaQUtAgooooAQ02nGm0w\r\nCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK\r\nKKKACiiigApwptOFAC0UUUgFpG6UtI3SgBtTp90VBUq/dFDGh9IRS0UhjMU0ipcUjCgCE0lOIpMU\r\nxCUUYpcUAJRTtpo2UANpadspNtAAKdTQKWkMU000tJigBKUUmKKYC0UlFADs0opopwFIYtJRiikA\r\nUhoopgNNFFFMBKKKKBBRRRTEFFJS0gFopKWgYUUUlABS0lFAC0UUUAFFFFABS0lFAxaWkpaQBRRR\r\nQAUtJS0AFFFFABSYpaKAExRS0hoAKWkFLQAUUUUAFFFFABS0UUAJRRRQAUUUlABRRRQAlFFJTAWk\r\noooEFFFJQAUUUUAFFFFABRRRQAUUUUCCkoopiCiiigBaWkpQKQxKSlNGKYCUUUtABRRRSGFLQKKB\r\nhRRRQA5KkqJTzUgoELRRRSAYaYakamGmMchp5qJTg1L2oEITQDTWpM0gJM0ZpgNFACseKiNPPSmU\r\n0JiilpBS0CCiiigBDTacabTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACnCm04UALRRRSAWkbpS0jdKAG1Mo+UVDVhR8ooY0FKK\r\nMUtIBKDS0lMCMijbT8UuKQDNlG2pMUlADdtLilooAMUhFOpKAGEUmKfRSGMxS4p1FADMUbafiigB\r\nm2jbT6KAGhaXFLRQAmKaRTzTDQA00lKaTFMBKKKKYwpKWigBKKKKCRKKKKYC0UCikMWiiigYlLSU\r\nUCFopKWgAoopKAFopKWgApaSigY6ikopALRSUtAC0UlGaAFoozSZoAWikooAKKKSgYtFFFABS0lF\r\nAC0UmaM0CFpKKKACikooAKKKSmAUUUUCEooooAKKKKACiiigQUUUUDCiiigQUlLSUwCiiigQUUUU\r\nAKKUGkopDFNFJT05FAxlFKwwaSgApaSloAWkpaSgYUUUUAFSKeKjp6GgB9FFFIQjVGakNMNAxtSA\r\n8VHTlNMBWplPamgUCFAp2KBThSENYcVEambpUJpgKKWkFLQIKKKKAENNpxptMAooooAKKKKACiii\r\ngAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKcKbT\r\nhQAtFFFIBaRulFDUANqyv3R9KrVZX7ooGLRRS0AJRRRQAlLSUUgFpKM0maAFopM0UDFpaSigQUUU\r\nUDEooooAKWkopAFLSZooAWkoppNACk000hNFMAxSgUopRQBEwpKlccVFTGFFJS0AJRRRQISilpKY\r\ngpaSigBaKKKQwooooAKKKKACiiigAooooAWikpaACiiigYtFJRQAtFJRQAtFJRQAuaWm0UALRSUU\r\nALRSUUALmjNJRQAtJRRQAuaSiigAooooAKKKKBBSUUUAFFFFAgooooAKKKKACiiigAooooASiiim\r\nIKKKKACiiigBRSkUCnYpFDKcpwaSkoAc1JQaKACgUUUDFpKXNJQAUUoGaDQAlOU802gUATUUg6Ut\r\nIBKa1OpDQAw0lKaSmBIORSUIaDSEKDS5pmaUGgBWPFRGnk8Uw0xMUUtIKWgQUUUUAIabTjTaYBRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAU4U2nCgBaKKKQBSGlpDQAlWh0FVatDoKBhRRRQAUUtJQAhphNPNRtxSGLmjNMzS0AOzRm\r\nm0UAPzRuqPNJuoAk3UZqPNANFgJc0ZqPNLmgB2aN1MJpuaAJN1G6o80ZosFyQtTS1MzRTsFxc0oN\r\nNoBoESg0uajzS5pDHnmo260u6kNMBKKSloGJRRRQIKSlopiEopaSgBaKSloAKKKKBhRRRSAKKKKA\r\nCiiigAooooAKWkooAWikooAWikooAKKKKAClpKKAFopKKAFopKKAFopKKACiiigAooooAWkoooAK\r\nKKKACiiigQUUUUAFFFFABRRRQAUUUUAFJS0lABRRRTEFFFFABSikpRQMdilFHakpDEPWkoNFAC0l\r\nLSUALRSUtABRSUtACrQaSigYUUUtACqadmmCnUAOpDSZopANNJSmkpgKDSmm07tQAhpM0GkoEKTT\r\naWkoEOFLSCloEFFFFACGm0ppKYBRRRQAUUUUAFFLRQAlFLRQAlFLRQAUUUUgCiiigAooooAKKKKA\r\nEooopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFOFNpRQA6ikpaQBSGlpDQAlWh0qqKsjpTGLRRR\r\nSAWkoozQAVG1PJpjUhjKKMUuKACilxSYoAQ02lNJTQgpaQUtAxaKKWkA0im1KRTCKYhtFFFMQUUY\r\npQKQxMUYp+KMUXCwyin4pMUANozS4pMUAFFFFAwooooAKKKKACkpaSmIKKKKAFopKKAFopKKAFoo\r\nopAFFFFABRRRQAUUUUAFFFFABRRRQMKKKKACiiigAooooAKKKKACiiigAooooAKKKKBBRRRQAUUU\r\nUAFFFFABRRRQAUUUUAFFFFABRRRQAUlLSUxBRRRQAUUUUAFFFFAx60GkBopDA0lKaSgBaSlpKACl\r\npKKACnCm0tACkUlLmkoGFFFFABThTactAC0UtGKQDTSGn4pCKAGUopCKUUwA02nkZppFBIlJSmkp\r\niHCikFLSAKKKKAEpKWkpgFFFFABRRRQAtFFFIAooooAKKKKACiiigAooooAKKKKACiiigBKKKKYB\r\nRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSikpRQAtFFFIBaQ0tIaAEFWRVYdas0DQtFJS0AJRRRQA\r\nhpppxpKQxAKXFKKKAExQRS0UAMIphFSmmkUAMopSKSgBRSim04UAOppFPpDTEREUYpxFAoAQClpQ\r\nKWkMSiijNABSUZooAMUmKdSUAJikIp4oYcUwGUlFFABRRRQAUUUUwEooooEFFFFABRRRQAUUUUAF\r\nLSUUALRSUtABRSUUALRRRQAlFLRQAUUUUAFFFFABRRSUALRRSUALRSUUALRRRQAUUUUAFFFFABRR\r\nRQAUUUUgCiiigAoopKAFooooAKKKKACkpaSmIKKKKACiiigAooooGKKWkpaQwpKWkoAWkoooAKKK\r\nKACloooGFFFFABRRRQAtA60lFAEgpaap4p1ABTTTqQ0hDaMUZozQMdikNANITQIQ0ynE02mJiilp\r\nBS0CCiiigBKSlpKYBRRRQAUUUUALRRRSAKKKKACiiigAooooAKKKKACiiigAooooASiiimAUUUUA\r\nFFFFABRRRQAUUUUAFFFFABRRRQAUopKUUALRRRSAWkNLSGgBB1qzVYVNmhjQ7NGaYTSbqQyTNFMD\r\nUuaAHUlFFAC0UlFAC0UlGaACg0ZpKAEIpMU6koAbSig02gB+aM0zNGaYCmgUmaAaQD6KbmlzQAhp\r\nKCaSgBc0maSimA7NGaSigBwNDHim0GgBKKKKACiiigAooooASiiimIKKKKACilpKACiiigAooooA\r\nKKKKACiiigAooooAWikooAWikooAWikooAWiikoAWikooAKKKKAFopKKAFopKKAFopKKAFpKKKAF\r\npKKKACiiigAooooAKWkpaACiiikAUlLSUxBRRRQAUUUpoASlpKKBhS0lKKAFooopDCkoooAKKKKA\r\nFooooGFFFFABRRRQAUUUUAOU07NR07NADs0hNNooAKKSnCgBKQmlJppoEFJS0lMkUUtIKWgAooop\r\nAJSUtJTAKKKKACiiigBaKKKQBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACUUUUwCiiigAooooAKKK\r\nKACiiigAooooAKKKKAClFJSigBaKKKQBQaKQ0AFSVGKkxQxoQ02nEU00DFFOFMpwpAPFFJQKAFpa\r\nSigAooooAKKSloAKSlooAaaaaeaYaBDaKKKYBS0lFADs0maKKBhSUtJQIKKKKACiiloAKKKKBiUU\r\ntFACUUUUAFFFFMAooFLQAlFFJQIWkoooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigQUUUUAFFFFABRRRQAUUUUDCloopAFFFFABSUtJTAKKKKB\r\nBSmkooGFFFLQAlKKKKAFooopDEooooAKKKKAClpKWgYUUUUAFFFFABRRRQAUtJRQAtFFAoAWilpp\r\npAIaBRQKYARTae3SmUEiilpBS0xBRRRSASkpaSmAUUUUAFLSUtABRRRSAKKKKACiiigAooooAKKK\r\nKACiiigAooooASiiimAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUopKUUALRRRSAKQ0tIaAAdalq\r\nIdamoY0NNNNPNNNIBtOFJSimAopabmjNIY7NFNzRmgB9FNzRmgB1FNzS5oAWikzRmgANNNKTTCaA\r\nENFFApiFApcUq07FAxmKMU/FGKAI8UVJikKUAR0op22lAoAQLShKXNJuoACAKbSmkoKA02lpKBMK\r\nKKKYgFLSUUAFFFFAhKKKWgBKKWkoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKBBRRRQAUUUU\r\nAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQMKWiikAUUUUAFFFFABRRRQAlFFFMAoopa\r\nAEpaKKACiiigBaKBRikUFJS0lAgooooAKWkooAWiiigYUUUUAFFFFABRRRQA4UUgpaAFppp1IaAG\r\n0UUtAA3SmU89KZTJYopaQUtAgooopAJSUtJTAKKKKAClpKWgAooopAFFFFABRRRQAUUUUAFFFFAB\r\nRRRQAUUUUAJRRRTAKKKKACiiigAooooAKKKKACiiigAooooAKUUlKKAFooopAFIaWkNAAOoqaoR1\r\nqWgaCmmlpDQAlFFLSASkp1JTASilpKADNGaMUoFAwzS0AU4CkAlGKdiigBpFNIqSmmgCOgCnEUAU\r\nxCinCkopDHUUzNLmgY+mk0hNNJpjHZozTQaWgAJzQBQKXFMBKSnEUAZpANIpKkxTStMQ2kNLQaBD\r\naKWigQlFFFABS0lFAC0lFFABRRS0AJRRRQAUUUUCCiiigYUUUUAFFFFABRRRQIKKKKBhRRRQAUUU\r\nUCCiiigAooooAKKKKACiiigAooooAKKKKBhRRRQAUtJRQAtFFFIAooooAKKKKACkpaKAEpRSUopg\r\nBooNFIAooooGKKWm08UDEpDTqaaAEooooEFFFFAC0UUUDCiiigAooooGFFFLQIQU+m0ooAWkoopA\r\nJRQaSmMCabTjTaZDFFLSCloEFFFFIBKSlpKYBRRRQAUtJS0AFFFFIAooooAKKKKACiiigAooooAK\r\nKKKACiiigBKKKKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSikpRQAtFFFIApDS0hoAB1qTNRCn\r\nUDQ7NJmkooAWikooAWikooAKUCilAoGKBRilFLSATFLSUtAC0UmaKACkNFIaACikpQaACg0tJTGJ\r\nRRRigYlJTsUpFADRQRTlFDntQA0Gn5xUdOBpiHMaaDQTmigY7NNJopKAENFLSUgEooopkhSUUtAh\r\nKKWigBKKWkoAKWkpaACiikoAWkopaAEopaSgAooooAKKKKACiiloASiiigAooooAKKKKACiiigAo\r\noooAKKKKBBRRRQAUUUUAFFFFAwooooAWikpaACiiikAUUUUAFFFFABRRRQAlKKSlpgLSUUUhhRRR\r\nQAU4Gm0ooAWkNLSGgYUlFFAgooooAKWkooAWikpaBhRRRQAUUUUALQKSloAWigUtIBppKcabTAQ0\r\nlKaSmSxRS0CigQUUUUgEpKWkpgFFFFABS0lLQAUUUUgCiiigAooooAKKKKACiiigAooooAKKKKAE\r\nooopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFKKSloAWikpaACkNLSGgBBTqaOtPpDCjFFFIBKK\r\nWkpgFKKSlFAxcUtApaQBRmikoAKWiigBaKKSgApppTTSaADNApKcBTGLRRRQMKKKSgYuaSg0CgBw\r\n4FMPWgmgUCFxxSU7NNoAKKUCigAoopKAFpDRS0wG0lKaMUCY2lpKKCRaKKKACiiigAxS4oozQMSi\r\niigAooooAKKKKBBSUtFACUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUtJRQAtJS0UAJRS4pKACiii\r\ngAoopaAEoopaACiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUwCgUUUALRRRSKEooooJCi\r\niimAUUUUhhS0lFAxaKKKAAUppKWgBKWkooAdS00UtIBaaaWkNMBDTaU0lMli0tJS0CCiiikAlJS0\r\nlMAooooAKWkpaACiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAlFFFMAooooAKKKKACiiigAoo\r\nooAKKKKACiiigApaKKACiiigBaQ0UUAA60+iikxoKMUUUhhSUUUAJSiiimA4UtFFIAooooAKWiig\r\nAppoooAQ0lFFAxQKWiimMKSiigYUmaKKACjtRRQISloooAWjFFFAxaSiigQUGiigBKXNFFACUCii\r\nmA00lFFBDCiiigApaKKACiiigYUUUUAFFFFIAooopgFFFFABSUUUCCiiigAooooAKWiigBKKKKAC\r\niiigAooooAKWiigAooooAKKKKAEooooAWiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAF\r\nJRRTAKKKKAFpaKKBiGiiikAUUUUxBRRRSGFFFFABS0UUDCgUUUABooooAKWiigAooooAaaSiimSx\r\naWiigQUUUUAJSUUUAFFFFABS0UUAFFFFIAooooAKKKKACiiigAooooAKKKKACiiigD//2Q==', 'asha1', '2015-03-31 18:21:44', 'asha1', '2016-09-12 18:21:44', 'wasqfrtgyhug');
INSERT INTO `hm_patient` (`Patient_id`, `PinCode`, `Village_id`, `City_id`, `District_id`, `State_ID`, `Country_ID`, `Card_Type_id`, `Gender_Id`, `Cast_Category_Id`, `Patient_Salutation`, `Patient_FName`, `Patient_MName`, `Patient_LName`, `Patient_DOB`, `Patient_Age`, `Patient_Language`, `Patient_POB`, `Education`, `Patient_BPL`, `Patient_Marital_Status`, `Patient_Contact`, `Address_line1`, `Address_line2`, `Patient_Emergency_number`, `Patient_Ward`, `Patient_Image`, `Created_By`, `Created_Date`, `Updated_By`, `Updated_Date`, `Card_Number`) VALUES
('asha1782', '41001', 1, 1, 1, 1, 1, 1, 2, 1, 'Mr', 'Sunil', 'Kumar', 'Muttepawar', '1998-10-01', 18, 'English', 'Gurugram', 'Literate', 0, 'Married', 4294967295, 'Kaur baugh', '', 1234567890, 'null', '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAKBueIx4ZKCMgoy0qqC+8P//8Nzc8P//////////////\r\n////////////////////////////////////////////2wBDAaq0tPDS8P//////////////////\r\n////////////////////////////////////////////////////////////wAARCAPABQADASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwCGiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAP/9k=', 'asha1', '2016-07-02 13:43:45', 'asha1', '2016-11-15 13:43:45', '123456789012'),
('asha1950', '41001', 6, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Suman', 'Sudas', 'Jadav', '1987-06-22', 29, 'Marathi', 'Akola', 'Literate', 0, 'Married', 4294967295, 'Akola market gali', '', 4294967295, '12', '', 'asha1', '2015-05-12 11:08:09', 'asha1', '2016-10-05 11:08:09', 'qawsqawsedrf'),
('asha1952', '41001', 2, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Suman', 'Sudas', 'Jadav', '1987-09-12', 29, 'Marathi', 'Akola', 'Literate', 0, 'Married', 4294967295, 'Akola market gali', '', 4294967295, '12', '', 'asha1', '2016-05-05 11:08:09', 'asha1', '2016-10-05 11:08:09', 'qawsqawsedrf'),
('asha1985', '41001', 6, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Suman', 'Sudas', 'Jadav', '1987-06-22', 29, 'Marathi', 'Akola', 'Literate', 0, 'Married', 4294967295, 'Akola market gali', '', 4294967295, '12', '', 'asha1', '2016-03-08 11:08:09', 'asha1', '2016-10-05 11:08:09', 'qawsqawsedrf'),
('asha2243', '41001', 4, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Gangabai', 'Ishwar', 'Aapte', '1988-09-08', 28, 'Marathi', 'Pune', 'Literate', 0, 'Married', 4294967295, 'Kothroud pune null stop', '', 1478523695, '12', '', 'asha1', '2016-08-10 15:59:41', 'asha1', '2016-03-08 15:59:41', 'qawsedrftgyh'),
('asha2244', '41001', 4, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Gangabai', 'Ishwar', 'Aapte', '1988-09-08', 28, 'Marathi', 'Pune', 'Literate', 0, 'Married', 4294967295, 'Kothroud pune null stop', '', 1478523695, '12', '', 'asha1', '2017-08-10 15:59:41', 'asha1', '2016-03-08 15:59:41', 'qawsedrftgyh'),
('asha2334', '41001', 4, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Gangabai', 'Ishwar', 'Aapte', '1988-09-08', 28, 'Marathi', 'Pune', 'Literate', 0, 'Married', 4294967295, 'Kothroud pune null stop', '', 1478523695, '12', '', 'asha1', '2017-10-10 15:59:41', 'asha1', '2016-03-08 15:59:41', 'qawsedrftgyh'),
('asha2777', '41001', 5, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Suman', 'Sudas', 'Jadav', '1987-09-12', 29, 'Marathi', 'Akola', 'Literate', 0, 'Married', 4294967295, 'Akola market gali', '', 4294967295, '12', '', 'asha1', '2015-08-18 11:08:09', 'asha1', '2016-10-05 11:08:09', 'qawsqawsedrf'),
('asha2784', '41001', 5, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Suman', 'Sudas', 'Jadav', '1987-09-12', 29, 'Marathi', 'Akola', 'Literate', 0, 'Married', 4294967295, 'Akola market gali', '', 4294967295, '12', '', 'asha1', '2016-05-24 11:08:09', 'asha1', '2016-10-05 11:08:09', 'qawsqawsedrf'),
('asha4207', '41001', 8, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Suman', 'Sudas', 'Jadav', '1987-09-12', 29, 'Marathi', 'Akola', 'Literate', 0, 'Married', 4294967295, 'Akola market gali', '', 4294967295, '12', '', 'asha1', '2016-10-05 11:08:09', 'asha1', '2016-03-20 11:08:09', 'qawsqawsedrf'),
('asha4702', '41001', 8, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Suman', 'Sudas', 'Jadav', '1987-09-12', 29, 'Marathi', 'Akola', 'Literate', 0, 'Married', 4294967295, 'Akola market gali', '', 4294967295, '12', '', 'asha1', '2016-12-02 11:08:09', 'asha1', '2016-03-20 11:08:09', 'qawsqawsedrf');
INSERT INTO `hm_patient` (`Patient_id`, `PinCode`, `Village_id`, `City_id`, `District_id`, `State_ID`, `Country_ID`, `Card_Type_id`, `Gender_Id`, `Cast_Category_Id`, `Patient_Salutation`, `Patient_FName`, `Patient_MName`, `Patient_LName`, `Patient_DOB`, `Patient_Age`, `Patient_Language`, `Patient_POB`, `Education`, `Patient_BPL`, `Patient_Marital_Status`, `Patient_Contact`, `Address_line1`, `Address_line2`, `Patient_Emergency_number`, `Patient_Ward`, `Patient_Image`, `Created_By`, `Created_Date`, `Updated_By`, `Updated_Date`, `Card_Number`) VALUES
('asha5291', '41001', 7, 1, 1, 1, 1, 1, 2, 1, 'Mr', 'Sunil', 'Kumar', 'Muttepawar', '1998-10-01', 18, 'English', 'Gurugram', 'Literate', 0, 'Married', 4294967295, 'Kaur baugh', '', 1234567890, 'null', '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAKBueIx4ZKCMgoy0qqC+8P//8Nzc8P//////////////\r\n////////////////////////////////////////////2wBDAaq0tPDS8P//////////////////\r\n////////////////////////////////////////////////////////////wAARCAPABQADASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwCGiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAP/9k=', 'asha1', '2017-06-19 13:43:45', 'asha1', '2016-11-15 13:43:45', '123456789012');
INSERT INTO `hm_patient` (`Patient_id`, `PinCode`, `Village_id`, `City_id`, `District_id`, `State_ID`, `Country_ID`, `Card_Type_id`, `Gender_Id`, `Cast_Category_Id`, `Patient_Salutation`, `Patient_FName`, `Patient_MName`, `Patient_LName`, `Patient_DOB`, `Patient_Age`, `Patient_Language`, `Patient_POB`, `Education`, `Patient_BPL`, `Patient_Marital_Status`, `Patient_Contact`, `Address_line1`, `Address_line2`, `Patient_Emergency_number`, `Patient_Ward`, `Patient_Image`, `Created_By`, `Created_Date`, `Updated_By`, `Updated_Date`, `Card_Number`) VALUES
('asha5555', '41001', 7, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Shantabai', 'Prakash', 'Patil', '1984-09-12', 32, 'Marathi', 'Kolhapur', 'Literate', 0, 'Married', 4294967295, 'Kothrud pune', '', 4294967295, '12', '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAKBueIx4ZKCMgoy0qqC+8P//8Nzc8P//////////////\r\n////////////////////////////////////////////2wBDAaq0tPDS8P//////////////////\r\n////////////////////////////////////////////////////////////wAARCAPIBRADASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwCGiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigApaSloAKB1opR1oAdS0lLSAKKKKAEbpTKc3Sm0wCiiig\r\nBKKWigBKWiigBKKWigBKWiigAooooASilooASilooASilooASilooASilooAKSlooASilooASilo\r\noASilooASilooASilooASilooASloooAKSlooASiiloASiiigAooooAKKKKACiiigAooooAKKKKA\r\nCiiigAoopaAEopaKAEpaKKACiiigApKWigBKWiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooASilooASilpKACiiigAooooAKKKKACiiigAoopaAEpa\r\nKKACiiigAooooActOpq06kAUUUUAIaZTzTKAEpaKKYBThTacKQC0tJS0gCiiigYUUUUAFFFFABS0\r\nlLQAUUUUALRSUtAEFFFFUIKKKKACiiigAooooAKKKKACiiigAooooAKWkpRQAUo60lKvWgB1LSUt\r\nIAooooAa3Sm05qbTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAEopaKACiiigApKWigApKWigAoo\r\nooAKKKKACiiigAooooActOpq06kAUUUUAIaZTzTDQAlO7UlL2pgJThTacKQC0tJS0gCiiigYUUUU\r\nAFFFFABS0lLQAUUUUALRSUtAEFFFFUIKKKKACiiigAooooAKKKKACiiigAooooAKXtSU4dKAEpVp\r\nKVaAHUtJS0gCiiigBrU2nNQo+YUwExRg1ZxS4FAFXFGKtYFGBQBVxRirOB6UYFAFbFGKs4HpRgel\r\nAFbFGKs7R6UbR6UAVqKs7R6UbR6UAVqKs7R6CjaPQUAVaKs7F9BRsX0FAFairOxfSjYvpQBWoqzs\r\nX0o2L6UAVqKs7F9KPLX0oArUVY8tfSjy19KAK9FWPLX0o8tfSgCvRVjyl9KPKWgCvRVjylpPKWgC\r\nCip/KWjyloAgoqfyhR5QoAgoqfyhSeUPWgCGipvKHrR5Q9aAIaKm8ketHk+9AENFTeT70eT70AQ0\r\nVL5PvR5PvQBFRUvkn1o8k+tAEVFS+UfWk8o+tAEdFSeUaPKagCOipPKajymoAjop/lNR5bUAMop/\r\nlt6UeW3pQAyin+W3pSeW3pQA2inbG9KNjelADaKdsPpRtPpQA2inbT6UbT6UANopdpo2n0oASilw\r\naMGgBKKXBoxQAlFLijFACUUuKKAEopaKAEopaKAEopaKAEopaKAEopaKAEpaKKAEopaKAEopaKAE\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBy06mrTqQBRRR\r\nQAhphp5phoAKcOlNp6j5aYDTSikNKKQC0tJS0gCiiigYUUUUAFFFFABS0lLQAUUUUAFLSUUAQ0UU\r\nVQgooooAKKKKACiiigAooooAKKKKACiiigApw6U2nfw0AJSrSUq0AOpaKKQBRRRQA1qE+8KG60sf\r\n3xTAsUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUU\r\nUAFFFFABRRRQAUUUUAFGKKKADFGBRRQAYFJgelLRQAmB6UbR6UtFACbR6UbR6UtFACbR6UmxfSnU\r\nUAN2L6UbF9KdRQA3y19KPLWnUUAM8taPLWn0UAM8oUeUKfRQBH5Qo8oVJRQBH5Qo8r3qSigCPyve\r\nk8r3qWigCLyqPKqWigCHyjR5RqaigCHyjSeUanooAg8o0eWanooAr+W1HlmrFFAFfyzRsPpViigC\r\ntsPpRsPpVmjFAFbafSjafSrOKMCgCrtPpRtPpVrApMCgCtg0YNWdo9KNooArYNGKs7R6UbR6UAVs\r\nUYqxsFGwUAVqKs7BULjBoARadTVp1IAooooADUZqQ1GaACng/LTKcvSmAhoFBoFIB1FFLSAKKSlo\r\nAKKKKBhRRRQAUtJRQAtFFFABRRRQBDRRRVCCiiigAooooAKKKKACiiigAooooAKKKKACn44ptO/h\r\npANpVpKctMB1FFFIAooooAa3Wlj++KRutOi++KYE9FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAHpUEnWp6gk60ANWnU1adSAKKKKAENMNPNMNABTh0p\r\ntKOlMANApDSikA6lpKKQBS0lFAxaKKKACiiigAooooAWiiigAooooAhoooqhBRRRQAUUUUAFFFFA\r\nBRRRQAUUUUAFFFFAC07tTRSnpSASnLTactADqKKKACiiigBrdadF9+mnrT4fvUwJqKKKACiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACii\r\nigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqCTrU9QSdaAGrTqat\r\nOpAFFFFAAaYaeaYaAEpwHFNpwPFMBDQKQ0opAOooopALRSUUDFooooAKKKKACiiigBaKSloAKKKK\r\nAIaKKKoQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAopTSDrS0AJTlptOXpQA6iiikAUUUUAMPWpIf\r\nvGoz1qWHqaYEtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAVBJ1qeoJOtADVp1NWnUgCiiigBDTDTzTDQAUo6UlKOlMBKUUlKKQDqKKKQBRS0lAwoopa\r\nACiiigAooooAKWkooAWiiigCGiiiqEFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAKvWlNCfeoNIBKc\r\nvSm04dKAHUUUUAFFFFADD1qWHvUR61LD3pgS0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFF\r\nFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFFFFABRRRQAUUmaXNABRRmkzQAtFJmjNAC0UmaM0ALRRmk3UALRTd1G+gB1FN3UuaAFoozRQAUU\r\nUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRR\r\nQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOtADVp1NWnUgCiiigB\r\nDTDTzTDQAUvakpe1MBKUUlKKQDqKKKQBRRRQMKKKWgBKWiigAooooAKKKKAClpKKAIqKKKoQUUUU\r\nAFFFFABRRRQAUUUUAFFFFABRRRQA5OtBpU6/hSGkAlOHSm08dKAFooooAKKKKAGd6mh6Goamh+6a\r\nYElFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFIWAppcUAPpCcVGz0wsaAJS9NL1HRQA/fRvpl\r\nFAD9xpNxpM0UAODUoamUUATbhRkVFRQA8tTM0lFABmiiigAzS5pKKAHBjSh6ZS0ASh6UEVDSg0AT\r\nUUwPTgc0ALRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOtADVp1NWnUAFFFFI\r\nBDTDUhphoASlHSkpR0pgJSikpRSAdRRRSAKKKKBhRRRQIKKWigYUUUUAFFFFABRRRQBFRRRVCCii\r\nigAooooAKKKKACiiigAooooAKKKKAHJ1P0pDSr3pKACnimU8UgFooooAKKKD0oAZU8P3agqeL7lM\r\nB9FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFFABSZoJxUbPQA8timF6YTSUAKWzSZoooAKKSigBaSiigApaSloAK\r\nWkpRSAKKSloAUUGkopgFFFHagBKWkooAWiiigBaKKKACiiigBaXNJRQIeDT6jXrUlAwooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAqCTrU9QSdaAGrTqatOpAFFFFACGmGnmmGgApQOKSnDpTAbSik\r\npRSAdRRRSAKKKKACiiigBaKKKBhRRRQAUUUUAFFFFAEVFFFUIKKKKACiiigAooooAKKKKACiiigA\r\nooooAcvekpR0NJQAU8UynikAtFFFABQelFB6UAMqeL7lQVYj+4KYDqKKKACiiigAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAozRSHigB\r\naYz4prPUZOaAHM2abSUUALSUUUAFLSUUAFFFJQAtFFFABS5pKKAFzRSUUALRRRSGLRRRQAUhNFIa\r\nBBS0lFMBRRmiigBc0tNpaAFooooAWiijNAhy9akqIVIpyKBi0UUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFF\r\nFABRRRQAVBJ1qeoJOtADVp1NWnUAFFFFIBDTTTjTTQAlKOlJSjpTASlFJQKQD6KKKQBRRRQMKKKK\r\nBBRRRQAUtJS0DCiiigAooooAioooqhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACiiiigAp4pgp9I\r\nBaKKKACg9KKG6UAMqxH9wVXqyn3BTAWiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooprNgUAKxwKhZ80jNmm0AGaKKSgBaKKKACi\r\niigBaSiigApKWigBKWkooAWikooAUGnAgimUtAxcUZoopAGaKKKAA0lOoxQA2inYoxQA2ilooEFK\r\nKSloAWikopgLRSUtACinKcU2lzQIlFFMU0+gYUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABUEnWp6gk\r\n60ANWnU1adSAKKKKACmGnmmGgBKcOlNpw6UwG0Cg0CkA8UUCikAUUUUDCiiigQUUUUAFLSUtABRR\r\nRQMKKKKAIqKKKoQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAtFFFAAKfTB1p9IBaKKKACkbpS0jdK\r\nAGirK/dFVhVlfuimAtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFIaAAnFQu2TSu1RmgApKKKACiiigAooooAKWkooAWikpaACkoooAK\r\nWiigYUUuKMUgEopaMUAJS0YpaBiUuKBS0AJS0UtACYop2KCKAGUYp2KMUCG0U7FJQAUUUUCCiiim\r\nAU6m0UAPFKGpmaWgRIDS1Hml3cUDH0ZqMMaXdQA7NIWppJpDQIeG9adUQp6mgY6iiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqCTr\r\nU9QSdaAGrTqatOoAKKKKQAaYafTDQAlKOlJSjpTASgUUCgB4ooFFSAUUUUAFFFFABRRRQMKWkpaA\r\nCiiigAooooAioooqhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0UUUAA60+mjrTqQC0UUUAFI3Sl\r\npG6UANFWh0FVRVodKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFFFFABRRRQAUUUUAFFFITQAtRO9DvUZNACE0lFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAxaW\r\nkpQKQwpaMUuKAEpaUClxQAmKMU7FGKAG4pcUuKWgBuKXFLRSASilooATFJTqSgBMUmKdQaAG4pCK\r\ndiigBuKSnGkNMVhKKKKYgpwptLmgBxpKSg8UgFpcimUopgOzmkNGcUUAGaKSigRIjU+oRUitmgY6\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACoJOtT1BJ1oAatOpq06gAooopABphp9MNACUUUUwCgUUUAOFLSClqQCiiigAooooAKKKKBhRR\r\nRQAtFJS0AFFFFAEVFFFUIKKKKACiiigAooooAKKKKACiiigAooooAWiiigBR1p1NHWnUgFooooAK\r\nRqWkagBB1qzVZetWaYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFFFFABRRRQAUUUUABqN2pznAqBjzQAhNFFJQAUUUUAFFFFABRRRQAUUUUAFFFFABRRSgUDEpwFO\r\nApQKQxuKXFOooATFLilopDDFFLRTEFFFFABRRRQAUtFFABRRRQAUlFFIAooooASilpKAEpKdSUAN\r\nxSYp1JimISiikoEOUZofrSpSPyaAG0tJRmmAuaXtTaUmgANFJSZoAdSqcU2igCwpyKWoVbBqUHNA\r\nC0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB\r\nUEnWp6gk60ANWnU1adQAUUUUgCmGn0w0AJRRRTAKKKKAHClpBS1IBRRRQAUUUUAFFFFAwooooAWi\r\niigAooooAioooqhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0UUUAKOtOpq9adSAWiiigApGp1Na\r\ngBF+8Ks1XT7wqxTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAo\r\noooAKKKKACg0U1zgUARyNUdKxyabQAUUUUAFFFFABRRRQAUUUUAFFFFABRRTgKQwApwFApaChRRS\r\nUUgFooFLQAUtJS0AFFFFAgooooAKKKKAClpKKACiiigAooooAKKKKACkpaSgYUlLRQAlJS0UANNN\r\npxpDTEIpwaVqbSk0EiUUUlMBaM0UUAFFJRQAtApKUGgB1ORsGo80A0AWQaWo0NSUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABUEnWp6gk60ANWnU1a\r\ndQAUUUUgENNNONNNACUUUUwCiiigBwpaQUtSAUUUUDCiiigQUUUUAFFFFAwpaSloASloooAioooq\r\nhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFLQAUUUUAKtOpq0+kAUUUUAFNbrT6Y3WmAqfeFWKrx/fFW\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqGQ1\r\nI5wKgY80AJSUUUAFFFFABRRRQAUUUUAFFFFABRRTgKQwAp1FFIoKKBS0AFLRS0AFFFFAC0UlFAC0\r\nUlFAC0UlFABS0lFAC0UmaKAClpKKAFpKKKAClpKKACiikoAWikooAKKKKAEpDS0UAMNJTiKQ0xMS\r\nkoopkhRRRQAUUUUAFLSUUALRSUtACg4NWFORVapY2oAlooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKrydasVBJ1oAYtPpi0+gAooopAIaaetONNNACUU\r\nUUwCiiigBwpaQUtSAUUUUDCiiigAooooAKKKKBBS0lFAxaKKSgCOiiiqEFFFFABRRRQAUUUUAFFF\r\nFABRRRQAUtJS0AFFFFACrT6YtPpAFFFFABTW606mt1pgOj++KnqCL74qegAooooAKKKKACiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoopGoAjkNRGnuaZQAlFFFABRRRQAU\r\nUUUAFFFFABRRSigYCnCkFLSKFooopALRRRQAtFJRQAtFFFABRRRQAUtJRQAtFJS0AFFFJQAtFJS0\r\nAFFJS0AJRS0lABRRRQAUUUUAFFFFABRRRQAUlLRQA00hp1IaAGGkpxptMkKKKKYgooooAKKKKACi\r\niigBaUHBptFAFlDkU6oY25qagAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoo\r\nooAKKKKACiiigAqCTrU9QSdaAGLT6avWnUAFFFFIBDTTTqaaAEooopgFApKUUAOFLSClqQCiiigY\r\nUUUUAFFFFABRRRQAUUUUAFFFFAEdFFFUIKKKKACiiigAooooAKKKKACiiigApaKKACiiigBVp9NW\r\nnUgCiiigAprdadTT1pgOi+/U9QxffqagAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigApr9KdTJKAIWNJSmm0AFFFFABRRRQAUUUUAFFFFABSiilFIpC0UtFIYU\r\nUUUAFFFFAxaKSigBaKSlpCClpKKYC0UlLQAUUUUALSUUUALRSUUALRSUUALSUUUAFFLSUAFFFFAB\r\nRRRQAUlFFABRRRQAUlLRQA002n000xDaKU0lMkKKKKACiiigAooooAKKKKAHA4NTo2RVeno2KYE9\r\nFIDmlpAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOt\r\nADV606mLT6ACiiikAhpppxppoASiiimAlLSUooAcKWkFLUgFFFFAwooooAKKKKBBRRRQMKKKKACi\r\niigCOiiiqEFFFFABRRRQAUUUUAFFFFABRRRQAUtJS0AFFFFADlp1NWnUgCiiigApp606mHrTAkh+\r\n9+FTVDD941NQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAVHJUlRSdaAIjSUppKACiiigAooooAKKKKAClFFKKRSClFFFIYtFJRQAtFJS0AFFFLQAUlLRQMSl\r\npcUmKBBRRilpDEooopgLRSUtAgooooAKKKWgAoopKAFooooAKKKKAEopaKAEooooAKSlooASiloo\r\nASilpKAA0006kNADTTaeaaaYmJRRRTJCikpaACiiigAooooAKXNJRQBMjVIDVYHFPVuaYE9FIpyK\r\nWkAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFQSdanqCTrQAxetPpi9a\r\nfQAUUUUgENNNONNNACUUUUwEpRSUooAcKWkFLUgFFJRQMWiiigAooooEFFFFAwooooAKKKKAI6KK\r\nKoQUUUUAFFFFABRRRQAUUUUAFFFFABS0lLQAUUUUAOWnU1elOpAFFFFABTD1p9MPWmBLD1NS1FD1\r\nNS0AFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAB6VA55qV\r\nzxUB60AJSUtJQAUUUUAFFFFABRRSigYCnUlLSGFFFFIYUUUtACUtFFABS0lLQAtFFFAC0UUUAFJS\r\n0UAJRS0lABRRRQAUUUUAFLSUUALRSUUALRRRQAUUUUAFFFFACUUUUAFFJSigAooooAKSlpKACkpa\r\nSgBDSGnU00CG0UppKoQlFLRQIKKSigBaKSloAKKKKAClFJRQBMjVKKrocGpweKYC0UUUgCiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACoJOtT1BJ1oAYvWn0xetPoAKKKKQCGmnrTj\r\nTDQAUUUUwEpRSUooAcKKBRUgFFFFAwopaKACikooAKWkpaACiiigAooooAjoooqhBRRRQAUUUUAF\r\nFFFABRRRQAUUUUALRSUtABRRRQA5elOFNXpThSAKKKKACmd6fTKYEsPepajh6GpKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAI5DUNSPUdAAaSlpKACiiigA\r\nooooAKWkpaQ0LS0lLSKCiiigBaKKKACiiigYtFJS0AFLRRQIWikpaAClpKWgBKKKKAEooppNADqS\r\nmhqdmgBaKKKACiiigBaKKKAFpKKKACkpaSgAooooASlopaAEopaMUAJRS0lACUUtJQAhpKdSUANN\r\nNp5pppiYlJS0lMkWikooAKWkooAWiiigAooooAUVOjcVXp6HBoAsUUi0tAgooooGFFFFABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOtADF60+mL1p9ABRRRSAQ0w080w0AFFFFMBKU\r\nUlKKAHCiiipAKKKKBi0UUUAJRRRQAUtJS0CCiiigYUUUUAR0UUVQgooooAKKKKACiiigAooooAKK\r\nKKAFooooAKKKKAHDpTqaOlOpAFFFFABTKf2plMCaHoakqOH7pqSgAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACg9KKRulAELmmU5qbQMKSiigQUUUUAFFFFAC0tJSi\r\nkUFLRS0hiUtFLQAlFLS4oAbS0YooGFFFFAC0UCloEJRRRQAtFJRQAtJRRQAhNRk05qbTQBSg0lFA\r\niQUtNXpTqQwopKKAFopM0ZoAWikzS5oAWikzS5oAKKKKACiiigAooooAKKKKACkpaSgBKSnUlADT\r\nSGnUlADDRSmkqiWJRRRQIKKKKACiiigBaKKKAClHWkooAnQ5FPFQxtU4pgFFFFIAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACoJOtT1BJ1oAYvWn0xetPoAKKKKQCGmGnmmGgAooopgJSi\r\nkpRQA6igUVIBRRRQMKWkpaBCUUUUDClpKWgQUUUUAFFFFAyOiiiqEFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUtFBoAKKKKAHDpTqQdKWkAUUUUAB6UynnpTKYE8P3afTIvuU+gAooooAKKKKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACkbpS0xzQBE3WmU5utNoGFFFFAgooooAKKKKAFF\r\nLQKKRQopcUClpDDFLSUZoAWikooAWikooGLRSZozQIWlpuaN1AC0Zpu6k3UAOzRTc0uaAFzRmm5o\r\nzQANTKcaSmgYlFFFAiRelLSLwKWkMTNFFJmgAzRSUUALmjNJRQAuaXNMpaAHZozTaKAHbqXdTKKA\r\nH5pc0yjNAD80U3NGaAHUUmaKAFpKKKAEpKWkoAQ02nmmmmJjaKKKZIUUUUAFFFFABS0lLQAUUUUA\r\nKpwasIciq1TRNQBLRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABVeTrViq8nWgB\r\nq9afTF60+gAooopAIaYaeaYaACiiimAlKKSlFADhRQKKkAooooAKKKKBhRRRQAUtJS0AFFFFAgoo\r\nooGR0UUVQgooooAKKKKACiiigAooooAKKKKAFoNFK3WgBKKKKAHDpTqQUtIAooooAD0plPPSmUwJ\r\n4vuU+mxfcFOoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigANRMK\r\nexpp6UDIj1ptObrTaACiiigQUUUUAFKKSlFA0LSikpRUlC0UUUAFFFJQAtFJRQAuaTNJRQAuaM0l\r\nFAC5pKKSmAtJRRQAtGaSigBaKSigBaSlpKAEpyikpwoAdSUUlIApKKSmAUUUUCCiikoAWiiigAop\r\nKWgApaSigYtLSUtIBaKKKAEozS0UAGaM0mKKAFopM0tACU006kNAhtJSmkqiQooooAKKKKACiiig\r\nBaKKKACnIcGm0ooAsqcilqOM8VJQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUCCiiigYVBJ1\r\nqeq8nWgBq9afTF60+gAooopAIaYaeaYaACiiimAlKKSlFADqKBRSAKKKKQwooooEFFFFABS0lFAC\r\n0UUUAFFFFAEdFFFUAUUUUAFFFFABRRRQAUUUUAFFFFACilf71IOtOk4c0ANooooAeKWkFLSAKKKK\r\nAA9KZTz0pgpgWI/uCnU1PuCnUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABQaKQmgBpppPFObpTKRRGaSlNJTEFFFFAgooooAKUUlKKQ0KKWijNIoKKSigBaKKKACiiigBK\r\nKKKYCUUUUAFFJRQIWikooAWikooAWikooAWiiigBRS0lLSGLSUtJQAlJQaKYBSUtJQIKKKKBBRRR\r\nTAKKKKAFopKKQx1LTc0oNAC0tJmjNIYtFJRQAtJS0UANpaKSgBaKKKAGmm08000yWJRRRTEFFFFA\r\nBRRRQAtFFFABRRRQBJGanFVlODVhTkUALRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAgopKWgAooooA\r\nKrydasVBJ1oGMXrT6YvWn0AFFFFIBDTDTzTDQAUUCimAlLSUUALmjNJRQA7NGabRQA7NJmkooAWi\r\nkooAWjNJRQAuaM0lFAC5ozSUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAKOtOkOWNNoPWgAoooo\r\nAeKWkFLSAKKKKABulMFObpTaYFhPuCnUifdFLQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFMY80+o260DQh6UlKabSGMNJSmkpiCiiigQUUUUAApwpBS0hoWm0UUDFoooo\r\nGLRSUUgFpKM0ZoAKSjNJmmIWkoooFcKKSimAtFJS0AFFFFABRRRSAWiiigYtKKSlpDClpKKAENJS\r\nmkpgFJS0lAgooopiCiiigApKKKBC0UlFAC0ZpKKBi5pc02loC47NGabRmkO47NLmm5ozQMdRSUtI\r\nAoooxQAGmGn4ppFMQ2ilpKZIUUUUAFFFFABS0lFAC0UUUAFTRNUNOU4NAFmikU5FLQAUUUUAFFFF\r\nABRRRQAUUUUAFJS0lAgpaSloAKKKKBhUEnWp6rydaAGr1p9MXrT6ACiiikAhphp5phoAVehpDTl6\r\nGmmmAlFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAtFFFABRRRQA8UtIKWkAUUUUAI3Sm05ulNpgWV+6PpS0i/dH0paACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooopAFFFFABRRRQAVGetSHpUTdaBoTvSGgUpoKIzSUppKZIUUUUCCiiigAp\r\naSlpDQUtFFAwopKKAFpKKSgLi0maKSmK4tJRRQIKKKKACiiigAooooAKWkpaBhRRRQAtFFKBSGKK\r\nWgUopDExRTsUhoAbSGnUhoAbSUppKZLCiikpgFFFFAgopaKACiiigBKKWigBKKWkoAKKKKAFopKW\r\ngYtLTaWkMcKWmZp2aQxaaaWkNADTSUppKokKKKKBBRRRQAUUUUALRSUtABSikoFAFiM5FPqKOpaA\r\nCiiigAooooAKKKKACiiigApKWkoAKWkpaBBRRRQMKrydasVXk60ANXrT6YvWn0AFFFFIBDTDTzTD\r\nQA5ehppp6Hg0w9aAEooopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB\r\nRRRQAUUUUAFFFFABS0lFAC0UUUAPFLSCikAtFFFACN0popzdKaKYFpfuiigdBRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUgCiiigAooooAKKKKAA9KhbrUx6VC3WgaEp3amU7tQURt1pKVutJT\r\nJYUUUUCCiiigApaSlpDQUUUUDCkoooEFJRRTEFFFFABRS0UAJRS4oxQAlFLRQAlFLSUAFFFLQAUU\r\nUUhiiniminUmUFOFIKcBQAUhp1IaAG0hFOpDQAwim0800imhMSiiigQUUUtMBKKWikFgxS4oFLmg\r\ndhMUmKdSUAJijFFFACUUtFArCUUYoxTAKKXFGDSASloxS7aBiikpcUUhjTSU4000yWJRRRTEFFFF\r\nABRRRQAUtJS0AFFFFAEkR5qeq8fWrAoAKKKKACiiigAooooAKKKSgBaSikoAWikpaAFopKWgAqvJ\r\n1qxVeTrQA1etPpi9afQAUUUUgENMNPNMNADk6GmmlXvSGmAlFFFABRRRQAUUUUAFFFFABRRRQAUU\r\nUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUALQKKBQA8UUCikAUtJS0AI1NFK\r\n1A60wLI6UUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUgCiiigAooooAKKKKACiiigAPSoW61Maj\r\nagaI6U0d6CKChhpKU0lMlhRRRQIKKKKAFooopFBSUUUCCkpaKYhKWiigYUUtFIBKWiigYUUUUAJR\r\nS0lAgooooAKKKKAClApQKUCgaQCloopFCinU0U8UCYUhpaSgBKQ0tFAxtBFOpDQAwikp5FNxTEJR\r\nRijFAgooxRQAUtJRQMWiiigA4o4oxS4pAJijFOxS4oAbilC07FFAhMUUtFAxKKKKAEooooASmmnG\r\nkpiGUUppKZIUUUUAFFFFABS0lLQAUUUUAOTrVgdKrr1qwOlAC0UUUAFFFFABRRRQAUhpaKAG0UtF\r\nACUUUUAFLSUUALUD9anqB+tADV60+mL1p9ABRSUUgA0w080w0AKKSgUUwEooooAKKKKACiiigAoo\r\nooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBaBRQKAHiigUUgC\r\nlpKWgBrUDqKGoXqKYFmiiigAooooAKKKKACiiigAooooAKKKKQBRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFRsakqFutBSG96WikzQMa3WkpTSUyWFFFFAgoFFKKBoUCjFLRSKG4oxT8UYoEMxRin4oxQAyin7\r\naNtFwGUU7FJigYlFLil20ANop22l20AMop+2kIoAbRTsUbaBDcUoFOxS0DEoopaQwooopAKKcKaK\r\ndTEwpKWigQlFFFAxKKKKBiGjFFFACYoxS0tAhuKNtPooAbto206igBu2jFOooATFGKWigAxRilxS\r\n0xCYopaaaQBSUtJQMQ0lLRQMSiiigQGm06kNADTTacaSmSxKKKKYgooooAKKKKAFooooAUdasL0q\r\ntViM8UAPooooAKKKKACiiigAooooASilNNoAKKSloAKWkpaACoH61PUD9aAGr1p9MXrT6ACkoopA\r\nBphp5phoAKSlpKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFAC0CigUAPooopAFLSUtADWoX7woahfvCmBZooopAFFFFABRRRQAUUUUwCi\r\niikAUlLSUDDNLTaWgBaKSloEFFFFABRRRQAUUUUAIaibrUp6VCetBSCkNBooGNNJSmkpksKKKKBB\r\nThSAU6kUhaKKKQwpaKKAClxRRQAuKMUUtADcUYp1GKAG4pcUuKKAEooooASjFLRQAmKKKKACkpaK\r\nBjaWiikAUCigUwHClFIKdQIKQ0UUCEpKWkoGLRSUtACUUUUDDFFLRQISloooAKWkpaBCUYpaWmAm\r\nKWiloASiikoAKTNFJSGFBpKKBhSUUUAFJS0lAhaSiigBKaacaaaYmJRRRTJCiiigAooooAKWkpaA\r\nCnoeaZSg80AWBS0xDxTqQx1FJRQAtFJRQAtJRRQAUlLSUAJRRSUCHUUlLQAtV361Yqu/WmAi9afT\r\nF606kAUUUUABphp5phoAKSlpKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0CkpRQA+iiikAUtJRQAjdaF+8KRutKv3hQMnzS00U6gBa\r\nKKKBBRRRQAUUUUAFFFFACUhpaSgYlLRRSAKKKKYC0UlLQAtFFFAgooooARulQnrUrdKhPWgpAaBQ\r\naQUDEakpxptMlhRRSigBRTqSlqSgooooGFLSUtABS0lFAC0tJS0CFooFFMQUUtJQAUlLRSASiloo\r\nGJSUtFACUlLSUDCiiikAUtIKdTABTqbS0EhSUtFACUlLSUDEpaSlFAxaSg0ZoELRSUtAC0UUUCCg\r\nUUZpgLRRRQAUUUlAC5pKKSgAooopDEpKWigY2ilNJQAUlLSUAFFFFAhDSGnU00xDaKWkpkhRRRQA\r\nUUUUAFFFFAC0UlLQBIhqTNQL1qUGkMfS0gooAWikpaACiiigAooooAQ0mKdSUCExS0tFABVd+tWK\r\nrv1oARetOpq06gAooooADTDTjTTQAlFFFMAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigApRSUooAfRRRSAKKKKAGt1oX7wobrQOtAEwNOB\r\nqMUoNIokzRmmZpc0CsOopuaM0AOopKKAFooopgFJQaM0gCiiigYlFFFACilpKWmIWikpaBBRRRQA\r\njdKg71O3SoD1oKQGkpaSgYhpKU0lMlhSikpwpAhaKKWkUFFFFAwoopaACiiloAKWkpaBC0tJRTEL\r\nRRSUAFFGaKACikozSGIaKKQ0DDNJmkJpKAHUUCigBwpaSigQtLRS0xCUUtFADaSnUhpDG0Cg0CgY\r\nUlLmg0AGaUGm0A0APopoNLmgQtFJRmgB1FNzS0BYKKSigBaKSigAooooAKSiigYUlFFABSUUUAFF\r\nJS0CCmmlpDTEJSUtJTEFFFFAgooooAKKKKAClpKKAFHWpAajp4NIZIpp1MWnigApaKKAEpaSigBa\r\nKKKACikpM0ALmjNJmigBTUD9amNQt1oARadTV606gQUUUUAIaaacaaaAEooopgFFFFABRRRQAUUU\r\nUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFKKSlFAD6K\r\nKKQBRRRQA09aF+8KD1pY/vCgaJMUYp1FIY3FFLRQAlJmlNJQA4GnCmCnCgB1FFFAhppKcRSYoGJm\r\nilxRigAooxS4oAKWkpaYgpaSigBaKSloEB6VA/Wp6hkHNA0NFIetOWhqChhpKWkpksKeKYKeKTGg\r\npaKKQwooooGFLSUtAC0UlFAC0tJRQIWikooAdSUlFAC0maSkoGOzSUlGaADNITQTTaAFpQKAKdig\r\nQlLRRQMWikpc0ALS5pmaXNArDs0ZpuaTNAWHGkzRmkoADQKKKBi4GaUimgc07FAhpFNNPIppFACZ\r\npQaZS0APzRTc0ZoGOFLTaXNAC0UmaKAFopKKACiikoAU0lFFABSUtJQAUUUUCEooooAKDRRTAbSU\r\nppKCQooopiCiiigAooooAKKKKAFpy02lWkBKKeKjFPFAx1FFFABSUUUgCiiigBDSU6igBMUuKKWm\r\nAmKgfrVg1XfrQAgp1NFOoEFFFFACGmmnGmmgBKKKKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSikpRQA+iiikAUUUUANPWlj+8KQ9a\r\nWP71A0T0lFFIYUUUmKAEJpuacabigBRTxTBTxQA6ikpaYgooooAKKKKACiiigAopCabmgB9FNBpa\r\nAFoopaACopalpkg4oBEY6UhooJoKG0lLSUCYop1NFOoBC0UlLSGFFJS0DFopKKAFooooAKWkooAK\r\nKKKACikooAKKSigApKKSgApQKSnCmIcOKWm5ozSAWkzSZpM0DFzS5ptFFgHZozTc0ZosA7NJmkoo\r\nELmjNNoosA7NOBpmaXNADmpoY0uabmgCQGg0wGlzQA09aSlam0wFpabS0AOopKWkMWikozQA6ikz\r\nRmgBaSiigBKKKKACiiigApKKKBBRRRQAUUUlMANNp1NoJYUUUUxBRRRQAUUUUAFFFFABSikpRQBI\r\nDTwaiFPBpDJAaWowacDQAtFFJSAWikooGLRSUUCFpabmlBpgLVd+tWKrv1oAQU6minUCCiiigBDT\r\nTTjTTQAlFFFMAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigApRSUooAfRRRSAKKKKAGnrSx/epp60+P71A0SilpMUtIAooopgJikxTqKQxu\r\nKUUtFABS0lLTEFFFLQAlLRRQIKQ0tJQMaabin0UhiAU6kpaYgooooAKRulFB6UAQ96KQ9aKChKSl\r\nNJQJiilpBS0AhaKKSkMWikooAWlpKKBi0UUUAFFJRQAtJmikoAWikzRQAUUUlMQUUUUAFLmkooAM\r\n0ZpKKBXDNGaSimK4uaWm0tIdxaKSloAKKSigBaKSkoC4uaM0lFMVxc0ZpKKAuOozSUUh3FpKcKCK\r\nAG0UUUALS02loGLmikpaAClpKKQC5opKKBi0UlFAC0lFFAgooooAKKKKYBRRRQISkpaSgTEooopi\r\nCiiigAooooAKKKKAClpKWgBRTqaKWkMcDTgajFOBpDH0tMzS5oAdRSZpaACiiigAoFFJQIdUD9am\r\nzUDdaYAKdTRTqBBRRRQAhpppxppoASiiimAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUopKUUAPooopAFFFFADD1p8f3qYetPj60DRLS\r\n02lzSGGaM0lFAC5pabS0ALRSUmaAHUtMzSg0AOpabS0xC0UlFAC0lFJQAUUUUhhRRRQAUUUUAFFF\r\nFMCFutC0sg5pFoGDCmVI3SmUCYLS0gpaAFpKKKBhRRRQAUUUUALRSUZpDFopKKACikopiCiiigAo\r\nopKBBS0lKBQAooNKKQ0hjaKKKZIlFFLTASilpKAFooopAFFFFABSUUUwCiiigQUUtFAwoopaQCil\r\npBTqRQ0im1IRTSKYDaKKKBC0UlLQAUUUUDFopKWgAooooAKKSloAKSiigBaKSloAKSlooEJSGlpD\r\nQJiUUUUxBRRRQAUUUUAFFFFABSikpRQAtFGKWkMKBRRQMXNLmm5opAPBpc0zNLmgB4NLTAadmgBa\r\nQ0tIaAGk1Gae1RmmhMUU6miloELRSUtACGmmnGm0AJRRRTAKKKKACiiigAooooAKKKKACiiigAoo\r\nooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKUUlKKAH0UUUgCiiigBh605Ot\r\nNp8Q5NA0SUUuKMUhiUUuKMUAFJTsUYoASkxTsUYoAZilAp+KMUBcSloxRTEFLRRQIQ0maDTaQx1F\r\nIKWgYUUUUAFFFFABS0UUxDJBxUa1M/3ahHWgaHGoz1p5NMNAwFLSDrS0CCiikoGFFFFABRRRQAUU\r\nUUAFFFFABRRRQAUUlFAgooooAKeBSAUtJjFpppaaaAEooopiCiiigQUUUUAJRS0UwEopaKAEopaK\r\nAEpaKKQBRRRQAUtFFAxRTqQU6kMKaRS0UAMNJTjTaYgooooAWikpaACiiigYUUUUAFFFFABRRRQA\r\nUUUUALRSUtAhKSlNJQJiUUUUxBRRRQAUUUUAFFFFABSikpRQA6ilAyKB1pFCGkqTbSbaQDKKcRSY\r\npgJRmjFFADgacDUdKDSAlBopgNOzQAhqI1IajNNCYopaQUtAgpaSloAaaQ0ppDQAlFFFMAooooAK\r\nKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigApR\r\nSUooAfRRRSAKKKKAGVLD3qKpoe9MY+jFLRSAMUYopaAEpaKKBBRRRQAUUUUAFFFFABRRRQAhpMU6\r\n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\r\nCilFAC0UUUhhRSUUAFJRRTAKKKKBBRRRQAUUUUDCiiigQlJS0lMQUUUUCCiiigAooooAKUUlKKAH\r\nE8UgoNFIoXNJRRQMKDRRQIKM0mKKAHZpc02iiwDs0Cm0qmkBIBRigGloAYw4qM1Kw4qI00JiilpB\r\nS0CCiiigBDTacabQAUUUUwCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACnCm04UALS0lLSAKQ9KWkPSgBtPUcUypox8lDGhlGakK1GVpDD\r\ndShqYRRTAmBpwqFTUgNAh9FJmjNAC0lJmjNIYtFNzRmgB1GabupN1AD6KZuo3UAPopu6jdQA4mmM\r\naQtTCaYCHrSUUUCAU8GmUtAEmaaxpM0maBhSUtFACUtJRQAtFFFAwooooAKKKKBBRRRQMKKKKAFp\r\nabS0ALSGiikAlFLRTAKKKKAFopKKQBRSUUwFopKKAFopKKAFopKKAFozSUUALmjNJRQAtFJRQAtF\r\nJRQAtFJRQAUtJRQAtJRS0AJS0UtACYopaKQCUUUUAFJRRTAKKKKACiiigQUUUUAFFFFABRRRQAZo\r\nIzSUooEAFNNOzSGgBKKKKYgooooAKUUlLQNCmgUUopDCkpaKBiUCiigQ/HFIVp68ilxSAiIpMVIR\r\nTTQA2lAoAp4FMQoFOpMUtIBD0qA9anPSoD1poGKKWkFLQIKKKKAENNpxptMAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKcKbThQ\r\nAtLSUUgFpD0paQ9KAG1PF9wVBU8X3BQxjqQinUhpARMKYalaozQMQU8GmgU4CmA4GjNJRSAXNJSg\r\nUuKAG0lPxSEUAMJpM0rCmUwHZo3U2igVxc0ZpKKAuLmigU4CgYgWnbacBSikIZsoK1JSYoGRbaTF\r\nS4prCgBlFFFMYlFLSUCFopKWgYUUUUAFFFFABRRRQAUUUUAFFFFAC0UlLQAtJRRSAKSlpKYC0lFF\r\nABRRRQAUUlFAhaKSigBaKSigAooooAKKKKAClpKKAFpKKKACiiigBaKKKACiiigBRS0CikMKKKKA\r\nEpKWkpgFFFFAgooooAKKKKACiiigAoopKACiiigQGiiigBVGaGoBwaQnNACUUUUxBRRRQAUtFFIY\r\ntKKbTqBhQKKBQMDSUppKAJEPFPqJTzUlIQhphpxNNNAAKetMFPFAh1FFFACHpUB61O3SoD1poBVp\r\naQUtAgooooAQ02nGm0wCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigApwptOFAC0UUUgFpD0paQ9KAG1PH9wVBUinCihjRITSE0wtT\r\nd1IY4mkpM0ooAUUopKWgBaUCkzS5oAWikzRmgBaQ0maaTQANUdOJptNCYUUUUxBRRRSGKKeKaKcK\r\nQxwp1MFGaAH0ZpmaM0AOprdKXNNJoGMooNFMApKWkoEwpaSigBaKKKBhRRRQAUUUUCCiiigAoooo\r\nGFLSUtABS0gpaQBSUtJigBKKWimAlFLRQA2ilooEJRRRQAUUUUCCiiigAooooAKKKKACiiloGFFF\r\nLQAlFLilFAxMUuKWikAUUUlABSUUUAJRRRTEFFFFABRRRQAUUUUAFFFFABSUUUAFJRRTJFopKWgA\r\npKKKACiiigAooooAWiiikMWlpKUUDA0Cg0ooGBptOpDQAlPB4plKKBDiabTsUYpAAFOFAFLQIWii\r\nigBG6VAetTt0qA9aaAUUtIKWgQUUUUAIabTjTaYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU4U2nCgBaKKKQC0h6UtIelADaeB\r\nxTKmQfKKGNEZBpMVMRTCKVwGCnCkxRTGLmjNNzRmgB2aM03NGaLAOzRupuaSiwXHZpM0lFAhaMUo\r\np1AEeKKeRTaAEpaSlFACinCminA0hi0lLSUDCiiigAoPSikNADaKKKYBSUtJQJhRRRQAUtJSigAo\r\noooGFFFFAgooooAKKKKACiiigYtFFFAC0UlLSAKKKKAEopaKAEpMU6jFADaKXFGKYDaKWjFAhKKd\r\nijFADaWlxS4oAbRTsUYoGNxS4p2KMUgExRS0UAJS0UUAFFJRQAtJRRQAlFFJTAKKKKBBRRRQAUlL\r\nSUAFLSUUAFFFFABRRSUCCiiimIUUUUUgEooopgFFFFABSikpaBi0lFLSGFFFFAxadSLTqAExQRTq\r\nCOKAIjQOtOIptAEo6UuKROlOoEJS0lApCFoopaAGt0qA9anbpUB600AopaQUtAgooooAQ02nGm0w\r\nCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK\r\nKKKACiiigApwptOFAC0UUUgFpG6UtI3SgBtTp90VBUq/dFDGh9IRS0UhjMU0ipcUjCgCE0lOIpMU\r\nxCUUYpcUAJRTtpo2UANpadspNtAAKdTQKWkMU000tJigBKUUmKKYC0UlFADs0opopwFIYtJRiikA\r\nUhoopgNNFFFMBKKKKBBRRRTEFFJS0gFopKWgYUUUlABS0lFAC0UUUAFFFFABS0lFAxaWkpaQBRRR\r\nQAUtJS0AFFFFABSYpaKAExRS0hoAKWkFLQAUUUUAFFFFABS0UUAJRRRQAUUUlABRRRQAlFFJTAWk\r\noooEFFFJQAUUUUAFFFFABRRRQAUUUUCCkoopiCiiigBaWkpQKQxKSlNGKYCUUUtABRRRSGFLQKKB\r\nhRRRQA5KkqJTzUgoELRRRSAYaYakamGmMchp5qJTg1L2oEITQDTWpM0gJM0ZpgNFACseKiNPPSmU\r\n0JiilpBS0CCiiigBDTacabTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACnCm04UALRRRSAWkbpS0jdKAG1Mo+UVDVhR8ooY0FKK\r\nMUtIBKDS0lMCMijbT8UuKQDNlG2pMUlADdtLilooAMUhFOpKAGEUmKfRSGMxS4p1FADMUbafiigB\r\nm2jbT6KAGhaXFLRQAmKaRTzTDQA00lKaTFMBKKKKYwpKWigBKKKKCRKKKKYC0UCikMWiiigYlLSU\r\nUCFopKWgAoopKAFopKWgApaSigY6ikopALRSUtAC0UlGaAFoozSZoAWikooAKKKSgYtFFFABS0lF\r\nAC0UmaM0CFpKKKACikooAKKKSmAUUUUCEooooAKKKKACiiigQUUUUDCiiigQUlLSUwCiiigQUUUU\r\nAKKUGkopDFNFJT05FAxlFKwwaSgApaSloAWkpaSgYUUUUAFSKeKjp6GgB9FFFIQjVGakNMNAxtSA\r\n8VHTlNMBWplPamgUCFAp2KBThSENYcVEambpUJpgKKWkFLQIKKKKAENNpxptMAooooAKKKKACiii\r\ngAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKcKbT\r\nhQAtFFFIBaRulFDUANqyv3R9KrVZX7ooGLRRS0AJRRRQAlLSUUgFpKM0maAFopM0UDFpaSigQUUU\r\nUDEooooAKWkopAFLSZooAWkoppNACk000hNFMAxSgUopRQBEwpKlccVFTGFFJS0AJRRRQISilpKY\r\ngpaSigBaKKKQwooooAKKKKACiiigAooooAWikpaACiiigYtFJRQAtFJRQAtFJRQAuaWm0UALRSUU\r\nALRSUUALmjNJRQAtJRRQAuaSiigAooooAKKKKBBSUUUAFFFFAgooooAKKKKACiiigAooooASiiim\r\nIKKKKACiiigBRSkUCnYpFDKcpwaSkoAc1JQaKACgUUUDFpKXNJQAUUoGaDQAlOU802gUATUUg6Ut\r\nIBKa1OpDQAw0lKaSmBIORSUIaDSEKDS5pmaUGgBWPFRGnk8Uw0xMUUtIKWgQUUUUAIabTjTaYBRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAU4U2nCgBaKKKQBSGlpDQAlWh0FVatDoKBhRRRQAUUtJQAhphNPNRtxSGLmjNMzS0AOzRm\r\nm0UAPzRuqPNJuoAk3UZqPNANFgJc0ZqPNLmgB2aN1MJpuaAJN1G6o80ZosFyQtTS1MzRTsFxc0oN\r\nNoBoESg0uajzS5pDHnmo260u6kNMBKKSloGJRRRQIKSlopiEopaSgBaKSloAKKKKBhRRRSAKKKKA\r\nCiiigAooooAKWkooAWikooAWikooAKKKKAClpKKAFopKKAFopKKAFopKKACiiigAooooAWkoooAK\r\nKKKACiiigQUUUUAFFFFABRRRQAUUUUAFJS0lABRRRTEFFFFABSikpRQMdilFHakpDEPWkoNFAC0l\r\nLSUALRSUtABRSUtACrQaSigYUUUtACqadmmCnUAOpDSZopANNJSmkpgKDSmm07tQAhpM0GkoEKTT\r\naWkoEOFLSCloEFFFFACGm0ppKYBRRRQAUUUUAFFLRQAlFLRQAlFLRQAUUUUgCiiigAooooAKKKKA\r\nEooopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFOFNpRQA6ikpaQBSGlpDQAlWh0qqKsjpTGLRRR\r\nSAWkoozQAVG1PJpjUhjKKMUuKACilxSYoAQ02lNJTQgpaQUtAxaKKWkA0im1KRTCKYhtFFFMQUUY\r\npQKQxMUYp+KMUXCwyin4pMUANozS4pMUAFFFFAwooooAKKKKACkpaSmIKKKKAFopKKAFopKKAFoo\r\nopAFFFFABRRRQAUUUUAFFFFABRRRQMKKKKACiiigAooooAKKKKACiiigAooooAKKKKBBRRRQAUUU\r\nUAFFFFABRRRQAUUUUAFFFFABRRRQAUlLSUxBRRRQAUUUUAFFFFAx60GkBopDA0lKaSgBaSlpKACl\r\npKKACnCm0tACkUlLmkoGFFFFABThTactAC0UtGKQDTSGn4pCKAGUopCKUUwA02nkZppFBIlJSmkp\r\niHCikFLSAKKKKAEpKWkpgFFFFABRRRQAtFFFIAooooAKKKKACiiigAooooAKKKKACiiigBKKKKYB\r\nRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSikpRQAtFFFIBaQ0tIaAEFWRVYdas0DQtFJS0AJRRRQA\r\nhpppxpKQxAKXFKKKAExQRS0UAMIphFSmmkUAMopSKSgBRSim04UAOppFPpDTEREUYpxFAoAQClpQ\r\nKWkMSiijNABSUZooAMUmKdSUAJikIp4oYcUwGUlFFABRRRQAUUUUwEooooEFFFFABRRRQAUUUUAF\r\nLSUUALRSUtABRSUUALRRRQAlFLRQAUUUUAFFFFABRRSUALRRSUALRSUUALRRRQAUUUUAFFFFABRR\r\nRQAUUUUgCiiigAoopKAFooooAKKKKACkpaSmIKKKKACiiigAooooGKKWkpaQwpKWkoAWkoooAKKK\r\nKACloooGFFFFABRRRQAtA60lFAEgpaap4p1ABTTTqQ0hDaMUZozQMdikNANITQIQ0ynE02mJiilp\r\nBS0CCiiigBKSlpKYBRRRQAUUUUALRRRSAKKKKACiiigAooooAKKKKACiiigAooooASiiimAUUUUA\r\nFFFFABRRRQAUUUUAFFFFABRRRQAUopKUUALRRRSAWkNLSGgBB1qzVYVNmhjQ7NGaYTSbqQyTNFMD\r\nUuaAHUlFFAC0UlFAC0UlGaACg0ZpKAEIpMU6koAbSig02gB+aM0zNGaYCmgUmaAaQD6KbmlzQAhp\r\nKCaSgBc0maSimA7NGaSigBwNDHim0GgBKKKKACiiigAooooASiiimIKKKKACilpKACiiigAooooA\r\nKKKKACiiigAooooAWikooAWikooAWikooAWiikoAWikooAKKKKAFopKKAFopKKAFopKKAFpKKKAF\r\npKKKACiiigAooooAKWkpaACiiikAUlLSUxBRRRQAUUUpoASlpKKBhS0lKKAFooopDCkoooAKKKKA\r\nFooooGFFFFABRRRQAUUUUAOU07NR07NADs0hNNooAKKSnCgBKQmlJppoEFJS0lMkUUtIKWgAooop\r\nAJSUtJTAKKKKACiiigBaKKKQBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACUUUUwCiiigAooooAKKK\r\nKACiiigAooooAKKKKAClFJSigBaKKKQBQaKQ0AFSVGKkxQxoQ02nEU00DFFOFMpwpAPFFJQKAFpa\r\nSigAooooAKKSloAKSlooAaaaaeaYaBDaKKKYBS0lFADs0maKKBhSUtJQIKKKKACiiloAKKKKBiUU\r\ntFACUUUUAFFFFMAooFLQAlFFJQIWkoooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigQUUUUAFFFFABRRRQAUUUUDCloopAFFFFABSUtJTAKKKKB\r\nBSmkooGFFFLQAlKKKKAFooopDEooooAKKKKAClpKWgYUUUUAFFFFABRRRQAUtJRQAtFFAoAWilpp\r\npAIaBRQKYARTae3SmUEiilpBS0xBRRRSASkpaSmAUUUUAFLSUtABRRRSAKKKKACiiigAooooAKKK\r\nKACiiigAooooASiiimAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUopKUUALRRRSAKQ0tIaAAdalq\r\nIdamoY0NNNNPNNNIBtOFJSimAopabmjNIY7NFNzRmgB9FNzRmgB1FNzS5oAWikzRmgANNNKTTCaA\r\nENFFApiFApcUq07FAxmKMU/FGKAI8UVJikKUAR0op22lAoAQLShKXNJuoACAKbSmkoKA02lpKBMK\r\nKKKYgFLSUUAFFFFAhKKKWgBKKWkoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKBBRRRQAUUUU\r\nAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQMKWiikAUUUUAFFFFABRRRQAlFFFMAoopa\r\nAEpaKKACiiigBaKBRikUFJS0lAgooooAKWkooAWiiigYUUUUAFFFFABRRRQA4UUgpaAFppp1IaAG\r\n0UUtAA3SmU89KZTJYopaQUtAgooopAJSUtJTAKKKKAClpKWgAooopAFFFFABRRRQAUUUUAFFFFAB\r\nRRRQAUUUUAJRRRTAKKKKACiiigAooooAKKKKACiiigAooooAKUUlKKAFooopAFIaWkNAAOoqaoR1\r\nqWgaCmmlpDQAlFFLSASkp1JTASilpKADNGaMUoFAwzS0AU4CkAlGKdiigBpFNIqSmmgCOgCnEUAU\r\nxCinCkopDHUUzNLmgY+mk0hNNJpjHZozTQaWgAJzQBQKXFMBKSnEUAZpANIpKkxTStMQ2kNLQaBD\r\naKWigQlFFFABS0lFAC0lFFABRRS0AJRRRQAUUUUCCiiigYUUUUAFFFFABRRRQIKKKKBhRRRQAUUU\r\nUCCiiigAooooAKKKKACiiigAooooAKKKKBhRRRQAUtJRQAtFFFIAooooAKKKKACkpaKAEpRSUopg\r\nBooNFIAooooGKKWm08UDEpDTqaaAEooooEFFFFAC0UUUDCiiigAooooGFFFLQIQU+m0ooAWkoopA\r\nJRQaSmMCabTjTaZDFFLSCloEFFFFIBKSlpKYBRRRQAUtJS0AFFFFIAooooAKKKKACiiigAooooAK\r\nKKKACiiigBKKKKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSikpRQAtFFFIApDS0hoAB1qTNRCn\r\nUDQ7NJmkooAWikooAWikooAKUCilAoGKBRilFLSATFLSUtAC0UmaKACkNFIaACikpQaACg0tJTGJ\r\nRRRigYlJTsUpFADRQRTlFDntQA0Gn5xUdOBpiHMaaDQTmigY7NNJopKAENFLSUgEooopkhSUUtAh\r\nKKWigBKKWkoAKWkpaACiikoAWkopaAEopaSgAooooAKKKKACiiloASiiigAooooAKKKKACiiigAo\r\noooAKKKKBBRRRQAUUUUAFFFFAwooooAWikpaACiiikAUUUUAFFFFABRRRQAlKKSlpgLSUUUhhRRR\r\nQAU4Gm0ooAWkNLSGgYUlFFAgooooAKWkooAWikpaBhRRRQAUUUUALQKSloAWigUtIBppKcabTAQ0\r\nlKaSmSxRS0CigQUUUUgEpKWkpgFFFFABS0lLQAUUUUgCiiigAooooAKKKKACiiigAooooAKKKKAE\r\nooopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFKKSloAWikpaACkNLSGgBBTqaOtPpDCjFFFIBKK\r\nWkpgFKKSlFAxcUtApaQBRmikoAKWiigBaKKSgApppTTSaADNApKcBTGLRRRQMKKKSgYuaSg0CgBw\r\n4FMPWgmgUCFxxSU7NNoAKKUCigAoopKAFpDRS0wG0lKaMUCY2lpKKCRaKKKACiiigAxS4oozQMSi\r\niigAooooAKKKKBBSUtFACUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUtJRQAtJS0UAJRS4pKACiii\r\ngAoopaAEoopaACiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUwCgUUUALRRRSKEooooJCi\r\niimAUUUUhhS0lFAxaKKKAAUppKWgBKWkooAdS00UtIBaaaWkNMBDTaU0lMli0tJS0CCiiikAlJS0\r\nlMAooooAKWkpaACiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAlFFFMAooooAKKKKACiiigAoo\r\nooAKKKKACiiigApaKKACiiigBaQ0UUAA60+iikxoKMUUUhhSUUUAJSiiimA4UtFFIAooooAKWiig\r\nAppoooAQ0lFFAxQKWiimMKSiigYUmaKKACjtRRQISloooAWjFFFAxaSiigQUGiigBKXNFFACUCii\r\nmA00lFFBDCiiigApaKKACiiigYUUUUAFFFFIAooopgFFFFABSUUUCCiiigAooooAKWiigBKKKKAC\r\niiigAooooAKWiigAooooAKKKKAEooooAWiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAF\r\nJRRTAKKKKAFpaKKBiGiiikAUUUUxBRRRSGFFFFABS0UUDCgUUUABooooAKWiigAooooAaaSiimSx\r\naWiigQUUUUAJSUUUAFFFFABS0UUAFFFFIAooooAKKKKACiiigAooooAKKKKACiiigD//2Q==', 'asha1', '2016-09-23 18:21:44', 'asha1', '2016-09-12 18:21:44', 'wasqfrtgyhug');
INSERT INTO `hm_patient` (`Patient_id`, `PinCode`, `Village_id`, `City_id`, `District_id`, `State_ID`, `Country_ID`, `Card_Type_id`, `Gender_Id`, `Cast_Category_Id`, `Patient_Salutation`, `Patient_FName`, `Patient_MName`, `Patient_LName`, `Patient_DOB`, `Patient_Age`, `Patient_Language`, `Patient_POB`, `Education`, `Patient_BPL`, `Patient_Marital_Status`, `Patient_Contact`, `Address_line1`, `Address_line2`, `Patient_Emergency_number`, `Patient_Ward`, `Patient_Image`, `Created_By`, `Created_Date`, `Updated_By`, `Updated_Date`, `Card_Number`) VALUES
('asha5621', '41001', 7, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Shantabai', 'Prakash', 'Patil', '1984-09-12', 32, 'Marathi', 'Kolhapur', 'Literate', 0, 'Married', 4294967295, 'Kothrud pune', '', 4294967295, '12', '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAKBueIx4ZKCMgoy0qqC+8P//8Nzc8P//////////////\r\n////////////////////////////////////////////2wBDAaq0tPDS8P//////////////////\r\n////////////////////////////////////////////////////////////wAARCAPIBRADASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwCGiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigApaSloAKB1opR1oAdS0lLSAKKKKAEbpTKc3Sm0wCiiig\r\nBKKWigBKWiigBKKWigBKWiigAooooASilooASilooASilooASilooASilooAKSlooASilooASilo\r\noASilooASilooASilooASilooASloooAKSlooASiiloASiiigAooooAKKKKACiiigAooooAKKKKA\r\nCiiigAoopaAEopaKAEpaKKACiiigApKWigBKWiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooASilooASilpKACiiigAooooAKKKKACiiigAoopaAEpa\r\nKKACiiigAooooActOpq06kAUUUUAIaZTzTKAEpaKKYBThTacKQC0tJS0gCiiigYUUUUAFFFFABS0\r\nlLQAUUUUALRSUtAEFFFFUIKKKKACiiigAooooAKKKKACiiigAooooAKWkpRQAUo60lKvWgB1LSUt\r\nIAooooAa3Sm05qbTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAEopaKACiiigApKWigApKWigAoo\r\nooAKKKKACiiigAooooActOpq06kAUUUUAIaZTzTDQAlO7UlL2pgJThTacKQC0tJS0gCiiigYUUUU\r\nAFFFFABS0lLQAUUUUALRSUtAEFFFFUIKKKKACiiigAooooAKKKKACiiigAooooAKXtSU4dKAEpVp\r\nKVaAHUtJS0gCiiigBrU2nNQo+YUwExRg1ZxS4FAFXFGKtYFGBQBVxRirOB6UYFAFbFGKs4HpRgel\r\nAFbFGKs7R6UbR6UAVqKs7R6UbR6UAVqKs7R6CjaPQUAVaKs7F9BRsX0FAFairOxfSjYvpQBWoqzs\r\nX0o2L6UAVqKs7F9KPLX0oArUVY8tfSjy19KAK9FWPLX0o8tfSgCvRVjyl9KPKWgCvRVjylpPKWgC\r\nCip/KWjyloAgoqfyhR5QoAgoqfyhSeUPWgCGipvKHrR5Q9aAIaKm8ketHk+9AENFTeT70eT70AQ0\r\nVL5PvR5PvQBFRUvkn1o8k+tAEVFS+UfWk8o+tAEdFSeUaPKagCOipPKajymoAjop/lNR5bUAMop/\r\nlt6UeW3pQAyin+W3pSeW3pQA2inbG9KNjelADaKdsPpRtPpQA2inbT6UbT6UANopdpo2n0oASilw\r\naMGgBKKXBoxQAlFLijFACUUuKKAEopaKAEopaKAEopaKAEopaKAEopaKAEpaKKAEopaKAEopaKAE\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBy06mrTqQBRRR\r\nQAhphp5phoAKcOlNp6j5aYDTSikNKKQC0tJS0gCiiigYUUUUAFFFFABS0lLQAUUUUAFLSUUAQ0UU\r\nVQgooooAKKKKACiiigAooooAKKKKACiiigApw6U2nfw0AJSrSUq0AOpaKKQBRRRQA1qE+8KG60sf\r\n3xTAsUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUU\r\nUAFFFFABRRRQAUUUUAFGKKKADFGBRRQAYFJgelLRQAmB6UbR6UtFACbR6UbR6UtFACbR6UmxfSnU\r\nUAN2L6UbF9KdRQA3y19KPLWnUUAM8taPLWn0UAM8oUeUKfRQBH5Qo8oVJRQBH5Qo8r3qSigCPyve\r\nk8r3qWigCLyqPKqWigCHyjR5RqaigCHyjSeUanooAg8o0eWanooAr+W1HlmrFFAFfyzRsPpViigC\r\ntsPpRsPpVmjFAFbafSjafSrOKMCgCrtPpRtPpVrApMCgCtg0YNWdo9KNooArYNGKs7R6UbR6UAVs\r\nUYqxsFGwUAVqKs7BULjBoARadTVp1IAooooADUZqQ1GaACng/LTKcvSmAhoFBoFIB1FFLSAKKSlo\r\nAKKKKBhRRRQAUtJRQAtFFFABRRRQBDRRRVCCiiigAooooAKKKKACiiigAooooAKKKKACn44ptO/h\r\npANpVpKctMB1FFFIAooooAa3Wlj++KRutOi++KYE9FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAHpUEnWp6gk60ANWnU1adSAKKKKAENMNPNMNABTh0p\r\ntKOlMANApDSikA6lpKKQBS0lFAxaKKKACiiigAooooAWiiigAooooAhoooqhBRRRQAUUUUAFFFFA\r\nBRRRQAUUUUAFFFFAC07tTRSnpSASnLTactADqKKKACiiigBrdadF9+mnrT4fvUwJqKKKACiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACii\r\nigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqCTrU9QSdaAGrTqat\r\nOpAFFFFAAaYaeaYaAEpwHFNpwPFMBDQKQ0opAOooopALRSUUDFooooAKKKKACiiigBaKSloAKKKK\r\nAIaKKKoQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAopTSDrS0AJTlptOXpQA6iiikAUUUUAMPWpIf\r\nvGoz1qWHqaYEtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAVBJ1qeoJOtADVp1NWnUgCiiigBDTDTzTDQAUo6UlKOlMBKUUlKKQDqKKKQBRS0lAwoopa\r\nACiiigAooooAKWkooAWiiigCGiiiqEFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAKvWlNCfeoNIBKc\r\nvSm04dKAHUUUUAFFFFADD1qWHvUR61LD3pgS0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFF\r\nFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFFFFABRRRQAUUmaXNABRRmkzQAtFJmjNAC0UmaM0ALRRmk3UALRTd1G+gB1FN3UuaAFoozRQAUU\r\nUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRR\r\nQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOtADVp1NWnUgCiiigB\r\nDTDTzTDQAUvakpe1MBKUUlKKQDqKKKQBRRRQMKKKWgBKWiigAooooAKKKKAClpKKAIqKKKoQUUUU\r\nAFFFFABRRRQAUUUUAFFFFABRRRQA5OtBpU6/hSGkAlOHSm08dKAFooooAKKKKAGd6mh6Goamh+6a\r\nYElFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFIWAppcUAPpCcVGz0wsaAJS9NL1HRQA/fRvpl\r\nFAD9xpNxpM0UAODUoamUUATbhRkVFRQA8tTM0lFABmiiigAzS5pKKAHBjSh6ZS0ASh6UEVDSg0AT\r\nUUwPTgc0ALRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOtADVp1NWnUAFFFFI\r\nBDTDUhphoASlHSkpR0pgJSikpRSAdRRRSAKKKKBhRRRQIKKWigYUUUUAFFFFABRRRQBFRRRVCCii\r\nigAooooAKKKKACiiigAooooAKKKKAHJ1P0pDSr3pKACnimU8UgFooooAKKKD0oAZU8P3agqeL7lM\r\nB9FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFFABSZoJxUbPQA8timF6YTSUAKWzSZoooAKKSigBaSiigApaSloAK\r\nWkpRSAKKSloAUUGkopgFFFHagBKWkooAWiiigBaKKKACiiigBaXNJRQIeDT6jXrUlAwooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAqCTrU9QSdaAGrTqatOpAFFFFACGmGnmmGgApQOKSnDpTAbSik\r\npRSAdRRRSAKKKKACiiigBaKKKBhRRRQAUUUUAFFFFAEVFFFUIKKKKACiiigAooooAKKKKACiiigA\r\nooooAcvekpR0NJQAU8UynikAtFFFABQelFB6UAMqeL7lQVYj+4KYDqKKKACiiigAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAozRSHigB\r\naYz4prPUZOaAHM2abSUUALSUUUAFLSUUAFFFJQAtFFFABS5pKKAFzRSUUALRRRSGLRRRQAUhNFIa\r\nBBS0lFMBRRmiigBc0tNpaAFooooAWiijNAhy9akqIVIpyKBi0UUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFF\r\nFABRRRQAVBJ1qeoJOtADVp1NWnUAFFFFIBDTTTjTTQAlKOlJSjpTASlFJQKQD6KKKQBRRRQMKKKK\r\nBBRRRQAUtJS0DCiiigAooooAioooqhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACiiiigAp4pgp9I\r\nBaKKKACg9KKG6UAMqxH9wVXqyn3BTAWiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooprNgUAKxwKhZ80jNmm0AGaKKSgBaKKKACi\r\niigBaSiigApKWigBKWkooAWikooAUGnAgimUtAxcUZoopAGaKKKAA0lOoxQA2inYoxQA2ilooEFK\r\nKSloAWikopgLRSUtACinKcU2lzQIlFFMU0+gYUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABUEnWp6gk\r\n60ANWnU1adSAKKKKACmGnmmGgBKcOlNpw6UwG0Cg0CkA8UUCikAUUUUDCiiigQUUUUAFLSUtABRR\r\nRQMKKKKAIqKKKoQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAtFFFAAKfTB1p9IBaKKKACkbpS0jdK\r\nAGirK/dFVhVlfuimAtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFIaAAnFQu2TSu1RmgApKKKACiiigAooooAKWkooAWikpaACkoooAK\r\nWiigYUUuKMUgEopaMUAJS0YpaBiUuKBS0AJS0UtACYop2KCKAGUYp2KMUCG0U7FJQAUUUUCCiiim\r\nAU6m0UAPFKGpmaWgRIDS1Hml3cUDH0ZqMMaXdQA7NIWppJpDQIeG9adUQp6mgY6iiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqCTr\r\nU9QSdaAGrTqatOoAKKKKQAaYafTDQAlKOlJSjpTASgUUCgB4ooFFSAUUUUAFFFFABRRRQMKWkpaA\r\nCiiigAooooAioooqhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0UUUAA60+mjrTqQC0UUUAFI3Sl\r\npG6UANFWh0FVRVodKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFFFFABRRRQAUUUUAFFFITQAtRO9DvUZNACE0lFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAxaW\r\nkpQKQwpaMUuKAEpaUClxQAmKMU7FGKAG4pcUuKWgBuKXFLRSASilooATFJTqSgBMUmKdQaAG4pCK\r\ndiigBuKSnGkNMVhKKKKYgpwptLmgBxpKSg8UgFpcimUopgOzmkNGcUUAGaKSigRIjU+oRUitmgY6\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACoJOtT1BJ1oAatOpq06gAooopABphp9MNACUUUUwCgUUUAOFLSClqQCiiigAooooAKKKKBhRR\r\nRQAtFJS0AFFFFAEVFFFUIKKKKACiiigAooooAKKKKACiiigAooooAWiiigBR1p1NHWnUgFooooAK\r\nRqWkagBB1qzVZetWaYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFFFFABRRRQAUUUUABqN2pznAqBjzQAhNFFJQAUUUUAFFFFABRRRQAUUUUAFFFFABRRSgUDEpwFO\r\nApQKQxuKXFOooATFLilopDDFFLRTEFFFFABRRRQAUtFFABRRRQAUlFFIAooooASilpKAEpKdSUAN\r\nxSYp1JimISiikoEOUZofrSpSPyaAG0tJRmmAuaXtTaUmgANFJSZoAdSqcU2igCwpyKWoVbBqUHNA\r\nC0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB\r\nUEnWp6gk60ANWnU1adQAUUUUgCmGn0w0AJRRRTAKKKKAHClpBS1IBRRRQAUUUUAFFFFAwooooAWi\r\niigAooooAioooqhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0UUUAKOtOpq9adSAWiiigApGp1Na\r\ngBF+8Ks1XT7wqxTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAo\r\noooAKKKKACg0U1zgUARyNUdKxyabQAUUUUAFFFFABRRRQAUUUUAFFFFABRRTgKQwApwFApaChRRS\r\nUUgFooFLQAUtJS0AFFFFAgooooAKKKKAClpKKACiiigAooooAKKKKACkpaSgYUlLRQAlJS0UANNN\r\npxpDTEIpwaVqbSk0EiUUUlMBaM0UUAFFJRQAtApKUGgB1ORsGo80A0AWQaWo0NSUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABUEnWp6gk60ANWnU1a\r\ndQAUUUUgENNNONNNACUUUUwCiiigBwpaQUtSAUUUUDCiiigQUUUUAFFFFAwpaSloASloooAioooq\r\nhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFLQAUUUUAKtOpq0+kAUUUUAFNbrT6Y3WmAqfeFWKrx/fFW\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqGQ1\r\nI5wKgY80AJSUUUAFFFFABRRRQAUUUUAFFFFABRRTgKQwAp1FFIoKKBS0AFLRS0AFFFFAC0UlFAC0\r\nUlFAC0UlFABS0lFAC0UmaKAClpKKAFpKKKAClpKKACiikoAWikooAKKKKAEpDS0UAMNJTiKQ0xMS\r\nkoopkhRRRQAUUUUAFLSUUALRSUtACg4NWFORVapY2oAlooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKrydasVBJ1oAYtPpi0+gAooopAIaaetONNNACUU\r\nUUwCiiigBwpaQUtSAUUUUDCiiigAooooAKKKKBBS0lFAxaKKSgCOiiiqEFFFFABRRRQAUUUUAFFF\r\nFABRRRQAUtJS0AFFFFACrT6YtPpAFFFFABTW606mt1pgOj++KnqCL74qegAooooAKKKKACiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoopGoAjkNRGnuaZQAlFFFABRRRQAU\r\nUUUAFFFFABRRSigYCnCkFLSKFooopALRRRQAtFJRQAtFFFABRRRQAUtJRQAtFJS0AFFFJQAtFJS0\r\nAFFJS0AJRS0lABRRRQAUUUUAFFFFABRRRQAUlLRQA00hp1IaAGGkpxptMkKKKKYgooooAKKKKACi\r\niigBaUHBptFAFlDkU6oY25qagAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoo\r\nooAKKKKACiiigAqCTrU9QSdaAGLT6avWnUAFFFFIBDTTTqaaAEooopgFApKUUAOFLSClqQCiiigY\r\nUUUUAFFFFABRRRQAUUUUAFFFFAEdFFFUIKKKKACiiigAooooAKKKKACiiigApaKKACiiigBVp9NW\r\nnUgCiiigAprdadTT1pgOi+/U9QxffqagAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigApr9KdTJKAIWNJSmm0AFFFFABRRRQAUUUUAFFFFABSiilFIpC0UtFIYU\r\nUUUAFFFFAxaKSigBaKSlpCClpKKYC0UlLQAUUUUALSUUUALRSUUALRSUUALSUUUAFFLSUAFFFFAB\r\nRRRQAUlFFABRRRQAUlLRQA002n000xDaKU0lMkKKKKACiiigAooooAKKKKAHA4NTo2RVeno2KYE9\r\nFIDmlpAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOt\r\nADV606mLT6ACiiikAhpppxppoASiiimAlLSUooAcKWkFLUgFFFFAwooooAKKKKBBRRRQMKKKKACi\r\niigCOiiiqEFFFFABRRRQAUUUUAFFFFABRRRQAUtJS0AFFFFADlp1NWnUgCiiigApp606mHrTAkh+\r\n9+FTVDD941NQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAVHJUlRSdaAIjSUppKACiiigAooooAKKKKAClFFKKRSClFFFIYtFJRQAtFJS0AFFFLQAUlLRQMSl\r\npcUmKBBRRilpDEooopgLRSUtAgooooAKKKWgAoopKAFooooAKKKKAEopaKAEooooAKSlooASiloo\r\nASilpKAA0006kNADTTaeaaaYmJRRRTJCikpaACiiigAooooAKXNJRQBMjVIDVYHFPVuaYE9FIpyK\r\nWkAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFQSdanqCTrQAxetPpi9a\r\nfQAUUUUgENNNONNNACUUUUwEpRSUooAcKWkFLUgFFJRQMWiiigAooooEFFFFAwooooAKKKKAI6KK\r\nKoQUUUUAFFFFABRRRQAUUUUAFFFFABS0lLQAUUUUAOWnU1elOpAFFFFABTD1p9MPWmBLD1NS1FD1\r\nNS0AFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAB6VA55qV\r\nzxUB60AJSUtJQAUUUUAFFFFABRRSigYCnUlLSGFFFFIYUUUtACUtFFABS0lLQAtFFFAC0UUUAFJS\r\n0UAJRS0lABRRRQAUUUUAFLSUUALRSUUALRRRQAUUUUAFFFFACUUUUAFFJSigAooooAKSlpKACkpa\r\nSgBDSGnU00CG0UppKoQlFLRQIKKSigBaKSloAKKKKAClFJRQBMjVKKrocGpweKYC0UUUgCiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACoJOtT1BJ1oAYvWn0xetPoAKKKKQCGmnrTj\r\nTDQAUUUUwEpRSUooAcKKBRUgFFFFAwopaKACikooAKWkpaACiiigAooooAjoooqhBRRRQAUUUUAF\r\nFFFABRRRQAUUUUALRSUtABRRRQA5elOFNXpThSAKKKKACmd6fTKYEsPepajh6GpKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAI5DUNSPUdAAaSlpKACiiigA\r\nooooAKWkpaQ0LS0lLSKCiiigBaKKKACiiigYtFJS0AFLRRQIWikpaAClpKWgBKKKKAEooppNADqS\r\nmhqdmgBaKKKACiiigBaKKKAFpKKKACkpaSgAooooASlopaAEopaMUAJRS0lACUUtJQAhpKdSUANN\r\nNp5pppiYlJS0lMkWikooAKWkooAWiiigAooooAUVOjcVXp6HBoAsUUi0tAgooooGFFFFABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOtADF60+mL1p9ABRRRSAQ0w080w0AFFFFMBKU\r\nUlKKAHCiiipAKKKKBi0UUUAJRRRQAUtJS0CCiiigYUUUUAR0UUVQgooooAKKKKACiiigAooooAKK\r\nKKAFooooAKKKKAHDpTqaOlOpAFFFFABTKf2plMCaHoakqOH7pqSgAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACg9KKRulAELmmU5qbQMKSiigQUUUUAFFFFAC0tJSi\r\nkUFLRS0hiUtFLQAlFLS4oAbS0YooGFFFFAC0UCloEJRRRQAtFJRQAtJRRQAhNRk05qbTQBSg0lFA\r\niQUtNXpTqQwopKKAFopM0ZoAWikzS5oAWikzS5oAKKKKACiiigAooooAKKKKACkpaSgBKSnUlADT\r\nSGnUlADDRSmkqiWJRRRQIKKKKACiiigBaKKKAClHWkooAnQ5FPFQxtU4pgFFFFIAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACoJOtT1BJ1oAYvWn0xetPoAKKKKQCGmGnmmGgAooopgJSi\r\nkpRQA6igUVIBRRRQMKWkpaBCUUUUDClpKWgQUUUUAFFFFAyOiiiqEFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUtFBoAKKKKAHDpTqQdKWkAUUUUAB6UynnpTKYE8P3afTIvuU+gAooooAKKKKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACkbpS0xzQBE3WmU5utNoGFFFFAgooooAKKKKAFF\r\nLQKKRQopcUClpDDFLSUZoAWikooAWikooGLRSZozQIWlpuaN1AC0Zpu6k3UAOzRTc0uaAFzRmm5o\r\nzQANTKcaSmgYlFFFAiRelLSLwKWkMTNFFJmgAzRSUUALmjNJRQAuaXNMpaAHZozTaKAHbqXdTKKA\r\nH5pc0yjNAD80U3NGaAHUUmaKAFpKKKAEpKWkoAQ02nmmmmJjaKKKZIUUUUAFFFFABS0lLQAUUUUA\r\nKpwasIciq1TRNQBLRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABVeTrViq8nWgB\r\nq9afTF60+gAooopAIaYaeaYaACiiimAlKKSlFADhRQKKkAooooAKKKKBhRRRQAUtJS0AFFFFAgoo\r\nooGR0UUVQgooooAKKKKACiiigAooooAKKKKAFoNFK3WgBKKKKAHDpTqQUtIAooooAD0plPPSmUwJ\r\n4vuU+mxfcFOoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigANRMK\r\nexpp6UDIj1ptObrTaACiiigQUUUUAFKKSlFA0LSikpRUlC0UUUAFFFJQAtFJRQAuaTNJRQAuaM0l\r\nFAC5pKKSmAtJRRQAtGaSigBaKSigBaSlpKAEpyikpwoAdSUUlIApKKSmAUUUUCCiikoAWiiigAop\r\nKWgApaSigYtLSUtIBaKKKAEozS0UAGaM0mKKAFopM0tACU006kNAhtJSmkqiQooooAKKKKACiiig\r\nBaKKKACnIcGm0ooAsqcilqOM8VJQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUCCiiigYVBJ1\r\nqeq8nWgBq9afTF60+gAooopAIaYaeaYaACiiimAlKKSlFADqKBRSAKKKKQwooooEFFFFABS0lFAC\r\n0UUUAFFFFAEdFFFUAUUUUAFFFFABRRRQAUUUUAFFFFACilf71IOtOk4c0ANooooAeKWkFLSAKKKK\r\nAA9KZTz0pgpgWI/uCnU1PuCnUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABQaKQmgBpppPFObpTKRRGaSlNJTEFFFFAgooooAKUUlKKQ0KKWijNIoKKSigBaKKKACiiigBK\r\nKKKYCUUUUAFFJRQIWikooAWikooAWikooAWiiigBRS0lLSGLSUtJQAlJQaKYBSUtJQIKKKKBBRRR\r\nTAKKKKAFopKKQx1LTc0oNAC0tJmjNIYtFJRQAtJS0UANpaKSgBaKKKAGmm08000yWJRRRTEFFFFA\r\nBRRRQAtFFFABRRRQBJGanFVlODVhTkUALRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAgopKWgAooooA\r\nKrydasVBJ1oGMXrT6YvWn0AFFFFIBDTDTzTDQAUUCimAlLSUUALmjNJRQA7NGabRQA7NJmkooAWi\r\nkooAWjNJRQAuaM0lFAC5ozSUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAKOtOkOWNNoPWgAoooo\r\nAeKWkFLSAKKKKABulMFObpTaYFhPuCnUifdFLQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFMY80+o260DQh6UlKabSGMNJSmkpiCiiigQUUUUAApwpBS0hoWm0UUDFoooo\r\nGLRSUUgFpKM0ZoAKSjNJmmIWkoooFcKKSimAtFJS0AFFFFABRRRSAWiiigYtKKSlpDClpKKAENJS\r\nmkpgFJS0lAgooopiCiiigApKKKBC0UlFAC0ZpKKBi5pc02loC47NGabRmkO47NLmm5ozQMdRSUtI\r\nAoooxQAGmGn4ppFMQ2ilpKZIUUUUAFFFFABS0lFAC0UUUAFTRNUNOU4NAFmikU5FLQAUUUUAFFFF\r\nABRRRQAUUUUAFJS0lAgpaSloAKKKKBhUEnWp6rydaAGr1p9MXrT6ACiiikAhphp5phoAVehpDTl6\r\nGmmmAlFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAtFFFABRRRQA8UtIKWkAUUUUAI3Sm05ulNpgWV+6PpS0i/dH0paACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooopAFFFFABRRRQAVGetSHpUTdaBoTvSGgUpoKIzSUppKZIUUUUCCiiigAp\r\naSlpDQUtFFAwopKKAFpKKSgLi0maKSmK4tJRRQIKKKKACiiigAooooAKWkpaBhRRRQAtFFKBSGKK\r\nWgUopDExRTsUhoAbSGnUhoAbSUppKZLCiikpgFFFFAgopaKACiiigBKKWigBKKWkoAKKKKAFopKW\r\ngYtLTaWkMcKWmZp2aQxaaaWkNADTSUppKokKKKKBBRRRQAUUUUALRSUtABSikoFAFiM5FPqKOpaA\r\nCiiigAooooAKKKKACiiigApKWkoAKWkpaBBRRRQMKrydasVXk60ANXrT6YvWn0AFFFFIBDTDTzTD\r\nQA5ehppp6Hg0w9aAEooopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB\r\nRRRQAUUUUAFFFFABS0lFAC0UUUAPFLSCikAtFFFACN0popzdKaKYFpfuiigdBRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUgCiiigAooooAKKKKAA9KhbrUx6VC3WgaEp3amU7tQURt1pKVutJT\r\nJYUUUUCCiiigApaSlpDQUUUUDCkoooEFJRRTEFFFFABRS0UAJRS4oxQAlFLRQAlFLSUAFFFLQAUU\r\nUUhiiniminUmUFOFIKcBQAUhp1IaAG0hFOpDQAwim0800imhMSiiigQUUUtMBKKWikFgxS4oFLmg\r\ndhMUmKdSUAJijFFFACUUtFArCUUYoxTAKKXFGDSASloxS7aBiikpcUUhjTSU4000yWJRRRTEFFFF\r\nABRRRQAUtJS0AFFFFAEkR5qeq8fWrAoAKKKKACiiigAooooAKKKSgBaSikoAWikpaAFopKWgAqvJ\r\n1qxVeTrQA1etPpi9afQAUUUUgENMNPNMNADk6GmmlXvSGmAlFFFABRRRQAUUUUAFFFFABRRRQAUU\r\nUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUALQKKBQA8UUCikAUtJS0AI1NFK\r\n1A60wLI6UUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUgCiiigAooooAKKKKACiiigAPSoW61Maj\r\nagaI6U0d6CKChhpKU0lMlhRRRQIKKKKAFooopFBSUUUCCkpaKYhKWiigYUUtFIBKWiigYUUUUAJR\r\nS0lAgooooAKKKKAClApQKUCgaQCloopFCinU0U8UCYUhpaSgBKQ0tFAxtBFOpDQAwikp5FNxTEJR\r\nRijFAgooxRQAUtJRQMWiiigA4o4oxS4pAJijFOxS4oAbilC07FFAhMUUtFAxKKKKAEooooASmmnG\r\nkpiGUUppKZIUUUUAFFFFABS0lLQAUUUUAOTrVgdKrr1qwOlAC0UUUAFFFFABRRRQAUhpaKAG0UtF\r\nACUUUUAFLSUUALUD9anqB+tADV60+mL1p9ABRSUUgA0w080w0AKKSgUUwEooooAKKKKACiiigAoo\r\nooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBaBRQKAHiigUUgC\r\nlpKWgBrUDqKGoXqKYFmiiigAooooAKKKKACiiigAooooAKKKKQBRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFRsakqFutBSG96WikzQMa3WkpTSUyWFFFFAgoFFKKBoUCjFLRSKG4oxT8UYoEMxRin4oxQAyin7\r\naNtFwGUU7FJigYlFLil20ANop22l20AMop+2kIoAbRTsUbaBDcUoFOxS0DEoopaQwooopAKKcKaK\r\ndTEwpKWigQlFFFAxKKKKBiGjFFFACYoxS0tAhuKNtPooAbto206igBu2jFOooATFGKWigAxRilxS\r\n0xCYopaaaQBSUtJQMQ0lLRQMSiiigQGm06kNADTTacaSmSxKKKKYgooooAKKKKAFooooAUdasL0q\r\ntViM8UAPooooAKKKKACiiigAooooASilNNoAKKSloAKWkpaACoH61PUD9aAGr1p9MXrT6ACkoopA\r\nBphp5phoAKSlpKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFAC0CigUAPooopAFLSUtADWoX7woahfvCmBZooopAFFFFABRRRQAUUUUwCi\r\niikAUlLSUDDNLTaWgBaKSloEFFFFABRRRQAUUUUAIaibrUp6VCetBSCkNBooGNNJSmkpksKKKKBB\r\nThSAU6kUhaKKKQwpaKKAClxRRQAuKMUUtADcUYp1GKAG4pcUuKKAEooooASjFLRQAmKKKKACkpaK\r\nBjaWiikAUCigUwHClFIKdQIKQ0UUCEpKWkoGLRSUtACUUUUDDFFLRQISloooAKWkpaBCUYpaWmAm\r\nKWiloASiikoAKTNFJSGFBpKKBhSUUUAFJS0lAhaSiigBKaacaaaYmJRRRTJCiiigAooooAKWkpaA\r\nCnoeaZSg80AWBS0xDxTqQx1FJRQAtFJRQAtJRRQAUlLSUAJRRSUCHUUlLQAtV361Yqu/WmAi9afT\r\nF606kAUUUUABphp5phoAKSlpKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0CkpRQA+iiikAUtJRQAjdaF+8KRutKv3hQMnzS00U6gBa\r\nKKKBBRRRQAUUUUAFFFFACUhpaSgYlLRRSAKKKKYC0UlLQAtFFFAgooooARulQnrUrdKhPWgpAaBQ\r\naQUDEakpxptMlhRRSigBRTqSlqSgooooGFLSUtABS0lFAC0tJS0CFooFFMQUUtJQAUlLRSASiloo\r\nGJSUtFACUlLSUDCiiikAUtIKdTABTqbS0EhSUtFACUlLSUDEpaSlFAxaSg0ZoELRSUtAC0UUUCCg\r\nUUZpgLRRRQAUUUlAC5pKKSgAooopDEpKWigY2ilNJQAUlLSUAFFFFAhDSGnU00xDaKWkpkhRRRQA\r\nUUUUAFFFFAC0UlLQBIhqTNQL1qUGkMfS0gooAWikpaACiiigAooooAQ0mKdSUCExS0tFABVd+tWK\r\nrv1oARetOpq06gAooooADTDTjTTQAlFFFMAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigApRSUooAfRRRSAKKKKAGt1oX7wobrQOtAEwNOB\r\nqMUoNIokzRmmZpc0CsOopuaM0AOopKKAFooopgFJQaM0gCiiigYlFFFACilpKWmIWikpaBBRRRQA\r\njdKg71O3SoD1oKQGkpaSgYhpKU0lMlhSikpwpAhaKKWkUFFFFAwoopaACiiloAKWkpaBC0tJRTEL\r\nRRSUAFFGaKACikozSGIaKKQ0DDNJmkJpKAHUUCigBwpaSigQtLRS0xCUUtFADaSnUhpDG0Cg0CgY\r\nUlLmg0AGaUGm0A0APopoNLmgQtFJRmgB1FNzS0BYKKSigBaKSigAooooAKSiigYUlFFABSUUUAFF\r\nJS0CCmmlpDTEJSUtJTEFFFFAgooooAKKKKAClpKKAFHWpAajp4NIZIpp1MWnigApaKKAEpaSigBa\r\nKKKACikpM0ALmjNJmigBTUD9amNQt1oARadTV606gQUUUUAIaaacaaaAEooopgFFFFABRRRQAUUU\r\nUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFKKSlFAD6K\r\nKKQBRRRQA09aF+8KD1pY/vCgaJMUYp1FIY3FFLRQAlJmlNJQA4GnCmCnCgB1FFFAhppKcRSYoGJm\r\nilxRigAooxS4oAKWkpaYgpaSigBaKSloEB6VA/Wp6hkHNA0NFIetOWhqChhpKWkpksKeKYKeKTGg\r\npaKKQwooooGFLSUtAC0UlFAC0tJRQIWikooAdSUlFAC0maSkoGOzSUlGaADNITQTTaAFpQKAKdig\r\nQlLRRQMWikpc0ALS5pmaXNArDs0ZpuaTNAWHGkzRmkoADQKKKBi4GaUimgc07FAhpFNNPIppFACZ\r\npQaZS0APzRTc0ZoGOFLTaXNAC0UmaKAFopKKACiikoAU0lFFABSUtJQAUUUUCEooooAKDRRTAbSU\r\nppKCQooopiCiiigAooooAKKKKAFpy02lWkBKKeKjFPFAx1FFFABSUUUgCiiigBDSU6igBMUuKKWm\r\nAmKgfrVg1XfrQAgp1NFOoEFFFFACGmmnGmmgBKKKKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSikpRQA+iiikAUUUUANPWlj+8KQ9a\r\nWP71A0T0lFFIYUUUmKAEJpuacabigBRTxTBTxQA6ikpaYgooooAKKKKACiiigAopCabmgB9FNBpa\r\nAFoopaACopalpkg4oBEY6UhooJoKG0lLSUCYop1NFOoBC0UlLSGFFJS0DFopKKAFooooAKWkooAK\r\nKKKACikooAKKSigApKKSgApQKSnCmIcOKWm5ozSAWkzSZpM0DFzS5ptFFgHZozTc0ZosA7NJmkoo\r\nELmjNNoosA7NOBpmaXNADmpoY0uabmgCQGg0wGlzQA09aSlam0wFpabS0AOopKWkMWikozQA6ikz\r\nRmgBaSiigBKKKKACiiigApKKKBBRRRQAUUUlMANNp1NoJYUUUUxBRRRQAUUUUAFFFFABSikpRQBI\r\nDTwaiFPBpDJAaWowacDQAtFFJSAWikooGLRSUUCFpabmlBpgLVd+tWKrv1oAQU6minUCCiiigBDT\r\nTTjTTQAlFFFMAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigApRSUooAfRRRSAKKKKAGnrSx/epp60+P71A0SilpMUtIAooopgJikxTqKQxu\r\nKUUtFABS0lLTEFFFLQAlLRRQIKQ0tJQMaabin0UhiAU6kpaYgooooAKRulFB6UAQ96KQ9aKChKSl\r\nNJQJiilpBS0AhaKKSkMWikooAWlpKKBi0UUUAFFJRQAtJmikoAWikzRQAUUUlMQUUUUAFLmkooAM\r\n0ZpKKBXDNGaSimK4uaWm0tIdxaKSloAKKSigBaKSkoC4uaM0lFMVxc0ZpKKAuOozSUUh3FpKcKCK\r\nAG0UUUALS02loGLmikpaAClpKKQC5opKKBi0UlFAC0lFFAgooooAKKKKYBRRRQISkpaSgTEooopi\r\nCiiigAooooAKKKKAClpKWgBRTqaKWkMcDTgajFOBpDH0tMzS5oAdRSZpaACiiigAoFFJQIdUD9am\r\nzUDdaYAKdTRTqBBRRRQAhpppxppoASiiimAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUopKUUAPooopAFFFFADD1p8f3qYetPj60DRLS\r\n02lzSGGaM0lFAC5pabS0ALRSUmaAHUtMzSg0AOpabS0xC0UlFAC0lFJQAUUUUhhRRRQAUUUUAFFF\r\nFMCFutC0sg5pFoGDCmVI3SmUCYLS0gpaAFpKKKBhRRRQAUUUUALRSUZpDFopKKACikopiCiiigAo\r\nopKBBS0lKBQAooNKKQ0hjaKKKZIlFFLTASilpKAFooopAFFFFABSUUUwCiiigQUUtFAwoopaQCil\r\npBTqRQ0im1IRTSKYDaKKKBC0UlLQAUUUUDFopKWgAooooAKKSloAKSiigBaKSloAKSlooEJSGlpD\r\nQJiUUUUxBRRRQAUUUUAFFFFABSikpRQAtFGKWkMKBRRQMXNLmm5opAPBpc0zNLmgB4NLTAadmgBa\r\nQ0tIaAGk1Gae1RmmhMUU6miloELRSUtACGmmnGm0AJRRRTAKKKKACiiigAooooAKKKKACiiigAoo\r\nooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKUUlKKAH0UUUgCiiigBh605Ot\r\nNp8Q5NA0SUUuKMUhiUUuKMUAFJTsUYoASkxTsUYoAZilAp+KMUBcSloxRTEFLRRQIQ0maDTaQx1F\r\nIKWgYUUUUAFFFFABS0UUxDJBxUa1M/3ahHWgaHGoz1p5NMNAwFLSDrS0CCiikoGFFFFABRRRQAUU\r\nUUAFFFFABRRRQAUUlFAgooooAKeBSAUtJjFpppaaaAEooopiCiiigQUUUUAJRS0UwEopaKAEopaK\r\nAEpaKKQBRRRQAUtFFAxRTqQU6kMKaRS0UAMNJTjTaYgooooAWikpaACiiigYUUUUAFFFFABRRRQA\r\nUUUUALRSUtAhKSlNJQJiUUUUxBRRRQAUUUUAFFFFABSikpRQA6ilAyKB1pFCGkqTbSbaQDKKcRSY\r\npgJRmjFFADgacDUdKDSAlBopgNOzQAhqI1IajNNCYopaQUtAgpaSloAaaQ0ppDQAlFFFMAooooAK\r\nKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigApR\r\nSUooAfRRRSAKKKKAGVLD3qKpoe9MY+jFLRSAMUYopaAEpaKKBBRRRQAUUUUAFFFFABRRRQAhpMU6\r\n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\r\nCilFAC0UUUhhRSUUAFJRRTAKKKKBBRRRQAUUUUDCiiigQlJS0lMQUUUUCCiiigAooooAKUUlKKAH\r\nE8UgoNFIoXNJRRQMKDRRQIKM0mKKAHZpc02iiwDs0Cm0qmkBIBRigGloAYw4qM1Kw4qI00JiilpB\r\nS0CCiiigBDTacabQAUUUUwCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACnCm04UALS0lLSAKQ9KWkPSgBtPUcUypox8lDGhlGakK1GVpDD\r\ndShqYRRTAmBpwqFTUgNAh9FJmjNAC0lJmjNIYtFNzRmgB1GabupN1AD6KZuo3UAPopu6jdQA4mmM\r\naQtTCaYCHrSUUUCAU8GmUtAEmaaxpM0maBhSUtFACUtJRQAtFFFAwooooAKKKKBBRRRQMKKKKAFp\r\nabS0ALSGiikAlFLRTAKKKKAFopKKQBRSUUwFopKKAFopKKAFopKKAFozSUUALmjNJRQAtFJRQAtF\r\nJRQAtFJRQAUtJRQAtJRS0AJS0UtACYopaKQCUUUUAFJRRTAKKKKACiiigQUUUUAFFFFABRRRQAZo\r\nIzSUooEAFNNOzSGgBKKKKYgooooAKUUlLQNCmgUUopDCkpaKBiUCiigQ/HFIVp68ilxSAiIpMVIR\r\nTTQA2lAoAp4FMQoFOpMUtIBD0qA9anPSoD1poGKKWkFLQIKKKKAENNpxptMAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKcKbThQ\r\nAtLSUUgFpD0paQ9KAG1PF9wVBU8X3BQxjqQinUhpARMKYalaozQMQU8GmgU4CmA4GjNJRSAXNJSg\r\nUuKAG0lPxSEUAMJpM0rCmUwHZo3U2igVxc0ZpKKAuLmigU4CgYgWnbacBSikIZsoK1JSYoGRbaTF\r\nS4prCgBlFFFMYlFLSUCFopKWgYUUUUAFFFFABRRRQAUUUUAFFFFAC0UlLQAtJRRSAKSlpKYC0lFF\r\nABRRRQAUUlFAhaKSigBaKSigAooooAKKKKAClpKKAFpKKKACiiigBaKKKACiiigBRS0CikMKKKKA\r\nEpKWkpgFFFFAgooooAKKKKACiiigAoopKACiiigQGiiigBVGaGoBwaQnNACUUUUxBRRRQAUtFFIY\r\ntKKbTqBhQKKBQMDSUppKAJEPFPqJTzUlIQhphpxNNNAAKetMFPFAh1FFFACHpUB61O3SoD1poBVp\r\naQUtAgooooAQ02nGm0wCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigApwptOFAC0UUUgFpD0paQ9KAG1PH9wVBUinCihjRITSE0wtT\r\nd1IY4mkpM0ooAUUopKWgBaUCkzS5oAWikzRmgBaQ0maaTQANUdOJptNCYUUUUxBRRRSGKKeKaKcK\r\nQxwp1MFGaAH0ZpmaM0AOprdKXNNJoGMooNFMApKWkoEwpaSigBaKKKBhRRRQAUUUUCCiiigAoooo\r\nGFLSUtABS0gpaQBSUtJigBKKWimAlFLRQA2ilooEJRRRQAUUUUCCiiigAooooAKKKKACiiloGFFF\r\nLQAlFLilFAxMUuKWikAUUUlABSUUUAJRRRTEFFFFABRRRQAUUUUAFFFFABSUUUAFJRRTJFopKWgA\r\npKKKACiiigAooooAWiiikMWlpKUUDA0Cg0ooGBptOpDQAlPB4plKKBDiabTsUYpAAFOFAFLQIWii\r\nigBG6VAetTt0qA9aaAUUtIKWgQUUUUAIabTjTaYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU4U2nCgBaKKKQC0h6UtIelADaeB\r\nxTKmQfKKGNEZBpMVMRTCKVwGCnCkxRTGLmjNNzRmgB2aM03NGaLAOzRupuaSiwXHZpM0lFAhaMUo\r\np1AEeKKeRTaAEpaSlFACinCminA0hi0lLSUDCiiigAoPSikNADaKKKYBSUtJQJhRRRQAUtJSigAo\r\noooGFFFFAgooooAKKKKACiiigYtFFFAC0UlLSAKKKKAEopaKAEpMU6jFADaKXFGKYDaKWjFAhKKd\r\nijFADaWlxS4oAbRTsUYoGNxS4p2KMUgExRS0UAJS0UUAFFJRQAtJRRQAlFFJTAKKKKBBRRRQAUlL\r\nSUAFLSUUAFFFFABRRSUCCiiimIUUUUUgEooopgFFFFABSikpaBi0lFLSGFFFFAxadSLTqAExQRTq\r\nCOKAIjQOtOIptAEo6UuKROlOoEJS0lApCFoopaAGt0qA9anbpUB600AopaQUtAgooooAQ02nGm0w\r\nCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK\r\nKKKACiiigApwptOFAC0UUUgFpG6UtI3SgBtTp90VBUq/dFDGh9IRS0UhjMU0ipcUjCgCE0lOIpMU\r\nxCUUYpcUAJRTtpo2UANpadspNtAAKdTQKWkMU000tJigBKUUmKKYC0UlFADs0opopwFIYtJRiikA\r\nUhoopgNNFFFMBKKKKBBRRRTEFFJS0gFopKWgYUUUlABS0lFAC0UUUAFFFFABS0lFAxaWkpaQBRRR\r\nQAUtJS0AFFFFABSYpaKAExRS0hoAKWkFLQAUUUUAFFFFABS0UUAJRRRQAUUUlABRRRQAlFFJTAWk\r\noooEFFFJQAUUUUAFFFFABRRRQAUUUUCCkoopiCiiigBaWkpQKQxKSlNGKYCUUUtABRRRSGFLQKKB\r\nhRRRQA5KkqJTzUgoELRRRSAYaYakamGmMchp5qJTg1L2oEITQDTWpM0gJM0ZpgNFACseKiNPPSmU\r\n0JiilpBS0CCiiigBDTacabTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACnCm04UALRRRSAWkbpS0jdKAG1Mo+UVDVhR8ooY0FKK\r\nMUtIBKDS0lMCMijbT8UuKQDNlG2pMUlADdtLilooAMUhFOpKAGEUmKfRSGMxS4p1FADMUbafiigB\r\nm2jbT6KAGhaXFLRQAmKaRTzTDQA00lKaTFMBKKKKYwpKWigBKKKKCRKKKKYC0UCikMWiiigYlLSU\r\nUCFopKWgAoopKAFopKWgApaSigY6ikopALRSUtAC0UlGaAFoozSZoAWikooAKKKSgYtFFFABS0lF\r\nAC0UmaM0CFpKKKACikooAKKKSmAUUUUCEooooAKKKKACiiigQUUUUDCiiigQUlLSUwCiiigQUUUU\r\nAKKUGkopDFNFJT05FAxlFKwwaSgApaSloAWkpaSgYUUUUAFSKeKjp6GgB9FFFIQjVGakNMNAxtSA\r\n8VHTlNMBWplPamgUCFAp2KBThSENYcVEambpUJpgKKWkFLQIKKKKAENNpxptMAooooAKKKKACiii\r\ngAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKcKbT\r\nhQAtFFFIBaRulFDUANqyv3R9KrVZX7ooGLRRS0AJRRRQAlLSUUgFpKM0maAFopM0UDFpaSigQUUU\r\nUDEooooAKWkopAFLSZooAWkoppNACk000hNFMAxSgUopRQBEwpKlccVFTGFFJS0AJRRRQISilpKY\r\ngpaSigBaKKKQwooooAKKKKACiiigAooooAWikpaACiiigYtFJRQAtFJRQAtFJRQAuaWm0UALRSUU\r\nALRSUUALmjNJRQAtJRRQAuaSiigAooooAKKKKBBSUUUAFFFFAgooooAKKKKACiiigAooooASiiim\r\nIKKKKACiiigBRSkUCnYpFDKcpwaSkoAc1JQaKACgUUUDFpKXNJQAUUoGaDQAlOU802gUATUUg6Ut\r\nIBKa1OpDQAw0lKaSmBIORSUIaDSEKDS5pmaUGgBWPFRGnk8Uw0xMUUtIKWgQUUUUAIabTjTaYBRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAU4U2nCgBaKKKQBSGlpDQAlWh0FVatDoKBhRRRQAUUtJQAhphNPNRtxSGLmjNMzS0AOzRm\r\nm0UAPzRuqPNJuoAk3UZqPNANFgJc0ZqPNLmgB2aN1MJpuaAJN1G6o80ZosFyQtTS1MzRTsFxc0oN\r\nNoBoESg0uajzS5pDHnmo260u6kNMBKKSloGJRRRQIKSlopiEopaSgBaKSloAKKKKBhRRRSAKKKKA\r\nCiiigAooooAKWkooAWikooAWikooAKKKKAClpKKAFopKKAFopKKAFopKKACiiigAooooAWkoooAK\r\nKKKACiiigQUUUUAFFFFABRRRQAUUUUAFJS0lABRRRTEFFFFABSikpRQMdilFHakpDEPWkoNFAC0l\r\nLSUALRSUtABRSUtACrQaSigYUUUtACqadmmCnUAOpDSZopANNJSmkpgKDSmm07tQAhpM0GkoEKTT\r\naWkoEOFLSCloEFFFFACGm0ppKYBRRRQAUUUUAFFLRQAlFLRQAlFLRQAUUUUgCiiigAooooAKKKKA\r\nEooopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFOFNpRQA6ikpaQBSGlpDQAlWh0qqKsjpTGLRRR\r\nSAWkoozQAVG1PJpjUhjKKMUuKACilxSYoAQ02lNJTQgpaQUtAxaKKWkA0im1KRTCKYhtFFFMQUUY\r\npQKQxMUYp+KMUXCwyin4pMUANozS4pMUAFFFFAwooooAKKKKACkpaSmIKKKKAFopKKAFopKKAFoo\r\nopAFFFFABRRRQAUUUUAFFFFABRRRQMKKKKACiiigAooooAKKKKACiiigAooooAKKKKBBRRRQAUUU\r\nUAFFFFABRRRQAUUUUAFFFFABRRRQAUlLSUxBRRRQAUUUUAFFFFAx60GkBopDA0lKaSgBaSlpKACl\r\npKKACnCm0tACkUlLmkoGFFFFABThTactAC0UtGKQDTSGn4pCKAGUopCKUUwA02nkZppFBIlJSmkp\r\niHCikFLSAKKKKAEpKWkpgFFFFABRRRQAtFFFIAooooAKKKKACiiigAooooAKKKKACiiigBKKKKYB\r\nRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSikpRQAtFFFIBaQ0tIaAEFWRVYdas0DQtFJS0AJRRRQA\r\nhpppxpKQxAKXFKKKAExQRS0UAMIphFSmmkUAMopSKSgBRSim04UAOppFPpDTEREUYpxFAoAQClpQ\r\nKWkMSiijNABSUZooAMUmKdSUAJikIp4oYcUwGUlFFABRRRQAUUUUwEooooEFFFFABRRRQAUUUUAF\r\nLSUUALRSUtABRSUUALRRRQAlFLRQAUUUUAFFFFABRRSUALRRSUALRSUUALRRRQAUUUUAFFFFABRR\r\nRQAUUUUgCiiigAoopKAFooooAKKKKACkpaSmIKKKKACiiigAooooGKKWkpaQwpKWkoAWkoooAKKK\r\nKACloooGFFFFABRRRQAtA60lFAEgpaap4p1ABTTTqQ0hDaMUZozQMdikNANITQIQ0ynE02mJiilp\r\nBS0CCiiigBKSlpKYBRRRQAUUUUALRRRSAKKKKACiiigAooooAKKKKACiiigAooooASiiimAUUUUA\r\nFFFFABRRRQAUUUUAFFFFABRRRQAUopKUUALRRRSAWkNLSGgBB1qzVYVNmhjQ7NGaYTSbqQyTNFMD\r\nUuaAHUlFFAC0UlFAC0UlGaACg0ZpKAEIpMU6koAbSig02gB+aM0zNGaYCmgUmaAaQD6KbmlzQAhp\r\nKCaSgBc0maSimA7NGaSigBwNDHim0GgBKKKKACiiigAooooASiiimIKKKKACilpKACiiigAooooA\r\nKKKKACiiigAooooAWikooAWikooAWikooAWiikoAWikooAKKKKAFopKKAFopKKAFopKKAFpKKKAF\r\npKKKACiiigAooooAKWkpaACiiikAUlLSUxBRRRQAUUUpoASlpKKBhS0lKKAFooopDCkoooAKKKKA\r\nFooooGFFFFABRRRQAUUUUAOU07NR07NADs0hNNooAKKSnCgBKQmlJppoEFJS0lMkUUtIKWgAooop\r\nAJSUtJTAKKKKACiiigBaKKKQBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACUUUUwCiiigAooooAKKK\r\nKACiiigAooooAKKKKAClFJSigBaKKKQBQaKQ0AFSVGKkxQxoQ02nEU00DFFOFMpwpAPFFJQKAFpa\r\nSigAooooAKKSloAKSlooAaaaaeaYaBDaKKKYBS0lFADs0maKKBhSUtJQIKKKKACiiloAKKKKBiUU\r\ntFACUUUUAFFFFMAooFLQAlFFJQIWkoooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigQUUUUAFFFFABRRRQAUUUUDCloopAFFFFABSUtJTAKKKKB\r\nBSmkooGFFFLQAlKKKKAFooopDEooooAKKKKAClpKWgYUUUUAFFFFABRRRQAUtJRQAtFFAoAWilpp\r\npAIaBRQKYARTae3SmUEiilpBS0xBRRRSASkpaSmAUUUUAFLSUtABRRRSAKKKKACiiigAooooAKKK\r\nKACiiigAooooASiiimAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUopKUUALRRRSAKQ0tIaAAdalq\r\nIdamoY0NNNNPNNNIBtOFJSimAopabmjNIY7NFNzRmgB9FNzRmgB1FNzS5oAWikzRmgANNNKTTCaA\r\nENFFApiFApcUq07FAxmKMU/FGKAI8UVJikKUAR0op22lAoAQLShKXNJuoACAKbSmkoKA02lpKBMK\r\nKKKYgFLSUUAFFFFAhKKKWgBKKWkoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKBBRRRQAUUUU\r\nAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQMKWiikAUUUUAFFFFABRRRQAlFFFMAoopa\r\nAEpaKKACiiigBaKBRikUFJS0lAgooooAKWkooAWiiigYUUUUAFFFFABRRRQA4UUgpaAFppp1IaAG\r\n0UUtAA3SmU89KZTJYopaQUtAgooopAJSUtJTAKKKKAClpKWgAooopAFFFFABRRRQAUUUUAFFFFAB\r\nRRRQAUUUUAJRRRTAKKKKACiiigAooooAKKKKACiiigAooooAKUUlKKAFooopAFIaWkNAAOoqaoR1\r\nqWgaCmmlpDQAlFFLSASkp1JTASilpKADNGaMUoFAwzS0AU4CkAlGKdiigBpFNIqSmmgCOgCnEUAU\r\nxCinCkopDHUUzNLmgY+mk0hNNJpjHZozTQaWgAJzQBQKXFMBKSnEUAZpANIpKkxTStMQ2kNLQaBD\r\naKWigQlFFFABS0lFAC0lFFABRRS0AJRRRQAUUUUCCiiigYUUUUAFFFFABRRRQIKKKKBhRRRQAUUU\r\nUCCiiigAooooAKKKKACiiigAooooAKKKKBhRRRQAUtJRQAtFFFIAooooAKKKKACkpaKAEpRSUopg\r\nBooNFIAooooGKKWm08UDEpDTqaaAEooooEFFFFAC0UUUDCiiigAooooGFFFLQIQU+m0ooAWkoopA\r\nJRQaSmMCabTjTaZDFFLSCloEFFFFIBKSlpKYBRRRQAUtJS0AFFFFIAooooAKKKKACiiigAooooAK\r\nKKKACiiigBKKKKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSikpRQAtFFFIApDS0hoAB1qTNRCn\r\nUDQ7NJmkooAWikooAWikooAKUCilAoGKBRilFLSATFLSUtAC0UmaKACkNFIaACikpQaACg0tJTGJ\r\nRRRigYlJTsUpFADRQRTlFDntQA0Gn5xUdOBpiHMaaDQTmigY7NNJopKAENFLSUgEooopkhSUUtAh\r\nKKWigBKKWkoAKWkpaACiikoAWkopaAEopaSgAooooAKKKKACiiloASiiigAooooAKKKKACiiigAo\r\noooAKKKKBBRRRQAUUUUAFFFFAwooooAWikpaACiiikAUUUUAFFFFABRRRQAlKKSlpgLSUUUhhRRR\r\nQAU4Gm0ooAWkNLSGgYUlFFAgooooAKWkooAWikpaBhRRRQAUUUUALQKSloAWigUtIBppKcabTAQ0\r\nlKaSmSxRS0CigQUUUUgEpKWkpgFFFFABS0lLQAUUUUgCiiigAooooAKKKKACiiigAooooAKKKKAE\r\nooopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFKKSloAWikpaACkNLSGgBBTqaOtPpDCjFFFIBKK\r\nWkpgFKKSlFAxcUtApaQBRmikoAKWiigBaKKSgApppTTSaADNApKcBTGLRRRQMKKKSgYuaSg0CgBw\r\n4FMPWgmgUCFxxSU7NNoAKKUCigAoopKAFpDRS0wG0lKaMUCY2lpKKCRaKKKACiiigAxS4oozQMSi\r\niigAooooAKKKKBBSUtFACUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUtJRQAtJS0UAJRS4pKACiii\r\ngAoopaAEoopaACiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUwCgUUUALRRRSKEooooJCi\r\niimAUUUUhhS0lFAxaKKKAAUppKWgBKWkooAdS00UtIBaaaWkNMBDTaU0lMli0tJS0CCiiikAlJS0\r\nlMAooooAKWkpaACiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAlFFFMAooooAKKKKACiiigAoo\r\nooAKKKKACiiigApaKKACiiigBaQ0UUAA60+iikxoKMUUUhhSUUUAJSiiimA4UtFFIAooooAKWiig\r\nAppoooAQ0lFFAxQKWiimMKSiigYUmaKKACjtRRQISloooAWjFFFAxaSiigQUGiigBKXNFFACUCii\r\nmA00lFFBDCiiigApaKKACiiigYUUUUAFFFFIAooopgFFFFABSUUUCCiiigAooooAKWiigBKKKKAC\r\niiigAooooAKWiigAooooAKKKKAEooooAWiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAF\r\nJRRTAKKKKAFpaKKBiGiiikAUUUUxBRRRSGFFFFABS0UUDCgUUUABooooAKWiigAooooAaaSiimSx\r\naWiigQUUUUAJSUUUAFFFFABS0UUAFFFFIAooooAKKKKACiiigAooooAKKKKACiiigD//2Q==', 'asha1', '2016-06-15 18:21:44', 'asha1', '2016-09-12 18:21:44', 'wasqfrtgyhug'),
('asha5972', '41001', 5, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Kamla', 'Vijay', 'Mala', '1986-11-19', 30, 'Marathi', 'Pune', 'Illiterate', 0, 'Married', 4294967295, 'Ghfhgfgd dga daf fff', '', 4294967295, 'null', '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAKBueIx4ZKCMgoy0qqC+8P//8Nzc8P//////////////\r\n////////////////////////////////////////////2wBDAaq0tPDS8P//////////////////\r\n////////////////////////////////////////////////////////////wAARCADwAUADASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwBKbJ2p\r\n2R6imvzjHNADKKXB9DRg+hoASnx96bg+hpycZzxQA6ijI9RRkeooAKbJ2p2R6imvzjHNADKKXB9D\r\nRg+hoASnx96bg+hpycZzxQA6ijI9RRkeooAKbJ2p2R6imvzjHNADKKXB9DRg+hoASnx96bg+hpyc\r\nZzxQA6ijI9RRkeooAKbJ2p2R6imvzjHNADKKXB9DRg+hoASnx96bg+hpycZzxQA6ijI9RRkeooAK\r\nbJ2p2R6imvzjHNADKKXB9DRg+hoASnx96bg+hpycZzxQA6ijI9RRkeooAip8femU+PvQA6iiigAp\r\nsnanU2TtQAyiiigAp8femU+PvQA6iiigApsnanU2TtQAyiiigAp8femU+PvQA6iiigApsnanU2Tt\r\nQAyiiigAp8femU+PvQA6iiigApsnanU2TtQAyiiigAp8femU+PvQA6iiigApsnanU2TtQAyiiigA\r\np8femYNPTjOaAHUUZFGRQAU2TtTsimvzjFADKKMGjBoAKfH3pmDT04zmgB1FGRRkUAFNk7U7Ipr8\r\n4xQAyijBowaACnx96Zg09OM5oAdRRkUZFABTZO1OyKa/OMUAMoowaMGgAp8femYNPTjOaAHUUZFG\r\nRQAU2TtTsimvzjFADKKMGjBoAKfH3pmDT04zmgB1FGRRkUAFNk7U7Ipr84xQAyijBowaAJabJ2p1\r\nNk7UAMooooAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKfH3plPj70AOooooAKbJ2p1Nk7UAMoo\r\nooAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKfH3p\r\nlPj70AOooooAKbJ2p1Nk7UAMooooAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKfH3plPj70AOo\r\noooAKbJ2p1Nk7UAMooooAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKfH3plPj70AOooooAKbJ2\r\np1Nk7UAMooooAKfH3plPj70AOooooAip8femU+PvQA6iiigApsnanU2TtQAyiiigAp8femU+PvQA\r\n6iiigAooopMTCiiikSFFFFABRRRQAUUUUAFRnqakqM9TTQ0JT4+9Mp8femUOooooAKbJ2p1Nk7UA\r\nMooooAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKf\r\nH3plPj70AOooooAKKKKTEwooopEhRRRQAUUUUAFFFFABUZ6mpKjPU00NCU+PvTKfH3plDqKKKACm\r\nydqdTZO1ADKKKKACnx96ZT4+9ADqKKKACmydqdTZO1ADKKKKAJcCmvxjFOpsnagBmTRk0UUAGTT0\r\n5zmmU+PvQA7AowKKKADApr8YxTqbJ2oAZk0ZNFFABk1IOgqOpB0FJiYtFFFIkKKKKACiiigAoooo\r\nAKMUUU0NBgU1+MYp1Nk7UyhmTRk0UUAGTT05zmmU+PvQA7AowKKKADApr8YxTqbJ2oAZk0ZNFFAB\r\nk09Oc5plPj70AOwKMCiigApsnanU2TtQAyiiigAp8femU+PvQA6iiigApsnanU2TtQAyiiigAqQd\r\nBUdSDoKTExaKKKRIUUUUAFFFFABRRRQAUUUU0NBTZO1OpsnamUMooooAKfH3plPj70AOooooAKbJ\r\n2p1Nk7UAMooooAKfH3plPj70AOooooAjyfU05Oc55plPj70AOwPQUYHoKKKADA9BTX4xjinU2TtQ\r\nA3J9TRk+ppKKAFyfU05Oc55plPj70AOwPQUYHoKKKADA9BRRRSYmFFFFIkKKKKACiiigAooooAKj\r\nJOTyakqM9TTQ0GT6mnJznPNMp8femUOwPQUYHoKKKADA9BTX4xjinU2TtQA3J9TRk+ppKKAFyfU0\r\n5Oc55plPj70AOwPQUYHoKKKADA9BTX4xjinU2TtQA3J9TRk+ppKKACnx96ZT4+9ADqKKKACmydqd\r\nTZO1ADKKKKACnx96ZT4+9ADqKKKACmydqdTZO1ADKKKKACnx96ZT4+9ADqKKKACmydqdTZO1ADKK\r\nKKACnx96ZT4+9ADqKKKACmydqdTZO1ADKKKKACnx96ZT4+9ADqKKKACmydqdTZO1ADKKKKAJNo9K\r\nRvlxjinU2TtQA3cfWjcfWkooAXcfWnL82c80ynx96AF2j0o2j0paKAE2j0pG+XGOKdTZO1ADdx9a\r\nNx9aSigBdx9acvzZzzTKfH3oAXaPSjaPSlooATaPSkb5cY4p1Nk7UAN3H1o3H1pKKAF3H1py/NnP\r\nNMp8fegBdo9KNo9KWigBNo9KRvlxjinU2TtQA3cfWjcfWkooAXcfWnL82c80ynx96AF2j0o2j0pa\r\nKAE2j0pG+XGOKdTZO1ADdx9aNx9aSigBdx9acvzZzzTKfH3oAXaPSjaPSlooAKbJ2p1Nk7UAMooo\r\noAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKfH3pl\r\nPj70AOooooAKbJ2p1Nk7UAMooooAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKfH3plPj70AOoo\r\nooAj3H1py/N15plPj70ALtHpRtHpS0UAJtHpSN8vTinU2TtQA3cfWjcfWkooAXcfWnL83XmmU+Pv\r\nQAu0elG0elLRQAm0elI3y9OKdTZO1ADdx9aNx9aSigBdx9acvzdeaZT4+9AC7R6UbR6UtFACbR6U\r\njfL04p1Nk7UAN3H1o3H1pKKAF3H1py/N15plPj70ALtHpRtHpS0UAJtHpSN8vTinU2TtQA3cfWjc\r\nfWkooAXcfWnL83XmmU+PvQAu0elG0elLRQAm0elI3y9OKdTZO1ADdx9aNx9aSigAp8femU+PvQA6\r\niiigApsnanU2TtQAyiiigAp8femU+PvQA6iiigApsnanU2TtQAyiiigAp8femU+PvQA6iiigApsn\r\nanU2TtQAyiiigAp8femU+PvQA6iiigApsnanU2TtQAyiiigAp8femU+PvQA6iiigApsnanU2TtQA\r\nyiiigD//2Q==', 'asha1', '2016-07-11 18:08:56', 'asha1', '2016-11-11 18:08:56', '785412369856');
INSERT INTO `hm_patient` (`Patient_id`, `PinCode`, `Village_id`, `City_id`, `District_id`, `State_ID`, `Country_ID`, `Card_Type_id`, `Gender_Id`, `Cast_Category_Id`, `Patient_Salutation`, `Patient_FName`, `Patient_MName`, `Patient_LName`, `Patient_DOB`, `Patient_Age`, `Patient_Language`, `Patient_POB`, `Education`, `Patient_BPL`, `Patient_Marital_Status`, `Patient_Contact`, `Address_line1`, `Address_line2`, `Patient_Emergency_number`, `Patient_Ward`, `Patient_Image`, `Created_By`, `Created_Date`, `Updated_By`, `Updated_Date`, `Card_Number`) VALUES
('asha6674', '41001', 7, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Shantabai', 'Prakash', 'Patil', '1984-09-12', 32, 'Marathi', 'Kolhapur', 'Literate', 0, 'Married', 4294967295, 'Kothrud pune', '', 4294967295, '12', '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAKBueIx4ZKCMgoy0qqC+8P//8Nzc8P//////////////\r\n////////////////////////////////////////////2wBDAaq0tPDS8P//////////////////\r\n////////////////////////////////////////////////////////////wAARCAPIBRADASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwCGiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigApaSloAKB1opR1oAdS0lLSAKKKKAEbpTKc3Sm0wCiiig\r\nBKKWigBKWiigBKKWigBKWiigAooooASilooASilooASilooASilooASilooAKSlooASilooASilo\r\noASilooASilooASilooASilooASloooAKSlooASiiloASiiigAooooAKKKKACiiigAooooAKKKKA\r\nCiiigAoopaAEopaKAEpaKKACiiigApKWigBKWiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooASilooASilpKACiiigAooooAKKKKACiiigAoopaAEpa\r\nKKACiiigAooooActOpq06kAUUUUAIaZTzTKAEpaKKYBThTacKQC0tJS0gCiiigYUUUUAFFFFABS0\r\nlLQAUUUUALRSUtAEFFFFUIKKKKACiiigAooooAKKKKACiiigAooooAKWkpRQAUo60lKvWgB1LSUt\r\nIAooooAa3Sm05qbTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAEopaKACiiigApKWigApKWigAoo\r\nooAKKKKACiiigAooooActOpq06kAUUUUAIaZTzTDQAlO7UlL2pgJThTacKQC0tJS0gCiiigYUUUU\r\nAFFFFABS0lLQAUUUUALRSUtAEFFFFUIKKKKACiiigAooooAKKKKACiiigAooooAKXtSU4dKAEpVp\r\nKVaAHUtJS0gCiiigBrU2nNQo+YUwExRg1ZxS4FAFXFGKtYFGBQBVxRirOB6UYFAFbFGKs4HpRgel\r\nAFbFGKs7R6UbR6UAVqKs7R6UbR6UAVqKs7R6CjaPQUAVaKs7F9BRsX0FAFairOxfSjYvpQBWoqzs\r\nX0o2L6UAVqKs7F9KPLX0oArUVY8tfSjy19KAK9FWPLX0o8tfSgCvRVjyl9KPKWgCvRVjylpPKWgC\r\nCip/KWjyloAgoqfyhR5QoAgoqfyhSeUPWgCGipvKHrR5Q9aAIaKm8ketHk+9AENFTeT70eT70AQ0\r\nVL5PvR5PvQBFRUvkn1o8k+tAEVFS+UfWk8o+tAEdFSeUaPKagCOipPKajymoAjop/lNR5bUAMop/\r\nlt6UeW3pQAyin+W3pSeW3pQA2inbG9KNjelADaKdsPpRtPpQA2inbT6UbT6UANopdpo2n0oASilw\r\naMGgBKKXBoxQAlFLijFACUUuKKAEopaKAEopaKAEopaKAEopaKAEopaKAEpaKKAEopaKAEopaKAE\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBy06mrTqQBRRR\r\nQAhphp5phoAKcOlNp6j5aYDTSikNKKQC0tJS0gCiiigYUUUUAFFFFABS0lLQAUUUUAFLSUUAQ0UU\r\nVQgooooAKKKKACiiigAooooAKKKKACiiigApw6U2nfw0AJSrSUq0AOpaKKQBRRRQA1qE+8KG60sf\r\n3xTAsUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUU\r\nUAFFFFABRRRQAUUUUAFGKKKADFGBRRQAYFJgelLRQAmB6UbR6UtFACbR6UbR6UtFACbR6UmxfSnU\r\nUAN2L6UbF9KdRQA3y19KPLWnUUAM8taPLWn0UAM8oUeUKfRQBH5Qo8oVJRQBH5Qo8r3qSigCPyve\r\nk8r3qWigCLyqPKqWigCHyjR5RqaigCHyjSeUanooAg8o0eWanooAr+W1HlmrFFAFfyzRsPpViigC\r\ntsPpRsPpVmjFAFbafSjafSrOKMCgCrtPpRtPpVrApMCgCtg0YNWdo9KNooArYNGKs7R6UbR6UAVs\r\nUYqxsFGwUAVqKs7BULjBoARadTVp1IAooooADUZqQ1GaACng/LTKcvSmAhoFBoFIB1FFLSAKKSlo\r\nAKKKKBhRRRQAUtJRQAtFFFABRRRQBDRRRVCCiiigAooooAKKKKACiiigAooooAKKKKACn44ptO/h\r\npANpVpKctMB1FFFIAooooAa3Wlj++KRutOi++KYE9FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAHpUEnWp6gk60ANWnU1adSAKKKKAENMNPNMNABTh0p\r\ntKOlMANApDSikA6lpKKQBS0lFAxaKKKACiiigAooooAWiiigAooooAhoooqhBRRRQAUUUUAFFFFA\r\nBRRRQAUUUUAFFFFAC07tTRSnpSASnLTactADqKKKACiiigBrdadF9+mnrT4fvUwJqKKKACiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACii\r\nigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqCTrU9QSdaAGrTqat\r\nOpAFFFFAAaYaeaYaAEpwHFNpwPFMBDQKQ0opAOooopALRSUUDFooooAKKKKACiiigBaKSloAKKKK\r\nAIaKKKoQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAopTSDrS0AJTlptOXpQA6iiikAUUUUAMPWpIf\r\nvGoz1qWHqaYEtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAVBJ1qeoJOtADVp1NWnUgCiiigBDTDTzTDQAUo6UlKOlMBKUUlKKQDqKKKQBRS0lAwoopa\r\nACiiigAooooAKWkooAWiiigCGiiiqEFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAKvWlNCfeoNIBKc\r\nvSm04dKAHUUUUAFFFFADD1qWHvUR61LD3pgS0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFF\r\nFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFFFFABRRRQAUUmaXNABRRmkzQAtFJmjNAC0UmaM0ALRRmk3UALRTd1G+gB1FN3UuaAFoozRQAUU\r\nUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRR\r\nQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOtADVp1NWnUgCiiigB\r\nDTDTzTDQAUvakpe1MBKUUlKKQDqKKKQBRRRQMKKKWgBKWiigAooooAKKKKAClpKKAIqKKKoQUUUU\r\nAFFFFABRRRQAUUUUAFFFFABRRRQA5OtBpU6/hSGkAlOHSm08dKAFooooAKKKKAGd6mh6Goamh+6a\r\nYElFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFIWAppcUAPpCcVGz0wsaAJS9NL1HRQA/fRvpl\r\nFAD9xpNxpM0UAODUoamUUATbhRkVFRQA8tTM0lFABmiiigAzS5pKKAHBjSh6ZS0ASh6UEVDSg0AT\r\nUUwPTgc0ALRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOtADVp1NWnUAFFFFI\r\nBDTDUhphoASlHSkpR0pgJSikpRSAdRRRSAKKKKBhRRRQIKKWigYUUUUAFFFFABRRRQBFRRRVCCii\r\nigAooooAKKKKACiiigAooooAKKKKAHJ1P0pDSr3pKACnimU8UgFooooAKKKD0oAZU8P3agqeL7lM\r\nB9FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFFABSZoJxUbPQA8timF6YTSUAKWzSZoooAKKSigBaSiigApaSloAK\r\nWkpRSAKKSloAUUGkopgFFFHagBKWkooAWiiigBaKKKACiiigBaXNJRQIeDT6jXrUlAwooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAqCTrU9QSdaAGrTqatOpAFFFFACGmGnmmGgApQOKSnDpTAbSik\r\npRSAdRRRSAKKKKACiiigBaKKKBhRRRQAUUUUAFFFFAEVFFFUIKKKKACiiigAooooAKKKKACiiigA\r\nooooAcvekpR0NJQAU8UynikAtFFFABQelFB6UAMqeL7lQVYj+4KYDqKKKACiiigAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAozRSHigB\r\naYz4prPUZOaAHM2abSUUALSUUUAFLSUUAFFFJQAtFFFABS5pKKAFzRSUUALRRRSGLRRRQAUhNFIa\r\nBBS0lFMBRRmiigBc0tNpaAFooooAWiijNAhy9akqIVIpyKBi0UUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFF\r\nFABRRRQAVBJ1qeoJOtADVp1NWnUAFFFFIBDTTTjTTQAlKOlJSjpTASlFJQKQD6KKKQBRRRQMKKKK\r\nBBRRRQAUtJS0DCiiigAooooAioooqhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACiiiigAp4pgp9I\r\nBaKKKACg9KKG6UAMqxH9wVXqyn3BTAWiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooprNgUAKxwKhZ80jNmm0AGaKKSgBaKKKACi\r\niigBaSiigApKWigBKWkooAWikooAUGnAgimUtAxcUZoopAGaKKKAA0lOoxQA2inYoxQA2ilooEFK\r\nKSloAWikopgLRSUtACinKcU2lzQIlFFMU0+gYUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABUEnWp6gk\r\n60ANWnU1adSAKKKKACmGnmmGgBKcOlNpw6UwG0Cg0CkA8UUCikAUUUUDCiiigQUUUUAFLSUtABRR\r\nRQMKKKKAIqKKKoQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAtFFFAAKfTB1p9IBaKKKACkbpS0jdK\r\nAGirK/dFVhVlfuimAtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFIaAAnFQu2TSu1RmgApKKKACiiigAooooAKWkooAWikpaACkoooAK\r\nWiigYUUuKMUgEopaMUAJS0YpaBiUuKBS0AJS0UtACYop2KCKAGUYp2KMUCG0U7FJQAUUUUCCiiim\r\nAU6m0UAPFKGpmaWgRIDS1Hml3cUDH0ZqMMaXdQA7NIWppJpDQIeG9adUQp6mgY6iiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqCTr\r\nU9QSdaAGrTqatOoAKKKKQAaYafTDQAlKOlJSjpTASgUUCgB4ooFFSAUUUUAFFFFABRRRQMKWkpaA\r\nCiiigAooooAioooqhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0UUUAA60+mjrTqQC0UUUAFI3Sl\r\npG6UANFWh0FVRVodKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFFFFABRRRQAUUUUAFFFITQAtRO9DvUZNACE0lFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAxaW\r\nkpQKQwpaMUuKAEpaUClxQAmKMU7FGKAG4pcUuKWgBuKXFLRSASilooATFJTqSgBMUmKdQaAG4pCK\r\ndiigBuKSnGkNMVhKKKKYgpwptLmgBxpKSg8UgFpcimUopgOzmkNGcUUAGaKSigRIjU+oRUitmgY6\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACoJOtT1BJ1oAatOpq06gAooopABphp9MNACUUUUwCgUUUAOFLSClqQCiiigAooooAKKKKBhRR\r\nRQAtFJS0AFFFFAEVFFFUIKKKKACiiigAooooAKKKKACiiigAooooAWiiigBR1p1NHWnUgFooooAK\r\nRqWkagBB1qzVZetWaYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFFFFABRRRQAUUUUABqN2pznAqBjzQAhNFFJQAUUUUAFFFFABRRRQAUUUUAFFFFABRRSgUDEpwFO\r\nApQKQxuKXFOooATFLilopDDFFLRTEFFFFABRRRQAUtFFABRRRQAUlFFIAooooASilpKAEpKdSUAN\r\nxSYp1JimISiikoEOUZofrSpSPyaAG0tJRmmAuaXtTaUmgANFJSZoAdSqcU2igCwpyKWoVbBqUHNA\r\nC0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB\r\nUEnWp6gk60ANWnU1adQAUUUUgCmGn0w0AJRRRTAKKKKAHClpBS1IBRRRQAUUUUAFFFFAwooooAWi\r\niigAooooAioooqhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0UUUAKOtOpq9adSAWiiigApGp1Na\r\ngBF+8Ks1XT7wqxTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAo\r\noooAKKKKACg0U1zgUARyNUdKxyabQAUUUUAFFFFABRRRQAUUUUAFFFFABRRTgKQwApwFApaChRRS\r\nUUgFooFLQAUtJS0AFFFFAgooooAKKKKAClpKKACiiigAooooAKKKKACkpaSgYUlLRQAlJS0UANNN\r\npxpDTEIpwaVqbSk0EiUUUlMBaM0UUAFFJRQAtApKUGgB1ORsGo80A0AWQaWo0NSUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABUEnWp6gk60ANWnU1a\r\ndQAUUUUgENNNONNNACUUUUwCiiigBwpaQUtSAUUUUDCiiigQUUUUAFFFFAwpaSloASloooAioooq\r\nhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFLQAUUUUAKtOpq0+kAUUUUAFNbrT6Y3WmAqfeFWKrx/fFW\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqGQ1\r\nI5wKgY80AJSUUUAFFFFABRRRQAUUUUAFFFFABRRTgKQwAp1FFIoKKBS0AFLRS0AFFFFAC0UlFAC0\r\nUlFAC0UlFABS0lFAC0UmaKAClpKKAFpKKKAClpKKACiikoAWikooAKKKKAEpDS0UAMNJTiKQ0xMS\r\nkoopkhRRRQAUUUUAFLSUUALRSUtACg4NWFORVapY2oAlooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKrydasVBJ1oAYtPpi0+gAooopAIaaetONNNACUU\r\nUUwCiiigBwpaQUtSAUUUUDCiiigAooooAKKKKBBS0lFAxaKKSgCOiiiqEFFFFABRRRQAUUUUAFFF\r\nFABRRRQAUtJS0AFFFFACrT6YtPpAFFFFABTW606mt1pgOj++KnqCL74qegAooooAKKKKACiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoopGoAjkNRGnuaZQAlFFFABRRRQAU\r\nUUUAFFFFABRRSigYCnCkFLSKFooopALRRRQAtFJRQAtFFFABRRRQAUtJRQAtFJS0AFFFJQAtFJS0\r\nAFFJS0AJRS0lABRRRQAUUUUAFFFFABRRRQAUlLRQA00hp1IaAGGkpxptMkKKKKYgooooAKKKKACi\r\niigBaUHBptFAFlDkU6oY25qagAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoo\r\nooAKKKKACiiigAqCTrU9QSdaAGLT6avWnUAFFFFIBDTTTqaaAEooopgFApKUUAOFLSClqQCiiigY\r\nUUUUAFFFFABRRRQAUUUUAFFFFAEdFFFUIKKKKACiiigAooooAKKKKACiiigApaKKACiiigBVp9NW\r\nnUgCiiigAprdadTT1pgOi+/U9QxffqagAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigApr9KdTJKAIWNJSmm0AFFFFABRRRQAUUUUAFFFFABSiilFIpC0UtFIYU\r\nUUUAFFFFAxaKSigBaKSlpCClpKKYC0UlLQAUUUUALSUUUALRSUUALRSUUALSUUUAFFLSUAFFFFAB\r\nRRRQAUlFFABRRRQAUlLRQA002n000xDaKU0lMkKKKKACiiigAooooAKKKKAHA4NTo2RVeno2KYE9\r\nFIDmlpAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOt\r\nADV606mLT6ACiiikAhpppxppoASiiimAlLSUooAcKWkFLUgFFFFAwooooAKKKKBBRRRQMKKKKACi\r\niigCOiiiqEFFFFABRRRQAUUUUAFFFFABRRRQAUtJS0AFFFFADlp1NWnUgCiiigApp606mHrTAkh+\r\n9+FTVDD941NQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAVHJUlRSdaAIjSUppKACiiigAooooAKKKKAClFFKKRSClFFFIYtFJRQAtFJS0AFFFLQAUlLRQMSl\r\npcUmKBBRRilpDEooopgLRSUtAgooooAKKKWgAoopKAFooooAKKKKAEopaKAEooooAKSlooASiloo\r\nASilpKAA0006kNADTTaeaaaYmJRRRTJCikpaACiiigAooooAKXNJRQBMjVIDVYHFPVuaYE9FIpyK\r\nWkAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFQSdanqCTrQAxetPpi9a\r\nfQAUUUUgENNNONNNACUUUUwEpRSUooAcKWkFLUgFFJRQMWiiigAooooEFFFFAwooooAKKKKAI6KK\r\nKoQUUUUAFFFFABRRRQAUUUUAFFFFABS0lLQAUUUUAOWnU1elOpAFFFFABTD1p9MPWmBLD1NS1FD1\r\nNS0AFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAB6VA55qV\r\nzxUB60AJSUtJQAUUUUAFFFFABRRSigYCnUlLSGFFFFIYUUUtACUtFFABS0lLQAtFFFAC0UUUAFJS\r\n0UAJRS0lABRRRQAUUUUAFLSUUALRSUUALRRRQAUUUUAFFFFACUUUUAFFJSigAooooAKSlpKACkpa\r\nSgBDSGnU00CG0UppKoQlFLRQIKKSigBaKSloAKKKKAClFJRQBMjVKKrocGpweKYC0UUUgCiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACoJOtT1BJ1oAYvWn0xetPoAKKKKQCGmnrTj\r\nTDQAUUUUwEpRSUooAcKKBRUgFFFFAwopaKACikooAKWkpaACiiigAooooAjoooqhBRRRQAUUUUAF\r\nFFFABRRRQAUUUUALRSUtABRRRQA5elOFNXpThSAKKKKACmd6fTKYEsPepajh6GpKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAI5DUNSPUdAAaSlpKACiiigA\r\nooooAKWkpaQ0LS0lLSKCiiigBaKKKACiiigYtFJS0AFLRRQIWikpaAClpKWgBKKKKAEooppNADqS\r\nmhqdmgBaKKKACiiigBaKKKAFpKKKACkpaSgAooooASlopaAEopaMUAJRS0lACUUtJQAhpKdSUANN\r\nNp5pppiYlJS0lMkWikooAKWkooAWiiigAooooAUVOjcVXp6HBoAsUUi0tAgooooGFFFFABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOtADF60+mL1p9ABRRRSAQ0w080w0AFFFFMBKU\r\nUlKKAHCiiipAKKKKBi0UUUAJRRRQAUtJS0CCiiigYUUUUAR0UUVQgooooAKKKKACiiigAooooAKK\r\nKKAFooooAKKKKAHDpTqaOlOpAFFFFABTKf2plMCaHoakqOH7pqSgAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACg9KKRulAELmmU5qbQMKSiigQUUUUAFFFFAC0tJSi\r\nkUFLRS0hiUtFLQAlFLS4oAbS0YooGFFFFAC0UCloEJRRRQAtFJRQAtJRRQAhNRk05qbTQBSg0lFA\r\niQUtNXpTqQwopKKAFopM0ZoAWikzS5oAWikzS5oAKKKKACiiigAooooAKKKKACkpaSgBKSnUlADT\r\nSGnUlADDRSmkqiWJRRRQIKKKKACiiigBaKKKAClHWkooAnQ5FPFQxtU4pgFFFFIAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACoJOtT1BJ1oAYvWn0xetPoAKKKKQCGmGnmmGgAooopgJSi\r\nkpRQA6igUVIBRRRQMKWkpaBCUUUUDClpKWgQUUUUAFFFFAyOiiiqEFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUtFBoAKKKKAHDpTqQdKWkAUUUUAB6UynnpTKYE8P3afTIvuU+gAooooAKKKKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACkbpS0xzQBE3WmU5utNoGFFFFAgooooAKKKKAFF\r\nLQKKRQopcUClpDDFLSUZoAWikooAWikooGLRSZozQIWlpuaN1AC0Zpu6k3UAOzRTc0uaAFzRmm5o\r\nzQANTKcaSmgYlFFFAiRelLSLwKWkMTNFFJmgAzRSUUALmjNJRQAuaXNMpaAHZozTaKAHbqXdTKKA\r\nH5pc0yjNAD80U3NGaAHUUmaKAFpKKKAEpKWkoAQ02nmmmmJjaKKKZIUUUUAFFFFABS0lLQAUUUUA\r\nKpwasIciq1TRNQBLRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABVeTrViq8nWgB\r\nq9afTF60+gAooopAIaYaeaYaACiiimAlKKSlFADhRQKKkAooooAKKKKBhRRRQAUtJS0AFFFFAgoo\r\nooGR0UUVQgooooAKKKKACiiigAooooAKKKKAFoNFK3WgBKKKKAHDpTqQUtIAooooAD0plPPSmUwJ\r\n4vuU+mxfcFOoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigANRMK\r\nexpp6UDIj1ptObrTaACiiigQUUUUAFKKSlFA0LSikpRUlC0UUUAFFFJQAtFJRQAuaTNJRQAuaM0l\r\nFAC5pKKSmAtJRRQAtGaSigBaKSigBaSlpKAEpyikpwoAdSUUlIApKKSmAUUUUCCiikoAWiiigAop\r\nKWgApaSigYtLSUtIBaKKKAEozS0UAGaM0mKKAFopM0tACU006kNAhtJSmkqiQooooAKKKKACiiig\r\nBaKKKACnIcGm0ooAsqcilqOM8VJQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUCCiiigYVBJ1\r\nqeq8nWgBq9afTF60+gAooopAIaYaeaYaACiiimAlKKSlFADqKBRSAKKKKQwooooEFFFFABS0lFAC\r\n0UUUAFFFFAEdFFFUAUUUUAFFFFABRRRQAUUUUAFFFFACilf71IOtOk4c0ANooooAeKWkFLSAKKKK\r\nAA9KZTz0pgpgWI/uCnU1PuCnUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABQaKQmgBpppPFObpTKRRGaSlNJTEFFFFAgooooAKUUlKKQ0KKWijNIoKKSigBaKKKACiiigBK\r\nKKKYCUUUUAFFJRQIWikooAWikooAWikooAWiiigBRS0lLSGLSUtJQAlJQaKYBSUtJQIKKKKBBRRR\r\nTAKKKKAFopKKQx1LTc0oNAC0tJmjNIYtFJRQAtJS0UANpaKSgBaKKKAGmm08000yWJRRRTEFFFFA\r\nBRRRQAtFFFABRRRQBJGanFVlODVhTkUALRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAgopKWgAooooA\r\nKrydasVBJ1oGMXrT6YvWn0AFFFFIBDTDTzTDQAUUCimAlLSUUALmjNJRQA7NGabRQA7NJmkooAWi\r\nkooAWjNJRQAuaM0lFAC5ozSUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAKOtOkOWNNoPWgAoooo\r\nAeKWkFLSAKKKKABulMFObpTaYFhPuCnUifdFLQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFMY80+o260DQh6UlKabSGMNJSmkpiCiiigQUUUUAApwpBS0hoWm0UUDFoooo\r\nGLRSUUgFpKM0ZoAKSjNJmmIWkoooFcKKSimAtFJS0AFFFFABRRRSAWiiigYtKKSlpDClpKKAENJS\r\nmkpgFJS0lAgooopiCiiigApKKKBC0UlFAC0ZpKKBi5pc02loC47NGabRmkO47NLmm5ozQMdRSUtI\r\nAoooxQAGmGn4ppFMQ2ilpKZIUUUUAFFFFABS0lFAC0UUUAFTRNUNOU4NAFmikU5FLQAUUUUAFFFF\r\nABRRRQAUUUUAFJS0lAgpaSloAKKKKBhUEnWp6rydaAGr1p9MXrT6ACiiikAhphp5phoAVehpDTl6\r\nGmmmAlFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAtFFFABRRRQA8UtIKWkAUUUUAI3Sm05ulNpgWV+6PpS0i/dH0paACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooopAFFFFABRRRQAVGetSHpUTdaBoTvSGgUpoKIzSUppKZIUUUUCCiiigAp\r\naSlpDQUtFFAwopKKAFpKKSgLi0maKSmK4tJRRQIKKKKACiiigAooooAKWkpaBhRRRQAtFFKBSGKK\r\nWgUopDExRTsUhoAbSGnUhoAbSUppKZLCiikpgFFFFAgopaKACiiigBKKWigBKKWkoAKKKKAFopKW\r\ngYtLTaWkMcKWmZp2aQxaaaWkNADTSUppKokKKKKBBRRRQAUUUUALRSUtABSikoFAFiM5FPqKOpaA\r\nCiiigAooooAKKKKACiiigApKWkoAKWkpaBBRRRQMKrydasVXk60ANXrT6YvWn0AFFFFIBDTDTzTD\r\nQA5ehppp6Hg0w9aAEooopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB\r\nRRRQAUUUUAFFFFABS0lFAC0UUUAPFLSCikAtFFFACN0popzdKaKYFpfuiigdBRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUgCiiigAooooAKKKKAA9KhbrUx6VC3WgaEp3amU7tQURt1pKVutJT\r\nJYUUUUCCiiigApaSlpDQUUUUDCkoooEFJRRTEFFFFABRS0UAJRS4oxQAlFLRQAlFLSUAFFFLQAUU\r\nUUhiiniminUmUFOFIKcBQAUhp1IaAG0hFOpDQAwim0800imhMSiiigQUUUtMBKKWikFgxS4oFLmg\r\ndhMUmKdSUAJijFFFACUUtFArCUUYoxTAKKXFGDSASloxS7aBiikpcUUhjTSU4000yWJRRRTEFFFF\r\nABRRRQAUtJS0AFFFFAEkR5qeq8fWrAoAKKKKACiiigAooooAKKKSgBaSikoAWikpaAFopKWgAqvJ\r\n1qxVeTrQA1etPpi9afQAUUUUgENMNPNMNADk6GmmlXvSGmAlFFFABRRRQAUUUUAFFFFABRRRQAUU\r\nUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUALQKKBQA8UUCikAUtJS0AI1NFK\r\n1A60wLI6UUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUgCiiigAooooAKKKKACiiigAPSoW61Maj\r\nagaI6U0d6CKChhpKU0lMlhRRRQIKKKKAFooopFBSUUUCCkpaKYhKWiigYUUtFIBKWiigYUUUUAJR\r\nS0lAgooooAKKKKAClApQKUCgaQCloopFCinU0U8UCYUhpaSgBKQ0tFAxtBFOpDQAwikp5FNxTEJR\r\nRijFAgooxRQAUtJRQMWiiigA4o4oxS4pAJijFOxS4oAbilC07FFAhMUUtFAxKKKKAEooooASmmnG\r\nkpiGUUppKZIUUUUAFFFFABS0lLQAUUUUAOTrVgdKrr1qwOlAC0UUUAFFFFABRRRQAUhpaKAG0UtF\r\nACUUUUAFLSUUALUD9anqB+tADV60+mL1p9ABRSUUgA0w080w0AKKSgUUwEooooAKKKKACiiigAoo\r\nooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBaBRQKAHiigUUgC\r\nlpKWgBrUDqKGoXqKYFmiiigAooooAKKKKACiiigAooooAKKKKQBRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFRsakqFutBSG96WikzQMa3WkpTSUyWFFFFAgoFFKKBoUCjFLRSKG4oxT8UYoEMxRin4oxQAyin7\r\naNtFwGUU7FJigYlFLil20ANop22l20AMop+2kIoAbRTsUbaBDcUoFOxS0DEoopaQwooopAKKcKaK\r\ndTEwpKWigQlFFFAxKKKKBiGjFFFACYoxS0tAhuKNtPooAbto206igBu2jFOooATFGKWigAxRilxS\r\n0xCYopaaaQBSUtJQMQ0lLRQMSiiigQGm06kNADTTacaSmSxKKKKYgooooAKKKKAFooooAUdasL0q\r\ntViM8UAPooooAKKKKACiiigAooooASilNNoAKKSloAKWkpaACoH61PUD9aAGr1p9MXrT6ACkoopA\r\nBphp5phoAKSlpKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFAC0CigUAPooopAFLSUtADWoX7woahfvCmBZooopAFFFFABRRRQAUUUUwCi\r\niikAUlLSUDDNLTaWgBaKSloEFFFFABRRRQAUUUUAIaibrUp6VCetBSCkNBooGNNJSmkpksKKKKBB\r\nThSAU6kUhaKKKQwpaKKAClxRRQAuKMUUtADcUYp1GKAG4pcUuKKAEooooASjFLRQAmKKKKACkpaK\r\nBjaWiikAUCigUwHClFIKdQIKQ0UUCEpKWkoGLRSUtACUUUUDDFFLRQISloooAKWkpaBCUYpaWmAm\r\nKWiloASiikoAKTNFJSGFBpKKBhSUUUAFJS0lAhaSiigBKaacaaaYmJRRRTJCiiigAooooAKWkpaA\r\nCnoeaZSg80AWBS0xDxTqQx1FJRQAtFJRQAtJRRQAUlLSUAJRRSUCHUUlLQAtV361Yqu/WmAi9afT\r\nF606kAUUUUABphp5phoAKSlpKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0CkpRQA+iiikAUtJRQAjdaF+8KRutKv3hQMnzS00U6gBa\r\nKKKBBRRRQAUUUUAFFFFACUhpaSgYlLRRSAKKKKYC0UlLQAtFFFAgooooARulQnrUrdKhPWgpAaBQ\r\naQUDEakpxptMlhRRSigBRTqSlqSgooooGFLSUtABS0lFAC0tJS0CFooFFMQUUtJQAUlLRSASiloo\r\nGJSUtFACUlLSUDCiiikAUtIKdTABTqbS0EhSUtFACUlLSUDEpaSlFAxaSg0ZoELRSUtAC0UUUCCg\r\nUUZpgLRRRQAUUUlAC5pKKSgAooopDEpKWigY2ilNJQAUlLSUAFFFFAhDSGnU00xDaKWkpkhRRRQA\r\nUUUUAFFFFAC0UlLQBIhqTNQL1qUGkMfS0gooAWikpaACiiigAooooAQ0mKdSUCExS0tFABVd+tWK\r\nrv1oARetOpq06gAooooADTDTjTTQAlFFFMAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigApRSUooAfRRRSAKKKKAGt1oX7wobrQOtAEwNOB\r\nqMUoNIokzRmmZpc0CsOopuaM0AOopKKAFooopgFJQaM0gCiiigYlFFFACilpKWmIWikpaBBRRRQA\r\njdKg71O3SoD1oKQGkpaSgYhpKU0lMlhSikpwpAhaKKWkUFFFFAwoopaACiiloAKWkpaBC0tJRTEL\r\nRRSUAFFGaKACikozSGIaKKQ0DDNJmkJpKAHUUCigBwpaSigQtLRS0xCUUtFADaSnUhpDG0Cg0CgY\r\nUlLmg0AGaUGm0A0APopoNLmgQtFJRmgB1FNzS0BYKKSigBaKSigAooooAKSiigYUlFFABSUUUAFF\r\nJS0CCmmlpDTEJSUtJTEFFFFAgooooAKKKKAClpKKAFHWpAajp4NIZIpp1MWnigApaKKAEpaSigBa\r\nKKKACikpM0ALmjNJmigBTUD9amNQt1oARadTV606gQUUUUAIaaacaaaAEooopgFFFFABRRRQAUUU\r\nUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFKKSlFAD6K\r\nKKQBRRRQA09aF+8KD1pY/vCgaJMUYp1FIY3FFLRQAlJmlNJQA4GnCmCnCgB1FFFAhppKcRSYoGJm\r\nilxRigAooxS4oAKWkpaYgpaSigBaKSloEB6VA/Wp6hkHNA0NFIetOWhqChhpKWkpksKeKYKeKTGg\r\npaKKQwooooGFLSUtAC0UlFAC0tJRQIWikooAdSUlFAC0maSkoGOzSUlGaADNITQTTaAFpQKAKdig\r\nQlLRRQMWikpc0ALS5pmaXNArDs0ZpuaTNAWHGkzRmkoADQKKKBi4GaUimgc07FAhpFNNPIppFACZ\r\npQaZS0APzRTc0ZoGOFLTaXNAC0UmaKAFopKKACiikoAU0lFFABSUtJQAUUUUCEooooAKDRRTAbSU\r\nppKCQooopiCiiigAooooAKKKKAFpy02lWkBKKeKjFPFAx1FFFABSUUUgCiiigBDSU6igBMUuKKWm\r\nAmKgfrVg1XfrQAgp1NFOoEFFFFACGmmnGmmgBKKKKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSikpRQA+iiikAUUUUANPWlj+8KQ9a\r\nWP71A0T0lFFIYUUUmKAEJpuacabigBRTxTBTxQA6ikpaYgooooAKKKKACiiigAopCabmgB9FNBpa\r\nAFoopaACopalpkg4oBEY6UhooJoKG0lLSUCYop1NFOoBC0UlLSGFFJS0DFopKKAFooooAKWkooAK\r\nKKKACikooAKKSigApKKSgApQKSnCmIcOKWm5ozSAWkzSZpM0DFzS5ptFFgHZozTc0ZosA7NJmkoo\r\nELmjNNoosA7NOBpmaXNADmpoY0uabmgCQGg0wGlzQA09aSlam0wFpabS0AOopKWkMWikozQA6ikz\r\nRmgBaSiigBKKKKACiiigApKKKBBRRRQAUUUlMANNp1NoJYUUUUxBRRRQAUUUUAFFFFABSikpRQBI\r\nDTwaiFPBpDJAaWowacDQAtFFJSAWikooGLRSUUCFpabmlBpgLVd+tWKrv1oAQU6minUCCiiigBDT\r\nTTjTTQAlFFFMAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigApRSUooAfRRRSAKKKKAGnrSx/epp60+P71A0SilpMUtIAooopgJikxTqKQxu\r\nKUUtFABS0lLTEFFFLQAlLRRQIKQ0tJQMaabin0UhiAU6kpaYgooooAKRulFB6UAQ96KQ9aKChKSl\r\nNJQJiilpBS0AhaKKSkMWikooAWlpKKBi0UUUAFFJRQAtJmikoAWikzRQAUUUlMQUUUUAFLmkooAM\r\n0ZpKKBXDNGaSimK4uaWm0tIdxaKSloAKKSigBaKSkoC4uaM0lFMVxc0ZpKKAuOozSUUh3FpKcKCK\r\nAG0UUUALS02loGLmikpaAClpKKQC5opKKBi0UlFAC0lFFAgooooAKKKKYBRRRQISkpaSgTEooopi\r\nCiiigAooooAKKKKAClpKWgBRTqaKWkMcDTgajFOBpDH0tMzS5oAdRSZpaACiiigAoFFJQIdUD9am\r\nzUDdaYAKdTRTqBBRRRQAhpppxppoASiiimAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUopKUUAPooopAFFFFADD1p8f3qYetPj60DRLS\r\n02lzSGGaM0lFAC5pabS0ALRSUmaAHUtMzSg0AOpabS0xC0UlFAC0lFJQAUUUUhhRRRQAUUUUAFFF\r\nFMCFutC0sg5pFoGDCmVI3SmUCYLS0gpaAFpKKKBhRRRQAUUUUALRSUZpDFopKKACikopiCiiigAo\r\nopKBBS0lKBQAooNKKQ0hjaKKKZIlFFLTASilpKAFooopAFFFFABSUUUwCiiigQUUtFAwoopaQCil\r\npBTqRQ0im1IRTSKYDaKKKBC0UlLQAUUUUDFopKWgAooooAKKSloAKSiigBaKSloAKSlooEJSGlpD\r\nQJiUUUUxBRRRQAUUUUAFFFFABSikpRQAtFGKWkMKBRRQMXNLmm5opAPBpc0zNLmgB4NLTAadmgBa\r\nQ0tIaAGk1Gae1RmmhMUU6miloELRSUtACGmmnGm0AJRRRTAKKKKACiiigAooooAKKKKACiiigAoo\r\nooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKUUlKKAH0UUUgCiiigBh605Ot\r\nNp8Q5NA0SUUuKMUhiUUuKMUAFJTsUYoASkxTsUYoAZilAp+KMUBcSloxRTEFLRRQIQ0maDTaQx1F\r\nIKWgYUUUUAFFFFABS0UUxDJBxUa1M/3ahHWgaHGoz1p5NMNAwFLSDrS0CCiikoGFFFFABRRRQAUU\r\nUUAFFFFABRRRQAUUlFAgooooAKeBSAUtJjFpppaaaAEooopiCiiigQUUUUAJRS0UwEopaKAEopaK\r\nAEpaKKQBRRRQAUtFFAxRTqQU6kMKaRS0UAMNJTjTaYgooooAWikpaACiiigYUUUUAFFFFABRRRQA\r\nUUUUALRSUtAhKSlNJQJiUUUUxBRRRQAUUUUAFFFFABSikpRQA6ilAyKB1pFCGkqTbSbaQDKKcRSY\r\npgJRmjFFADgacDUdKDSAlBopgNOzQAhqI1IajNNCYopaQUtAgpaSloAaaQ0ppDQAlFFFMAooooAK\r\nKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigApR\r\nSUooAfRRRSAKKKKAGVLD3qKpoe9MY+jFLRSAMUYopaAEpaKKBBRRRQAUUUUAFFFFABRRRQAhpMU6\r\nkoGJRRRSAWiiimAUUUUAFFFFACHpUB61YPSq7daBoKSiigYDrS0gpTQISiiigYUUUUAFFFFABRRR\r\nQAUUUUAFFJRQIKKKKAClFFLQAopaQUUhhSGlpDQAlJS0UxCUUUUAFFFFABRRRQIKKKKACiiigAop\r\naKBiUtFFABRS4pQKBgKWiikAUUUlABSGlpKAG0UppKYgooooAWiiigAooooGFFFFABRRRQAUUUUA\r\nFLRRQIQ0lLSUCCkp4FNNACUUUUxBRRRQAUUUUAFLRRQMelKRzTVODUhpDFHSlpBSikIQik20+igZ\r\nGVpCKkxSEUARYoxUmKTFADBS5p22kxQAhphqTFRmmhMBTqaKdQIKKKKAENJSmkoASiiimAUUUUAF\r\nFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUo\r\npKcKAHUUUUgCiiigBlTQ96hqaHoaYEtFFJSAWiiigAooooAKKKKACiiigAooooAKKKKACiiigBpp\r\nKcaTFAxM0uaQ00mkMfmjNR7qXdQA/NLmo91G6gB+ahfrT91RscmmAlFFFAxRQaQUpoASiiigAooo\r\noAKKKKACiiigApKWkoEFFFFABRRRQAtLRRQMKWkopALRRRQAlJTqSmAmKKWkoEFFFJQAtFJS0AFG\r\nKKKACikooAWikpaAClpKKBjs0uaZRmgB1LTM0uaQC0UmaKACiikpgBpKWkoEFFFFAgpaSloGFFFF\r\nAwooooAKKKKACiiigBaSiigQUCg0lADs000tIaBCUUUUxBRRRQAUUUUAFOFIKUUDQd6kJqOlBpDJ\r\nRyKB1oXpR3pAOoo7UUCCiiigYmKMUtFACEU2nGmE0ABqI08mmGmhMBTqQUtAgooooAQ0lKaSgBKK\r\nKKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUU\r\nUAFFFFABThTacKAHUUUUgCiiigBlTQ9DUNTw/dNMCSiiikAUUUUAFFFJQAtFJRQMWiiigQUUUUAF\r\nFFFABRRRQAUlLRQA0imMKkprUhkJpM09hTKYBmjNJTgKACkp4WkYUDG0UUUAApTSCloGJRRRQAUU\r\nUUAFFFFABRRRQIKSlooASilpKAClFJS0AFLSUtAwpaTNGaQC0maTNJTsAuaKSigQtFJRQAtFJRQA\r\nUtJRQAUUUUAFFFFAgpaSigYtFJRQAtJRRQAUUUUCDNLmkooC4uaKSigdxaKSloASlopcUAJRS0lA\r\nwooooAKKKKACiiigAooooAKKKKBBSUtJQIM0lFFMQUUUUAFFFFABS0lFACilpKcKRSENApTSUATp\r\n0pG60IeKQnmgB46UlGaKQC0UUUAFFFIaAEJqNjTmNRk0AFJS0lMQopaQUtAgooooAQ0lKaSgBKKK\r\nKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFFFFABThTacKAHUUUUgCg0UHpQAyp4fu/jUFTw/d/GmBJRRRSAKKKKACkpaSgYUUUUALRRRQIKK\r\nKKACiiigAoopKAFpKKSgYUhpaQ0hkbUw1I1RmmIBUiioxUq0AOAprjinCkfpQMgpaKKAClpKWgYl\r\nFFFABRRRQIKKKKBhRRRQAUUUtACUUuKMUAJRS0lAgopKKADNFJRTELRSUUALRRSgUgEoxT8UUDsM\r\nxRipOKAKAsR4oqXbS7KAIaKlK0gUUBYjxS7TUu0UoAoCxDtNKEqXApM0AM2Uu0UpNJmgBNtNIp2a\r\nKBjMUU8ik20CsMop+2kxQKwlFLSUAFLSUtAxRS0CikMKQilooASiikpgFFFFABRRRQAUUUUAFFFF\r\nAgpKKSgQUUUUxBRRRQAUUUUAFFFKKAF7UClI4oFIpAaSnGmmgY5WxS55pgpc0CJKUGo91KDSAkzS\r\n1HmlzQA4mmk0hNIaAGk02n4pNtMQg6UlOxim0AKKWkFLQIKKKKAENJSmm0wCiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigApwptOFA\r\nDqKSlpAFB6UUHpQAypoj8tQ1IhwKGNE2aKYGpd1AWH0U3NGaAsLRSZpaACilpKACiiigAooooAWk\r\noooAKKKKAEopaKQCUhpaaaBkbUynMeabTEKKkWoxT1oAkFNk6Uopr9KBkdFFJQAtFJS0DCiiigAo\r\noooAKKKKACiiigApaSloAWlpBRSAQ0lONNpgJRS0UCExS4oFLQFhMUu2lpKAFwKKSlpDCiiigApQ\r\nabS0AOBpwNR5pc0APNJ0puaM0AOzRmm5ozQApNJmkooGFJS0UCEpaSigBaM0lFABRRRTASiiigQU\r\nCilFAC0UUUhhRSUUAFJRRTAKKKKBBRRRQAUUUUDCiiigQlJS0lMQUUUUCCiiigAooooAKUUlKKAH\r\nE8UgoNFIoXNJRRQMKDRRQIKM0mKKAHZpc02iiwDs0Cm0qmkBIBRigGloAYw4qM1Kw4qI00JiilpB\r\nS0CCiiigBDTacabQAUUUUwCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACnCm04UALS0lLSAKQ9KWkPSgBtPUcUypox8lDGhlGakK1GVpDD\r\ndShqYRRTAmBpwqFTUgNAh9FJmjNAC0lJmjNIYtFNzRmgB1GabupN1AD6KZuo3UAPopu6jdQA4mmM\r\naQtTCaYCHrSUUUCAU8GmUtAEmaaxpM0maBhSUtFACUtJRQAtFFFAwooooAKKKKBBRRRQMKKKKAFp\r\nabS0ALSGiikAlFLRTAKKKKAFopKKQBRSUUwFopKKAFopKKAFopKKAFozSUUALmjNJRQAtFJRQAtF\r\nJRQAtFJRQAUtJRQAtJRS0AJS0UtACYopaKQCUUUUAFJRRTAKKKKACiiigQUUUUAFFFFABRRRQAZo\r\nIzSUooEAFNNOzSGgBKKKKYgooooAKUUlLQNCmgUUopDCkpaKBiUCiigQ/HFIVp68ilxSAiIpMVIR\r\nTTQA2lAoAp4FMQoFOpMUtIBD0qA9anPSoD1poGKKWkFLQIKKKKAENNpxptMAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKcKbThQ\r\nAtLSUUgFpD0paQ9KAG1PF9wVBU8X3BQxjqQinUhpARMKYalaozQMQU8GmgU4CmA4GjNJRSAXNJSg\r\nUuKAG0lPxSEUAMJpM0rCmUwHZo3U2igVxc0ZpKKAuLmigU4CgYgWnbacBSikIZsoK1JSYoGRbaTF\r\nS4prCgBlFFFMYlFLSUCFopKWgYUUUUAFFFFABRRRQAUUUUAFFFFAC0UlLQAtJRRSAKSlpKYC0lFF\r\nABRRRQAUUlFAhaKSigBaKSigAooooAKKKKAClpKKAFpKKKACiiigBaKKKACiiigBRS0CikMKKKKA\r\nEpKWkpgFFFFAgooooAKKKKACiiigAoopKACiiigQGiiigBVGaGoBwaQnNACUUUUxBRRRQAUtFFIY\r\ntKKbTqBhQKKBQMDSUppKAJEPFPqJTzUlIQhphpxNNNAAKetMFPFAh1FFFACHpUB61O3SoD1poBVp\r\naQUtAgooooAQ02nGm0wCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigApwptOFAC0UUUgFpD0paQ9KAG1PH9wVBUinCihjRITSE0wtT\r\nd1IY4mkpM0ooAUUopKWgBaUCkzS5oAWikzRmgBaQ0maaTQANUdOJptNCYUUUUxBRRRSGKKeKaKcK\r\nQxwp1MFGaAH0ZpmaM0AOprdKXNNJoGMooNFMApKWkoEwpaSigBaKKKBhRRRQAUUUUCCiiigAoooo\r\nGFLSUtABS0gpaQBSUtJigBKKWimAlFLRQA2ilooEJRRRQAUUUUCCiiigAooooAKKKKACiiloGFFF\r\nLQAlFLilFAxMUuKWikAUUUlABSUUUAJRRRTEFFFFABRRRQAUUUUAFFFFABSUUUAFJRRTJFopKWgA\r\npKKKACiiigAooooAWiiikMWlpKUUDA0Cg0ooGBptOpDQAlPB4plKKBDiabTsUYpAAFOFAFLQIWii\r\nigBG6VAetTt0qA9aaAUUtIKWgQUUUUAIabTjTaYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU4U2nCgBaKKKQC0h6UtIelADaeB\r\nxTKmQfKKGNEZBpMVMRTCKVwGCnCkxRTGLmjNNzRmgB2aM03NGaLAOzRupuaSiwXHZpM0lFAhaMUo\r\np1AEeKKeRTaAEpaSlFACinCminA0hi0lLSUDCiiigAoPSikNADaKKKYBSUtJQJhRRRQAUtJSigAo\r\noooGFFFFAgooooAKKKKACiiigYtFFFAC0UlLSAKKKKAEopaKAEpMU6jFADaKXFGKYDaKWjFAhKKd\r\nijFADaWlxS4oAbRTsUYoGNxS4p2KMUgExRS0UAJS0UUAFFJRQAtJRRQAlFFJTAKKKKBBRRRQAUlL\r\nSUAFLSUUAFFFFABRRSUCCiiimIUUUUUgEooopgFFFFABSikpaBi0lFLSGFFFFAxadSLTqAExQRTq\r\nCOKAIjQOtOIptAEo6UuKROlOoEJS0lApCFoopaAGt0qA9anbpUB600AopaQUtAgooooAQ02nGm0w\r\nCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK\r\nKKKACiiigApwptOFAC0UUUgFpG6UtI3SgBtTp90VBUq/dFDGh9IRS0UhjMU0ipcUjCgCE0lOIpMU\r\nxCUUYpcUAJRTtpo2UANpadspNtAAKdTQKWkMU000tJigBKUUmKKYC0UlFADs0opopwFIYtJRiikA\r\nUhoopgNNFFFMBKKKKBBRRRTEFFJS0gFopKWgYUUUlABS0lFAC0UUUAFFFFABS0lFAxaWkpaQBRRR\r\nQAUtJS0AFFFFABSYpaKAExRS0hoAKWkFLQAUUUUAFFFFABS0UUAJRRRQAUUUlABRRRQAlFFJTAWk\r\noooEFFFJQAUUUUAFFFFABRRRQAUUUUCCkoopiCiiigBaWkpQKQxKSlNGKYCUUUtABRRRSGFLQKKB\r\nhRRRQA5KkqJTzUgoELRRRSAYaYakamGmMchp5qJTg1L2oEITQDTWpM0gJM0ZpgNFACseKiNPPSmU\r\n0JiilpBS0CCiiigBDTacabTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACnCm04UALRRRSAWkbpS0jdKAG1Mo+UVDVhR8ooY0FKK\r\nMUtIBKDS0lMCMijbT8UuKQDNlG2pMUlADdtLilooAMUhFOpKAGEUmKfRSGMxS4p1FADMUbafiigB\r\nm2jbT6KAGhaXFLRQAmKaRTzTDQA00lKaTFMBKKKKYwpKWigBKKKKCRKKKKYC0UCikMWiiigYlLSU\r\nUCFopKWgAoopKAFopKWgApaSigY6ikopALRSUtAC0UlGaAFoozSZoAWikooAKKKSgYtFFFABS0lF\r\nAC0UmaM0CFpKKKACikooAKKKSmAUUUUCEooooAKKKKACiiigQUUUUDCiiigQUlLSUwCiiigQUUUU\r\nAKKUGkopDFNFJT05FAxlFKwwaSgApaSloAWkpaSgYUUUUAFSKeKjp6GgB9FFFIQjVGakNMNAxtSA\r\n8VHTlNMBWplPamgUCFAp2KBThSENYcVEambpUJpgKKWkFLQIKKKKAENNpxptMAooooAKKKKACiii\r\ngAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKcKbT\r\nhQAtFFFIBaRulFDUANqyv3R9KrVZX7ooGLRRS0AJRRRQAlLSUUgFpKM0maAFopM0UDFpaSigQUUU\r\nUDEooooAKWkopAFLSZooAWkoppNACk000hNFMAxSgUopRQBEwpKlccVFTGFFJS0AJRRRQISilpKY\r\ngpaSigBaKKKQwooooAKKKKACiiigAooooAWikpaACiiigYtFJRQAtFJRQAtFJRQAuaWm0UALRSUU\r\nALRSUUALmjNJRQAtJRRQAuaSiigAooooAKKKKBBSUUUAFFFFAgooooAKKKKACiiigAooooASiiim\r\nIKKKKACiiigBRSkUCnYpFDKcpwaSkoAc1JQaKACgUUUDFpKXNJQAUUoGaDQAlOU802gUATUUg6Ut\r\nIBKa1OpDQAw0lKaSmBIORSUIaDSEKDS5pmaUGgBWPFRGnk8Uw0xMUUtIKWgQUUUUAIabTjTaYBRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAU4U2nCgBaKKKQBSGlpDQAlWh0FVatDoKBhRRRQAUUtJQAhphNPNRtxSGLmjNMzS0AOzRm\r\nm0UAPzRuqPNJuoAk3UZqPNANFgJc0ZqPNLmgB2aN1MJpuaAJN1G6o80ZosFyQtTS1MzRTsFxc0oN\r\nNoBoESg0uajzS5pDHnmo260u6kNMBKKSloGJRRRQIKSlopiEopaSgBaKSloAKKKKBhRRRSAKKKKA\r\nCiiigAooooAKWkooAWikooAWikooAKKKKAClpKKAFopKKAFopKKAFopKKACiiigAooooAWkoooAK\r\nKKKACiiigQUUUUAFFFFABRRRQAUUUUAFJS0lABRRRTEFFFFABSikpRQMdilFHakpDEPWkoNFAC0l\r\nLSUALRSUtABRSUtACrQaSigYUUUtACqadmmCnUAOpDSZopANNJSmkpgKDSmm07tQAhpM0GkoEKTT\r\naWkoEOFLSCloEFFFFACGm0ppKYBRRRQAUUUUAFFLRQAlFLRQAlFLRQAUUUUgCiiigAooooAKKKKA\r\nEooopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFOFNpRQA6ikpaQBSGlpDQAlWh0qqKsjpTGLRRR\r\nSAWkoozQAVG1PJpjUhjKKMUuKACilxSYoAQ02lNJTQgpaQUtAxaKKWkA0im1KRTCKYhtFFFMQUUY\r\npQKQxMUYp+KMUXCwyin4pMUANozS4pMUAFFFFAwooooAKKKKACkpaSmIKKKKAFopKKAFopKKAFoo\r\nopAFFFFABRRRQAUUUUAFFFFABRRRQMKKKKACiiigAooooAKKKKACiiigAooooAKKKKBBRRRQAUUU\r\nUAFFFFABRRRQAUUUUAFFFFABRRRQAUlLSUxBRRRQAUUUUAFFFFAx60GkBopDA0lKaSgBaSlpKACl\r\npKKACnCm0tACkUlLmkoGFFFFABThTactAC0UtGKQDTSGn4pCKAGUopCKUUwA02nkZppFBIlJSmkp\r\niHCikFLSAKKKKAEpKWkpgFFFFABRRRQAtFFFIAooooAKKKKACiiigAooooAKKKKACiiigBKKKKYB\r\nRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSikpRQAtFFFIBaQ0tIaAEFWRVYdas0DQtFJS0AJRRRQA\r\nhpppxpKQxAKXFKKKAExQRS0UAMIphFSmmkUAMopSKSgBRSim04UAOppFPpDTEREUYpxFAoAQClpQ\r\nKWkMSiijNABSUZooAMUmKdSUAJikIp4oYcUwGUlFFABRRRQAUUUUwEooooEFFFFABRRRQAUUUUAF\r\nLSUUALRSUtABRSUUALRRRQAlFLRQAUUUUAFFFFABRRSUALRRSUALRSUUALRRRQAUUUUAFFFFABRR\r\nRQAUUUUgCiiigAoopKAFooooAKKKKACkpaSmIKKKKACiiigAooooGKKWkpaQwpKWkoAWkoooAKKK\r\nKACloooGFFFFABRRRQAtA60lFAEgpaap4p1ABTTTqQ0hDaMUZozQMdikNANITQIQ0ynE02mJiilp\r\nBS0CCiiigBKSlpKYBRRRQAUUUUALRRRSAKKKKACiiigAooooAKKKKACiiigAooooASiiimAUUUUA\r\nFFFFABRRRQAUUUUAFFFFABRRRQAUopKUUALRRRSAWkNLSGgBB1qzVYVNmhjQ7NGaYTSbqQyTNFMD\r\nUuaAHUlFFAC0UlFAC0UlGaACg0ZpKAEIpMU6koAbSig02gB+aM0zNGaYCmgUmaAaQD6KbmlzQAhp\r\nKCaSgBc0maSimA7NGaSigBwNDHim0GgBKKKKACiiigAooooASiiimIKKKKACilpKACiiigAooooA\r\nKKKKACiiigAooooAWikooAWikooAWikooAWiikoAWikooAKKKKAFopKKAFopKKAFopKKAFpKKKAF\r\npKKKACiiigAooooAKWkpaACiiikAUlLSUxBRRRQAUUUpoASlpKKBhS0lKKAFooopDCkoooAKKKKA\r\nFooooGFFFFABRRRQAUUUUAOU07NR07NADs0hNNooAKKSnCgBKQmlJppoEFJS0lMkUUtIKWgAooop\r\nAJSUtJTAKKKKACiiigBaKKKQBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACUUUUwCiiigAooooAKKK\r\nKACiiigAooooAKKKKAClFJSigBaKKKQBQaKQ0AFSVGKkxQxoQ02nEU00DFFOFMpwpAPFFJQKAFpa\r\nSigAooooAKKSloAKSlooAaaaaeaYaBDaKKKYBS0lFADs0maKKBhSUtJQIKKKKACiiloAKKKKBiUU\r\ntFACUUUUAFFFFMAooFLQAlFFJQIWkoooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigQUUUUAFFFFABRRRQAUUUUDCloopAFFFFABSUtJTAKKKKB\r\nBSmkooGFFFLQAlKKKKAFooopDEooooAKKKKAClpKWgYUUUUAFFFFABRRRQAUtJRQAtFFAoAWilpp\r\npAIaBRQKYARTae3SmUEiilpBS0xBRRRSASkpaSmAUUUUAFLSUtABRRRSAKKKKACiiigAooooAKKK\r\nKACiiigAooooASiiimAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUopKUUALRRRSAKQ0tIaAAdalq\r\nIdamoY0NNNNPNNNIBtOFJSimAopabmjNIY7NFNzRmgB9FNzRmgB1FNzS5oAWikzRmgANNNKTTCaA\r\nENFFApiFApcUq07FAxmKMU/FGKAI8UVJikKUAR0op22lAoAQLShKXNJuoACAKbSmkoKA02lpKBMK\r\nKKKYgFLSUUAFFFFAhKKKWgBKKWkoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKBBRRRQAUUUU\r\nAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQMKWiikAUUUUAFFFFABRRRQAlFFFMAoopa\r\nAEpaKKACiiigBaKBRikUFJS0lAgooooAKWkooAWiiigYUUUUAFFFFABRRRQA4UUgpaAFppp1IaAG\r\n0UUtAA3SmU89KZTJYopaQUtAgooopAJSUtJTAKKKKAClpKWgAooopAFFFFABRRRQAUUUUAFFFFAB\r\nRRRQAUUUUAJRRRTAKKKKACiiigAooooAKKKKACiiigAooooAKUUlKKAFooopAFIaWkNAAOoqaoR1\r\nqWgaCmmlpDQAlFFLSASkp1JTASilpKADNGaMUoFAwzS0AU4CkAlGKdiigBpFNIqSmmgCOgCnEUAU\r\nxCinCkopDHUUzNLmgY+mk0hNNJpjHZozTQaWgAJzQBQKXFMBKSnEUAZpANIpKkxTStMQ2kNLQaBD\r\naKWigQlFFFABS0lFAC0lFFABRRS0AJRRRQAUUUUCCiiigYUUUUAFFFFABRRRQIKKKKBhRRRQAUUU\r\nUCCiiigAooooAKKKKACiiigAooooAKKKKBhRRRQAUtJRQAtFFFIAooooAKKKKACkpaKAEpRSUopg\r\nBooNFIAooooGKKWm08UDEpDTqaaAEooooEFFFFAC0UUUDCiiigAooooGFFFLQIQU+m0ooAWkoopA\r\nJRQaSmMCabTjTaZDFFLSCloEFFFFIBKSlpKYBRRRQAUtJS0AFFFFIAooooAKKKKACiiigAooooAK\r\nKKKACiiigBKKKKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSikpRQAtFFFIApDS0hoAB1qTNRCn\r\nUDQ7NJmkooAWikooAWikooAKUCilAoGKBRilFLSATFLSUtAC0UmaKACkNFIaACikpQaACg0tJTGJ\r\nRRRigYlJTsUpFADRQRTlFDntQA0Gn5xUdOBpiHMaaDQTmigY7NNJopKAENFLSUgEooopkhSUUtAh\r\nKKWigBKKWkoAKWkpaACiikoAWkopaAEopaSgAooooAKKKKACiiloASiiigAooooAKKKKACiiigAo\r\noooAKKKKBBRRRQAUUUUAFFFFAwooooAWikpaACiiikAUUUUAFFFFABRRRQAlKKSlpgLSUUUhhRRR\r\nQAU4Gm0ooAWkNLSGgYUlFFAgooooAKWkooAWikpaBhRRRQAUUUUALQKSloAWigUtIBppKcabTAQ0\r\nlKaSmSxRS0CigQUUUUgEpKWkpgFFFFABS0lLQAUUUUgCiiigAooooAKKKKACiiigAooooAKKKKAE\r\nooopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFKKSloAWikpaACkNLSGgBBTqaOtPpDCjFFFIBKK\r\nWkpgFKKSlFAxcUtApaQBRmikoAKWiigBaKKSgApppTTSaADNApKcBTGLRRRQMKKKSgYuaSg0CgBw\r\n4FMPWgmgUCFxxSU7NNoAKKUCigAoopKAFpDRS0wG0lKaMUCY2lpKKCRaKKKACiiigAxS4oozQMSi\r\niigAooooAKKKKBBSUtFACUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUtJRQAtJS0UAJRS4pKACiii\r\ngAoopaAEoopaACiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUwCgUUUALRRRSKEooooJCi\r\niimAUUUUhhS0lFAxaKKKAAUppKWgBKWkooAdS00UtIBaaaWkNMBDTaU0lMli0tJS0CCiiikAlJS0\r\nlMAooooAKWkpaACiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAlFFFMAooooAKKKKACiiigAoo\r\nooAKKKKACiiigApaKKACiiigBaQ0UUAA60+iikxoKMUUUhhSUUUAJSiiimA4UtFFIAooooAKWiig\r\nAppoooAQ0lFFAxQKWiimMKSiigYUmaKKACjtRRQISloooAWjFFFAxaSiigQUGiigBKXNFFACUCii\r\nmA00lFFBDCiiigApaKKACiiigYUUUUAFFFFIAooopgFFFFABSUUUCCiiigAooooAKWiigBKKKKAC\r\niiigAooooAKWiigAooooAKKKKAEooooAWiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAF\r\nJRRTAKKKKAFpaKKBiGiiikAUUUUxBRRRSGFFFFABS0UUDCgUUUABooooAKWiigAooooAaaSiimSx\r\naWiigQUUUUAJSUUUAFFFFABS0UUAFFFFIAooooAKKKKACiiigAooooAKKKKACiiigD//2Q==', 'asha1', '2016-02-18 18:21:44', 'asha1', '2016-09-12 18:21:44', 'wasqfrtgyhug');
INSERT INTO `hm_patient` (`Patient_id`, `PinCode`, `Village_id`, `City_id`, `District_id`, `State_ID`, `Country_ID`, `Card_Type_id`, `Gender_Id`, `Cast_Category_Id`, `Patient_Salutation`, `Patient_FName`, `Patient_MName`, `Patient_LName`, `Patient_DOB`, `Patient_Age`, `Patient_Language`, `Patient_POB`, `Education`, `Patient_BPL`, `Patient_Marital_Status`, `Patient_Contact`, `Address_line1`, `Address_line2`, `Patient_Emergency_number`, `Patient_Ward`, `Patient_Image`, `Created_By`, `Created_Date`, `Updated_By`, `Updated_Date`, `Card_Number`) VALUES
('asha6789', '41001', 9, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Shila', 'Haris', 'Pansare', '1991-09-08', 25, 'Marathi', 'Satara', 'Literate', 0, 'Married', 4294967295, 'Satara paragji app', '', 4294967295, 'Df', '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAKBueIx4ZKCMgoy0qqC+8P//8Nzc8P//////////////\r\n////////////////////////////////////////////2wBDAaq0tPDS8P//////////////////\r\n////////////////////////////////////////////////////////////wAARCAPIBRADASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwCaikpa\r\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigApKWkoASilpKAEpjU+mNQBEetFBooAKKKKACii\r\nigBKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiii\r\ngAooooAKKKKACnK2KbRQA5uaQHFFFACls0lJRQA4GjNNpaAJENONRpUtAxhpMUrDFIpoAb0pwNKR\r\nmgCgAzThTaUUAOAooFBoATNFNNIDSAfRQORRQAUhFLRQA0nFAahhTcUAP3U4GouRSg0ASGkoFFAC\r\n0hFFLQAwikxTiKaeKYCYpynFIDmnAUALSGiigBtG6nY4qMikBKtOxTENPpgJS0maWgBKKWkoAQik\r\np1NPWkAopaQUGgBaRqBSnkUANBp9MHFPBzQAhpKU0UAJS0UUAJRQaBQAtFJSigBDRQaTNAC000+m\r\ntTAFNPqIdakHSgAIptPNNNAAKSjOKaTzQA8UEUiGnGkA0U4U2lFAC0hFOpDQA2ilxRigBBTqbS0A\r\nFJS0lACEU3FSUhFADRTs0hFJmgB4opBThTAik602nSfeptAhKKKKACiiigAooooAKKKKACiiigC3\r\nRRRQAtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAlJS0lACUxqkpj0AQ96KO9FABRRRQ\r\nAUlLRQAlFLSUAFFFFABRRRQAUUUUAFFLSUAFFFFABRRRQAUUtJQAUUUUAFFFFABRRS0AJS0UUAJR\r\nS0UAJRS0UAJRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAD061LUK9amWgBrU2ntTKBjgaWmUucUAKaQ\r\nUZzSgUALSZpaaaAF60hFKDTqQDAcU4c0EUAUAFFLSUAIaBQaBQApFN20+igBBQaWkNAAKWkFLQAl\r\nIwpaQ0wGAc1IKQClpAIaWiigApMUtFADRwadnim45p3agBhbmnq2RUTdaVDzTAlpu7mnDpUbdaAJ\r\nM5opqmnGkAlLSUtABRSUooAa1CtSt0qPoaYEvWikWloAKKKKAA0lBNAoAKcKbThQA1qSnEUmKQBS\r\nHpS0hpgNHWpB0po60+gANJilopAMaoz1qU00rQAIakqMDFPFMBDSU40mKAFFFJRQAZpaSjNIAxRR\r\nmloASkp1JQAUUlKKAEIprU+mNTAAacDTAKU0gGscmm0p60lMQUUUUAFFFFABRRRQAUUUUAFFFFAF\r\nuiiigBaKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBKKWkoASmPT6jegCKiiigAooooAK\r\nKKKAEopaKAEopaSgAooooAKKKKACiiigApaSloASilpKACiiloASilooASloooAKKKKACiiigAoo\r\nooAKSlpKAFpKKKAClpKWgBKKWigBKKWkoAKKKKACiiigBRUqtUNKDigCZjxUR607dxTaBig0hoop\r\nAKpqTtUXSng5oAWgiiigBKcKTFLQMWkoopiFpKWikA2lFIaBQA6iiimAU006kNACiigUUgCkpaKA\r\nEopKWgYUUUUCCkNFLQAUhpaMUAMK00cGpaZimBIvSmP1pymgjNADFp/agClIoAQUE0UhoAM0tNFO\r\nPSkAtMZaUHmnHkUwGIeakqPGDT1NAAaKU0lACEUClooAQ0qmmmlWkA6kpabQAUEUtFACDinU2loA\r\nKKKKAENAopKAHcUU3NANMB1FJRQAGikNANAC0lOooAbTqSikAtFJRQAUlLRQAA01qWkNAAKQ0ooY\r\nUAR0lKaSmIKKKKACiiigAooooAKKKKACiiigC3S0lFAC0UUUAFFFFABRRRQAUUUUAFFFFABRRRQA\r\nUUUUAFFFFABSUUUAJTHp9MegCE0UUUAFFFFABRRRQAUUUUAJRRS0AJS0UUAJRS0lABRS0UAJRRRQ\r\nAUUUtABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAlFLRQAUUUUAFFFFABSUtFABRRSUAFFFF\r\nABS0lLQAUtJRQAtFFFAwpymm0opDJKSgUtABRSUtMAooopALRRRQIaaUUhpRQMWiiimIKSlpKAFo\r\noopAFFFFACUUUUDCiiigAooooEGKKKKACiiigBo4pwNBpmaAJBS01TTqAEoIopaYDAMUtBoFADSO\r\nacDQRSDrQAppAeadTSOaAH0lA6UUAFFFLQA2gUtFIBe1MNPpjCgAFLTRTqACiikoAdSGiigAFBoo\r\noAaRSZxT6aRmmAA04UzGKUGkApoFIaF60wFpQaKSgB2KSjNGaQBSUppKBi0UlKKBBSEUtFADRxTu\r\nopDSZ4pgRnrSUp60lAgooooAKKKKACiiigAooooAKKKKALdFFFAC0UUUAFFFFABRRRQAUUUUAFFF\r\nFABRRRQAUUUUAFFFFACUUUlABUb1JUb0wIqKKKQBRRRQAUUUUAFFFFABSUUtACUUtJQAUUUtACUt\r\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUU\r\nUAJRRRQAUtJS0AFFFFAC0UUUhhSjrSUUASCikFOoAKKKSgBaKKSgY6iiigQ00q0GgUDFooopiCk7\r\n0tJ3oGLRRRSEFJS0hoAKWkpaAEopaSgAooooAKKKKACiiigApCKUUpoAjzg09TmmEUKcUAS0UgOa\r\nWmAlJ3p1JikAlJ3p2KaaAHjpSGkBpaYBRTScUA80gHUtNzSg0ABpAaU02gB9JSZpaAG4paWm0ALR\r\nSiigBKKKTNAC0UUtACUYopaAGtTcU80mKADFKBRRQAUUUUDENIM06igApDRRQAAUHilpDQAA0tIK\r\nWgQlIadSHpTAiNJSmkoEFFFFABRRRQAUUUUAFFFFABRRRQBbooooAKWkooAWikpaACiiigAooooA\r\nKKKKACiiigApKWkoAKKWigBKSlpKACo3p9RvTAjooopAFFFFABRRRQAUUUUAFFFJQAtFFFABRRRQ\r\nAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB\r\nRRRQAlFFFABS0lFAC0UUtABRRRQMKKKKAHLT6ip60gFpaKKYBRiijNAC0lLSUABoFFAoGOpKWkoE\r\nFJS0lIBaKKKACiiigBKKKWgApKKKACiiloASilpKACiiigYUUtJQIQ0w1JTSKAEQ1JmogKfQAuaW\r\nm0tAC0hFGaWgBg60+jFFADWFJTqSgBKUGikoAfSUCigApc0lFAC0lIKdQAlFLSUABpmafTGFAxwN\r\nOqNTT6AFopKWgBDRRRQAUUUUAFFFFABRRRQAYooooAKQ0tJQAoooopoApD0paQ9KYiI0UUlIQUUU\r\nUAFFFFABRRRQAUUUUAFFFFAFuiiigAoopaAEpaKKACiiigAooooAKKKKACiiigApKWkoAWiiigBK\r\nSlpKAENRvUhqN6AI6KKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAEooooAKKKWgApaSigBa\r\nKKKACiilAyKQxKeKZSg0ASUUgpaYBRRS0DCkpTSUCClFJSigYtJS0lAgpKWkoAWikopALSUtBoAK\r\nSiloAKSiloASlopKACiiigAooooAKKKKBhSUtFACYopaKAAUtJRQISlFFFMYtFJRQAUYpaKAEpCK\r\ndSGkAgpaSloAKKKKBC0UmaKAFpKWkoAKQilooGNxThRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRQa\r\nKACkpaSgApaSlpoApG6UtI3SmIipKWkpCCiiigAooooAKKKKACiiigAooooAuUlLRQAUUUUAFFFF\r\nABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACGkp1JQA2mPUlRvTAiooopAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAJRRRQAUtJS0AFFKKDQAlLmkpaACnCm0UhgetA60tFADxSimrTqAA0A0UAUAL\r\nTadSUAFKKSlFAxaSlNJQIWm0tJ3oAWkpaSgBaDRSGgApaKSgApaKSgBaKKSgApaSloAKSiigYUUU\r\nUAFFFFABRRRTEFFFFIYUUUUwCiiigBaKSloAKKKKQCUUppKACiiigAFFFFABRRRQAUUUUAFFFFAB\r\nRRRQAUUUUAFFFFMAooopAFLRRQAlFFFABSUtFABRSUtABSN0paR+lUIioopKQgooooAKKKKACiii\r\ngAooooAKKKKALlFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFJS0hoAQ1G9SVG9\r\nAEVFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACUUtJQAUtJS0AFLSUtACUtBozQAUoopKQ\r\nwooooAcKf2qOnrQAtAoNIKBjjSUtJQISnCm04UALSUtJQAtNp1JQAUnelpO9ADqQ0tIaYCUtJS0h\r\nhRRRQAlLSUtABSUUUAFFFFABRRS0AJRRRQAUUUUAFFFFABRRRQAUUUUwFopKUUALSGiigBKKKKQB\r\nRS0lABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRTAKKKKQC0UUUwEooooAKKKKQCUtFFABTX6U\r\n6mv0qhEdJS0lIQUUUUAFFFFABRRRQAUUUUAFFFFAFyiiigAooooAKKKKACiiigAooooAKKKKACii\r\nigAooooAKKKKACg0UUANNRvUhqN6BEVFFFAwooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigApKWi\r\ngAooooAKWkooAWikooAWg0UUAApaSigBaUGm0tAyQc0YpAaXNAC0lLSUgEp60ynigANFBoFMApKW\r\nkFAAaQdacaTvQAtJS0hoAKKKKQwooooAKKKKBBSUtFAwpKKWgAooooAKSlpKACiiigAooooAKKKK\r\nAAUUtJQAUtJSigAopaQ0xCGiiloGFFFFACUUUUgCiiigAopaSgAooooAKKKKACiiigAooooAKWko\r\npgLRRSUAFFFFABRRRSAKSlpKAFpr9KdTHpiGUlLSUCCiiigAooooAKKKKACiiigAooooAuUUUUAF\r\nFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAIaiepTUL0CI6KKKBhRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUU\r\nUAFFFFABRRRQAUUlLQAUUUUAFFFFABRRRQAUlLRQAUUUUAFFFFABRRRQAoopKKAHZpymmUoNAySi\r\nmg0uaACnCm08UABoFBoFABSUtJQAtJS0UAFJS0lABRRQKQBRRRQAUUUCgYUUUUAFFFFABRRRQIKS\r\nlpKBhRRRQAUUUUxBQKKKQwNFAooAKWkpaACilpKYhDQKKWgYUUUUAJS0UUAJS0UUgCiiigBKKWig\r\nBKKWkoAKKWigBKKKWgBKWkpaACiiimAlFFFABRRRSASilopAFMen0x6oBlJS0lBIUUUUAFFFFABR\r\nRRQAUUUUAFFFFAFyijNFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACGonqU1\r\nC9AiOlpKKBhRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUlAC0UlFABRRS0AJRRRQAtFFJQAtJS0UAJS0lLQAUUUUAFFFFABRRR\r\nQAUUUUAFFFFABRRRQAtKDTaWgY+niogakBoAdQKSlFAAaQUtIKAFooooAKKKKAEopaSkAUUUUwCi\r\nlpKQBRS0lABRRRQMKKKKBBSUtFAxKKWigApKWimAlFLiigAooooASloooAKKKKBBRSUtIYUUUUAF\r\nFFFMAooopAFFFFMAooopAFFFFACUtFFACUtFFACUUUtABSGlpKYBRRRQAUUUUgCiiikAUx+tPqN+\r\ntMBtJS0lMkKKKKACiiigAooooAKKKKACiiigC2KWkpaACiiigAooooAKKKKACiiigAooooAKKKKA\r\nCiiigAooooAKKKKAENQvUxqGSgRHRRRQMKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAEooooAKKKKAClpKKAClpKKAFoopKAFoooo\r\nAKKKKACiiloASilooGJRS0lAgooooAKKKKACiiigApaSigBacpplLQMkBpwqIGpAaAHUlFFAC0UU\r\nUAFFFITQAtFIKKQC0lAooAKKKKACiiigAooooAKKKKACiiigYUUUUCCiiimAUUUUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUgCiiigYUUUUAFFFFACUtFFABSUtFACUUtFACUUtJ\r\nQAUUUUAFRv1qSo360CG0lLSUxBRRRQAUUUUAFFFFABRRRQAUUUUAWxS0lLQAUUUUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAhqF6lNRPQBHRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUtJQAUUtJQAUUUUAFJS0UAJRRRQAUUUUAFFFFAB\r\nRRRQAUtFFABRRSigAopcUYpDEop2KMUAJRS4oxQMTFGKdilxQIZijFPxSYoAZikp5FNxQAlFFFMQ\r\ntJS0UAJRRRQAopymmUoNAyQGnUwGnCgB1FJS0AFJS0lAAKKKKQAKKKKACiiigAooooAKKKKACiii\r\nmAUUUUgEpaSloGJS0UUAFFFFABRRRQAUUUUwCiiigQUUUUAFFFFIAooopgFFFFIAooopgFFFFIAo\r\noooAKKKKACiiigYUUUUAFFFFABRRRQAUUUlABS0lFAC1E/WpKjfrQIbSUtJTEFFFFABRRRQAUUUU\r\nAFFLSUAFFFFAFyiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBpqF6mNQv1\r\noEMooooGFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUtFABRRR\r\nQAUlFFABRRRQAUUUUAFJS0UAJRRRQAUUUUAFFFFAC0tIKdSGJilApcUuKAAClxQKWgYUmKWigAxR\r\niloxQAlFLRQISilooAaRSEU+kIoAjxTTUhFNIoAbSijFFAgIpKU0lMAooooAcDT1NRinKaBklBpM\r\n0UAGaKb3pwpALRSUUALRRRTAKKKKACiiikAUUUUwCiiikAUUUUAFFFFAwooooAKKKKACiiigAooo\r\noAKKKKBBRRRQMKKKKBBRRS0wEopaKACkpaKAEooopAFFFFABRRRQAUUUUAFLSUUDCkpaKAEopaKA\r\nEopaSgAooooAKibrUtRN1oEJSUtJTEFFFFABRS0UAJRRRQAUUUUAFFFFAFyiiigAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACkpaSgBDUL1K1QN1oASiiigAooooAKKKKACiiigAooooAK\r\nKKKACiiigAooooAKKKKACiiigAooooAKWkpwpAGKSpNtNxQA2inYpMUANop2KQimAlFFJQAtFFFA\r\nCUtJRQAUUUUAFFFFABS0lLQACnCkFOApDFFLRS0DClpKWgAopaKBBRS0UAJRS0UAJRS0lABRS0lA\r\nDSKaafSEUAR0lPIppoAbRRRTEFFFFABSg0lFAEgNLmmA06kMKUU2nCgBaKKKAFooooAWkoooAKKK\r\nKACiiigAooooAKKKKACiiimMKKKKQBRRRTAKKKKACiilpCCkpaSgAooooAKKKKACloopgFFFFABR\r\nRRQAUUUUAJRS0lABRRRQAUUUUgClpKKBhRRRQAUUUUAFJS0lABRRRQAVE3U1LUR60xCUlLSUCCii\r\nigAooooAKKKKACiiigAooooAuUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAlFL\r\nSUANaoG61O1QN1oASiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAW\r\nlFJThSAeOlIaUdKQmmAlFGKKAEpCaU000AJRRRQAUUUlAC0lFFABRRRQAUUUtABRRTsUhgKcKTFK\r\nKBi0tJS0ALRRS0AFLRRQIKKKKYBRRRSAKKKKACkpaSgApKWkoAaaaRUlIRQBERSU8imUAFFFFMQU\r\nUUUAKKdSAcU6kMSnCjFFAC0UlLQAtFIKdTAKSlooAKKKKACiiigBKKKWkAlFFFABRRRTGFFFFIAo\r\noopgFFFFABS0lLQIKSlpKQC0lFOAoASilpKAClpKWmAUUUUAFFFFABSGlpDQAUUlLQAlFFLQAlFL\r\nSUgClpKWgBKKKKACiiigYUlLRQAUlLRQAh6VCetTHpUJoEFJS0lMQUUUUAFFLRQAlFFFABS0lFAB\r\nRRS0AW6KKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKSgBrVA3Wp26VAetACUU\r\nUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABThTactIB4pDS0UwEoNF\r\nIaAENNpTSUAJRS0lABRRRQAUUUUAFFFFABS0lLQAopwpopwpFC0tJS0AKKKKKAFpRSUUAOopKWgQ\r\nUUlANAC0UUUAFFFFABRRRQAlFFFACUlLSUAIRUZ61KaYwoAZRRRTEFFFAoAeKWm0oNIY6iikpgKK\r\nWkFOFIApaSimAtFFFABRRRQAUUUUAFFFFIApKWkoASloooGFFFFAgooopjClpKWgQUUlLQAUlLRQ\r\nAYpaSloAKSlooAKKKKACiiigAooooAKQ0tJQAUUUUAFFFFABQaKSkAUtAooAKKKKACkpaKYCUUUU\r\ngCiiigBD0qE1M3SoaYBSUtJQIWkoooAKKKWgBKWiigBKWiigBKKKKALlFFFABRRRQAUUUUAFFFFA\r\nBRRRQAUUUUAFFFFABRRRQAlFLSUAFFLSUANaoD1qdulQN1oASiiigAooooAKKKKACiiigAooooAK\r\nKKKACiiigAooooAKKKKACiiigAooooAKeKZTgKAH0UCigBD0pppxpKAG0lOxRigBtJSmkoAKKKKA\r\nCiiigAoopaAClFJTqQ0Ap1JSikMWiiimAtFFLQAUUUUALS00U6gQhpKdTaAFpaQUtABRRRQAUUma\r\nM0AFFGaTNABRSZpaAEpCKdSGgCIikqRhUZpgFFFA60CHYpcU4dKMUhgBS4oFLTASloooAWkpaKAC\r\niiigAooooAKKKKACiiigApKWkpAFFIKWgAooooAKKKKAClpKKYC0UlLQAUUUlAC0tJS0AFFFFABR\r\nRRQAUUUUAFFFFABSUtJQAUUUUAFFFFABSUtJSAKWiigAooopgJS0UUAJS0UlABRRRSARulQ1K33T\r\nUVMApKWigQUlLSUAFLRRQAlFLRQAUlFFABRS0UAW6KKKACiiigAooooAKKKKACiiigAooooAKKKK\r\nACiiigAooooASiiigBrdKhfrU5qB+tADaKKKACiiigAooooAKKKKACiiigBaSloIoASiiigAoooo\r\nAKKKKACiiigAoopaAEp602lFAD6KBRQAlJTqSgBKWjFB4oAjPWkpTSUAFFFFABRRRQAtFFLQAClp\r\nKKQxc0uabRQMXNLmkApQtABuo3Uu2kK0ALupQ1RkUUASg0uaiBpQ1AEuaSmg0tACigmimmgB26ml\r\nqSmmgB2+jdTcUoFAC5opQKWgBtANOpMUALmim4pRQApqJhg1LTHFMQylFJQKBEopaaKdSGLRSUtA\r\nBRRRTAWiiigAooooAKKKKACiiigAooooAKKKSkAUUUUAFFFFABRRRQAUUUUwFopKWgAooooAKWkp\r\naACiiigAooooAKKKKACiiigApKWkoAKKKKACiiigApKWkpALRSUtABRRRTAKKKKACkpaSgAooooA\r\na3SoqlfpUVABRRRQIKSlooAKSlooASilooAKKSigApaKKALdFFFABRRRQAUUUUAFFFFABRRRQAUU\r\nUUAFFFFABRRRQAUUUUAJRS0lACHpUD9anbpUD0ANooooAKKKKACiiigAooooAKBRRQAuKTNOpCKA\r\nEooooAKKKKACiiigAooooAKKKKAFpRSUooAfRQKKACkpaKACkNLRQBHtpDUlRnrQAlFFFABRRS0A\r\nFLSUtIYUUtGKAEooooAcKXNMzSgUAOzRmmHigGgB56UzFLQKAEop2KTFAxymnCoxUgoAdTTTqaaB\r\nDTRQaTNAxaKBQeKAFzRmmg0hNAh+aWowacDQMdRQKWgBKRhxTqQ9KBENFB60UxDgakFRCng0DHUt\r\nJS0AFFFLQAUUUUAFFFFABSUtJQAtFFFABRRRQAUlBoFIAopaSgAoopaAEooooAKKKWmAlLRRQAUU\r\nUUALRRRQAUUUUAFFFFABRRRQAUUUUAFJS0lABRRRSAKKKKYBSUtJSAWikpaYBRRRQAUUUUAFFFJQ\r\nAUUUUgGv0qKpH6VHTAKKKKBBRRRQAUUUUAFFFFABRRSUALRRRQBbooooAKKKKACiiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigApKWg0ANNQt1qVqhegBKSiigAooooAKKKKACiiigApR1pKBQA/FNJ\r\npwOaRhQIbRRRQMKKKKACiiigAooooAKWkooAWlFJSjrQA+igdKWgBKKWkoAKKKKAENRnrUhqOgAo\r\noooASlpKWgBRS0gpaQxQKWgUtIBhptSEU0rTAbUi0ylBxQA5xxUdP60mKAAU7FAFLQMaaKXFBFAD\r\nRT1puKcKAH0hpaQ0CGGm96kxSFaBgtDdKQcUUANpKfikxQAhoGc04LTgtAAKWlxRQISkNLSGgCI9\r\naSlbrSUwFp600CngUAOooooAKWiigAooooAKKKKACiiigAooooAKKKKAEopaSgAooopAFFFFABRR\r\nRTAKKWkoAKWkpaACiiigBaKKKACiiigAooooAKKKKACiiigApKWkoAKKKKACiiigApKWkpALRRRT\r\nAKKKKACiiigApKWkoAWkoopAMfpUdSSVHTAKKKKBCUtFFABRRRQAUUUUAFFFFABRRRQBbooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACikooAWkNLSGgBrVC3WpWqFutACUUUUAFFFFABRRR\r\nQAUUUUAFFFFADgKCacOlNYcUANooooAKKKKACiiigAooooAKKKKAFpy0ynKeaAH4opaKAEpaKKAE\r\npaKKAEqNhg1LUb0ANooooAKKKBQAopaSlpDHClFIKUUDFoIpaKBDNtJtqTFGKBjAKUCnYooATFLi\r\niigQlJS0lAxKUUUCgB4ooFFAhKKWigBMUYpaWgBm2l206igBMUUtFABSUtJQAUhpaQ0ARN1pVFKR\r\nSgUAKBTsUgpaYBSUtFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSUtJQAUUUUgCiiigApaKKYBR\r\nRQaACigUtABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAAaSiigAooooAKKKKACkpaSkAtFFFMAoooo\r\nAKKKKACkpaKAEooooAZJUdSSdqjoAKKKKBBRRRQAUUUUAFFFFABRRRQAUUUUAW6KKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACikpaAENJS0lACig0CigCN6hPWpnqLvQAUlLSUAFFFFABRRRQAUUU\r\nUAFAoooAk7U1jThzTWFAhtFFFAwooooAKKKKACiiigAooooAKeoplPQ0APopaSgAooooAKKKKAEz\r\nUbHJp79KjoAKKKKACiiigYtLSClpAKKcKYKcKQx4opKUUwFooooAKKKKACkpaKBDaSlNNNAwpRSU\r\nooAeKKBRQIKKKKAFooooAKKKKACiiigApKWkoAKSlpKADFFKKaaAHClpgNOBpgLSUtFACUUUUAFF\r\nFFABRRRQAUUUUAFFFFABRRRQAlFFFIAooooAKKWimAUUUUAFFFFABRRRQAUtJS0AFFFFABRRRQAU\r\nUUUAFFFFABRRSUAFFFFABRRRQAUUUUAFJS0UgCiiigAooopgFFFFABRRSUALSUUUgI5OtMp8nWmU\r\nwCiiigQUUUUAFFFFABRRRQAUUUUAFFFFAFuiiigAooooAKKKKACiiigAooooAKKKKACiiigApKWi\r\ngBKKWigBKKKKAGPUHep36VD3oASilpKACiiigAooooAKKKKACiiigBy9KC2RQpoYcUANooooAKKK\r\nKACiiigAooooAKKKKACnLTacpxQBIKKM5ooAKKM0UAFBopCaAGMe1NoJyaBQA4Dimmn54ph60AFF\r\nFFACilpBS0hhSg0lAoGSClpopaAFpaSloAKKKKACiiigQ002lY0goGGKVaDQDzQA+lpBS0CCkoJo\r\noAKWkpaACiiigAooooAKSikoAKKKUUAFBpaKAGYpRS4opgKKWkFOoAbikp9NNACUUlLQAUUUUAFF\r\nFFABRRRQAUUUUAFFFJQAUUUtABRRRQAlLRRQAUUUUAFFFFAC0lFFABRRRQAtFJS0AFFJRQAtFFJQ\r\nAtJRRQAUUUUAFFFFIAooooAKSlooAKKKKACiiimAUUUUgCjFFFACUUtFAET9aZT5OtMpiCiiigAo\r\noooAKKKKACiiigAooooAKKKKALdFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFJ\r\nS0lADH6VCetTNUJHNACgUhpelIaAEopaSgAooooAKKKKACiiigAp27IptFABRRRQAUUUUAFFFFAB\r\nRRRQAUUUUAFFFFADlbFO3VHRQA/NKDUdFAD80hNNooAKKKSgBc0UUCgAop2KaaQBS0lLQMKKKKBj\r\ngacKZThSAdS0lFADqKSlpgFIxpaQ0CIieaUHFBWjFAxC1ANGKMUAPBp2ajAp+KAELHNAal280baA\r\nHClpBS0CCiiigApKWkoAKSiigApwptOFAC0UUUwEooooABTqbS0ALSGlpDQIZS0UUDCiiikAUUUU\r\nwCiiigAooooASilooAKKKKQBRRRTAKKKKACiiigApaSigAopaSgApaSloASiiigAopaSgAooooAK\r\nKKKACiiigAoopaAEoopaAEooooAWkpaKAEopaKAEpaKKAEpaKKAEopaKAIZOtMp7/eplAgooooAK\r\nKKKACiiigAooooAKKKKACiiigC3RRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAx+lQnrUz1C1ACUUUUAFJRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAJRRRQAtA60lKKAJKa1Lnimk0gEpaSlFAwooooGLSim04UAOFLTadQAt\r\nFJRQAtFFFACUmKWkoAMUoFFKKAExTqKKACiiigApaSloEFJRRQAUUUlAwooooAKWkooEOozSCg0w\r\nFopBS0CCiiigBwoNIKWgBhop2KTFAxKKWigBKKWigBKKWigBKKWigBKKWigBKKWigBKKWigBKKWi\r\ngAooooAKKKKACiiigAooooASloooAKKKKACkpaKACiiigAooooAKKKKACiiigAoopaAEooooAKKK\r\nKACiiigAoopaAEoFLRQBA/WmU9+tMoEFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAW6KKKACiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAGPUVSvUPegAxSGnUhFADaKXFJQAUUUUAFFF\r\nFABRRRQAUUUUAFFFFABRRRQAUUUYoAKKMUuKAEopcUYoASilxRigBKKXFGKAEopaSgAooooASiii\r\ngAooooAXNFJRQAtKKSgUAOpKKKQwpwptLQMdS02lpALmlpKKYC0UmaaTQA7NJmmZpaAH5pQajzSh\r\nqAJM0UwNS7qAHUUzdS5oAfRSA0tABRRRQAUlFFABRRRQAClxSClzQIUUGkBoNMApaBRQIKKWkNAB\r\nTqaKdQAUlLSUAJRS0lAwoopaAEoopaAEoopaAEopaKAEoopaACiiigAoxRRQAUUUUCCiiigYUUUU\r\nAFFFFABRRRQAUUYpaAEooxRigQlLRilxQA2loxS0DEopcUYoEJRS0UAJRS0UAJRS0UAJRilooASj\r\nFLRQAmKMUtFACUuKKKAK79TTKe/WmUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAW6KKKACiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKQ0tFADGqIipWqOgBBThSGkpAKRmmEYp9BFAEdFO\r\n20mKAEopaSmAUUUUALRSUUALRSUUALRSUZoAWikzS5pALSUZozTAWiiikAUUlLQAlFFFABSUUlMB\r\naSiigAooooAKKKKACiiigBaKKWkAUUUUDClpKKAFzSim0ooGOooooAKTGaU0gNAC7aNtGacKAG7a\r\nTbUtFAEYWjbUmKMUAR7adinUlACYoFLRQAUUUUAFFFFABRSUE0CFFBpAadigBtGadikxTAVTS0zG\r\nKUGgB1BooNAhBTgabRQA+kpKWgBKKWlxQA2ilxS4oAbRTqKAEopaKAEopaKAEoopRQAlGKWigBMU\r\nuKKKADFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB\r\nRRRQAUUUUAFFFFABRRRQBXfqaZT36mmUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAW6KKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAGPUOeambpUOOTQAuaM0Y4pDSAUGlzTKKA\r\nHUYptLmgAIptLuozQAlFOpKAEopwFLimAyinYoApAJikqQLQVpgMxRilxTgKQDMUYqXFNIoAZS0u\r\nKTFABikp46UjUAMNFFJTAKKWigBKKKKACiiigAoopaACilxSYoAKWkoxQA6ko6UUhhRSUtABQKKK\r\nAHClpBS0hhTTTqTrTAQGnBqTbSYxQBIGpc1GM0vNAD80ZpnNLQA7NJSUtAC0UUUAFJS0lABRRS0A\r\nFNNOooERg4NSqcioyvNOXigCTHFJinCimITFMPWpO1M70APHSkNKKKAExSU6g0ANpaKKAFFFFFAB\r\nRRRQAUUUUAFFFFABRRRQAYooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK\r\nKKQmgBaKQUtABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUHpRSHoaAK79abTmptABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFAFuiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACi\r\nikoAa1RHrUrVFQAmaTNO20m2kAlFLilxQMbSU/bSbKYhtFO20oFIY3BpQuafigUAKFoIxSg0E5pi\r\nGYpcUUtIYClpKKYCEUClooAUGkaigikAyloxRQAmaaTmlNNoEFFFFMApKKKACiiigAooooAWlApM\r\nU4UgFppp1GKAEUZp4XikAxTxQMQrUbDFTVG4pgR0UUUALRSUUgHClptKDQA6lApoNOFAxcUYoFLQ\r\nAYo20tFABijFFLQITFFFFACUUUUDCkopQKADFFLSUCCiiigBcUhHNOFFAApp1Npc0xCmmHrTiab3\r\noAcOlLQKKACiiigBKWkpaACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiimnN\r\nADqKaDTs0AFFFJQAtBNJRQAuaKSigAzS5ptBNACk03NFFADhS0CigAooooAKSlxRQAUUUUAFFFFA\r\nBRRRQAUUUUAFFFFABSHoaWkboaAK7U2nN1ptABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAFuiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBjdKjxUrdKjFACikp1IaQxKMUUCgA\r\nxRThQRQA2lC02nigBCKSn000wAUuKaKdSAaRRTjSUAFFGKTvQA7FIwpwoIpgMFPFNIoBoAUimsMV\r\nJ2qJjSAZRijvSnigBpooopiCiiigApKWigApQKMUopAAoop6igYgHFOp2MCmE80ALilxSA807NAC\r\nE0080E80ooAiPBpKc/3qbTAKKKKAClpKKQCg04GmUuaBkgNLmowadmgB+aM00GjNADs0uaZmjNAD\r\n6TNNzS0ALRRRQAYpaKKBBSUtJQAUtJQKAHUUUUwCmNxUlMagABpwqMU7OKAJKKYGpc0AOopM0UCF\r\nopKKAFopKWgAoopKAFopKWgAooooAKKKKACiiigAooooAKKKKAEopaSgBaKKKADFJS0lABRRRQAU\r\nUUUAFFJRQAUlLSUAFKKKBQA6iiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKRvumlpH+7\r\nQBXam0rUlABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAFuiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACkpaSgBG6VH3qQ1HjmgBaWkopDENFLRQACgmg0maADFOFIKdigBM0hoNN70AK\r\nKWgUuKACgUlKKAFphqSmHrTAFNPpgpwNIBCKSnGmmmAZ4qMnmnE0wdaQCikandqYaACiiimIKKKK\r\nAClAoAp1IAooooGFOU02kJoAlLDFRMeaQk0lMQu7FLvNNooAXNKGxTaKAFY5NJRRQMKKKKACiiig\r\nAooooAKWkopALmlzTaUUDDNOGaAtOAoAAKWilpAFFFFMBaKKKBBRRSHpQAmaetQ96lU0AOpKM0tM\r\nBKa1PprCgBlLSUUDFpabRQA4GnA0yigRJRTAacDQAtLSUtAhKWiigAooooAKKKKACiiigAooooAK\r\nKKKACiiigAoopKACiiigAJpM0hpKBj6KQGigBaKKKAEooooAKSigUCFoFFAoAdRRRQAUUUUAFFFF\r\nABRRRQAUUUUAFFFFABRRRQAUUUUAFNf7tOpsn3aAK5pKU0lABRRRQAUUUUAFFFFABRRRQAUUUUAF\r\nFFFAFuiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACkpaSgBDTKeaSgBMU2pKYet\r\nAwFLSCnUgENMqQ0ygBy06mKafQA1qZUjVGaAHCnU0U6gBppVpGoFAD6YadmkoAMUUopCKAFpCKBS\r\n0wI2pgp700UgFPSmVIelR0xBRRRQAtKBQBTqQxKKDQKAFpKKRulMQE02iigAooooAKKKKACiiigA\r\nooooGFFFFABRRRQAUUUoFIBKUCnBacBQAwLT8UUUDCiiigBaUUlLSAKKKKYBS0lFAhaQ0UpoAZTx\r\nTO9PFADqSlopgJSE06o2PNACUUUUhhRRRQAUtJRTAWiiigBwNKDTKWgRJRTAacDQAtFFFAgooooA\r\nKKKKACiiigAooooAKKKKACiikoAKKWkoAQ02nGm0AApwptOFAxaKKKBCUUtFADTRRRQAtA60UCgB\r\n1FFFABRRRQAUUUmaAFooooAKKKKACiimOeKAHZpc1CpzT80APooFFABTZPu06mSfdoAgNJSmkoAK\r\nKKKACiiigAooooAKKKKACiiigAooooAt0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUlLSUAIaQUGgUALTTT6YaAEFOFMpwpDFNMpxpAKAAU4GkxQKABqb3pxpo60AOxRS009aAFox\r\nSCn0ANoFBooAdSGlFFADaAaU02gAYcVH0NS1G4xQAZ4phGKUU4jIoEMooNFMBwNOFRing0hi4pMU\r\nuaaWpiAnHSmk5oooAKSlooAKKKKACiiigAoopRQAlFFFABS4pKetIYBc0oSniloAj20YxTyKQikM\r\nQUtJS0AFFFJQAUUUooAWiiimAUUUhOKAAnFIDmk609RxQA4CkNLTWoEIBzThTRS0APopKKADNRnk\r\n081HQMWiiigAooooGFFFFAhaKKKYBRRRQIKUGkxRigB4anA1HS5oAfRTQadmgQUUUUAFFFFABRRR\r\nQAUUUUAFJS0lAC0UUUANNNNONNoABThSClFAxaKWkoELSGiigBtFFFABSikpR1oGOoJoqNmoEPzS\r\n5qLNKDQMe3Sot3NPJ4qI9aBEoPFLmowaUGgZJmjNMzS5oAWmvS01+lAhq9akFRKeakzQA8UtItLQ\r\nAUyXpTqZL0oAhNJQaKACiiigAooooAKKKKACiiigAooooAKKKKALdFFFABRRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFJS0lADWoFKaaKAHU00tFAxMUlOpDSASlFJThQAGm0+mmmAhoHWi\r\ngCkA+mNT6aaAEWn0wU+gBDSU6kxTAUUUCigBDSGnUhFIBBSMMilooAh6GnZ4pGHNKBTAaaSlNJQI\r\nKKKKAFzRSUUAGKKWkoAKKKKACiiigAoooxQAU7tSYp2KQxlFLjmkpgFOWkopDJVp1MU08UCCkNOp\r\nKAG0UppKQwpDSmm0ALS0gp1ABRRSE0wBjim9aXGacBQAKKdSUtAgph60pOKQc0ALSDrSNxSpQA6l\r\nopKAA1H3p7GmigYUUYpcUAJRTsUYoC42lxS4ooEGKMUtJQAUtFFABRRRQAUUUUAFKKSigQ7NLTaU\r\nGgBaKKKYBRRRQAUUUUAFJS0lABRRRQAhptONNoAKcKbTh1oAWiiigAopaQ0ANooooAKKKKAHZqJ+\r\ntPzUbHmgYopc0ylpAKTTaU0w0APFLTAaXNADqXNNozQA8GkbpSZoPSgCPvUgqM9aetMCVadTVpaB\r\nBUctSVHL1oAhooooAKKKKACiiigAooooAKKKKACiiigAooooAt0UUUAFFFFABRRRQAUUUUAFFFFA\r\nBRRRQAUUUUAFFFFABRRRQAUlLRQAhpuKcaSgBtKKDQKQxaQ0tIaYDacKSgUgHU006g0xDKUUYoFI\r\nY6kIpaKYDQKdRRSAKSlooATNGaKSgBc0ZpKKACkpaSgBppRQaZmmAMOabSk0lABRRRQIKKKcBmgY\r\n2inEcU2gAooooAKXFApwFADcUooNKKQB0oBoYU0cUASU09aTcaQHmgB+3NNIxTweKU0AMWpAajNO\r\nU0DJKKKKBCGkpaQ0AIaSg0oFAxRQaWmmgBM0oGaAKUCgBQKWkzRmgQUZpKQmgBrHmnqOKYBk1J0F\r\nAEbHmnp0qPq1SrwKAFpKKKAENIBSmigAooooAWikooAKKKKACiiigBaKKKBBRRRQMKKKWgQUUtFA\r\nCUtFFAC0UlGaAFooopgFFFFABSUtFACUtJRQAhptPNMoAKcKSlFAC0tFFABSGlpDQA2iiigAoooo\r\nAaaYaeaYaBhQKSlFIBc8U2lNIKAFApcUUUAFFFFAC0Yope1AEbdaVaRutKtMCVadTFp9ABUcvWpK\r\nil60CIqKKKACiiigAooooAKKKKACiiigAooooAKKKKALdFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFFFFACUlLSUABpKWkoGLQaKKAEIpMU6jFIAFFFFABikxS0UwCiiigAooooAK\r\nKKKAENJTjTaQBRRRQAUlLSGmAxjTacaQUANop+KSgBKKKWgYlSRKGWmEVLD900CYxhhiKZipGBLH\r\nimUANopxptACipFqKpFpDEbrSrSt0pq9aAHMOKj71KelR4+agQbTTasL0qJxzTAQGnA0wUtIZJim\r\n9DSBqdjNAhytTqi6GnZoAcTTSaSlxQMQU8UzpTh0oAdTWpc00mgQq0ppAaKACiikoAKQ0tIaAFXr\r\nQxwKVabJQA1RzUw6VHGKkoASiig0AJRRRQIKKKKACiiigAooooAKKKKAClopaBiUuKKWgAoopM0A\r\nLSUZpM0ALmikpKAHUUUUALRRRQAtFJS0CCiiimAlLRRQAhplPNNoAKUUlKKAHUUUUAFIaWmmgBKK\r\nKKACkNFFADTTDTzTD1oASnCm0opDFNIKDQKAFooooAUUUUUAFOFNpwoAY3WhaV6RaYEgp9MFPoAK\r\nil+9UtQy9aBEdFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAFuiiigAooooAKKKKACiiigAoooo\r\nAKKKKACiiigAooooAQmkzQaKAHUUgpaAEpKWkoAKKKWgYlFLRQAlFLSUALSUtFIBKWkopgFFLRSA\r\nSilopgFFJS0AJRilpKQDaKdRQA0nFN60NQtMYFabipaYaBCAUEUopaBkeKUUpFNNAC1JD900qYK4\r\npUG3NAgXqaQKMGn0UCICh25pmKskYXFQUwQ3FPWkoB5pFDjTelPFNYUgHA8UjCkU0/rQA0NSEZpD\r\nwaetADduKD0p1IaBDO9SDpUfepB0pDENApTSUALSE4paQigBo5NSVGOtPPSmAmaWkHWnUCCikooA\r\nKKKKACkpaKAF7VG3Jp5poHNAD0HFOpBwKKBBQaKSgAooooAKKKKACiiigAoopaBhS0UUAFFFFABR\r\nRTSaAFzSZpOtPAoAQClxS0UwCkxS0UCGmlFLSYpDFpKKKAClpKWgBaKSloEFFFFMANMp9MoAKUUl\r\nKKAHUUCigAppp1NagBKSiigApCaKSgBCaYacabQAU4dKbTqQxDSCg0CgB1FFFAC0UlLQAU9aYael\r\nADZBxTF61LJ0qJetMCUU8VGKkFAC1BL1NT1BJ96gRHRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\r\nRQBbooooAKKKKACiiigAooooAKKKKACiiigAooooAKQ0tIaAEopKWgBRS0gpaAEooooAKKKKBhRR\r\nRQAUUUUAFFFFABSUtJQAtFFFIAooopgFFJRQAtFJS0AJSMcCnVE5oATqacKYtPoGOprClFKaBDKW\r\nikoGBppp9NNAAp2nNT1XqWNsigTH0UUUCGscCosU+Q84pooBCYpKfimMKBjlpTTFp9IY3vThSGgG\r\ngAIoHFO7U1utAC0GkU0tADMUvSnUYoAQGlpMUopALSHpS0UCGAc06lpDTASlpBS0AFFFFABRRRQA\r\nlKKQ0LQAOcUJSP1pY6AJKSlNJQAlFFFAgooooAKKKKBhS0UCgApaKKACikooAKWkopABptOpCKYA\r\nKfTOlOBoAWiiimIKKKKBhRRS0CGUtDUgpDFopaKACiikoAdQabSnpTEJmios81IDxQMKKKKADNKD\r\nSUCgB/ao2p/amsKBDaKWigBKKWkNAxCM0mygnFKGoAYRiinnmmkUgCkxSijFACUtLikoAKWiigAp\r\n6UynKaAFfpUS9akfpUa9aYEtOU0ynLQA6oH6mp6gk60CGUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAUUUUAW6KKKACiiigAooooAKKKKACiiigAooooAKKKKACkNLSHpQA2iiigBwpaQUtACUUUUAFFFF\r\nAwooooAKKKKACiiigApKWkoAKWkopALRSUUwCilooASlopKACon61I3SojzQACnU2gGkMeKdTRTg\r\naAGkUlPNMNMAzSGlFLigBlKh2tmgigUAP80UeaKjNC9aBWHHls0oFKKKACmNT6QjNIBgNPFMIxSg\r\n0DFNAoooAcKRhSA06mAwcU4UjDmkBpAPpKWkoAKWkoJoAWkJpCaSgAzS0lJmgB2aAaZSigB9FNzS\r\ng0CFoooNADSeactM70/tQAxuTUijimAfNUg4oAKKKKBCUUUUDCiiigApaKWgBKWiigApKKKQBRRR\r\nQAUUUUAFFFFABik6U6kpgKDS02jNMB1FJmlzQAUtJQTQAhpo60poAoAWlpKKQC0hNITQOaAFFB6U\r\nooIpgQnrTl6UMKQUAOooooAWgUlFAD+1NY0UhGaAEzRmjFLigBM0hNKajJoADSCiikA4Glpop1AC\r\nilApBTqADFJilooAaabTyKbQACnCkAp4FAEbU0dakccVF0NAD81IlRZp8ZoAlqu/Wp81XfrTENoo\r\nooAKKKKACiiigAooooAKKKKACiiigAooooAt0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFBo\r\nooAYaKU0lADhS0gpaAEooooAKKKKQBRRRTGFFFFABRRRQAlFLSUAFFFFIAooopgFLSUUALSUUUAN\r\nfpUVPc0ygBDSjrSUCgZIKUUgpaAH01hSig0ANFLRiigBDTaU000AKaaOtLmkoAkBp1RqaeKQgNJS\r\n0lMBGpoNSdRUbDmkA4UGkFLQMKcKbSigBSKjPFS0wigAU0tNFBNACk0lFIaACjNJmigAPNFFLTGF\r\nFFFABRRRQIUGlJptNNICRaU0idKVjQIFFOpF6UtABRRSUAFFFLQAlLRS0AFFFFABSUhNJmgB1FID\r\nS0gCiiigAooooAKKKKACiiigBaaadRQA2lzQRSYpgLuooApaADFFFFABRRRQA1qVaCKRaAJKSlpp\r\npgBFMIxTxQRQAwUtJjmlFIAoopG4pgKKdiog3NSA0AFFFFADWqM1KajIpANop2KQigBKM0uKXZQA\r\nKeaeKaFxS5xQA6lpgOTT6AENMpxNJigBRS5pKSgBWPFRHrTyaZQAVIlRVIpoAkzxUBPNTZ4qA9aY\r\nBRRRQIKKKKACiiigAooooAKKKKACiiigAooooAt0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFACGm04000AKKdTRS0DCiiigQUUUUgCiiimMKKKKACiiikAlFFFMAooopAFFFLTASiiigApD0\r\npaa5oAibrQOlHU07FADDQKUikoGPFOpop1ACinUynCgANIaU02kAUhHFLQaYEfel7UjdaBQADrUq\r\nniojTlNICSkxS0UxCYprCnUUAMpaCOabnFADjQOtNzzThSGOqNjzUg6UxxTAAaDTRRmkAuaQmijF\r\nMYUYopaACiiigAooooAWkopaAENNpxpo60CJU6UjdacvSgigQL0paBRSAKSgmgUAApaKWgAoopKA\r\nDNITQTTcZpgB5opwWl20AMpQadijFIBM0tNIoBpAOooooAKKKWgAopKKAFooooAKKKSgBaKKKACi\r\niigAooooAKSlpDTAcKQikBp1MBBS0UUANNAoNFIBaY44p9NfpTAh71ItM709aAHUUUUAFJinUUgG\r\n4oxS0UAAFFLRQAh6VGTUjdKiPWgBwp2aZmjNAElApgNOBoAdTDTqBQAwimHrUxHFQt1pgJT1pgpw\r\npAPJ4qKnGm0wCiiigQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQBbopKKAFooooAKKKKACiiigAooo\r\n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\r\ntMBKM0UYoAUGlpBS0AFJS0lMAopaSgBaQrxS0UgIiKeBkUpFLTAjZKbgipqbigCMZpwYin7aTaKA\r\nE3E00gk1JijFADACKa1TAUFc0AQUVMUppSgCM0lPdcUygQUUUUAFFFFABRRRQAUUUUAFFFFABRRR\r\nQAUUUUAWqKKKAFooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACkoooAQ0lLRQAlKKSikM\r\ndSUUUwCiiigAooooAKKKKACiiigAooooAD0qBzUrGoT1oEFFKBSleKBjKctNpRQA88io6kppoAbS\r\nikooAeKcvWmCpFFAxcUUtNNAh1IRRmjNADO9LmlxmlxigBlBHFOpKAI+lPU0hWkBoGSUhFApaBEf\r\nSnA5pW6VGOtAEtBNC8ikNACHmm7afRigCPpTlNBFNoGS0xhTgaCM0AMFLSEYNGaBhS0lLQAUUUUA\r\nJRRSrQA9RTqQdKKBBQKKWgBrGmig8mgUDCiiigAooooAKKKKAEopaKAEooooAKM0UUAOU8UuaYKX\r\nNSA8Uppimn0CIz1qQHio2605DQA+mGn000ANzS54pcUUAJjNLigUtAAKWkooAWmMKfTWpgKnSnN0\r\npFpaYiPFLilxSgUAKKaadTD1pAOFFAooAKKKKACkNGaKAEooopgFLRSUAFLRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAopaQUtABRRRQBHN0FQ1NLUNAgooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAtUUUUALRSUtABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAlFFFACUUtJQAhopaSgYCl\r\npKUUgCiiimAUUUUAFFFFABRRRQAUUUGgBjGmEU8im0ANHBpxbNNIoxQAlOWkpAeaAHmm0/qKjPWg\r\nANJThSUAOQVIKjSnlqQxSaTNNySacBQAU00+mGmAqmnUwU+gBpFKKDSZoAcRUTDBqUU1xQIap4p/\r\nUVF3qVelAxMU0jFPpduRQIjU0+ozwaepzQMKWg0lACGmEVJTWoARTinbqjpy0AKwpop56Uw9aAHU\r\nUgpaBhRSUtACU5abT1pAPpDS000xCig9KBTXNACUUgp1AxKKKKACiiigAooooAKKKKAEpaKSgBaS\r\niigAoNFFIBAcVIpqOjOKAFfrQlNJyaVTg0CJSabu5pMmm96AJQaKRelKaQAKWmg06gAoopaACkNL\r\nSUAIDzT80w0A0wH0U3NGaYhTTKdQBSAUUUUhNABmlxSCn0AMxRTiKYaYBRSc0UAOpKSl5oAKWmc0\r\nc0APopnNHNAD6M0zmjmgB9FN5o5oAdmjNNwaMGgB2aKbinAUAFFLijFAAKWiigAooooAjm61DUs3\r\nWoqBBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQBapaSloAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigApKWkoAKSlooASg0UUAJQKDSUhjqKQGloAKKKKYBRRRQAUUUUAFIaWmMeaAFp\r\nr8U4HimsaQEeaUGkopgKaSlooAeOlMYc5py0MOKAGClpDRQAoo5pV5p+BSGNWnk1ETg1IORTAAaU\r\nikxzS0AMPBpQaQ9aUCgBTzTTxTjTSKAFVqU800DFPoAiYYpymhxTRwaBEoozSDpQaAGuM00cGn0x\r\nqBkmeKQ0xTzUlACAUjCn000ARUopSKSgQop2M0wGng0DG9KWkPJpRQMSloIpKAAVIKYKkFIQUlKa\r\nQUwFph5NPJ4qOgAApaKKBhRRRQAUUUUAFFFFABRRRQAUUUUAJRRRQAUUUUAFIaWjrQAylFKRTaCS\r\nZcYpjDmlU8UjGkMfH0pW6U1DgUrGkADrTqatOoAKWkooAKKKKAENIBTqKADFLRRQIKKKKACmN1p9\r\nMamA9aXNItDdKYC5pMUi06gBMUYpaKAExRilooATFGKWigBMUYpaKAExRilooATFGKWigBMUYpaK\r\nACiiigAooooAKKKKACiiigCKXrUVSy/eqKgQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAWqK\r\nKKAFooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiikoAKKKKAEooooAKQilooGNpwNNN\r\nApAOooopgFFFFABRRRQAGoyKkppFADR0pjHmpQtRyDFAADQRTaXNABRSUUAPWhulC0PQAzNJRRQA\r\nq9alHSol61MOlICNhzTkOBTX60qrTGOJooxS0ANpRQaKQC0UgpaBDDQGpzCoyMUwJOtMYU5TTsZo\r\nGMU0pOaY3Bpyc0AKKUgYpaaaBEZ4NODUEU3pQMlXmlIpqHinE0AMNMqQ03bzQA2lxS4oNABSUtBN\r\nIYtNI5oBpaAFUU+mrTqYhKUUlLmgBrmmilY80CgYtJRRTAKKKKQBRRRQAUUUUwCiiigAooopAFJS\r\n0UAJRS0lABSgUU4CgQ1hxUdSsOKioEOU0HrTRS0gFBpwpg61IOlAxwpabS0WEGaM0YoxRYBpNGaG\r\nWmjrQMlFLSClpAFFFFAgooooAKQiloNMAWlNNWn0wGgUtFFABRRRQAUUUUAFFFFABRRRQAUUUUAF\r\nFFFABRRRQAUUUUAFFFFABRRRQAUUUUAQy/eqOpJPvGo6BBRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQBaooooAKWkooAWiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooASiiigBKKKKACii\r\nigYUhpaCKAGg06m0opALRRRTAKKKDQA3NKKbinCkAtRSVLUT9aAGUUoFBFACUUGkpgPWnN0pimnE\r\n5FICOlpKWmAdKkU5qOnp0pDHY5paKKYgooooAQ0lLRQMSl3CmtmmZNAE2c01hSr0pTQIizinB6Qi\r\nm9KBjm5pUOKFGaRuDQBLTD1pFanGgBMZpjcU7PNKVzQBGDipBTCMUA0APpM0A0E0gE60HikzSUDA\r\nmiiimAUopKBSAfmnA1HSigB9IaUGkamIb1paQUtAwooopgFFLRQAlFFFABRRS0AJRS0lABRS0UgE\r\nooooAKKKKACnCminigQdqhbrU1RuKCRlLSUUAKOtSgVEKkU0hj6KO1RliKYEtFRoc1LQAhFRkc1J\r\nTWpAC06mrTqQwooooEFFFFABQelFFADacDSYpRTAWkopaYBRRRQAUUUUAFFFFABRRRQAUUUUAFLR\r\nRQIKKKKAEopaKBiUUUUAFFLRQAUUUUCIJPvGo6fJ940ygAooooAKKKKACiiigAooooAKKKKACiii\r\ngAooooAs0UUUALRRRQAtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAlFFFACUUUUAFFF\r\nFAwooooEIRSU6kIoGANLTKcDSAWiiimA2lFBpoNIBWqPvUvUVGRzQAopDRmmk0AIaSlooABTgM03\r\nFPUUwEYYplSuMCoqACnoaZTlpAS0UlLQAUUhOBTS1MYpNKKRead0pABHFRMOal7U1hTEIhqSoOhq\r\nRWoGDCozUpGajK4oECnBoJpMGigYL1qUDio161KDxSAbiloNITTARqZSk5pKAClpKKBhRRRSAKKK\r\nKACiiigBRRSUtACg0GiimAtFJS0AFFFFAC0UlLTAKKKKACiiigAooooAKKKKACkpaKACiiikAgp4\r\nplPFAgpGHFLSHpQIhPWilbrSUCCnqaZSg0DJhyKYy0qtTutADE61N2pgHNPoADUbU4mmE0AOWnU1\r\nadUjCiiigQUUUUAFFLRTASloooAKKKKACiiimAUUUUAFFFFABS0UUCCiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigCu/U0ynv1NMoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKALNLRRQAUUUU\r\nALRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFJS0lACUUUUAFFFFAwooooAKKKKAEIpp\r\n4p9IRQA3dShqQrSDg0gHnpURODUg6VG45pgPDcUhpgp4pAJimkVJSYoAjpRTiKaeKYC96eo4qNet\r\nSjpSAZIajqVxUVMApV60lKKAJRSE0inNOFIYgXNIy8U+l60xEanBp9MYYNOU0hiihulFFMRFjmnq\r\nOKDxTd3NAySkxmgUuaAExUbdal60hUUCIqUNikPWigY7OaKTNLSGNNFLRigBKKXFJTEFLSUUhhRS\r\n0lABRS0lABRRRQAtLSUUDFooopiFopKWgApaSimAtFJS0AFFFFABRRRQAUUUUAFFFFIBKKKKAFFO\r\nFNFOoEFBoooERuKZUrdKioEFFFKKAFBpwNNFOFIY8UZoFFACdaMU4UtACAUtFFABS0lLQAUUUlAC\r\n0UUlAC0lLSUAFFBopgLRRRQAUUUUAFFFLQAUUUUCCiiigAooooAKKKKACiiigAooooAKKKKACkoo\r\n7GgCu3Wm05qbQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAWQaWm0ooGLS0lLQIKKKKACiii\r\ngAooooAKKKKACiiigAooooAKKKKACiiigBKKWkoASiiigAooooAKKKKACiiigAooooAKaRTqQ0DE\r\nFDDNApaQDAtB4p+Ka4oAQU/FMXrT6ADFMdeKfSHpTAiHBqVelMIpynigYrDioSMGpzzUTigQyiii\r\ngBy9alFRKeakB4pDFNAoozigBH6VGDzTz81AXFMBRQTTScUo5oACCaaRinkgCo2OTQAu6jNNopDH\r\nhqC1NooAQ0UtJTAKUGkopAOC5pwWhDT6BDGHFR4qQ0hFMBmKKWg0hiClpKXNABSUtFACUtJRQAtF\r\nJS0ALRSUtAwpaSimIWigUUALRRRTAKKKKACiiigAooooAKKKKQCUUUUAKKdTRTqBBRRSUCEPSou9\r\nSMeKjoAKcozTaljFADWGKVaWUUxTzQBKKWmilpALS03NLQAtFJQKAFoopKAHUlFFMBaSiikAUUUU\r\nwEpRRS0AFFFFABRRRQAUUUUAFLSUUALRSUUALRSUUALSUUtABRSUtAhKWkooGLSUtFACUHoaKD90\r\n0CK7dabSt1pKACiiigAooooAKKKKACiiigAooooAKKKKACiiigCxS02loGOzRTaUUCHUUlLQAUUU\r\nUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFIaWkoASiiloASiiigAooooGFFFFABRRRQAUwnNDGm\r\njrSAeBTqaDS5oAWmv0pc0h5oAYvWpKYBg0/NABRiiloAaRTO9SUw0wHA8U1+RQOaUjigCGloNJQA\r\nU4Nim0oGaBkgbNLjNIop1IAxikpaQnFACMOKZmgnNJTGKTmkoopAFFLSUAFLSUUALSUtFACUUUUx\r\nCqcVKDmoacppASU00oOaDTAYRQRxTqCKAI6KdtoIpDEpQMimjrUgoAaVpKk601hQAyloooAKKKKA\r\nFopKKBiilptFMQ6iiigAooooAKKKKACiiigAooooAKKKKAHClpBS0CEpKWigRGxptOem0AKBk1Oo\r\nwKbGtSUAMkGRUPQ1YNQuKAFU07NMSn0gClpAKdQAUUUUAFLRRQAUUUtMBKWiikAUUUUwCiikoAWi\r\nkooAKWkooAWikpaACiiigAooooAKKKKACiiigAooooAKWkooAKKKKAChvumihvumgRWbrSUppKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigCelFJSigYtFFFAgpaSlFAC0UUUAFFFFABRRRQAUU\r\nUUAFFFFABRRRQAUUUUAFIaWkNACUUtJQAtJS0lABRRRQAUUUjGgAJpuaSlpDENFBooGLSUZooAUU\r\ntApaAEpKWigAzS5ptFADqY1OpDQIRacelNHFKTQMjbrTac1NpiCnrTKctAySlpueKaWpAOLY6U0k\r\nk0lFAwooooASiiigAooooAKKKKAClpKKAFpDS0UAJRRRTAepp3WoxSgmkA+kNJmgUCEFONLjimMa\r\nAACl6Ui9acaBgpoIzSdKN1ADcYooPNGKACiiigBKWikoAWiiigAzTqbRmmA6ikFLQAUUUUAFFFFA\r\nBRRRQAlKKKBQA4dKWkFLSEJSUtFMRG9NHWnNTaALCdKdTENPoASo5BUlIwyKAIlqSoujVKOlIAFL\r\nRRQAtFFFABRRRQAtFJRQAtFFFMBKKKKACiiigAoopKAFopKKAFooooAWikooAKKKKAFopKWgAooo\r\noAKKKKACiiigAooooAKR/u0tI/3aBFc0lKaSgAooooAKKKKACiiigAooooAKKKKACiiigAooooAn\r\npaSloAKWiigAooooAcKKSloAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAENJS0UAJS0lLQAl\r\nFFFABTHp9NcZoAaKU00U6kMbmloIpKBi0UUUAFLmkpcUAFLRRQAlLRRQAUUUUCENNpxpMUDGNTae\r\n3SmUxBSikooGOzRSUtIYCl20KKfQBGaKVutC0AJikp5HFMoAKKUCg0AJRRRQAUUUUAFLSUUALSUt\r\nJTAUUUlKKQDhS0yl60APB4pjCjpSg5oEIvWnE0uKjbrTAM0oFAWlJxSGN6Gl60YzTgMUAMIxSVKe\r\naYQRQA2ilooASlpKKAFooFLQAUtNNFMBaKKKACiiloASilooAKKKKBCilpBS0gCiilpiGMOKYamN\r\nRkc0APj6U+mJxT6ACg9KKO1AEDdacpocc00daAJM0uabS0gHUUgpaAFopKWgAoopaYBRRRQAUlLR\r\nQAlFFFABSGlpDQAlLSUUALS0lFAC0UlFAC0UlFAC0UUUALRSUUALRRRQAUUUUAFFFFABSP8Adpab\r\nJ92gRAaSlPWkoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAJ6UUlLQAtFFFABRRRQAUopKUU\r\nALRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAlJSmigBKKKKACiiigYUHpRQaBEZFKKDQKQwop\r\naSgYUUUlAC0tIKWgAopKKAFopKKAFoopaAExSN0p1IRmgRCTzSU9lxTKYBRRRQAtOAFNpVPNIokA\r\npDSg0GgQ3GaDxThQRQMaDQaCKQ0AJmjFABpxoAZS4pQKdTAjopT1pKACiiikAUtJQKAFxRS5ooAM\r\nUA9qAaQ0APIyKZ0NKDig0APHSmMOaVWxTuopiBcYprHmlbimdTQA9SKcelR4IpQ1IBaU9KOKYTQA\r\nh60UdaMUDEopaSgApQaSigB1JQKU0AFFIKKYC0UlAoAdRQBTgKBCYpRS0UhCUuKKKADFFFFMAppp\r\n1NNADlp1NWlzQAUtJRQA1xUVSnpUZ60AKKcKaKcKBi06m0tIBaWkpaYgpaSloAKKKKACkoooAKKK\r\nKACkpaKAG0UGigAooooAKKKKACiiigBaKSigB1FJS0AFLSUUALRRRQAUUUUAFNk+7TqZJ92gRCaS\r\nlNJQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAT0tFFAC0UUlAC0UUUAFFFFACg0tIKWgAoo\r\nooAKKKKACiiigAooooAKKKKACiiigBDRRSUAFFFFAC0lFLQMShulLSGgRF3p1IwxSA0hjqKKKBiU\r\nUuKKAEpcUU4dKAG0AUHrS0AFFFFAC0UlFABRS0GgQxzxUVSPUdMAooooAWlXrSUCkMkzRTQaUUDH\r\nUdaKKBBimtxTiaY3JoActKRxTRxTieKAGilpByacRTAbjNNIxT6YTQAlFFFIYUUUUAFOptLQAtFJ\r\nRQA4Cl6UmcCmknNAhSKVDSYzSA4NAD26U1OtO6imdDTAlODTCuKVTSmgBoNGM0Yp3agBhGKUUjU2\r\nkMU0UlLQAlFLSUAFKKSigBaMUU4CgBMU4ClxRQSFLSUtABRRRQAUUUUAFFFFMApp60tIaAFFOqPO\r\nKUNQA6iikoADUR61KajbrQACnCmA07NIY4U6milFACilpKUUCFooopgFLSUtABSUtJQAUUUUAFFF\r\nFADTRQaKACiiigAooooAKKKKACiiigBaKSloAWikpaAClpKKAFooooAKZL0FPpkvQUCIKKKKACii\r\nigAooooAKKKKACiiigAooooAKKKKACiiigCxRRRQAUtFFABRRRQAUUUUAFKKKKAFooooAKKKKACi\r\niigAooooAKKKKACiiigBKSiigAooooAWiiigAooooAjfpUYoooGh606iikAUUUUDG96kXpRRQAxq\r\nBRRQAtJRRQAU4UUUALSGiigRG9R0UUwCiiigApaKKBi04UUUhimkBoopgHWjHNFFAhRSNRRSAROt\r\nSNRRQBGTzSYoopgBpKKKQBRRRQMKKKKACloooAWgDmiigCQDio2FFFAhBQetFFAxVqSiimISjtRR\r\nQA3vQ1FFADKUUUUhhRRRQAlKBRRQA4CnUUUCCiiigQUtFFABRRRQAUUUUAFFFFMBDTTRRQA1qTOK\r\nKKAJFNLRRSAKYwoopgNpRRRQA8UtFFIYtLRRTELRRRQAUUUUAFFFFABRRRQAUlFFACGiiigAoooo\r\nAKKKKACiiigAooooAKKKKAFooooAWiiigBaKKKACo5u1FFAiGiiigAooooAKKKKACiiigAooooAK\r\nKKKACiiigAooooA//9k=', 'asha1', '2016-02-29 16:10:59', 'asha1', '2016-09-08 16:10:59', 'qazxsedcvgfr'),
('asha7245', '41001', 4, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Gangabai', 'Ishwar', 'Aapte', '1988-09-08', 28, 'Marathi', 'Pune', 'Literate', 0, 'Married', 4294967295, 'Kothroud pune null stop', '', 1478523695, '12', '', 'asha1', '2016-07-19 15:59:41', 'asha1', '2016-09-08 15:59:41', 'qawsedrftgyh'),
('asha7251', '41001', 4, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Gangabai', 'Ishwar', 'Aapte', '1988-09-08', 28, 'Marathi', 'Pune', 'Literate', 0, 'Married', 4294967295, 'Kothroud pune null stop', '', 1478523695, '12', '', 'asha1', '2017-08-10 15:59:41', 'asha1', '2016-09-08 15:59:41', 'qawsedrftgyh'),
('asha7253', '41001', 5, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Suman', 'Sudas', 'Jadav', '1987-09-12', 29, 'Marathi', 'Akola', 'Literate', 0, 'Married', 4294967295, 'Akola market gali', '', 4294967295, '12', '', 'asha1', '2016-05-24 11:08:09', 'asha1', '2016-08-09 11:08:09', 'qawsqawsedrf');
INSERT INTO `hm_patient` (`Patient_id`, `PinCode`, `Village_id`, `City_id`, `District_id`, `State_ID`, `Country_ID`, `Card_Type_id`, `Gender_Id`, `Cast_Category_Id`, `Patient_Salutation`, `Patient_FName`, `Patient_MName`, `Patient_LName`, `Patient_DOB`, `Patient_Age`, `Patient_Language`, `Patient_POB`, `Education`, `Patient_BPL`, `Patient_Marital_Status`, `Patient_Contact`, `Address_line1`, `Address_line2`, `Patient_Emergency_number`, `Patient_Ward`, `Patient_Image`, `Created_By`, `Created_Date`, `Updated_By`, `Updated_Date`, `Card_Number`) VALUES
('asha7350', '41001', 6, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Shantabai', 'Prakash', 'Patil', '1984-09-12', 32, 'Marathi', 'Kolhapur', 'Literate', 0, 'Married', 4294967295, 'Kothrud pune', '', 4294967295, '12', '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAKBueIx4ZKCMgoy0qqC+8P//8Nzc8P//////////////\r\n////////////////////////////////////////////2wBDAaq0tPDS8P//////////////////\r\n////////////////////////////////////////////////////////////wAARCAPIBRADASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwCGiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigApaSloAKB1opR1oAdS0lLSAKKKKAEbpTKc3Sm0wCiiig\r\nBKKWigBKWiigBKKWigBKWiigAooooASilooASilooASilooASilooASilooAKSlooASilooASilo\r\noASilooASilooASilooASilooASloooAKSlooASiiloASiiigAooooAKKKKACiiigAooooAKKKKA\r\nCiiigAoopaAEopaKAEpaKKACiiigApKWigBKWiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooASilooASilpKACiiigAooooAKKKKACiiigAoopaAEpa\r\nKKACiiigAooooActOpq06kAUUUUAIaZTzTKAEpaKKYBThTacKQC0tJS0gCiiigYUUUUAFFFFABS0\r\nlLQAUUUUALRSUtAEFFFFUIKKKKACiiigAooooAKKKKACiiigAooooAKWkpRQAUo60lKvWgB1LSUt\r\nIAooooAa3Sm05qbTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAEopaKACiiigApKWigApKWigAoo\r\nooAKKKKACiiigAooooActOpq06kAUUUUAIaZTzTDQAlO7UlL2pgJThTacKQC0tJS0gCiiigYUUUU\r\nAFFFFABS0lLQAUUUUALRSUtAEFFFFUIKKKKACiiigAooooAKKKKACiiigAooooAKXtSU4dKAEpVp\r\nKVaAHUtJS0gCiiigBrU2nNQo+YUwExRg1ZxS4FAFXFGKtYFGBQBVxRirOB6UYFAFbFGKs4HpRgel\r\nAFbFGKs7R6UbR6UAVqKs7R6UbR6UAVqKs7R6CjaPQUAVaKs7F9BRsX0FAFairOxfSjYvpQBWoqzs\r\nX0o2L6UAVqKs7F9KPLX0oArUVY8tfSjy19KAK9FWPLX0o8tfSgCvRVjyl9KPKWgCvRVjylpPKWgC\r\nCip/KWjyloAgoqfyhR5QoAgoqfyhSeUPWgCGipvKHrR5Q9aAIaKm8ketHk+9AENFTeT70eT70AQ0\r\nVL5PvR5PvQBFRUvkn1o8k+tAEVFS+UfWk8o+tAEdFSeUaPKagCOipPKajymoAjop/lNR5bUAMop/\r\nlt6UeW3pQAyin+W3pSeW3pQA2inbG9KNjelADaKdsPpRtPpQA2inbT6UbT6UANopdpo2n0oASilw\r\naMGgBKKXBoxQAlFLijFACUUuKKAEopaKAEopaKAEopaKAEopaKAEopaKAEpaKKAEopaKAEopaKAE\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBy06mrTqQBRRR\r\nQAhphp5phoAKcOlNp6j5aYDTSikNKKQC0tJS0gCiiigYUUUUAFFFFABS0lLQAUUUUAFLSUUAQ0UU\r\nVQgooooAKKKKACiiigAooooAKKKKACiiigApw6U2nfw0AJSrSUq0AOpaKKQBRRRQA1qE+8KG60sf\r\n3xTAsUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUU\r\nUAFFFFABRRRQAUUUUAFGKKKADFGBRRQAYFJgelLRQAmB6UbR6UtFACbR6UbR6UtFACbR6UmxfSnU\r\nUAN2L6UbF9KdRQA3y19KPLWnUUAM8taPLWn0UAM8oUeUKfRQBH5Qo8oVJRQBH5Qo8r3qSigCPyve\r\nk8r3qWigCLyqPKqWigCHyjR5RqaigCHyjSeUanooAg8o0eWanooAr+W1HlmrFFAFfyzRsPpViigC\r\ntsPpRsPpVmjFAFbafSjafSrOKMCgCrtPpRtPpVrApMCgCtg0YNWdo9KNooArYNGKs7R6UbR6UAVs\r\nUYqxsFGwUAVqKs7BULjBoARadTVp1IAooooADUZqQ1GaACng/LTKcvSmAhoFBoFIB1FFLSAKKSlo\r\nAKKKKBhRRRQAUtJRQAtFFFABRRRQBDRRRVCCiiigAooooAKKKKACiiigAooooAKKKKACn44ptO/h\r\npANpVpKctMB1FFFIAooooAa3Wlj++KRutOi++KYE9FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAHpUEnWp6gk60ANWnU1adSAKKKKAENMNPNMNABTh0p\r\ntKOlMANApDSikA6lpKKQBS0lFAxaKKKACiiigAooooAWiiigAooooAhoooqhBRRRQAUUUUAFFFFA\r\nBRRRQAUUUUAFFFFAC07tTRSnpSASnLTactADqKKKACiiigBrdadF9+mnrT4fvUwJqKKKACiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACii\r\nigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqCTrU9QSdaAGrTqat\r\nOpAFFFFAAaYaeaYaAEpwHFNpwPFMBDQKQ0opAOooopALRSUUDFooooAKKKKACiiigBaKSloAKKKK\r\nAIaKKKoQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAopTSDrS0AJTlptOXpQA6iiikAUUUUAMPWpIf\r\nvGoz1qWHqaYEtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAVBJ1qeoJOtADVp1NWnUgCiiigBDTDTzTDQAUo6UlKOlMBKUUlKKQDqKKKQBRS0lAwoopa\r\nACiiigAooooAKWkooAWiiigCGiiiqEFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAKvWlNCfeoNIBKc\r\nvSm04dKAHUUUUAFFFFADD1qWHvUR61LD3pgS0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFF\r\nFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFFFFABRRRQAUUmaXNABRRmkzQAtFJmjNAC0UmaM0ALRRmk3UALRTd1G+gB1FN3UuaAFoozRQAUU\r\nUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRR\r\nQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOtADVp1NWnUgCiiigB\r\nDTDTzTDQAUvakpe1MBKUUlKKQDqKKKQBRRRQMKKKWgBKWiigAooooAKKKKAClpKKAIqKKKoQUUUU\r\nAFFFFABRRRQAUUUUAFFFFABRRRQA5OtBpU6/hSGkAlOHSm08dKAFooooAKKKKAGd6mh6Goamh+6a\r\nYElFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFIWAppcUAPpCcVGz0wsaAJS9NL1HRQA/fRvpl\r\nFAD9xpNxpM0UAODUoamUUATbhRkVFRQA8tTM0lFABmiiigAzS5pKKAHBjSh6ZS0ASh6UEVDSg0AT\r\nUUwPTgc0ALRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOtADVp1NWnUAFFFFI\r\nBDTDUhphoASlHSkpR0pgJSikpRSAdRRRSAKKKKBhRRRQIKKWigYUUUUAFFFFABRRRQBFRRRVCCii\r\nigAooooAKKKKACiiigAooooAKKKKAHJ1P0pDSr3pKACnimU8UgFooooAKKKD0oAZU8P3agqeL7lM\r\nB9FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFFABSZoJxUbPQA8timF6YTSUAKWzSZoooAKKSigBaSiigApaSloAK\r\nWkpRSAKKSloAUUGkopgFFFHagBKWkooAWiiigBaKKKACiiigBaXNJRQIeDT6jXrUlAwooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAqCTrU9QSdaAGrTqatOpAFFFFACGmGnmmGgApQOKSnDpTAbSik\r\npRSAdRRRSAKKKKACiiigBaKKKBhRRRQAUUUUAFFFFAEVFFFUIKKKKACiiigAooooAKKKKACiiigA\r\nooooAcvekpR0NJQAU8UynikAtFFFABQelFB6UAMqeL7lQVYj+4KYDqKKKACiiigAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAozRSHigB\r\naYz4prPUZOaAHM2abSUUALSUUUAFLSUUAFFFJQAtFFFABS5pKKAFzRSUUALRRRSGLRRRQAUhNFIa\r\nBBS0lFMBRRmiigBc0tNpaAFooooAWiijNAhy9akqIVIpyKBi0UUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFF\r\nFABRRRQAVBJ1qeoJOtADVp1NWnUAFFFFIBDTTTjTTQAlKOlJSjpTASlFJQKQD6KKKQBRRRQMKKKK\r\nBBRRRQAUtJS0DCiiigAooooAioooqhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACiiiigAp4pgp9I\r\nBaKKKACg9KKG6UAMqxH9wVXqyn3BTAWiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooprNgUAKxwKhZ80jNmm0AGaKKSgBaKKKACi\r\niigBaSiigApKWigBKWkooAWikooAUGnAgimUtAxcUZoopAGaKKKAA0lOoxQA2inYoxQA2ilooEFK\r\nKSloAWikopgLRSUtACinKcU2lzQIlFFMU0+gYUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABUEnWp6gk\r\n60ANWnU1adSAKKKKACmGnmmGgBKcOlNpw6UwG0Cg0CkA8UUCikAUUUUDCiiigQUUUUAFLSUtABRR\r\nRQMKKKKAIqKKKoQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAtFFFAAKfTB1p9IBaKKKACkbpS0jdK\r\nAGirK/dFVhVlfuimAtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFIaAAnFQu2TSu1RmgApKKKACiiigAooooAKWkooAWikpaACkoooAK\r\nWiigYUUuKMUgEopaMUAJS0YpaBiUuKBS0AJS0UtACYop2KCKAGUYp2KMUCG0U7FJQAUUUUCCiiim\r\nAU6m0UAPFKGpmaWgRIDS1Hml3cUDH0ZqMMaXdQA7NIWppJpDQIeG9adUQp6mgY6iiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqCTr\r\nU9QSdaAGrTqatOoAKKKKQAaYafTDQAlKOlJSjpTASgUUCgB4ooFFSAUUUUAFFFFABRRRQMKWkpaA\r\nCiiigAooooAioooqhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0UUUAA60+mjrTqQC0UUUAFI3Sl\r\npG6UANFWh0FVRVodKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFFFFABRRRQAUUUUAFFFITQAtRO9DvUZNACE0lFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAxaW\r\nkpQKQwpaMUuKAEpaUClxQAmKMU7FGKAG4pcUuKWgBuKXFLRSASilooATFJTqSgBMUmKdQaAG4pCK\r\ndiigBuKSnGkNMVhKKKKYgpwptLmgBxpKSg8UgFpcimUopgOzmkNGcUUAGaKSigRIjU+oRUitmgY6\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACoJOtT1BJ1oAatOpq06gAooopABphp9MNACUUUUwCgUUUAOFLSClqQCiiigAooooAKKKKBhRR\r\nRQAtFJS0AFFFFAEVFFFUIKKKKACiiigAooooAKKKKACiiigAooooAWiiigBR1p1NHWnUgFooooAK\r\nRqWkagBB1qzVZetWaYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFFFFABRRRQAUUUUABqN2pznAqBjzQAhNFFJQAUUUUAFFFFABRRRQAUUUUAFFFFABRRSgUDEpwFO\r\nApQKQxuKXFOooATFLilopDDFFLRTEFFFFABRRRQAUtFFABRRRQAUlFFIAooooASilpKAEpKdSUAN\r\nxSYp1JimISiikoEOUZofrSpSPyaAG0tJRmmAuaXtTaUmgANFJSZoAdSqcU2igCwpyKWoVbBqUHNA\r\nC0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB\r\nUEnWp6gk60ANWnU1adQAUUUUgCmGn0w0AJRRRTAKKKKAHClpBS1IBRRRQAUUUUAFFFFAwooooAWi\r\niigAooooAioooqhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0UUUAKOtOpq9adSAWiiigApGp1Na\r\ngBF+8Ks1XT7wqxTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAo\r\noooAKKKKACg0U1zgUARyNUdKxyabQAUUUUAFFFFABRRRQAUUUUAFFFFABRRTgKQwApwFApaChRRS\r\nUUgFooFLQAUtJS0AFFFFAgooooAKKKKAClpKKACiiigAooooAKKKKACkpaSgYUlLRQAlJS0UANNN\r\npxpDTEIpwaVqbSk0EiUUUlMBaM0UUAFFJRQAtApKUGgB1ORsGo80A0AWQaWo0NSUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABUEnWp6gk60ANWnU1a\r\ndQAUUUUgENNNONNNACUUUUwCiiigBwpaQUtSAUUUUDCiiigQUUUUAFFFFAwpaSloASloooAioooq\r\nhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFLQAUUUUAKtOpq0+kAUUUUAFNbrT6Y3WmAqfeFWKrx/fFW\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqGQ1\r\nI5wKgY80AJSUUUAFFFFABRRRQAUUUUAFFFFABRRTgKQwAp1FFIoKKBS0AFLRS0AFFFFAC0UlFAC0\r\nUlFAC0UlFABS0lFAC0UmaKAClpKKAFpKKKAClpKKACiikoAWikooAKKKKAEpDS0UAMNJTiKQ0xMS\r\nkoopkhRRRQAUUUUAFLSUUALRSUtACg4NWFORVapY2oAlooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKrydasVBJ1oAYtPpi0+gAooopAIaaetONNNACUU\r\nUUwCiiigBwpaQUtSAUUUUDCiiigAooooAKKKKBBS0lFAxaKKSgCOiiiqEFFFFABRRRQAUUUUAFFF\r\nFABRRRQAUtJS0AFFFFACrT6YtPpAFFFFABTW606mt1pgOj++KnqCL74qegAooooAKKKKACiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoopGoAjkNRGnuaZQAlFFFABRRRQAU\r\nUUUAFFFFABRRSigYCnCkFLSKFooopALRRRQAtFJRQAtFFFABRRRQAUtJRQAtFJS0AFFFJQAtFJS0\r\nAFFJS0AJRS0lABRRRQAUUUUAFFFFABRRRQAUlLRQA00hp1IaAGGkpxptMkKKKKYgooooAKKKKACi\r\niigBaUHBptFAFlDkU6oY25qagAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoo\r\nooAKKKKACiiigAqCTrU9QSdaAGLT6avWnUAFFFFIBDTTTqaaAEooopgFApKUUAOFLSClqQCiiigY\r\nUUUUAFFFFABRRRQAUUUUAFFFFAEdFFFUIKKKKACiiigAooooAKKKKACiiigApaKKACiiigBVp9NW\r\nnUgCiiigAprdadTT1pgOi+/U9QxffqagAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigApr9KdTJKAIWNJSmm0AFFFFABRRRQAUUUUAFFFFABSiilFIpC0UtFIYU\r\nUUUAFFFFAxaKSigBaKSlpCClpKKYC0UlLQAUUUUALSUUUALRSUUALRSUUALSUUUAFFLSUAFFFFAB\r\nRRRQAUlFFABRRRQAUlLRQA002n000xDaKU0lMkKKKKACiiigAooooAKKKKAHA4NTo2RVeno2KYE9\r\nFIDmlpAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOt\r\nADV606mLT6ACiiikAhpppxppoASiiimAlLSUooAcKWkFLUgFFFFAwooooAKKKKBBRRRQMKKKKACi\r\niigCOiiiqEFFFFABRRRQAUUUUAFFFFABRRRQAUtJS0AFFFFADlp1NWnUgCiiigApp606mHrTAkh+\r\n9+FTVDD941NQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAVHJUlRSdaAIjSUppKACiiigAooooAKKKKAClFFKKRSClFFFIYtFJRQAtFJS0AFFFLQAUlLRQMSl\r\npcUmKBBRRilpDEooopgLRSUtAgooooAKKKWgAoopKAFooooAKKKKAEopaKAEooooAKSlooASiloo\r\nASilpKAA0006kNADTTaeaaaYmJRRRTJCikpaACiiigAooooAKXNJRQBMjVIDVYHFPVuaYE9FIpyK\r\nWkAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFQSdanqCTrQAxetPpi9a\r\nfQAUUUUgENNNONNNACUUUUwEpRSUooAcKWkFLUgFFJRQMWiiigAooooEFFFFAwooooAKKKKAI6KK\r\nKoQUUUUAFFFFABRRRQAUUUUAFFFFABS0lLQAUUUUAOWnU1elOpAFFFFABTD1p9MPWmBLD1NS1FD1\r\nNS0AFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAB6VA55qV\r\nzxUB60AJSUtJQAUUUUAFFFFABRRSigYCnUlLSGFFFFIYUUUtACUtFFABS0lLQAtFFFAC0UUUAFJS\r\n0UAJRS0lABRRRQAUUUUAFLSUUALRSUUALRRRQAUUUUAFFFFACUUUUAFFJSigAooooAKSlpKACkpa\r\nSgBDSGnU00CG0UppKoQlFLRQIKKSigBaKSloAKKKKAClFJRQBMjVKKrocGpweKYC0UUUgCiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACoJOtT1BJ1oAYvWn0xetPoAKKKKQCGmnrTj\r\nTDQAUUUUwEpRSUooAcKKBRUgFFFFAwopaKACikooAKWkpaACiiigAooooAjoooqhBRRRQAUUUUAF\r\nFFFABRRRQAUUUUALRSUtABRRRQA5elOFNXpThSAKKKKACmd6fTKYEsPepajh6GpKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAI5DUNSPUdAAaSlpKACiiigA\r\nooooAKWkpaQ0LS0lLSKCiiigBaKKKACiiigYtFJS0AFLRRQIWikpaAClpKWgBKKKKAEooppNADqS\r\nmhqdmgBaKKKACiiigBaKKKAFpKKKACkpaSgAooooASlopaAEopaMUAJRS0lACUUtJQAhpKdSUANN\r\nNp5pppiYlJS0lMkWikooAKWkooAWiiigAooooAUVOjcVXp6HBoAsUUi0tAgooooGFFFFABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOtADF60+mL1p9ABRRRSAQ0w080w0AFFFFMBKU\r\nUlKKAHCiiipAKKKKBi0UUUAJRRRQAUtJS0CCiiigYUUUUAR0UUVQgooooAKKKKACiiigAooooAKK\r\nKKAFooooAKKKKAHDpTqaOlOpAFFFFABTKf2plMCaHoakqOH7pqSgAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACg9KKRulAELmmU5qbQMKSiigQUUUUAFFFFAC0tJSi\r\nkUFLRS0hiUtFLQAlFLS4oAbS0YooGFFFFAC0UCloEJRRRQAtFJRQAtJRRQAhNRk05qbTQBSg0lFA\r\niQUtNXpTqQwopKKAFopM0ZoAWikzS5oAWikzS5oAKKKKACiiigAooooAKKKKACkpaSgBKSnUlADT\r\nSGnUlADDRSmkqiWJRRRQIKKKKACiiigBaKKKAClHWkooAnQ5FPFQxtU4pgFFFFIAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACoJOtT1BJ1oAYvWn0xetPoAKKKKQCGmGnmmGgAooopgJSi\r\nkpRQA6igUVIBRRRQMKWkpaBCUUUUDClpKWgQUUUUAFFFFAyOiiiqEFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUtFBoAKKKKAHDpTqQdKWkAUUUUAB6UynnpTKYE8P3afTIvuU+gAooooAKKKKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACkbpS0xzQBE3WmU5utNoGFFFFAgooooAKKKKAFF\r\nLQKKRQopcUClpDDFLSUZoAWikooAWikooGLRSZozQIWlpuaN1AC0Zpu6k3UAOzRTc0uaAFzRmm5o\r\nzQANTKcaSmgYlFFFAiRelLSLwKWkMTNFFJmgAzRSUUALmjNJRQAuaXNMpaAHZozTaKAHbqXdTKKA\r\nH5pc0yjNAD80U3NGaAHUUmaKAFpKKKAEpKWkoAQ02nmmmmJjaKKKZIUUUUAFFFFABS0lLQAUUUUA\r\nKpwasIciq1TRNQBLRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABVeTrViq8nWgB\r\nq9afTF60+gAooopAIaYaeaYaACiiimAlKKSlFADhRQKKkAooooAKKKKBhRRRQAUtJS0AFFFFAgoo\r\nooGR0UUVQgooooAKKKKACiiigAooooAKKKKAFoNFK3WgBKKKKAHDpTqQUtIAooooAD0plPPSmUwJ\r\n4vuU+mxfcFOoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigANRMK\r\nexpp6UDIj1ptObrTaACiiigQUUUUAFKKSlFA0LSikpRUlC0UUUAFFFJQAtFJRQAuaTNJRQAuaM0l\r\nFAC5pKKSmAtJRRQAtGaSigBaKSigBaSlpKAEpyikpwoAdSUUlIApKKSmAUUUUCCiikoAWiiigAop\r\nKWgApaSigYtLSUtIBaKKKAEozS0UAGaM0mKKAFopM0tACU006kNAhtJSmkqiQooooAKKKKACiiig\r\nBaKKKACnIcGm0ooAsqcilqOM8VJQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUCCiiigYVBJ1\r\nqeq8nWgBq9afTF60+gAooopAIaYaeaYaACiiimAlKKSlFADqKBRSAKKKKQwooooEFFFFABS0lFAC\r\n0UUUAFFFFAEdFFFUAUUUUAFFFFABRRRQAUUUUAFFFFACilf71IOtOk4c0ANooooAeKWkFLSAKKKK\r\nAA9KZTz0pgpgWI/uCnU1PuCnUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABQaKQmgBpppPFObpTKRRGaSlNJTEFFFFAgooooAKUUlKKQ0KKWijNIoKKSigBaKKKACiiigBK\r\nKKKYCUUUUAFFJRQIWikooAWikooAWikooAWiiigBRS0lLSGLSUtJQAlJQaKYBSUtJQIKKKKBBRRR\r\nTAKKKKAFopKKQx1LTc0oNAC0tJmjNIYtFJRQAtJS0UANpaKSgBaKKKAGmm08000yWJRRRTEFFFFA\r\nBRRRQAtFFFABRRRQBJGanFVlODVhTkUALRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAgopKWgAooooA\r\nKrydasVBJ1oGMXrT6YvWn0AFFFFIBDTDTzTDQAUUCimAlLSUUALmjNJRQA7NGabRQA7NJmkooAWi\r\nkooAWjNJRQAuaM0lFAC5ozSUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAKOtOkOWNNoPWgAoooo\r\nAeKWkFLSAKKKKABulMFObpTaYFhPuCnUifdFLQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFMY80+o260DQh6UlKabSGMNJSmkpiCiiigQUUUUAApwpBS0hoWm0UUDFoooo\r\nGLRSUUgFpKM0ZoAKSjNJmmIWkoooFcKKSimAtFJS0AFFFFABRRRSAWiiigYtKKSlpDClpKKAENJS\r\nmkpgFJS0lAgooopiCiiigApKKKBC0UlFAC0ZpKKBi5pc02loC47NGabRmkO47NLmm5ozQMdRSUtI\r\nAoooxQAGmGn4ppFMQ2ilpKZIUUUUAFFFFABS0lFAC0UUUAFTRNUNOU4NAFmikU5FLQAUUUUAFFFF\r\nABRRRQAUUUUAFJS0lAgpaSloAKKKKBhUEnWp6rydaAGr1p9MXrT6ACiiikAhphp5phoAVehpDTl6\r\nGmmmAlFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAtFFFABRRRQA8UtIKWkAUUUUAI3Sm05ulNpgWV+6PpS0i/dH0paACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooopAFFFFABRRRQAVGetSHpUTdaBoTvSGgUpoKIzSUppKZIUUUUCCiiigAp\r\naSlpDQUtFFAwopKKAFpKKSgLi0maKSmK4tJRRQIKKKKACiiigAooooAKWkpaBhRRRQAtFFKBSGKK\r\nWgUopDExRTsUhoAbSGnUhoAbSUppKZLCiikpgFFFFAgopaKACiiigBKKWigBKKWkoAKKKKAFopKW\r\ngYtLTaWkMcKWmZp2aQxaaaWkNADTSUppKokKKKKBBRRRQAUUUUALRSUtABSikoFAFiM5FPqKOpaA\r\nCiiigAooooAKKKKACiiigApKWkoAKWkpaBBRRRQMKrydasVXk60ANXrT6YvWn0AFFFFIBDTDTzTD\r\nQA5ehppp6Hg0w9aAEooopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB\r\nRRRQAUUUUAFFFFABS0lFAC0UUUAPFLSCikAtFFFACN0popzdKaKYFpfuiigdBRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUgCiiigAooooAKKKKAA9KhbrUx6VC3WgaEp3amU7tQURt1pKVutJT\r\nJYUUUUCCiiigApaSlpDQUUUUDCkoooEFJRRTEFFFFABRS0UAJRS4oxQAlFLRQAlFLSUAFFFLQAUU\r\nUUhiiniminUmUFOFIKcBQAUhp1IaAG0hFOpDQAwim0800imhMSiiigQUUUtMBKKWikFgxS4oFLmg\r\ndhMUmKdSUAJijFFFACUUtFArCUUYoxTAKKXFGDSASloxS7aBiikpcUUhjTSU4000yWJRRRTEFFFF\r\nABRRRQAUtJS0AFFFFAEkR5qeq8fWrAoAKKKKACiiigAooooAKKKSgBaSikoAWikpaAFopKWgAqvJ\r\n1qxVeTrQA1etPpi9afQAUUUUgENMNPNMNADk6GmmlXvSGmAlFFFABRRRQAUUUUAFFFFABRRRQAUU\r\nUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUALQKKBQA8UUCikAUtJS0AI1NFK\r\n1A60wLI6UUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUgCiiigAooooAKKKKACiiigAPSoW61Maj\r\nagaI6U0d6CKChhpKU0lMlhRRRQIKKKKAFooopFBSUUUCCkpaKYhKWiigYUUtFIBKWiigYUUUUAJR\r\nS0lAgooooAKKKKAClApQKUCgaQCloopFCinU0U8UCYUhpaSgBKQ0tFAxtBFOpDQAwikp5FNxTEJR\r\nRijFAgooxRQAUtJRQMWiiigA4o4oxS4pAJijFOxS4oAbilC07FFAhMUUtFAxKKKKAEooooASmmnG\r\nkpiGUUppKZIUUUUAFFFFABS0lLQAUUUUAOTrVgdKrr1qwOlAC0UUUAFFFFABRRRQAUhpaKAG0UtF\r\nACUUUUAFLSUUALUD9anqB+tADV60+mL1p9ABRSUUgA0w080w0AKKSgUUwEooooAKKKKACiiigAoo\r\nooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBaBRQKAHiigUUgC\r\nlpKWgBrUDqKGoXqKYFmiiigAooooAKKKKACiiigAooooAKKKKQBRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFRsakqFutBSG96WikzQMa3WkpTSUyWFFFFAgoFFKKBoUCjFLRSKG4oxT8UYoEMxRin4oxQAyin7\r\naNtFwGUU7FJigYlFLil20ANop22l20AMop+2kIoAbRTsUbaBDcUoFOxS0DEoopaQwooopAKKcKaK\r\ndTEwpKWigQlFFFAxKKKKBiGjFFFACYoxS0tAhuKNtPooAbto206igBu2jFOooATFGKWigAxRilxS\r\n0xCYopaaaQBSUtJQMQ0lLRQMSiiigQGm06kNADTTacaSmSxKKKKYgooooAKKKKAFooooAUdasL0q\r\ntViM8UAPooooAKKKKACiiigAooooASilNNoAKKSloAKWkpaACoH61PUD9aAGr1p9MXrT6ACkoopA\r\nBphp5phoAKSlpKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFAC0CigUAPooopAFLSUtADWoX7woahfvCmBZooopAFFFFABRRRQAUUUUwCi\r\niikAUlLSUDDNLTaWgBaKSloEFFFFABRRRQAUUUUAIaibrUp6VCetBSCkNBooGNNJSmkpksKKKKBB\r\nThSAU6kUhaKKKQwpaKKAClxRRQAuKMUUtADcUYp1GKAG4pcUuKKAEooooASjFLRQAmKKKKACkpaK\r\nBjaWiikAUCigUwHClFIKdQIKQ0UUCEpKWkoGLRSUtACUUUUDDFFLRQISloooAKWkpaBCUYpaWmAm\r\nKWiloASiikoAKTNFJSGFBpKKBhSUUUAFJS0lAhaSiigBKaacaaaYmJRRRTJCiiigAooooAKWkpaA\r\nCnoeaZSg80AWBS0xDxTqQx1FJRQAtFJRQAtJRRQAUlLSUAJRRSUCHUUlLQAtV361Yqu/WmAi9afT\r\nF606kAUUUUABphp5phoAKSlpKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0CkpRQA+iiikAUtJRQAjdaF+8KRutKv3hQMnzS00U6gBa\r\nKKKBBRRRQAUUUUAFFFFACUhpaSgYlLRRSAKKKKYC0UlLQAtFFFAgooooARulQnrUrdKhPWgpAaBQ\r\naQUDEakpxptMlhRRSigBRTqSlqSgooooGFLSUtABS0lFAC0tJS0CFooFFMQUUtJQAUlLRSASiloo\r\nGJSUtFACUlLSUDCiiikAUtIKdTABTqbS0EhSUtFACUlLSUDEpaSlFAxaSg0ZoELRSUtAC0UUUCCg\r\nUUZpgLRRRQAUUUlAC5pKKSgAooopDEpKWigY2ilNJQAUlLSUAFFFFAhDSGnU00xDaKWkpkhRRRQA\r\nUUUUAFFFFAC0UlLQBIhqTNQL1qUGkMfS0gooAWikpaACiiigAooooAQ0mKdSUCExS0tFABVd+tWK\r\nrv1oARetOpq06gAooooADTDTjTTQAlFFFMAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigApRSUooAfRRRSAKKKKAGt1oX7wobrQOtAEwNOB\r\nqMUoNIokzRmmZpc0CsOopuaM0AOopKKAFooopgFJQaM0gCiiigYlFFFACilpKWmIWikpaBBRRRQA\r\njdKg71O3SoD1oKQGkpaSgYhpKU0lMlhSikpwpAhaKKWkUFFFFAwoopaACiiloAKWkpaBC0tJRTEL\r\nRRSUAFFGaKACikozSGIaKKQ0DDNJmkJpKAHUUCigBwpaSigQtLRS0xCUUtFADaSnUhpDG0Cg0CgY\r\nUlLmg0AGaUGm0A0APopoNLmgQtFJRmgB1FNzS0BYKKSigBaKSigAooooAKSiigYUlFFABSUUUAFF\r\nJS0CCmmlpDTEJSUtJTEFFFFAgooooAKKKKAClpKKAFHWpAajp4NIZIpp1MWnigApaKKAEpaSigBa\r\nKKKACikpM0ALmjNJmigBTUD9amNQt1oARadTV606gQUUUUAIaaacaaaAEooopgFFFFABRRRQAUUU\r\nUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFKKSlFAD6K\r\nKKQBRRRQA09aF+8KD1pY/vCgaJMUYp1FIY3FFLRQAlJmlNJQA4GnCmCnCgB1FFFAhppKcRSYoGJm\r\nilxRigAooxS4oAKWkpaYgpaSigBaKSloEB6VA/Wp6hkHNA0NFIetOWhqChhpKWkpksKeKYKeKTGg\r\npaKKQwooooGFLSUtAC0UlFAC0tJRQIWikooAdSUlFAC0maSkoGOzSUlGaADNITQTTaAFpQKAKdig\r\nQlLRRQMWikpc0ALS5pmaXNArDs0ZpuaTNAWHGkzRmkoADQKKKBi4GaUimgc07FAhpFNNPIppFACZ\r\npQaZS0APzRTc0ZoGOFLTaXNAC0UmaKAFopKKACiikoAU0lFFABSUtJQAUUUUCEooooAKDRRTAbSU\r\nppKCQooopiCiiigAooooAKKKKAFpy02lWkBKKeKjFPFAx1FFFABSUUUgCiiigBDSU6igBMUuKKWm\r\nAmKgfrVg1XfrQAgp1NFOoEFFFFACGmmnGmmgBKKKKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSikpRQA+iiikAUUUUANPWlj+8KQ9a\r\nWP71A0T0lFFIYUUUmKAEJpuacabigBRTxTBTxQA6ikpaYgooooAKKKKACiiigAopCabmgB9FNBpa\r\nAFoopaACopalpkg4oBEY6UhooJoKG0lLSUCYop1NFOoBC0UlLSGFFJS0DFopKKAFooooAKWkooAK\r\nKKKACikooAKKSigApKKSgApQKSnCmIcOKWm5ozSAWkzSZpM0DFzS5ptFFgHZozTc0ZosA7NJmkoo\r\nELmjNNoosA7NOBpmaXNADmpoY0uabmgCQGg0wGlzQA09aSlam0wFpabS0AOopKWkMWikozQA6ikz\r\nRmgBaSiigBKKKKACiiigApKKKBBRRRQAUUUlMANNp1NoJYUUUUxBRRRQAUUUUAFFFFABSikpRQBI\r\nDTwaiFPBpDJAaWowacDQAtFFJSAWikooGLRSUUCFpabmlBpgLVd+tWKrv1oAQU6minUCCiiigBDT\r\nTTjTTQAlFFFMAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigApRSUooAfRRRSAKKKKAGnrSx/epp60+P71A0SilpMUtIAooopgJikxTqKQxu\r\nKUUtFABS0lLTEFFFLQAlLRRQIKQ0tJQMaabin0UhiAU6kpaYgooooAKRulFB6UAQ96KQ9aKChKSl\r\nNJQJiilpBS0AhaKKSkMWikooAWlpKKBi0UUUAFFJRQAtJmikoAWikzRQAUUUlMQUUUUAFLmkooAM\r\n0ZpKKBXDNGaSimK4uaWm0tIdxaKSloAKKSigBaKSkoC4uaM0lFMVxc0ZpKKAuOozSUUh3FpKcKCK\r\nAG0UUUALS02loGLmikpaAClpKKQC5opKKBi0UlFAC0lFFAgooooAKKKKYBRRRQISkpaSgTEooopi\r\nCiiigAooooAKKKKAClpKWgBRTqaKWkMcDTgajFOBpDH0tMzS5oAdRSZpaACiiigAoFFJQIdUD9am\r\nzUDdaYAKdTRTqBBRRRQAhpppxppoASiiimAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUopKUUAPooopAFFFFADD1p8f3qYetPj60DRLS\r\n02lzSGGaM0lFAC5pabS0ALRSUmaAHUtMzSg0AOpabS0xC0UlFAC0lFJQAUUUUhhRRRQAUUUUAFFF\r\nFMCFutC0sg5pFoGDCmVI3SmUCYLS0gpaAFpKKKBhRRRQAUUUUALRSUZpDFopKKACikopiCiiigAo\r\nopKBBS0lKBQAooNKKQ0hjaKKKZIlFFLTASilpKAFooopAFFFFABSUUUwCiiigQUUtFAwoopaQCil\r\npBTqRQ0im1IRTSKYDaKKKBC0UlLQAUUUUDFopKWgAooooAKKSloAKSiigBaKSloAKSlooEJSGlpD\r\nQJiUUUUxBRRRQAUUUUAFFFFABSikpRQAtFGKWkMKBRRQMXNLmm5opAPBpc0zNLmgB4NLTAadmgBa\r\nQ0tIaAGk1Gae1RmmhMUU6miloELRSUtACGmmnGm0AJRRRTAKKKKACiiigAooooAKKKKACiiigAoo\r\nooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKUUlKKAH0UUUgCiiigBh605Ot\r\nNp8Q5NA0SUUuKMUhiUUuKMUAFJTsUYoASkxTsUYoAZilAp+KMUBcSloxRTEFLRRQIQ0maDTaQx1F\r\nIKWgYUUUUAFFFFABS0UUxDJBxUa1M/3ahHWgaHGoz1p5NMNAwFLSDrS0CCiikoGFFFFABRRRQAUU\r\nUUAFFFFABRRRQAUUlFAgooooAKeBSAUtJjFpppaaaAEooopiCiiigQUUUUAJRS0UwEopaKAEopaK\r\nAEpaKKQBRRRQAUtFFAxRTqQU6kMKaRS0UAMNJTjTaYgooooAWikpaACiiigYUUUUAFFFFABRRRQA\r\nUUUUALRSUtAhKSlNJQJiUUUUxBRRRQAUUUUAFFFFABSikpRQA6ilAyKB1pFCGkqTbSbaQDKKcRSY\r\npgJRmjFFADgacDUdKDSAlBopgNOzQAhqI1IajNNCYopaQUtAgpaSloAaaQ0ppDQAlFFFMAooooAK\r\nKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigApR\r\nSUooAfRRRSAKKKKAGVLD3qKpoe9MY+jFLRSAMUYopaAEpaKKBBRRRQAUUUUAFFFFABRRRQAhpMU6\r\n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\r\nCilFAC0UUUhhRSUUAFJRRTAKKKKBBRRRQAUUUUDCiiigQlJS0lMQUUUUCCiiigAooooAKUUlKKAH\r\nE8UgoNFIoXNJRRQMKDRRQIKM0mKKAHZpc02iiwDs0Cm0qmkBIBRigGloAYw4qM1Kw4qI00JiilpB\r\nS0CCiiigBDTacabQAUUUUwCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACnCm04UALS0lLSAKQ9KWkPSgBtPUcUypox8lDGhlGakK1GVpDD\r\ndShqYRRTAmBpwqFTUgNAh9FJmjNAC0lJmjNIYtFNzRmgB1GabupN1AD6KZuo3UAPopu6jdQA4mmM\r\naQtTCaYCHrSUUUCAU8GmUtAEmaaxpM0maBhSUtFACUtJRQAtFFFAwooooAKKKKBBRRRQMKKKKAFp\r\nabS0ALSGiikAlFLRTAKKKKAFopKKQBRSUUwFopKKAFopKKAFopKKAFozSUUALmjNJRQAtFJRQAtF\r\nJRQAtFJRQAUtJRQAtJRS0AJS0UtACYopaKQCUUUUAFJRRTAKKKKACiiigQUUUUAFFFFABRRRQAZo\r\nIzSUooEAFNNOzSGgBKKKKYgooooAKUUlLQNCmgUUopDCkpaKBiUCiigQ/HFIVp68ilxSAiIpMVIR\r\nTTQA2lAoAp4FMQoFOpMUtIBD0qA9anPSoD1poGKKWkFLQIKKKKAENNpxptMAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKcKbThQ\r\nAtLSUUgFpD0paQ9KAG1PF9wVBU8X3BQxjqQinUhpARMKYalaozQMQU8GmgU4CmA4GjNJRSAXNJSg\r\nUuKAG0lPxSEUAMJpM0rCmUwHZo3U2igVxc0ZpKKAuLmigU4CgYgWnbacBSikIZsoK1JSYoGRbaTF\r\nS4prCgBlFFFMYlFLSUCFopKWgYUUUUAFFFFABRRRQAUUUUAFFFFAC0UlLQAtJRRSAKSlpKYC0lFF\r\nABRRRQAUUlFAhaKSigBaKSigAooooAKKKKAClpKKAFpKKKACiiigBaKKKACiiigBRS0CikMKKKKA\r\nEpKWkpgFFFFAgooooAKKKKACiiigAoopKACiiigQGiiigBVGaGoBwaQnNACUUUUxBRRRQAUtFFIY\r\ntKKbTqBhQKKBQMDSUppKAJEPFPqJTzUlIQhphpxNNNAAKetMFPFAh1FFFACHpUB61O3SoD1poBVp\r\naQUtAgooooAQ02nGm0wCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigApwptOFAC0UUUgFpD0paQ9KAG1PH9wVBUinCihjRITSE0wtT\r\nd1IY4mkpM0ooAUUopKWgBaUCkzS5oAWikzRmgBaQ0maaTQANUdOJptNCYUUUUxBRRRSGKKeKaKcK\r\nQxwp1MFGaAH0ZpmaM0AOprdKXNNJoGMooNFMApKWkoEwpaSigBaKKKBhRRRQAUUUUCCiiigAoooo\r\nGFLSUtABS0gpaQBSUtJigBKKWimAlFLRQA2ilooEJRRRQAUUUUCCiiigAooooAKKKKACiiloGFFF\r\nLQAlFLilFAxMUuKWikAUUUlABSUUUAJRRRTEFFFFABRRRQAUUUUAFFFFABSUUUAFJRRTJFopKWgA\r\npKKKACiiigAooooAWiiikMWlpKUUDA0Cg0ooGBptOpDQAlPB4plKKBDiabTsUYpAAFOFAFLQIWii\r\nigBG6VAetTt0qA9aaAUUtIKWgQUUUUAIabTjTaYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU4U2nCgBaKKKQC0h6UtIelADaeB\r\nxTKmQfKKGNEZBpMVMRTCKVwGCnCkxRTGLmjNNzRmgB2aM03NGaLAOzRupuaSiwXHZpM0lFAhaMUo\r\np1AEeKKeRTaAEpaSlFACinCminA0hi0lLSUDCiiigAoPSikNADaKKKYBSUtJQJhRRRQAUtJSigAo\r\noooGFFFFAgooooAKKKKACiiigYtFFFAC0UlLSAKKKKAEopaKAEpMU6jFADaKXFGKYDaKWjFAhKKd\r\nijFADaWlxS4oAbRTsUYoGNxS4p2KMUgExRS0UAJS0UUAFFJRQAtJRRQAlFFJTAKKKKBBRRRQAUlL\r\nSUAFLSUUAFFFFABRRSUCCiiimIUUUUUgEooopgFFFFABSikpaBi0lFLSGFFFFAxadSLTqAExQRTq\r\nCOKAIjQOtOIptAEo6UuKROlOoEJS0lApCFoopaAGt0qA9anbpUB600AopaQUtAgooooAQ02nGm0w\r\nCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK\r\nKKKACiiigApwptOFAC0UUUgFpG6UtI3SgBtTp90VBUq/dFDGh9IRS0UhjMU0ipcUjCgCE0lOIpMU\r\nxCUUYpcUAJRTtpo2UANpadspNtAAKdTQKWkMU000tJigBKUUmKKYC0UlFADs0opopwFIYtJRiikA\r\nUhoopgNNFFFMBKKKKBBRRRTEFFJS0gFopKWgYUUUlABS0lFAC0UUUAFFFFABS0lFAxaWkpaQBRRR\r\nQAUtJS0AFFFFABSYpaKAExRS0hoAKWkFLQAUUUUAFFFFABS0UUAJRRRQAUUUlABRRRQAlFFJTAWk\r\noooEFFFJQAUUUUAFFFFABRRRQAUUUUCCkoopiCiiigBaWkpQKQxKSlNGKYCUUUtABRRRSGFLQKKB\r\nhRRRQA5KkqJTzUgoELRRRSAYaYakamGmMchp5qJTg1L2oEITQDTWpM0gJM0ZpgNFACseKiNPPSmU\r\n0JiilpBS0CCiiigBDTacabTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACnCm04UALRRRSAWkbpS0jdKAG1Mo+UVDVhR8ooY0FKK\r\nMUtIBKDS0lMCMijbT8UuKQDNlG2pMUlADdtLilooAMUhFOpKAGEUmKfRSGMxS4p1FADMUbafiigB\r\nm2jbT6KAGhaXFLRQAmKaRTzTDQA00lKaTFMBKKKKYwpKWigBKKKKCRKKKKYC0UCikMWiiigYlLSU\r\nUCFopKWgAoopKAFopKWgApaSigY6ikopALRSUtAC0UlGaAFoozSZoAWikooAKKKSgYtFFFABS0lF\r\nAC0UmaM0CFpKKKACikooAKKKSmAUUUUCEooooAKKKKACiiigQUUUUDCiiigQUlLSUwCiiigQUUUU\r\nAKKUGkopDFNFJT05FAxlFKwwaSgApaSloAWkpaSgYUUUUAFSKeKjp6GgB9FFFIQjVGakNMNAxtSA\r\n8VHTlNMBWplPamgUCFAp2KBThSENYcVEambpUJpgKKWkFLQIKKKKAENNpxptMAooooAKKKKACiii\r\ngAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKcKbT\r\nhQAtFFFIBaRulFDUANqyv3R9KrVZX7ooGLRRS0AJRRRQAlLSUUgFpKM0maAFopM0UDFpaSigQUUU\r\nUDEooooAKWkopAFLSZooAWkoppNACk000hNFMAxSgUopRQBEwpKlccVFTGFFJS0AJRRRQISilpKY\r\ngpaSigBaKKKQwooooAKKKKACiiigAooooAWikpaACiiigYtFJRQAtFJRQAtFJRQAuaWm0UALRSUU\r\nALRSUUALmjNJRQAtJRRQAuaSiigAooooAKKKKBBSUUUAFFFFAgooooAKKKKACiiigAooooASiiim\r\nIKKKKACiiigBRSkUCnYpFDKcpwaSkoAc1JQaKACgUUUDFpKXNJQAUUoGaDQAlOU802gUATUUg6Ut\r\nIBKa1OpDQAw0lKaSmBIORSUIaDSEKDS5pmaUGgBWPFRGnk8Uw0xMUUtIKWgQUUUUAIabTjTaYBRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAU4U2nCgBaKKKQBSGlpDQAlWh0FVatDoKBhRRRQAUUtJQAhphNPNRtxSGLmjNMzS0AOzRm\r\nm0UAPzRuqPNJuoAk3UZqPNANFgJc0ZqPNLmgB2aN1MJpuaAJN1G6o80ZosFyQtTS1MzRTsFxc0oN\r\nNoBoESg0uajzS5pDHnmo260u6kNMBKKSloGJRRRQIKSlopiEopaSgBaKSloAKKKKBhRRRSAKKKKA\r\nCiiigAooooAKWkooAWikooAWikooAKKKKAClpKKAFopKKAFopKKAFopKKACiiigAooooAWkoooAK\r\nKKKACiiigQUUUUAFFFFABRRRQAUUUUAFJS0lABRRRTEFFFFABSikpRQMdilFHakpDEPWkoNFAC0l\r\nLSUALRSUtABRSUtACrQaSigYUUUtACqadmmCnUAOpDSZopANNJSmkpgKDSmm07tQAhpM0GkoEKTT\r\naWkoEOFLSCloEFFFFACGm0ppKYBRRRQAUUUUAFFLRQAlFLRQAlFLRQAUUUUgCiiigAooooAKKKKA\r\nEooopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFOFNpRQA6ikpaQBSGlpDQAlWh0qqKsjpTGLRRR\r\nSAWkoozQAVG1PJpjUhjKKMUuKACilxSYoAQ02lNJTQgpaQUtAxaKKWkA0im1KRTCKYhtFFFMQUUY\r\npQKQxMUYp+KMUXCwyin4pMUANozS4pMUAFFFFAwooooAKKKKACkpaSmIKKKKAFopKKAFopKKAFoo\r\nopAFFFFABRRRQAUUUUAFFFFABRRRQMKKKKACiiigAooooAKKKKACiiigAooooAKKKKBBRRRQAUUU\r\nUAFFFFABRRRQAUUUUAFFFFABRRRQAUlLSUxBRRRQAUUUUAFFFFAx60GkBopDA0lKaSgBaSlpKACl\r\npKKACnCm0tACkUlLmkoGFFFFABThTactAC0UtGKQDTSGn4pCKAGUopCKUUwA02nkZppFBIlJSmkp\r\niHCikFLSAKKKKAEpKWkpgFFFFABRRRQAtFFFIAooooAKKKKACiiigAooooAKKKKACiiigBKKKKYB\r\nRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSikpRQAtFFFIBaQ0tIaAEFWRVYdas0DQtFJS0AJRRRQA\r\nhpppxpKQxAKXFKKKAExQRS0UAMIphFSmmkUAMopSKSgBRSim04UAOppFPpDTEREUYpxFAoAQClpQ\r\nKWkMSiijNABSUZooAMUmKdSUAJikIp4oYcUwGUlFFABRRRQAUUUUwEooooEFFFFABRRRQAUUUUAF\r\nLSUUALRSUtABRSUUALRRRQAlFLRQAUUUUAFFFFABRRSUALRRSUALRSUUALRRRQAUUUUAFFFFABRR\r\nRQAUUUUgCiiigAoopKAFooooAKKKKACkpaSmIKKKKACiiigAooooGKKWkpaQwpKWkoAWkoooAKKK\r\nKACloooGFFFFABRRRQAtA60lFAEgpaap4p1ABTTTqQ0hDaMUZozQMdikNANITQIQ0ynE02mJiilp\r\nBS0CCiiigBKSlpKYBRRRQAUUUUALRRRSAKKKKACiiigAooooAKKKKACiiigAooooASiiimAUUUUA\r\nFFFFABRRRQAUUUUAFFFFABRRRQAUopKUUALRRRSAWkNLSGgBB1qzVYVNmhjQ7NGaYTSbqQyTNFMD\r\nUuaAHUlFFAC0UlFAC0UlGaACg0ZpKAEIpMU6koAbSig02gB+aM0zNGaYCmgUmaAaQD6KbmlzQAhp\r\nKCaSgBc0maSimA7NGaSigBwNDHim0GgBKKKKACiiigAooooASiiimIKKKKACilpKACiiigAooooA\r\nKKKKACiiigAooooAWikooAWikooAWikooAWiikoAWikooAKKKKAFopKKAFopKKAFopKKAFpKKKAF\r\npKKKACiiigAooooAKWkpaACiiikAUlLSUxBRRRQAUUUpoASlpKKBhS0lKKAFooopDCkoooAKKKKA\r\nFooooGFFFFABRRRQAUUUUAOU07NR07NADs0hNNooAKKSnCgBKQmlJppoEFJS0lMkUUtIKWgAooop\r\nAJSUtJTAKKKKACiiigBaKKKQBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACUUUUwCiiigAooooAKKK\r\nKACiiigAooooAKKKKAClFJSigBaKKKQBQaKQ0AFSVGKkxQxoQ02nEU00DFFOFMpwpAPFFJQKAFpa\r\nSigAooooAKKSloAKSlooAaaaaeaYaBDaKKKYBS0lFADs0maKKBhSUtJQIKKKKACiiloAKKKKBiUU\r\ntFACUUUUAFFFFMAooFLQAlFFJQIWkoooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigQUUUUAFFFFABRRRQAUUUUDCloopAFFFFABSUtJTAKKKKB\r\nBSmkooGFFFLQAlKKKKAFooopDEooooAKKKKAClpKWgYUUUUAFFFFABRRRQAUtJRQAtFFAoAWilpp\r\npAIaBRQKYARTae3SmUEiilpBS0xBRRRSASkpaSmAUUUUAFLSUtABRRRSAKKKKACiiigAooooAKKK\r\nKACiiigAooooASiiimAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUopKUUALRRRSAKQ0tIaAAdalq\r\nIdamoY0NNNNPNNNIBtOFJSimAopabmjNIY7NFNzRmgB9FNzRmgB1FNzS5oAWikzRmgANNNKTTCaA\r\nENFFApiFApcUq07FAxmKMU/FGKAI8UVJikKUAR0op22lAoAQLShKXNJuoACAKbSmkoKA02lpKBMK\r\nKKKYgFLSUUAFFFFAhKKKWgBKKWkoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKBBRRRQAUUUU\r\nAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQMKWiikAUUUUAFFFFABRRRQAlFFFMAoopa\r\nAEpaKKACiiigBaKBRikUFJS0lAgooooAKWkooAWiiigYUUUUAFFFFABRRRQA4UUgpaAFppp1IaAG\r\n0UUtAA3SmU89KZTJYopaQUtAgooopAJSUtJTAKKKKAClpKWgAooopAFFFFABRRRQAUUUUAFFFFAB\r\nRRRQAUUUUAJRRRTAKKKKACiiigAooooAKKKKACiiigAooooAKUUlKKAFooopAFIaWkNAAOoqaoR1\r\nqWgaCmmlpDQAlFFLSASkp1JTASilpKADNGaMUoFAwzS0AU4CkAlGKdiigBpFNIqSmmgCOgCnEUAU\r\nxCinCkopDHUUzNLmgY+mk0hNNJpjHZozTQaWgAJzQBQKXFMBKSnEUAZpANIpKkxTStMQ2kNLQaBD\r\naKWigQlFFFABS0lFAC0lFFABRRS0AJRRRQAUUUUCCiiigYUUUUAFFFFABRRRQIKKKKBhRRRQAUUU\r\nUCCiiigAooooAKKKKACiiigAooooAKKKKBhRRRQAUtJRQAtFFFIAooooAKKKKACkpaKAEpRSUopg\r\nBooNFIAooooGKKWm08UDEpDTqaaAEooooEFFFFAC0UUUDCiiigAooooGFFFLQIQU+m0ooAWkoopA\r\nJRQaSmMCabTjTaZDFFLSCloEFFFFIBKSlpKYBRRRQAUtJS0AFFFFIAooooAKKKKACiiigAooooAK\r\nKKKACiiigBKKKKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSikpRQAtFFFIApDS0hoAB1qTNRCn\r\nUDQ7NJmkooAWikooAWikooAKUCilAoGKBRilFLSATFLSUtAC0UmaKACkNFIaACikpQaACg0tJTGJ\r\nRRRigYlJTsUpFADRQRTlFDntQA0Gn5xUdOBpiHMaaDQTmigY7NNJopKAENFLSUgEooopkhSUUtAh\r\nKKWigBKKWkoAKWkpaACiikoAWkopaAEopaSgAooooAKKKKACiiloASiiigAooooAKKKKACiiigAo\r\noooAKKKKBBRRRQAUUUUAFFFFAwooooAWikpaACiiikAUUUUAFFFFABRRRQAlKKSlpgLSUUUhhRRR\r\nQAU4Gm0ooAWkNLSGgYUlFFAgooooAKWkooAWikpaBhRRRQAUUUUALQKSloAWigUtIBppKcabTAQ0\r\nlKaSmSxRS0CigQUUUUgEpKWkpgFFFFABS0lLQAUUUUgCiiigAooooAKKKKACiiigAooooAKKKKAE\r\nooopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFKKSloAWikpaACkNLSGgBBTqaOtPpDCjFFFIBKK\r\nWkpgFKKSlFAxcUtApaQBRmikoAKWiigBaKKSgApppTTSaADNApKcBTGLRRRQMKKKSgYuaSg0CgBw\r\n4FMPWgmgUCFxxSU7NNoAKKUCigAoopKAFpDRS0wG0lKaMUCY2lpKKCRaKKKACiiigAxS4oozQMSi\r\niigAooooAKKKKBBSUtFACUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUtJRQAtJS0UAJRS4pKACiii\r\ngAoopaAEoopaACiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUwCgUUUALRRRSKEooooJCi\r\niimAUUUUhhS0lFAxaKKKAAUppKWgBKWkooAdS00UtIBaaaWkNMBDTaU0lMli0tJS0CCiiikAlJS0\r\nlMAooooAKWkpaACiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAlFFFMAooooAKKKKACiiigAoo\r\nooAKKKKACiiigApaKKACiiigBaQ0UUAA60+iikxoKMUUUhhSUUUAJSiiimA4UtFFIAooooAKWiig\r\nAppoooAQ0lFFAxQKWiimMKSiigYUmaKKACjtRRQISloooAWjFFFAxaSiigQUGiigBKXNFFACUCii\r\nmA00lFFBDCiiigApaKKACiiigYUUUUAFFFFIAooopgFFFFABSUUUCCiiigAooooAKWiigBKKKKAC\r\niiigAooooAKWiigAooooAKKKKAEooooAWiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAF\r\nJRRTAKKKKAFpaKKBiGiiikAUUUUxBRRRSGFFFFABS0UUDCgUUUABooooAKWiigAooooAaaSiimSx\r\naWiigQUUUUAJSUUUAFFFFABS0UUAFFFFIAooooAKKKKACiiigAooooAKKKKACiiigD//2Q==', 'asha1', '2016-09-12 18:21:44', 'asha1', '2015-08-11 18:21:44', 'wasqfrtgyhug');
INSERT INTO `hm_patient` (`Patient_id`, `PinCode`, `Village_id`, `City_id`, `District_id`, `State_ID`, `Country_ID`, `Card_Type_id`, `Gender_Id`, `Cast_Category_Id`, `Patient_Salutation`, `Patient_FName`, `Patient_MName`, `Patient_LName`, `Patient_DOB`, `Patient_Age`, `Patient_Language`, `Patient_POB`, `Education`, `Patient_BPL`, `Patient_Marital_Status`, `Patient_Contact`, `Address_line1`, `Address_line2`, `Patient_Emergency_number`, `Patient_Ward`, `Patient_Image`, `Created_By`, `Created_Date`, `Updated_By`, `Updated_Date`, `Card_Number`) VALUES
('asha7820', '41001', 6, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Shantabai', 'Prakash', 'Patil', '1984-09-12', 32, 'Marathi', 'Kolhapur', 'Literate', 0, 'Married', 4294967295, 'Kothrud pune', '', 4294967295, '12', '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAKBueIx4ZKCMgoy0qqC+8P//8Nzc8P//////////////\r\n////////////////////////////////////////////2wBDAaq0tPDS8P//////////////////\r\n////////////////////////////////////////////////////////////wAARCAPIBRADASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwCGiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigApaSloAKB1opR1oAdS0lLSAKKKKAEbpTKc3Sm0wCiiig\r\nBKKWigBKWiigBKKWigBKWiigAooooASilooASilooASilooASilooASilooAKSlooASilooASilo\r\noASilooASilooASilooASilooASloooAKSlooASiiloASiiigAooooAKKKKACiiigAooooAKKKKA\r\nCiiigAoopaAEopaKAEpaKKACiiigApKWigBKWiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooASilooASilpKACiiigAooooAKKKKACiiigAoopaAEpa\r\nKKACiiigAooooActOpq06kAUUUUAIaZTzTKAEpaKKYBThTacKQC0tJS0gCiiigYUUUUAFFFFABS0\r\nlLQAUUUUALRSUtAEFFFFUIKKKKACiiigAooooAKKKKACiiigAooooAKWkpRQAUo60lKvWgB1LSUt\r\nIAooooAa3Sm05qbTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAEopaKACiiigApKWigApKWigAoo\r\nooAKKKKACiiigAooooActOpq06kAUUUUAIaZTzTDQAlO7UlL2pgJThTacKQC0tJS0gCiiigYUUUU\r\nAFFFFABS0lLQAUUUUALRSUtAEFFFFUIKKKKACiiigAooooAKKKKACiiigAooooAKXtSU4dKAEpVp\r\nKVaAHUtJS0gCiiigBrU2nNQo+YUwExRg1ZxS4FAFXFGKtYFGBQBVxRirOB6UYFAFbFGKs4HpRgel\r\nAFbFGKs7R6UbR6UAVqKs7R6UbR6UAVqKs7R6CjaPQUAVaKs7F9BRsX0FAFairOxfSjYvpQBWoqzs\r\nX0o2L6UAVqKs7F9KPLX0oArUVY8tfSjy19KAK9FWPLX0o8tfSgCvRVjyl9KPKWgCvRVjylpPKWgC\r\nCip/KWjyloAgoqfyhR5QoAgoqfyhSeUPWgCGipvKHrR5Q9aAIaKm8ketHk+9AENFTeT70eT70AQ0\r\nVL5PvR5PvQBFRUvkn1o8k+tAEVFS+UfWk8o+tAEdFSeUaPKagCOipPKajymoAjop/lNR5bUAMop/\r\nlt6UeW3pQAyin+W3pSeW3pQA2inbG9KNjelADaKdsPpRtPpQA2inbT6UbT6UANopdpo2n0oASilw\r\naMGgBKKXBoxQAlFLijFACUUuKKAEopaKAEopaKAEopaKAEopaKAEopaKAEpaKKAEopaKAEopaKAE\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBy06mrTqQBRRR\r\nQAhphp5phoAKcOlNp6j5aYDTSikNKKQC0tJS0gCiiigYUUUUAFFFFABS0lLQAUUUUAFLSUUAQ0UU\r\nVQgooooAKKKKACiiigAooooAKKKKACiiigApw6U2nfw0AJSrSUq0AOpaKKQBRRRQA1qE+8KG60sf\r\n3xTAsUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUU\r\nUAFFFFABRRRQAUUUUAFGKKKADFGBRRQAYFJgelLRQAmB6UbR6UtFACbR6UbR6UtFACbR6UmxfSnU\r\nUAN2L6UbF9KdRQA3y19KPLWnUUAM8taPLWn0UAM8oUeUKfRQBH5Qo8oVJRQBH5Qo8r3qSigCPyve\r\nk8r3qWigCLyqPKqWigCHyjR5RqaigCHyjSeUanooAg8o0eWanooAr+W1HlmrFFAFfyzRsPpViigC\r\ntsPpRsPpVmjFAFbafSjafSrOKMCgCrtPpRtPpVrApMCgCtg0YNWdo9KNooArYNGKs7R6UbR6UAVs\r\nUYqxsFGwUAVqKs7BULjBoARadTVp1IAooooADUZqQ1GaACng/LTKcvSmAhoFBoFIB1FFLSAKKSlo\r\nAKKKKBhRRRQAUtJRQAtFFFABRRRQBDRRRVCCiiigAooooAKKKKACiiigAooooAKKKKACn44ptO/h\r\npANpVpKctMB1FFFIAooooAa3Wlj++KRutOi++KYE9FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAHpUEnWp6gk60ANWnU1adSAKKKKAENMNPNMNABTh0p\r\ntKOlMANApDSikA6lpKKQBS0lFAxaKKKACiiigAooooAWiiigAooooAhoooqhBRRRQAUUUUAFFFFA\r\nBRRRQAUUUUAFFFFAC07tTRSnpSASnLTactADqKKKACiiigBrdadF9+mnrT4fvUwJqKKKACiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACii\r\nigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqCTrU9QSdaAGrTqat\r\nOpAFFFFAAaYaeaYaAEpwHFNpwPFMBDQKQ0opAOooopALRSUUDFooooAKKKKACiiigBaKSloAKKKK\r\nAIaKKKoQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAopTSDrS0AJTlptOXpQA6iiikAUUUUAMPWpIf\r\nvGoz1qWHqaYEtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAVBJ1qeoJOtADVp1NWnUgCiiigBDTDTzTDQAUo6UlKOlMBKUUlKKQDqKKKQBRS0lAwoopa\r\nACiiigAooooAKWkooAWiiigCGiiiqEFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAKvWlNCfeoNIBKc\r\nvSm04dKAHUUUUAFFFFADD1qWHvUR61LD3pgS0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFF\r\nFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFFFFABRRRQAUUmaXNABRRmkzQAtFJmjNAC0UmaM0ALRRmk3UALRTd1G+gB1FN3UuaAFoozRQAUU\r\nUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRR\r\nQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOtADVp1NWnUgCiiigB\r\nDTDTzTDQAUvakpe1MBKUUlKKQDqKKKQBRRRQMKKKWgBKWiigAooooAKKKKAClpKKAIqKKKoQUUUU\r\nAFFFFABRRRQAUUUUAFFFFABRRRQA5OtBpU6/hSGkAlOHSm08dKAFooooAKKKKAGd6mh6Goamh+6a\r\nYElFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFIWAppcUAPpCcVGz0wsaAJS9NL1HRQA/fRvpl\r\nFAD9xpNxpM0UAODUoamUUATbhRkVFRQA8tTM0lFABmiiigAzS5pKKAHBjSh6ZS0ASh6UEVDSg0AT\r\nUUwPTgc0ALRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOtADVp1NWnUAFFFFI\r\nBDTDUhphoASlHSkpR0pgJSikpRSAdRRRSAKKKKBhRRRQIKKWigYUUUUAFFFFABRRRQBFRRRVCCii\r\nigAooooAKKKKACiiigAooooAKKKKAHJ1P0pDSr3pKACnimU8UgFooooAKKKD0oAZU8P3agqeL7lM\r\nB9FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFFABSZoJxUbPQA8timF6YTSUAKWzSZoooAKKSigBaSiigApaSloAK\r\nWkpRSAKKSloAUUGkopgFFFHagBKWkooAWiiigBaKKKACiiigBaXNJRQIeDT6jXrUlAwooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAqCTrU9QSdaAGrTqatOpAFFFFACGmGnmmGgApQOKSnDpTAbSik\r\npRSAdRRRSAKKKKACiiigBaKKKBhRRRQAUUUUAFFFFAEVFFFUIKKKKACiiigAooooAKKKKACiiigA\r\nooooAcvekpR0NJQAU8UynikAtFFFABQelFB6UAMqeL7lQVYj+4KYDqKKKACiiigAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAozRSHigB\r\naYz4prPUZOaAHM2abSUUALSUUUAFLSUUAFFFJQAtFFFABS5pKKAFzRSUUALRRRSGLRRRQAUhNFIa\r\nBBS0lFMBRRmiigBc0tNpaAFooooAWiijNAhy9akqIVIpyKBi0UUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFF\r\nFABRRRQAVBJ1qeoJOtADVp1NWnUAFFFFIBDTTTjTTQAlKOlJSjpTASlFJQKQD6KKKQBRRRQMKKKK\r\nBBRRRQAUtJS0DCiiigAooooAioooqhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACiiiigAp4pgp9I\r\nBaKKKACg9KKG6UAMqxH9wVXqyn3BTAWiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooprNgUAKxwKhZ80jNmm0AGaKKSgBaKKKACi\r\niigBaSiigApKWigBKWkooAWikooAUGnAgimUtAxcUZoopAGaKKKAA0lOoxQA2inYoxQA2ilooEFK\r\nKSloAWikopgLRSUtACinKcU2lzQIlFFMU0+gYUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABUEnWp6gk\r\n60ANWnU1adSAKKKKACmGnmmGgBKcOlNpw6UwG0Cg0CkA8UUCikAUUUUDCiiigQUUUUAFLSUtABRR\r\nRQMKKKKAIqKKKoQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAtFFFAAKfTB1p9IBaKKKACkbpS0jdK\r\nAGirK/dFVhVlfuimAtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFIaAAnFQu2TSu1RmgApKKKACiiigAooooAKWkooAWikpaACkoooAK\r\nWiigYUUuKMUgEopaMUAJS0YpaBiUuKBS0AJS0UtACYop2KCKAGUYp2KMUCG0U7FJQAUUUUCCiiim\r\nAU6m0UAPFKGpmaWgRIDS1Hml3cUDH0ZqMMaXdQA7NIWppJpDQIeG9adUQp6mgY6iiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqCTr\r\nU9QSdaAGrTqatOoAKKKKQAaYafTDQAlKOlJSjpTASgUUCgB4ooFFSAUUUUAFFFFABRRRQMKWkpaA\r\nCiiigAooooAioooqhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0UUUAA60+mjrTqQC0UUUAFI3Sl\r\npG6UANFWh0FVRVodKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFFFFABRRRQAUUUUAFFFITQAtRO9DvUZNACE0lFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAxaW\r\nkpQKQwpaMUuKAEpaUClxQAmKMU7FGKAG4pcUuKWgBuKXFLRSASilooATFJTqSgBMUmKdQaAG4pCK\r\ndiigBuKSnGkNMVhKKKKYgpwptLmgBxpKSg8UgFpcimUopgOzmkNGcUUAGaKSigRIjU+oRUitmgY6\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACoJOtT1BJ1oAatOpq06gAooopABphp9MNACUUUUwCgUUUAOFLSClqQCiiigAooooAKKKKBhRR\r\nRQAtFJS0AFFFFAEVFFFUIKKKKACiiigAooooAKKKKACiiigAooooAWiiigBR1p1NHWnUgFooooAK\r\nRqWkagBB1qzVZetWaYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFFFFABRRRQAUUUUABqN2pznAqBjzQAhNFFJQAUUUUAFFFFABRRRQAUUUUAFFFFABRRSgUDEpwFO\r\nApQKQxuKXFOooATFLilopDDFFLRTEFFFFABRRRQAUtFFABRRRQAUlFFIAooooASilpKAEpKdSUAN\r\nxSYp1JimISiikoEOUZofrSpSPyaAG0tJRmmAuaXtTaUmgANFJSZoAdSqcU2igCwpyKWoVbBqUHNA\r\nC0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB\r\nUEnWp6gk60ANWnU1adQAUUUUgCmGn0w0AJRRRTAKKKKAHClpBS1IBRRRQAUUUUAFFFFAwooooAWi\r\niigAooooAioooqhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0UUUAKOtOpq9adSAWiiigApGp1Na\r\ngBF+8Ks1XT7wqxTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAo\r\noooAKKKKACg0U1zgUARyNUdKxyabQAUUUUAFFFFABRRRQAUUUUAFFFFABRRTgKQwApwFApaChRRS\r\nUUgFooFLQAUtJS0AFFFFAgooooAKKKKAClpKKACiiigAooooAKKKKACkpaSgYUlLRQAlJS0UANNN\r\npxpDTEIpwaVqbSk0EiUUUlMBaM0UUAFFJRQAtApKUGgB1ORsGo80A0AWQaWo0NSUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABUEnWp6gk60ANWnU1a\r\ndQAUUUUgENNNONNNACUUUUwCiiigBwpaQUtSAUUUUDCiiigQUUUUAFFFFAwpaSloASloooAioooq\r\nhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFLQAUUUUAKtOpq0+kAUUUUAFNbrT6Y3WmAqfeFWKrx/fFW\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqGQ1\r\nI5wKgY80AJSUUUAFFFFABRRRQAUUUUAFFFFABRRTgKQwAp1FFIoKKBS0AFLRS0AFFFFAC0UlFAC0\r\nUlFAC0UlFABS0lFAC0UmaKAClpKKAFpKKKAClpKKACiikoAWikooAKKKKAEpDS0UAMNJTiKQ0xMS\r\nkoopkhRRRQAUUUUAFLSUUALRSUtACg4NWFORVapY2oAlooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKrydasVBJ1oAYtPpi0+gAooopAIaaetONNNACUU\r\nUUwCiiigBwpaQUtSAUUUUDCiiigAooooAKKKKBBS0lFAxaKKSgCOiiiqEFFFFABRRRQAUUUUAFFF\r\nFABRRRQAUtJS0AFFFFACrT6YtPpAFFFFABTW606mt1pgOj++KnqCL74qegAooooAKKKKACiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoopGoAjkNRGnuaZQAlFFFABRRRQAU\r\nUUUAFFFFABRRSigYCnCkFLSKFooopALRRRQAtFJRQAtFFFABRRRQAUtJRQAtFJS0AFFFJQAtFJS0\r\nAFFJS0AJRS0lABRRRQAUUUUAFFFFABRRRQAUlLRQA00hp1IaAGGkpxptMkKKKKYgooooAKKKKACi\r\niigBaUHBptFAFlDkU6oY25qagAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoo\r\nooAKKKKACiiigAqCTrU9QSdaAGLT6avWnUAFFFFIBDTTTqaaAEooopgFApKUUAOFLSClqQCiiigY\r\nUUUUAFFFFABRRRQAUUUUAFFFFAEdFFFUIKKKKACiiigAooooAKKKKACiiigApaKKACiiigBVp9NW\r\nnUgCiiigAprdadTT1pgOi+/U9QxffqagAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigApr9KdTJKAIWNJSmm0AFFFFABRRRQAUUUUAFFFFABSiilFIpC0UtFIYU\r\nUUUAFFFFAxaKSigBaKSlpCClpKKYC0UlLQAUUUUALSUUUALRSUUALRSUUALSUUUAFFLSUAFFFFAB\r\nRRRQAUlFFABRRRQAUlLRQA002n000xDaKU0lMkKKKKACiiigAooooAKKKKAHA4NTo2RVeno2KYE9\r\nFIDmlpAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOt\r\nADV606mLT6ACiiikAhpppxppoASiiimAlLSUooAcKWkFLUgFFFFAwooooAKKKKBBRRRQMKKKKACi\r\niigCOiiiqEFFFFABRRRQAUUUUAFFFFABRRRQAUtJS0AFFFFADlp1NWnUgCiiigApp606mHrTAkh+\r\n9+FTVDD941NQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAVHJUlRSdaAIjSUppKACiiigAooooAKKKKAClFFKKRSClFFFIYtFJRQAtFJS0AFFFLQAUlLRQMSl\r\npcUmKBBRRilpDEooopgLRSUtAgooooAKKKWgAoopKAFooooAKKKKAEopaKAEooooAKSlooASiloo\r\nASilpKAA0006kNADTTaeaaaYmJRRRTJCikpaACiiigAooooAKXNJRQBMjVIDVYHFPVuaYE9FIpyK\r\nWkAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFQSdanqCTrQAxetPpi9a\r\nfQAUUUUgENNNONNNACUUUUwEpRSUooAcKWkFLUgFFJRQMWiiigAooooEFFFFAwooooAKKKKAI6KK\r\nKoQUUUUAFFFFABRRRQAUUUUAFFFFABS0lLQAUUUUAOWnU1elOpAFFFFABTD1p9MPWmBLD1NS1FD1\r\nNS0AFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAB6VA55qV\r\nzxUB60AJSUtJQAUUUUAFFFFABRRSigYCnUlLSGFFFFIYUUUtACUtFFABS0lLQAtFFFAC0UUUAFJS\r\n0UAJRS0lABRRRQAUUUUAFLSUUALRSUUALRRRQAUUUUAFFFFACUUUUAFFJSigAooooAKSlpKACkpa\r\nSgBDSGnU00CG0UppKoQlFLRQIKKSigBaKSloAKKKKAClFJRQBMjVKKrocGpweKYC0UUUgCiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACoJOtT1BJ1oAYvWn0xetPoAKKKKQCGmnrTj\r\nTDQAUUUUwEpRSUooAcKKBRUgFFFFAwopaKACikooAKWkpaACiiigAooooAjoooqhBRRRQAUUUUAF\r\nFFFABRRRQAUUUUALRSUtABRRRQA5elOFNXpThSAKKKKACmd6fTKYEsPepajh6GpKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAI5DUNSPUdAAaSlpKACiiigA\r\nooooAKWkpaQ0LS0lLSKCiiigBaKKKACiiigYtFJS0AFLRRQIWikpaAClpKWgBKKKKAEooppNADqS\r\nmhqdmgBaKKKACiiigBaKKKAFpKKKACkpaSgAooooASlopaAEopaMUAJRS0lACUUtJQAhpKdSUANN\r\nNp5pppiYlJS0lMkWikooAKWkooAWiiigAooooAUVOjcVXp6HBoAsUUi0tAgooooGFFFFABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOtADF60+mL1p9ABRRRSAQ0w080w0AFFFFMBKU\r\nUlKKAHCiiipAKKKKBi0UUUAJRRRQAUtJS0CCiiigYUUUUAR0UUVQgooooAKKKKACiiigAooooAKK\r\nKKAFooooAKKKKAHDpTqaOlOpAFFFFABTKf2plMCaHoakqOH7pqSgAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACg9KKRulAELmmU5qbQMKSiigQUUUUAFFFFAC0tJSi\r\nkUFLRS0hiUtFLQAlFLS4oAbS0YooGFFFFAC0UCloEJRRRQAtFJRQAtJRRQAhNRk05qbTQBSg0lFA\r\niQUtNXpTqQwopKKAFopM0ZoAWikzS5oAWikzS5oAKKKKACiiigAooooAKKKKACkpaSgBKSnUlADT\r\nSGnUlADDRSmkqiWJRRRQIKKKKACiiigBaKKKAClHWkooAnQ5FPFQxtU4pgFFFFIAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACoJOtT1BJ1oAYvWn0xetPoAKKKKQCGmGnmmGgAooopgJSi\r\nkpRQA6igUVIBRRRQMKWkpaBCUUUUDClpKWgQUUUUAFFFFAyOiiiqEFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUtFBoAKKKKAHDpTqQdKWkAUUUUAB6UynnpTKYE8P3afTIvuU+gAooooAKKKKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACkbpS0xzQBE3WmU5utNoGFFFFAgooooAKKKKAFF\r\nLQKKRQopcUClpDDFLSUZoAWikooAWikooGLRSZozQIWlpuaN1AC0Zpu6k3UAOzRTc0uaAFzRmm5o\r\nzQANTKcaSmgYlFFFAiRelLSLwKWkMTNFFJmgAzRSUUALmjNJRQAuaXNMpaAHZozTaKAHbqXdTKKA\r\nH5pc0yjNAD80U3NGaAHUUmaKAFpKKKAEpKWkoAQ02nmmmmJjaKKKZIUUUUAFFFFABS0lLQAUUUUA\r\nKpwasIciq1TRNQBLRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABVeTrViq8nWgB\r\nq9afTF60+gAooopAIaYaeaYaACiiimAlKKSlFADhRQKKkAooooAKKKKBhRRRQAUtJS0AFFFFAgoo\r\nooGR0UUVQgooooAKKKKACiiigAooooAKKKKAFoNFK3WgBKKKKAHDpTqQUtIAooooAD0plPPSmUwJ\r\n4vuU+mxfcFOoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigANRMK\r\nexpp6UDIj1ptObrTaACiiigQUUUUAFKKSlFA0LSikpRUlC0UUUAFFFJQAtFJRQAuaTNJRQAuaM0l\r\nFAC5pKKSmAtJRRQAtGaSigBaKSigBaSlpKAEpyikpwoAdSUUlIApKKSmAUUUUCCiikoAWiiigAop\r\nKWgApaSigYtLSUtIBaKKKAEozS0UAGaM0mKKAFopM0tACU006kNAhtJSmkqiQooooAKKKKACiiig\r\nBaKKKACnIcGm0ooAsqcilqOM8VJQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUCCiiigYVBJ1\r\nqeq8nWgBq9afTF60+gAooopAIaYaeaYaACiiimAlKKSlFADqKBRSAKKKKQwooooEFFFFABS0lFAC\r\n0UUUAFFFFAEdFFFUAUUUUAFFFFABRRRQAUUUUAFFFFACilf71IOtOk4c0ANooooAeKWkFLSAKKKK\r\nAA9KZTz0pgpgWI/uCnU1PuCnUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABQaKQmgBpppPFObpTKRRGaSlNJTEFFFFAgooooAKUUlKKQ0KKWijNIoKKSigBaKKKACiiigBK\r\nKKKYCUUUUAFFJRQIWikooAWikooAWikooAWiiigBRS0lLSGLSUtJQAlJQaKYBSUtJQIKKKKBBRRR\r\nTAKKKKAFopKKQx1LTc0oNAC0tJmjNIYtFJRQAtJS0UANpaKSgBaKKKAGmm08000yWJRRRTEFFFFA\r\nBRRRQAtFFFABRRRQBJGanFVlODVhTkUALRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAgopKWgAooooA\r\nKrydasVBJ1oGMXrT6YvWn0AFFFFIBDTDTzTDQAUUCimAlLSUUALmjNJRQA7NGabRQA7NJmkooAWi\r\nkooAWjNJRQAuaM0lFAC5ozSUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAKOtOkOWNNoPWgAoooo\r\nAeKWkFLSAKKKKABulMFObpTaYFhPuCnUifdFLQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFMY80+o260DQh6UlKabSGMNJSmkpiCiiigQUUUUAApwpBS0hoWm0UUDFoooo\r\nGLRSUUgFpKM0ZoAKSjNJmmIWkoooFcKKSimAtFJS0AFFFFABRRRSAWiiigYtKKSlpDClpKKAENJS\r\nmkpgFJS0lAgooopiCiiigApKKKBC0UlFAC0ZpKKBi5pc02loC47NGabRmkO47NLmm5ozQMdRSUtI\r\nAoooxQAGmGn4ppFMQ2ilpKZIUUUUAFFFFABS0lFAC0UUUAFTRNUNOU4NAFmikU5FLQAUUUUAFFFF\r\nABRRRQAUUUUAFJS0lAgpaSloAKKKKBhUEnWp6rydaAGr1p9MXrT6ACiiikAhphp5phoAVehpDTl6\r\nGmmmAlFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAtFFFABRRRQA8UtIKWkAUUUUAI3Sm05ulNpgWV+6PpS0i/dH0paACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooopAFFFFABRRRQAVGetSHpUTdaBoTvSGgUpoKIzSUppKZIUUUUCCiiigAp\r\naSlpDQUtFFAwopKKAFpKKSgLi0maKSmK4tJRRQIKKKKACiiigAooooAKWkpaBhRRRQAtFFKBSGKK\r\nWgUopDExRTsUhoAbSGnUhoAbSUppKZLCiikpgFFFFAgopaKACiiigBKKWigBKKWkoAKKKKAFopKW\r\ngYtLTaWkMcKWmZp2aQxaaaWkNADTSUppKokKKKKBBRRRQAUUUUALRSUtABSikoFAFiM5FPqKOpaA\r\nCiiigAooooAKKKKACiiigApKWkoAKWkpaBBRRRQMKrydasVXk60ANXrT6YvWn0AFFFFIBDTDTzTD\r\nQA5ehppp6Hg0w9aAEooopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB\r\nRRRQAUUUUAFFFFABS0lFAC0UUUAPFLSCikAtFFFACN0popzdKaKYFpfuiigdBRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUgCiiigAooooAKKKKAA9KhbrUx6VC3WgaEp3amU7tQURt1pKVutJT\r\nJYUUUUCCiiigApaSlpDQUUUUDCkoooEFJRRTEFFFFABRS0UAJRS4oxQAlFLRQAlFLSUAFFFLQAUU\r\nUUhiiniminUmUFOFIKcBQAUhp1IaAG0hFOpDQAwim0800imhMSiiigQUUUtMBKKWikFgxS4oFLmg\r\ndhMUmKdSUAJijFFFACUUtFArCUUYoxTAKKXFGDSASloxS7aBiikpcUUhjTSU4000yWJRRRTEFFFF\r\nABRRRQAUtJS0AFFFFAEkR5qeq8fWrAoAKKKKACiiigAooooAKKKSgBaSikoAWikpaAFopKWgAqvJ\r\n1qxVeTrQA1etPpi9afQAUUUUgENMNPNMNADk6GmmlXvSGmAlFFFABRRRQAUUUUAFFFFABRRRQAUU\r\nUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUALQKKBQA8UUCikAUtJS0AI1NFK\r\n1A60wLI6UUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUgCiiigAooooAKKKKACiiigAPSoW61Maj\r\nagaI6U0d6CKChhpKU0lMlhRRRQIKKKKAFooopFBSUUUCCkpaKYhKWiigYUUtFIBKWiigYUUUUAJR\r\nS0lAgooooAKKKKAClApQKUCgaQCloopFCinU0U8UCYUhpaSgBKQ0tFAxtBFOpDQAwikp5FNxTEJR\r\nRijFAgooxRQAUtJRQMWiiigA4o4oxS4pAJijFOxS4oAbilC07FFAhMUUtFAxKKKKAEooooASmmnG\r\nkpiGUUppKZIUUUUAFFFFABS0lLQAUUUUAOTrVgdKrr1qwOlAC0UUUAFFFFABRRRQAUhpaKAG0UtF\r\nACUUUUAFLSUUALUD9anqB+tADV60+mL1p9ABRSUUgA0w080w0AKKSgUUwEooooAKKKKACiiigAoo\r\nooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBaBRQKAHiigUUgC\r\nlpKWgBrUDqKGoXqKYFmiiigAooooAKKKKACiiigAooooAKKKKQBRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFRsakqFutBSG96WikzQMa3WkpTSUyWFFFFAgoFFKKBoUCjFLRSKG4oxT8UYoEMxRin4oxQAyin7\r\naNtFwGUU7FJigYlFLil20ANop22l20AMop+2kIoAbRTsUbaBDcUoFOxS0DEoopaQwooopAKKcKaK\r\ndTEwpKWigQlFFFAxKKKKBiGjFFFACYoxS0tAhuKNtPooAbto206igBu2jFOooATFGKWigAxRilxS\r\n0xCYopaaaQBSUtJQMQ0lLRQMSiiigQGm06kNADTTacaSmSxKKKKYgooooAKKKKAFooooAUdasL0q\r\ntViM8UAPooooAKKKKACiiigAooooASilNNoAKKSloAKWkpaACoH61PUD9aAGr1p9MXrT6ACkoopA\r\nBphp5phoAKSlpKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFAC0CigUAPooopAFLSUtADWoX7woahfvCmBZooopAFFFFABRRRQAUUUUwCi\r\niikAUlLSUDDNLTaWgBaKSloEFFFFABRRRQAUUUUAIaibrUp6VCetBSCkNBooGNNJSmkpksKKKKBB\r\nThSAU6kUhaKKKQwpaKKAClxRRQAuKMUUtADcUYp1GKAG4pcUuKKAEooooASjFLRQAmKKKKACkpaK\r\nBjaWiikAUCigUwHClFIKdQIKQ0UUCEpKWkoGLRSUtACUUUUDDFFLRQISloooAKWkpaBCUYpaWmAm\r\nKWiloASiikoAKTNFJSGFBpKKBhSUUUAFJS0lAhaSiigBKaacaaaYmJRRRTJCiiigAooooAKWkpaA\r\nCnoeaZSg80AWBS0xDxTqQx1FJRQAtFJRQAtJRRQAUlLSUAJRRSUCHUUlLQAtV361Yqu/WmAi9afT\r\nF606kAUUUUABphp5phoAKSlpKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0CkpRQA+iiikAUtJRQAjdaF+8KRutKv3hQMnzS00U6gBa\r\nKKKBBRRRQAUUUUAFFFFACUhpaSgYlLRRSAKKKKYC0UlLQAtFFFAgooooARulQnrUrdKhPWgpAaBQ\r\naQUDEakpxptMlhRRSigBRTqSlqSgooooGFLSUtABS0lFAC0tJS0CFooFFMQUUtJQAUlLRSASiloo\r\nGJSUtFACUlLSUDCiiikAUtIKdTABTqbS0EhSUtFACUlLSUDEpaSlFAxaSg0ZoELRSUtAC0UUUCCg\r\nUUZpgLRRRQAUUUlAC5pKKSgAooopDEpKWigY2ilNJQAUlLSUAFFFFAhDSGnU00xDaKWkpkhRRRQA\r\nUUUUAFFFFAC0UlLQBIhqTNQL1qUGkMfS0gooAWikpaACiiigAooooAQ0mKdSUCExS0tFABVd+tWK\r\nrv1oARetOpq06gAooooADTDTjTTQAlFFFMAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigApRSUooAfRRRSAKKKKAGt1oX7wobrQOtAEwNOB\r\nqMUoNIokzRmmZpc0CsOopuaM0AOopKKAFooopgFJQaM0gCiiigYlFFFACilpKWmIWikpaBBRRRQA\r\njdKg71O3SoD1oKQGkpaSgYhpKU0lMlhSikpwpAhaKKWkUFFFFAwoopaACiiloAKWkpaBC0tJRTEL\r\nRRSUAFFGaKACikozSGIaKKQ0DDNJmkJpKAHUUCigBwpaSigQtLRS0xCUUtFADaSnUhpDG0Cg0CgY\r\nUlLmg0AGaUGm0A0APopoNLmgQtFJRmgB1FNzS0BYKKSigBaKSigAooooAKSiigYUlFFABSUUUAFF\r\nJS0CCmmlpDTEJSUtJTEFFFFAgooooAKKKKAClpKKAFHWpAajp4NIZIpp1MWnigApaKKAEpaSigBa\r\nKKKACikpM0ALmjNJmigBTUD9amNQt1oARadTV606gQUUUUAIaaacaaaAEooopgFFFFABRRRQAUUU\r\nUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFKKSlFAD6K\r\nKKQBRRRQA09aF+8KD1pY/vCgaJMUYp1FIY3FFLRQAlJmlNJQA4GnCmCnCgB1FFFAhppKcRSYoGJm\r\nilxRigAooxS4oAKWkpaYgpaSigBaKSloEB6VA/Wp6hkHNA0NFIetOWhqChhpKWkpksKeKYKeKTGg\r\npaKKQwooooGFLSUtAC0UlFAC0tJRQIWikooAdSUlFAC0maSkoGOzSUlGaADNITQTTaAFpQKAKdig\r\nQlLRRQMWikpc0ALS5pmaXNArDs0ZpuaTNAWHGkzRmkoADQKKKBi4GaUimgc07FAhpFNNPIppFACZ\r\npQaZS0APzRTc0ZoGOFLTaXNAC0UmaKAFopKKACiikoAU0lFFABSUtJQAUUUUCEooooAKDRRTAbSU\r\nppKCQooopiCiiigAooooAKKKKAFpy02lWkBKKeKjFPFAx1FFFABSUUUgCiiigBDSU6igBMUuKKWm\r\nAmKgfrVg1XfrQAgp1NFOoEFFFFACGmmnGmmgBKKKKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSikpRQA+iiikAUUUUANPWlj+8KQ9a\r\nWP71A0T0lFFIYUUUmKAEJpuacabigBRTxTBTxQA6ikpaYgooooAKKKKACiiigAopCabmgB9FNBpa\r\nAFoopaACopalpkg4oBEY6UhooJoKG0lLSUCYop1NFOoBC0UlLSGFFJS0DFopKKAFooooAKWkooAK\r\nKKKACikooAKKSigApKKSgApQKSnCmIcOKWm5ozSAWkzSZpM0DFzS5ptFFgHZozTc0ZosA7NJmkoo\r\nELmjNNoosA7NOBpmaXNADmpoY0uabmgCQGg0wGlzQA09aSlam0wFpabS0AOopKWkMWikozQA6ikz\r\nRmgBaSiigBKKKKACiiigApKKKBBRRRQAUUUlMANNp1NoJYUUUUxBRRRQAUUUUAFFFFABSikpRQBI\r\nDTwaiFPBpDJAaWowacDQAtFFJSAWikooGLRSUUCFpabmlBpgLVd+tWKrv1oAQU6minUCCiiigBDT\r\nTTjTTQAlFFFMAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigApRSUooAfRRRSAKKKKAGnrSx/epp60+P71A0SilpMUtIAooopgJikxTqKQxu\r\nKUUtFABS0lLTEFFFLQAlLRRQIKQ0tJQMaabin0UhiAU6kpaYgooooAKRulFB6UAQ96KQ9aKChKSl\r\nNJQJiilpBS0AhaKKSkMWikooAWlpKKBi0UUUAFFJRQAtJmikoAWikzRQAUUUlMQUUUUAFLmkooAM\r\n0ZpKKBXDNGaSimK4uaWm0tIdxaKSloAKKSigBaKSkoC4uaM0lFMVxc0ZpKKAuOozSUUh3FpKcKCK\r\nAG0UUUALS02loGLmikpaAClpKKQC5opKKBi0UlFAC0lFFAgooooAKKKKYBRRRQISkpaSgTEooopi\r\nCiiigAooooAKKKKAClpKWgBRTqaKWkMcDTgajFOBpDH0tMzS5oAdRSZpaACiiigAoFFJQIdUD9am\r\nzUDdaYAKdTRTqBBRRRQAhpppxppoASiiimAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUopKUUAPooopAFFFFADD1p8f3qYetPj60DRLS\r\n02lzSGGaM0lFAC5pabS0ALRSUmaAHUtMzSg0AOpabS0xC0UlFAC0lFJQAUUUUhhRRRQAUUUUAFFF\r\nFMCFutC0sg5pFoGDCmVI3SmUCYLS0gpaAFpKKKBhRRRQAUUUUALRSUZpDFopKKACikopiCiiigAo\r\nopKBBS0lKBQAooNKKQ0hjaKKKZIlFFLTASilpKAFooopAFFFFABSUUUwCiiigQUUtFAwoopaQCil\r\npBTqRQ0im1IRTSKYDaKKKBC0UlLQAUUUUDFopKWgAooooAKKSloAKSiigBaKSloAKSlooEJSGlpD\r\nQJiUUUUxBRRRQAUUUUAFFFFABSikpRQAtFGKWkMKBRRQMXNLmm5opAPBpc0zNLmgB4NLTAadmgBa\r\nQ0tIaAGk1Gae1RmmhMUU6miloELRSUtACGmmnGm0AJRRRTAKKKKACiiigAooooAKKKKACiiigAoo\r\nooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKUUlKKAH0UUUgCiiigBh605Ot\r\nNp8Q5NA0SUUuKMUhiUUuKMUAFJTsUYoASkxTsUYoAZilAp+KMUBcSloxRTEFLRRQIQ0maDTaQx1F\r\nIKWgYUUUUAFFFFABS0UUxDJBxUa1M/3ahHWgaHGoz1p5NMNAwFLSDrS0CCiikoGFFFFABRRRQAUU\r\nUUAFFFFABRRRQAUUlFAgooooAKeBSAUtJjFpppaaaAEooopiCiiigQUUUUAJRS0UwEopaKAEopaK\r\nAEpaKKQBRRRQAUtFFAxRTqQU6kMKaRS0UAMNJTjTaYgooooAWikpaACiiigYUUUUAFFFFABRRRQA\r\nUUUUALRSUtAhKSlNJQJiUUUUxBRRRQAUUUUAFFFFABSikpRQA6ilAyKB1pFCGkqTbSbaQDKKcRSY\r\npgJRmjFFADgacDUdKDSAlBopgNOzQAhqI1IajNNCYopaQUtAgpaSloAaaQ0ppDQAlFFFMAooooAK\r\nKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigApR\r\nSUooAfRRRSAKKKKAGVLD3qKpoe9MY+jFLRSAMUYopaAEpaKKBBRRRQAUUUUAFFFFABRRRQAhpMU6\r\n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\r\nCilFAC0UUUhhRSUUAFJRRTAKKKKBBRRRQAUUUUDCiiigQlJS0lMQUUUUCCiiigAooooAKUUlKKAH\r\nE8UgoNFIoXNJRRQMKDRRQIKM0mKKAHZpc02iiwDs0Cm0qmkBIBRigGloAYw4qM1Kw4qI00JiilpB\r\nS0CCiiigBDTacabQAUUUUwCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACnCm04UALS0lLSAKQ9KWkPSgBtPUcUypox8lDGhlGakK1GVpDD\r\ndShqYRRTAmBpwqFTUgNAh9FJmjNAC0lJmjNIYtFNzRmgB1GabupN1AD6KZuo3UAPopu6jdQA4mmM\r\naQtTCaYCHrSUUUCAU8GmUtAEmaaxpM0maBhSUtFACUtJRQAtFFFAwooooAKKKKBBRRRQMKKKKAFp\r\nabS0ALSGiikAlFLRTAKKKKAFopKKQBRSUUwFopKKAFopKKAFopKKAFozSUUALmjNJRQAtFJRQAtF\r\nJRQAtFJRQAUtJRQAtJRS0AJS0UtACYopaKQCUUUUAFJRRTAKKKKACiiigQUUUUAFFFFABRRRQAZo\r\nIzSUooEAFNNOzSGgBKKKKYgooooAKUUlLQNCmgUUopDCkpaKBiUCiigQ/HFIVp68ilxSAiIpMVIR\r\nTTQA2lAoAp4FMQoFOpMUtIBD0qA9anPSoD1poGKKWkFLQIKKKKAENNpxptMAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKcKbThQ\r\nAtLSUUgFpD0paQ9KAG1PF9wVBU8X3BQxjqQinUhpARMKYalaozQMQU8GmgU4CmA4GjNJRSAXNJSg\r\nUuKAG0lPxSEUAMJpM0rCmUwHZo3U2igVxc0ZpKKAuLmigU4CgYgWnbacBSikIZsoK1JSYoGRbaTF\r\nS4prCgBlFFFMYlFLSUCFopKWgYUUUUAFFFFABRRRQAUUUUAFFFFAC0UlLQAtJRRSAKSlpKYC0lFF\r\nABRRRQAUUlFAhaKSigBaKSigAooooAKKKKAClpKKAFpKKKACiiigBaKKKACiiigBRS0CikMKKKKA\r\nEpKWkpgFFFFAgooooAKKKKACiiigAoopKACiiigQGiiigBVGaGoBwaQnNACUUUUxBRRRQAUtFFIY\r\ntKKbTqBhQKKBQMDSUppKAJEPFPqJTzUlIQhphpxNNNAAKetMFPFAh1FFFACHpUB61O3SoD1poBVp\r\naQUtAgooooAQ02nGm0wCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigApwptOFAC0UUUgFpD0paQ9KAG1PH9wVBUinCihjRITSE0wtT\r\nd1IY4mkpM0ooAUUopKWgBaUCkzS5oAWikzRmgBaQ0maaTQANUdOJptNCYUUUUxBRRRSGKKeKaKcK\r\nQxwp1MFGaAH0ZpmaM0AOprdKXNNJoGMooNFMApKWkoEwpaSigBaKKKBhRRRQAUUUUCCiiigAoooo\r\nGFLSUtABS0gpaQBSUtJigBKKWimAlFLRQA2ilooEJRRRQAUUUUCCiiigAooooAKKKKACiiloGFFF\r\nLQAlFLilFAxMUuKWikAUUUlABSUUUAJRRRTEFFFFABRRRQAUUUUAFFFFABSUUUAFJRRTJFopKWgA\r\npKKKACiiigAooooAWiiikMWlpKUUDA0Cg0ooGBptOpDQAlPB4plKKBDiabTsUYpAAFOFAFLQIWii\r\nigBG6VAetTt0qA9aaAUUtIKWgQUUUUAIabTjTaYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU4U2nCgBaKKKQC0h6UtIelADaeB\r\nxTKmQfKKGNEZBpMVMRTCKVwGCnCkxRTGLmjNNzRmgB2aM03NGaLAOzRupuaSiwXHZpM0lFAhaMUo\r\np1AEeKKeRTaAEpaSlFACinCminA0hi0lLSUDCiiigAoPSikNADaKKKYBSUtJQJhRRRQAUtJSigAo\r\noooGFFFFAgooooAKKKKACiiigYtFFFAC0UlLSAKKKKAEopaKAEpMU6jFADaKXFGKYDaKWjFAhKKd\r\nijFADaWlxS4oAbRTsUYoGNxS4p2KMUgExRS0UAJS0UUAFFJRQAtJRRQAlFFJTAKKKKBBRRRQAUlL\r\nSUAFLSUUAFFFFABRRSUCCiiimIUUUUUgEooopgFFFFABSikpaBi0lFLSGFFFFAxadSLTqAExQRTq\r\nCOKAIjQOtOIptAEo6UuKROlOoEJS0lApCFoopaAGt0qA9anbpUB600AopaQUtAgooooAQ02nGm0w\r\nCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK\r\nKKKACiiigApwptOFAC0UUUgFpG6UtI3SgBtTp90VBUq/dFDGh9IRS0UhjMU0ipcUjCgCE0lOIpMU\r\nxCUUYpcUAJRTtpo2UANpadspNtAAKdTQKWkMU000tJigBKUUmKKYC0UlFADs0opopwFIYtJRiikA\r\nUhoopgNNFFFMBKKKKBBRRRTEFFJS0gFopKWgYUUUlABS0lFAC0UUUAFFFFABS0lFAxaWkpaQBRRR\r\nQAUtJS0AFFFFABSYpaKAExRS0hoAKWkFLQAUUUUAFFFFABS0UUAJRRRQAUUUlABRRRQAlFFJTAWk\r\noooEFFFJQAUUUUAFFFFABRRRQAUUUUCCkoopiCiiigBaWkpQKQxKSlNGKYCUUUtABRRRSGFLQKKB\r\nhRRRQA5KkqJTzUgoELRRRSAYaYakamGmMchp5qJTg1L2oEITQDTWpM0gJM0ZpgNFACseKiNPPSmU\r\n0JiilpBS0CCiiigBDTacabTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACnCm04UALRRRSAWkbpS0jdKAG1Mo+UVDVhR8ooY0FKK\r\nMUtIBKDS0lMCMijbT8UuKQDNlG2pMUlADdtLilooAMUhFOpKAGEUmKfRSGMxS4p1FADMUbafiigB\r\nm2jbT6KAGhaXFLRQAmKaRTzTDQA00lKaTFMBKKKKYwpKWigBKKKKCRKKKKYC0UCikMWiiigYlLSU\r\nUCFopKWgAoopKAFopKWgApaSigY6ikopALRSUtAC0UlGaAFoozSZoAWikooAKKKSgYtFFFABS0lF\r\nAC0UmaM0CFpKKKACikooAKKKSmAUUUUCEooooAKKKKACiiigQUUUUDCiiigQUlLSUwCiiigQUUUU\r\nAKKUGkopDFNFJT05FAxlFKwwaSgApaSloAWkpaSgYUUUUAFSKeKjp6GgB9FFFIQjVGakNMNAxtSA\r\n8VHTlNMBWplPamgUCFAp2KBThSENYcVEambpUJpgKKWkFLQIKKKKAENNpxptMAooooAKKKKACiii\r\ngAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKcKbT\r\nhQAtFFFIBaRulFDUANqyv3R9KrVZX7ooGLRRS0AJRRRQAlLSUUgFpKM0maAFopM0UDFpaSigQUUU\r\nUDEooooAKWkopAFLSZooAWkoppNACk000hNFMAxSgUopRQBEwpKlccVFTGFFJS0AJRRRQISilpKY\r\ngpaSigBaKKKQwooooAKKKKACiiigAooooAWikpaACiiigYtFJRQAtFJRQAtFJRQAuaWm0UALRSUU\r\nALRSUUALmjNJRQAtJRRQAuaSiigAooooAKKKKBBSUUUAFFFFAgooooAKKKKACiiigAooooASiiim\r\nIKKKKACiiigBRSkUCnYpFDKcpwaSkoAc1JQaKACgUUUDFpKXNJQAUUoGaDQAlOU802gUATUUg6Ut\r\nIBKa1OpDQAw0lKaSmBIORSUIaDSEKDS5pmaUGgBWPFRGnk8Uw0xMUUtIKWgQUUUUAIabTjTaYBRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAU4U2nCgBaKKKQBSGlpDQAlWh0FVatDoKBhRRRQAUUtJQAhphNPNRtxSGLmjNMzS0AOzRm\r\nm0UAPzRuqPNJuoAk3UZqPNANFgJc0ZqPNLmgB2aN1MJpuaAJN1G6o80ZosFyQtTS1MzRTsFxc0oN\r\nNoBoESg0uajzS5pDHnmo260u6kNMBKKSloGJRRRQIKSlopiEopaSgBaKSloAKKKKBhRRRSAKKKKA\r\nCiiigAooooAKWkooAWikooAWikooAKKKKAClpKKAFopKKAFopKKAFopKKACiiigAooooAWkoooAK\r\nKKKACiiigQUUUUAFFFFABRRRQAUUUUAFJS0lABRRRTEFFFFABSikpRQMdilFHakpDEPWkoNFAC0l\r\nLSUALRSUtABRSUtACrQaSigYUUUtACqadmmCnUAOpDSZopANNJSmkpgKDSmm07tQAhpM0GkoEKTT\r\naWkoEOFLSCloEFFFFACGm0ppKYBRRRQAUUUUAFFLRQAlFLRQAlFLRQAUUUUgCiiigAooooAKKKKA\r\nEooopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFOFNpRQA6ikpaQBSGlpDQAlWh0qqKsjpTGLRRR\r\nSAWkoozQAVG1PJpjUhjKKMUuKACilxSYoAQ02lNJTQgpaQUtAxaKKWkA0im1KRTCKYhtFFFMQUUY\r\npQKQxMUYp+KMUXCwyin4pMUANozS4pMUAFFFFAwooooAKKKKACkpaSmIKKKKAFopKKAFopKKAFoo\r\nopAFFFFABRRRQAUUUUAFFFFABRRRQMKKKKACiiigAooooAKKKKACiiigAooooAKKKKBBRRRQAUUU\r\nUAFFFFABRRRQAUUUUAFFFFABRRRQAUlLSUxBRRRQAUUUUAFFFFAx60GkBopDA0lKaSgBaSlpKACl\r\npKKACnCm0tACkUlLmkoGFFFFABThTactAC0UtGKQDTSGn4pCKAGUopCKUUwA02nkZppFBIlJSmkp\r\niHCikFLSAKKKKAEpKWkpgFFFFABRRRQAtFFFIAooooAKKKKACiiigAooooAKKKKACiiigBKKKKYB\r\nRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSikpRQAtFFFIBaQ0tIaAEFWRVYdas0DQtFJS0AJRRRQA\r\nhpppxpKQxAKXFKKKAExQRS0UAMIphFSmmkUAMopSKSgBRSim04UAOppFPpDTEREUYpxFAoAQClpQ\r\nKWkMSiijNABSUZooAMUmKdSUAJikIp4oYcUwGUlFFABRRRQAUUUUwEooooEFFFFABRRRQAUUUUAF\r\nLSUUALRSUtABRSUUALRRRQAlFLRQAUUUUAFFFFABRRSUALRRSUALRSUUALRRRQAUUUUAFFFFABRR\r\nRQAUUUUgCiiigAoopKAFooooAKKKKACkpaSmIKKKKACiiigAooooGKKWkpaQwpKWkoAWkoooAKKK\r\nKACloooGFFFFABRRRQAtA60lFAEgpaap4p1ABTTTqQ0hDaMUZozQMdikNANITQIQ0ynE02mJiilp\r\nBS0CCiiigBKSlpKYBRRRQAUUUUALRRRSAKKKKACiiigAooooAKKKKACiiigAooooASiiimAUUUUA\r\nFFFFABRRRQAUUUUAFFFFABRRRQAUopKUUALRRRSAWkNLSGgBB1qzVYVNmhjQ7NGaYTSbqQyTNFMD\r\nUuaAHUlFFAC0UlFAC0UlGaACg0ZpKAEIpMU6koAbSig02gB+aM0zNGaYCmgUmaAaQD6KbmlzQAhp\r\nKCaSgBc0maSimA7NGaSigBwNDHim0GgBKKKKACiiigAooooASiiimIKKKKACilpKACiiigAooooA\r\nKKKKACiiigAooooAWikooAWikooAWikooAWiikoAWikooAKKKKAFopKKAFopKKAFopKKAFpKKKAF\r\npKKKACiiigAooooAKWkpaACiiikAUlLSUxBRRRQAUUUpoASlpKKBhS0lKKAFooopDCkoooAKKKKA\r\nFooooGFFFFABRRRQAUUUUAOU07NR07NADs0hNNooAKKSnCgBKQmlJppoEFJS0lMkUUtIKWgAooop\r\nAJSUtJTAKKKKACiiigBaKKKQBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACUUUUwCiiigAooooAKKK\r\nKACiiigAooooAKKKKAClFJSigBaKKKQBQaKQ0AFSVGKkxQxoQ02nEU00DFFOFMpwpAPFFJQKAFpa\r\nSigAooooAKKSloAKSlooAaaaaeaYaBDaKKKYBS0lFADs0maKKBhSUtJQIKKKKACiiloAKKKKBiUU\r\ntFACUUUUAFFFFMAooFLQAlFFJQIWkoooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigQUUUUAFFFFABRRRQAUUUUDCloopAFFFFABSUtJTAKKKKB\r\nBSmkooGFFFLQAlKKKKAFooopDEooooAKKKKAClpKWgYUUUUAFFFFABRRRQAUtJRQAtFFAoAWilpp\r\npAIaBRQKYARTae3SmUEiilpBS0xBRRRSASkpaSmAUUUUAFLSUtABRRRSAKKKKACiiigAooooAKKK\r\nKACiiigAooooASiiimAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUopKUUALRRRSAKQ0tIaAAdalq\r\nIdamoY0NNNNPNNNIBtOFJSimAopabmjNIY7NFNzRmgB9FNzRmgB1FNzS5oAWikzRmgANNNKTTCaA\r\nENFFApiFApcUq07FAxmKMU/FGKAI8UVJikKUAR0op22lAoAQLShKXNJuoACAKbSmkoKA02lpKBMK\r\nKKKYgFLSUUAFFFFAhKKKWgBKKWkoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKBBRRRQAUUUU\r\nAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQMKWiikAUUUUAFFFFABRRRQAlFFFMAoopa\r\nAEpaKKACiiigBaKBRikUFJS0lAgooooAKWkooAWiiigYUUUUAFFFFABRRRQA4UUgpaAFppp1IaAG\r\n0UUtAA3SmU89KZTJYopaQUtAgooopAJSUtJTAKKKKAClpKWgAooopAFFFFABRRRQAUUUUAFFFFAB\r\nRRRQAUUUUAJRRRTAKKKKACiiigAooooAKKKKACiiigAooooAKUUlKKAFooopAFIaWkNAAOoqaoR1\r\nqWgaCmmlpDQAlFFLSASkp1JTASilpKADNGaMUoFAwzS0AU4CkAlGKdiigBpFNIqSmmgCOgCnEUAU\r\nxCinCkopDHUUzNLmgY+mk0hNNJpjHZozTQaWgAJzQBQKXFMBKSnEUAZpANIpKkxTStMQ2kNLQaBD\r\naKWigQlFFFABS0lFAC0lFFABRRS0AJRRRQAUUUUCCiiigYUUUUAFFFFABRRRQIKKKKBhRRRQAUUU\r\nUCCiiigAooooAKKKKACiiigAooooAKKKKBhRRRQAUtJRQAtFFFIAooooAKKKKACkpaKAEpRSUopg\r\nBooNFIAooooGKKWm08UDEpDTqaaAEooooEFFFFAC0UUUDCiiigAooooGFFFLQIQU+m0ooAWkoopA\r\nJRQaSmMCabTjTaZDFFLSCloEFFFFIBKSlpKYBRRRQAUtJS0AFFFFIAooooAKKKKACiiigAooooAK\r\nKKKACiiigBKKKKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSikpRQAtFFFIApDS0hoAB1qTNRCn\r\nUDQ7NJmkooAWikooAWikooAKUCilAoGKBRilFLSATFLSUtAC0UmaKACkNFIaACikpQaACg0tJTGJ\r\nRRRigYlJTsUpFADRQRTlFDntQA0Gn5xUdOBpiHMaaDQTmigY7NNJopKAENFLSUgEooopkhSUUtAh\r\nKKWigBKKWkoAKWkpaACiikoAWkopaAEopaSgAooooAKKKKACiiloASiiigAooooAKKKKACiiigAo\r\noooAKKKKBBRRRQAUUUUAFFFFAwooooAWikpaACiiikAUUUUAFFFFABRRRQAlKKSlpgLSUUUhhRRR\r\nQAU4Gm0ooAWkNLSGgYUlFFAgooooAKWkooAWikpaBhRRRQAUUUUALQKSloAWigUtIBppKcabTAQ0\r\nlKaSmSxRS0CigQUUUUgEpKWkpgFFFFABS0lLQAUUUUgCiiigAooooAKKKKACiiigAooooAKKKKAE\r\nooopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFKKSloAWikpaACkNLSGgBBTqaOtPpDCjFFFIBKK\r\nWkpgFKKSlFAxcUtApaQBRmikoAKWiigBaKKSgApppTTSaADNApKcBTGLRRRQMKKKSgYuaSg0CgBw\r\n4FMPWgmgUCFxxSU7NNoAKKUCigAoopKAFpDRS0wG0lKaMUCY2lpKKCRaKKKACiiigAxS4oozQMSi\r\niigAooooAKKKKBBSUtFACUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUtJRQAtJS0UAJRS4pKACiii\r\ngAoopaAEoopaACiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUwCgUUUALRRRSKEooooJCi\r\niimAUUUUhhS0lFAxaKKKAAUppKWgBKWkooAdS00UtIBaaaWkNMBDTaU0lMli0tJS0CCiiikAlJS0\r\nlMAooooAKWkpaACiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAlFFFMAooooAKKKKACiiigAoo\r\nooAKKKKACiiigApaKKACiiigBaQ0UUAA60+iikxoKMUUUhhSUUUAJSiiimA4UtFFIAooooAKWiig\r\nAppoooAQ0lFFAxQKWiimMKSiigYUmaKKACjtRRQISloooAWjFFFAxaSiigQUGiigBKXNFFACUCii\r\nmA00lFFBDCiiigApaKKACiiigYUUUUAFFFFIAooopgFFFFABSUUUCCiiigAooooAKWiigBKKKKAC\r\niiigAooooAKWiigAooooAKKKKAEooooAWiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAF\r\nJRRTAKKKKAFpaKKBiGiiikAUUUUxBRRRSGFFFFABS0UUDCgUUUABooooAKWiigAooooAaaSiimSx\r\naWiigQUUUUAJSUUUAFFFFABS0UUAFFFFIAooooAKKKKACiiigAooooAKKKKACiiigD//2Q==', 'asha1', '2017-03-22 18:21:44', 'asha1', '2016-09-12 18:21:44', 'wasqfrtgyhug'),
('asha8264', '41001', 5, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Kamla', 'Vijay', 'Mala', '1986-11-19', 30, 'Marathi', 'Pune', 'Illiterate', 0, 'Married', 4294967295, 'Ghfhgfgd dga daf fff', '', 4294967295, 'null', '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAKBueIx4ZKCMgoy0qqC+8P//8Nzc8P//////////////\r\n////////////////////////////////////////////2wBDAaq0tPDS8P//////////////////\r\n////////////////////////////////////////////////////////////wAARCADwAUADASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwBKbJ2p\r\n2R6imvzjHNADKKXB9DRg+hoASnx96bg+hpycZzxQA6ijI9RRkeooAKbJ2p2R6imvzjHNADKKXB9D\r\nRg+hoASnx96bg+hpycZzxQA6ijI9RRkeooAKbJ2p2R6imvzjHNADKKXB9DRg+hoASnx96bg+hpyc\r\nZzxQA6ijI9RRkeooAKbJ2p2R6imvzjHNADKKXB9DRg+hoASnx96bg+hpycZzxQA6ijI9RRkeooAK\r\nbJ2p2R6imvzjHNADKKXB9DRg+hoASnx96bg+hpycZzxQA6ijI9RRkeooAip8femU+PvQA6iiigAp\r\nsnanU2TtQAyiiigAp8femU+PvQA6iiigApsnanU2TtQAyiiigAp8femU+PvQA6iiigApsnanU2Tt\r\nQAyiiigAp8femU+PvQA6iiigApsnanU2TtQAyiiigAp8femU+PvQA6iiigApsnanU2TtQAyiiigA\r\np8femYNPTjOaAHUUZFGRQAU2TtTsimvzjFADKKMGjBoAKfH3pmDT04zmgB1FGRRkUAFNk7U7Ipr8\r\n4xQAyijBowaACnx96Zg09OM5oAdRRkUZFABTZO1OyKa/OMUAMoowaMGgAp8femYNPTjOaAHUUZFG\r\nRQAU2TtTsimvzjFADKKMGjBoAKfH3pmDT04zmgB1FGRRkUAFNk7U7Ipr84xQAyijBowaAJabJ2p1\r\nNk7UAMooooAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKfH3plPj70AOooooAKbJ2p1Nk7UAMoo\r\nooAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKfH3p\r\nlPj70AOooooAKbJ2p1Nk7UAMooooAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKfH3plPj70AOo\r\noooAKbJ2p1Nk7UAMooooAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKfH3plPj70AOooooAKbJ2\r\np1Nk7UAMooooAKfH3plPj70AOooooAip8femU+PvQA6iiigApsnanU2TtQAyiiigAp8femU+PvQA\r\n6iiigAooopMTCiiikSFFFFABRRRQAUUUUAFRnqakqM9TTQ0JT4+9Mp8femUOooooAKbJ2p1Nk7UA\r\nMooooAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKf\r\nH3plPj70AOooooAKKKKTEwooopEhRRRQAUUUUAFFFFABUZ6mpKjPU00NCU+PvTKfH3plDqKKKACm\r\nydqdTZO1ADKKKKACnx96ZT4+9ADqKKKACmydqdTZO1ADKKKKAJcCmvxjFOpsnagBmTRk0UUAGTT0\r\n5zmmU+PvQA7AowKKKADApr8YxTqbJ2oAZk0ZNFFABk1IOgqOpB0FJiYtFFFIkKKKKACiiigAoooo\r\nAKMUUU0NBgU1+MYp1Nk7UyhmTRk0UUAGTT05zmmU+PvQA7AowKKKADApr8YxTqbJ2oAZk0ZNFFAB\r\nk09Oc5plPj70AOwKMCiigApsnanU2TtQAyiiigAp8femU+PvQA6iiigApsnanU2TtQAyiiigAqQd\r\nBUdSDoKTExaKKKRIUUUUAFFFFABRRRQAUUUU0NBTZO1OpsnamUMooooAKfH3plPj70AOooooAKbJ\r\n2p1Nk7UAMooooAKfH3plPj70AOooooAjyfU05Oc55plPj70AOwPQUYHoKKKADA9BTX4xjinU2TtQ\r\nA3J9TRk+ppKKAFyfU05Oc55plPj70AOwPQUYHoKKKADA9BRRRSYmFFFFIkKKKKACiiigAooooAKj\r\nJOTyakqM9TTQ0GT6mnJznPNMp8femUOwPQUYHoKKKADA9BTX4xjinU2TtQA3J9TRk+ppKKAFyfU0\r\n5Oc55plPj70AOwPQUYHoKKKADA9BTX4xjinU2TtQA3J9TRk+ppKKACnx96ZT4+9ADqKKKACmydqd\r\nTZO1ADKKKKACnx96ZT4+9ADqKKKACmydqdTZO1ADKKKKACnx96ZT4+9ADqKKKACmydqdTZO1ADKK\r\nKKACnx96ZT4+9ADqKKKACmydqdTZO1ADKKKKACnx96ZT4+9ADqKKKACmydqdTZO1ADKKKKAJNo9K\r\nRvlxjinU2TtQA3cfWjcfWkooAXcfWnL82c80ynx96AF2j0o2j0paKAE2j0pG+XGOKdTZO1ADdx9a\r\nNx9aSigBdx9acvzZzzTKfH3oAXaPSjaPSlooATaPSkb5cY4p1Nk7UAN3H1o3H1pKKAF3H1py/NnP\r\nNMp8fegBdo9KNo9KWigBNo9KRvlxjinU2TtQA3cfWjcfWkooAXcfWnL82c80ynx96AF2j0o2j0pa\r\nKAE2j0pG+XGOKdTZO1ADdx9aNx9aSigBdx9acvzZzzTKfH3oAXaPSjaPSlooAKbJ2p1Nk7UAMooo\r\noAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKfH3pl\r\nPj70AOooooAKbJ2p1Nk7UAMooooAKfH3plPj70AOooooAKbJ2p1Nk7UAMooooAKfH3plPj70AOoo\r\nooAj3H1py/N15plPj70ALtHpRtHpS0UAJtHpSN8vTinU2TtQA3cfWjcfWkooAXcfWnL83XmmU+Pv\r\nQAu0elG0elLRQAm0elI3y9OKdTZO1ADdx9aNx9aSigBdx9acvzdeaZT4+9AC7R6UbR6UtFACbR6U\r\njfL04p1Nk7UAN3H1o3H1pKKAF3H1py/N15plPj70ALtHpRtHpS0UAJtHpSN8vTinU2TtQA3cfWjc\r\nfWkooAXcfWnL83XmmU+PvQAu0elG0elLRQAm0elI3y9OKdTZO1ADdx9aNx9aSigAp8femU+PvQA6\r\niiigApsnanU2TtQAyiiigAp8femU+PvQA6iiigApsnanU2TtQAyiiigAp8femU+PvQA6iiigApsn\r\nanU2TtQAyiiigAp8femU+PvQA6iiigApsnanU2TtQAyiiigAp8femU+PvQA6iiigApsnanU2TtQA\r\nyiiigD//2Q==', 'asha1', '2016-02-10 18:08:56', 'asha1', '2016-11-11 18:08:56', '785412369856'),
('asha8456', '41001', 4, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Gangabai', 'Ishwar', 'Aapte', '1988-09-08', 28, 'Marathi', 'Pune', 'Literate', 0, 'Married', 4294967295, 'Kothroud pune null stop', '', 1478523695, '12', '', 'asha1', '2017-05-16 15:59:41', 'asha1', '2016-03-08 15:59:41', 'qawsedrftgyh');
INSERT INTO `hm_patient` (`Patient_id`, `PinCode`, `Village_id`, `City_id`, `District_id`, `State_ID`, `Country_ID`, `Card_Type_id`, `Gender_Id`, `Cast_Category_Id`, `Patient_Salutation`, `Patient_FName`, `Patient_MName`, `Patient_LName`, `Patient_DOB`, `Patient_Age`, `Patient_Language`, `Patient_POB`, `Education`, `Patient_BPL`, `Patient_Marital_Status`, `Patient_Contact`, `Address_line1`, `Address_line2`, `Patient_Emergency_number`, `Patient_Ward`, `Patient_Image`, `Created_By`, `Created_Date`, `Updated_By`, `Updated_Date`, `Card_Number`) VALUES
('asha8888', '41001', 7, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Shantabai', 'Prakash', 'Patil', '1984-09-12', 32, 'Marathi', 'Kolhapur', 'Literate', 0, 'Married', 4294967295, 'Kothrud pune', '', 4294967295, '12', '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAKBueIx4ZKCMgoy0qqC+8P//8Nzc8P//////////////\r\n////////////////////////////////////////////2wBDAaq0tPDS8P//////////////////\r\n////////////////////////////////////////////////////////////wAARCAPIBRADASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwCGiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigApaSloAKB1opR1oAdS0lLSAKKKKAEbpTKc3Sm0wCiiig\r\nBKKWigBKWiigBKKWigBKWiigAooooASilooASilooASilooASilooASilooAKSlooASilooASilo\r\noASilooASilooASilooASilooASloooAKSlooASiiloASiiigAooooAKKKKACiiigAooooAKKKKA\r\nCiiigAoopaAEopaKAEpaKKACiiigApKWigBKWiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigAooooASilooASilpKACiiigAooooAKKKKACiiigAoopaAEpa\r\nKKACiiigAooooActOpq06kAUUUUAIaZTzTKAEpaKKYBThTacKQC0tJS0gCiiigYUUUUAFFFFABS0\r\nlLQAUUUUALRSUtAEFFFFUIKKKKACiiigAooooAKKKKACiiigAooooAKWkpRQAUo60lKvWgB1LSUt\r\nIAooooAa3Sm05qbTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAEopaKACiiigApKWigApKWigAoo\r\nooAKKKKACiiigAooooActOpq06kAUUUUAIaZTzTDQAlO7UlL2pgJThTacKQC0tJS0gCiiigYUUUU\r\nAFFFFABS0lLQAUUUUALRSUtAEFFFFUIKKKKACiiigAooooAKKKKACiiigAooooAKXtSU4dKAEpVp\r\nKVaAHUtJS0gCiiigBrU2nNQo+YUwExRg1ZxS4FAFXFGKtYFGBQBVxRirOB6UYFAFbFGKs4HpRgel\r\nAFbFGKs7R6UbR6UAVqKs7R6UbR6UAVqKs7R6CjaPQUAVaKs7F9BRsX0FAFairOxfSjYvpQBWoqzs\r\nX0o2L6UAVqKs7F9KPLX0oArUVY8tfSjy19KAK9FWPLX0o8tfSgCvRVjyl9KPKWgCvRVjylpPKWgC\r\nCip/KWjyloAgoqfyhR5QoAgoqfyhSeUPWgCGipvKHrR5Q9aAIaKm8ketHk+9AENFTeT70eT70AQ0\r\nVL5PvR5PvQBFRUvkn1o8k+tAEVFS+UfWk8o+tAEdFSeUaPKagCOipPKajymoAjop/lNR5bUAMop/\r\nlt6UeW3pQAyin+W3pSeW3pQA2inbG9KNjelADaKdsPpRtPpQA2inbT6UbT6UANopdpo2n0oASilw\r\naMGgBKKXBoxQAlFLijFACUUuKKAEopaKAEopaKAEopaKAEopaKAEopaKAEpaKKAEopaKAEopaKAE\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBy06mrTqQBRRR\r\nQAhphp5phoAKcOlNp6j5aYDTSikNKKQC0tJS0gCiiigYUUUUAFFFFABS0lLQAUUUUAFLSUUAQ0UU\r\nVQgooooAKKKKACiiigAooooAKKKKACiiigApw6U2nfw0AJSrSUq0AOpaKKQBRRRQA1qE+8KG60sf\r\n3xTAsUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUU\r\nUAFFFFABRRRQAUUUUAFGKKKADFGBRRQAYFJgelLRQAmB6UbR6UtFACbR6UbR6UtFACbR6UmxfSnU\r\nUAN2L6UbF9KdRQA3y19KPLWnUUAM8taPLWn0UAM8oUeUKfRQBH5Qo8oVJRQBH5Qo8r3qSigCPyve\r\nk8r3qWigCLyqPKqWigCHyjR5RqaigCHyjSeUanooAg8o0eWanooAr+W1HlmrFFAFfyzRsPpViigC\r\ntsPpRsPpVmjFAFbafSjafSrOKMCgCrtPpRtPpVrApMCgCtg0YNWdo9KNooArYNGKs7R6UbR6UAVs\r\nUYqxsFGwUAVqKs7BULjBoARadTVp1IAooooADUZqQ1GaACng/LTKcvSmAhoFBoFIB1FFLSAKKSlo\r\nAKKKKBhRRRQAUtJRQAtFFFABRRRQBDRRRVCCiiigAooooAKKKKACiiigAooooAKKKKACn44ptO/h\r\npANpVpKctMB1FFFIAooooAa3Wlj++KRutOi++KYE9FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAHpUEnWp6gk60ANWnU1adSAKKKKAENMNPNMNABTh0p\r\ntKOlMANApDSikA6lpKKQBS0lFAxaKKKACiiigAooooAWiiigAooooAhoooqhBRRRQAUUUUAFFFFA\r\nBRRRQAUUUUAFFFFAC07tTRSnpSASnLTactADqKKKACiiigBrdadF9+mnrT4fvUwJqKKKACiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACii\r\nigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqCTrU9QSdaAGrTqat\r\nOpAFFFFAAaYaeaYaAEpwHFNpwPFMBDQKQ0opAOooopALRSUUDFooooAKKKKACiiigBaKSloAKKKK\r\nAIaKKKoQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAopTSDrS0AJTlptOXpQA6iiikAUUUUAMPWpIf\r\nvGoz1qWHqaYEtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAVBJ1qeoJOtADVp1NWnUgCiiigBDTDTzTDQAUo6UlKOlMBKUUlKKQDqKKKQBRS0lAwoopa\r\nACiiigAooooAKWkooAWiiigCGiiiqEFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAKvWlNCfeoNIBKc\r\nvSm04dKAHUUUUAFFFFADD1qWHvUR61LD3pgS0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFF\r\nFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFFFFABRRRQAUUmaXNABRRmkzQAtFJmjNAC0UmaM0ALRRmk3UALRTd1G+gB1FN3UuaAFoozRQAUU\r\nUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRR\r\nQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOtADVp1NWnUgCiiigB\r\nDTDTzTDQAUvakpe1MBKUUlKKQDqKKKQBRRRQMKKKWgBKWiigAooooAKKKKAClpKKAIqKKKoQUUUU\r\nAFFFFABRRRQAUUUUAFFFFABRRRQA5OtBpU6/hSGkAlOHSm08dKAFooooAKKKKAGd6mh6Goamh+6a\r\nYElFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFIWAppcUAPpCcVGz0wsaAJS9NL1HRQA/fRvpl\r\nFAD9xpNxpM0UAODUoamUUATbhRkVFRQA8tTM0lFABmiiigAzS5pKKAHBjSh6ZS0ASh6UEVDSg0AT\r\nUUwPTgc0ALRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOtADVp1NWnUAFFFFI\r\nBDTDUhphoASlHSkpR0pgJSikpRSAdRRRSAKKKKBhRRRQIKKWigYUUUUAFFFFABRRRQBFRRRVCCii\r\nigAooooAKKKKACiiigAooooAKKKKAHJ1P0pDSr3pKACnimU8UgFooooAKKKD0oAZU8P3agqeL7lM\r\nB9FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFFABSZoJxUbPQA8timF6YTSUAKWzSZoooAKKSigBaSiigApaSloAK\r\nWkpRSAKKSloAUUGkopgFFFHagBKWkooAWiiigBaKKKACiiigBaXNJRQIeDT6jXrUlAwooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAqCTrU9QSdaAGrTqatOpAFFFFACGmGnmmGgApQOKSnDpTAbSik\r\npRSAdRRRSAKKKKACiiigBaKKKBhRRRQAUUUUAFFFFAEVFFFUIKKKKACiiigAooooAKKKKACiiigA\r\nooooAcvekpR0NJQAU8UynikAtFFFABQelFB6UAMqeL7lQVYj+4KYDqKKKACiiigAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAozRSHigB\r\naYz4prPUZOaAHM2abSUUALSUUUAFLSUUAFFFJQAtFFFABS5pKKAFzRSUUALRRRSGLRRRQAUhNFIa\r\nBBS0lFMBRRmiigBc0tNpaAFooooAWiijNAhy9akqIVIpyKBi0UUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFF\r\nFABRRRQAVBJ1qeoJOtADVp1NWnUAFFFFIBDTTTjTTQAlKOlJSjpTASlFJQKQD6KKKQBRRRQMKKKK\r\nBBRRRQAUtJS0DCiiigAooooAioooqhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACiiiigAp4pgp9I\r\nBaKKKACg9KKG6UAMqxH9wVXqyn3BTAWiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooprNgUAKxwKhZ80jNmm0AGaKKSgBaKKKACi\r\niigBaSiigApKWigBKWkooAWikooAUGnAgimUtAxcUZoopAGaKKKAA0lOoxQA2inYoxQA2ilooEFK\r\nKSloAWikopgLRSUtACinKcU2lzQIlFFMU0+gYUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABUEnWp6gk\r\n60ANWnU1adSAKKKKACmGnmmGgBKcOlNpw6UwG0Cg0CkA8UUCikAUUUUDCiiigQUUUUAFLSUtABRR\r\nRQMKKKKAIqKKKoQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAtFFFAAKfTB1p9IBaKKKACkbpS0jdK\r\nAGirK/dFVhVlfuimAtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFIaAAnFQu2TSu1RmgApKKKACiiigAooooAKWkooAWikpaACkoooAK\r\nWiigYUUuKMUgEopaMUAJS0YpaBiUuKBS0AJS0UtACYop2KCKAGUYp2KMUCG0U7FJQAUUUUCCiiim\r\nAU6m0UAPFKGpmaWgRIDS1Hml3cUDH0ZqMMaXdQA7NIWppJpDQIeG9adUQp6mgY6iiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqCTr\r\nU9QSdaAGrTqatOoAKKKKQAaYafTDQAlKOlJSjpTASgUUCgB4ooFFSAUUUUAFFFFABRRRQMKWkpaA\r\nCiiigAooooAioooqhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0UUUAA60+mjrTqQC0UUUAFI3Sl\r\npG6UANFWh0FVRVodKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFFFFABRRRQAUUUUAFFFITQAtRO9DvUZNACE0lFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAxaW\r\nkpQKQwpaMUuKAEpaUClxQAmKMU7FGKAG4pcUuKWgBuKXFLRSASilooATFJTqSgBMUmKdQaAG4pCK\r\ndiigBuKSnGkNMVhKKKKYgpwptLmgBxpKSg8UgFpcimUopgOzmkNGcUUAGaKSigRIjU+oRUitmgY6\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK\r\nKKACoJOtT1BJ1oAatOpq06gAooopABphp9MNACUUUUwCgUUUAOFLSClqQCiiigAooooAKKKKBhRR\r\nRQAtFJS0AFFFFAEVFFFUIKKKKACiiigAooooAKKKKACiiigAooooAWiiigBR1p1NHWnUgFooooAK\r\nRqWkagBB1qzVZetWaYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFFFFABRRRQAUUUUABqN2pznAqBjzQAhNFFJQAUUUUAFFFFABRRRQAUUUUAFFFFABRRSgUDEpwFO\r\nApQKQxuKXFOooATFLilopDDFFLRTEFFFFABRRRQAUtFFABRRRQAUlFFIAooooASilpKAEpKdSUAN\r\nxSYp1JimISiikoEOUZofrSpSPyaAG0tJRmmAuaXtTaUmgANFJSZoAdSqcU2igCwpyKWoVbBqUHNA\r\nC0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB\r\nUEnWp6gk60ANWnU1adQAUUUUgCmGn0w0AJRRRTAKKKKAHClpBS1IBRRRQAUUUUAFFFFAwooooAWi\r\niigAooooAioooqhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0UUUAKOtOpq9adSAWiiigApGp1Na\r\ngBF+8Ks1XT7wqxTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAo\r\noooAKKKKACg0U1zgUARyNUdKxyabQAUUUUAFFFFABRRRQAUUUUAFFFFABRRTgKQwApwFApaChRRS\r\nUUgFooFLQAUtJS0AFFFFAgooooAKKKKAClpKKACiiigAooooAKKKKACkpaSgYUlLRQAlJS0UANNN\r\npxpDTEIpwaVqbSk0EiUUUlMBaM0UUAFFJRQAtApKUGgB1ORsGo80A0AWQaWo0NSUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABUEnWp6gk60ANWnU1a\r\ndQAUUUUgENNNONNNACUUUUwCiiigBwpaQUtSAUUUUDCiiigQUUUUAFFFFAwpaSloASloooAioooq\r\nhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFLQAUUUUAKtOpq0+kAUUUUAFNbrT6Y3WmAqfeFWKrx/fFW\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqGQ1\r\nI5wKgY80AJSUUUAFFFFABRRRQAUUUUAFFFFABRRTgKQwAp1FFIoKKBS0AFLRS0AFFFFAC0UlFAC0\r\nUlFAC0UlFABS0lFAC0UmaKAClpKKAFpKKKAClpKKACiikoAWikooAKKKKAEpDS0UAMNJTiKQ0xMS\r\nkoopkhRRRQAUUUUAFLSUUALRSUtACg4NWFORVapY2oAlooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKrydasVBJ1oAYtPpi0+gAooopAIaaetONNNACUU\r\nUUwCiiigBwpaQUtSAUUUUDCiiigAooooAKKKKBBS0lFAxaKKSgCOiiiqEFFFFABRRRQAUUUUAFFF\r\nFABRRRQAUtJS0AFFFFACrT6YtPpAFFFFABTW606mt1pgOj++KnqCL74qegAooooAKKKKACiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoopGoAjkNRGnuaZQAlFFFABRRRQAU\r\nUUUAFFFFABRRSigYCnCkFLSKFooopALRRRQAtFJRQAtFFFABRRRQAUtJRQAtFJS0AFFFJQAtFJS0\r\nAFFJS0AJRS0lABRRRQAUUUUAFFFFABRRRQAUlLRQA00hp1IaAGGkpxptMkKKKKYgooooAKKKKACi\r\niigBaUHBptFAFlDkU6oY25qagAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoo\r\nooAKKKKACiiigAqCTrU9QSdaAGLT6avWnUAFFFFIBDTTTqaaAEooopgFApKUUAOFLSClqQCiiigY\r\nUUUUAFFFFABRRRQAUUUUAFFFFAEdFFFUIKKKKACiiigAooooAKKKKACiiigApaKKACiiigBVp9NW\r\nnUgCiiigAprdadTT1pgOi+/U9QxffqagAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACiiigApr9KdTJKAIWNJSmm0AFFFFABRRRQAUUUUAFFFFABSiilFIpC0UtFIYU\r\nUUUAFFFFAxaKSigBaKSlpCClpKKYC0UlLQAUUUUALSUUUALRSUUALRSUUALSUUUAFFLSUAFFFFAB\r\nRRRQAUlFFABRRRQAUlLRQA002n000xDaKU0lMkKKKKACiiigAooooAKKKKAHA4NTo2RVeno2KYE9\r\nFIDmlpAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOt\r\nADV606mLT6ACiiikAhpppxppoASiiimAlLSUooAcKWkFLUgFFFFAwooooAKKKKBBRRRQMKKKKACi\r\niigCOiiiqEFFFFABRRRQAUUUUAFFFFABRRRQAUtJS0AFFFFADlp1NWnUgCiiigApp606mHrTAkh+\r\n9+FTVDD941NQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAVHJUlRSdaAIjSUppKACiiigAooooAKKKKAClFFKKRSClFFFIYtFJRQAtFJS0AFFFLQAUlLRQMSl\r\npcUmKBBRRilpDEooopgLRSUtAgooooAKKKWgAoopKAFooooAKKKKAEopaKAEooooAKSlooASiloo\r\nASilpKAA0006kNADTTaeaaaYmJRRRTJCikpaACiiigAooooAKXNJRQBMjVIDVYHFPVuaYE9FIpyK\r\nWkAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFQSdanqCTrQAxetPpi9a\r\nfQAUUUUgENNNONNNACUUUUwEpRSUooAcKWkFLUgFFJRQMWiiigAooooEFFFFAwooooAKKKKAI6KK\r\nKoQUUUUAFFFFABRRRQAUUUUAFFFFABS0lLQAUUUUAOWnU1elOpAFFFFABTD1p9MPWmBLD1NS1FD1\r\nNS0AFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAB6VA55qV\r\nzxUB60AJSUtJQAUUUUAFFFFABRRSigYCnUlLSGFFFFIYUUUtACUtFFABS0lLQAtFFFAC0UUUAFJS\r\n0UAJRS0lABRRRQAUUUUAFLSUUALRSUUALRRRQAUUUUAFFFFACUUUUAFFJSigAooooAKSlpKACkpa\r\nSgBDSGnU00CG0UppKoQlFLRQIKKSigBaKSloAKKKKAClFJRQBMjVKKrocGpweKYC0UUUgCiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACoJOtT1BJ1oAYvWn0xetPoAKKKKQCGmnrTj\r\nTDQAUUUUwEpRSUooAcKKBRUgFFFFAwopaKACikooAKWkpaACiiigAooooAjoooqhBRRRQAUUUUAF\r\nFFFABRRRQAUUUUALRSUtABRRRQA5elOFNXpThSAKKKKACmd6fTKYEsPepajh6GpKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAI5DUNSPUdAAaSlpKACiiigA\r\nooooAKWkpaQ0LS0lLSKCiiigBaKKKACiiigYtFJS0AFLRRQIWikpaAClpKWgBKKKKAEooppNADqS\r\nmhqdmgBaKKKACiiigBaKKKAFpKKKACkpaSgAooooASlopaAEopaMUAJRS0lACUUtJQAhpKdSUANN\r\nNp5pppiYlJS0lMkWikooAKWkooAWiiigAooooAUVOjcVXp6HBoAsUUi0tAgooooGFFFFABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVBJ1qeoJOtADF60+mL1p9ABRRRSAQ0w080w0AFFFFMBKU\r\nUlKKAHCiiipAKKKKBi0UUUAJRRRQAUtJS0CCiiigYUUUUAR0UUVQgooooAKKKKACiiigAooooAKK\r\nKKAFooooAKKKKAHDpTqaOlOpAFFFFABTKf2plMCaHoakqOH7pqSgAooooAKKKKACiiigAooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACg9KKRulAELmmU5qbQMKSiigQUUUUAFFFFAC0tJSi\r\nkUFLRS0hiUtFLQAlFLS4oAbS0YooGFFFFAC0UCloEJRRRQAtFJRQAtJRRQAhNRk05qbTQBSg0lFA\r\niQUtNXpTqQwopKKAFopM0ZoAWikzS5oAWikzS5oAKKKKACiiigAooooAKKKKACkpaSgBKSnUlADT\r\nSGnUlADDRSmkqiWJRRRQIKKKKACiiigBaKKKAClHWkooAnQ5FPFQxtU4pgFFFFIAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACoJOtT1BJ1oAYvWn0xetPoAKKKKQCGmGnmmGgAooopgJSi\r\nkpRQA6igUVIBRRRQMKWkpaBCUUUUDClpKWgQUUUUAFFFFAyOiiiqEFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUtFBoAKKKKAHDpTqQdKWkAUUUUAB6UynnpTKYE8P3afTIvuU+gAooooAKKKKACiiigAooooA\r\nKKKKACiiigAooooAKKKKACiiigAooooAKKKKACkbpS0xzQBE3WmU5utNoGFFFFAgooooAKKKKAFF\r\nLQKKRQopcUClpDDFLSUZoAWikooAWikooGLRSZozQIWlpuaN1AC0Zpu6k3UAOzRTc0uaAFzRmm5o\r\nzQANTKcaSmgYlFFFAiRelLSLwKWkMTNFFJmgAzRSUUALmjNJRQAuaXNMpaAHZozTaKAHbqXdTKKA\r\nH5pc0yjNAD80U3NGaAHUUmaKAFpKKKAEpKWkoAQ02nmmmmJjaKKKZIUUUUAFFFFABS0lLQAUUUUA\r\nKpwasIciq1TRNQBLRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABVeTrViq8nWgB\r\nq9afTF60+gAooopAIaYaeaYaACiiimAlKKSlFADhRQKKkAooooAKKKKBhRRRQAUtJS0AFFFFAgoo\r\nooGR0UUVQgooooAKKKKACiiigAooooAKKKKAFoNFK3WgBKKKKAHDpTqQUtIAooooAD0plPPSmUwJ\r\n4vuU+mxfcFOoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigANRMK\r\nexpp6UDIj1ptObrTaACiiigQUUUUAFKKSlFA0LSikpRUlC0UUUAFFFJQAtFJRQAuaTNJRQAuaM0l\r\nFAC5pKKSmAtJRRQAtGaSigBaKSigBaSlpKAEpyikpwoAdSUUlIApKKSmAUUUUCCiikoAWiiigAop\r\nKWgApaSigYtLSUtIBaKKKAEozS0UAGaM0mKKAFopM0tACU006kNAhtJSmkqiQooooAKKKKACiiig\r\nBaKKKACnIcGm0ooAsqcilqOM8VJQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUCCiiigYVBJ1\r\nqeq8nWgBq9afTF60+gAooopAIaYaeaYaACiiimAlKKSlFADqKBRSAKKKKQwooooEFFFFABS0lFAC\r\n0UUUAFFFFAEdFFFUAUUUUAFFFFABRRRQAUUUUAFFFFACilf71IOtOk4c0ANooooAeKWkFLSAKKKK\r\nAA9KZTz0pgpgWI/uCnU1PuCnUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABQaKQmgBpppPFObpTKRRGaSlNJTEFFFFAgooooAKUUlKKQ0KKWijNIoKKSigBaKKKACiiigBK\r\nKKKYCUUUUAFFJRQIWikooAWikooAWikooAWiiigBRS0lLSGLSUtJQAlJQaKYBSUtJQIKKKKBBRRR\r\nTAKKKKAFopKKQx1LTc0oNAC0tJmjNIYtFJRQAtJS0UANpaKSgBaKKKAGmm08000yWJRRRTEFFFFA\r\nBRRRQAtFFFABRRRQBJGanFVlODVhTkUALRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAgopKWgAooooA\r\nKrydasVBJ1oGMXrT6YvWn0AFFFFIBDTDTzTDQAUUCimAlLSUUALmjNJRQA7NGabRQA7NJmkooAWi\r\nkooAWjNJRQAuaM0lFAC5ozSUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAKOtOkOWNNoPWgAoooo\r\nAeKWkFLSAKKKKABulMFObpTaYFhPuCnUifdFLQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFMY80+o260DQh6UlKabSGMNJSmkpiCiiigQUUUUAApwpBS0hoWm0UUDFoooo\r\nGLRSUUgFpKM0ZoAKSjNJmmIWkoooFcKKSimAtFJS0AFFFFABRRRSAWiiigYtKKSlpDClpKKAENJS\r\nmkpgFJS0lAgooopiCiiigApKKKBC0UlFAC0ZpKKBi5pc02loC47NGabRmkO47NLmm5ozQMdRSUtI\r\nAoooxQAGmGn4ppFMQ2ilpKZIUUUUAFFFFABS0lFAC0UUUAFTRNUNOU4NAFmikU5FLQAUUUUAFFFF\r\nABRRRQAUUUUAFJS0lAgpaSloAKKKKBhUEnWp6rydaAGr1p9MXrT6ACiiikAhphp5phoAVehpDTl6\r\nGmmmAlFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAtFFFABRRRQA8UtIKWkAUUUUAI3Sm05ulNpgWV+6PpS0i/dH0paACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigAooopAFFFFABRRRQAVGetSHpUTdaBoTvSGgUpoKIzSUppKZIUUUUCCiiigAp\r\naSlpDQUtFFAwopKKAFpKKSgLi0maKSmK4tJRRQIKKKKACiiigAooooAKWkpaBhRRRQAtFFKBSGKK\r\nWgUopDExRTsUhoAbSGnUhoAbSUppKZLCiikpgFFFFAgopaKACiiigBKKWigBKKWkoAKKKKAFopKW\r\ngYtLTaWkMcKWmZp2aQxaaaWkNADTSUppKokKKKKBBRRRQAUUUUALRSUtABSikoFAFiM5FPqKOpaA\r\nCiiigAooooAKKKKACiiigApKWkoAKWkpaBBRRRQMKrydasVXk60ANXrT6YvWn0AFFFFIBDTDTzTD\r\nQA5ehppp6Hg0w9aAEooopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB\r\nRRRQAUUUUAFFFFABS0lFAC0UUUAPFLSCikAtFFFACN0popzdKaKYFpfuiigdBRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUgCiiigAooooAKKKKAA9KhbrUx6VC3WgaEp3amU7tQURt1pKVutJT\r\nJYUUUUCCiiigApaSlpDQUUUUDCkoooEFJRRTEFFFFABRS0UAJRS4oxQAlFLRQAlFLSUAFFFLQAUU\r\nUUhiiniminUmUFOFIKcBQAUhp1IaAG0hFOpDQAwim0800imhMSiiigQUUUtMBKKWikFgxS4oFLmg\r\ndhMUmKdSUAJijFFFACUUtFArCUUYoxTAKKXFGDSASloxS7aBiikpcUUhjTSU4000yWJRRRTEFFFF\r\nABRRRQAUtJS0AFFFFAEkR5qeq8fWrAoAKKKKACiiigAooooAKKKSgBaSikoAWikpaAFopKWgAqvJ\r\n1qxVeTrQA1etPpi9afQAUUUUgENMNPNMNADk6GmmlXvSGmAlFFFABRRRQAUUUUAFFFFABRRRQAUU\r\nUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUALQKKBQA8UUCikAUtJS0AI1NFK\r\n1A60wLI6UUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUgCiiigAooooAKKKKACiiigAPSoW61Maj\r\nagaI6U0d6CKChhpKU0lMlhRRRQIKKKKAFooopFBSUUUCCkpaKYhKWiigYUUtFIBKWiigYUUUUAJR\r\nS0lAgooooAKKKKAClApQKUCgaQCloopFCinU0U8UCYUhpaSgBKQ0tFAxtBFOpDQAwikp5FNxTEJR\r\nRijFAgooxRQAUtJRQMWiiigA4o4oxS4pAJijFOxS4oAbilC07FFAhMUUtFAxKKKKAEooooASmmnG\r\nkpiGUUppKZIUUUUAFFFFABS0lLQAUUUUAOTrVgdKrr1qwOlAC0UUUAFFFFABRRRQAUhpaKAG0UtF\r\nACUUUUAFLSUUALUD9anqB+tADV60+mL1p9ABRSUUgA0w080w0AKKSgUUwEooooAKKKKACiiigAoo\r\nooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBaBRQKAHiigUUgC\r\nlpKWgBrUDqKGoXqKYFmiiigAooooAKKKKACiiigAooooAKKKKQBRRRQAUUUUAFFFFABRRRQAUUUU\r\nAFRsakqFutBSG96WikzQMa3WkpTSUyWFFFFAgoFFKKBoUCjFLRSKG4oxT8UYoEMxRin4oxQAyin7\r\naNtFwGUU7FJigYlFLil20ANop22l20AMop+2kIoAbRTsUbaBDcUoFOxS0DEoopaQwooopAKKcKaK\r\ndTEwpKWigQlFFFAxKKKKBiGjFFFACYoxS0tAhuKNtPooAbto206igBu2jFOooATFGKWigAxRilxS\r\n0xCYopaaaQBSUtJQMQ0lLRQMSiiigQGm06kNADTTacaSmSxKKKKYgooooAKKKKAFooooAUdasL0q\r\ntViM8UAPooooAKKKKACiiigAooooASilNNoAKKSloAKWkpaACoH61PUD9aAGr1p9MXrT6ACkoopA\r\nBphp5phoAKSlpKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFAC0CigUAPooopAFLSUtADWoX7woahfvCmBZooopAFFFFABRRRQAUUUUwCi\r\niikAUlLSUDDNLTaWgBaKSloEFFFFABRRRQAUUUUAIaibrUp6VCetBSCkNBooGNNJSmkpksKKKKBB\r\nThSAU6kUhaKKKQwpaKKAClxRRQAuKMUUtADcUYp1GKAG4pcUuKKAEooooASjFLRQAmKKKKACkpaK\r\nBjaWiikAUCigUwHClFIKdQIKQ0UUCEpKWkoGLRSUtACUUUUDDFFLRQISloooAKWkpaBCUYpaWmAm\r\nKWiloASiikoAKTNFJSGFBpKKBhSUUUAFJS0lAhaSiigBKaacaaaYmJRRRTJCiiigAooooAKWkpaA\r\nCnoeaZSg80AWBS0xDxTqQx1FJRQAtFJRQAtJRRQAUlLSUAJRRSUCHUUlLQAtV361Yqu/WmAi9afT\r\nF606kAUUUUABphp5phoAKSlpKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFAC0CkpRQA+iiikAUtJRQAjdaF+8KRutKv3hQMnzS00U6gBa\r\nKKKBBRRRQAUUUUAFFFFACUhpaSgYlLRRSAKKKKYC0UlLQAtFFFAgooooARulQnrUrdKhPWgpAaBQ\r\naQUDEakpxptMlhRRSigBRTqSlqSgooooGFLSUtABS0lFAC0tJS0CFooFFMQUUtJQAUlLRSASiloo\r\nGJSUtFACUlLSUDCiiikAUtIKdTABTqbS0EhSUtFACUlLSUDEpaSlFAxaSg0ZoELRSUtAC0UUUCCg\r\nUUZpgLRRRQAUUUlAC5pKKSgAooopDEpKWigY2ilNJQAUlLSUAFFFFAhDSGnU00xDaKWkpkhRRRQA\r\nUUUUAFFFFAC0UlLQBIhqTNQL1qUGkMfS0gooAWikpaACiiigAooooAQ0mKdSUCExS0tFABVd+tWK\r\nrv1oARetOpq06gAooooADTDTjTTQAlFFFMAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigApRSUooAfRRRSAKKKKAGt1oX7wobrQOtAEwNOB\r\nqMUoNIokzRmmZpc0CsOopuaM0AOopKKAFooopgFJQaM0gCiiigYlFFFACilpKWmIWikpaBBRRRQA\r\njdKg71O3SoD1oKQGkpaSgYhpKU0lMlhSikpwpAhaKKWkUFFFFAwoopaACiiloAKWkpaBC0tJRTEL\r\nRRSUAFFGaKACikozSGIaKKQ0DDNJmkJpKAHUUCigBwpaSigQtLRS0xCUUtFADaSnUhpDG0Cg0CgY\r\nUlLmg0AGaUGm0A0APopoNLmgQtFJRmgB1FNzS0BYKKSigBaKSigAooooAKSiigYUlFFABSUUUAFF\r\nJS0CCmmlpDTEJSUtJTEFFFFAgooooAKKKKAClpKKAFHWpAajp4NIZIpp1MWnigApaKKAEpaSigBa\r\nKKKACikpM0ALmjNJmigBTUD9amNQt1oARadTV606gQUUUUAIaaacaaaAEooopgFFFFABRRRQAUUU\r\nUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFKKSlFAD6K\r\nKKQBRRRQA09aF+8KD1pY/vCgaJMUYp1FIY3FFLRQAlJmlNJQA4GnCmCnCgB1FFFAhppKcRSYoGJm\r\nilxRigAooxS4oAKWkpaYgpaSigBaKSloEB6VA/Wp6hkHNA0NFIetOWhqChhpKWkpksKeKYKeKTGg\r\npaKKQwooooGFLSUtAC0UlFAC0tJRQIWikooAdSUlFAC0maSkoGOzSUlGaADNITQTTaAFpQKAKdig\r\nQlLRRQMWikpc0ALS5pmaXNArDs0ZpuaTNAWHGkzRmkoADQKKKBi4GaUimgc07FAhpFNNPIppFACZ\r\npQaZS0APzRTc0ZoGOFLTaXNAC0UmaKAFopKKACiikoAU0lFFABSUtJQAUUUUCEooooAKDRRTAbSU\r\nppKCQooopiCiiigAooooAKKKKAFpy02lWkBKKeKjFPFAx1FFFABSUUUgCiiigBDSU6igBMUuKKWm\r\nAmKgfrVg1XfrQAgp1NFOoEFFFFACGmmnGmmgBKKKKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSikpRQA+iiikAUUUUANPWlj+8KQ9a\r\nWP71A0T0lFFIYUUUmKAEJpuacabigBRTxTBTxQA6ikpaYgooooAKKKKACiiigAopCabmgB9FNBpa\r\nAFoopaACopalpkg4oBEY6UhooJoKG0lLSUCYop1NFOoBC0UlLSGFFJS0DFopKKAFooooAKWkooAK\r\nKKKACikooAKKSigApKKSgApQKSnCmIcOKWm5ozSAWkzSZpM0DFzS5ptFFgHZozTc0ZosA7NJmkoo\r\nELmjNNoosA7NOBpmaXNADmpoY0uabmgCQGg0wGlzQA09aSlam0wFpabS0AOopKWkMWikozQA6ikz\r\nRmgBaSiigBKKKKACiiigApKKKBBRRRQAUUUlMANNp1NoJYUUUUxBRRRQAUUUUAFFFFABSikpRQBI\r\nDTwaiFPBpDJAaWowacDQAtFFJSAWikooGLRSUUCFpabmlBpgLVd+tWKrv1oAQU6minUCCiiigBDT\r\nTTjTTQAlFFFMAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig\r\nAooooAKKKKACiiigApRSUooAfRRRSAKKKKAGnrSx/epp60+P71A0SilpMUtIAooopgJikxTqKQxu\r\nKUUtFABS0lLTEFFFLQAlLRRQIKQ0tJQMaabin0UhiAU6kpaYgooooAKRulFB6UAQ96KQ9aKChKSl\r\nNJQJiilpBS0AhaKKSkMWikooAWlpKKBi0UUUAFFJRQAtJmikoAWikzRQAUUUlMQUUUUAFLmkooAM\r\n0ZpKKBXDNGaSimK4uaWm0tIdxaKSloAKKSigBaKSkoC4uaM0lFMVxc0ZpKKAuOozSUUh3FpKcKCK\r\nAG0UUUALS02loGLmikpaAClpKKQC5opKKBi0UlFAC0lFFAgooooAKKKKYBRRRQISkpaSgTEooopi\r\nCiiigAooooAKKKKAClpKWgBRTqaKWkMcDTgajFOBpDH0tMzS5oAdRSZpaACiiigAoFFJQIdUD9am\r\nzUDdaYAKdTRTqBBRRRQAhpppxppoASiiimAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUopKUUAPooopAFFFFADD1p8f3qYetPj60DRLS\r\n02lzSGGaM0lFAC5pabS0ALRSUmaAHUtMzSg0AOpabS0xC0UlFAC0lFJQAUUUUhhRRRQAUUUUAFFF\r\nFMCFutC0sg5pFoGDCmVI3SmUCYLS0gpaAFpKKKBhRRRQAUUUUALRSUZpDFopKKACikopiCiiigAo\r\nopKBBS0lKBQAooNKKQ0hjaKKKZIlFFLTASilpKAFooopAFFFFABSUUUwCiiigQUUtFAwoopaQCil\r\npBTqRQ0im1IRTSKYDaKKKBC0UlLQAUUUUDFopKWgAooooAKKSloAKSiigBaKSloAKSlooEJSGlpD\r\nQJiUUUUxBRRRQAUUUUAFFFFABSikpRQAtFGKWkMKBRRQMXNLmm5opAPBpc0zNLmgB4NLTAadmgBa\r\nQ0tIaAGk1Gae1RmmhMUU6miloELRSUtACGmmnGm0AJRRRTAKKKKACiiigAooooAKKKKACiiigAoo\r\nooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKUUlKKAH0UUUgCiiigBh605Ot\r\nNp8Q5NA0SUUuKMUhiUUuKMUAFJTsUYoASkxTsUYoAZilAp+KMUBcSloxRTEFLRRQIQ0maDTaQx1F\r\nIKWgYUUUUAFFFFABS0UUxDJBxUa1M/3ahHWgaHGoz1p5NMNAwFLSDrS0CCiikoGFFFFABRRRQAUU\r\nUUAFFFFABRRRQAUUlFAgooooAKeBSAUtJjFpppaaaAEooopiCiiigQUUUUAJRS0UwEopaKAEopaK\r\nAEpaKKQBRRRQAUtFFAxRTqQU6kMKaRS0UAMNJTjTaYgooooAWikpaACiiigYUUUUAFFFFABRRRQA\r\nUUUUALRSUtAhKSlNJQJiUUUUxBRRRQAUUUUAFFFFABSikpRQA6ilAyKB1pFCGkqTbSbaQDKKcRSY\r\npgJRmjFFADgacDUdKDSAlBopgNOzQAhqI1IajNNCYopaQUtAgpaSloAaaQ0ppDQAlFFFMAooooAK\r\nKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigApR\r\nSUooAfRRRSAKKKKAGVLD3qKpoe9MY+jFLRSAMUYopaAEpaKKBBRRRQAUUUUAFFFFABRRRQAhpMU6\r\n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\r\nCilFAC0UUUhhRSUUAFJRRTAKKKKBBRRRQAUUUUDCiiigQlJS0lMQUUUUCCiiigAooooAKUUlKKAH\r\nE8UgoNFIoXNJRRQMKDRRQIKM0mKKAHZpc02iiwDs0Cm0qmkBIBRigGloAYw4qM1Kw4qI00JiilpB\r\nS0CCiiigBDTacabQAUUUUwCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACnCm04UALS0lLSAKQ9KWkPSgBtPUcUypox8lDGhlGakK1GVpDD\r\ndShqYRRTAmBpwqFTUgNAh9FJmjNAC0lJmjNIYtFNzRmgB1GabupN1AD6KZuo3UAPopu6jdQA4mmM\r\naQtTCaYCHrSUUUCAU8GmUtAEmaaxpM0maBhSUtFACUtJRQAtFFFAwooooAKKKKBBRRRQMKKKKAFp\r\nabS0ALSGiikAlFLRTAKKKKAFopKKQBRSUUwFopKKAFopKKAFopKKAFozSUUALmjNJRQAtFJRQAtF\r\nJRQAtFJRQAUtJRQAtJRS0AJS0UtACYopaKQCUUUUAFJRRTAKKKKACiiigQUUUUAFFFFABRRRQAZo\r\nIzSUooEAFNNOzSGgBKKKKYgooooAKUUlLQNCmgUUopDCkpaKBiUCiigQ/HFIVp68ilxSAiIpMVIR\r\nTTQA2lAoAp4FMQoFOpMUtIBD0qA9anPSoD1poGKKWkFLQIKKKKAENNpxptMAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKcKbThQ\r\nAtLSUUgFpD0paQ9KAG1PF9wVBU8X3BQxjqQinUhpARMKYalaozQMQU8GmgU4CmA4GjNJRSAXNJSg\r\nUuKAG0lPxSEUAMJpM0rCmUwHZo3U2igVxc0ZpKKAuLmigU4CgYgWnbacBSikIZsoK1JSYoGRbaTF\r\nS4prCgBlFFFMYlFLSUCFopKWgYUUUUAFFFFABRRRQAUUUUAFFFFAC0UlLQAtJRRSAKSlpKYC0lFF\r\nABRRRQAUUlFAhaKSigBaKSigAooooAKKKKAClpKKAFpKKKACiiigBaKKKACiiigBRS0CikMKKKKA\r\nEpKWkpgFFFFAgooooAKKKKACiiigAoopKACiiigQGiiigBVGaGoBwaQnNACUUUUxBRRRQAUtFFIY\r\ntKKbTqBhQKKBQMDSUppKAJEPFPqJTzUlIQhphpxNNNAAKetMFPFAh1FFFACHpUB61O3SoD1poBVp\r\naQUtAgooooAQ02nGm0wCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACiiigApwptOFAC0UUUgFpD0paQ9KAG1PH9wVBUinCihjRITSE0wtT\r\nd1IY4mkpM0ooAUUopKWgBaUCkzS5oAWikzRmgBaQ0maaTQANUdOJptNCYUUUUxBRRRSGKKeKaKcK\r\nQxwp1MFGaAH0ZpmaM0AOprdKXNNJoGMooNFMApKWkoEwpaSigBaKKKBhRRRQAUUUUCCiiigAoooo\r\nGFLSUtABS0gpaQBSUtJigBKKWimAlFLRQA2ilooEJRRRQAUUUUCCiiigAooooAKKKKACiiloGFFF\r\nLQAlFLilFAxMUuKWikAUUUlABSUUUAJRRRTEFFFFABRRRQAUUUUAFFFFABSUUUAFJRRTJFopKWgA\r\npKKKACiiigAooooAWiiikMWlpKUUDA0Cg0ooGBptOpDQAlPB4plKKBDiabTsUYpAAFOFAFLQIWii\r\nigBG6VAetTt0qA9aaAUUtIKWgQUUUUAIabTjTaYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU4U2nCgBaKKKQC0h6UtIelADaeB\r\nxTKmQfKKGNEZBpMVMRTCKVwGCnCkxRTGLmjNNzRmgB2aM03NGaLAOzRupuaSiwXHZpM0lFAhaMUo\r\np1AEeKKeRTaAEpaSlFACinCminA0hi0lLSUDCiiigAoPSikNADaKKKYBSUtJQJhRRRQAUtJSigAo\r\noooGFFFFAgooooAKKKKACiiigYtFFFAC0UlLSAKKKKAEopaKAEpMU6jFADaKXFGKYDaKWjFAhKKd\r\nijFADaWlxS4oAbRTsUYoGNxS4p2KMUgExRS0UAJS0UUAFFJRQAtJRRQAlFFJTAKKKKBBRRRQAUlL\r\nSUAFLSUUAFFFFABRRSUCCiiimIUUUUUgEooopgFFFFABSikpaBi0lFLSGFFFFAxadSLTqAExQRTq\r\nCOKAIjQOtOIptAEo6UuKROlOoEJS0lApCFoopaAGt0qA9anbpUB600AopaQUtAgooooAQ02nGm0w\r\nCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK\r\nKKKACiiigApwptOFAC0UUUgFpG6UtI3SgBtTp90VBUq/dFDGh9IRS0UhjMU0ipcUjCgCE0lOIpMU\r\nxCUUYpcUAJRTtpo2UANpadspNtAAKdTQKWkMU000tJigBKUUmKKYC0UlFADs0opopwFIYtJRiikA\r\nUhoopgNNFFFMBKKKKBBRRRTEFFJS0gFopKWgYUUUlABS0lFAC0UUUAFFFFABS0lFAxaWkpaQBRRR\r\nQAUtJS0AFFFFABSYpaKAExRS0hoAKWkFLQAUUUUAFFFFABS0UUAJRRRQAUUUlABRRRQAlFFJTAWk\r\noooEFFFJQAUUUUAFFFFABRRRQAUUUUCCkoopiCiiigBaWkpQKQxKSlNGKYCUUUtABRRRSGFLQKKB\r\nhRRRQA5KkqJTzUgoELRRRSAYaYakamGmMchp5qJTg1L2oEITQDTWpM0gJM0ZpgNFACseKiNPPSmU\r\n0JiilpBS0CCiiigBDTacabTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK\r\nACiiigAooooAKKKKACiiigAooooAKKKKACnCm04UALRRRSAWkbpS0jdKAG1Mo+UVDVhR8ooY0FKK\r\nMUtIBKDS0lMCMijbT8UuKQDNlG2pMUlADdtLilooAMUhFOpKAGEUmKfRSGMxS4p1FADMUbafiigB\r\nm2jbT6KAGhaXFLRQAmKaRTzTDQA00lKaTFMBKKKKYwpKWigBKKKKCRKKKKYC0UCikMWiiigYlLSU\r\nUCFopKWgAoopKAFopKWgApaSigY6ikopALRSUtAC0UlGaAFoozSZoAWikooAKKKSgYtFFFABS0lF\r\nAC0UmaM0CFpKKKACikooAKKKSmAUUUUCEooooAKKKKACiiigQUUUUDCiiigQUlLSUwCiiigQUUUU\r\nAKKUGkopDFNFJT05FAxlFKwwaSgApaSloAWkpaSgYUUUUAFSKeKjp6GgB9FFFIQjVGakNMNAxtSA\r\n8VHTlNMBWplPamgUCFAp2KBThSENYcVEambpUJpgKKWkFLQIKKKKAENNpxptMAooooAKKKKACiii\r\ngAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKcKbT\r\nhQAtFFFIBaRulFDUANqyv3R9KrVZX7ooGLRRS0AJRRRQAlLSUUgFpKM0maAFopM0UDFpaSigQUUU\r\nUDEooooAKWkopAFLSZooAWkoppNACk000hNFMAxSgUopRQBEwpKlccVFTGFFJS0AJRRRQISilpKY\r\ngpaSigBaKKKQwooooAKKKKACiiigAooooAWikpaACiiigYtFJRQAtFJRQAtFJRQAuaWm0UALRSUU\r\nALRSUUALmjNJRQAtJRRQAuaSiigAooooAKKKKBBSUUUAFFFFAgooooAKKKKACiiigAooooASiiim\r\nIKKKKACiiigBRSkUCnYpFDKcpwaSkoAc1JQaKACgUUUDFpKXNJQAUUoGaDQAlOU802gUATUUg6Ut\r\nIBKa1OpDQAw0lKaSmBIORSUIaDSEKDS5pmaUGgBWPFRGnk8Uw0xMUUtIKWgQUUUUAIabTjTaYBRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAU4U2nCgBaKKKQBSGlpDQAlWh0FVatDoKBhRRRQAUUtJQAhphNPNRtxSGLmjNMzS0AOzRm\r\nm0UAPzRuqPNJuoAk3UZqPNANFgJc0ZqPNLmgB2aN1MJpuaAJN1G6o80ZosFyQtTS1MzRTsFxc0oN\r\nNoBoESg0uajzS5pDHnmo260u6kNMBKKSloGJRRRQIKSlopiEopaSgBaKSloAKKKKBhRRRSAKKKKA\r\nCiiigAooooAKWkooAWikooAWikooAKKKKAClpKKAFopKKAFopKKAFopKKACiiigAooooAWkoooAK\r\nKKKACiiigQUUUUAFFFFABRRRQAUUUUAFJS0lABRRRTEFFFFABSikpRQMdilFHakpDEPWkoNFAC0l\r\nLSUALRSUtABRSUtACrQaSigYUUUtACqadmmCnUAOpDSZopANNJSmkpgKDSmm07tQAhpM0GkoEKTT\r\naWkoEOFLSCloEFFFFACGm0ppKYBRRRQAUUUUAFFLRQAlFLRQAlFLRQAUUUUgCiiigAooooAKKKKA\r\nEooopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFOFNpRQA6ikpaQBSGlpDQAlWh0qqKsjpTGLRRR\r\nSAWkoozQAVG1PJpjUhjKKMUuKACilxSYoAQ02lNJTQgpaQUtAxaKKWkA0im1KRTCKYhtFFFMQUUY\r\npQKQxMUYp+KMUXCwyin4pMUANozS4pMUAFFFFAwooooAKKKKACkpaSmIKKKKAFopKKAFopKKAFoo\r\nopAFFFFABRRRQAUUUUAFFFFABRRRQMKKKKACiiigAooooAKKKKACiiigAooooAKKKKBBRRRQAUUU\r\nUAFFFFABRRRQAUUUUAFFFFABRRRQAUlLSUxBRRRQAUUUUAFFFFAx60GkBopDA0lKaSgBaSlpKACl\r\npKKACnCm0tACkUlLmkoGFFFFABThTactAC0UtGKQDTSGn4pCKAGUopCKUUwA02nkZppFBIlJSmkp\r\niHCikFLSAKKKKAEpKWkpgFFFFABRRRQAtFFFIAooooAKKKKACiiigAooooAKKKKACiiigBKKKKYB\r\nRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSikpRQAtFFFIBaQ0tIaAEFWRVYdas0DQtFJS0AJRRRQA\r\nhpppxpKQxAKXFKKKAExQRS0UAMIphFSmmkUAMopSKSgBRSim04UAOppFPpDTEREUYpxFAoAQClpQ\r\nKWkMSiijNABSUZooAMUmKdSUAJikIp4oYcUwGUlFFABRRRQAUUUUwEooooEFFFFABRRRQAUUUUAF\r\nLSUUALRSUtABRSUUALRRRQAlFLRQAUUUUAFFFFABRRSUALRRSUALRSUUALRRRQAUUUUAFFFFABRR\r\nRQAUUUUgCiiigAoopKAFooooAKKKKACkpaSmIKKKKACiiigAooooGKKWkpaQwpKWkoAWkoooAKKK\r\nKACloooGFFFFABRRRQAtA60lFAEgpaap4p1ABTTTqQ0hDaMUZozQMdikNANITQIQ0ynE02mJiilp\r\nBS0CCiiigBKSlpKYBRRRQAUUUUALRRRSAKKKKACiiigAooooAKKKKACiiigAooooASiiimAUUUUA\r\nFFFFABRRRQAUUUUAFFFFABRRRQAUopKUUALRRRSAWkNLSGgBB1qzVYVNmhjQ7NGaYTSbqQyTNFMD\r\nUuaAHUlFFAC0UlFAC0UlGaACg0ZpKAEIpMU6koAbSig02gB+aM0zNGaYCmgUmaAaQD6KbmlzQAhp\r\nKCaSgBc0maSimA7NGaSigBwNDHim0GgBKKKKACiiigAooooASiiimIKKKKACilpKACiiigAooooA\r\nKKKKACiiigAooooAWikooAWikooAWikooAWiikoAWikooAKKKKAFopKKAFopKKAFopKKAFpKKKAF\r\npKKKACiiigAooooAKWkpaACiiikAUlLSUxBRRRQAUUUpoASlpKKBhS0lKKAFooopDCkoooAKKKKA\r\nFooooGFFFFABRRRQAUUUUAOU07NR07NADs0hNNooAKKSnCgBKQmlJppoEFJS0lMkUUtIKWgAooop\r\nAJSUtJTAKKKKACiiigBaKKKQBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACUUUUwCiiigAooooAKKK\r\nKACiiigAooooAKKKKAClFJSigBaKKKQBQaKQ0AFSVGKkxQxoQ02nEU00DFFOFMpwpAPFFJQKAFpa\r\nSigAooooAKKSloAKSlooAaaaaeaYaBDaKKKYBS0lFADs0maKKBhSUtJQIKKKKACiiloAKKKKBiUU\r\ntFACUUUUAFFFFMAooFLQAlFFJQIWkoooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigQUUUUAFFFFABRRRQAUUUUDCloopAFFFFABSUtJTAKKKKB\r\nBSmkooGFFFLQAlKKKKAFooopDEooooAKKKKAClpKWgYUUUUAFFFFABRRRQAUtJRQAtFFAoAWilpp\r\npAIaBRQKYARTae3SmUEiilpBS0xBRRRSASkpaSmAUUUUAFLSUtABRRRSAKKKKACiiigAooooAKKK\r\nKACiiigAooooASiiimAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUopKUUALRRRSAKQ0tIaAAdalq\r\nIdamoY0NNNNPNNNIBtOFJSimAopabmjNIY7NFNzRmgB9FNzRmgB1FNzS5oAWikzRmgANNNKTTCaA\r\nENFFApiFApcUq07FAxmKMU/FGKAI8UVJikKUAR0op22lAoAQLShKXNJuoACAKbSmkoKA02lpKBMK\r\nKKKYgFLSUUAFFFFAhKKKWgBKKWkoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKBBRRRQAUUUU\r\nAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQMKWiikAUUUUAFFFFABRRRQAlFFFMAoopa\r\nAEpaKKACiiigBaKBRikUFJS0lAgooooAKWkooAWiiigYUUUUAFFFFABRRRQA4UUgpaAFppp1IaAG\r\n0UUtAA3SmU89KZTJYopaQUtAgooopAJSUtJTAKKKKAClpKWgAooopAFFFFABRRRQAUUUUAFFFFAB\r\nRRRQAUUUUAJRRRTAKKKKACiiigAooooAKKKKACiiigAooooAKUUlKKAFooopAFIaWkNAAOoqaoR1\r\nqWgaCmmlpDQAlFFLSASkp1JTASilpKADNGaMUoFAwzS0AU4CkAlGKdiigBpFNIqSmmgCOgCnEUAU\r\nxCinCkopDHUUzNLmgY+mk0hNNJpjHZozTQaWgAJzQBQKXFMBKSnEUAZpANIpKkxTStMQ2kNLQaBD\r\naKWigQlFFFABS0lFAC0lFFABRRS0AJRRRQAUUUUCCiiigYUUUUAFFFFABRRRQIKKKKBhRRRQAUUU\r\nUCCiiigAooooAKKKKACiiigAooooAKKKKBhRRRQAUtJRQAtFFFIAooooAKKKKACkpaKAEpRSUopg\r\nBooNFIAooooGKKWm08UDEpDTqaaAEooooEFFFFAC0UUUDCiiigAooooGFFFLQIQU+m0ooAWkoopA\r\nJRQaSmMCabTjTaZDFFLSCloEFFFFIBKSlpKYBRRRQAUtJS0AFFFFIAooooAKKKKACiiigAooooAK\r\nKKKACiiigBKKKKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSikpRQAtFFFIApDS0hoAB1qTNRCn\r\nUDQ7NJmkooAWikooAWikooAKUCilAoGKBRilFLSATFLSUtAC0UmaKACkNFIaACikpQaACg0tJTGJ\r\nRRRigYlJTsUpFADRQRTlFDntQA0Gn5xUdOBpiHMaaDQTmigY7NNJopKAENFLSUgEooopkhSUUtAh\r\nKKWigBKKWkoAKWkpaACiikoAWkopaAEopaSgAooooAKKKKACiiloASiiigAooooAKKKKACiiigAo\r\noooAKKKKBBRRRQAUUUUAFFFFAwooooAWikpaACiiikAUUUUAFFFFABRRRQAlKKSlpgLSUUUhhRRR\r\nQAU4Gm0ooAWkNLSGgYUlFFAgooooAKWkooAWikpaBhRRRQAUUUUALQKSloAWigUtIBppKcabTAQ0\r\nlKaSmSxRS0CigQUUUUgEpKWkpgFFFFABS0lLQAUUUUgCiiigAooooAKKKKACiiigAooooAKKKKAE\r\nooopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFKKSloAWikpaACkNLSGgBBTqaOtPpDCjFFFIBKK\r\nWkpgFKKSlFAxcUtApaQBRmikoAKWiigBaKKSgApppTTSaADNApKcBTGLRRRQMKKKSgYuaSg0CgBw\r\n4FMPWgmgUCFxxSU7NNoAKKUCigAoopKAFpDRS0wG0lKaMUCY2lpKKCRaKKKACiiigAxS4oozQMSi\r\niigAooooAKKKKBBSUtFACUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUtJRQAtJS0UAJRS4pKACiii\r\ngAoopaAEoopaACiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUwCgUUUALRRRSKEooooJCi\r\niimAUUUUhhS0lFAxaKKKAAUppKWgBKWkooAdS00UtIBaaaWkNMBDTaU0lMli0tJS0CCiiikAlJS0\r\nlMAooooAKWkpaACiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAlFFFMAooooAKKKKACiiigAoo\r\nooAKKKKACiiigApaKKACiiigBaQ0UUAA60+iikxoKMUUUhhSUUUAJSiiimA4UtFFIAooooAKWiig\r\nAppoooAQ0lFFAxQKWiimMKSiigYUmaKKACjtRRQISloooAWjFFFAxaSiigQUGiigBKXNFFACUCii\r\nmA00lFFBDCiiigApaKKACiiigYUUUUAFFFFIAooopgFFFFABSUUUCCiiigAooooAKWiigBKKKKAC\r\niiigAooooAKWiigAooooAKKKKAEooooAWiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAF\r\nJRRTAKKKKAFpaKKBiGiiikAUUUUxBRRRSGFFFFABS0UUDCgUUUABooooAKWiigAooooAaaSiimSx\r\naWiigQUUUUAJSUUUAFFFFABS0UUAFFFFIAooooAKKKKACiiigAooooAKKKKACiiigD//2Q==', 'asha1', '2016-04-25 18:21:44', 'asha1', '2016-09-12 18:21:44', 'wasqfrtgyhug'),
('asha9428', '41001', 5, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Suman', 'Sudas', 'Jadav', '1987-09-12', 29, 'Marathi', 'Akola', 'Literate', 0, 'Married', 4294967295, 'Akola market gali', '', 4294967295, '12', '', 'asha1', '2016-02-10 11:08:09', 'asha1', '2016-10-05 11:08:09', 'qawsqawsedrf');
INSERT INTO `hm_patient` (`Patient_id`, `PinCode`, `Village_id`, `City_id`, `District_id`, `State_ID`, `Country_ID`, `Card_Type_id`, `Gender_Id`, `Cast_Category_Id`, `Patient_Salutation`, `Patient_FName`, `Patient_MName`, `Patient_LName`, `Patient_DOB`, `Patient_Age`, `Patient_Language`, `Patient_POB`, `Education`, `Patient_BPL`, `Patient_Marital_Status`, `Patient_Contact`, `Address_line1`, `Address_line2`, `Patient_Emergency_number`, `Patient_Ward`, `Patient_Image`, `Created_By`, `Created_Date`, `Updated_By`, `Updated_Date`, `Card_Number`) VALUES
('asha9844', '41001', 9, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Shila', 'Haris', 'Pansare', '1991-09-08', 25, 'Marathi', 'Satara', 'Literate', 0, 'Married', 4294967295, 'Satara paragji app', '', 4294967295, 'Df', '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAKBueIx4ZKCMgoy0qqC+8P//8Nzc8P//////////////\r\n////////////////////////////////////////////2wBDAaq0tPDS8P//////////////////\r\n////////////////////////////////////////////////////////////wAARCAPIBRADASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwCaikpa\r\nACiiigAooooAKKKKACiiigAooooAKKKKACiiigApKWkoASilpKAEpjU+mNQBEetFBooAKKKKACii\r\nigBKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiii\r\ngAooooAKKKKACnK2KbRQA5uaQHFFFACls0lJRQA4GjNNpaAJENONRpUtAxhpMUrDFIpoAb0pwNKR\r\nmgCgAzThTaUUAOAooFBoATNFNNIDSAfRQORRQAUhFLRQA0nFAahhTcUAP3U4GouRSg0ASGkoFFAC\r\n0hFFLQAwikxTiKaeKYCYpynFIDmnAUALSGiigBtG6nY4qMikBKtOxTENPpgJS0maWgBKKWkoAQik\r\np1NPWkAopaQUGgBaRqBSnkUANBp9MHFPBzQAhpKU0UAJS0UUAJRQaBQAtFJSigBDRQaTNAC000+m\r\ntTAFNPqIdakHSgAIptPNNNAAKSjOKaTzQA8UEUiGnGkA0U4U2lFAC0hFOpDQA2ilxRigBBTqbS0A\r\nFJS0lACEU3FSUhFADRTs0hFJmgB4opBThTAik602nSfeptAhKKKKACiiigAooooAKKKKACiiigC3\r\nRRRQAtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAlJS0lACUxqkpj0AQ96KO9FABRRRQ\r\nAUlLRQAlFLSUAFFFFABRRRQAUUUUAFFLSUAFFFFABRRRQAUUtJQAUUUUAFFFFABRRS0AJS0UUAJR\r\nS0UAJRS0UAJRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAD061LUK9amWgBrU2ntTKBjgaWmUucUAKaQ\r\nUZzSgUALSZpaaaAF60hFKDTqQDAcU4c0EUAUAFFLSUAIaBQaBQApFN20+igBBQaWkNAAKWkFLQAl\r\nIwpaQ0wGAc1IKQClpAIaWiigApMUtFADRwadnim45p3agBhbmnq2RUTdaVDzTAlpu7mnDpUbdaAJ\r\nM5opqmnGkAlLSUtABRSUooAa1CtSt0qPoaYEvWikWloAKKKKAA0lBNAoAKcKbThQA1qSnEUmKQBS\r\nHpS0hpgNHWpB0po60+gANJilopAMaoz1qU00rQAIakqMDFPFMBDSU40mKAFFFJRQAZpaSjNIAxRR\r\nmloASkp1JQAUUlKKAEIprU+mNTAAacDTAKU0gGscmm0p60lMQUUUUAFFFFABRRRQAUUUUAFFFFAF\r\nuiiigBaKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBKKWkoASmPT6jegCKiiigAooooAK\r\nKKKAEopaKAEopaSgAooooAKKKKACiiigApaSloASilpKACiiloASilooASloooAKKKKACiiigAoo\r\nooAKSlpKAFpKKKAClpKWgBKKWigBKKWkoAKKKKACiiigBRUqtUNKDigCZjxUR607dxTaBig0hoop\r\nAKpqTtUXSng5oAWgiiigBKcKTFLQMWkoopiFpKWikA2lFIaBQA6iiimAU006kNACiigUUgCkpaKA\r\nEopKWgYUUUUCCkNFLQAUhpaMUAMK00cGpaZimBIvSmP1pymgjNADFp/agClIoAQUE0UhoAM0tNFO\r\nPSkAtMZaUHmnHkUwGIeakqPGDT1NAAaKU0lACEUClooAQ0qmmmlWkA6kpabQAUEUtFACDinU2loA\r\nKKKKAENAopKAHcUU3NANMB1FJRQAGikNANAC0lOooAbTqSikAtFJRQAUlLRQAA01qWkNAAKQ0ooY\r\nUAR0lKaSmIKKKKACiiigAooooAKKKKACiiigC3S0lFAC0UUUAFFFFABRRRQAUUUUAFFFFABRRRQA\r\nUUUUAFFFFABSUUUAJTHp9MegCE0UUUAFFFFABRRRQAUUUUAJRRS0AJS0UUAJRS0lABRS0UAJRRRQ\r\nAUUUtABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAlFLRQAUUUUAFFFFABSUtFABRRSUAFFFF\r\nABS0lLQAUtJRQAtFFFAwpymm0opDJKSgUtABRSUtMAooopALRRRQIaaUUhpRQMWiiimIKSlpKAFo\r\noopAFFFFACUUUUDCiiigAooooEGKKKKACiiigBo4pwNBpmaAJBS01TTqAEoIopaYDAMUtBoFADSO\r\nacDQRSDrQAppAeadTSOaAH0lA6UUAFFFLQA2gUtFIBe1MNPpjCgAFLTRTqACiikoAdSGiigAFBoo\r\noAaRSZxT6aRmmAA04UzGKUGkApoFIaF60wFpQaKSgB2KSjNGaQBSUppKBi0UlKKBBSEUtFADRxTu\r\nopDSZ4pgRnrSUp60lAgooooAKKKKACiiigAooooAKKKKALdFFFAC0UUUAFFFFABRRRQAUUUUAFFF\r\nFABRRRQAUUUUAFFFFACUUUlABUb1JUb0wIqKKKQBRRRQAUUUUAFFFFABSUUtACUUtJQAUUUtACUt\r\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUU\r\nUAJRRRQAUtJS0AFFFFAC0UUUhhSjrSUUASCikFOoAKKKSgBaKKSgY6iiigQ00q0GgUDFooopiCk7\r\n0tJ3oGLRRRSEFJS0hoAKWkpaAEopaSgAooooAKKKKACiiigApCKUUpoAjzg09TmmEUKcUAS0UgOa\r\nWmAlJ3p1JikAlJ3p2KaaAHjpSGkBpaYBRTScUA80gHUtNzSg0ABpAaU02gB9JSZpaAG4paWm0ALR\r\nSiigBKKKTNAC0UUtACUYopaAGtTcU80mKADFKBRRQAUUUUDENIM06igApDRRQAAUHilpDQAA0tIK\r\nWgQlIadSHpTAiNJSmkoEFFFFABRRRQAUUUUAFFFFABRRRQBbooooAKWkooAWikpaACiiigAooooA\r\nKKKKACiiigApKWkoAKKWigBKSlpKACo3p9RvTAjooopAFFFFABRRRQAUUUUAFFFJQAtFFFABRRRQ\r\nAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB\r\nRRRQAlFFFABS0lFAC0UUtABRRRQMKKKKAHLT6ip60gFpaKKYBRiijNAC0lLSUABoFFAoGOpKWkoE\r\nFJS0lIBaKKKACiiigBKKKWgApKKKACiiloASilpKACiiigYUUtJQIQ0w1JTSKAEQ1JmogKfQAuaW\r\nm0tAC0hFGaWgBg60+jFFADWFJTqSgBKUGikoAfSUCigApc0lFAC0lIKdQAlFLSUABpmafTGFAxwN\r\nOqNTT6AFopKWgBDRRRQAUUUUAFFFFABRRRQAYooooAKQ0tJQAoooopoApD0paQ9KYiI0UUlIQUUU\r\nUAFFFFABRRRQAUUUUAFFFFAFuiiigAoopaAEpaKKACiiigAooooAKKKKACiiigApKWkoAWiiigBK\r\nSlpKAENRvUhqN6AI6KKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAEooooAKKKWgApaSigBa\r\nKKKACiilAyKQxKeKZSg0ASUUgpaYBRRS0DCkpTSUCClFJSigYtJS0lAgpKWkoAWikopALSUtBoAK\r\nSiloAKSiloASlopKACiiigAooooAKKKKBhSUtFACYopaKAAUtJRQISlFFFMYtFJRQAUYpaKAEpCK\r\ndSGkAgpaSloAKKKKBC0UmaKAFpKWkoAKQilooGNxThRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRQa\r\nKACkpaSgApaSlpoApG6UtI3SmIipKWkpCCiiigAooooAKKKKACiiigAooooAuUlLRQAUUUUAFFFF\r\nABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACGkp1JQA2mPUlRvTAiooopAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAJRRRQAUtJS0AFFKKDQAlLmkpaACnCm0UhgetA60tFADxSimrTqAA0A0UAUAL\r\nTadSUAFKKSlFAxaSlNJQIWm0tJ3oAWkpaSgBaDRSGgApaKSgApaKSgBaKKSgApaSloAKSiigYUUU\r\nUAFFFFABRRRTEFFFFIYUUUUwCiiigBaKSloAKKKKQCUUppKACiiigAFFFFABRRRQAUUUUAFFFFAB\r\nRRRQAUUUUAFFFFMAooopAFLRRQAlFFFABSUtFABRSUtABSN0paR+lUIioopKQgooooAKKKKACiii\r\ngAooooAKKKKALlFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFJS0hoAQ1G9SVG9\r\nAEVFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACUUtJQAUtJS0AFLSUtACUtBozQAUoopKQ\r\nwooooAcKf2qOnrQAtAoNIKBjjSUtJQISnCm04UALSUtJQAtNp1JQAUnelpO9ADqQ0tIaYCUtJS0h\r\nhRRRQAlLSUtABSUUUAFFFFABRRS0AJRRRQAUUUUAFFFFABRRRQAUUUUwFopKUUALSGiigBKKKKQB\r\nRS0lABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRTAKKKKQC0UUUwEooooAKKKKQCUtFFABTX6U\r\n6mv0qhEdJS0lIQUUUUAFFFFABRRRQAUUUUAFFFFAFyiiigAooooAKKKKACiiigAooooAKKKKACii\r\nigAooooAKKKKACg0UUANNRvUhqN6BEVFFFAwooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigApKWi\r\ngAooooAKWkooAWikooAWg0UUAApaSigBaUGm0tAyQc0YpAaXNAC0lLSUgEp60ynigANFBoFMApKW\r\nkFAAaQdacaTvQAtJS0hoAKKKKQwooooAKKKKBBSUtFAwpKKWgAooooAKSlpKACiiigAooooAKKKK\r\nAAUUtJQAUtJSigAopaQ0xCGiiloGFFFFACUUUUgCiiigAopaSgAooooAKKKKACiiigAooooAKWko\r\npgLRRSUAFFFFABRRRSAKSlpKAFpr9KdTHpiGUlLSUCCiiigAooooAKKKKACiiigAooooAuUUUUAF\r\nFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAIaiepTUL0CI6KKKBhRRRQAUUUUAFF\r\nFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUU\r\nUAFFFFABRRRQAUUlLQAUUUUAFFFFABRRRQAUlLRQAUUUUAFFFFABRRRQAoopKKAHZpymmUoNAySi\r\nmg0uaACnCm08UABoFBoFABSUtJQAtJS0UAFJS0lABRRQKQBRRRQAUUUCgYUUUUAFFFFABRRRQIKS\r\nlpKBhRRRQAUUUUxBQKKKQwNFAooAKWkpaACilpKYhDQKKWgYUUUUAJS0UUAJS0UUgCiiigBKKWig\r\nBKKWkoAKKWigBKKKWgBKWkpaACiiimAlFFFABRRRSASilopAFMen0x6oBlJS0lBIUUUUAFFFFABR\r\nRRQAUUUUAFFFFAFyijNFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACGonqU1\r\nC9AiOlpKKBhRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUlAC0UlFABRRS0AJRRRQAtFFJQAtJS0UAJS0lLQAUUUUAFFFFABRRR\r\nQAUUUUAFFFFABRRRQAtKDTaWgY+niogakBoAdQKSlFAAaQUtIKAFooooAKKKKAEopaSkAUUUUwCi\r\nlpKQBRS0lABRRRQMKKKKBBSUtFAxKKWigApKWimAlFLiigAooooASloooAKKKKBBRSUtIYUUUUAF\r\nFFFMAooopAFFFFMAooopAFFFFACUtFFACUtFFACUUUtABSGlpKYBRRRQAUUUUgCiiikAUx+tPqN+\r\ntMBtJS0lMkKKKKACiiigAooooAKKKKACiiigC2KWkpaACiiigAooooAKKKKACiiigAooooAKKKKA\r\nCiiigAooooAKKKKAENQvUxqGSgRHRRRQMKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAEooooAKKKKAClpKKAClpKKAFoopKAFoooo\r\nAKKKKACiiloASilooGJRS0lAgooooAKKKKACiiigApaSigBacpplLQMkBpwqIGpAaAHUlFFAC0UU\r\nUAFFFITQAtFIKKQC0lAooAKKKKACiiigAooooAKKKKACiiigYUUUUCCiiimAUUUUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUgCiiigYUUUUAFFFFACUtFFABSUtFACUUtFACUUtJ\r\nQAUUUUAFRv1qSo360CG0lLSUxBRRRQAUUUUAFFFFABRRRQAUUUUAWxS0lLQAUUUUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAhqF6lNRPQBHRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUtJQAUUtJQAUUUUAFJS0UAJRRRQAUUUUAFFFFAB\r\nRRRQAUtFFABRRSigAopcUYpDEop2KMUAJRS4oxQMTFGKdilxQIZijFPxSYoAZikp5FNxQAlFFFMQ\r\ntJS0UAJRRRQAopymmUoNAyQGnUwGnCgB1FJS0AFJS0lAAKKKKQAKKKKACiiigAooooAKKKKACiii\r\nmAUUUUgEpaSloGJS0UUAFFFFABRRRQAUUUUwCiiigQUUUUAFFFFIAooopgFFFFIAooopgFFFFIAo\r\noooAKKKKACiiigYUUUUAFFFFABRRRQAUUUlABS0lFAC1E/WpKjfrQIbSUtJTEFFFFABRRRQAUUUU\r\nAFFLSUAFFFFAFyiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBpqF6mNQv1\r\noEMooooGFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUtFABRRR\r\nQAUlFFABRRRQAUUUUAFJS0UAJRRRQAUUUUAFFFFAC0tIKdSGJilApcUuKAAClxQKWgYUmKWigAxR\r\niloxQAlFLRQISilooAaRSEU+kIoAjxTTUhFNIoAbSijFFAgIpKU0lMAooooAcDT1NRinKaBklBpM\r\n0UAGaKb3pwpALRSUUALRRRTAKKKKACiiikAUUUUwCiiikAUUUUAFFFFAwooooAKKKKACiiigAooo\r\noAKKKKBBRRRQMKKKKBBRRS0wEopaKACkpaKAEooopAFFFFABRRRQAUUUUAFLSUUDCkpaKAEopaKA\r\nEopaSgAooooAKibrUtRN1oEJSUtJTEFFFFABRS0UAJRRRQAUUUUAFFFFAFyiiigAooooAKKKKACi\r\niigAooooAKKKKACiiigAooooAKKKKACkpaSgBDUL1K1QN1oASiiigAooooAKKKKACiiigAooooAK\r\nKKKACiiigAooooAKKKKACiiigAooooAKWkpwpAGKSpNtNxQA2inYpMUANop2KQimAlFFJQAtFFFA\r\nCUtJRQAUUUUAFFFFABS0lLQACnCkFOApDFFLRS0DClpKWgAopaKBBRS0UAJRS0UAJRS0lABRS0lA\r\nDSKaafSEUAR0lPIppoAbRRRTEFFFFABSg0lFAEgNLmmA06kMKUU2nCgBaKKKAFooooAWkoooAKKK\r\nKACiiigAooooAKKKKACiiimMKKKKQBRRRTAKKKKACiilpCCkpaSgAooooAKKKKACloopgFFFFABR\r\nRRQAUUUUAJRS0lABRRRQAUUUUgClpKKBhRRRQAUUUUAFJS0lABRRRQAVE3U1LUR60xCUlLSUCCii\r\nigAooooAKKKKACiiigAooooAuUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAlFL\r\nSUANaoG61O1QN1oASiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAW\r\nlFJThSAeOlIaUdKQmmAlFGKKAEpCaU000AJRRRQAUUUlAC0lFFABRRRQAUUUtABRRTsUhgKcKTFK\r\nKBi0tJS0ALRRS0AFLRRQIKKKKYBRRRSAKKKKACkpaSgApKWkoAaaaRUlIRQBERSU8imUAFFFFMQU\r\nUUUAKKdSAcU6kMSnCjFFAC0UlLQAtFIKdTAKSlooAKKKKACiiigBKKKWkAlFFFABRRRTGFFFFIAo\r\noopgFFFFABS0lLQIKSlpKQC0lFOAoASilpKAClpKWmAUUUUAFFFFABSGlpDQAUUlLQAlFFLQAlFL\r\nSUgClpKWgBKKKKACiiigYUlLRQAUlLRQAh6VCetTHpUJoEFJS0lMQUUUUAFFLRQAlFFFABS0lFAB\r\nRRS0AW6KKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKSgBrVA3Wp26VAetACUU\r\nUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABThTactIB4pDS0UwEoNF\r\nIaAENNpTSUAJRS0lABRRRQAUUUUAFFFFABS0lLQAopwpopwpFC0tJS0AKKKKKAFpRSUUAOopKWgQ\r\nUUlANAC0UUUAFFFFABRRRQAlFFFACUlLSUAIRUZ61KaYwoAZRRRTEFFFAoAeKWm0oNIY6iikpgKK\r\nWkFOFIApaSimAtFFFABRRRQAUUUUAFFFFIApKWkoASloooGFFFFAgooopjClpKWgQUUlLQAUlLRQ\r\nAYpaSloAKSlooAKKKKACiiigAooooAKQ0tJQAUUUUAFFFFABQaKSkAUtAooAKKKKACkpaKYCUUUU\r\ngCiiigBD0qE1M3SoaYBSUtJQIWkoooAKKKWgBKWiigBKWiigBKKKKALlFFFABRRRQAUUUUAFFFFA\r\nBRRRQAUUUUAFFFFABRRRQAlFLSUAFFLSUANaoD1qdulQN1oASiiigAooooAKKKKACiiigAooooAK\r\nKKKACiiigAooooAKKKKACiiigAooooAKeKZTgKAH0UCigBD0pppxpKAG0lOxRigBtJSmkoAKKKKA\r\nCiiigAoopaAClFJTqQ0Ap1JSikMWiiimAtFFLQAUUUUALS00U6gQhpKdTaAFpaQUtABRRRQAUUma\r\nM0AFFGaTNABRSZpaAEpCKdSGgCIikqRhUZpgFFFA60CHYpcU4dKMUhgBS4oFLTASloooAWkpaKAC\r\niiigAooooAKKKKACiiigApKWkpAFFIKWgAooooAKKKKAClpKKYC0UlLQAUUUlAC0tJS0AFFFFABR\r\nRRQAUUUUAFFFFABSUtJQAUUUUAFFFFABSUtJSAKWiigAooopgJS0UUAJS0UlABRRRSARulQ1K33T\r\nUVMApKWigQUlLSUAFLRRQAlFLRQAUlFFABRS0UAW6KKKACiiigAooooAKKKKACiiigAooooAKKKK\r\nACiiigAooooASiiigBrdKhfrU5qB+tADaKKKACiiigAooooAKKKKACiiigBaSloIoASiiigAoooo\r\nAKKKKACiiigAoopaAEp602lFAD6KBRQAlJTqSgBKWjFB4oAjPWkpTSUAFFFFABRRRQAtFFLQAClp\r\nKKQxc0uabRQMXNLmkApQtABuo3Uu2kK0ALupQ1RkUUASg0uaiBpQ1AEuaSmg0tACigmimmgB26ml\r\nqSmmgB2+jdTcUoFAC5opQKWgBtANOpMUALmim4pRQApqJhg1LTHFMQylFJQKBEopaaKdSGLRSUtA\r\nBRRRTAWiiigAooooAKKKKACiiigAooooAKKKSkAUUUUAFFFFABRRRQAUUUUwFopKWgAooooAKWkp\r\naACiiigAooooAKKKKACiiigApKWkoAKKKKACiiigApKWkpALRSUtABRRRTAKKKKACkpaSgAooooA\r\na3SoqlfpUVABRRRQIKSlooAKSlooASilooAKKSigApaKKALdFFFABRRRQAUUUUAFFFFABRRRQAUU\r\nUUAFFFFABRRRQAUUUUAJRS0lACHpUD9anbpUD0ANooooAKKKKACiiigAooooAKBRRQAuKTNOpCKA\r\nEooooAKKKKACiiigAooooAKKKKAFpRSUooAfRQKKACkpaKACkNLRQBHtpDUlRnrQAlFFFABRRS0A\r\nFLSUtIYUUtGKAEooooAcKXNMzSgUAOzRmmHigGgB56UzFLQKAEop2KTFAxymnCoxUgoAdTTTqaaB\r\nDTRQaTNAxaKBQeKAFzRmmg0hNAh+aWowacDQMdRQKWgBKRhxTqQ9KBENFB60UxDgakFRCng0DHUt\r\nJS0AFFFLQAUUUUAFFFFABSUtJQAtFFFABRRRQAUlBoFIAopaSgAoopaAEooooAKKKWmAlLRRQAUU\r\nUUALRRRQAUUUUAFFFFABRRRQAUUUUAFJS0lABRRRSAKKKKYBSUtJSAWikpaYBRRRQAUUUUAFFFJQ\r\nAUUUUgGv0qKpH6VHTAKKKKBBRRRQAUUUUAFFFFABRRSUALRRRQBbooooAKKKKACiiigAooooAKKK\r\nKACiiigAooooAKKKKACiiigApKWg0ANNQt1qVqhegBKSiigAooooAKKKKACiiigApR1pKBQA/FNJ\r\npwOaRhQIbRRRQMKKKKACiiigAooooAKWkooAWlFJSjrQA+igdKWgBKKWkoAKKKKAENRnrUhqOgAo\r\noooASlpKWgBRS0gpaQxQKWgUtIBhptSEU0rTAbUi0ylBxQA5xxUdP60mKAAU7FAFLQMaaKXFBFAD\r\nRT1puKcKAH0hpaQ0CGGm96kxSFaBgtDdKQcUUANpKfikxQAhoGc04LTgtAAKWlxRQISkNLSGgCI9\r\naSlbrSUwFp600CngUAOooooAKWiigAooooAKKKKACiiigAooooAKKKKAEopaSgAooopAFFFFABRR\r\nRTAKKWkoAKWkpaACiiigBaKKKACiiigAooooAKKKKACiiigApKWkoAKKKKACiiigApKWkpALRRRT\r\nAKKKKACiiigApKWkoAWkoopAMfpUdSSVHTAKKKKBCUtFFABRRRQAUUUUAFFFFABRRRQBbooooAKK\r\nKKACiiigAooooAKKKKACiiigAooooAKKKKACikooAWkNLSGgBrVC3WpWqFutACUUUUAFFFFABRRR\r\nQAUUUUAFFFFADgKCacOlNYcUANooooAKKKKACiiigAooooAKKKKAFpy0ynKeaAH4opaKAEpaKKAE\r\npaKKAEqNhg1LUb0ANooooAKKKBQAopaSlpDHClFIKUUDFoIpaKBDNtJtqTFGKBjAKUCnYooATFLi\r\niigQlJS0lAxKUUUCgB4ooFFAhKKWigBMUYpaWgBm2l206igBMUUtFABSUtJQAUhpaQ0ARN1pVFKR\r\nSgUAKBTsUgpaYBSUtFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSUtJQAUUUUgCiiigApaKKYBR\r\nRQaACigUtABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAAaSiigAooooAKKKKACkpaSkAtFFFMAoooo\r\nAKKKKACkpaKAEooooAZJUdSSdqjoAKKKKBBRRRQAUUUUAFFFFABRRRQAUUUUAW6KKKACiiigAooo\r\noAKKKKACiiigAooooAKKKKACikpaAENJS0lACig0CigCN6hPWpnqLvQAUlLSUAFFFFABRRRQAUUU\r\nUAFAoooAk7U1jThzTWFAhtFFFAwooooAKKKKACiiigAooooAKeoplPQ0APopaSgAooooAKKKKAEz\r\nUbHJp79KjoAKKKKACiiigYtLSClpAKKcKYKcKQx4opKUUwFooooAKKKKACkpaKBDaSlNNNAwpRSU\r\nooAeKKBRQIKKKKAFooooAKKKKACiiigApKWkoAKSlpKADFFKKaaAHClpgNOBpgLSUtFACUUUUAFF\r\nFFABRRRQAUUUUAFFFFABRRRQAlFFFIAooooAKKWimAUUUUAFFFFABRRRQAUtJS0AFFFFABRRRQAU\r\nUUUAFFFFABRRSUAFFFFABRRRQAUUUUAFJS0UgCiiigAooopgFFFFABRRSUALSUUUgI5OtMp8nWmU\r\nwCiiigQUUUUAFFFFABRRRQAUUUUAFFFFAFuiiigAooooAKKKKACiiigAooooAKKKKACiiigApKWi\r\ngBKKWigBKKKKAGPUHep36VD3oASilpKACiiigAooooAKKKKACiiigBy9KC2RQpoYcUANooooAKKK\r\nKACiiigAooooAKKKKACnLTacpxQBIKKM5ooAKKM0UAFBopCaAGMe1NoJyaBQA4Dimmn54ph60AFF\r\nFFACilpBS0hhSg0lAoGSClpopaAFpaSloAKKKKACiiigQ002lY0goGGKVaDQDzQA+lpBS0CCkoJo\r\noAKWkpaACiiigAooooAKSikoAKKKUUAFBpaKAGYpRS4opgKKWkFOoAbikp9NNACUUlLQAUUUUAFF\r\nFFABRRRQAUUUUAFFFJQAUUUtABRRRQAlLRRQAUUUUAFFFFAC0lFFABRRRQAtFJS0AFFJRQAtFFJQ\r\nAtJRRQAUUUUAFFFFIAooooAKSlooAKKKKACiiimAUUUUgCjFFFACUUtFAET9aZT5OtMpiCiiigAo\r\noooAKKKKACiiigAooooAKKKKALdFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFJ\r\nS0lADH6VCetTNUJHNACgUhpelIaAEopaSgAooooAKKKKACiiigAp27IptFABRRRQAUUUUAFFFFAB\r\nRRRQAUUUUAFFFFADlbFO3VHRQA/NKDUdFAD80hNNooAKKKSgBc0UUCgAop2KaaQBS0lLQMKKKKBj\r\ngacKZThSAdS0lFADqKSlpgFIxpaQ0CIieaUHFBWjFAxC1ANGKMUAPBp2ajAp+KAELHNAal280baA\r\nHClpBS0CCiiigApKWkoAKSiigApwptOFAC0UUUwEooooABTqbS0ALSGlpDQIZS0UUDCiiikAUUUU\r\nwCiiigAooooASilooAKKKKQBRRRTAKKKKACiiigApaSigAopaSgApaSloASiiigAopaSgAooooAK\r\nKKKACiiigAoopaAEoopaAEooooAWkpaKAEopaKAEpaKKAEpaKKAEopaKAIZOtMp7/eplAgooooAK\r\nKKKACiiigAooooAKKKKACiiigC3RRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAx+lQnrUz1C1ACUUUUAFJRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA\r\nUUUUAFFFFABRRRQAUUUUAJRRRQAtA60lKKAJKa1Lnimk0gEpaSlFAwooooGLSim04UAOFLTadQAt\r\nFJRQAtFFFACUmKWkoAMUoFFKKAExTqKKACiiigApaSloEFJRRQAUUUlAwooooAKWkooEOozSCg0w\r\nFopBS0CCiiigBwoNIKWgBhop2KTFAxKKWigBKKWigBKKWigBKKWigBKKWigBKKWigBKKWigBKKWi\r\ngAooooAKKKKACiiigAooooASloooAKKKKACkpaKACiiigAooooAKKKKACiiigAoopaAEooooAKKK\r\nKACiiigAoopaAEoFLRQBA/WmU9+tMoEFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAW6KKKACiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAGPUVSvUPegAxSGnUhFADaKXFJQAUUUUAFFF\r\nFABRRRQAUUUUAFFFFABRRRQAUUUYoAKKMUuKAEopcUYoASilxRigBKKXFGKAEopaSgAooooASiii\r\ngAooooAXNFJRQAtKKSgUAOpKKKQwpwptLQMdS02lpALmlpKKYC0UmaaTQA7NJmmZpaAH5pQajzSh\r\nqAJM0UwNS7qAHUUzdS5oAfRSA0tABRRRQAUlFFABRRRQAClxSClzQIUUGkBoNMApaBRQIKKWkNAB\r\nTqaKdQAUlLSUAJRS0lAwoopaAEoopaAEoopaAEopaKAEoopaACiiigAoxRRQAUUUUCCiiigYUUUU\r\nAFFFFABRRRQAUUYpaAEooxRigQlLRilxQA2loxS0DEopcUYoEJRS0UAJRS0UAJRS0UAJRilooASj\r\nFLRQAmKMUtFACUuKKKAK79TTKe/WmUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAW6KKKACiiigAo\r\noooAKKKKACiiigAooooAKKKKACiiigAooooAKQ0tFADGqIipWqOgBBThSGkpAKRmmEYp9BFAEdFO\r\n20mKAEopaSmAUUUUALRSUUALRSUUALRSUZoAWikzS5pALSUZozTAWiiikAUUlLQAlFFFABSUUlMB\r\naSiigAooooAKKKKACiiigBaKKWkAUUUUDClpKKAFzSim0ooGOooooAKTGaU0gNAC7aNtGacKAG7a\r\nTbUtFAEYWjbUmKMUAR7adinUlACYoFLRQAUUUUAFFFFABRSUE0CFFBpAadigBtGadikxTAVTS0zG\r\nKUGgB1BooNAhBTgabRQA+kpKWgBKKWlxQA2ilxS4oAbRTqKAEopaKAEopaKAEoopRQAlGKWigBMU\r\nuKKKADFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB\r\nRRRQAUUUUAFFFFABRRRQBXfqaZT36mmUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAW6KKKACiiig\r\nAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAGPUOeambpUOOTQAuaM0Y4pDSAUGlzTKKA\r\nHUYptLmgAIptLuozQAlFOpKAEopwFLimAyinYoApAJikqQLQVpgMxRilxTgKQDMUYqXFNIoAZS0u\r\nKTFABikp46UjUAMNFFJTAKKWigBKKKKACiiigAoopaACilxSYoAKWkoxQA6ko6UUhhRSUtABQKKK\r\nAHClpBS0hhTTTqTrTAQGnBqTbSYxQBIGpc1GM0vNAD80ZpnNLQA7NJSUtAC0UUUAFJS0lABRRS0A\r\nFNNOooERg4NSqcioyvNOXigCTHFJinCimITFMPWpO1M70APHSkNKKKAExSU6g0ANpaKKAFFFFFAB\r\nRRRQAUUUUAFFFFABRRRQAYooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK\r\nKKQmgBaKQUtABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUHpRSHoaAK79abTmptABRRRQAU\r\nUUUAFFFFABRRRQAUUUUAFFFFAFuiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACi\r\nikoAa1RHrUrVFQAmaTNO20m2kAlFLilxQMbSU/bSbKYhtFO20oFIY3BpQuafigUAKFoIxSg0E5pi\r\nGYpcUUtIYClpKKYCEUClooAUGkaigikAyloxRQAmaaTmlNNoEFFFFMApKKKACiiigAooooAWlApM\r\nU4UgFppp1GKAEUZp4XikAxTxQMQrUbDFTVG4pgR0UUUALRSUUgHClptKDQA6lApoNOFAxcUYoFLQ\r\nAYo20tFABijFFLQITFFFFACUUUUDCkopQKADFFLSUCCiiigBcUhHNOFFAApp1Npc0xCmmHrTiab3\r\noAcOlLQKKACiiigBKWkpaACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiimnN\r\nADqKaDTs0AFFFJQAtBNJRQAuaKSigAzS5ptBNACk03NFFADhS0CigAooooAKSlxRQAUUUUAFFFFA\r\nBRRRQAUUUUAFFFFABSHoaWkboaAK7U2nN1ptABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAFuiiigA\r\nooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBjdKjxUrdKjFACikp1IaQxKMUUCgA\r\nxRThQRQA2lC02nigBCKSn000wAUuKaKdSAaRRTjSUAFFGKTvQA7FIwpwoIpgMFPFNIoBoAUimsMV\r\nJ2qJjSAZRijvSnigBpooopiCiiigApKWigApQKMUopAAoop6igYgHFOp2MCmE80ALilxSA807NAC\r\nE0080E80ooAiPBpKc/3qbTAKKKKAClpKKQCg04GmUuaBkgNLmowadmgB+aM00GjNADs0uaZmjNAD\r\n6TNNzS0ALRRRQAYpaKKBBSUtJQAUtJQKAHUUUUwCmNxUlMagABpwqMU7OKAJKKYGpc0AOopM0UCF\r\nopKKAFopKWgAoopKAFopKWgAooooAKKKKACiiigAooooAKKKKAEopaSgBaKKKADFJS0lABRRRQAU\r\nUUUAFFJRQAUlLSUAFKKKBQA6iiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKRvumlpH+7\r\nQBXam0rUlABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAFuiiigAooooAKKKKACiiigAooooAKKKKAC\r\niiigAooooAKKKKACkpaSgBG6VH3qQ1HjmgBaWkopDENFLRQACgmg0maADFOFIKdigBM0hoNN70AK\r\nKWgUuKACgUlKKAFphqSmHrTAFNPpgpwNIBCKSnGmmmAZ4qMnmnE0wdaQCikandqYaACiiimIKKKK\r\nAClAoAp1IAooooGFOU02kJoAlLDFRMeaQk0lMQu7FLvNNooAXNKGxTaKAFY5NJRRQMKKKKACiiig\r\nAooooAKWkopALmlzTaUUDDNOGaAtOAoAAKWilpAFFFFMBaKKKBBRRSHpQAmaetQ96lU0AOpKM0tM\r\nBKa1PprCgBlLSUUDFpabRQA4GnA0yigRJRTAacDQAtLSUtAhKWiigAooooAKKKKACiiigAooooAK\r\nKKKACiiigAoopKACiiigAJpM0hpKBj6KQGigBaKKKAEooooAKSigUCFoFFAoAdRRRQAUUUUAFFFF\r\nABRRRQAUUUUAFFFFABRRRQAUUUUAFNf7tOpsn3aAK5pKU0lABRRRQAUUUUAFFFFABRRRQAUUUUAF\r\nFFFAFuiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACkpaSgBDTKeaSgBMU2pKYet\r\nAwFLSCnUgENMqQ0ygBy06mKafQA1qZUjVGaAHCnU0U6gBppVpGoFAD6YadmkoAMUUopCKAFpCKBS\r\n0wI2pgp700UgFPSmVIelR0xBRRRQAtKBQBTqQxKKDQKAFpKKRulMQE02iigAooooAKKKKACiiigA\r\nooooGFFFFABRRRQAUUUoFIBKUCnBacBQAwLT8UUUDCiiigBaUUlLSAKKKKYBS0lFAhaQ0UpoAZTx\r\nTO9PFADqSlopgJSE06o2PNACUUUUhhRRRQAUtJRTAWiiigBwNKDTKWgRJRTAacDQAtFFFAgooooA\r\nKKKKACiiigAooooAKKKKACiikoAKKWkoAQ02nGm0AApwptOFAxaKKKBCUUtFADTRRRQAtA60UCgB\r\n1FFFABRRRQAUUUmaAFooooAKKKKACiimOeKAHZpc1CpzT80APooFFABTZPu06mSfdoAgNJSmkoAK\r\nKKKACiiigAooooAKKKKACiiigAooooAt0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR\r\nRRQAUlLSUAIaQUGgUALTTT6YaAEFOFMpwpDFNMpxpAKAAU4GkxQKABqb3pxpo60AOxRS009aAFox\r\nSCn0ANoFBooAdSGlFFADaAaU02gAYcVH0NS1G4xQAZ4phGKUU4jIoEMooNFMBwNOFRing0hi4pMU\r\nuaaWpiAnHSmk5oooAKSlooAKKKKACiiigAoopRQAlFFFABS4pKetIYBc0oSniloAj20YxTyKQikM\r\nQUtJS0AFFFJQAUUUooAWiiimAUUUhOKAAnFIDmk609RxQA4CkNLTWoEIBzThTRS0APopKKADNRnk\r\n081HQMWiiigAooooGFFFFAhaKKKYBRRRQIKUGkxRigB4anA1HS5oAfRTQadmgQUUUUAFFFFABRRR\r\nQAUUUUAFJS0lAC0UUUANNNNONNoABThSClFAxaKWkoELSGiigBtFFFABSikpR1oGOoJoqNmoEPzS\r\n5qLNKDQMe3Sot3NPJ4qI9aBEoPFLmowaUGgZJmjNMzS5oAWmvS01+lAhq9akFRKeakzQA8UtItLQ\r\nAUyXpTqZL0oAhNJQaKACiiigAooooAKKKKACiiigAooooAKKKKALdFFFABRRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAUUUUAFJS0lADWoFKaaKAHU00tFAxMUlOpDSASlFJThQAGm0+mmmAhoHWi\r\ngCkA+mNT6aaAEWn0wU+gBDSU6kxTAUUUCigBDSGnUhFIBBSMMilooAh6GnZ4pGHNKBTAaaSlNJQI\r\nKKKKAFzRSUUAGKKWkoAKKKKACiiigAoooxQAU7tSYp2KQxlFLjmkpgFOWkopDJVp1MU08UCCkNOp\r\nKAG0UppKQwpDSmm0ALS0gp1ABRRSE0wBjim9aXGacBQAKKdSUtAgph60pOKQc0ALSDrSNxSpQA6l\r\nopKAA1H3p7GmigYUUYpcUAJRTsUYoC42lxS4ooEGKMUtJQAUtFFABRRRQAUUUUAFKKSigQ7NLTaU\r\nGgBaKKKYBRRRQAUUUUAFJS0lABRRRQAhptONNoAKcKbTh1oAWiiigAopaQ0ANooooAKKKKAHZqJ+\r\ntPzUbHmgYopc0ylpAKTTaU0w0APFLTAaXNADqXNNozQA8GkbpSZoPSgCPvUgqM9aetMCVadTVpaB\r\nBUctSVHL1oAhooooAKKKKACiiigAooooAKKKKACiiigAooooAt0UUUAFFFFABRRRQAUUUUAFFFFA\r\nBRRRQAUUUUAFFFFABRRRQAUlLRQAhpuKcaSgBtKKDQKQxaQ0tIaYDacKSgUgHU006g0xDKUUYoFI\r\nY6kIpaKYDQKdRRSAKSlooATNGaKSgBc0ZpKKACkpaSgBppRQaZmmAMOabSk0lABRRRQIKKKcBmgY\r\n2inEcU2gAooooAKXFApwFADcUooNKKQB0oBoYU0cUASU09aTcaQHmgB+3NNIxTweKU0AMWpAajNO\r\nU0DJKKKKBCGkpaQ0AIaSg0oFAxRQaWmmgBM0oGaAKUCgBQKWkzRmgQUZpKQmgBrHmnqOKYBk1J0F\r\nAEbHmnp0qPq1SrwKAFpKKKAENIBSmigAooooAWikooAKKKKACiiigBaKKKBBRRRQMKKKWgQUUtFA\r\nCUtFFAC0UlGaAFooopgFFFFABSUtFACUtJRQAhptPNMoAKcKSlFAC0tFFABSGlpDQA2iiigAoooo\r\nAaaYaeaYaBhQKSlFIBc8U2lNIKAFApcUUUAFFFFAC0Yope1AEbdaVaRutKtMCVadTFp9ABUcvWpK\r\nil60CIqKKKACiiigAooooAKKKKACiiigAooooAKKKKALdFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRRQAUUUUAFFFFACUlLSUABpKWkoGLQaKKAEIpMU6jFIAFFFFABikxS0UwCiiigAooooAK\r\nKKKAENJTjTaQBRRRQAUlLSGmAxjTacaQUANop+KSgBKKKWgYlSRKGWmEVLD900CYxhhiKZipGBLH\r\nimUANopxptACipFqKpFpDEbrSrSt0pq9aAHMOKj71KelR4+agQbTTasL0qJxzTAQGnA0wUtIZJim\r\n9DSBqdjNAhytTqi6GnZoAcTTSaSlxQMQU8UzpTh0oAdTWpc00mgQq0ppAaKACiikoAKQ0tIaAFXr\r\nQxwKVabJQA1RzUw6VHGKkoASiig0AJRRRQIKKKKACiiigAooooAKKKKAClopaBiUuKKWgAoopM0A\r\nLSUZpM0ALmikpKAHUUUUALRRRQAtFJS0CCiiimAlLRRQAhplPNNoAKUUlKKAHUUUUAFIaWmmgBKK\r\nKKACkNFFADTTDTzTD1oASnCm0opDFNIKDQKAFooooAUUUUUAFOFNpwoAY3WhaV6RaYEgp9MFPoAK\r\nil+9UtQy9aBEdFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAFuiiigAooooAKKKKACiiigAoooo\r\nAKKKKACiiigAooooAQmkzQaKAHUUgpaAEpKWkoAKKKWgYlFLRQAlFLSUALSUtFIBKWkopgFFLRSA\r\nSilopgFFJS0AJRilpKQDaKdRQA0nFN60NQtMYFabipaYaBCAUEUopaBkeKUUpFNNAC1JD900qYK4\r\npUG3NAgXqaQKMGn0UCICh25pmKskYXFQUwQ3FPWkoB5pFDjTelPFNYUgHA8UjCkU0/rQA0NSEZpD\r\nwaetADduKD0p1IaBDO9SDpUfepB0pDENApTSUALSE4paQigBo5NSVGOtPPSmAmaWkHWnUCCikooA\r\nKKKKACkpaKAF7VG3Jp5poHNAD0HFOpBwKKBBQaKSgAooooAKKKKACiiigAoopaBhS0UUAFFFFABR\r\nRTSaAFzSZpOtPAoAQClxS0UwCkxS0UCGmlFLSYpDFpKKKAClpKWgBaKSloEFFFFMANMp9MoAKUUl\r\nKKAHUUCigAppp1NagBKSiigApCaKSgBCaYacabQAU4dKbTqQxDSCg0CgB1FFFAC0UlLQAU9aYael\r\nADZBxTF61LJ0qJetMCUU8VGKkFAC1BL1NT1BJ96gRHRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR\r\nRQBbooooAKKKKACiiigAooooAKKKKACiiigAooooAKQ0tIaAEopKWgBRS0gpaAEooooAKKKKBhRR\r\nRQAUUUUAFFFFABSUtJQAtFFFIAooopgFFJRQAtFJS0AJSMcCnVE5oATqacKYtPoGOprClFKaBDKW\r\nikoGBppp9NNAAp2nNT1XqWNsigTH0UUUCGscCosU+Q84pooBCYpKfimMKBjlpTTFp9IY3vThSGgG\r\ngAIoHFO7U1utAC0GkU0tADMUvSnUYoAQGlpMUopALSHpS0UCGAc06lpDTASlpBS0AFFFFABRRRQA\r\nlKKQ0LQAOcUJSP1pY6AJKSlNJQAlFFFAgooooAKKKKBhS0UCgApaKKACikooAKWkopABptOpCKYA\r\nKfTOlOBoAWiiimIKKKKBhRRS0CGUtDUgpDFopaKACiikoAdQabSnpTEJmios81IDxQMKKKKADNKD\r\nSUCgB/ao2p/amsKBDaKWigBKKWkNAxCM0mygnFKGoAYRiinnmmkUgCkxSijFACUtLikoAKWiigAp\r\n6UynKaAFfpUS9akfpUa9aYEtOU0ynLQA6oH6mp6gk60CGUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ\r\nAUUUUAW6KKKACiiigAooooAKKKKACiiigAooooAKKKKACkNLSHpQA2iiigBwpaQUtACUUUUAFFFF\r\nAwooooAKKKKACiiigApKWkoAKWkopALRSUUwCilooASlopKACon61I3SojzQACnU2gGkMeKdTRTg\r\naAGkUlPNMNMAzSGlFLigBlKh2tmgigUAP80UeaKjNC9aBWHHls0oFKKKACmNT6QjNIBgNPFMIxSg\r\n0DFNAoooAcKRhSA06mAwcU4UjDmkBpAPpKWkoAKWkoJoAWkJpCaSgAzS0lJmgB2aAaZSigB9FNzS\r\ng0CFoooNADSeactM70/tQAxuTUijimAfNUg4oAKKKKBCUUUUDCiiigApaKWgBKWiigApKKKQBRRR\r\nQAUUUUAFFFFABik6U6kpgKDS02jNMB1FJmlzQAUtJQTQAhpo60poAoAWlpKKQC0hNITQOaAFFB6U\r\nooIpgQnrTl6UMKQUAOooooAWgUlFAD+1NY0UhGaAEzRmjFLigBM0hNKajJoADSCiikA4Glpop1AC\r\nilApBTqADFJilooAaabTyKbQACnCkAp4FAEbU0dakccVF0NAD81IlRZp8ZoAlqu/Wp81XfrTENoo\r\nooAKKKKACiiigAooooAKKKKACiiigAooooAt0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFBo\r\nooAYaKU0lADhS0gpaAEooooAKKKKQBRRRTGFFFFABRRRQAlFLSUAFFFFIAooopgFLSUUALSUUUAN\r\nfpUVPc0ygBDSjrSUCgZIKUUgpaAH01hSig0ANFLRiigBDTaU000AKaaOtLmkoAkBp1RqaeKQgNJS\r\n0lMBGpoNSdRUbDmkA4UGkFLQMKcKbSigBSKjPFS0wigAU0tNFBNACk0lFIaACjNJmigAPNFFLTGF\r\nFFFABRRRQIUGlJptNNICRaU0idKVjQIFFOpF6UtABRRSUAFFFLQAlLRS0AFFFFABSUhNJmgB1FID\r\nS0gCiiigAooooAKKKKACiiigBaaadRQA2lzQRSYpgLuooApaADFFFFABRRRQA1qVaCKRaAJKSlpp\r\npgBFMIxTxQRQAwUtJjmlFIAoopG4pgKKdiog3NSA0AFFFFADWqM1KajIpANop2KQigBKM0uKXZQA\r\nKeaeKaFxS5xQA6lpgOTT6AENMpxNJigBRS5pKSgBWPFRHrTyaZQAVIlRVIpoAkzxUBPNTZ4qA9aY\r\nBRRRQIKKKKACiiigAooooAKKKKACiiigAooooAt0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFACGm04000AKKdTRS0DCiiigQUUUUgCiiimMKKKKACiiikAlFFFMAooopAFFFLTASiiigApD0\r\npaa5oAibrQOlHU07FADDQKUikoGPFOpop1ACinUynCgANIaU02kAUhHFLQaYEfel7UjdaBQADrUq\r\nniojTlNICSkxS0UxCYprCnUUAMpaCOabnFADjQOtNzzThSGOqNjzUg6UxxTAAaDTRRmkAuaQmijF\r\nMYUYopaACiiigAooooAWkopaAENNpxpo60CJU6UjdacvSgigQL0paBRSAKSgmgUAApaKWgAoopKA\r\nDNITQTTcZpgB5opwWl20AMpQadijFIBM0tNIoBpAOooooAKKKWgAopKKAFooooAKKKSgBaKKKACi\r\niigAooooAKSlpDTAcKQikBp1MBBS0UUANNAoNFIBaY44p9NfpTAh71ItM709aAHUUUUAFJinUUgG\r\n4oxS0UAAFFLRQAh6VGTUjdKiPWgBwp2aZmjNAElApgNOBoAdTDTqBQAwimHrUxHFQt1pgJT1pgpw\r\npAPJ4qKnGm0wCiiigQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQBbopKKAFooooAKKKKACiiigAooo\r\n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\r\ntMBKM0UYoAUGlpBS0AFJS0lMAopaSgBaQrxS0UgIiKeBkUpFLTAjZKbgipqbigCMZpwYin7aTaKA\r\nE3E00gk1JijFADACKa1TAUFc0AQUVMUppSgCM0lPdcUygQUUUUAFFFFABRRRQAUUUUAFFFFABRRR\r\nQAUUUUAWqKKKAFooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACkoooAQ0lLRQAlKKSikM\r\ndSUUUwCiiigAooooAKKKKACiiigAooooAD0qBzUrGoT1oEFFKBSleKBjKctNpRQA88io6kppoAbS\r\nikooAeKcvWmCpFFAxcUUtNNAh1IRRmjNADO9LmlxmlxigBlBHFOpKAI+lPU0hWkBoGSUhFApaBEf\r\nSnA5pW6VGOtAEtBNC8ikNACHmm7afRigCPpTlNBFNoGS0xhTgaCM0AMFLSEYNGaBhS0lLQAUUUUA\r\nJRRSrQA9RTqQdKKBBQKKWgBrGmig8mgUDCiiigAooooAKKKKAEopaKAEooooAKM0UUAOU8UuaYKX\r\nNSA8Uppimn0CIz1qQHio2605DQA+mGn000ANzS54pcUUAJjNLigUtAAKWkooAWmMKfTWpgKnSnN0\r\npFpaYiPFLilxSgUAKKaadTD1pAOFFAooAKKKKACkNGaKAEooopgFLRSUAFLRRQAUUUUAFFFFABRR\r\nRQAUUUUAFFFFABRRRQAopaQUtABRRRQBHN0FQ1NLUNAgooooAKKKKACiiigAooooAKKKKACiiigA\r\nooooAtUUUUALRSUtABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAlFFFACUUtJQAhopaSgYCl\r\npKUUgCiiimAUUUUAFFFFABRRRQAUUUGgBjGmEU8im0ANHBpxbNNIoxQAlOWkpAeaAHmm0/qKjPWg\r\nANJThSUAOQVIKjSnlqQxSaTNNySacBQAU00+mGmAqmnUwU+gBpFKKDSZoAcRUTDBqUU1xQIap4p/\r\nUVF3qVelAxMU0jFPpduRQIjU0+ozwaepzQMKWg0lACGmEVJTWoARTinbqjpy0AKwpop56Uw9aAHU\r\nUgpaBhRSUtACU5abT1pAPpDS000xCig9KBTXNACUUgp1AxKKKKACiiigAooooAKKKKAEpaKSgBaS\r\niigAoNFFIBAcVIpqOjOKAFfrQlNJyaVTg0CJSabu5pMmm96AJQaKRelKaQAKWmg06gAoopaACkNL\r\nSUAIDzT80w0A0wH0U3NGaYhTTKdQBSAUUUUhNABmlxSCn0AMxRTiKYaYBRSc0UAOpKSl5oAKWmc0\r\nc0APopnNHNAD6M0zmjmgB9FN5o5oAdmjNNwaMGgB2aKbinAUAFFLijFAAKWiigAooooAjm61DUs3\r\nWoqBBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQBapaSloAKKKKACiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigApKWkoAKSlooASg0UUAJQKDSUhjqKQGloAKKKKYBRRRQAUUUUAFIaWmMeaAFp\r\nr8U4HimsaQEeaUGkopgKaSlooAeOlMYc5py0MOKAGClpDRQAoo5pV5p+BSGNWnk1ETg1IORTAAaU\r\nikxzS0AMPBpQaQ9aUCgBTzTTxTjTSKAFVqU800DFPoAiYYpymhxTRwaBEoozSDpQaAGuM00cGn0x\r\nqBkmeKQ0xTzUlACAUjCn000ARUopSKSgQop2M0wGng0DG9KWkPJpRQMSloIpKAAVIKYKkFIQUlKa\r\nQUwFph5NPJ4qOgAApaKKBhRRRQAUUUUAFFFFABRRRQAUUUUAJRRRQAUUUUAFIaWjrQAylFKRTaCS\r\nZcYpjDmlU8UjGkMfH0pW6U1DgUrGkADrTqatOoAKWkooAKKKKAENIBTqKADFLRRQIKKKKACmN1p9\r\nMamA9aXNItDdKYC5pMUi06gBMUYpaKAExRilooATFGKWigBMUYpaKAExRilooATFGKWigBMUYpaK\r\nACiiigAooooAKKKKACiiigCKXrUVSy/eqKgQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAWqK\r\nKKAFooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiikoAKKKKAEooooAKQilooGNpwNNN\r\nApAOooopgFFFFABRRRQAGoyKkppFADR0pjHmpQtRyDFAADQRTaXNABRSUUAPWhulC0PQAzNJRRQA\r\nq9alHSol61MOlICNhzTkOBTX60qrTGOJooxS0ANpRQaKQC0UgpaBDDQGpzCoyMUwJOtMYU5TTsZo\r\nGMU0pOaY3Bpyc0AKKUgYpaaaBEZ4NODUEU3pQMlXmlIpqHinE0AMNMqQ03bzQA2lxS4oNABSUtBN\r\nIYtNI5oBpaAFUU+mrTqYhKUUlLmgBrmmilY80CgYtJRRTAKKKKQBRRRQAUUUUwCiiigAooopAFJS\r\n0UAJRS0lABSgUU4CgQ1hxUdSsOKioEOU0HrTRS0gFBpwpg61IOlAxwpabS0WEGaM0YoxRYBpNGaG\r\nWmjrQMlFLSClpAFFFFAgooooAKQiloNMAWlNNWn0wGgUtFFABRRRQAUUUUAFFFFABRRRQAUUUUAF\r\nFFFABRRRQAUUUUAFFFFABRRRQAUUUUAQy/eqOpJPvGo6BBRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQBaooooAKWkooAWiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooASiiigBKKKKACii\r\nigYUhpaCKAGg06m0opALRRRTAKKKDQA3NKKbinCkAtRSVLUT9aAGUUoFBFACUUGkpgPWnN0pimnE\r\n5FICOlpKWmAdKkU5qOnp0pDHY5paKKYgooooAQ0lLRQMSl3CmtmmZNAE2c01hSr0pTQIizinB6Qi\r\nm9KBjm5pUOKFGaRuDQBLTD1pFanGgBMZpjcU7PNKVzQBGDipBTCMUA0APpM0A0E0gE60HikzSUDA\r\nmiiimAUopKBSAfmnA1HSigB9IaUGkamIb1paQUtAwooopgFFLRQAlFFFABRRS0AJRS0lABRS0UgE\r\nooooAKKKKACnCminigQdqhbrU1RuKCRlLSUUAKOtSgVEKkU0hj6KO1RliKYEtFRoc1LQAhFRkc1J\r\nTWpAC06mrTqQwooooEFFFFABQelFFADacDSYpRTAWkopaYBRRRQAUUUUAFFFFABRRRQAUUUUAFLR\r\nRQIKKKKAEopaKBiUUUUAFFLRQAUUUUCIJPvGo6fJ940ygAooooAKKKKACiiigAooooAKKKKACiii\r\ngAooooAs0UUUALRRRQAtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAlFFFACUUUUAFFF\r\nFAwooooEIRSU6kIoGANLTKcDSAWiiimA2lFBpoNIBWqPvUvUVGRzQAopDRmmk0AIaSlooABTgM03\r\nFPUUwEYYplSuMCoqACnoaZTlpAS0UlLQAUUhOBTS1MYpNKKRead0pABHFRMOal7U1hTEIhqSoOhq\r\nRWoGDCozUpGajK4oECnBoJpMGigYL1qUDio161KDxSAbiloNITTARqZSk5pKAClpKKBhRRRSAKKK\r\nKACiiigBRRSUtACg0GiimAtFJS0AFFFFAC0UlLTAKKKKACiiigAooooAKKKKACkpaKACiiikAgp4\r\nplPFAgpGHFLSHpQIhPWilbrSUCCnqaZSg0DJhyKYy0qtTutADE61N2pgHNPoADUbU4mmE0AOWnU1\r\nadUjCiiigQUUUUAFFLRTASloooAKKKKACiiimAUUUUAFFFFABS0UUCCiiigAooooAKKKKACiiigA\r\nooooAKKKKACiiigCu/U0ynv1NMoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKALNLRRQAUUUU\r\nALRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFJS0lACUUUUAFFFFAwooooAKKKKAEIpp\r\n4p9IRQA3dShqQrSDg0gHnpURODUg6VG45pgPDcUhpgp4pAJimkVJSYoAjpRTiKaeKYC96eo4qNet\r\nSjpSAZIajqVxUVMApV60lKKAJRSE0inNOFIYgXNIy8U+l60xEanBp9MYYNOU0hiihulFFMRFjmnq\r\nOKDxTd3NAySkxmgUuaAExUbdal60hUUCIqUNikPWigY7OaKTNLSGNNFLRigBKKXFJTEFLSUUhhRS\r\n0lABRS0lABRRRQAtLSUUDFooopiFopKWgApaSimAtFJS0AFFFFABRRRQAUUUUAFFFFIBKKKKAFFO\r\nFNFOoEFBoooERuKZUrdKioEFFFKKAFBpwNNFOFIY8UZoFFACdaMU4UtACAUtFFABS0lLQAUUUlAC\r\n0UUlAC0lLSUAFFBopgLRRRQAUUUUAFFFLQAUUUUCCiiigAooooAKKKKACiiigAooooAKKKKACkoo\r\n7GgCu3Wm05qbQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAWQaWm0ooGLS0lLQIKKKKACiii\r\ngAooooAKKKKACiiigAooooAKKKKACiiigBKKWkoASiiigAooooAKKKKACiiigAooooAKaRTqQ0DE\r\nFDDNApaQDAtB4p+Ka4oAQU/FMXrT6ADFMdeKfSHpTAiHBqVelMIpynigYrDioSMGpzzUTigQyiii\r\ngBy9alFRKeakB4pDFNAoozigBH6VGDzTz81AXFMBRQTTScUo5oACCaaRinkgCo2OTQAu6jNNopDH\r\nhqC1NooAQ0UtJTAKUGkopAOC5pwWhDT6BDGHFR4qQ0hFMBmKKWg0hiClpKXNABSUtFACUtJRQAtF\r\nJS0ALRSUtAwpaSimIWigUUALRRRTAKKKKACiiigAooooAKKKKQCUUUUAKKdTRTqBBRRSUCEPSou9\r\nSMeKjoAKcozTaljFADWGKVaWUUxTzQBKKWmilpALS03NLQAtFJQKAFoopKAHUlFFMBaSiikAUUUU\r\nwEpRRS0AFFFFABRRRQAUUUUAFLSUUALRSUUALRSUUALSUUtABRSUtAhKWkooGLSUtFACUHoaKD90\r\n0CK7dabSt1pKACiiigAooooAKKKKACiiigAooooAKKKKACiiigCxS02loGOzRTaUUCHUUlLQAUUU\r\nUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFIaWkoASiiloASiiigAooooGFFFFABRRRQAUwnNDGm\r\njrSAeBTqaDS5oAWmv0pc0h5oAYvWpKYBg0/NABRiiloAaRTO9SUw0wHA8U1+RQOaUjigCGloNJQA\r\nU4Nim0oGaBkgbNLjNIop1IAxikpaQnFACMOKZmgnNJTGKTmkoopAFFLSUAFLSUUALSUtFACUUUUx\r\nCqcVKDmoacppASU00oOaDTAYRQRxTqCKAI6KdtoIpDEpQMimjrUgoAaVpKk601hQAyloooAKKKKA\r\nFopKKBiilptFMQ6iiigAooooAKKKKACiiigAooooAKKKKAHClpBS0CEpKWigRGxptOem0AKBk1Oo\r\nwKbGtSUAMkGRUPQ1YNQuKAFU07NMSn0gClpAKdQAUUUUAFLRRQAUUUtMBKWiikAUUUUwCiikoAWi\r\nkooAKWkooAWikpaACiiigAooooAKKKKACiiigAooooAKWkooAKKKKAChvumihvumgRWbrSUppKAC\r\niiigAooooAKKKKACiiigAooooAKKKKACiiigCelFJSigYtFFFAgpaSlFAC0UUUAFFFFABRRRQAUU\r\nUUAFFFFABRRRQAUUUUAFIaWkNACUUtJQAtJS0lABRRRQAUUUjGgAJpuaSlpDENFBooGLSUZooAUU\r\ntApaAEpKWigAzS5ptFADqY1OpDQIRacelNHFKTQMjbrTac1NpiCnrTKctAySlpueKaWpAOLY6U0k\r\nk0lFAwooooASiiigAooooAKKKKAClpKKAFpDS0UAJRRRTAepp3WoxSgmkA+kNJmgUCEFONLjimMa\r\nAACl6Ui9acaBgpoIzSdKN1ADcYooPNGKACiiigBKWikoAWiiigAzTqbRmmA6ikFLQAUUUUAFFFFA\r\nBRRRQAlKKKBQA4dKWkFLSEJSUtFMRG9NHWnNTaALCdKdTENPoASo5BUlIwyKAIlqSoujVKOlIAFL\r\nRRQAtFFFABRRRQAtFJRQAtFFFMBKKKKACiiigAoopKAFopKKAFooooAWikooAKKKKAFopKWgAooo\r\noAKKKKACiiigAooooAKR/u0tI/3aBFc0lKaSgAooooAKKKKACiiigAooooAKKKKACiiigAooooAn\r\npaSloAKWiigAooooAcKKSloAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAENJS0UAJS0lLQAl\r\nFFFABTHp9NcZoAaKU00U6kMbmloIpKBi0UUUAFLmkpcUAFLRRQAlLRRQAUUUUCENNpxpMUDGNTae\r\n3SmUxBSikooGOzRSUtIYCl20KKfQBGaKVutC0AJikp5HFMoAKKUCg0AJRRRQAUUUUAFLSUUALSUt\r\nJTAUUUlKKQDhS0yl60APB4pjCjpSg5oEIvWnE0uKjbrTAM0oFAWlJxSGN6Gl60YzTgMUAMIxSVKe\r\naYQRQA2ilooASlpKKAFooFLQAUtNNFMBaKKKACiiloASilooAKKKKBCilpBS0gCiilpiGMOKYamN\r\nRkc0APj6U+mJxT6ACg9KKO1AEDdacpocc00daAJM0uabS0gHUUgpaAFopKWgAoopaYBRRRQAUlLR\r\nQAlFFFABSGlpDQAlLSUUALS0lFAC0UlFAC0UlFAC0UUUALRSUUALRRRQAUUUUAFFFFABSP8Adpab\r\nJ92gRAaSlPWkoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAJ6UUlLQAtFFFABRRRQAUopKUU\r\nALRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAlJSmigBKKKKACiiigYUHpRQaBEZFKKDQKQwop\r\naSgYUUUlAC0tIKWgAopKKAFopKKAFoopaAExSN0p1IRmgRCTzSU9lxTKYBRRRQAtOAFNpVPNIokA\r\npDSg0GgQ3GaDxThQRQMaDQaCKQ0AJmjFABpxoAZS4pQKdTAjopT1pKACiiikAUtJQKAFxRS5ooAM\r\nUA9qAaQ0APIyKZ0NKDig0APHSmMOaVWxTuopiBcYprHmlbimdTQA9SKcelR4IpQ1IBaU9KOKYTQA\r\nh60UdaMUDEopaSgApQaSigB1JQKU0AFFIKKYC0UlAoAdRQBTgKBCYpRS0UhCUuKKKADFFFFMAppp\r\n1NNADlp1NWlzQAUtJRQA1xUVSnpUZ60AKKcKaKcKBi06m0tIBaWkpaYgpaSloAKKKKACkoooAKKK\r\nKACkpaKAG0UGigAooooAKKKKACiiigBaKSigB1FJS0AFLSUUALRRRQAUUUUAFNk+7TqZJ92gRCaS\r\nlNJQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAT0tFFAC0UUlAC0UUUAFFFFACg0tIKWgAoo\r\nooAKKKKACiiigAooooAKKKKACiiigBDRRSUAFFFFAC0lFLQMShulLSGgRF3p1IwxSA0hjqKKKBiU\r\nUuKKAEpcUU4dKAG0AUHrS0AFFFFAC0UlFABRS0GgQxzxUVSPUdMAooooAWlXrSUCkMkzRTQaUUDH\r\nUdaKKBBimtxTiaY3JoActKRxTRxTieKAGilpByacRTAbjNNIxT6YTQAlFFFIYUUUUAFOptLQAtFJ\r\nRQA4Cl6UmcCmknNAhSKVDSYzSA4NAD26U1OtO6imdDTAlODTCuKVTSmgBoNGM0Yp3agBhGKUUjU2\r\nkMU0UlLQAlFLSUAFKKSigBaMUU4CgBMU4ClxRQSFLSUtABRRRQAUUUUAFFFFMApp60tIaAFFOqPO\r\nKUNQA6iikoADUR61KajbrQACnCmA07NIY4U6milFACilpKUUCFooopgFLSUtABSUtJQAUUUUAFFF\r\nFADTRQaKACiiigAooooAKKKKACiiigBaKSloAWikpaAClpKKAFooooAKZL0FPpkvQUCIKKKKACii\r\nigAooooAKKKKACiiigAooooAKKKKACiiigCxRRRQAUtFFABRRRQAUUUUAFKKKKAFooooAKKKKACi\r\niigAooooAKKKKACiiigBKSiigAooooAWiiigAooooAjfpUYoooGh606iikAUUUUDG96kXpRRQAxq\r\nBRRQAtJRRQAU4UUUALSGiigRG9R0UUwCiiigApaKKBi04UUUhimkBoopgHWjHNFFAhRSNRRSAROt\r\nSNRRQBGTzSYoopgBpKKKQBRRRQMKKKKACloooAWgDmiigCQDio2FFFAhBQetFFAxVqSiimISjtRR\r\nQA3vQ1FFADKUUUUhhRRRQAlKBRRQA4CnUUUCCiiigQUtFFABRRRQAUUUUAFFFFMBDTTRRQA1qTOK\r\nKKAJFNLRRSAKYwoopgNpRRRQA8UtFFIYtLRRTELRRRQAUUUUAFFFFABRRRQAUlFFACGiiigAoooo\r\nAKKKKACiiigAooooAKKKKAFooooAWiiigBaKKKACo5u1FFAiGiiigAooooAKKKKACiiigAooooAK\r\nKKKACiiigAooooA//9k=', 'asha1', '2016-02-11 16:10:59', 'asha1', '2016-09-08 16:10:59', 'qazxsedcvgfr'),
('asha9880', '41001', 4, 1, 1, 1, 1, 1, 1, 1, 'Mrs', 'Suman', 'Sudas', 'Jadav', '1987-09-12', 29, 'Marathi', 'Akola', 'Literate', 0, 'Married', 4294967295, 'Akola market gali', '', 4294967295, '12', '', 'asha1', '2016-02-17 11:08:09', 'asha1', '2016-10-05 11:08:09', 'qawsqawsedrf');

-- --------------------------------------------------------

--
-- Table structure for table `hm_patientallergies`
--

CREATE TABLE `hm_patientallergies` (
  `Patient_Allergies_id` int(10) UNSIGNED NOT NULL,
  `Patient_Id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Allergy_Type_id` int(10) UNSIGNED DEFAULT NULL,
  `Allergy_Item_id` int(10) UNSIGNED DEFAULT NULL,
  `Start_Date` datetime DEFAULT NULL,
  `Resolved_Date` datetime DEFAULT NULL,
  `Severity_type` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Comments` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hm_patientdiagnosis`
--

CREATE TABLE `hm_patientdiagnosis` (
  `PatientDiagnosisId` int(10) NOT NULL,
  `Patient_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Diagnosis_id` int(10) UNSIGNED DEFAULT NULL,
  `Comments` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `User_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_patientdiagnosis`
--

INSERT INTO `hm_patientdiagnosis` (`PatientDiagnosisId`, `Patient_id`, `Diagnosis_id`, `Comments`, `User_id`) VALUES
(3, 'asha150', 1, 'abc', 'MO1'),
(4, 'asha140', 1, 'xyz', 'MO1'),
(10, 'asha158', 1, 'asdfgh', 'mo1'),
(13, 'asha160', 1, 'adsds', 'mo1'),
(14, 'asha165', 1, 'sssss', 'mo1'),
(15, 'asha1529', 1, 'sdgsg', 'mo1'),
(16, 'asha1513', 1, '', 'mo1');

-- --------------------------------------------------------

--
-- Table structure for table `hm_patientinvestigationtest`
--

CREATE TABLE `hm_patientinvestigationtest` (
  `PatientinvestigationtestId` int(10) NOT NULL,
  `Patient_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `InvestigationTest_id` int(10) UNSIGNED DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Comments` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Resolved_Date` datetime DEFAULT NULL,
  `UploadReportPath` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_patientinvestigationtest`
--

INSERT INTO `hm_patientinvestigationtest` (`PatientinvestigationtestId`, `Patient_id`, `InvestigationTest_id`, `Quantity`, `Comments`, `Status`, `Resolved_Date`, `UploadReportPath`) VALUES
(17, 'asha1512', 1, 1, '', '', '0000-00-00 00:00:00', ''),
(18, 'asha1513', 1, 1, '', '', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `hm_patientprocedure`
--

CREATE TABLE `hm_patientprocedure` (
  `PatientProcedureId` int(10) NOT NULL,
  `Patient_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Procedure_id` int(10) UNSIGNED DEFAULT NULL,
  `Comments` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `User_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Resolved_Date` datetime DEFAULT NULL,
  `UploadReportPath` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_patientprocedure`
--

INSERT INTO `hm_patientprocedure` (`PatientProcedureId`, `Patient_id`, `Procedure_id`, `Comments`, `User_id`, `Resolved_Date`, `UploadReportPath`) VALUES
(18, 'asha1512', 2, '', 'mo1', '0000-00-00 00:00:00', ''),
(19, 'asha1513', 2, '', 'mo1', '0000-00-00 00:00:00', ''),
(20, 'asha1514', 2, '', 'mo1', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `hm_patients_device_reading`
--

CREATE TABLE `hm_patients_device_reading` (
  `Patients_Device_Reading_id` int(10) UNSIGNED NOT NULL,
  `Patient_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Devices_id` int(10) UNSIGNED NOT NULL,
  `Device_Attributes_id` int(10) UNSIGNED NOT NULL,
  `Device_Attributes_value` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Created_Date` datetime DEFAULT NULL,
  `Created_By` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_patients_device_reading`
--

INSERT INTO `hm_patients_device_reading` (`Patients_Device_Reading_id`, `Patient_id`, `Devices_id`, `Device_Attributes_id`, `Device_Attributes_value`, `Created_Date`, `Created_By`) VALUES
(128, 'asha1510', 4, 10, '14.0', '2016-09-08 18:23:00', 'asha1'),
(129, 'asha1510', 1, 1, '92', '2016-09-08 18:16:00', 'asha1'),
(130, 'asha1510', 1, 2, '45', '2016-09-08 18:16:00', 'asha1'),
(131, 'asha1510', 1, 3, '89', '2016-09-08 18:16:00', 'asha1'),
(132, 'asha1510', 3, 5, '87', '2016-09-08 18:39:00', 'asha1'),
(133, 'asha1510', 3, 6, '26', '2016-09-08 18:39:00', 'asha1'),
(134, 'asha1510', 3, 7, '99', '2016-09-08 18:39:00', 'asha1'),
(135, 'asha1510', 3, 8, '[B@12ad670c', '2016-09-08 18:39:00', 'asha1'),
(136, 'asha1510', 3, 9, '[B@882b855', '2016-09-08 18:39:00', 'asha1'),
(137, 'asha1510', 2, 4, '[B@2825523f', '2016-09-08 19:05:00', 'asha1'),
(138, 'asha1510', 4, 10, '14.0', '2016-09-08 18:23:00', 'asha1'),
(139, 'asha1511', 4, 10, '10.0', '2016-09-12 11:53:00', 'asha1'),
(140, 'asha1510', 1, 1, '92', '2016-09-08 18:16:00', 'asha1'),
(141, 'asha1510', 1, 2, '45', '2016-09-08 18:16:00', 'asha1'),
(142, 'asha1510', 1, 3, '89', '2016-09-08 18:16:00', 'asha1'),
(143, 'asha1510', 3, 5, '87', '2016-09-08 18:39:00', 'asha1'),
(144, 'asha1510', 3, 6, '26', '2016-09-08 18:39:00', 'asha1'),
(145, 'asha1510', 3, 7, '99', '2016-09-08 18:39:00', 'asha1'),
(146, 'asha1510', 3, 8, '[B@3406d387', '2016-09-08 18:39:00', 'asha1'),
(147, 'asha1510', 3, 9, '[B@1cc562b4', '2016-09-08 18:39:00', 'asha1'),
(148, 'asha1510', 2, 4, '[B@25e507c6', '2016-09-08 19:05:00', 'asha1'),
(149, 'asha1510', 3, 5, '87', '2016-09-08 18:39:00', 'asha1'),
(150, 'asha1510', 3, 6, '26', '2016-09-08 18:39:00', 'asha1'),
(151, 'asha1510', 3, 7, '99', '2016-09-08 18:39:00', 'asha1'),
(152, 'asha1510', 3, 8, '[B@216da0e2', '2016-09-08 18:39:00', 'asha1'),
(153, 'asha1510', 3, 9, '[B@337e8c73', '2016-09-08 18:39:00', 'asha1'),
(154, 'asha1510', 1, 1, '92', '2016-09-08 18:16:00', 'asha1'),
(155, 'asha1510', 1, 2, '45', '2016-09-08 18:16:00', 'asha1'),
(156, 'asha1510', 1, 3, '89', '2016-09-08 18:16:00', 'asha1'),
(157, 'asha1510', 4, 10, '14.0', '2016-09-08 18:23:00', 'asha1'),
(158, 'asha1511', 4, 10, '10.0', '2016-09-12 11:53:00', 'asha1'),
(159, 'asha1510', 2, 4, '[B@2eb995ad', '2016-09-08 19:05:00', 'asha1'),
(160, 'asha1510', 1, 1, '92', '2016-09-08 18:16:00', 'asha1'),
(161, 'asha1510', 1, 2, '45', '2016-09-08 18:16:00', 'asha1'),
(162, 'asha1510', 1, 3, '89', '2016-09-08 18:16:00', 'asha1'),
(163, 'asha1510', 3, 5, '87', '2016-09-08 18:39:00', 'asha1'),
(164, 'asha1510', 3, 6, '26', '2016-09-08 18:39:00', 'asha1'),
(165, 'asha1510', 3, 7, '99', '2016-09-08 18:39:00', 'asha1'),
(166, 'asha1510', 3, 8, '[B@22c0e59', '2016-09-08 18:39:00', 'asha1'),
(167, 'asha1510', 3, 9, '[B@af76a1e', '2016-09-08 18:39:00', 'asha1'),
(168, 'asha1510', 4, 10, '14.0', '2016-09-08 18:23:00', 'asha1'),
(169, 'asha1511', 4, 10, '10.0', '2016-09-12 11:53:00', 'asha1'),
(170, 'asha1510', 2, 4, '[B@255602a0', '2016-09-08 19:05:00', 'asha1'),
(171, 'asha1510', 1, 1, '92', '2016-09-08 18:16:00', 'asha1'),
(172, 'asha1510', 1, 2, '45', '2016-09-08 18:16:00', 'asha1'),
(173, 'asha1510', 1, 3, '89', '2016-09-08 18:16:00', 'asha1'),
(174, 'asha1510', 4, 10, '14.0', '2016-09-08 18:23:00', 'asha1'),
(175, 'asha1511', 4, 10, '10.0', '2016-09-12 11:53:00', 'asha1'),
(176, 'asha1510', 3, 5, '87', '2016-09-08 18:39:00', 'asha1'),
(177, 'asha1510', 3, 6, '26', '2016-09-08 18:39:00', 'asha1'),
(178, 'asha1510', 3, 7, '99', '2016-09-08 18:39:00', 'asha1'),
(179, 'asha1510', 3, 8, '[B@22f651cc', '2016-09-08 18:39:00', 'asha1'),
(180, 'asha1510', 3, 9, '[B@3f952c15', '2016-09-08 18:39:00', 'asha1'),
(181, 'asha1510', 2, 4, '[B@7603e04', '2016-09-08 19:05:00', 'asha1'),
(182, 'asha1510', 1, 1, '92', '2016-09-08 18:16:00', 'asha1'),
(183, 'asha1510', 1, 2, '45', '2016-09-08 18:16:00', 'asha1'),
(184, 'asha1510', 1, 3, '89', '2016-09-08 18:16:00', 'asha1'),
(185, 'asha1510', 1, 1, '94', '2016-09-12 13:41:00', 'asha1'),
(186, 'asha1510', 1, 2, '50', '2016-09-12 13:41:00', 'asha1'),
(187, 'asha1510', 1, 3, '89', '2016-09-12 13:41:00', 'asha1'),
(188, 'asha1510', 3, 5, '87', '2016-09-08 18:39:00', 'asha1'),
(189, 'asha1510', 3, 6, '26', '2016-09-08 18:39:00', 'asha1'),
(190, 'asha1510', 3, 7, '99', '2016-09-08 18:39:00', 'asha1'),
(191, 'asha1510', 3, 8, '[B@26f7f2f6', '2016-09-08 18:39:00', 'asha1'),
(192, 'asha1510', 3, 9, '[B@3dd96f7', '2016-09-08 18:39:00', 'asha1'),
(193, 'asha1510', 4, 10, '14.0', '2016-09-08 18:23:00', 'asha1'),
(194, 'asha1511', 4, 10, '10.0', '2016-09-12 11:53:00', 'asha1'),
(195, 'asha1510', 4, 10, '12.0', '2016-09-12 13:40:00', 'asha1'),
(196, 'asha1510', 2, 4, '[B@17d03e1e', '2016-09-08 19:05:00', 'asha1'),
(197, 'asha1510', 1, 1, '92', '2016-09-08 18:16:00', 'asha1'),
(198, 'asha1510', 1, 2, '45', '2016-09-08 18:16:00', 'asha1'),
(199, 'asha1510', 1, 3, '89', '2016-09-08 18:16:00', 'asha1'),
(200, 'asha1510', 1, 1, '94', '2016-09-12 13:41:00', 'asha1'),
(201, 'asha1510', 1, 2, '50', '2016-09-12 13:41:00', 'asha1'),
(202, 'asha1510', 1, 3, '89', '2016-09-12 13:41:00', 'asha1'),
(203, 'asha1510', 3, 5, '87', '2016-09-08 18:39:00', 'asha1'),
(204, 'asha1510', 3, 6, '26', '2016-09-08 18:39:00', 'asha1'),
(205, 'asha1510', 3, 7, '99', '2016-09-08 18:39:00', 'asha1'),
(206, 'asha1510', 3, 8, '[B@be9e4c0', '2016-09-08 18:39:00', 'asha1'),
(207, 'asha1510', 3, 9, '[B@2c915f9', '2016-09-08 18:39:00', 'asha1'),
(208, 'asha1510', 4, 10, '14.0', '2016-09-08 18:23:00', 'asha1'),
(209, 'asha1511', 4, 10, '10.0', '2016-09-12 11:53:00', 'asha1'),
(210, 'asha1510', 4, 10, '12.0', '2016-09-12 13:40:00', 'asha1'),
(211, 'asha1510', 2, 4, '[B@337b2643', '2016-09-08 19:05:00', 'asha1'),
(212, 'asha1510', 1, 1, '92', '2016-09-08 18:16:00', 'asha1'),
(213, 'asha1510', 1, 2, '45', '2016-09-08 18:16:00', 'asha1'),
(214, 'asha1510', 1, 3, '89', '2016-09-08 18:16:00', 'asha1'),
(215, 'asha1510', 1, 1, '94', '2016-09-12 13:41:00', 'asha1'),
(216, 'asha1510', 1, 2, '50', '2016-09-12 13:41:00', 'asha1'),
(217, 'asha1510', 1, 3, '89', '2016-09-12 13:41:00', 'asha1'),
(218, 'asha1510', 3, 5, '87', '2016-09-08 18:39:00', 'asha1'),
(219, 'asha1510', 3, 6, '26', '2016-09-08 18:39:00', 'asha1'),
(220, 'asha1510', 3, 7, '99', '2016-09-08 18:39:00', 'asha1'),
(221, 'asha1510', 3, 8, '[B@2f6900b0', '2016-09-08 18:39:00', 'asha1'),
(222, 'asha1510', 3, 9, '[B@260b1b29', '2016-09-08 18:39:00', 'asha1'),
(223, 'asha1510', 4, 10, '14.0', '2016-09-08 18:23:00', 'asha1'),
(224, 'asha1511', 4, 10, '10.0', '2016-09-12 11:53:00', 'asha1'),
(225, 'asha1510', 4, 10, '12.0', '2016-09-12 13:40:00', 'asha1'),
(226, 'asha1510', 2, 4, '[B@33b67bf3', '2016-09-08 19:05:00', 'asha1'),
(227, 'asha1510', 1, 1, '92', '2016-09-08 18:16:00', 'asha1'),
(228, 'asha1510', 1, 2, '45', '2016-09-08 18:16:00', 'asha1'),
(229, 'asha1510', 1, 3, '89', '2016-09-08 18:16:00', 'asha1'),
(230, 'asha1510', 1, 1, '94', '2016-09-12 13:41:00', 'asha1'),
(231, 'asha1510', 1, 2, '50', '2016-09-12 13:41:00', 'asha1'),
(232, 'asha1510', 1, 3, '89', '2016-09-12 13:41:00', 'asha1'),
(233, 'asha1510', 4, 10, '14.0', '2016-09-08 18:23:00', 'asha1'),
(234, 'asha1511', 4, 10, '10.0', '2016-09-12 11:53:00', 'asha1'),
(235, 'asha1510', 4, 10, '12.0', '2016-09-12 13:40:00', 'asha1'),
(236, 'asha1510', 3, 5, '87', '2016-09-08 18:39:00', 'asha1'),
(237, 'asha1510', 3, 6, '26', '2016-09-08 18:39:00', 'asha1'),
(238, 'asha1510', 3, 7, '99', '2016-09-08 18:39:00', 'asha1'),
(239, 'asha1510', 3, 8, '[B@2dab5cff', '2016-09-08 18:39:00', 'asha1'),
(240, 'asha1510', 3, 9, '[B@14867acc', '2016-09-08 18:39:00', 'asha1'),
(241, 'asha1510', 2, 4, '[B@15b86c1e', '2016-09-08 19:05:00', 'asha1'),
(242, 'asha1510', 1, 1, '92', '2016-09-08 18:16:00', 'asha1'),
(243, 'asha1510', 1, 2, '45', '2016-09-08 18:16:00', 'asha1'),
(244, 'asha1510', 1, 3, '89', '2016-09-08 18:16:00', 'asha1'),
(245, 'asha1510', 1, 1, '94', '2016-09-12 13:41:00', 'asha1'),
(246, 'asha1510', 1, 2, '50', '2016-09-12 13:41:00', 'asha1'),
(247, 'asha1510', 1, 3, '89', '2016-09-12 13:41:00', 'asha1'),
(248, 'asha1512', 1, 1, '133', '2016-09-12 16:35:00', 'asha1'),
(249, 'asha1512', 1, 2, '92', '2016-09-12 16:35:00', 'asha1'),
(250, 'asha1512', 1, 3, '70', '2016-09-12 16:35:00', 'asha1'),
(251, 'asha1510', 3, 5, '87', '2016-09-08 18:39:00', 'asha1'),
(252, 'asha1510', 3, 6, '26', '2016-09-08 18:39:00', 'asha1'),
(253, 'asha1510', 3, 7, '99', '2016-09-08 18:39:00', 'asha1'),
(254, 'asha1510', 3, 8, '[B@1a3b7ab0', '2016-09-08 18:39:00', 'asha1'),
(255, 'asha1510', 3, 9, '[B@1ed50d29', '2016-09-08 18:39:00', 'asha1'),
(256, 'asha1512', 3, 5, '107', '2016-09-12 16:32:00', 'asha1'),
(257, 'asha1512', 3, 6, '26', '2016-09-12 16:32:00', 'asha1'),
(258, 'asha1512', 3, 7, '99', '2016-09-12 16:32:00', 'asha1'),
(259, 'asha1512', 3, 8, '[B@216f48ae', '2016-09-12 16:32:00', 'asha1'),
(260, 'asha1512', 3, 9, '[B@91b264f', '2016-09-12 16:32:00', 'asha1'),
(261, 'asha1510', 4, 10, '14.0', '2016-09-08 18:23:00', 'asha1'),
(262, 'asha1511', 4, 10, '10.0', '2016-09-12 11:53:00', 'asha1'),
(263, 'asha1510', 4, 10, '12.0', '2016-09-12 13:40:00', 'asha1'),
(264, 'asha1512', 4, 10, '10.0', '2016-09-12 16:32:00', 'asha1'),
(265, 'asha1510', 2, 4, '[B@3958c3b9', '2016-09-08 19:05:00', 'asha1'),
(266, 'asha1512', 2, 4, '[B@1083e3fe', '2016-09-12 16:40:00', 'asha1'),
(267, 'asha1510', 1, 1, '92', '2016-09-08 18:16:00', 'asha1'),
(268, 'asha1510', 1, 2, '45', '2016-09-08 18:16:00', 'asha1'),
(269, 'asha1510', 1, 3, '89', '2016-09-08 18:16:00', 'asha1'),
(270, 'asha1510', 1, 1, '94', '2016-09-12 13:41:00', 'asha1'),
(271, 'asha1510', 1, 2, '50', '2016-09-12 13:41:00', 'asha1'),
(272, 'asha1510', 1, 3, '89', '2016-09-12 13:41:00', 'asha1'),
(273, 'asha1512', 1, 1, '133', '2016-09-12 16:35:00', 'asha1'),
(274, 'asha1512', 1, 2, '92', '2016-09-12 16:35:00', 'asha1'),
(275, 'asha1512', 1, 3, '70', '2016-09-12 16:35:00', 'asha1'),
(276, 'asha1510', 3, 5, '87', '2016-09-08 18:39:00', 'asha1'),
(277, 'asha1510', 3, 6, '26', '2016-09-08 18:39:00', 'asha1'),
(278, 'asha1510', 3, 7, '99', '2016-09-08 18:39:00', 'asha1'),
(279, 'asha1510', 3, 8, '[B@16ff0c7f', '2016-09-08 18:39:00', 'asha1'),
(280, 'asha1510', 3, 9, '[B@29a1344c', '2016-09-08 18:39:00', 'asha1'),
(281, 'asha1512', 3, 5, '107', '2016-09-12 16:32:00', 'asha1'),
(282, 'asha1512', 3, 6, '26', '2016-09-12 16:32:00', 'asha1'),
(283, 'asha1512', 3, 7, '99', '2016-09-12 16:32:00', 'asha1'),
(284, 'asha1512', 3, 8, '[B@165a9c95', '2016-09-12 16:32:00', 'asha1'),
(285, 'asha1512', 3, 9, '[B@108841aa', '2016-09-12 16:32:00', 'asha1'),
(286, 'asha1510', 4, 10, '14.0', '2016-09-08 18:23:00', 'asha1'),
(287, 'asha1511', 4, 10, '10.0', '2016-09-12 11:53:00', 'asha1'),
(288, 'asha1510', 4, 10, '12.0', '2016-09-12 13:40:00', 'asha1'),
(289, 'asha1512', 4, 10, '10.0', '2016-09-12 16:32:00', 'asha1'),
(290, 'asha1510', 2, 4, '[B@263d1bd9', '2016-09-08 19:05:00', 'asha1'),
(291, 'asha1512', 2, 4, '[B@957299e', '2016-09-12 16:40:00', 'asha1'),
(292, 'asha1510', 1, 1, '92', '2016-09-08 18:16:00', 'asha1'),
(293, 'asha1510', 1, 2, '45', '2016-09-08 18:16:00', 'asha1'),
(294, 'asha1510', 1, 3, '89', '2016-09-08 18:16:00', 'asha1'),
(295, 'asha1510', 1, 1, '94', '2016-09-12 13:41:00', 'asha1'),
(296, 'asha1510', 1, 2, '50', '2016-09-12 13:41:00', 'asha1'),
(297, 'asha1510', 1, 3, '89', '2016-09-12 13:41:00', 'asha1'),
(298, 'asha1512', 1, 1, '133', '2016-09-12 16:35:00', 'asha1'),
(299, 'asha1512', 1, 2, '92', '2016-09-12 16:35:00', 'asha1'),
(300, 'asha1512', 1, 3, '70', '2016-09-12 16:35:00', 'asha1'),
(301, 'asha1510', 3, 5, '87', '2016-09-08 18:39:00', 'asha1'),
(302, 'asha1510', 3, 6, '26', '2016-09-08 18:39:00', 'asha1'),
(303, 'asha1510', 3, 7, '99', '2016-09-08 18:39:00', 'asha1'),
(304, 'asha1510', 3, 8, '[B@1e9d709b', '2016-09-08 18:39:00', 'asha1'),
(305, 'asha1510', 3, 9, '[B@343a5c38', '2016-09-08 18:39:00', 'asha1'),
(306, 'asha1512', 3, 5, '107', '2016-09-12 16:32:00', 'asha1'),
(307, 'asha1512', 3, 6, '26', '2016-09-12 16:32:00', 'asha1'),
(308, 'asha1512', 3, 7, '99', '2016-09-12 16:32:00', 'asha1'),
(309, 'asha1512', 3, 8, '[B@c59d702', '2016-09-12 16:32:00', 'asha1'),
(310, 'asha1512', 3, 9, '[B@2f4f5813', '2016-09-12 16:32:00', 'asha1'),
(311, 'asha1510', 4, 10, '14.0', '2016-09-08 18:23:00', 'asha1'),
(312, 'asha1511', 4, 10, '10.0', '2016-09-12 11:53:00', 'asha1'),
(313, 'asha1510', 4, 10, '12.0', '2016-09-12 13:40:00', 'asha1'),
(314, 'asha1512', 4, 10, '10.0', '2016-09-12 16:32:00', 'asha1'),
(315, 'asha1510', 2, 4, '[B@ad174c', '2016-09-08 19:05:00', 'asha1'),
(316, 'asha1512', 2, 4, '[B@10f65caa', '2016-09-12 16:40:00', 'asha1'),
(317, 'asha1510', 1, 1, '92', '2016-09-08 18:16:00', 'asha1'),
(318, 'asha1510', 1, 2, '45', '2016-09-08 18:16:00', 'asha1'),
(319, 'asha1510', 1, 3, '89', '2016-09-08 18:16:00', 'asha1'),
(320, 'asha1510', 1, 1, '94', '2016-09-12 13:41:00', 'asha1'),
(321, 'asha1510', 1, 2, '50', '2016-09-12 13:41:00', 'asha1'),
(322, 'asha1510', 1, 3, '89', '2016-09-12 13:41:00', 'asha1'),
(323, 'asha1512', 1, 1, '133', '2016-09-12 16:35:00', 'asha1'),
(324, 'asha1512', 1, 2, '92', '2016-09-12 16:35:00', 'asha1'),
(325, 'asha1512', 1, 3, '70', '2016-09-12 16:35:00', 'asha1'),
(326, 'asha1510', 3, 5, '87', '2016-09-08 18:39:00', 'asha1'),
(327, 'asha1510', 3, 6, '26', '2016-09-08 18:39:00', 'asha1'),
(328, 'asha1510', 3, 7, '99', '2016-09-08 18:39:00', 'asha1'),
(329, 'asha1510', 3, 8, '[B@245bb321', '2016-09-08 18:39:00', 'asha1'),
(330, 'asha1510', 3, 9, '[B@18258346', '2016-09-08 18:39:00', 'asha1'),
(331, 'asha1512', 3, 5, '107', '2016-09-12 16:32:00', 'asha1'),
(332, 'asha1512', 3, 6, '26', '2016-09-12 16:32:00', 'asha1'),
(333, 'asha1512', 3, 7, '99', '2016-09-12 16:32:00', 'asha1'),
(334, 'asha1512', 3, 8, '[B@41c6907', '2016-09-12 16:32:00', 'asha1'),
(335, 'asha1512', 3, 9, '[B@2a830a34', '2016-09-12 16:32:00', 'asha1'),
(336, 'asha1510', 4, 10, '14.0', '2016-09-08 18:23:00', 'asha1'),
(337, 'asha1511', 4, 10, '10.0', '2016-09-12 11:53:00', 'asha1'),
(338, 'asha1510', 4, 10, '12.0', '2016-09-12 13:40:00', 'asha1'),
(339, 'asha1512', 4, 10, '10.0', '2016-09-12 16:32:00', 'asha1'),
(340, 'asha1510', 2, 4, '[B@361773b', '2016-09-08 19:05:00', 'asha1'),
(341, 'asha1512', 2, 4, '[B@1575ee58', '2016-09-12 16:40:00', 'asha1'),
(342, 'asha1510', 1, 1, '92', '2016-09-08 18:16:00', 'asha1'),
(343, 'asha1510', 1, 2, '45', '2016-09-08 18:16:00', 'asha1'),
(344, 'asha1510', 1, 3, '89', '2016-09-08 18:16:00', 'asha1'),
(345, 'asha1510', 1, 1, '94', '2016-09-12 13:41:00', 'asha1'),
(346, 'asha1510', 1, 2, '50', '2016-09-12 13:41:00', 'asha1'),
(347, 'asha1510', 1, 3, '89', '2016-09-12 13:41:00', 'asha1'),
(348, 'asha1512', 1, 1, '133', '2016-09-12 16:35:00', 'asha1'),
(349, 'asha1512', 1, 2, '92', '2016-09-12 16:35:00', 'asha1'),
(350, 'asha1512', 1, 3, '70', '2016-09-12 16:35:00', 'asha1'),
(351, 'asha1510', 3, 5, '87', '2016-09-08 18:39:00', 'asha1'),
(352, 'asha1510', 3, 6, '26', '2016-09-08 18:39:00', 'asha1'),
(353, 'asha1510', 3, 7, '99', '2016-09-08 18:39:00', 'asha1'),
(354, 'asha1510', 3, 8, '[B@3ec38942', '2016-09-08 18:39:00', 'asha1'),
(355, 'asha1510', 3, 9, '[B@381fbd53', '2016-09-08 18:39:00', 'asha1'),
(356, 'asha1512', 3, 5, '107', '2016-09-12 16:32:00', 'asha1'),
(357, 'asha1512', 3, 6, '26', '2016-09-12 16:32:00', 'asha1'),
(358, 'asha1512', 3, 7, '99', '2016-09-12 16:32:00', 'asha1'),
(359, 'asha1512', 3, 8, '[B@12651690', '2016-09-12 16:32:00', 'asha1'),
(360, 'asha1512', 3, 9, '[B@254aab89', '2016-09-12 16:32:00', 'asha1'),
(361, 'asha1510', 4, 10, '14.0', '2016-09-08 18:23:00', 'asha1'),
(362, 'asha1511', 4, 10, '10.0', '2016-09-12 11:53:00', 'asha1'),
(363, 'asha1510', 4, 10, '12.0', '2016-09-12 13:40:00', 'asha1'),
(364, 'asha1512', 4, 10, '10.0', '2016-09-12 16:32:00', 'asha1'),
(365, 'asha1510', 2, 4, '[B@1604f78e', '2016-09-08 19:05:00', 'asha1'),
(366, 'asha1512', 2, 4, '[B@295edbaf', '2016-09-12 16:40:00', 'asha1'),
(367, 'asha1510', 1, 1, '92', '2016-09-08 18:16:00', 'asha1'),
(368, 'asha1510', 1, 2, '45', '2016-09-08 18:16:00', 'asha1'),
(369, 'asha1510', 1, 3, '89', '2016-09-08 18:16:00', 'asha1'),
(370, 'asha1510', 1, 1, '94', '2016-09-12 13:41:00', 'asha1'),
(371, 'asha1510', 1, 2, '50', '2016-09-12 13:41:00', 'asha1'),
(372, 'asha1510', 1, 3, '89', '2016-09-12 13:41:00', 'asha1'),
(373, 'asha1512', 1, 1, '133', '2016-09-12 16:35:00', 'asha1'),
(374, 'asha1512', 1, 2, '92', '2016-09-12 16:35:00', 'asha1'),
(375, 'asha1512', 1, 3, '70', '2016-09-12 16:35:00', 'asha1'),
(376, 'asha1510', 4, 10, '14.0', '2016-09-08 18:23:00', 'asha1'),
(377, 'asha1511', 4, 10, '10.0', '2016-09-12 11:53:00', 'asha1'),
(378, 'asha1510', 4, 10, '12.0', '2016-09-12 13:40:00', 'asha1'),
(379, 'asha1512', 4, 10, '10.0', '2016-09-12 16:32:00', 'asha1'),
(380, 'asha1510', 3, 5, '87', '2016-09-08 18:39:00', 'asha1'),
(381, 'asha1510', 3, 6, '26', '2016-09-08 18:39:00', 'asha1'),
(382, 'asha1510', 3, 7, '99', '2016-09-08 18:39:00', 'asha1'),
(383, 'asha1510', 3, 8, '[B@3301ca00', '2016-09-08 18:39:00', 'asha1'),
(384, 'asha1510', 3, 9, '[B@3f4f3239', '2016-09-08 18:39:00', 'asha1'),
(385, 'asha1512', 3, 5, '107', '2016-09-12 16:32:00', 'asha1'),
(386, 'asha1512', 3, 6, '26', '2016-09-12 16:32:00', 'asha1'),
(387, 'asha1512', 3, 7, '99', '2016-09-12 16:32:00', 'asha1'),
(388, 'asha1512', 3, 8, '[B@271bf07e', '2016-09-12 16:32:00', 'asha1'),
(389, 'asha1512', 3, 9, '[B@299ff9df', '2016-09-12 16:32:00', 'asha1'),
(390, 'asha1510', 2, 4, '[B@b47d332', '2016-09-08 19:05:00', 'asha1'),
(391, 'asha1512', 2, 4, '[B@3a9a5883', '2016-09-12 16:40:00', 'asha1'),
(392, 'asha1510', 3, 5, '87', '2016-09-08 18:39:00', 'asha1'),
(393, 'asha1510', 3, 6, '26', '2016-09-08 18:39:00', 'asha1'),
(394, 'asha1510', 3, 7, '99', '2016-09-08 18:39:00', 'asha1'),
(395, 'asha1510', 3, 8, '[B@32ca1344', '2016-09-08 18:39:00', 'asha1'),
(396, 'asha1510', 3, 9, '[B@1c811c2d', '2016-09-08 18:39:00', 'asha1'),
(397, 'asha1512', 3, 5, '107', '2016-09-12 16:32:00', 'asha1'),
(398, 'asha1512', 3, 6, '26', '2016-09-12 16:32:00', 'asha1'),
(399, 'asha1512', 3, 7, '99', '2016-09-12 16:32:00', 'asha1'),
(400, 'asha1512', 3, 8, '[B@315ce562', '2016-09-12 16:32:00', 'asha1'),
(401, 'asha1512', 3, 9, '[B@1e3db6f3', '2016-09-12 16:32:00', 'asha1'),
(402, 'asha1510', 1, 1, '92', '2016-09-08 18:16:00', 'asha1'),
(403, 'asha1510', 1, 2, '45', '2016-09-08 18:16:00', 'asha1'),
(404, 'asha1510', 1, 3, '89', '2016-09-08 18:16:00', 'asha1'),
(405, 'asha1510', 1, 1, '94', '2016-09-12 13:41:00', 'asha1'),
(406, 'asha1510', 1, 2, '50', '2016-09-12 13:41:00', 'asha1'),
(407, 'asha1510', 1, 3, '89', '2016-09-12 13:41:00', 'asha1'),
(408, 'asha1512', 1, 1, '133', '2016-09-12 16:35:00', 'asha1'),
(409, 'asha1512', 1, 2, '92', '2016-09-12 16:35:00', 'asha1'),
(410, 'asha1512', 1, 3, '70', '2016-09-12 16:35:00', 'asha1'),
(411, 'asha1510', 4, 10, '14.0', '2016-09-08 18:23:00', 'asha1'),
(412, 'asha1511', 4, 10, '10.0', '2016-09-12 11:53:00', 'asha1'),
(413, 'asha1510', 4, 10, '12.0', '2016-09-12 13:40:00', 'asha1'),
(414, 'asha1512', 4, 10, '10.0', '2016-09-12 16:32:00', 'asha1'),
(415, 'asha1510', 2, 4, '[B@226e537b', '2016-09-08 19:05:00', 'asha1'),
(416, 'asha1512', 2, 4, '[B@128b3598', '2016-09-12 16:40:00', 'asha1'),
(417, 'asha1510', 1, 1, '92', '2016-09-08 18:16:00', 'asha1'),
(418, 'asha1510', 1, 2, '45', '2016-09-08 18:16:00', 'asha1'),
(419, 'asha1510', 1, 3, '89', '2016-09-08 18:16:00', 'asha1'),
(420, 'asha1510', 1, 1, '94', '2016-09-12 13:41:00', 'asha1'),
(421, 'asha1510', 1, 2, '50', '2016-09-12 13:41:00', 'asha1'),
(422, 'asha1510', 1, 3, '89', '2016-09-12 13:41:00', 'asha1'),
(423, 'asha1512', 1, 1, '133', '2016-09-12 16:35:00', 'asha1'),
(424, 'asha1512', 1, 2, '92', '2016-09-12 16:35:00', 'asha1'),
(425, 'asha1512', 1, 3, '70', '2016-09-12 16:35:00', 'asha1'),
(426, 'asha1510', 3, 5, '87', '2016-09-08 18:39:00', 'asha1'),
(427, 'asha1510', 3, 6, '26', '2016-09-08 18:39:00', 'asha1'),
(428, 'asha1510', 3, 7, '99', '2016-09-08 18:39:00', 'asha1'),
(429, 'asha1510', 3, 8, '[B@262fe2fa', '2016-09-08 18:39:00', 'asha1'),
(430, 'asha1510', 3, 9, '[B@20e800ab', '2016-09-08 18:39:00', 'asha1'),
(431, 'asha1512', 3, 5, '107', '2016-09-12 16:32:00', 'asha1'),
(432, 'asha1512', 3, 6, '26', '2016-09-12 16:32:00', 'asha1'),
(433, 'asha1512', 3, 7, '99', '2016-09-12 16:32:00', 'asha1'),
(434, 'asha1512', 3, 8, '[B@223e9308', '2016-09-12 16:32:00', 'asha1'),
(435, 'asha1512', 3, 9, '[B@25a13aa1', '2016-09-12 16:32:00', 'asha1'),
(436, 'asha1510', 4, 10, '14.0', '2016-09-08 18:23:00', 'asha1'),
(437, 'asha1511', 4, 10, '10.0', '2016-09-12 11:53:00', 'asha1'),
(438, 'asha1510', 4, 10, '12.0', '2016-09-12 13:40:00', 'asha1'),
(439, 'asha1512', 4, 10, '10.0', '2016-09-12 16:32:00', 'asha1'),
(440, 'asha1510', 2, 4, '[B@235c811c', '2016-09-08 19:05:00', 'asha1'),
(441, 'asha1512', 2, 4, '[B@3561b125', '2016-09-12 16:40:00', 'asha1'),
(442, 'asha1510', 3, 5, '87', '2016-09-08 18:39:00', 'asha1'),
(443, 'asha1510', 3, 6, '26', '2016-09-08 18:39:00', 'asha1'),
(444, 'asha1510', 3, 7, '99', '2016-09-08 18:39:00', 'asha1'),
(445, 'asha1510', 3, 8, '[B@2c73c6de', '2016-09-08 18:39:00', 'asha1'),
(446, 'asha1510', 3, 9, '[B@219780bf', '2016-09-08 18:39:00', 'asha1'),
(447, 'asha1512', 3, 5, '107', '2016-09-12 16:32:00', 'asha1'),
(448, 'asha1512', 3, 6, '26', '2016-09-12 16:32:00', 'asha1'),
(449, 'asha1512', 3, 7, '99', '2016-09-12 16:32:00', 'asha1'),
(450, 'asha1512', 3, 8, '[B@976338c', '2016-09-12 16:32:00', 'asha1'),
(451, 'asha1512', 3, 9, '[B@3550cad5', '2016-09-12 16:32:00', 'asha1'),
(452, 'asha1510', 1, 1, '92', '2016-09-08 18:16:00', 'asha1'),
(453, 'asha1510', 1, 2, '45', '2016-09-08 18:16:00', 'asha1'),
(454, 'asha1510', 1, 3, '89', '2016-09-08 18:16:00', 'asha1'),
(455, 'asha1510', 1, 1, '94', '2016-09-12 13:41:00', 'asha1'),
(456, 'asha1510', 1, 2, '50', '2016-09-12 13:41:00', 'asha1'),
(457, 'asha1510', 1, 3, '89', '2016-09-12 13:41:00', 'asha1'),
(458, 'asha1512', 1, 1, '133', '2016-09-12 16:35:00', 'asha1'),
(459, 'asha1512', 1, 2, '92', '2016-09-12 16:35:00', 'asha1'),
(460, 'asha1512', 1, 3, '70', '2016-09-12 16:35:00', 'asha1'),
(461, 'asha1510', 4, 10, '14.0', '2016-09-08 18:23:00', 'asha1'),
(462, 'asha1511', 4, 10, '10.0', '2016-09-12 11:53:00', 'asha1'),
(463, 'asha1510', 4, 10, '12.0', '2016-09-12 13:40:00', 'asha1'),
(464, 'asha1512', 4, 10, '10.0', '2016-09-12 16:32:00', 'asha1'),
(465, 'asha1510', 2, 4, '[B@abc6160', '2016-09-08 19:05:00', 'asha1'),
(466, 'asha1512', 2, 4, '[B@2820e619', '2016-09-12 16:40:00', 'asha1'),
(467, 'asha1510', 1, 1, '92', '2016-09-08 18:16:00', 'asha1'),
(468, 'asha1510', 1, 2, '45', '2016-09-08 18:16:00', 'asha1'),
(469, 'asha1510', 1, 3, '89', '2016-09-08 18:16:00', 'asha1'),
(470, 'asha1510', 1, 1, '94', '2016-09-12 13:41:00', 'asha1'),
(471, 'asha1510', 1, 2, '50', '2016-09-12 13:41:00', 'asha1'),
(472, 'asha1510', 1, 3, '89', '2016-09-12 13:41:00', 'asha1'),
(473, 'asha1512', 1, 1, '133', '2016-09-12 16:35:00', 'asha1'),
(474, 'asha1512', 1, 2, '92', '2016-09-12 16:35:00', 'asha1'),
(475, 'asha1512', 1, 3, '70', '2016-09-12 16:35:00', 'asha1'),
(476, 'asha1510', 3, 5, '87', '2016-09-08 18:39:00', 'asha1'),
(477, 'asha1510', 3, 6, '26', '2016-09-08 18:39:00', 'asha1'),
(478, 'asha1510', 3, 7, '99', '2016-09-08 18:39:00', 'asha1'),
(479, 'asha1510', 3, 8, '[B@2f3ad6f6', '2016-09-08 18:39:00', 'asha1'),
(480, 'asha1510', 3, 9, '[B@1d0aaf7', '2016-09-08 18:39:00', 'asha1'),
(481, 'asha1512', 3, 5, '107', '2016-09-12 16:32:00', 'asha1'),
(482, 'asha1512', 3, 6, '26', '2016-09-12 16:32:00', 'asha1'),
(483, 'asha1512', 3, 7, '99', '2016-09-12 16:32:00', 'asha1'),
(484, 'asha1512', 3, 8, '[B@bfa3d64', '2016-09-12 16:32:00', 'asha1'),
(485, 'asha1512', 3, 9, '[B@3798cbcd', '2016-09-12 16:32:00', 'asha1'),
(486, 'asha1510', 4, 10, '14.0', '2016-09-08 18:23:00', 'asha1'),
(487, 'asha1511', 4, 10, '10.0', '2016-09-12 11:53:00', 'asha1'),
(488, 'asha1510', 4, 10, '12.0', '2016-09-12 13:40:00', 'asha1'),
(489, 'asha1512', 4, 10, '10.0', '2016-09-12 16:32:00', 'asha1'),
(490, 'asha1510', 2, 4, '[B@2bf6fdb8', '2016-09-08 19:05:00', 'asha1'),
(491, 'asha1512', 2, 4, '[B@2dc84791', '2016-09-12 16:40:00', 'asha1'),
(492, 'asha1510', 1, 1, '92', '2016-09-08 18:16:00', 'asha1'),
(493, 'asha1510', 1, 2, '45', '2016-09-08 18:16:00', 'asha1'),
(494, 'asha1510', 1, 3, '89', '2016-09-08 18:16:00', 'asha1'),
(495, 'asha1510', 1, 1, '94', '2016-09-12 13:41:00', 'asha1'),
(496, 'asha1510', 1, 2, '50', '2016-09-12 13:41:00', 'asha1'),
(497, 'asha1510', 1, 3, '89', '2016-09-12 13:41:00', 'asha1'),
(498, 'asha1512', 1, 1, '133', '2016-09-12 16:35:00', 'asha1'),
(499, 'asha1512', 1, 2, '92', '2016-09-12 16:35:00', 'asha1'),
(500, 'asha1512', 1, 3, '70', '2016-09-12 16:35:00', 'asha1'),
(501, 'asha1510', 3, 5, '87', '2016-09-08 18:39:00', 'asha1'),
(502, 'asha1510', 3, 6, '26', '2016-09-08 18:39:00', 'asha1'),
(503, 'asha1510', 3, 7, '99', '2016-09-08 18:39:00', 'asha1'),
(504, 'asha1510', 3, 8, '[B@c8fffa6', '2016-09-08 18:39:00', 'asha1'),
(505, 'asha1510', 3, 9, '[B@19989de7', '2016-09-08 18:39:00', 'asha1'),
(506, 'asha1512', 3, 5, '107', '2016-09-12 16:32:00', 'asha1'),
(507, 'asha1512', 3, 6, '26', '2016-09-12 16:32:00', 'asha1'),
(508, 'asha1512', 3, 7, '99', '2016-09-12 16:32:00', 'asha1'),
(509, 'asha1512', 3, 8, '[B@2dc1cd94', '2016-09-12 16:32:00', 'asha1'),
(510, 'asha1512', 3, 9, '[B@1c9fd03d', '2016-09-12 16:32:00', 'asha1'),
(511, 'asha1510', 4, 10, '14.0', '2016-09-08 18:23:00', 'asha1'),
(512, 'asha1511', 4, 10, '10.0', '2016-09-12 11:53:00', 'asha1'),
(513, 'asha1510', 4, 10, '12.0', '2016-09-12 13:40:00', 'asha1'),
(514, 'asha1512', 4, 10, '10.0', '2016-09-12 16:32:00', 'asha1'),
(515, 'asha1510', 2, 4, '[B@414eae8', '2016-09-08 19:05:00', 'asha1'),
(516, 'asha1512', 2, 4, '[B@33eae501', '2016-09-12 16:40:00', 'asha1'),
(517, 'asha1510', 1, 1, '92', '2016-09-08 18:16:00', 'asha1'),
(518, 'asha1510', 1, 2, '45', '2016-09-08 18:16:00', 'asha1'),
(519, 'asha1510', 1, 3, '89', '2016-09-08 18:16:00', 'asha1'),
(520, 'asha1510', 1, 1, '94', '2016-09-12 13:41:00', 'asha1'),
(521, 'asha1510', 1, 2, '50', '2016-09-12 13:41:00', 'asha1'),
(522, 'asha1510', 1, 3, '89', '2016-09-12 13:41:00', 'asha1'),
(523, 'asha1512', 1, 1, '133', '2016-09-12 16:35:00', 'asha1'),
(524, 'asha1512', 1, 2, '92', '2016-09-12 16:35:00', 'asha1'),
(525, 'asha1512', 1, 3, '70', '2016-09-12 16:35:00', 'asha1'),
(526, 'asha1510', 3, 5, '87', '2016-09-08 18:39:00', 'asha1'),
(527, 'asha1510', 3, 6, '26', '2016-09-08 18:39:00', 'asha1'),
(528, 'asha1510', 3, 7, '99', '2016-09-08 18:39:00', 'asha1'),
(529, 'asha1510', 3, 8, '[B@3763076a', '2016-09-08 18:39:00', 'asha1'),
(530, 'asha1510', 3, 9, '[B@2768a45b', '2016-09-08 18:39:00', 'asha1'),
(531, 'asha1512', 3, 5, '107', '2016-09-12 16:32:00', 'asha1'),
(532, 'asha1512', 3, 6, '26', '2016-09-12 16:32:00', 'asha1'),
(533, 'asha1512', 3, 7, '99', '2016-09-12 16:32:00', 'asha1'),
(534, 'asha1512', 3, 8, '[B@2303e4f8', '2016-09-12 16:32:00', 'asha1'),
(535, 'asha1512', 3, 9, '[B@283c3dd1', '2016-09-12 16:32:00', 'asha1'),
(536, 'asha1510', 4, 10, '14.0', '2016-09-08 18:23:00', 'asha1'),
(537, 'asha1511', 4, 10, '10.0', '2016-09-12 11:53:00', 'asha1'),
(538, 'asha1510', 4, 10, '12.0', '2016-09-12 13:40:00', 'asha1'),
(539, 'asha1512', 4, 10, '10.0', '2016-09-12 16:32:00', 'asha1'),
(540, 'asha1512', 4, 10, '13.0', '2016-09-12 18:11:00', 'asha1'),
(541, 'asha1512', 4, 10, '14.0', '2016-09-12 18:11:00', 'asha1'),
(542, 'asha1512', 4, 10, '14.0', '2016-09-12 18:12:00', 'asha1'),
(543, 'asha1510', 2, 4, '[B@1b2b940c', '2016-09-08 19:05:00', 'asha1'),
(544, 'asha1512', 2, 4, '[B@25f1e155', '2016-09-12 16:40:00', 'asha1'),
(545, 'asha1510', 3, 5, '87', '2016-09-08 18:39:00', 'asha1'),
(546, 'asha1510', 3, 6, '26', '2016-09-08 18:39:00', 'asha1'),
(547, 'asha1510', 3, 7, '99', '2016-09-08 18:39:00', 'asha1'),
(548, 'asha1510', 3, 8, '[B@152f50ae', '2016-09-08 18:39:00', 'asha1'),
(549, 'asha1510', 3, 9, '[B@44e8e4f', '2016-09-08 18:39:00', 'asha1'),
(550, 'asha1512', 3, 5, '107', '2016-09-12 16:32:00', 'asha1'),
(551, 'asha1512', 3, 6, '26', '2016-09-12 16:32:00', 'asha1'),
(552, 'asha1512', 3, 7, '99', '2016-09-12 16:32:00', 'asha1'),
(553, 'asha1512', 3, 8, '[B@24e8d9dc', '2016-09-12 16:32:00', 'asha1'),
(554, 'asha1512', 3, 9, '[B@5adfae5', '2016-09-12 16:32:00', 'asha1'),
(555, 'asha1510', 1, 1, '92', '2016-09-08 18:16:00', 'asha1'),
(556, 'asha1510', 1, 2, '45', '2016-09-08 18:16:00', 'asha1'),
(557, 'asha1510', 1, 3, '89', '2016-09-08 18:16:00', 'asha1'),
(558, 'asha1510', 1, 1, '94', '2016-09-12 13:41:00', 'asha1'),
(559, 'asha1510', 1, 2, '50', '2016-09-12 13:41:00', 'asha1'),
(560, 'asha1510', 1, 3, '89', '2016-09-12 13:41:00', 'asha1'),
(561, 'asha1512', 1, 1, '133', '2016-09-12 16:35:00', 'asha1'),
(562, 'asha1512', 1, 2, '92', '2016-09-12 16:35:00', 'asha1'),
(563, 'asha1512', 1, 3, '70', '2016-09-12 16:35:00', 'asha1'),
(564, 'asha1511', 1, 1, '150', '2016-09-12 18:18:00', 'asha1'),
(565, 'asha1511', 1, 2, '100', '2016-09-12 18:18:00', 'asha1'),
(566, 'asha1511', 1, 3, '90', '2016-09-12 18:18:00', 'asha1'),
(567, 'asha1511', 1, 1, '140', '2016-09-12 18:18:00', 'asha1'),
(568, 'asha1511', 1, 2, '90', '2016-09-12 18:18:00', 'asha1'),
(569, 'asha1511', 1, 3, '70', '2016-09-12 18:18:00', 'asha1'),
(570, 'asha1511', 1, 1, '130', '2016-09-12 18:19:00', 'asha1'),
(571, 'asha1511', 1, 2, '90', '2016-09-12 18:19:00', 'asha1'),
(572, 'asha1511', 1, 3, '70', '2016-09-12 18:19:00', 'asha1'),
(573, 'asha1511', 1, 1, '120', '2016-09-12 18:20:00', 'asha1'),
(574, 'asha1511', 1, 2, '80', '2016-09-12 18:20:00', 'asha1'),
(575, 'asha1511', 1, 3, '70', '2016-09-12 18:20:00', 'asha1'),
(576, 'asha1510', 4, 10, '14.0', '2016-09-08 18:23:00', 'asha1'),
(577, 'asha1511', 4, 10, '10.0', '2016-09-12 11:53:00', 'asha1'),
(578, 'asha1510', 4, 10, '12.0', '2016-09-12 13:40:00', 'asha1'),
(579, 'asha1512', 4, 10, '10.0', '2016-09-12 16:32:00', 'asha1'),
(580, 'asha1512', 4, 10, '13.0', '2016-09-12 18:11:00', 'asha1'),
(581, 'asha1512', 4, 10, '14.0', '2016-09-12 18:11:00', 'asha1'),
(582, 'asha1512', 4, 10, '14.0', '2016-09-12 18:12:00', 'asha1'),
(583, 'asha1511', 4, 10, '7.0', '2016-09-12 18:15:00', 'asha1'),
(584, 'asha1511', 4, 10, '9.0', '2016-09-12 18:15:00', 'asha1'),
(585, 'asha1511', 4, 10, '11.0', '2016-09-12 18:15:00', 'asha1'),
(586, 'asha1511', 4, 10, '11.0', '2016-09-12 18:15:00', 'asha1'),
(587, 'asha1511', 4, 10, '12.0', '2016-09-12 18:15:00', 'asha1'),
(588, 'asha1513', 4, 10, '10.0', '2016-09-12 18:22:00', 'asha1'),
(589, 'asha1510', 2, 4, '[B@1caa42b0', '2016-09-08 19:05:00', 'asha1'),
(590, 'asha1512', 2, 4, '[B@18f03529', '2016-09-12 16:40:00', 'asha1'),
(591, 'asha1510', 1, 1, '92', '2016-09-08 18:16:00', 'asha1'),
(592, 'asha1510', 1, 2, '45', '2016-09-08 18:16:00', 'asha1'),
(593, 'asha1510', 1, 3, '89', '2016-09-08 18:16:00', 'asha1'),
(594, 'asha1510', 1, 1, '94', '2016-09-12 13:41:00', 'asha1'),
(595, 'asha1510', 1, 2, '50', '2016-09-12 13:41:00', 'asha1'),
(596, 'asha1510', 1, 3, '89', '2016-09-12 13:41:00', 'asha1'),
(597, 'asha1512', 1, 1, '133', '2016-09-12 16:35:00', 'asha1'),
(598, 'asha1512', 1, 2, '92', '2016-09-12 16:35:00', 'asha1'),
(599, 'asha1512', 1, 3, '70', '2016-09-12 16:35:00', 'asha1'),
(600, 'asha1511', 1, 1, '150', '2016-09-12 18:18:00', 'asha1'),
(601, 'asha1511', 1, 2, '100', '2016-09-12 18:18:00', 'asha1'),
(602, 'asha1511', 1, 3, '90', '2016-09-12 18:18:00', 'asha1'),
(603, 'asha1511', 1, 1, '140', '2016-09-12 18:18:00', 'asha1'),
(604, 'asha1511', 1, 2, '90', '2016-09-12 18:18:00', 'asha1'),
(605, 'asha1511', 1, 3, '70', '2016-09-12 18:18:00', 'asha1'),
(606, 'asha1511', 1, 1, '130', '2016-09-12 18:19:00', 'asha1'),
(607, 'asha1511', 1, 2, '90', '2016-09-12 18:19:00', 'asha1'),
(608, 'asha1511', 1, 3, '70', '2016-09-12 18:19:00', 'asha1'),
(609, 'asha1511', 1, 1, '120', '2016-09-12 18:20:00', 'asha1'),
(610, 'asha1511', 1, 2, '80', '2016-09-12 18:20:00', 'asha1'),
(611, 'asha1511', 1, 3, '70', '2016-09-12 18:20:00', 'asha1'),
(612, 'asha1510', 3, 5, '87', '2016-09-08 18:39:00', 'asha1'),
(613, 'asha1510', 3, 6, '26', '2016-09-08 18:39:00', 'asha1'),
(614, 'asha1510', 3, 7, '99', '2016-09-08 18:39:00', 'asha1'),
(615, 'asha1510', 3, 8, '[B@28118ebf', '2016-09-08 18:39:00', 'asha1'),
(616, 'asha1510', 3, 9, '[B@fb2298c', '2016-09-08 18:39:00', 'asha1'),
(617, 'asha1512', 3, 5, '107', '2016-09-12 16:32:00', 'asha1'),
(618, 'asha1512', 3, 6, '26', '2016-09-12 16:32:00', 'asha1'),
(619, 'asha1512', 3, 7, '99', '2016-09-12 16:32:00', 'asha1'),
(620, 'asha1512', 3, 8, '[B@25cc88d5', '2016-09-12 16:32:00', 'asha1'),
(621, 'asha1512', 3, 9, '[B@138558ea', '2016-09-12 16:32:00', 'asha1'),
(622, 'asha1510', 4, 10, '14.0', '2016-09-08 18:23:00', 'asha1'),
(623, 'asha1511', 4, 10, '10.0', '2016-09-12 11:53:00', 'asha1'),
(624, 'asha1510', 4, 10, '12.0', '2016-09-12 13:40:00', 'asha1'),
(625, 'asha1512', 4, 10, '10.0', '2016-09-12 16:32:00', 'asha1'),
(626, 'asha1512', 4, 10, '13.0', '2016-09-12 18:11:00', 'asha1'),
(627, 'asha1512', 4, 10, '14.0', '2016-09-12 18:11:00', 'asha1'),
(628, 'asha1512', 4, 10, '14.0', '2016-09-12 18:12:00', 'asha1'),
(629, 'asha1511', 4, 10, '7.0', '2016-09-12 18:15:00', 'asha1'),
(630, 'asha1511', 4, 10, '9.0', '2016-09-12 18:15:00', 'asha1'),
(631, 'asha1511', 4, 10, '11.0', '2016-09-12 18:15:00', 'asha1'),
(632, 'asha1511', 4, 10, '11.0', '2016-09-12 18:15:00', 'asha1'),
(633, 'asha1511', 4, 10, '12.0', '2016-09-12 18:15:00', 'asha1'),
(634, 'asha1513', 4, 10, '10.0', '2016-09-12 18:22:00', 'asha1'),
(635, 'asha1510', 2, 4, '[B@65d131d', '2016-09-08 19:05:00', 'asha1'),
(636, 'asha1512', 2, 4, '[B@36e22992', '2016-09-12 16:40:00', 'asha1'),
(637, 'asha1510', 1, 1, '92', '2016-09-08 18:16:00', 'asha1'),
(638, 'asha1510', 1, 2, '45', '2016-09-08 18:16:00', 'asha1'),
(639, 'asha1510', 1, 3, '89', '2016-09-08 18:16:00', 'asha1'),
(640, 'asha1510', 1, 1, '94', '2016-09-12 13:41:00', 'asha1'),
(641, 'asha1510', 1, 2, '50', '2016-09-12 13:41:00', 'asha1'),
(642, 'asha1510', 1, 3, '89', '2016-09-12 13:41:00', 'asha1'),
(643, 'asha1512', 1, 1, '133', '2016-09-12 16:35:00', 'asha1'),
(644, 'asha1512', 1, 2, '92', '2016-09-12 16:35:00', 'asha1'),
(645, 'asha1512', 1, 3, '70', '2016-09-12 16:35:00', 'asha1'),
(646, 'asha1511', 1, 1, '150', '2016-09-12 18:18:00', 'asha1'),
(647, 'asha1511', 1, 2, '100', '2016-09-12 18:18:00', 'asha1'),
(648, 'asha1511', 1, 3, '90', '2016-09-12 18:18:00', 'asha1'),
(649, 'asha1511', 1, 1, '140', '2016-09-12 18:18:00', 'asha1'),
(650, 'asha1511', 1, 2, '90', '2016-09-12 18:18:00', 'asha1'),
(651, 'asha1511', 1, 3, '70', '2016-09-12 18:18:00', 'asha1'),
(652, 'asha1511', 1, 1, '130', '2016-09-12 18:19:00', 'asha1'),
(653, 'asha1511', 1, 2, '90', '2016-09-12 18:19:00', 'asha1'),
(654, 'asha1511', 1, 3, '70', '2016-09-12 18:19:00', 'asha1'),
(655, 'asha1511', 1, 1, '120', '2016-09-12 18:20:00', 'asha1'),
(656, 'asha1511', 1, 2, '80', '2016-09-12 18:20:00', 'asha1'),
(657, 'asha1511', 1, 3, '70', '2016-09-12 18:20:00', 'asha1'),
(658, 'asha1514', 1, 1, '130', '2016-09-12 19:37:00', 'asha1'),
(659, 'asha1514', 1, 2, '109', '2016-09-12 19:37:00', 'asha1'),
(660, 'asha1514', 1, 3, '118', '2016-09-12 19:37:00', 'asha1'),
(661, 'asha1510', 3, 5, '87', '2016-09-08 18:39:00', 'asha1'),
(662, 'asha1510', 3, 6, '26', '2016-09-08 18:39:00', 'asha1'),
(663, 'asha1510', 3, 7, '99', '2016-09-08 18:39:00', 'asha1'),
(664, 'asha1510', 3, 8, '[B@11cdfb98', '2016-09-08 18:39:00', 'asha1'),
(665, 'asha1510', 3, 9, '[B@6ec9ff1', '2016-09-08 18:39:00', 'asha1'),
(666, 'asha1512', 3, 5, '107', '2016-09-12 16:32:00', 'asha1'),
(667, 'asha1512', 3, 6, '26', '2016-09-12 16:32:00', 'asha1'),
(668, 'asha1512', 3, 7, '99', '2016-09-12 16:32:00', 'asha1'),
(669, 'asha1512', 3, 8, '[B@30e1b7d6', '2016-09-12 16:32:00', 'asha1'),
(670, 'asha1512', 3, 9, '[B@1ba2aa57', '2016-09-12 16:32:00', 'asha1'),
(671, 'asha1514', 3, 5, '115', '2016-09-12 19:35:00', 'asha1'),
(672, 'asha1514', 3, 6, '11', '2016-09-12 19:35:00', 'asha1'),
(673, 'asha1514', 3, 7, '99', '2016-09-12 19:35:00', 'asha1'),
(674, 'asha1514', 3, 8, '[B@2a733944', '2016-09-12 19:35:00', 'asha1'),
(675, 'asha1514', 3, 9, '[B@3d1a4a2d', '2016-09-12 19:35:00', 'asha1'),
(676, 'asha1510', 4, 10, '14.0', '2016-09-08 18:23:00', 'asha1'),
(677, 'asha1511', 4, 10, '10.0', '2016-09-12 11:53:00', 'asha1'),
(678, 'asha1510', 4, 10, '12.0', '2016-09-12 13:40:00', 'asha1'),
(679, 'asha1512', 4, 10, '10.0', '2016-09-12 16:32:00', 'asha1'),
(680, 'asha1512', 4, 10, '13.0', '2016-09-12 18:11:00', 'asha1'),
(681, 'asha1512', 4, 10, '14.0', '2016-09-12 18:11:00', 'asha1'),
(682, 'asha1512', 4, 10, '14.0', '2016-09-12 18:12:00', 'asha1'),
(683, 'asha1511', 4, 10, '7.0', '2016-09-12 18:15:00', 'asha1'),
(684, 'asha1511', 4, 10, '9.0', '2016-09-12 18:15:00', 'asha1'),
(685, 'asha1511', 4, 10, '11.0', '2016-09-12 18:15:00', 'asha1'),
(686, 'asha1511', 4, 10, '11.0', '2016-09-12 18:15:00', 'asha1'),
(687, 'asha1511', 4, 10, '12.0', '2016-09-12 18:15:00', 'asha1'),
(688, 'asha1513', 4, 10, '10.0', '2016-09-12 18:22:00', 'asha1'),
(689, 'asha1510', 2, 4, '[B@13d6f7bd', '2016-09-08 19:05:00', 'asha1'),
(690, 'asha1512', 2, 4, '[B@b3141b2', '2016-09-12 16:40:00', 'asha1'),
(691, 'asha1514', 2, 4, '[B@7a96503', '2016-09-12 19:39:00', 'asha1'),
(692, 'asha1510', 1, 1, '92', '2016-09-08 18:16:00', 'asha1'),
(693, 'asha1510', 1, 2, '45', '2016-09-08 18:16:00', 'asha1'),
(694, 'asha1510', 1, 3, '89', '2016-09-08 18:16:00', 'asha1'),
(695, 'asha1510', 1, 1, '94', '2016-09-12 13:41:00', 'asha1'),
(696, 'asha1510', 1, 2, '50', '2016-09-12 13:41:00', 'asha1'),
(697, 'asha1510', 1, 3, '89', '2016-09-12 13:41:00', 'asha1'),
(698, 'asha1512', 1, 1, '133', '2016-09-12 16:35:00', 'asha1'),
(699, 'asha1512', 1, 2, '92', '2016-09-12 16:35:00', 'asha1'),
(700, 'asha1512', 1, 3, '70', '2016-09-12 16:35:00', 'asha1'),
(701, 'asha1511', 1, 1, '150', '2016-09-12 18:18:00', 'asha1'),
(702, 'asha1511', 1, 2, '100', '2016-09-12 18:18:00', 'asha1'),
(703, 'asha1511', 1, 3, '90', '2016-09-12 18:18:00', 'asha1'),
(704, 'asha1511', 1, 1, '140', '2016-09-12 18:18:00', 'asha1'),
(705, 'asha1511', 1, 2, '90', '2016-09-12 18:18:00', 'asha1'),
(706, 'asha1511', 1, 3, '70', '2016-09-12 18:18:00', 'asha1'),
(707, 'asha1511', 1, 1, '130', '2016-09-12 18:19:00', 'asha1'),
(708, 'asha1511', 1, 2, '90', '2016-09-12 18:19:00', 'asha1'),
(709, 'asha1511', 1, 3, '70', '2016-09-12 18:19:00', 'asha1'),
(710, 'asha1511', 1, 1, '120', '2016-09-12 18:20:00', 'asha1'),
(711, 'asha1511', 1, 2, '80', '2016-09-12 18:20:00', 'asha1'),
(712, 'asha1511', 1, 3, '70', '2016-09-12 18:20:00', 'asha1'),
(713, 'asha1514', 1, 1, '130', '2016-09-12 19:37:00', 'asha1'),
(714, 'asha1514', 1, 2, '109', '2016-09-12 19:37:00', 'asha1'),
(715, 'asha1514', 1, 3, '118', '2016-09-12 19:37:00', 'asha1'),
(716, 'asha1510', 3, 5, '87', '2016-09-08 18:39:00', 'asha1'),
(717, 'asha1510', 3, 6, '26', '2016-09-08 18:39:00', 'asha1'),
(718, 'asha1510', 3, 7, '99', '2016-09-08 18:39:00', 'asha1'),
(719, 'asha1510', 3, 8, '[B@1bab9926', '2016-09-08 18:39:00', 'asha1'),
(720, 'asha1510', 3, 9, '[B@2a1df967', '2016-09-08 18:39:00', 'asha1'),
(721, 'asha1512', 3, 5, '107', '2016-09-12 16:32:00', 'asha1'),
(722, 'asha1512', 3, 6, '26', '2016-09-12 16:32:00', 'asha1'),
(723, 'asha1512', 3, 7, '99', '2016-09-12 16:32:00', 'asha1'),
(724, 'asha1512', 3, 8, '[B@1d6ac314', '2016-09-12 16:32:00', 'asha1'),
(725, 'asha1512', 3, 9, '[B@35d57bd', '2016-09-12 16:32:00', 'asha1'),
(726, 'asha1514', 3, 5, '115', '2016-09-12 19:35:00', 'asha1'),
(727, 'asha1514', 3, 6, '11', '2016-09-12 19:35:00', 'asha1'),
(728, 'asha1514', 3, 7, '99', '2016-09-12 19:35:00', 'asha1'),
(729, 'asha1514', 3, 8, '[B@38a821b2', '2016-09-12 19:35:00', 'asha1'),
(730, 'asha1514', 3, 9, '[B@1b86c503', '2016-09-12 19:35:00', 'asha1'),
(731, 'asha1510', 3, 5, '99', '2016-09-14 10:53:00', 'asha1'),
(732, 'asha1510', 3, 6, '11', '2016-09-14 10:53:00', 'asha1'),
(733, 'asha1510', 3, 7, '99', '2016-09-14 10:53:00', 'asha1'),
(734, 'asha1510', 3, 8, '[B@2bbafc80', '2016-09-14 10:53:00', 'asha1'),
(735, 'asha1510', 3, 9, '[B@228cb2b9', '2016-09-14 10:53:00', 'asha1'),
(736, 'asha1510', 3, 5, '78', '2016-09-14 11:24:00', 'asha1'),
(737, 'asha1510', 3, 6, '46', '2016-09-14 11:24:00', 'asha1'),
(738, 'asha1510', 3, 7, '99', '2016-09-14 11:24:00', 'asha1'),
(739, 'asha1510', 3, 8, '[B@872a6fe', '2016-09-14 11:24:00', 'asha1'),
(740, 'asha1510', 3, 9, '[B@2e26ae5f', '2016-09-14 11:24:00', 'asha1'),
(741, 'asha1510', 4, 10, '14.0', '2016-09-08 18:23:00', 'asha1'),
(742, 'asha1511', 4, 10, '10.0', '2016-09-12 11:53:00', 'asha1'),
(743, 'asha1510', 4, 10, '12.0', '2016-09-12 13:40:00', 'asha1'),
(744, 'asha1512', 4, 10, '10.0', '2016-09-12 16:32:00', 'asha1'),
(745, 'asha1512', 4, 10, '13.0', '2016-09-12 18:11:00', 'asha1'),
(746, 'asha1512', 4, 10, '14.0', '2016-09-12 18:11:00', 'asha1'),
(747, 'asha1512', 4, 10, '14.0', '2016-09-12 18:12:00', 'asha1'),
(748, 'asha1511', 4, 10, '7.0', '2016-09-12 18:15:00', 'asha1'),
(749, 'asha1511', 4, 10, '9.0', '2016-09-12 18:15:00', 'asha1'),
(750, 'asha1511', 4, 10, '11.0', '2016-09-12 18:15:00', 'asha1'),
(751, 'asha1511', 4, 10, '11.0', '2016-09-12 18:15:00', 'asha1'),
(752, 'asha1511', 4, 10, '12.0', '2016-09-12 18:15:00', 'asha1'),
(753, 'asha1513', 4, 10, '10.0', '2016-09-12 18:22:00', 'asha1'),
(754, 'asha1510', 2, 4, '[B@24d18868', '2016-09-08 19:05:00', 'asha1'),
(755, 'asha1512', 2, 4, '[B@1cbcc175', '2016-09-12 16:40:00', 'asha1'),
(756, 'asha1514', 2, 4, '[B@14ce350a', '2016-09-12 19:39:00', 'asha1'),
(757, 'asha1510', 1, 1, '92', '2016-09-08 18:16:00', 'asha1'),
(758, 'asha1510', 1, 2, '45', '2016-09-08 18:16:00', 'asha1'),
(759, 'asha1510', 1, 3, '89', '2016-09-08 18:16:00', 'asha1'),
(760, 'asha1510', 1, 1, '94', '2016-09-12 13:41:00', 'asha1'),
(761, 'asha1510', 1, 2, '50', '2016-09-12 13:41:00', 'asha1'),
(762, 'asha1510', 1, 3, '89', '2016-09-12 13:41:00', 'asha1'),
(763, 'asha1512', 1, 1, '133', '2016-09-12 16:35:00', 'asha1'),
(764, 'asha1512', 1, 2, '92', '2016-09-12 16:35:00', 'asha1'),
(765, 'asha1512', 1, 3, '70', '2016-09-12 16:35:00', 'asha1'),
(766, 'asha1511', 1, 1, '150', '2016-09-12 18:18:00', 'asha1'),
(767, 'asha1511', 1, 2, '100', '2016-09-12 18:18:00', 'asha1'),
(768, 'asha1511', 1, 3, '90', '2016-09-12 18:18:00', 'asha1'),
(769, 'asha1511', 1, 1, '140', '2016-09-12 18:18:00', 'asha1'),
(770, 'asha1511', 1, 2, '90', '2016-09-12 18:18:00', 'asha1'),
(771, 'asha1511', 1, 3, '70', '2016-09-12 18:18:00', 'asha1'),
(772, 'asha1511', 1, 1, '130', '2016-09-12 18:19:00', 'asha1'),
(773, 'asha1511', 1, 2, '90', '2016-09-12 18:19:00', 'asha1'),
(774, 'asha1511', 1, 3, '70', '2016-09-12 18:19:00', 'asha1'),
(775, 'asha1511', 1, 1, '120', '2016-09-12 18:20:00', 'asha1'),
(776, 'asha1511', 1, 2, '80', '2016-09-12 18:20:00', 'asha1'),
(777, 'asha1511', 1, 3, '70', '2016-09-12 18:20:00', 'asha1'),
(778, 'asha1514', 1, 1, '130', '2016-09-12 19:37:00', 'asha1'),
(779, 'asha1514', 1, 2, '109', '2016-09-12 19:37:00', 'asha1'),
(780, 'asha1514', 1, 3, '118', '2016-09-12 19:37:00', 'asha1'),
(781, 'asha1511', 1, 1, '113', '2016-10-26 14:25:00', 'asha1'),
(782, 'asha1511', 1, 2, '70', '2016-10-26 14:25:00', 'asha1'),
(783, 'asha1511', 1, 3, '83', '2016-10-26 14:25:00', 'asha1'),
(784, 'asha1510', 3, 5, '87', '2016-09-08 18:39:00', 'asha1'),
(785, 'asha1510', 3, 6, '26', '2016-09-08 18:39:00', 'asha1'),
(786, 'asha1510', 3, 7, '99', '2016-09-08 18:39:00', 'asha1'),
(787, 'asha1510', 3, 8, '[B@298b44f8', '2016-09-08 18:39:00', 'asha1'),
(788, 'asha1510', 3, 9, '[B@2f201dd1', '2016-09-08 18:39:00', 'asha1'),
(789, 'asha1512', 3, 5, '107', '2016-09-12 16:32:00', 'asha1'),
(790, 'asha1512', 3, 6, '26', '2016-09-12 16:32:00', 'asha1'),
(791, 'asha1512', 3, 7, '99', '2016-09-12 16:32:00', 'asha1'),
(792, 'asha1512', 3, 8, '[B@3a689036', '2016-09-12 16:32:00', 'asha1'),
(793, 'asha1512', 3, 9, '[B@3a3a0b37', '2016-09-12 16:32:00', 'asha1'),
(794, 'asha1514', 3, 5, '115', '2016-09-12 19:35:00', 'asha1'),
(795, 'asha1514', 3, 6, '11', '2016-09-12 19:35:00', 'asha1'),
(796, 'asha1514', 3, 7, '99', '2016-09-12 19:35:00', 'asha1'),
(797, 'asha1514', 3, 8, '[B@1dabb8a4', '2016-09-12 19:35:00', 'asha1'),
(798, 'asha1514', 3, 9, '[B@2737c60d', '2016-09-12 19:35:00', 'asha1'),
(799, 'asha1510', 3, 5, '99', '2016-09-14 10:53:00', 'asha1'),
(800, 'asha1510', 3, 6, '11', '2016-09-14 10:53:00', 'asha1'),
(801, 'asha1510', 3, 7, '99', '2016-09-14 10:53:00', 'asha1'),
(802, 'asha1510', 3, 8, '[B@2c2579c2', '2016-09-14 10:53:00', 'asha1'),
(803, 'asha1510', 3, 9, '[B@251a23d3', '2016-09-14 10:53:00', 'asha1'),
(804, 'asha1510', 3, 5, '78', '2016-09-14 11:24:00', 'asha1'),
(805, 'asha1510', 3, 6, '46', '2016-09-14 11:24:00', 'asha1'),
(806, 'asha1510', 3, 7, '99', '2016-09-14 11:24:00', 'asha1'),
(807, 'asha1510', 3, 8, '[B@b3dbb10', '2016-09-14 11:24:00', 'asha1'),
(808, 'asha1510', 3, 9, '[B@16a7b609', '2016-09-14 11:24:00', 'asha1'),
(809, 'asha1511', 3, 5, '79', '2016-10-26 14:24:00', 'asha1'),
(810, 'asha1511', 3, 6, '42', '2016-10-26 14:24:00', 'asha1'),
(811, 'asha1511', 3, 7, '99', '2016-10-26 14:24:00', 'asha1'),
(812, 'asha1511', 3, 8, '[B@12d5700e', '2016-10-26 14:24:00', 'asha1'),
(813, 'asha1511', 3, 9, '[B@5d92a2f', '2016-10-26 14:24:00', 'asha1'),
(814, 'asha1510', 4, 10, '14.0', '2016-09-08 18:23:00', 'asha1'),
(815, 'asha1511', 4, 10, '10.0', '2016-09-12 11:53:00', 'asha1'),
(816, 'asha1510', 4, 10, '12.0', '2016-09-12 13:40:00', 'asha1'),
(817, 'asha1512', 4, 10, '10.0', '2016-09-12 16:32:00', 'asha1'),
(818, 'asha1512', 4, 10, '13.0', '2016-09-12 18:11:00', 'asha1'),
(819, 'asha1512', 4, 10, '14.0', '2016-09-12 18:11:00', 'asha1'),
(820, 'asha1512', 4, 10, '14.0', '2016-09-12 18:12:00', 'asha1'),
(821, 'asha1511', 4, 10, '7.0', '2016-09-12 18:15:00', 'asha1'),
(822, 'asha1511', 4, 10, '9.0', '2016-09-12 18:15:00', 'asha1'),
(823, 'asha1511', 4, 10, '11.0', '2016-09-12 18:15:00', 'asha1'),
(824, 'asha1511', 4, 10, '11.0', '2016-09-12 18:15:00', 'asha1'),
(825, 'asha1511', 4, 10, '12.0', '2016-09-12 18:15:00', 'asha1'),
(826, 'asha1513', 4, 10, '10.0', '2016-09-12 18:22:00', 'asha1'),
(827, 'asha1517', 4, 10, '10.0', '2016-10-05 11:11:00', 'asha1'),
(828, 'asha1511', 4, 10, '24.0', '2016-10-26 13:54:00', 'asha1'),
(829, 'asha1511', 4, 10, '4.0', '2016-10-26 13:55:00', 'asha1'),
(830, 'asha1510', 2, 4, '[B@34a27be3', '2016-09-08 19:05:00', 'asha1'),
(831, 'asha1512', 2, 4, '[B@1f8019e0', '2016-09-12 16:40:00', 'asha1'),
(832, 'asha1514', 2, 4, '[B@14ad7499', '2016-09-12 19:39:00', 'asha1'),
(833, 'asha1510', 2, 4, '[B@21f6f33f', '2016-10-26 14:21:00', 'asha1'),
(834, 'asha1510', 3, 5, '87', '2016-09-08 18:39:00', 'asha1'),
(835, 'asha1510', 3, 6, '26', '2016-09-08 18:39:00', 'asha1'),
(836, 'asha1510', 3, 7, '99', '2016-09-08 18:39:00', 'asha1'),
(837, 'asha1510', 3, 8, '[B@341518cb', '2016-09-08 18:39:00', 'asha1'),
(838, 'asha1510', 3, 9, '[B@128b98a8', '2016-09-08 18:39:00', 'asha1'),
(839, 'asha1512', 3, 5, '107', '2016-09-12 16:32:00', 'asha1'),
(840, 'asha1512', 3, 6, '26', '2016-09-12 16:32:00', 'asha1'),
(841, 'asha1512', 3, 7, '99', '2016-09-12 16:32:00', 'asha1'),
(842, 'asha1512', 3, 8, '[B@27e35fc1', '2016-09-12 16:32:00', 'asha1'),
(843, 'asha1512', 3, 9, '[B@1342c366', '2016-09-12 16:32:00', 'asha1'),
(844, 'asha1514', 3, 5, '115', '2016-09-12 19:35:00', 'asha1'),
(845, 'asha1514', 3, 6, '11', '2016-09-12 19:35:00', 'asha1'),
(846, 'asha1514', 3, 7, '99', '2016-09-12 19:35:00', 'asha1'),
(847, 'asha1514', 3, 8, '[B@11da76a7', '2016-09-12 19:35:00', 'asha1'),
(848, 'asha1514', 3, 9, '[B@16559754', '2016-09-12 19:35:00', 'asha1'),
(849, 'asha1510', 3, 5, '99', '2016-09-14 10:53:00', 'asha1'),
(850, 'asha1510', 3, 6, '11', '2016-09-14 10:53:00', 'asha1'),
(851, 'asha1510', 3, 7, '99', '2016-09-14 10:53:00', 'asha1'),
(852, 'asha1510', 3, 8, '[B@358536fd', '2016-09-14 10:53:00', 'asha1'),
(853, 'asha1510', 3, 9, '[B@2527aff2', '2016-09-14 10:53:00', 'asha1'),
(854, 'asha1510', 3, 5, '78', '2016-09-14 11:24:00', 'asha1'),
(855, 'asha1510', 3, 6, '46', '2016-09-14 11:24:00', 'asha1'),
(856, 'asha1510', 3, 7, '99', '2016-09-14 11:24:00', 'asha1'),
(857, 'asha1510', 3, 8, '[B@30add643', '2016-09-14 11:24:00', 'asha1'),
(858, 'asha1510', 3, 9, '[B@2c1ed4c0', '2016-09-14 11:24:00', 'asha1'),
(859, 'asha1511', 3, 5, '79', '2016-10-26 14:24:00', 'asha1'),
(860, 'asha1511', 3, 6, '42', '2016-10-26 14:24:00', 'asha1'),
(861, 'asha1511', 3, 7, '99', '2016-10-26 14:24:00', 'asha1'),
(862, 'asha1511', 3, 8, '[B@3a7345f9', '2016-10-26 14:24:00', 'asha1'),
(863, 'asha1511', 3, 9, '[B@19fcd93e', '2016-10-26 14:24:00', 'asha1'),
(864, 'asha1510', 1, 1, '92', '2016-09-08 18:16:00', 'asha1'),
(865, 'asha1510', 1, 2, '45', '2016-09-08 18:16:00', 'asha1'),
(866, 'asha1510', 1, 3, '89', '2016-09-08 18:16:00', 'asha1'),
(867, 'asha1510', 1, 1, '94', '2016-09-12 13:41:00', 'asha1'),
(868, 'asha1510', 1, 2, '50', '2016-09-12 13:41:00', 'asha1'),
(869, 'asha1510', 1, 3, '89', '2016-09-12 13:41:00', 'asha1'),
(870, 'asha1512', 1, 1, '133', '2016-09-12 16:35:00', 'asha1'),
(871, 'asha1512', 1, 2, '92', '2016-09-12 16:35:00', 'asha1'),
(872, 'asha1512', 1, 3, '70', '2016-09-12 16:35:00', 'asha1'),
(873, 'asha1511', 1, 1, '150', '2016-09-12 18:18:00', 'asha1'),
(874, 'asha1511', 1, 2, '100', '2016-09-12 18:18:00', 'asha1'),
(875, 'asha1511', 1, 3, '90', '2016-09-12 18:18:00', 'asha1'),
(876, 'asha1511', 1, 1, '140', '2016-09-12 18:18:00', 'asha1'),
(877, 'asha1511', 1, 2, '90', '2016-09-12 18:18:00', 'asha1'),
(878, 'asha1511', 1, 3, '70', '2016-09-12 18:18:00', 'asha1'),
(879, 'asha1511', 1, 1, '130', '2016-09-12 18:19:00', 'asha1'),
(880, 'asha1511', 1, 2, '90', '2016-09-12 18:19:00', 'asha1'),
(881, 'asha1511', 1, 3, '70', '2016-09-12 18:19:00', 'asha1'),
(882, 'asha1511', 1, 1, '120', '2016-09-12 18:20:00', 'asha1'),
(883, 'asha1511', 1, 2, '80', '2016-09-12 18:20:00', 'asha1'),
(884, 'asha1511', 1, 3, '70', '2016-09-12 18:20:00', 'asha1'),
(885, 'asha1514', 1, 1, '130', '2016-09-12 19:37:00', 'asha1'),
(886, 'asha1514', 1, 2, '109', '2016-09-12 19:37:00', 'asha1'),
(887, 'asha1514', 1, 3, '118', '2016-09-12 19:37:00', 'asha1'),
(888, 'asha1511', 1, 1, '113', '2016-10-26 14:25:00', 'asha1'),
(889, 'asha1511', 1, 2, '70', '2016-10-26 14:25:00', 'asha1'),
(890, 'asha1511', 1, 3, '83', '2016-10-26 14:25:00', 'asha1'),
(891, 'asha1510', 4, 10, '14.0', '2016-09-08 18:23:00', 'asha1'),
(892, 'asha1511', 4, 10, '10.0', '2016-09-12 11:53:00', 'asha1'),
(893, 'asha1510', 4, 10, '12.0', '2016-09-12 13:40:00', 'asha1'),
(894, 'asha1512', 4, 10, '10.0', '2016-09-12 16:32:00', 'asha1'),
(895, 'asha1512', 4, 10, '13.0', '2016-09-12 18:11:00', 'asha1'),
(896, 'asha1512', 4, 10, '14.0', '2016-09-12 18:11:00', 'asha1'),
(897, 'asha1512', 4, 10, '14.0', '2016-09-12 18:12:00', 'asha1'),
(898, 'asha1511', 4, 10, '7.0', '2016-09-12 18:15:00', 'asha1'),
(899, 'asha1511', 4, 10, '9.0', '2016-09-12 18:15:00', 'asha1'),
(900, 'asha1511', 4, 10, '11.0', '2016-09-12 18:15:00', 'asha1'),
(901, 'asha1511', 4, 10, '11.0', '2016-09-12 18:15:00', 'asha1'),
(902, 'asha1511', 4, 10, '12.0', '2016-09-12 18:15:00', 'asha1'),
(903, 'asha1513', 4, 10, '10.0', '2016-09-12 18:22:00', 'asha1'),
(904, 'asha1517', 4, 10, '10.0', '2016-10-05 11:11:00', 'asha1'),
(905, 'asha1511', 4, 10, '24.0', '2016-10-26 13:54:00', 'asha1'),
(906, 'asha1511', 4, 10, '4.0', '2016-10-26 13:55:00', 'asha1'),
(907, 'asha1510', 2, 4, '[B@2b8d20af', '2016-09-08 19:05:00', 'asha1'),
(908, 'asha1512', 2, 4, '[B@1666cbc', '2016-09-12 16:40:00', 'asha1'),
(909, 'asha1514', 2, 4, '[B@2325c445', '2016-09-12 19:39:00', 'asha1'),
(910, 'asha1510', 2, 4, '[B@b3fc79a', '2016-10-26 14:21:00', 'asha1');
INSERT INTO `hm_patients_device_reading` (`Patients_Device_Reading_id`, `Patient_id`, `Devices_id`, `Device_Attributes_id`, `Device_Attributes_value`, `Created_Date`, `Created_By`) VALUES
(911, 'asha1514', 4, 10, '25.0', '2016-11-14 17:23:00', 'asha1'),
(912, 'asha1514', 4, 10, '25.0', '2016-11-14 17:23:00', 'asha1'),
(913, 'asha1514', 4, 10, '25.0', '2016-11-14 17:23:00', 'asha1'),
(914, 'asha1517', 1, 1, '150', '2016-10-10 04:13:16', 'asha1'),
(915, 'asha1513', 1, 1, '123', '2016-09-09 05:30:14', 'asha1'),
(916, 'asha1283', 4, 10, '7.2', '2016-11-16 07:10:29', 'asha1'),
(917, 'asha1283', 1, 1, '111', '2016-12-07 14:25:49', 'asha1'),
(918, 'asha11', 4, 10, '3.9', '2016-12-19 21:53:52', 'asha1'),
(919, 'asha11', 1, 1, '267', '2016-11-08 14:33:24', 'asha1');

-- --------------------------------------------------------

--
-- Table structure for table `hm_patient_family`
--

CREATE TABLE `hm_patient_family` (
  `Family_Id` int(11) NOT NULL,
  `Patient_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Card_Type_id` int(10) UNSIGNED NOT NULL,
  `Gender_Id` int(10) UNSIGNED NOT NULL,
  `Cast_Category_Id` int(10) UNSIGNED NOT NULL,
  `Family_First_NM` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Family_Middle_NM` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Family_Last_NM` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Date_Of_Birth` date DEFAULT NULL,
  `Age` int(10) UNSIGNED NOT NULL,
  `Education` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Relation` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Card_Number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Marital_Status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Contact` int(10) UNSIGNED DEFAULT NULL,
  `Created_Date` datetime DEFAULT NULL,
  `Created_By` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Updated_By` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Updated_Date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_patient_family`
--

INSERT INTO `hm_patient_family` (`Family_Id`, `Patient_id`, `Card_Type_id`, `Gender_Id`, `Cast_Category_Id`, `Family_First_NM`, `Family_Middle_NM`, `Family_Last_NM`, `Date_Of_Birth`, `Age`, `Education`, `Relation`, `Card_Number`, `Marital_Status`, `Contact`, `Created_Date`, `Created_By`, `Updated_By`, `Updated_Date`) VALUES
(1, 'asha11', 1, 2, 1, 'Vijay', 'Mala', '', '1981-11-20', 35, 'Literate', 'Husband', '789456213012', 'Married', 4294967295, '2016-11-11 18:08:56', 'asha1', 'asha1', '2016-11-11 18:08:56'),
(1, 'asha1283', 1, 1, 1, 'Anil', 'Muttepawar', '', '1998-11-29', 17, 'Literate', 'Husband', '123456789012', 'Married', 4294967295, '2016-11-15 13:43:45', 'asha1', 'asha1', '2016-11-15 13:43:45'),
(1, 'asha1510', 1, 2, 1, 'Ishwar', 'Aapte', '', '1980-09-08', 36, 'Literate', 'Husband', 'qawsedrftgyh', 'Married', 4294967295, '2016-09-08 15:59:41', 'asha1', 'asha1', '2016-09-08 15:59:41'),
(1, 'asha1511', 1, 2, 1, 'Ramdas', 'Tawde', '', '1985-09-08', 31, 'Literate', 'Husband', 'qawrftgyhuji', 'Married', 4294967295, '2016-09-08 16:05:54', 'asha1', 'asha1', '2016-09-08 16:05:54'),
(1, 'asha1512', 1, 2, 1, 'Haris', 'Pansare', '', '1989-09-08', 27, 'Literate', 'Husband', 'qafghujkijuh', 'Married', 4294967295, '2016-09-08 16:10:59', 'asha1', 'asha1', '2016-09-08 16:10:59'),
(1, 'asha1513', 1, 1, 1, 'Prakash', 'Patil', '', '1985-09-12', 31, 'Literate', 'Husband', 'qawsedrftgyh', 'Married', 4294967295, '2016-09-12 18:21:44', 'asha1', 'asha1', '2016-09-12 18:21:44'),
(1, 'asha1514', 1, 2, 1, 'Purushotam', 'More', '', '1982-09-12', 34, 'Literate', 'Husband', 'qawsedrftgyh', 'Married', 4294967295, '2016-09-12 18:25:56', 'asha1', 'asha1', '2016-09-12 18:25:56'),
(1, 'asha1517', 1, 2, 1, 'Sudas', 'Jadav', '', '1980-09-12', 36, 'Literate', 'Husband', 'qawsqawsedrf', 'Married', 4294967295, '2016-10-05 11:08:09', 'asha1', 'asha1', '2016-10-05 11:08:09');

-- --------------------------------------------------------

--
-- Table structure for table `hm_patient_vitals`
--

CREATE TABLE `hm_patient_vitals` (
  `id_Patient_Vitals` int(10) UNSIGNED NOT NULL,
  `Vitals_id` int(10) UNSIGNED NOT NULL,
  `Patient_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Vital_value` int(10) UNSIGNED DEFAULT NULL,
  `Created_By` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Examination_Date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_patient_vitals`
--

INSERT INTO `hm_patient_vitals` (`id_Patient_Vitals`, `Vitals_id`, `Patient_id`, `Vital_value`, `Created_By`, `Examination_Date`) VALUES
(247, 1, 'asha1510', 25, 'asha1', '2016-09-12 18:07:00'),
(248, 2, 'asha1510', 68, 'asha1', '2016-09-12 18:07:00'),
(249, 3, 'asha1510', 162, 'asha1', '2016-09-12 18:07:00'),
(250, 4, 'asha1510', 26, 'asha1', '2016-09-12 18:07:00'),
(251, 5, 'asha1510', 111, 'asha1', '2016-09-12 18:07:00'),
(252, 6, 'asha1510', 121, 'asha1', '2016-09-12 18:07:00'),
(253, 1, 'asha1510', 25, 'asha1', '2016-09-12 18:07:00'),
(254, 2, 'asha1510', 68, 'asha1', '2016-09-12 18:07:00'),
(255, 3, 'asha1510', 162, 'asha1', '2016-09-12 18:07:00'),
(256, 4, 'asha1510', 26, 'asha1', '2016-09-12 18:07:00'),
(257, 5, 'asha1510', 111, 'asha1', '2016-09-12 18:07:00'),
(258, 6, 'asha1510', 121, 'asha1', '2016-09-12 18:07:00'),
(259, 1, 'asha1512', 26, 'asha1', '2016-09-12 18:08:00'),
(260, 2, 'asha1512', 78, 'asha1', '2016-09-12 18:08:00'),
(261, 3, 'asha1512', 170, 'asha1', '2016-09-12 18:08:00'),
(262, 4, 'asha1512', 27, 'asha1', '2016-09-12 18:08:00'),
(263, 5, 'asha1512', 111, 'asha1', '2016-09-12 18:08:00'),
(264, 6, 'asha1512', 123, 'asha1', '2016-09-12 18:08:00'),
(265, 1, 'asha1510', 25, 'asha1', '2016-09-12 18:07:00'),
(266, 2, 'asha1510', 68, 'asha1', '2016-09-12 18:07:00'),
(267, 3, 'asha1510', 162, 'asha1', '2016-09-12 18:07:00'),
(268, 4, 'asha1510', 26, 'asha1', '2016-09-12 18:07:00'),
(269, 5, 'asha1510', 111, 'asha1', '2016-09-12 18:07:00'),
(270, 6, 'asha1510', 121, 'asha1', '2016-09-12 18:07:00'),
(271, 1, 'asha1512', 26, 'asha1', '2016-09-12 18:08:00'),
(272, 2, 'asha1512', 78, 'asha1', '2016-09-12 18:08:00'),
(273, 3, 'asha1512', 170, 'asha1', '2016-09-12 18:08:00'),
(274, 4, 'asha1512', 27, 'asha1', '2016-09-12 18:08:00'),
(275, 5, 'asha1512', 111, 'asha1', '2016-09-12 18:08:00'),
(276, 6, 'asha1512', 123, 'asha1', '2016-09-12 18:08:00'),
(277, 1, 'asha1510', 25, 'asha1', '2016-09-12 18:07:00'),
(278, 2, 'asha1510', 68, 'asha1', '2016-09-12 18:07:00'),
(279, 3, 'asha1510', 162, 'asha1', '2016-09-12 18:07:00'),
(280, 4, 'asha1510', 26, 'asha1', '2016-09-12 18:07:00'),
(281, 5, 'asha1510', 111, 'asha1', '2016-09-12 18:07:00'),
(282, 6, 'asha1510', 121, 'asha1', '2016-09-12 18:07:00'),
(283, 1, 'asha1512', 26, 'asha1', '2016-09-12 18:08:00'),
(284, 2, 'asha1512', 78, 'asha1', '2016-09-12 18:08:00'),
(285, 3, 'asha1512', 170, 'asha1', '2016-09-12 18:08:00'),
(286, 4, 'asha1512', 27, 'asha1', '2016-09-12 18:08:00'),
(287, 5, 'asha1512', 111, 'asha1', '2016-09-12 18:08:00'),
(288, 6, 'asha1512', 123, 'asha1', '2016-09-12 18:08:00'),
(289, 1, 'asha1510', 25, 'asha1', '2016-09-12 18:07:00'),
(290, 2, 'asha1510', 68, 'asha1', '2016-09-12 18:07:00'),
(291, 3, 'asha1510', 162, 'asha1', '2016-09-12 18:07:00'),
(292, 4, 'asha1510', 26, 'asha1', '2016-09-12 18:07:00'),
(293, 5, 'asha1510', 111, 'asha1', '2016-09-12 18:07:00'),
(294, 6, 'asha1510', 121, 'asha1', '2016-09-12 18:07:00'),
(295, 1, 'asha1512', 26, 'asha1', '2016-09-12 18:08:00'),
(296, 2, 'asha1512', 78, 'asha1', '2016-09-12 18:08:00'),
(297, 3, 'asha1512', 170, 'asha1', '2016-09-12 18:08:00'),
(298, 4, 'asha1512', 27, 'asha1', '2016-09-12 18:08:00'),
(299, 5, 'asha1512', 111, 'asha1', '2016-09-12 18:08:00'),
(300, 6, 'asha1512', 123, 'asha1', '2016-09-12 18:08:00'),
(301, 1, 'asha1510', 25, 'asha1', '2016-09-12 18:07:00'),
(302, 2, 'asha1510', 68, 'asha1', '2016-09-12 18:07:00'),
(303, 3, 'asha1510', 162, 'asha1', '2016-09-12 18:07:00'),
(304, 4, 'asha1510', 26, 'asha1', '2016-09-12 18:07:00'),
(305, 5, 'asha1510', 111, 'asha1', '2016-09-12 18:07:00'),
(306, 6, 'asha1510', 121, 'asha1', '2016-09-12 18:07:00'),
(307, 1, 'asha1512', 26, 'asha1', '2016-09-12 18:08:00'),
(308, 2, 'asha1512', 78, 'asha1', '2016-09-12 18:08:00'),
(309, 3, 'asha1512', 170, 'asha1', '2016-09-12 18:08:00'),
(310, 4, 'asha1512', 27, 'asha1', '2016-09-12 18:08:00'),
(311, 5, 'asha1512', 111, 'asha1', '2016-09-12 18:08:00'),
(312, 6, 'asha1512', 123, 'asha1', '2016-09-12 18:08:00'),
(313, 1, 'asha1510', 25, 'asha1', '2016-09-12 18:07:00'),
(314, 2, 'asha1510', 68, 'asha1', '2016-09-12 18:07:00'),
(315, 3, 'asha1510', 162, 'asha1', '2016-09-12 18:07:00'),
(316, 4, 'asha1510', 26, 'asha1', '2016-09-12 18:07:00'),
(317, 5, 'asha1510', 111, 'asha1', '2016-09-12 18:07:00'),
(318, 6, 'asha1510', 121, 'asha1', '2016-09-12 18:07:00'),
(319, 1, 'asha1512', 26, 'asha1', '2016-09-12 18:08:00'),
(320, 2, 'asha1512', 78, 'asha1', '2016-09-12 18:08:00'),
(321, 3, 'asha1512', 170, 'asha1', '2016-09-12 18:08:00'),
(322, 4, 'asha1512', 27, 'asha1', '2016-09-12 18:08:00'),
(323, 5, 'asha1512', 111, 'asha1', '2016-09-12 18:08:00'),
(324, 6, 'asha1512', 123, 'asha1', '2016-09-12 18:08:00'),
(325, 1, 'asha1510', 25, 'asha1', '2016-09-12 18:07:00'),
(326, 2, 'asha1510', 68, 'asha1', '2016-09-12 18:07:00'),
(327, 3, 'asha1510', 162, 'asha1', '2016-09-12 18:07:00'),
(328, 4, 'asha1510', 26, 'asha1', '2016-09-12 18:07:00'),
(329, 5, 'asha1510', 111, 'asha1', '2016-09-12 18:07:00'),
(330, 6, 'asha1510', 121, 'asha1', '2016-09-12 18:07:00'),
(331, 1, 'asha1512', 26, 'asha1', '2016-09-12 18:08:00'),
(332, 2, 'asha1512', 78, 'asha1', '2016-09-12 18:08:00'),
(333, 3, 'asha1512', 170, 'asha1', '2016-09-12 18:08:00'),
(334, 4, 'asha1512', 27, 'asha1', '2016-09-12 18:08:00'),
(335, 5, 'asha1512', 111, 'asha1', '2016-09-12 18:08:00'),
(336, 6, 'asha1512', 123, 'asha1', '2016-09-12 18:08:00'),
(337, 1, 'asha1510', 25, 'asha1', '2016-09-12 18:07:00'),
(338, 2, 'asha1510', 68, 'asha1', '2016-09-12 18:07:00'),
(339, 3, 'asha1510', 162, 'asha1', '2016-09-12 18:07:00'),
(340, 4, 'asha1510', 26, 'asha1', '2016-09-12 18:07:00'),
(341, 5, 'asha1510', 111, 'asha1', '2016-09-12 18:07:00'),
(342, 6, 'asha1510', 121, 'asha1', '2016-09-12 18:07:00'),
(343, 1, 'asha1512', 26, 'asha1', '2016-09-12 18:08:00'),
(344, 2, 'asha1512', 78, 'asha1', '2016-09-12 18:08:00'),
(345, 3, 'asha1512', 170, 'asha1', '2016-09-12 18:08:00'),
(346, 4, 'asha1512', 27, 'asha1', '2016-09-12 18:08:00'),
(347, 5, 'asha1512', 111, 'asha1', '2016-09-12 18:08:00'),
(348, 6, 'asha1512', 123, 'asha1', '2016-09-12 18:08:00');

-- --------------------------------------------------------

--
-- Table structure for table `hm_phc`
--

CREATE TABLE `hm_phc` (
  `PHC_ID` int(10) UNSIGNED NOT NULL,
  `PHC_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SelfLocationVillage` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_phc`
--

INSERT INTO `hm_phc` (`PHC_ID`, `PHC_NAME`, `SelfLocationVillage`) VALUES
(1, 'PHC-Sasoon-Pune', 3);

-- --------------------------------------------------------

--
-- Table structure for table `hm_phcdetails`
--

CREATE TABLE `hm_phcdetails` (
  `PhcDetailsId` int(10) UNSIGNED NOT NULL,
  `Village_id` int(10) UNSIGNED NOT NULL,
  `PHC_ID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_phcdetails`
--

INSERT INTO `hm_phcdetails` (`PhcDetailsId`, `Village_id`, `PHC_ID`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hm_phc_user`
--

CREATE TABLE `hm_phc_user` (
  `PHC_User_id` int(10) UNSIGNED NOT NULL,
  `PHC_ID` int(10) UNSIGNED DEFAULT NULL,
  `User_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_phc_user`
--

INSERT INTO `hm_phc_user` (`PHC_User_id`, `PHC_ID`, `User_id`) VALUES
(1, 1, 'ASHA1'),
(2, 1, 'MO1');

-- --------------------------------------------------------

--
-- Table structure for table `hm_pincode`
--

CREATE TABLE `hm_pincode` (
  `District_id` int(10) UNSIGNED NOT NULL,
  `City_id` int(10) UNSIGNED NOT NULL,
  `Country_ID` int(10) UNSIGNED NOT NULL,
  `State_ID` int(10) UNSIGNED NOT NULL,
  `PinCode` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `AreaName` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_pincode`
--

INSERT INTO `hm_pincode` (`District_id`, `City_id`, `Country_ID`, `State_ID`, `PinCode`, `AreaName`) VALUES
(1, 1, 1, 1, '41001', 'Pune station'),
(1, 1, 1, 1, '41002', 'Shivaji nagar'),
(1, 2, 1, 1, '41003', 'khadki'),
(1, 2, 1, 1, '41004', 'Sangavi');

-- --------------------------------------------------------

--
-- Table structure for table `hm_procedures`
--

CREATE TABLE `hm_procedures` (
  `Procedure_id` int(10) UNSIGNED NOT NULL,
  `ProcedureType` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_procedures`
--

INSERT INTO `hm_procedures` (`Procedure_id`, `ProcedureType`) VALUES
(1, 'Abortion 2nd Trimester'),
(2, 'Appendectomy'),
(3, 'Bone Biopsy');

-- --------------------------------------------------------

--
-- Table structure for table `hm_programs`
--

CREATE TABLE `hm_programs` (
  `Programs_id` int(10) UNSIGNED NOT NULL,
  `Program_desc` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Program_start_date` date DEFAULT NULL,
  `Program_end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_programs`
--

INSERT INTO `hm_programs` (`Programs_id`, `Program_desc`, `Program_start_date`, `Program_end_date`) VALUES
(1, 'Pregnancy program', '2016-07-01', '2016-08-31');

-- --------------------------------------------------------

--
-- Table structure for table `hm_program_details`
--

CREATE TABLE `hm_program_details` (
  `Program_Details_id` int(10) UNSIGNED NOT NULL,
  `Programs_id` int(10) UNSIGNED NOT NULL,
  `Program_item_id` int(10) UNSIGNED NOT NULL,
  `Program_item_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Program_item_description` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Program_item_data_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Created_By` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Updated_By` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Created_Date` datetime DEFAULT NULL,
  `Updated_Date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_program_details`
--

INSERT INTO `hm_program_details` (`Program_Details_id`, `Programs_id`, `Program_item_id`, `Program_item_name`, `Program_item_description`, `Program_item_data_type`, `Created_By`, `Updated_By`, `Created_Date`, `Updated_Date`) VALUES
(1, 1, 1, 'LMPDate', 'Last menstural period date of patient', 'datetime', '1', NULL, '2016-07-01 00:00:00', NULL),
(2, 1, 2, 'EDD', 'Expected delivery date of patient', 'datetime', '1', NULL, '2016-07-01 00:00:00', NULL),
(3, 1, 3, 'isFirstPregnancy', 'Patient''s first pregnancy', 'boolean', '1', NULL, '2016-07-01 00:00:00', NULL),
(4, 1, 4, 'gravida', 'Gravida of patient', 'integer', '1', NULL, '2016-07-01 00:00:00', NULL),
(5, 1, 5, 'parity', 'Parity of patient', 'integer', '1', NULL, '2016-07-01 00:00:00', NULL),
(6, 1, 6, 'pastAbortions', 'If patient has past abortions', 'integer', '1', NULL, '2016-07-01 00:00:00', NULL),
(7, 1, 7, 'pastStillBirths', 'Patient''s previous still births', 'integer', '1', NULL, '2016-07-01 00:00:00', NULL),
(8, 1, 8, 'livingChildren', 'Patient''s living children', 'integer', '1', NULL, '2016-07-01 00:00:00', NULL),
(9, 1, 9, 'natureofPreviousDelivery', 'Patient''s previous pregnancy nature', 'varchar', '1', NULL, '2016-07-01 00:00:00', NULL),
(10, 1, 10, 'previousDeliveryDate', 'Patient''s last pregnancy date', 'datetime', '1', NULL, '2016-07-01 00:00:00', NULL),
(11, 1, 11, 'notes', 'Any notes related to patient', 'varchar', '1', NULL, '2016-07-01 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hm_program_details_transactions`
--

CREATE TABLE `hm_program_details_transactions` (
  `Program_details_Transactions_id` int(10) UNSIGNED NOT NULL,
  `Programs_id` int(10) UNSIGNED NOT NULL,
  `Program_Details_id` int(10) UNSIGNED NOT NULL,
  `Patient_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Program_item_id` int(10) UNSIGNED DEFAULT NULL,
  `Program_item_value` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Created_Date` datetime DEFAULT NULL,
  `Updated_Date` datetime DEFAULT NULL,
  `Created_By` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Updated_By` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_program_details_transactions`
--

INSERT INTO `hm_program_details_transactions` (`Program_details_Transactions_id`, `Programs_id`, `Program_Details_id`, `Patient_id`, `Program_item_id`, `Program_item_value`, `Created_Date`, `Updated_Date`, `Created_By`, `Updated_By`) VALUES
(342, 1, 1, 'asha1510', 1, '2016-08-29', '2016-09-08 15:59:41', '2016-09-08 15:59:41', 'asha1', 'asha1'),
(343, 1, 2, 'asha1510', 2, '2017-06-05', '2016-09-08 15:59:41', '2016-09-08 15:59:41', 'asha1', 'asha1'),
(344, 1, 3, 'asha1510', 3, 'true', '2016-09-08 15:59:41', '2016-09-08 15:59:41', 'asha1', 'asha1'),
(345, 1, 4, 'asha11', 2, '2016-02-21', '2016-09-08 15:59:41', '2016-09-08 15:59:41', 'asha1', 'asha1'),
(346, 1, 5, 'asha1444', 2, '2016-03-08', '2016-09-08 15:59:41', '2016-09-08 15:59:41', 'asha1', 'asha1'),
(347, 1, 6, 'asha1514', 2, '2016-11-11', '2016-09-08 15:59:41', '2016-09-08 15:59:41', 'asha1', 'asha1'),
(348, 1, 7, 'asha1111', 2, '2016-12-21', '2016-09-08 15:59:41', '2016-09-08 15:59:41', 'asha1', 'asha1'),
(349, 1, 8, 'asha1283', 2, '2016-10-02', '2016-09-08 15:59:41', '2016-09-08 15:59:41', 'asha1', 'asha1'),
(350, 1, 9, 'asha4207', 2, '2016-06-22', '2016-09-08 15:59:41', '2016-09-08 15:59:41', 'asha1', 'asha1'),
(351, 1, 10, 'asha1510', 10, '0000-00-00', '2016-09-08 15:59:41', '2016-09-08 15:59:41', 'asha1', 'asha1'),
(352, 1, 11, 'asha1510', 11, '', '2016-09-08 15:59:41', '2016-09-08 15:59:41', 'asha1', 'asha1'),
(353, 1, 1, 'asha1511', 1, '2016-09-01', '2016-09-08 16:05:54', '2016-09-08 16:05:54', 'asha1', 'asha1'),
(354, 1, 2, 'asha1511', 2, '2017-06-08', '2016-09-08 16:05:54', '2016-09-08 16:05:54', 'asha1', 'asha1'),
(355, 1, 3, 'asha1511', 3, 'true', '2016-09-08 16:05:54', '2016-09-08 16:05:54', 'asha1', 'asha1'),
(356, 1, 4, 'asha1511', 4, '0', '2016-09-08 16:05:54', '2016-09-08 16:05:54', 'asha1', 'asha1'),
(357, 1, 5, 'asha1511', 5, '0', '2016-09-08 16:05:54', '2016-09-08 16:05:54', 'asha1', 'asha1'),
(358, 1, 6, 'asha1511', 6, '0', '2016-09-08 16:05:54', '2016-09-08 16:05:54', 'asha1', 'asha1'),
(359, 1, 7, 'asha1511', 7, '0', '2016-09-08 16:05:54', '2016-09-08 16:05:54', 'asha1', 'asha1'),
(360, 1, 8, 'asha1511', 8, '0', '2016-09-08 16:05:54', '2016-09-08 16:05:54', 'asha1', 'asha1'),
(361, 1, 9, 'asha1511', 9, '', '2016-09-08 16:05:54', '2016-09-08 16:05:54', 'asha1', 'asha1'),
(362, 1, 10, 'asha1511', 10, '0000-00-00', '2016-09-08 16:05:54', '2016-09-08 16:05:54', 'asha1', 'asha1'),
(363, 1, 11, 'asha1511', 11, '', '2016-09-08 16:05:54', '2016-09-08 16:05:54', 'asha1', 'asha1'),
(364, 1, 1, 'asha1512', 1, '2016-09-06', '2016-09-08 16:10:59', '2016-09-08 16:10:59', 'asha1', 'asha1'),
(365, 1, 2, 'asha1512', 2, '2017-06-13', '2016-09-08 16:10:59', '2016-09-08 16:10:59', 'asha1', 'asha1'),
(366, 1, 3, 'asha1512', 3, 'true', '2016-09-08 16:10:59', '2016-09-08 16:10:59', 'asha1', 'asha1'),
(367, 1, 4, 'asha1512', 4, '0', '2016-09-08 16:10:59', '2016-09-08 16:10:59', 'asha1', 'asha1'),
(368, 1, 5, 'asha1512', 5, '0', '2016-09-08 16:10:59', '2016-09-08 16:10:59', 'asha1', 'asha1'),
(369, 1, 6, 'asha1512', 6, '0', '2016-09-08 16:10:59', '2016-09-08 16:10:59', 'asha1', 'asha1'),
(370, 1, 7, 'asha1512', 7, '0', '2016-09-08 16:10:59', '2016-09-08 16:10:59', 'asha1', 'asha1'),
(371, 1, 8, 'asha1512', 8, '0', '2016-09-08 16:10:59', '2016-09-08 16:10:59', 'asha1', 'asha1'),
(372, 1, 9, 'asha1512', 9, '', '2016-09-08 16:10:59', '2016-09-08 16:10:59', 'asha1', 'asha1'),
(373, 1, 10, 'asha1512', 10, '0000-00-00', '2016-09-08 16:10:59', '2016-09-08 16:10:59', 'asha1', 'asha1'),
(374, 1, 11, 'asha1512', 11, '', '2016-09-08 16:10:59', '2016-09-08 16:10:59', 'asha1', 'asha1'),
(375, 1, 1, 'asha1513', 1, '2016-09-01', '2016-09-12 18:21:44', '2016-09-12 18:21:44', 'asha1', 'asha1'),
(376, 1, 2, 'asha1513', 2, '2017-06-08', '2016-09-12 18:21:44', '2016-09-12 18:21:44', 'asha1', 'asha1'),
(377, 1, 3, 'asha1513', 3, 'true', '2016-09-12 18:21:44', '2016-09-12 18:21:44', 'asha1', 'asha1'),
(378, 1, 4, 'asha1513', 4, '0', '2016-09-12 18:21:44', '2016-09-12 18:21:44', 'asha1', 'asha1'),
(379, 1, 5, 'asha1513', 5, '0', '2016-09-12 18:21:44', '2016-09-12 18:21:44', 'asha1', 'asha1'),
(380, 1, 6, 'asha1513', 6, '0', '2016-09-12 18:21:44', '2016-09-12 18:21:44', 'asha1', 'asha1'),
(381, 1, 7, 'asha1513', 7, '0', '2016-09-12 18:21:44', '2016-09-12 18:21:44', 'asha1', 'asha1'),
(382, 1, 8, 'asha1513', 8, '0', '2016-09-12 18:21:44', '2016-09-12 18:21:44', 'asha1', 'asha1'),
(383, 1, 9, 'asha1513', 9, '', '2016-09-12 18:21:44', '2016-09-12 18:21:44', 'asha1', 'asha1'),
(384, 1, 10, 'asha1513', 10, '0000-00-00', '2016-09-12 18:21:44', '2016-09-12 18:21:44', 'asha1', 'asha1'),
(385, 1, 11, 'asha1513', 11, '', '2016-09-12 18:21:44', '2016-09-12 18:21:44', 'asha1', 'asha1'),
(386, 1, 1, 'asha1514', 1, '2016-08-08', '2016-09-12 18:25:56', '2016-09-12 18:25:56', 'asha1', 'asha1'),
(387, 1, 2, 'asha1514', 2, '2017-05-15', '2016-09-12 18:25:56', '2016-09-12 18:25:56', 'asha1', 'asha1'),
(388, 1, 3, 'asha1514', 3, 'true', '2016-09-12 18:25:56', '2016-09-12 18:25:56', 'asha1', 'asha1'),
(389, 1, 4, 'asha1514', 4, '0', '2016-09-12 18:25:56', '2016-09-12 18:25:56', 'asha1', 'asha1'),
(390, 1, 5, 'asha1514', 5, '0', '2016-09-12 18:25:56', '2016-09-12 18:25:56', 'asha1', 'asha1'),
(391, 1, 6, 'asha1514', 6, '0', '2016-09-12 18:25:56', '2016-09-12 18:25:56', 'asha1', 'asha1'),
(392, 1, 7, 'asha1514', 7, '0', '2016-09-12 18:25:56', '2016-09-12 18:25:56', 'asha1', 'asha1'),
(393, 1, 8, 'asha1514', 8, '0', '2016-09-12 18:25:56', '2016-09-12 18:25:56', 'asha1', 'asha1'),
(394, 1, 9, 'asha1514', 9, '', '2016-09-12 18:25:56', '2016-09-12 18:25:56', 'asha1', 'asha1'),
(395, 1, 10, 'asha1514', 10, '0000-00-00', '2016-09-12 18:25:56', '2016-09-12 18:25:56', 'asha1', 'asha1'),
(396, 1, 11, 'asha1514', 11, '', '2016-09-12 18:25:56', '2016-09-12 18:25:56', 'asha1', 'asha1'),
(397, 1, 1, 'asha1517', 1, '2016-08-11', '2016-10-05 11:08:09', '2016-10-05 11:08:09', 'asha1', 'asha1'),
(398, 1, 2, 'asha1517', 2, '2017-05-18', '2016-10-05 11:08:09', '2016-10-05 11:08:09', 'asha1', 'asha1'),
(399, 1, 3, 'asha1517', 3, 'true', '2016-10-05 11:08:09', '2016-10-05 11:08:09', 'asha1', 'asha1'),
(400, 1, 4, 'asha1517', 4, '0', '2016-10-05 11:08:09', '2016-10-05 11:08:09', 'asha1', 'asha1'),
(401, 1, 5, 'asha1517', 5, '0', '2016-10-05 11:08:09', '2016-10-05 11:08:09', 'asha1', 'asha1'),
(402, 1, 6, 'asha1517', 6, '0', '2016-10-05 11:08:09', '2016-10-05 11:08:09', 'asha1', 'asha1'),
(403, 1, 7, 'asha1517', 7, '0', '2016-10-05 11:08:09', '2016-10-05 11:08:09', 'asha1', 'asha1'),
(404, 1, 8, 'asha1517', 8, '0', '2016-10-05 11:08:09', '2016-10-05 11:08:09', 'asha1', 'asha1'),
(405, 1, 9, 'asha1517', 9, '', '2016-10-05 11:08:09', '2016-10-05 11:08:09', 'asha1', 'asha1'),
(406, 1, 10, 'asha1517', 10, '0000-00-00', '2016-10-05 11:08:09', '2016-10-05 11:08:09', 'asha1', 'asha1'),
(407, 1, 11, 'asha1517', 11, '', '2016-10-05 11:08:09', '2016-10-05 11:08:09', 'asha1', 'asha1'),
(408, 1, 1, 'asha11', 1, '2016-11-09', '2016-11-11 18:08:57', '2016-11-11 18:08:57', 'asha1', 'asha1'),
(409, 1, 2, 'asha11', 2, '2017-08-16', '2016-11-11 18:08:57', '2016-11-11 18:08:57', 'asha1', 'asha1'),
(410, 1, 3, 'asha11', 3, 'true', '2016-11-11 18:08:57', '2016-11-11 18:08:57', 'asha1', 'asha1'),
(411, 1, 4, 'asha11', 4, '0', '2016-11-11 18:08:57', '2016-11-11 18:08:57', 'asha1', 'asha1'),
(412, 1, 5, 'asha11', 5, '0', '2016-11-11 18:08:57', '2016-11-11 18:08:57', 'asha1', 'asha1'),
(413, 1, 6, 'asha11', 6, '0', '2016-11-11 18:08:57', '2016-11-11 18:08:57', 'asha1', 'asha1'),
(414, 1, 7, 'asha11', 7, '0', '2016-11-11 18:08:57', '2016-11-11 18:08:57', 'asha1', 'asha1'),
(415, 1, 8, 'asha11', 8, '0', '2016-11-11 18:08:57', '2016-11-11 18:08:57', 'asha1', 'asha1'),
(416, 1, 9, 'asha11', 9, '', '2016-11-11 18:08:57', '2016-11-11 18:08:57', 'asha1', 'asha1'),
(417, 1, 10, 'asha11', 10, '0000-00-00', '2016-11-11 18:08:57', '2016-11-11 18:08:57', 'asha1', 'asha1'),
(418, 1, 11, 'asha11', 11, '', '2016-11-11 18:08:57', '2016-11-11 18:08:57', 'asha1', 'asha1'),
(419, 1, 1, 'asha1283', 1, '2016-11-11', '2016-11-15 13:43:45', '2016-11-15 13:43:45', 'asha1', 'asha1'),
(420, 1, 2, 'asha1283', 2, '2017-08-18', '2016-11-15 13:43:45', '2016-11-15 13:43:45', 'asha1', 'asha1'),
(421, 1, 3, 'asha1283', 3, 'true', '2016-11-15 13:43:45', '2016-11-15 13:43:45', 'asha1', 'asha1'),
(422, 1, 4, 'asha1283', 4, '0', '2016-11-15 13:43:45', '2016-11-15 13:43:45', 'asha1', 'asha1'),
(423, 1, 5, 'asha1283', 5, '0', '2016-11-15 13:43:45', '2016-11-15 13:43:45', 'asha1', 'asha1'),
(424, 1, 6, 'asha1283', 6, '0', '2016-11-15 13:43:45', '2016-11-15 13:43:45', 'asha1', 'asha1'),
(425, 1, 7, 'asha1283', 7, '0', '2016-11-15 13:43:45', '2016-11-15 13:43:45', 'asha1', 'asha1'),
(426, 1, 8, 'asha1283', 8, '0', '2016-11-15 13:43:45', '2016-11-15 13:43:45', 'asha1', 'asha1'),
(427, 1, 9, 'asha1283', 9, '', '2016-11-15 13:43:45', '2016-11-15 13:43:45', 'asha1', 'asha1'),
(428, 1, 10, 'asha1283', 10, '0000-00-00', '2016-11-15 13:43:45', '2016-11-15 13:43:45', 'asha1', 'asha1'),
(429, 1, 11, 'asha1283', 11, '', '2016-11-15 13:43:45', '2016-11-15 13:43:45', 'asha1', 'asha1'),
(430, 1, 1, 'asha11', 1, '2016-08-14', '2016-12-01 14:49:09', '2016-12-01 14:49:09', 'asha1', 'asha1'),
(431, 1, 2, 'asha11', 2, '2017-05-21', '2016-12-01 14:49:09', '2016-12-01 14:49:09', 'asha1', 'asha1'),
(432, 1, 3, 'asha11', 3, 'true', '2016-12-01 14:49:09', '2016-12-01 14:49:09', 'asha1', 'asha1'),
(433, 1, 4, 'asha11', 4, '0', '2016-12-01 14:49:09', '2016-12-01 14:49:09', 'asha1', 'asha1'),
(434, 1, 5, 'asha11', 5, '0', '2016-12-01 14:49:09', '2016-12-01 14:49:09', 'asha1', 'asha1'),
(435, 1, 6, 'asha11', 6, '0', '2016-12-01 14:49:09', '2016-12-01 14:49:09', 'asha1', 'asha1'),
(436, 1, 7, 'asha11', 7, '0', '2016-12-01 14:49:09', '2016-12-01 14:49:09', 'asha1', 'asha1'),
(437, 1, 8, 'asha11', 8, '0', '2016-12-01 14:49:09', '2016-12-01 14:49:09', 'asha1', 'asha1'),
(438, 1, 9, 'asha11', 9, '', '2016-12-01 14:49:09', '2016-12-01 14:49:09', 'asha1', 'asha1'),
(439, 1, 10, 'asha11', 10, '0000-00-00', '2016-12-01 14:49:09', '2016-12-01 14:49:09', 'asha1', 'asha1'),
(440, 1, 11, 'asha11', 11, '', '2016-12-01 14:49:09', '2016-12-01 14:49:09', 'asha1', 'asha1'),
(441, 1, 1, 'asha11', 1, '2016-09-04', '2016-12-05 17:37:21', '2016-12-05 17:37:21', 'asha1', 'asha1'),
(442, 1, 2, 'asha11', 2, '2017-06-11', '2016-12-05 17:37:21', '2016-12-05 17:37:21', 'asha1', 'asha1'),
(443, 1, 3, 'asha11', 3, 'true', '2016-12-05 17:37:21', '2016-12-05 17:37:21', 'asha1', 'asha1'),
(444, 1, 4, 'asha11', 4, '0', '2016-12-05 17:37:21', '2016-12-05 17:37:21', 'asha1', 'asha1'),
(445, 1, 5, 'asha11', 5, '0', '2016-12-05 17:37:21', '2016-12-05 17:37:21', 'asha1', 'asha1'),
(446, 1, 6, 'asha11', 6, '0', '2016-12-05 17:37:21', '2016-12-05 17:37:21', 'asha1', 'asha1'),
(447, 1, 7, 'asha11', 7, '0', '2016-12-05 17:37:21', '2016-12-05 17:37:21', 'asha1', 'asha1'),
(448, 1, 8, 'asha11', 8, '0', '2016-12-05 17:37:21', '2016-12-05 17:37:21', 'asha1', 'asha1'),
(449, 1, 9, 'asha11', 9, '', '2016-12-05 17:37:21', '2016-12-05 17:37:21', 'asha1', 'asha1'),
(450, 1, 10, 'asha11', 10, '0000-00-00', '2016-12-05 17:37:21', '2016-12-05 17:37:21', 'asha1', 'asha1'),
(451, 1, 11, 'asha11', 11, '', '2016-12-05 17:37:21', '2016-12-05 17:37:21', 'asha1', 'asha1'),
(452, 1, 1, 'asha11', 1, '2016-09-12', '2016-12-08 17:42:02', '2016-12-08 17:42:02', 'asha1', 'asha1'),
(453, 1, 2, 'asha11', 2, '2017-06-19', '2016-12-08 17:42:02', '2016-12-08 17:42:02', 'asha1', 'asha1'),
(454, 1, 3, 'asha11', 3, 'true', '2016-12-08 17:42:02', '2016-12-08 17:42:02', 'asha1', 'asha1'),
(455, 1, 4, 'asha11', 4, '0', '2016-12-08 17:42:02', '2016-12-08 17:42:02', 'asha1', 'asha1'),
(456, 1, 5, 'asha11', 5, '0', '2016-12-08 17:42:02', '2016-12-08 17:42:02', 'asha1', 'asha1'),
(457, 1, 6, 'asha11', 6, '0', '2016-12-08 17:42:02', '2016-12-08 17:42:02', 'asha1', 'asha1'),
(458, 1, 7, 'asha11', 7, '0', '2016-12-08 17:42:02', '2016-12-08 17:42:02', 'asha1', 'asha1'),
(459, 1, 8, 'asha11', 8, '0', '2016-12-08 17:42:02', '2016-12-08 17:42:02', 'asha1', 'asha1'),
(460, 1, 9, 'asha11', 9, '', '2016-12-08 17:42:02', '2016-12-08 17:42:02', 'asha1', 'asha1'),
(461, 1, 10, 'asha11', 10, '0000-00-00', '2016-12-08 17:42:02', '2016-12-08 17:42:02', 'asha1', 'asha1'),
(462, 1, 11, 'asha11', 11, '', '2016-12-08 17:42:02', '2016-12-08 17:42:02', 'asha1', 'asha1'),
(463, 1, 1, 'asha11', 1, '2016-09-11', '2016-12-09 10:48:39', '2016-12-09 10:48:39', 'asha1', 'asha1'),
(464, 1, 2, 'asha11', 2, '2017-06-18', '2016-12-09 10:48:39', '2016-12-09 10:48:39', 'asha1', 'asha1'),
(465, 1, 3, 'asha11', 3, 'true', '2016-12-09 10:48:39', '2016-12-09 10:48:39', 'asha1', 'asha1'),
(466, 1, 4, 'asha11', 4, '0', '2016-12-09 10:48:39', '2016-12-09 10:48:39', 'asha1', 'asha1'),
(467, 1, 5, 'asha11', 5, '0', '2016-12-09 10:48:39', '2016-12-09 10:48:39', 'asha1', 'asha1'),
(468, 1, 6, 'asha11', 6, '0', '2016-12-09 10:48:39', '2016-12-09 10:48:39', 'asha1', 'asha1'),
(469, 1, 7, 'asha11', 7, '0', '2016-12-09 10:48:39', '2016-12-09 10:48:39', 'asha1', 'asha1'),
(470, 1, 8, 'asha11', 8, '0', '2016-12-09 10:48:39', '2016-12-09 10:48:39', 'asha1', 'asha1'),
(471, 1, 9, 'asha11', 9, '', '2016-12-09 10:48:39', '2016-12-09 10:48:39', 'asha1', 'asha1'),
(472, 1, 10, 'asha11', 10, '0000-00-00', '2016-12-09 10:48:39', '2016-12-09 10:48:39', 'asha1', 'asha1'),
(473, 1, 11, 'asha11', 11, '', '2016-12-09 10:48:39', '2016-12-09 10:48:39', 'asha1', 'asha1'),
(474, 1, 1, 'asha11', 1, '2016-09-11', '2016-12-09 16:33:51', '2016-12-09 16:33:51', 'asha1', 'asha1'),
(475, 1, 2, 'asha11', 2, '2017-06-18', '2016-12-09 16:33:51', '2016-12-09 16:33:51', 'asha1', 'asha1'),
(476, 1, 3, 'asha11', 3, 'true', '2016-12-09 16:33:51', '2016-12-09 16:33:51', 'asha1', 'asha1'),
(477, 1, 4, 'asha11', 4, '0', '2016-12-09 16:33:51', '2016-12-09 16:33:51', 'asha1', 'asha1'),
(478, 1, 5, 'asha11', 5, '0', '2016-12-09 16:33:51', '2016-12-09 16:33:51', 'asha1', 'asha1'),
(479, 1, 6, 'asha11', 6, '0', '2016-12-09 16:33:51', '2016-12-09 16:33:51', 'asha1', 'asha1'),
(480, 1, 7, 'asha11', 7, '0', '2016-12-09 16:33:51', '2016-12-09 16:33:51', 'asha1', 'asha1'),
(481, 1, 8, 'asha11', 8, '0', '2016-12-09 16:33:51', '2016-12-09 16:33:51', 'asha1', 'asha1'),
(482, 1, 9, 'asha11', 9, '', '2016-12-09 16:33:51', '2016-12-09 16:33:51', 'asha1', 'asha1'),
(483, 1, 10, 'asha11', 10, '0000-00-00', '2016-12-09 16:33:51', '2016-12-09 16:33:51', 'asha1', 'asha1'),
(484, 1, 11, 'asha11', 11, '', '2016-12-09 16:33:51', '2016-12-09 16:33:51', 'asha1', 'asha1'),
(485, 1, 1, 'asha11', 1, '2016-09-11', '2016-12-09 16:40:34', '2016-12-09 16:40:34', 'asha1', 'asha1'),
(486, 1, 2, 'asha11', 2, '2017-06-18', '2016-12-09 16:40:34', '2016-12-09 16:40:34', 'asha1', 'asha1'),
(487, 1, 3, 'asha11', 3, 'true', '2016-12-09 16:40:34', '2016-12-09 16:40:34', 'asha1', 'asha1'),
(488, 1, 4, 'asha11', 4, '0', '2016-12-09 16:40:34', '2016-12-09 16:40:34', 'asha1', 'asha1'),
(489, 1, 5, 'asha11', 5, '0', '2016-12-09 16:40:34', '2016-12-09 16:40:34', 'asha1', 'asha1'),
(490, 1, 6, 'asha11', 6, '0', '2016-12-09 16:40:34', '2016-12-09 16:40:34', 'asha1', 'asha1'),
(491, 1, 7, 'asha11', 7, '0', '2016-12-09 16:40:34', '2016-12-09 16:40:34', 'asha1', 'asha1'),
(492, 1, 8, 'asha11', 8, '0', '2016-12-09 16:40:34', '2016-12-09 16:40:34', 'asha1', 'asha1'),
(493, 1, 9, 'asha11', 9, '', '2016-12-09 16:40:34', '2016-12-09 16:40:34', 'asha1', 'asha1'),
(494, 1, 10, 'asha11', 10, '0000-00-00', '2016-12-09 16:40:34', '2016-12-09 16:40:34', 'asha1', 'asha1'),
(495, 1, 11, 'asha11', 11, '', '2016-12-09 16:40:34', '2016-12-09 16:40:34', 'asha1', 'asha1'),
(496, 1, 1, 'asha11', 1, '2016-10-02', '2016-12-09 16:44:49', '2016-12-09 16:44:49', 'asha1', 'asha1'),
(497, 1, 2, 'asha11', 2, '2017-07-09', '2016-12-09 16:44:49', '2016-12-09 16:44:49', 'asha1', 'asha1'),
(498, 1, 3, 'asha11', 3, 'true', '2016-12-09 16:44:49', '2016-12-09 16:44:49', 'asha1', 'asha1'),
(499, 1, 4, 'asha11', 4, '0', '2016-12-09 16:44:49', '2016-12-09 16:44:49', 'asha1', 'asha1'),
(500, 1, 5, 'asha11', 5, '0', '2016-12-09 16:44:49', '2016-12-09 16:44:49', 'asha1', 'asha1'),
(501, 1, 6, 'asha11', 6, '0', '2016-12-09 16:44:49', '2016-12-09 16:44:49', 'asha1', 'asha1'),
(502, 1, 7, 'asha11', 7, '0', '2016-12-09 16:44:49', '2016-12-09 16:44:49', 'asha1', 'asha1'),
(503, 1, 8, 'asha11', 8, '0', '2016-12-09 16:44:49', '2016-12-09 16:44:49', 'asha1', 'asha1'),
(504, 1, 9, 'asha11', 9, '', '2016-12-09 16:44:49', '2016-12-09 16:44:49', 'asha1', 'asha1'),
(505, 1, 10, 'asha11', 10, '0000-00-00', '2016-12-09 16:44:49', '2016-12-09 16:44:49', 'asha1', 'asha1'),
(506, 1, 11, 'asha11', 11, '', '2016-12-09 16:44:49', '2016-12-09 16:44:49', 'asha1', 'asha1'),
(507, 1, 1, 'asha11', 1, '2016-10-09', '2016-12-09 17:28:58', '2016-12-09 17:28:58', 'asha1', 'asha1'),
(508, 1, 2, 'asha11', 2, '2017-07-16', '2016-12-09 17:28:58', '2016-12-09 17:28:58', 'asha1', 'asha1'),
(509, 1, 3, 'asha11', 3, 'true', '2016-12-09 17:28:58', '2016-12-09 17:28:58', 'asha1', 'asha1'),
(510, 1, 4, 'asha11', 4, '0', '2016-12-09 17:28:58', '2016-12-09 17:28:58', 'asha1', 'asha1'),
(511, 1, 5, 'asha11', 5, '0', '2016-12-09 17:28:58', '2016-12-09 17:28:58', 'asha1', 'asha1'),
(512, 1, 6, 'asha11', 6, '0', '2016-12-09 17:28:58', '2016-12-09 17:28:58', 'asha1', 'asha1'),
(513, 1, 7, 'asha11', 7, '0', '2016-12-09 17:28:58', '2016-12-09 17:28:58', 'asha1', 'asha1'),
(514, 1, 8, 'asha11', 8, '0', '2016-12-09 17:28:58', '2016-12-09 17:28:58', 'asha1', 'asha1'),
(515, 1, 9, 'asha11', 9, '', '2016-12-09 17:28:58', '2016-12-09 17:28:58', 'asha1', 'asha1'),
(516, 1, 10, 'asha11', 10, '0000-00-00', '2016-12-09 17:28:58', '2016-12-09 17:28:58', 'asha1', 'asha1'),
(517, 1, 11, 'asha11', 11, '', '2016-12-09 17:28:58', '2016-12-09 17:28:58', 'asha1', 'asha1'),
(518, 1, 1, 'asha11', 1, '2016-11-13', '2016-12-12 12:40:13', '2016-12-12 12:40:13', 'asha1', 'asha1'),
(519, 1, 2, 'asha11', 2, '2017-08-20', '2016-12-12 12:40:13', '2016-12-12 12:40:13', 'asha1', 'asha1'),
(520, 1, 3, 'asha11', 3, 'true', '2016-12-12 12:40:13', '2016-12-12 12:40:13', 'asha1', 'asha1'),
(521, 1, 4, 'asha11', 4, '0', '2016-12-12 12:40:13', '2016-12-12 12:40:13', 'asha1', 'asha1'),
(522, 1, 5, 'asha11', 5, '0', '2016-12-12 12:40:13', '2016-12-12 12:40:13', 'asha1', 'asha1'),
(523, 1, 6, 'asha11', 6, '0', '2016-12-12 12:40:13', '2016-12-12 12:40:13', 'asha1', 'asha1'),
(524, 1, 7, 'asha11', 7, '0', '2016-12-12 12:40:13', '2016-12-12 12:40:13', 'asha1', 'asha1'),
(525, 1, 8, 'asha11', 8, '0', '2016-12-12 12:40:13', '2016-12-12 12:40:13', 'asha1', 'asha1'),
(526, 1, 9, 'asha11', 9, '', '2016-12-12 12:40:13', '2016-12-12 12:40:13', 'asha1', 'asha1'),
(527, 1, 10, 'asha11', 10, '0000-00-00', '2016-12-12 12:40:13', '2016-12-12 12:40:13', 'asha1', 'asha1'),
(528, 1, 11, 'asha11', 11, '', '2016-12-12 12:40:13', '2016-12-12 12:40:13', 'asha1', 'asha1'),
(529, 1, 1, 'asha11', 1, '2016-12-04', '2016-12-12 14:33:48', '2016-12-12 14:33:48', 'asha1', 'asha1'),
(530, 1, 2, 'asha11', 2, '2017-09-10', '2016-12-12 14:33:48', '2016-12-12 14:33:48', 'asha1', 'asha1'),
(531, 1, 3, 'asha11', 3, 'true', '2016-12-12 14:33:48', '2016-12-12 14:33:48', 'asha1', 'asha1'),
(532, 1, 4, 'asha11', 4, '0', '2016-12-12 14:33:48', '2016-12-12 14:33:48', 'asha1', 'asha1'),
(533, 1, 5, 'asha11', 5, '0', '2016-12-12 14:33:48', '2016-12-12 14:33:48', 'asha1', 'asha1'),
(534, 1, 6, 'asha11', 6, '0', '2016-12-12 14:33:48', '2016-12-12 14:33:48', 'asha1', 'asha1'),
(535, 1, 7, 'asha11', 7, '0', '2016-12-12 14:33:48', '2016-12-12 14:33:48', 'asha1', 'asha1'),
(536, 1, 8, 'asha11', 8, '0', '2016-12-12 14:33:48', '2016-12-12 14:33:48', 'asha1', 'asha1'),
(537, 1, 9, 'asha11', 9, '', '2016-12-12 14:33:48', '2016-12-12 14:33:48', 'asha1', 'asha1'),
(538, 1, 10, 'asha11', 10, '0000-00-00', '2016-12-12 14:33:48', '2016-12-12 14:33:48', 'asha1', 'asha1'),
(539, 1, 11, 'asha11', 11, '', '2016-12-12 14:33:48', '2016-12-12 14:33:48', 'asha1', 'asha1'),
(540, 1, 1, 'asha11', 1, '2016-11-07', '2016-12-12 15:33:43', '2016-12-12 15:33:43', 'asha1', 'asha1'),
(541, 1, 2, 'asha11', 2, '2017-08-14', '2016-12-12 15:33:43', '2016-12-12 15:33:43', 'asha1', 'asha1'),
(542, 1, 3, 'asha11', 3, 'true', '2016-12-12 15:33:43', '2016-12-12 15:33:43', 'asha1', 'asha1'),
(543, 1, 4, 'asha11', 4, '0', '2016-12-12 15:33:43', '2016-12-12 15:33:43', 'asha1', 'asha1'),
(544, 1, 5, 'asha11', 5, '0', '2016-12-12 15:33:43', '2016-12-12 15:33:43', 'asha1', 'asha1'),
(545, 1, 6, 'asha11', 6, '0', '2016-12-12 15:33:43', '2016-12-12 15:33:43', 'asha1', 'asha1'),
(546, 1, 7, 'asha11', 7, '0', '2016-12-12 15:33:43', '2016-12-12 15:33:43', 'asha1', 'asha1'),
(547, 1, 8, 'asha11', 8, '0', '2016-12-12 15:33:43', '2016-12-12 15:33:43', 'asha1', 'asha1'),
(548, 1, 9, 'asha11', 9, '', '2016-12-12 15:33:43', '2016-12-12 15:33:43', 'asha1', 'asha1'),
(549, 1, 10, 'asha11', 10, '0000-00-00', '2016-12-12 15:33:43', '2016-12-12 15:33:43', 'asha1', 'asha1'),
(550, 1, 11, 'asha11', 11, '', '2016-12-12 15:33:43', '2016-12-12 15:33:43', 'asha1', 'asha1');

-- --------------------------------------------------------

--
-- Table structure for table `hm_referals`
--

CREATE TABLE `hm_referals` (
  `Referal_id` int(11) NOT NULL,
  `User_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Patient_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PHC_ID` int(10) UNSIGNED NOT NULL,
  `Village_id` int(10) UNSIGNED NOT NULL,
  `Referral_Reason_Id` int(10) UNSIGNED NOT NULL,
  `Referal_Notes` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Ref_Date` datetime DEFAULT NULL,
  `Created_By` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Created_Date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_referals`
--

INSERT INTO `hm_referals` (`Referal_id`, `User_id`, `Patient_id`, `PHC_ID`, `Village_id`, `Referral_Reason_Id`, `Referal_Notes`, `Ref_Date`, `Created_By`, `Created_Date`) VALUES
(74, 'asha1', 'asha1510', 1, 1, 3, 'BP is Low', '2016-09-08 18:16:42', 'asha1', '2016-09-08 18:16:42'),
(75, 'asha1', 'asha1511', 1, 1, 1, 'High BP', '2016-09-08 19:08:47', 'asha1', '2016-09-08 19:08:47'),
(76, 'asha1', 'asha1511', 1, 1, 2, 'Low HB', '2016-09-12 11:53:50', 'asha1', '2016-09-12 11:53:50'),
(77, 'asha1', 'asha1510', 1, 1, 1, 'High BP', '2016-09-12 12:32:34', 'asha1', '2016-09-12 12:32:34'),
(78, 'asha1', 'asha1510', 1, 1, 3, 'BP is Low', '2016-09-12 13:41:38', 'asha1', '2016-09-12 13:41:38'),
(79, 'asha1', 'asha1512', 1, 1, 2, 'Low HB', '2016-09-12 16:32:59', 'asha1', '2016-09-12 16:32:59'),
(80, 'asha1', 'asha1511', 1, 1, 2, 'Low HB', '2016-09-12 18:15:16', 'asha1', '2016-09-12 18:15:16'),
(81, 'asha1', 'asha1511', 1, 1, 2, 'Low HB', '2016-09-12 18:15:26', 'asha1', '2016-09-12 18:15:26'),
(82, 'asha1', 'asha1511', 1, 1, 1, 'BP is High', '2016-09-12 18:18:34', 'asha1', '2016-09-12 18:18:34'),
(83, 'asha1', 'asha1513', 1, 1, 2, 'Low HB', '2016-09-12 18:22:08', 'asha1', '2016-09-12 18:22:08'),
(84, 'asha1', 'asha1517', 1, 1, 2, 'Low HB', '2016-10-05 11:11:19', 'asha1', '2016-10-05 11:11:19'),
(85, 'asha1', 'asha1514', 1, 1, 2, 'Low HB', '2016-11-14 17:23:09', 'asha1', '2016-11-14 17:23:09'),
(86, 'asha1', 'asha1510', 1, 1, 1, 'High BP', '2016-11-15 11:11:34', 'asha1', '2016-11-15 11:11:34'),
(87, 'asha1', 'asha1510', 1, 1, 1, 'High BP', '2016-11-15 14:19:35', 'asha1', '2016-11-15 14:19:35');

-- --------------------------------------------------------

--
-- Table structure for table `hm_referral_reason`
--

CREATE TABLE `hm_referral_reason` (
  `Referral_Reason_Id` int(10) UNSIGNED NOT NULL,
  `Referral_Reason_Description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_referral_reason`
--

INSERT INTO `hm_referral_reason` (`Referral_Reason_Id`, `Referral_Reason_Description`) VALUES
(1, 'Diarrhea/Running stomach'),
(2, 'Malaria/Fever'),
(3, 'Cough/ARI'),
(4, 'Malnutrition'),
(5, 'Family Planning'),
(6, 'Other Diseases');

-- --------------------------------------------------------

--
-- Table structure for table `hm_severity`
--

CREATE TABLE `hm_severity` (
  `Severity_id` int(10) UNSIGNED NOT NULL,
  `Patient_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `HBFlag` int(10) UNSIGNED DEFAULT NULL,
  `HBValue` decimal(3,1) DEFAULT NULL,
  `BPSysFlag` smallint(3) UNSIGNED DEFAULT NULL,
  `BPSysValue` smallint(3) UNSIGNED DEFAULT NULL,
  `BPDiaFlag` smallint(3) UNSIGNED DEFAULT NULL,
  `BPDiaValue` smallint(3) UNSIGNED DEFAULT NULL,
  `BPPulseFlag` smallint(3) UNSIGNED DEFAULT NULL,
  `BPPulseValue` smallint(3) UNSIGNED DEFAULT NULL,
  `WeightFlag` smallint(3) UNSIGNED DEFAULT NULL,
  `WeightValue` smallint(3) UNSIGNED DEFAULT NULL,
  `OxyPulseFlag` smallint(3) UNSIGNED DEFAULT NULL,
  `OxyPulseValue` smallint(3) UNSIGNED DEFAULT NULL,
  `OxiSpO2Flag` smallint(3) UNSIGNED DEFAULT NULL,
  `OxiPulseO2Value` smallint(3) UNSIGNED DEFAULT NULL,
  `OverallFlag` smallint(3) UNSIGNED DEFAULT NULL,
  `OverAllStatus` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ExaminationDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_severity`
--

INSERT INTO `hm_severity` (`Severity_id`, `Patient_id`, `HBFlag`, `HBValue`, `BPSysFlag`, `BPSysValue`, `BPDiaFlag`, `BPDiaValue`, `BPPulseFlag`, `BPPulseValue`, `WeightFlag`, `WeightValue`, `OxyPulseFlag`, `OxyPulseValue`, `OxiSpO2Flag`, `OxiPulseO2Value`, `OverallFlag`, `OverAllStatus`, `ExaminationDate`) VALUES
(59, 'asha1510', 0, '12.0', 2, 94, 0, 50, 2, 89, 0, 68, 2, 78, 0, 99, 2, 'Critical', '2016-09-14 11:24:13'),
(61, 'asha1511', 0, '12.0', 0, 120, 0, 80, 2, 70, 0, 0, 0, 0, 0, 0, 2, 'Critical', '2016-09-12 18:20:16'),
(63, 'asha1512', 0, '14.0', 0, 133, 0, 92, 2, 70, 0, 78, 2, 107, 0, 99, 2, 'Critical', '2016-09-12 18:12:09'),
(65, 'asha1513', 1, '10.0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'Need Attention', '2016-09-12 18:22:08'),
(67, 'asha1514', 2, '25.0', 0, 130, 0, 109, 2, 118, 0, 0, 2, 115, 0, 99, 2, 'Critical', '2016-11-14 17:23:09'),
(68, 'asha1517', 1, '10.0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'Need Attention', '2016-10-05 11:11:19'),
(70, 'asha11', 0, '0.0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Normal', '2016-12-12 15:33:43'),
(72, 'asha1283', 0, '0.0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Normal', '2016-11-15 13:43:46');

-- --------------------------------------------------------

--
-- Table structure for table `hm_states`
--

CREATE TABLE `hm_states` (
  `State_ID` int(10) UNSIGNED NOT NULL,
  `Country_ID` int(10) UNSIGNED NOT NULL,
  `State_NM` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `State_Desc` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_states`
--

INSERT INTO `hm_states` (`State_ID`, `Country_ID`, `State_NM`, `State_Desc`) VALUES
(1, 1, '1', 'Maharashtra');

-- --------------------------------------------------------

--
-- Table structure for table `hm_survey_questionair`
--

CREATE TABLE `hm_survey_questionair` (
  `Survey_Questionair_id` int(11) NOT NULL,
  `Actor_id` int(10) UNSIGNED DEFAULT NULL,
  `Programs_id` int(10) UNSIGNED NOT NULL,
  `Survey_template_id` int(10) UNSIGNED NOT NULL,
  `Survey_Question_Category` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Survey_Question_no` int(10) UNSIGNED DEFAULT NULL,
  `Survey_Question_Description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Survey_Question_Options` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Parent_Qid` int(10) UNSIGNED DEFAULT NULL,
  `Survey_Questionair_Image` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_survey_questionair`
--

INSERT INTO `hm_survey_questionair` (`Survey_Questionair_id`, `Actor_id`, `Programs_id`, `Survey_template_id`, `Survey_Question_Category`, `Survey_Question_no`, `Survey_Question_Description`, `Survey_Question_Options`, `Parent_Qid`, `Survey_Questionair_Image`) VALUES
(1, 3, 1, 1, 'Edema', 1, 'Edema', NULL, 0, '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEB\r\nAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEB\r\nAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCACcAJwDASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD/AD/6\r\nKKKACiiigAor6a/Zk/Y//aD/AGvfGVt4M+B/gPUfEM0l5bWN7r88F3beGNJuLmSOOCG+1SK0ummv\r\np2kjFto2l29/r14XX7Dpc5DV/dB/wTZ/4NGPCWiWWhfEX9snVX1TUZEhvT4d1jTI5Jwri7Bgs/Aj\r\nyy6foYaC4hK3vja+1vWbfULRboeEdM8x7cb08PKcPaSlGlS2VSo2lJpyTVOKTnVacUmqcZKLkueU\r\nUrv4nO+O8ryvMamQZZg8x4p4nhTpVZ8OcPUqGIxmDpVlJ0MTnmOxWJwmUcOYWtGPtKFbPMwwdTGU\r\n1UWV0MbXg6L/AIMfhN+zf8evjrcpb/Cb4VeMPGcZba+paZo9wuhwgTG3ke4126WDSoUhlUpOZLwG\r\n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'),
(2, 3, 1, 1, 'Edema', 2, 'Edema', 'Grade I', 1, NULL),
(3, 3, 1, 1, 'Edema', 2, 'Edema', 'Grade II', 1, NULL),
(4, 3, 1, 1, 'Edema', 2, 'Edema', 'Grade III', 1, NULL),
(5, 3, 1, 1, 'Headache', 3, 'Headache', NULL, 0, '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEB\r\nAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEB\r\nAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCACcAJwDASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD/AD/6\r\nKKKACiiigAor6z/ZW/Yj/aN/bJ8UQ+Hvgt4Iub3T/t8Omah411mLUbHwXpmoTPBHDpr6laabqV5r\r\nGtTPdWnleHPDWnax4keO5hu/7JFgJrtP7sf+Ca//AAaZfD7wXZ6H8Qv2pnXXdaZUu9njrw/Y6hqW\r\nx3v1WPQ/hNPc6j4X8HrNZXVtm++IV94y8VafrWnpqmmaPohmayTop4ec4e1nKNGldpVKjaUmmk1T\r\nilKdVrS/JFqN1zyju/hM94/yrK8yqcPZRgcy4u4pp06VSpw3w5Sw+IxWApV03h8Tn+Y4vE4TJ+Gs\r\nLWivaUKmd5hhMRjKSqPKsLjqtOdI/go+C/7Iv7S/7QoguPhH8HvF3ifSLiVoU8UyWUeieDd8VxJb\r\n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'),
(6, 3, 1, 1, 'Headache', 4, 'How frequently suffer from headache?', 'Once a week', 5, NULL),
(7, 3, 1, 1, 'Headache', 4, 'How frequently suffer from headache?', '2-3 times a week', 5, NULL),
(8, 3, 1, 1, 'Headache', 4, 'How frequently suffer from headache?', 'daily', 5, NULL),
(9, 3, 1, 1, 'Abdominal Pain', 5, 'Abdominal Pain?', NULL, 0, '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEB\r\nAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEB\r\nAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCACcAJwDASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD/AD/6\r\nKKKACiiigAor7C/ZO/YS/aT/AGz/ABDFpPwb8FyNoYv/AOyr3x/4jj1TT/A9nqpFsI9Ft7+x0rVt\r\nS8R+IJpL3T418NeEtK1vxDCl/Z399ptto7Taon93H/BNb/g1B+G3w+tNF+IH7ScMeva6QLoX3xI8\r\nNaXq2umN5NSjT/hHPg5c3WreDPAHn6fdWUgvvH99478caL4i086voiaGk32BOinh5zh7Wco0aOtq\r\ntVtKbTs1TjGMp1Wno+SLUX8corU+Cz3xByvK8yq8O5PgMy4v4rpwpVKvDXDdPD18Tl9Oum6GJ4hz\r\nPF4nCZPwzhasbVKM86zDDYnGUnOWVYPHVYSpP+Cf4H/sV/tUftG29pqfwj+DHirXfDl7JLHb+NtT\r\n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'),
(10, 3, 1, 1, 'Abdominal Pain', 6, 'How frequently you feel abdominal pain in a week?', 'Once a week', 9, NULL),
(11, 3, 1, 1, 'Abdominal Pain', 6, 'How frequently you feel abdominal pain in a week?', '2-3 times a week', 9, NULL),
(12, 3, 1, 1, 'Abdominal Pain', 6, 'How frequently you feel abdominal pain in a week?', 'daily', 9, NULL),
(13, 3, 1, 1, 'Breathlessness', 7, 'Breathlessness?', NULL, 0, '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEB\r\nAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEB\r\nAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCACcAJwDASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD/AD/6\r\nKKKACiiigAor7N/ZK/YG/aY/bS1xLH4PeDTF4cW/k0m7+IvilNW07wNDrSR25Tw9p97p+kaxqvir\r\nxLPLe6ZB/wAI14O0fXNbsv7U0zUdastP0GWXWF/u9/4Jq/8ABqX8MPhtaaL4/wD2hrSLXfEHNyus\r\n/E/wvpGs+Jnhkl1GOJvDHwZurnW/AvwzM1hPp1xFqHjq98f/ABD0DxNp8uraFeaLDcDTouinh5zh\r\n7Wco0aOtqtVtKbTs1TjGMp1Wno+SLUX8corU+Bz3xCyvK8zqcOZNgMy4w4rpwp1KvDfDdPD18Rl9\r\nOsm6GI4hzTF4nCZNwzhasf3lGWdZhhsXjKKqSynBY+rB0X/BL8Cv2Gv2s/2krGy1v4S/BXxRq3hS\r\n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'),
(14, 3, 1, 1, 'Breathlessness', 8, 'How often you feel breathlessness in a week?', 'Once a week', 13, NULL),
(15, 3, 1, 1, 'Breathlessness', 8, 'How often you feel breathlessness in a week?', '2-3 times a week', 13, NULL),
(16, 3, 1, 1, 'Breathlessness', 8, 'How often you feel breathlessness in a week?', 'daily', 13, NULL),
(17, 3, 1, 1, 'Pale skin', 9, 'Pale skin?', NULL, 0, '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEB\r\nAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEB\r\nAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCACcAJwDASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD/AD/6\r\nKKKACiiigAor7V/ZG/4J/ftN/tqaulv8IfBwtPCy38+kXPxJ8Wpq+m+BhrsUEEieGtIutN0bWtY8\r\nYeKJ5bzSrVvDngvRtc1bTX1fR9R8R22leHrhtbX+77/gmr/wap/C/wCGFpo3j74+WMOteIfmuV8Q\r\n/FXwro2ueLnhkmvUhk8KfBi7utb8BfCppbF9Ou7bUvGl54/+JnhrxPYz6noOr6TbXC6bH0U8NOcP\r\nazlGjR1Sq1LpTs2mqUEnOq1pfki0m2pyilzP4HPfELKsrzOrw5k2AzLjDiulCnUq8N8N08PXxGX0\r\n6yboYjiHNMXicJk3DOGqxSq0ZZ1mGGxeMo88spwWPqwlRP4J/gP+wZ+13+0rptj4h+E/wU8S3/g3\r\n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'),
(18, 3, 1, 1, 'Pale skin', 10, 'Pale skin?', 'Grade I', 17, NULL),
(19, 3, 1, 1, 'Pale skin', 10, 'Pale skin?', 'Grade II', 17, NULL),
(20, 3, 1, 1, 'Pale skin', 10, 'Pale skin?', 'Grade III', 17, NULL),
(21, 3, 1, 1, 'Fever', 11, 'Fever?', NULL, 0, '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEB\r\nAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEB\r\nAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCACcAJwDASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD/AD/6\r\nKKKACiiigAor7b/ZE/4J7/tO/traoqfCTwgmn+EVv7jR5/iZ4wTWdN8DP4ggto5k8L6HcaXout61\r\n408UzzXWl2T+HvBWi65qGkTazod/4rj0Xw9drro/vB/4Jqf8GrXwu+Fdpovj746afBrHiQFrlfFH\r\nxX8KaNr3jSSF57oQS+EfgzeXWufD/wCETtaDTb+y1Txdd+P/AIp+GPFFpd3+h+INLsp001Oinhpz\r\nh7Wco0aN7KrVulOzaapQSc6rVteSLjFu05RVpP4HPfELKsrzOrw5k2AzLjDiulTp1KvDfDdPD16+\r\nX06yk6GI4hzTF4nCZNwxhqqSq0XnWYYbF4yj7SWU4LH1KcqT/gn+An7AX7YP7S+lWHib4U/BPxFc\r\n+CdSE0mn/EfxbcaT4A+HWqW9nqt3o+rTeG/GPjm/0DSPGk2hX9jeW+s6T4KuNe1+yuLae0fSGvgl\r\nq37W/s4/8Gvv7Xfxhktb3xb4uu4tDu9NivbW++D3wo8aeONOe+maPy9H1HxV8Rx8FfDWlyRxsz3O\r\no6fd+ILVZUEdpFd2zm/X/Tj+FH7GP7OHwemTVdB+Htj4i8V70nufHnj928aeM7q9QKv29dV1yO4i\r\n0q6dUVXOg2mmQsM/ucly3gv7ev8AwVe/Ye/4Jv6Ek37RvxXtYvHF/ZC98O/BrwTDF4o+LOv2zsUg\r\nvE8L2l3CNA0eZsmHX/FV3o+i3Cpdpp97d3VvNbGubB07qNOriH0lVmqNN7/8uqXNPpu6ydnH3U+a\r\n3mRy/wAXc+vUzHiHhrgLCzs45dw1llTivPaUXezqcS8QwwOTxqKNuehDg3EU4VdIY6vSg3P+QPwL\r\n/wAGcOm6p4a0+HxjefHDSPFAi/4mOr3P7QXwG0fQ7mQu2yS18K6N+z18Sr/S1Ee0vbz+LtSkDbh5\r\n4Yha7Ef8GVWgSZkX45+IbdBz9nn+MOjS3BBzhBNB+x/5AZON7EbW52Yqx8df+Dxz423ut38H7MX7\r\nIHwv8O+Hkwum6n8dfEni/wAY63PhSGmv9D8A+IPANlZ7m2yC3t9fvNiuYWundPOf5wtv+DwX/gpg\r\ns8b3fwF/YhntVkXz4bb4c/tBWtxJHk7ljuZf2o7yOByBxI9tMqErmJ8kUfWYr4cLhYrtyVZ9+tWt\r\nOX3y7a7l/wDEN8fV97HeKfidjqr3qrN+HMrTeuqw2QcJ5RhI9Hyxw6itVytH0Bcf8GaHgvRoJWuf\r\nEXxm8YzKjCNPCn7SXwe0QySYIVlTxX+yDChTIyY5LiJmDKPNQhjX5ufH3/g04/aU8A6Zean4B8Rf\r\nEiC8ivZAmj+MPhdYeNfC9lpRknK32q/E34NeKPE95GbWJYRcNF8LxFOXlnzalUtG/TDRv+Dyn43R\r\naLaR+If2HPhdqHiBJkF9d6P8WfF+kaNPb4UO9ppl94c1y9tJiwfbDNqt3GEMbGdiWWv1Y/Yd/wCD\r\nqn9iH9pPxRo/w5/aM8J+IP2S/F2tT2en6X4r8T6xZeKvg3ealc+agh1TxnY2+nX/AIMjluFgt4L7\r\nxFog0CEyvc6v4hsLSKSYixFJq1TB0H/eg69Oa32tWlDXzpt7arUP9QuKMEnLJfFzjelJfDhs9wXB\r\nfEOWzetnXVfhXB5zKK093D57hrrm5nKTUl/nm/GX/gj5+3x8H5tTax+EyfGbTNMulsXvvgbqUnjf\r\nXLm7N3PbSx2fwruNO0L4zSQ2giS7v9Ql+G0WmWNlMtxeX0Qt9SWH8ybi3uLS4ntbqCa2ubaaW3ub\r\na4ieG4t7iF2jmgnhkCyRTRSIySxSKHR1ZHAZWz/vD/EL4G/AL9oLRLa58e+APBXxA0/VdOtrnSvE\r\nq21rJqcul3lus9neaD4y0eSDV4LO7t5I57a50rVUgngMUscjxkM34M/8FCP+DdT9nP8Aaz0fVdV0\r\n3RrDxb4h+xeRpl34ru4fD/xk0SK202603TIfBXx80nTTq1/a+HbO4lHhHwD8XNM8Y/Cyz1OVNU1j\r\nRbqeCN6ap4Wrf2dWdCfSGItKm99FXhFWb6c9KMFo5VN2Yyz3xO4XvPiThrLeNsqp/wATOeAIYnL8\r\n9oU05XrYjgXO8wxrxVKnFKVT+xOKcyzOq7xweQ1ajhTl/ks0V+237fX/AAQx/a0/Y11/xdfeF/DX\r\niP4neC/D32vU9Q0D+wLmx+NXg/w7BBaTz6vr3gi0hurTxz4YsHk1ONPH/wALNQ8Q6bP4f8P618Qf\r\nGfh3wD4fkhsk/EmsKlKpSly1IuLsmtnGUdUpQkm4zi7aSi3F6Wk73f23DnFHD/FuX/2nw7mlDMsL\r\nCtPDYhQVWji8DjKVlXwGaZfiqdHHZVmOHfKsTl2Y4bD47DucFXw8JPUooorM94KKKKACiiigAr+j\r\nv/gkB/wQR+LH7dmueCviF8V9A1fTfAGsyaL4p8OfDh5dR8P3nivwA00F5b+PPil4lto01L4cfCvx\r\nbH5UXhiz0Ux/FP4k+GZb/wAR+Brjwvod/wDDPx/ru5/wQW/4Iy6z+3N8QvC3xl+JXhq11zwNDq1x\r\ndfDzwV4g0p77wXrNv4e1Q6frvxb+K0E8BtNb+HHhLWIZdF8L/DnMtt8UfiBa3OleOCnw80XUPBXj\r\nH/U4+A3wG8Afs7+A7XwP4Fs5HaWQah4n8T6iVn8SeM/Ecqk3/iPxHqBHm3d7dyFjDDu+y2FuVs7G\r\nOO3XB66cKdCmq1eKnOaUqFCV0nG8kq1ZJp+zb/h073q2cnKNJe/+T5tnOd8cZ1mPB/BuYVsnybJ6\r\n/wBS4245wipyxeHxnLGVbhHg6dWFWg8/jSlF55ntSnWw/DVOrTwWFo1+I6lR4Dwz9kX9g34Ifsje\r\nGtEt/DHh/RNV8ZaZo9ro0PieLw5o+h6X4a0q3gMMXhj4Z+EtKtYNF+HXhGyiLW1ho2gW8L/Y2Frd\r\nXctnFaWkX25RX59/8FQv26PDX/BOn9if4vftL6ullqHibRtNj8NfCrw1eORH4o+KniUz6d4P0yWJ\r\nGEs2n2d0JNd15YyrLoGmakwlifbLXPUqVKsnOpJylZK7skoraMYrSMV9mMUoxWytofecO8NZFwnl\r\ndPJ+HsuoZdgadSpWnCn7SpXxWLrSc8Tj8wxlepVxeZZjjKn77G5jjq1fHYuu5VsViKtaU5v8m/8A\r\ngvV/wXd03/gnpolz+zJ+zLe6N4j/AGvPFmiw3er6xcR2uq6H8AfDOrW00mn69renyvJa'),
(22, 3, 1, 1, 'Fever', 12, 'How frequently you suffer from fever in last month?', 'Once a week', 21, NULL),
(23, 3, 1, 1, 'Fever', 12, 'How frequently you suffer from fever in last month?', '2-3 times a week', 21, NULL),
(24, 3, 1, 1, 'Fever', 12, 'How frequently you suffer from fever in last month?', 'Daily', 21, NULL),
(25, 3, 1, 1, 'Vomiting', 13, 'Vomiting?', NULL, 0, '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEB\r\nAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEB\r\nAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCACcAJwDASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD/AD/6\r\nKKKACiiigAor7g/ZB/4J5ftPftr6kp+E3hKPS/Bq39zo8vxO8ZprWm+B5vEMFqs6eFfD0ulaJruu\r\n+N/FU81xpdhJoHgrQ9cvNFuda0C+8YnQvDt9Hrw/vC/4Jpf8GsHwt+E9povj743abBqviVSbpPF3\r\nxY8KaLr/AI6eNp5TbzeDvg1eXOufD74OSeRFpupadq3im58e/Frwr4mt7670XxPp9hcJp0fRTw05\r\nw9rOUaNG9lVq3SnZtNUoJOdVq2vJFxi3acoq0n8BnviHlWWZnV4cyXAZlxhxXSp06lXhvhunh69f\r\nL6dZS9hiOIs0xeJwmTcMYaqkqlKWdZhhsXjKPtJZTgsdVpyov+Cf4A/8E+v2xf2mdIsPFXwr+Cfi\r\n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'),
(26, 3, 1, 1, 'Vomiting', 14, 'How frequently you have vomiting in a week?', 'Once a week', 25, NULL),
(27, 3, 1, 1, 'Vomiting', 14, 'How frequently you have vomiting in a week?', '2-3 times a week', 25, NULL),
(28, 3, 1, 1, 'Vomiting', 14, 'How frequently you have vomiting in a week?', 'Once a Day', 25, NULL),
(29, 3, 1, 1, 'Vomiting', 14, 'How frequently you have vomiting in a week?', '2-3 times a day', 25, NULL),
(30, 3, 1, 1, 'Convulsions', 15, 'Convulsions?', NULL, 0, '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEB\r\nAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEB\r\nAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCACcAJwDASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD/AD/6\r\nKKKACiiigAor7l/ZA/4J2/tP/tsX6y/CnwnFpHgpb+50aT4oeNU1rTfBFz4igtTOvhTw0+laHruv\r\neOvFU88umafLoXgnQtbuNCu9b8PXvjaTw/4e1CDXa/vE/wCCaP8Away/C34R2mi+PvjVpcGpeJlb\r\n7WnjL4seFdF8QfEB0M4e3n8F/B29udd+HnwXkVLXTtU0rWPEk/jv4v8AhPxLDqE+keLbPTbldNTo\r\np4ac4e1nKNGjeyq1bpTs2mqUEnOq1bXki4xbtOUVaT+Az3xDyrLMzq8OZLgcy4w4rpQpzq8N8N08\r\nPXr5dTrJuhiOIs0xeJwmTcM4arHlq0nnWYYbGYuj7SWU4LHVaboy/gm/Z/8A+Cef7ZH7TWjaf4t+\r\n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'),
(31, 3, 1, 1, 'Convulsions', 16, 'How often convulsion occur?', 'Once a week', 30, NULL),
(32, 3, 1, 1, 'Convulsions', 16, 'How often convulsion occur?', '2-3 times a week', 30, NULL),
(33, 3, 1, 1, 'Convulsions', 16, 'How often convulsion occur?', 'once a month', 30, NULL),
(34, 3, 1, 1, 'Skin rash', 17, 'Rash on the skin?', NULL, 0, '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEB\r\nAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEB\r\nAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCACcAJwDASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD/AD/6\r\nKKKACiiigAor7p/Y/wD+CdP7UH7bF6tx8K/CkOieB11C40Z/ij43TWtM8E3niKC1kmTwn4W/snQ9\r\nd8QePfFU9w2nabNongjQtbk8P3ut+G7rx1ceHfD2p22vH+8X/gmh/wAGtPwt+EFponj74y6TBf8A\r\nihGF2njb4s+FtF8RfEV1NxDLbXHgj4P3txrnw8+CUsf2HT9X0fWtfm8c/GTwj4kTUn0vxlbaXcpp\r\nqdFPDTnD2s5Ro0b2VWrdKdm01Sgk51Wra8kXGLdpyirSfwGe+IeVZZmdXhzJcBmXGPFlKFOdXhvh\r\nunh69fLqdZN0MRxFmuLxOEybhjDVVapSedY/DYzF0XOWU4HHVISpP+Cb9n7/AIJ3ftl/tN6Jp/i/\r\n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'),
(35, 3, 1, 1, 'Skin rash', 18, 'Rash on the skin?', 'Grade I', 34, NULL),
(36, 3, 1, 1, 'Skin rash', 18, 'Rash on the skin?', 'Grade II', 34, NULL),
(37, 3, 1, 1, 'Skin rash', 18, 'Rash on the skin?', 'Grade III', 34, NULL),
(38, 3, 1, 1, 'Alcohol', 19, 'Alcohol?', NULL, 0, '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEB\r\nAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEB\r\nAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCACcAJwDASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD/AD/6\r\nKKKACiiigAor7b/ZV/4J/ftFftcWuoeKPBmk6P4H+FejNqcOs/Gr4n3eoeG/hrDqGl6dcX91oei3\r\n9tpOrat4x1yLy7Oy1Gx8I6Rq1v4VudY8OXvxEv8Awx4c1O28QH9I11L9g3/gnjp5Pwe+Hdj+1v8A\r\nHjTzdD/hefxi0mxbwNoF/DPE1rqHgL4fNNrnh3w7Jp91pmn61pGq6f8A278QPD+snVLjwz+0AukX\r\nEWlR9FPDTnD2s5Ro0b2VWrdKdm01Sgk51Wra8kXGLdpyirSfwGe+IeVZZmdXhzJcBmXGPFlKFOdX\r\nhvhunh69fLqdZN0MRxFmuLxOEybhjDVVapSedY/DYzF0XOWU4HHVISpP82f2fP8AgnX+2X+05omn\r\n+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'),
(39, 3, 1, 1, 'Alcohol', 20, 'How many times do you have alcoholic drink in a week?', 'Once a week', 38, NULL),
(40, 3, 1, 1, 'Alcohol', 20, 'How many times do you have alcoholic drink in a week?', '2-3 times a week', 38, NULL),
(41, 3, 1, 1, 'Alcohol', 20, 'How many times do you have alcoholic drink in a week?', 'more than 3 times a week', 38, NULL),
(42, 3, 1, 1, 'Smoking', 21, 'Smoking?', NULL, 0, NULL),
(43, 3, 1, 1, 'Smoking', 22, 'How many cigarettes do you smoke on an average in a week?', 'Once a day', 42, NULL),
(44, 3, 1, 1, 'Smoking', 22, 'How many cigarettes do you smoke on an average in a week?', '1 to 5 cigarettes', 42, NULL),
(45, 3, 1, 1, 'Smoking', 22, 'How many cigarettes do you smoke on an average in a week?', '6 to 10 cigarettes', 42, NULL),
(46, 3, 1, 1, 'Smoking', 22, 'How many cigarettes do you smoke on an average in a week?', 'more than 10', 42, NULL),
(47, 3, 1, 1, 'Tobacco', 23, 'Tobacco?', NULL, 0, NULL),
(48, 3, 1, 1, 'Tobacco', 24, 'How many times you intake tobacco in a week?', 'Once a week', 47, NULL),
(49, 3, 1, 1, 'Tobacco', 24, 'How many times you intake tobacco in a week?', '2-3 times a week', 47, NULL),
(50, 3, 1, 1, 'Tobacco', 24, 'How many times you intake tobacco in a week?', 'daily once', 47, NULL),
(51, 3, 1, 1, 'Tobacco', 24, 'How many times you intake tobacco in a week?', 'More than once a day', 47, NULL),
(52, 4, 1, 2, 'Communication by ASHA', 1, NULL, NULL, 0, NULL),
(53, 4, 1, 2, 'Communication by ASHA', 2, 'ASHA''s communication was very good with you ', 'Strongly Agree', 0, NULL),
(54, 4, 1, 2, 'Communication by ASHA', 2, 'ASHA''s communication was very good with you', 'Agree', 0, NULL),
(55, 4, 1, 2, 'Communication by ASHA', 2, 'ASHA''s communication was very good with you ', 'Disagree', 0, NULL),
(56, 4, 1, 2, 'Communication by ASHA', 2, 'ASHA''s communication was very good with you', 'Strongly Disagree', 0, NULL),
(57, 4, 1, 2, 'Communication by ASHA', 3, 'ASHA has explained you enough on Program benefits,Diet,Exercise,Tests & Visits', 'Strongly Agree', 0, NULL),
(58, 4, 1, 2, 'Communication by ASHA', 3, 'ASHA has explained you enough on Program benefits,Diet,Exercise,Tests & Visits', 'Agree', 0, NULL),
(59, 4, 1, 2, 'Communication by ASHA', 3, 'ASHA has explained you enough on Program benefits,Diet,Exercise,Tests & Visits', 'Disagree', 0, NULL),
(60, 4, 1, 2, 'Communication by ASHA', 3, 'ASHA has explained you enough on Program benefits,Diet,Exercise,Tests & Visits', 'Strongly Disagree', 0, NULL),
(61, 4, 1, 2, 'Communication by ASHA', 4, 'ASHA explained  things in a way you could understand', 'Strongly Agree', 0, NULL),
(62, 4, 1, 2, 'Communication by ASHA', 4, 'ASHA explained  things in a way you could understand', 'Agree', 0, NULL),
(63, 4, 1, 2, 'Communication by ASHA', 4, 'ASHA explained  things in a way you could understand', 'Disagree', 0, NULL),
(64, 4, 1, 2, 'Communication by ASHA', 4, 'ASHA explained  things in a way you could understand', 'Strongly Disagree', 0, NULL),
(65, 4, 1, 2, 'Communication by ASHA', 5, 'ASHA listen carefully to you during your visits', 'Strongly Agree', 0, NULL),
(66, 4, 1, 2, 'Communication by ASHA', 5, 'ASHA listen carefully to you during your visits', 'Agree', 0, NULL),
(67, 4, 1, 2, 'Communication by ASHA', 5, 'ASHA listen carefully to you during your visits', 'Disagree', 0, NULL),
(68, 4, 1, 2, 'Communication by ASHA', 5, 'ASHA listen carefully to you during your visits', 'Strongly Disagree', 0, NULL),
(69, 4, 1, 2, 'Communication by ASHA', 6, 'ASHA has given education on health to you', 'Strongly Agree', 0, NULL),
(70, 4, 1, 2, 'Communication by ASHA', 6, 'ASHA has given education on health to you', 'Agree', 0, NULL),
(71, 4, 1, 2, 'Communication by ASHA', 6, 'ASHA has given education on health to you', 'Disagree', 0, NULL),
(72, 4, 1, 2, 'Communication by ASHA', 6, 'ASHA has given education on health to you', 'Strongly Disagree', 0, NULL),
(73, 4, 1, 2, 'Care from ASHA', 7, NULL, NULL, 0, NULL),
(74, 4, 1, 2, 'Care from ASHA', 8, 'ASHA visited your Home for help as soon as you wanted it', 'Strongly Agree', 0, NULL),
(75, 4, 1, 2, 'Care from ASHA', 8, 'ASHA visited your Home for help as soon as you wanted it', 'Agree', 0, NULL),
(76, 4, 1, 2, 'Care from ASHA', 8, 'ASHA visited your Home for help as soon as you wanted it', 'Disagree', 0, NULL),
(77, 4, 1, 2, 'Care from ASHA', 8, 'ASHA visited your Home for help as soon as you wanted it', 'Strongly Disagree', 0, NULL);
INSERT INTO `hm_survey_questionair` (`Survey_Questionair_id`, `Actor_id`, `Programs_id`, `Survey_template_id`, `Survey_Question_Category`, `Survey_Question_no`, `Survey_Question_Description`, `Survey_Question_Options`, `Parent_Qid`, `Survey_Questionair_Image`) VALUES
(78, 4, 1, 2, 'Care from ASHA', 9, 'ASHA has good knowledge on how to take your Care', 'Strongly Agree', 0, NULL),
(79, 4, 1, 2, 'Care from ASHA', 9, 'ASHA has good knowledge on how to take your Care', 'Agree', 0, NULL),
(80, 4, 1, 2, 'Care from ASHA', 9, 'ASHA has good knowledge on how to take your Care', 'Disagree', 0, NULL),
(81, 4, 1, 2, 'Care from ASHA', 9, 'ASHA has good knowledge on how to take your Care', 'Strongly Disagree', 0, NULL),
(82, 4, 1, 2, 'Communication by ANM', 10, NULL, NULL, 0, NULL),
(83, 4, 1, 2, 'Communication by ANM', 11, 'ANM listen carefully to you during your course of treatment', 'Strongly Agree', 0, NULL),
(84, 4, 1, 2, 'Communication by ANM', 11, 'ANM listen carefully to you during your course of treatment', 'Agree', 0, NULL),
(85, 4, 1, 2, 'Communication by ANM', 11, 'ANM listen carefully to you during your course of treatment', 'Disagree', 0, NULL),
(86, 4, 1, 2, 'Communication by ANM', 11, 'ANM listen carefully to you during your course of treatment', 'Strongly Disagree', 0, NULL),
(87, 4, 1, 2, 'Communication by ANM', 12, 'ANM has explained you enough on Program benefits, diet, exercise , tests & Visits', 'Strongly Agree', 0, NULL),
(88, 4, 1, 2, 'Communication by ANM', 12, 'ANM has explained you enough on Program benefits, diet, exercise , tests & Visits', 'Agree', 0, NULL),
(89, 4, 1, 2, 'Communication by ANM', 12, 'ANM has explained you enough on Program benefits, diet, exercise , tests & Visits', 'Disagree', 0, NULL),
(90, 4, 1, 2, 'Communication by ANM', 12, 'ANM has explained you enough on Program benefits, diet, exercise , tests & Visits', 'Strongly Disagree', 0, NULL),
(91, 4, 1, 2, 'Communication by ANM', 13, 'ANM explained  things in a way you could understand', 'Strongly Agree', 0, NULL),
(92, 4, 1, 2, 'Communication by ANM', 13, 'ANM explained  things in a way you could understand', 'Agree', 0, NULL),
(93, 4, 1, 2, 'Communication by ANM', 13, 'ANM explained  things in a way you could understand', 'Disagree', 0, NULL),
(94, 4, 1, 2, 'Communication by ANM', 13, 'ANM explained  things in a way you could understand', 'Strongly Disagree', 0, NULL),
(95, 4, 1, 2, 'Communication by ANM', 14, 'ASHA has given education on health to you', 'Strongly Agree', 0, NULL),
(96, 4, 1, 2, 'Communication by ANM', 14, 'ASHA has given education on health to you', 'Agree', 0, NULL),
(97, 4, 1, 2, 'Communication by ANM', 14, 'ASHA has given education on health to you', 'Disagree', 0, NULL),
(98, 4, 1, 2, 'Communication by ANM', 14, 'ASHA has given education on health to you', 'Strongly Disagree', 0, NULL),
(99, 4, 1, 2, 'Care from ANM', 15, NULL, NULL, 0, NULL),
(100, 4, 1, 2, 'Care from ANM', 16, 'ANM treat you with courtesy and respect', 'Strongly Agree', 0, NULL),
(101, 4, 1, 2, 'Care from ANM', 16, 'ANM treat you with courtesy and respect', 'Agree', 0, NULL),
(102, 4, 1, 2, 'Care from ANM', 16, 'ANM treat you with courtesy and respect', 'Disagree', 0, NULL),
(103, 4, 1, 2, 'Care from ANM', 16, 'ANM treat you with courtesy and respect', 'Strongly Disagree', 0, NULL),
(104, 4, 1, 2, 'Care from ANM', 17, 'ANM has good knowledge on how to take your Care', 'Strongly Agree', 0, NULL),
(105, 4, 1, 2, 'Care from ANM', 17, 'ANM has good knowledge on how to take your Care', 'Agree', 0, NULL),
(106, 4, 1, 2, 'Care from ANM', 17, 'ANM has good knowledge on how to take your Care', 'Disagree', 0, NULL),
(107, 4, 1, 2, 'Care from ANM', 17, 'ANM has good knowledge on how to take your Care', 'Strongly Disagree', 0, NULL),
(108, 4, 1, 2, 'Communication by Doctor', 18, NULL, NULL, 0, NULL),
(109, 4, 1, 2, 'Communication by Doctor', 19, 'Doctor''s communication was very good with you', 'Strongly Agree', 0, NULL),
(110, 4, 1, 2, 'Communication by Doctor', 19, 'Doctor''s communication was very good with you', 'Agree', 0, NULL),
(111, 4, 1, 2, 'Communication by Doctor', 19, 'Doctor''s communication was very good with you', 'Disagree', 0, NULL),
(112, 4, 1, 2, 'Communication by Doctor', 19, 'Doctor''s communication was very good with you', 'Strongly Disagree', 0, NULL),
(113, 4, 1, 2, 'Communication by Doctor', 20, 'Doctor listen carefully to you during your course of treatment', 'Strongly Agree', 0, NULL),
(114, 4, 1, 2, 'Communication by Doctor', 20, 'Doctor listen carefully to you during your course of treatment', 'Agree', 0, NULL),
(115, 4, 1, 2, 'Communication by Doctor', 20, 'Doctor listen carefully to you during your course of treatment', 'Disagree', 0, NULL),
(116, 4, 1, 2, 'Communication by Doctor', 20, 'Doctor listen carefully to you during your course of treatment', 'Strongly Disagree', 0, NULL),
(117, 4, 1, 2, 'Communication by Doctor', 21, 'Doctor has explained you enough about your health status', 'Strongly Agree', 0, NULL),
(118, 4, 1, 2, 'Communication by Doctor', 21, 'Doctor has explained you enough about your health status', 'Agree', 0, NULL),
(119, 4, 1, 2, 'Communication by Doctor', 21, 'Doctor has explained you enough about your health status', 'Disagree', 0, NULL),
(120, 4, 1, 2, 'Communication by Doctor', 21, 'Doctor has explained you enough about your health status', 'Strongly Disagree', 0, NULL),
(121, 4, 1, 2, 'Care from Doctor', 22, NULL, NULL, 0, NULL),
(122, 4, 1, 2, 'Care from Doctor', 23, 'Doctor treats you with courtesy and respect', 'Strongly Agree', 0, NULL),
(123, 4, 1, 2, 'Care from Doctor', 23, 'Doctor treats you with courtesy and respect', 'Agree', 0, NULL),
(124, 4, 1, 2, 'Care from Doctor', 23, 'Doctor treats you with courtesy and respect', 'Disagree', 0, NULL),
(125, 4, 1, 2, 'Care from Doctor', 23, 'Doctor treats you with courtesy and respect', 'Strongly Disagree', 0, NULL),
(126, 4, 1, 2, 'Care from Doctor', 24, 'Your Health status is improved due to the treatment received', 'Strongly Agree', 0, NULL),
(127, 4, 1, 2, 'Care from Doctor', 24, 'Your Health status is improved due to the treatment received', 'Agree', 0, NULL),
(128, 4, 1, 2, 'Care from Doctor', 24, 'Your Health status is improved due to the treatment received', 'Disagree', 0, NULL),
(129, 4, 1, 2, 'Care from Doctor', 24, 'Your Health status is improved due to the treatment received', 'Strongly Disagree', 0, NULL),
(130, 4, 1, 2, 'PHC/Hospital Staff Responsiveness', 25, NULL, NULL, 0, NULL),
(131, 4, 1, 2, 'PHC/Hospital Staff Responsiveness', 26, 'Staff communication is good with you', 'Strongly Agree', 0, NULL),
(132, 4, 1, 2, 'PHC/Hospital Staff Responsiveness', 26, 'Staff communication is good with you', 'Agree', 0, NULL),
(133, 4, 1, 2, 'PHC/Hospital Staff Responsiveness', 26, 'Staff communication is good with you', 'Disagree', 0, NULL),
(134, 4, 1, 2, 'PHC/Hospital Staff Responsiveness', 26, 'Staff communication is good with you', 'Strongly Disagree', 0, NULL),
(135, 4, 1, 2, 'PHC/Hospital Staff Responsiveness', 27, 'You get immediate help as and when needed', 'Strongly Agree', 0, NULL),
(136, 4, 1, 2, 'PHC/Hospital Staff Responsiveness', 27, 'You get immediate help as and when needed', 'Agree', 0, NULL),
(137, 4, 1, 2, 'PHC/Hospital Staff Responsiveness', 27, 'You get immediate help as and when needed', 'Disagree', 0, NULL),
(138, 4, 1, 2, 'PHC/Hospital Staff Responsiveness', 27, 'You get immediate help as and when needed', 'Strongly Disagree', 0, NULL),
(139, 4, 1, 2, 'Pain Management', 28, NULL, NULL, 0, NULL),
(140, 4, 1, 2, 'Pain Management', 29, 'You got immediate treatment when you reported health issue', 'Strongly Agree', 0, NULL),
(141, 4, 1, 2, 'Pain Management', 29, 'You got immediate treatment when you reported health issue', 'Agree', 0, NULL),
(142, 4, 1, 2, 'Pain Management', 29, 'You got immediate treatment when you reported health issue', 'Disagree', 0, NULL),
(143, 4, 1, 2, 'Pain Management', 29, 'You got immediate treatment when you reported health issue', 'Strongly Disagree', 0, NULL),
(144, 4, 1, 2, 'Pain Management', 30, 'Treatment given to you could resolve your health issue completely', 'Strongly Agree', 0, NULL),
(145, 4, 1, 2, 'Pain Management', 30, 'Treatment given to you could resolve your health issue completely', 'Agree', 0, NULL),
(146, 4, 1, 2, 'Pain Management', 30, 'Treatment given to you could resolve your health issue completely', 'Disagree', 0, NULL),
(147, 4, 1, 2, 'Pain Management', 30, 'Treatment given to you could resolve your health issue completely', 'Strongly Disagree', 0, NULL),
(148, 4, 1, 2, 'Medicine Communication', 31, NULL, NULL, 0, NULL),
(149, 4, 1, 2, 'Medicine Communication', 32, 'You have got enough information about Medication intake and  possible side effects', 'Strongly Agree', 0, NULL),
(150, 4, 1, 2, 'Medicine Communication', 32, 'You have got enough information about Medication intake and  possible side effects', 'Agree', 0, NULL),
(151, 4, 1, 2, 'Medicine Communication', 32, 'You have got enough information about Medication intake and  possible side effects', 'Disagree', 0, NULL),
(152, 4, 1, 2, 'Medicine Communication', 32, 'You have got enough information about Medication intake and  possible side effects', 'Strongly Disagree', 0, NULL),
(153, 4, 1, 2, 'PHC/Hospital Services', 33, NULL, NULL, 0, NULL),
(154, 4, 1, 2, 'PHC/Hospital Services', 34, 'PHC/Hospital is clean and quiet', 'Strongly Agree', 0, NULL),
(155, 4, 1, 2, 'PHC/Hospital Services', 34, 'PHC/Hospital is clean and quiet', 'Agree', 0, NULL),
(156, 4, 1, 2, 'PHC/Hospital Services', 34, 'PHC/Hospital is clean and quiet', 'Disagree', 0, NULL),
(157, 4, 1, 2, 'PHC/Hospital Services', 34, 'PHC/Hospital is clean and quiet', 'Strongly Disagree', 0, NULL),
(158, 4, 1, 2, 'PHC/Hospital Services', 35, 'PHC/Hospital is well equipped', 'Strongly Agree', 0, NULL),
(159, 4, 1, 2, 'PHC/Hospital Services', 35, 'PHC/Hospital is well equipped', 'Agree', 0, NULL),
(160, 4, 1, 2, 'PHC/Hospital Services', 35, 'PHC/Hospital is well equipped', 'Disagree', 0, NULL),
(161, 4, 1, 2, 'PHC/Hospital Services', 35, 'PHC/Hospital is well equipped', 'Strongly Disagree', 0, NULL),
(162, 4, 1, 2, 'PHC/Hospital Services', 36, 'Your experience in PHC/Hospital is good', 'Strongly Agree', 0, NULL),
(163, 4, 1, 2, 'PHC/Hospital Services', 36, 'Your experience in PHC/Hospital is good', 'Agree', 0, NULL),
(164, 4, 1, 2, 'PHC/Hospital Services', 36, 'Your experience in PHC/Hospital is good', 'Disagree', 0, NULL),
(165, 4, 1, 2, 'PHC/Hospital Services', 36, 'Your experience in PHC/Hospital is good', 'Strongly Disagree', 0, NULL),
(166, 4, 1, 2, 'PHC/Hospital Services', 37, 'You got emergency support & ambulatory services immediate when demanded for', 'Strongly Agree', 0, NULL),
(167, 4, 1, 2, 'PHC/Hospital Services', 37, 'You got emergency support & ambulatory services immediate when demanded for', 'Agree', 0, NULL),
(168, 4, 1, 2, 'PHC/Hospital Services', 37, 'You got emergency support & ambulatory services immediate when demanded for', 'Disagree', 0, NULL),
(169, 4, 1, 2, 'PHC/Hospital Services', 37, 'You got emergency support & ambulatory services immediate when demanded for', 'Strongly Disagree', 0, NULL),
(170, 4, 1, 2, 'Overall  Rating', 38, NULL, NULL, 0, NULL),
(171, 4, 1, 2, 'Overall  Rating', 39, 'You have got good understanding of the things responsible for managing your health', 'Strongly Agree', 0, NULL),
(172, 4, 1, 2, 'Overall  Rating', 40, 'You have got good understanding of the things responsible for managing your health', 'Agree', 0, NULL),
(173, 4, 1, 2, 'Overall  Rating', 40, 'You have got good understanding of the things responsible for managing your health', 'Disagree', 0, NULL),
(174, 4, 1, 2, 'Overall  Rating', 40, 'You have got good understanding of the things responsible for managing your health', 'Strongly Disagree', 0, NULL),
(175, 4, 1, 2, 'Overall  Rating', 41, 'You will recommend others to get enrolled in the Program', 'Strongly Agree', 0, NULL),
(176, 4, 1, 2, 'Overall  Rating', 41, 'You will recommend others to get enrolled in the Program', 'Agree', 0, NULL),
(177, 4, 1, 2, 'Overall  Rating', 41, 'You will recommend others to get enrolled in the Program', 'Disagree', 0, NULL),
(178, 4, 1, 2, 'Overall  Rating', 41, 'You will recommend others to get enrolled in the Program', 'Strongly Disagree', 0, NULL),
(179, 4, 1, 1, 'Edema', 1, 'Edema?', NULL, 0, NULL),
(180, 4, 1, 1, 'Headache', 2, 'Headache?', NULL, 0, NULL),
(181, 4, 1, 1, 'Abdominal Pain', 3, 'Abdominal Pain?', NULL, 0, NULL),
(182, 4, 1, 1, 'Breathlessness', 4, 'Breathlessness?', NULL, 0, NULL),
(183, 4, 1, 1, 'Pale skin', 5, 'Pale skin?', NULL, 0, NULL),
(184, 4, 1, 1, 'Fever', 6, 'Fever?', NULL, 0, NULL),
(185, 4, 1, 1, 'Vomiting', 7, 'Vomiting?', NULL, 0, NULL),
(186, 4, 1, 1, 'Convulsions', 8, 'Convulsions?', NULL, 0, NULL),
(187, 4, 1, 1, 'Skin rash', 9, 'Rash on the skin?', NULL, 0, NULL),
(188, 4, 1, 1, 'Alcohol', 10, 'Alcohol?', NULL, 0, NULL),
(189, 4, 1, 1, 'Smoking', 11, 'Smoking?', NULL, 0, NULL),
(190, 4, 1, 1, 'Tobacco', 12, 'Tobacco?', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hm_survey_results`
--

CREATE TABLE `hm_survey_results` (
  `Survey_Result_id` int(10) UNSIGNED NOT NULL,
  `Survey_Questionair_id` int(11) NOT NULL,
  `Patient_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Survey_Option_Answer` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_survey_results`
--

INSERT INTO `hm_survey_results` (`Survey_Result_id`, `Survey_Questionair_id`, `Patient_id`, `Survey_Option_Answer`) VALUES
(180, 179, 'asha1512', 'Yes'),
(181, 180, 'asha1512', 'No'),
(182, 181, 'asha1512', 'Yes'),
(183, 182, 'asha1512', 'No'),
(184, 183, 'asha1512', 'Yes'),
(185, 184, 'asha1512', 'Yes'),
(186, 185, 'asha1512', 'No'),
(187, 186, 'asha1512', 'No'),
(188, 187, 'asha1512', 'No'),
(189, 188, 'asha1512', 'No'),
(190, 189, 'asha1512', 'No'),
(191, 190, 'asha1512', 'No'),
(192, 179, 'asha1512', 'Yes'),
(193, 180, 'asha1512', 'No'),
(194, 181, 'asha1512', 'Yes'),
(195, 182, 'asha1512', 'No'),
(196, 183, 'asha1512', 'Yes'),
(197, 184, 'asha1512', 'Yes'),
(198, 185, 'asha1512', 'No'),
(199, 186, 'asha1512', 'No'),
(200, 187, 'asha1512', 'No'),
(201, 188, 'asha1512', 'No'),
(202, 189, 'asha1512', 'No'),
(203, 190, 'asha1512', 'No'),
(204, 179, 'asha1512', 'Yes'),
(205, 180, 'asha1512', 'No'),
(206, 181, 'asha1512', 'Yes'),
(207, 182, 'asha1512', 'No'),
(208, 183, 'asha1512', 'Yes'),
(209, 184, 'asha1512', 'Yes'),
(210, 185, 'asha1512', 'No'),
(211, 186, 'asha1512', 'No'),
(212, 187, 'asha1512', 'No'),
(213, 188, 'asha1512', 'No'),
(214, 189, 'asha1512', 'No'),
(215, 190, 'asha1512', 'No'),
(216, 179, 'asha1512', 'Yes'),
(217, 180, 'asha1512', 'No'),
(218, 181, 'asha1512', 'Yes'),
(219, 182, 'asha1512', 'No'),
(220, 183, 'asha1512', 'Yes'),
(221, 184, 'asha1512', 'Yes'),
(222, 185, 'asha1512', 'No'),
(223, 186, 'asha1512', 'No'),
(224, 187, 'asha1512', 'No'),
(225, 188, 'asha1512', 'No'),
(226, 189, 'asha1512', 'No'),
(227, 190, 'asha1512', 'No'),
(228, 179, 'asha1512', 'Yes'),
(229, 180, 'asha1512', 'No'),
(230, 181, 'asha1512', 'Yes'),
(231, 182, 'asha1512', 'No'),
(232, 183, 'asha1512', 'Yes'),
(233, 184, 'asha1512', 'Yes'),
(234, 185, 'asha1512', 'No'),
(235, 186, 'asha1512', 'No'),
(236, 187, 'asha1512', 'No'),
(237, 188, 'asha1512', 'No'),
(238, 189, 'asha1512', 'No'),
(239, 190, 'asha1512', 'No'),
(240, 179, 'asha1512', 'Yes'),
(241, 180, 'asha1512', 'No'),
(242, 181, 'asha1512', 'Yes'),
(243, 182, 'asha1512', 'No'),
(244, 183, 'asha1512', 'Yes'),
(245, 184, 'asha1512', 'Yes'),
(246, 185, 'asha1512', 'No'),
(247, 186, 'asha1512', 'No'),
(248, 187, 'asha1512', 'No'),
(249, 188, 'asha1512', 'No'),
(250, 189, 'asha1512', 'No'),
(251, 190, 'asha1512', 'No'),
(252, 179, 'asha1512', 'Yes'),
(253, 180, 'asha1512', 'No'),
(254, 181, 'asha1512', 'Yes'),
(255, 182, 'asha1512', 'No'),
(256, 183, 'asha1512', 'Yes'),
(257, 184, 'asha1512', 'Yes'),
(258, 185, 'asha1512', 'No'),
(259, 186, 'asha1512', 'No'),
(260, 187, 'asha1512', 'No'),
(261, 188, 'asha1512', 'No'),
(262, 189, 'asha1512', 'No'),
(263, 190, 'asha1512', 'No'),
(264, 179, 'asha1512', 'Yes'),
(265, 180, 'asha1512', 'No'),
(266, 181, 'asha1512', 'Yes'),
(267, 182, 'asha1512', 'No'),
(268, 183, 'asha1512', 'Yes'),
(269, 184, 'asha1512', 'Yes'),
(270, 185, 'asha1512', 'No'),
(271, 186, 'asha1512', 'No'),
(272, 187, 'asha1512', 'No'),
(273, 188, 'asha1512', 'No'),
(274, 189, 'asha1512', 'No'),
(275, 190, 'asha1512', 'No'),
(276, 179, 'asha1512', 'Yes'),
(277, 180, 'asha1512', 'No'),
(278, 181, 'asha1512', 'Yes'),
(279, 182, 'asha1512', 'No'),
(280, 183, 'asha1512', 'Yes'),
(281, 184, 'asha1512', 'Yes'),
(282, 185, 'asha1512', 'No'),
(283, 186, 'asha1512', 'No'),
(284, 187, 'asha1512', 'No'),
(285, 188, 'asha1512', 'No'),
(286, 189, 'asha1512', 'No'),
(287, 190, 'asha1512', 'No'),
(288, 179, 'asha1512', 'Yes'),
(289, 180, 'asha1512', 'No'),
(290, 181, 'asha1512', 'Yes'),
(291, 182, 'asha1512', 'No'),
(292, 183, 'asha1512', 'Yes'),
(293, 184, 'asha1512', 'Yes'),
(294, 185, 'asha1512', 'No'),
(295, 186, 'asha1512', 'No'),
(296, 187, 'asha1512', 'No'),
(297, 188, 'asha1512', 'No'),
(298, 189, 'asha1512', 'No'),
(299, 190, 'asha1512', 'No'),
(300, 179, 'asha1512', 'Yes'),
(301, 180, 'asha1512', 'No'),
(302, 181, 'asha1512', 'Yes'),
(303, 182, 'asha1512', 'No'),
(304, 183, 'asha1512', 'Yes'),
(305, 184, 'asha1512', 'Yes'),
(306, 185, 'asha1512', 'No'),
(307, 186, 'asha1512', 'No'),
(308, 187, 'asha1512', 'No'),
(309, 188, 'asha1512', 'No'),
(310, 189, 'asha1512', 'No'),
(311, 190, 'asha1512', 'No'),
(312, 179, 'asha1512', 'Yes'),
(313, 180, 'asha1512', 'No'),
(314, 181, 'asha1512', 'No'),
(315, 182, 'asha1512', 'No'),
(316, 183, 'asha1512', 'No'),
(317, 184, 'asha1512', 'No'),
(318, 185, 'asha1512', 'No'),
(319, 186, 'asha1512', 'No'),
(320, 187, 'asha1512', 'No'),
(321, 188, 'asha1512', 'No'),
(322, 189, 'asha1512', 'No'),
(323, 190, 'asha1512', 'No'),
(324, 179, 'asha1512', 'Yes'),
(325, 180, 'asha1512', 'No'),
(326, 181, 'asha1512', 'Yes'),
(327, 182, 'asha1512', 'No'),
(328, 183, 'asha1512', 'Yes'),
(329, 184, 'asha1512', 'Yes'),
(330, 185, 'asha1512', 'No'),
(331, 186, 'asha1512', 'No'),
(332, 187, 'asha1512', 'No'),
(333, 188, 'asha1512', 'No'),
(334, 189, 'asha1512', 'No'),
(335, 190, 'asha1512', 'No'),
(336, 179, 'asha1512', 'Yes'),
(337, 180, 'asha1512', 'No'),
(338, 181, 'asha1512', 'No'),
(339, 182, 'asha1512', 'No'),
(340, 183, 'asha1512', 'No'),
(341, 184, 'asha1512', 'No'),
(342, 185, 'asha1512', 'No'),
(343, 186, 'asha1512', 'No'),
(344, 187, 'asha1512', 'No'),
(345, 188, 'asha1512', 'No'),
(346, 189, 'asha1512', 'No'),
(347, 190, 'asha1512', 'No'),
(348, 179, 'asha1512', 'Yes'),
(349, 180, 'asha1512', 'No'),
(350, 181, 'asha1512', 'Yes'),
(351, 182, 'asha1512', 'No'),
(352, 183, 'asha1512', 'Yes'),
(353, 184, 'asha1512', 'Yes'),
(354, 185, 'asha1512', 'No'),
(355, 186, 'asha1512', 'No'),
(356, 187, 'asha1512', 'No'),
(357, 188, 'asha1512', 'No'),
(358, 189, 'asha1512', 'No'),
(359, 190, 'asha1512', 'No'),
(360, 179, 'asha1512', 'Yes'),
(361, 180, 'asha1512', 'No'),
(362, 181, 'asha1512', 'No'),
(363, 182, 'asha1512', 'No'),
(364, 183, 'asha1512', 'No'),
(365, 184, 'asha1512', 'No'),
(366, 185, 'asha1512', 'No'),
(367, 186, 'asha1512', 'No'),
(368, 187, 'asha1512', 'No'),
(369, 188, 'asha1512', 'No'),
(370, 189, 'asha1512', 'No'),
(371, 190, 'asha1512', 'No'),
(372, 179, 'asha1512', 'Yes'),
(373, 180, 'asha1512', 'No'),
(374, 181, 'asha1512', 'Yes'),
(375, 182, 'asha1512', 'No'),
(376, 183, 'asha1512', 'Yes'),
(377, 184, 'asha1512', 'Yes'),
(378, 185, 'asha1512', 'No'),
(379, 186, 'asha1512', 'No'),
(380, 187, 'asha1512', 'No'),
(381, 188, 'asha1512', 'No'),
(382, 189, 'asha1512', 'No'),
(383, 190, 'asha1512', 'No'),
(384, 179, 'asha1512', 'Yes'),
(385, 180, 'asha1512', 'No'),
(386, 181, 'asha1512', 'No'),
(387, 182, 'asha1512', 'No'),
(388, 183, 'asha1512', 'No'),
(389, 184, 'asha1512', 'No'),
(390, 185, 'asha1512', 'No'),
(391, 186, 'asha1512', 'No'),
(392, 187, 'asha1512', 'No'),
(393, 188, 'asha1512', 'No'),
(394, 189, 'asha1512', 'No'),
(395, 190, 'asha1512', 'No'),
(396, 179, 'asha1512', 'Yes'),
(397, 180, 'asha1512', 'No'),
(398, 181, 'asha1512', 'Yes'),
(399, 182, 'asha1512', 'No'),
(400, 183, 'asha1512', 'Yes'),
(401, 184, 'asha1512', 'Yes'),
(402, 185, 'asha1512', 'No'),
(403, 186, 'asha1512', 'No'),
(404, 187, 'asha1512', 'No'),
(405, 188, 'asha1512', 'No'),
(406, 189, 'asha1512', 'No'),
(407, 190, 'asha1512', 'No'),
(408, 179, 'asha1512', 'Yes'),
(409, 180, 'asha1512', 'No'),
(410, 181, 'asha1512', 'No'),
(411, 182, 'asha1512', 'No'),
(412, 183, 'asha1512', 'No'),
(413, 184, 'asha1512', 'No'),
(414, 185, 'asha1512', 'No'),
(415, 186, 'asha1512', 'No'),
(416, 187, 'asha1512', 'No'),
(417, 188, 'asha1512', 'No'),
(418, 189, 'asha1512', 'No'),
(419, 190, 'asha1512', 'No'),
(420, 179, 'asha1514', 'Yes'),
(421, 180, 'asha1514', 'No'),
(422, 181, 'asha1514', 'No'),
(423, 182, 'asha1514', 'No'),
(424, 183, 'asha1514', 'No'),
(425, 184, 'asha1514', 'No'),
(426, 185, 'asha1514', 'No'),
(427, 186, 'asha1514', 'No'),
(428, 187, 'asha1514', 'No'),
(429, 188, 'asha1514', 'No'),
(430, 189, 'asha1514', 'No'),
(431, 190, 'asha1514', 'No'),
(432, 179, 'asha1512', 'Yes'),
(433, 180, 'asha1512', 'No'),
(434, 181, 'asha1512', 'Yes'),
(435, 182, 'asha1512', 'No'),
(436, 183, 'asha1512', 'Yes'),
(437, 184, 'asha1512', 'Yes'),
(438, 185, 'asha1512', 'No'),
(439, 186, 'asha1512', 'No'),
(440, 187, 'asha1512', 'No'),
(441, 188, 'asha1512', 'No'),
(442, 189, 'asha1512', 'No'),
(443, 190, 'asha1512', 'No'),
(444, 179, 'asha1512', 'Yes'),
(445, 180, 'asha1512', 'No'),
(446, 181, 'asha1512', 'No'),
(447, 182, 'asha1512', 'No'),
(448, 183, 'asha1512', 'No'),
(449, 184, 'asha1512', 'No'),
(450, 185, 'asha1512', 'No'),
(451, 186, 'asha1512', 'No'),
(452, 187, 'asha1512', 'No'),
(453, 188, 'asha1512', 'No'),
(454, 189, 'asha1512', 'No'),
(455, 190, 'asha1512', 'No'),
(456, 179, 'asha1514', 'Yes'),
(457, 180, 'asha1514', 'No'),
(458, 181, 'asha1514', 'No'),
(459, 182, 'asha1514', 'No'),
(460, 183, 'asha1514', 'No'),
(461, 184, 'asha1514', 'No'),
(462, 185, 'asha1514', 'No'),
(463, 186, 'asha1514', 'No'),
(464, 187, 'asha1514', 'No'),
(465, 188, 'asha1514', 'No'),
(466, 189, 'asha1514', 'No'),
(467, 190, 'asha1514', 'No'),
(468, 179, 'asha1512', 'Yes'),
(469, 180, 'asha1512', 'No'),
(470, 181, 'asha1512', 'Yes'),
(471, 182, 'asha1512', 'No'),
(472, 183, 'asha1512', 'Yes'),
(473, 184, 'asha1512', 'Yes'),
(474, 185, 'asha1512', 'No'),
(475, 186, 'asha1512', 'No'),
(476, 187, 'asha1512', 'No'),
(477, 188, 'asha1512', 'No'),
(478, 189, 'asha1512', 'No'),
(479, 190, 'asha1512', 'No'),
(480, 179, 'asha1512', 'Yes'),
(481, 180, 'asha1512', 'No'),
(482, 181, 'asha1512', 'No'),
(483, 182, 'asha1512', 'No'),
(484, 183, 'asha1512', 'No'),
(485, 184, 'asha1512', 'No'),
(486, 185, 'asha1512', 'No'),
(487, 186, 'asha1512', 'No'),
(488, 187, 'asha1512', 'No'),
(489, 188, 'asha1512', 'No'),
(490, 189, 'asha1512', 'No'),
(491, 190, 'asha1512', 'No'),
(492, 179, 'asha1514', 'Yes'),
(493, 180, 'asha1514', 'No'),
(494, 181, 'asha1514', 'No'),
(495, 182, 'asha1514', 'No'),
(496, 183, 'asha1514', 'No'),
(497, 184, 'asha1514', 'No'),
(498, 185, 'asha1514', 'No'),
(499, 186, 'asha1514', 'No'),
(500, 187, 'asha1514', 'No'),
(501, 188, 'asha1514', 'No'),
(502, 189, 'asha1514', 'No'),
(503, 190, 'asha1514', 'No'),
(504, 179, 'asha1512', 'Yes'),
(505, 180, 'asha1512', 'No'),
(506, 181, 'asha1512', 'Yes'),
(507, 182, 'asha1512', 'No'),
(508, 183, 'asha1512', 'Yes'),
(509, 184, 'asha1512', 'Yes'),
(510, 185, 'asha1512', 'No'),
(511, 186, 'asha1512', 'No'),
(512, 187, 'asha1512', 'No'),
(513, 188, 'asha1512', 'No'),
(514, 189, 'asha1512', 'No'),
(515, 190, 'asha1512', 'No'),
(516, 179, 'asha1512', 'Yes'),
(517, 180, 'asha1512', 'No'),
(518, 181, 'asha1512', 'No'),
(519, 182, 'asha1512', 'No'),
(520, 183, 'asha1512', 'No'),
(521, 184, 'asha1512', 'No'),
(522, 185, 'asha1512', 'No'),
(523, 186, 'asha1512', 'No'),
(524, 187, 'asha1512', 'No'),
(525, 188, 'asha1512', 'No'),
(526, 189, 'asha1512', 'No'),
(527, 190, 'asha1512', 'No'),
(528, 179, 'asha1514', 'Yes'),
(529, 180, 'asha1514', 'No'),
(530, 181, 'asha1514', 'No'),
(531, 182, 'asha1514', 'No'),
(532, 183, 'asha1514', 'No'),
(533, 184, 'asha1514', 'No'),
(534, 185, 'asha1514', 'No'),
(535, 186, 'asha1514', 'No'),
(536, 187, 'asha1514', 'No'),
(537, 188, 'asha1514', 'No'),
(538, 189, 'asha1514', 'No'),
(539, 190, 'asha1514', 'No'),
(540, 179, 'asha1510', 'Yes'),
(541, 180, 'asha1510', 'Yes'),
(542, 181, 'asha1510', 'No'),
(543, 182, 'asha1510', 'No'),
(544, 183, 'asha1510', 'Yes'),
(545, 184, 'asha1510', 'No'),
(546, 185, 'asha1510', 'Yes'),
(547, 186, 'asha1510', 'No'),
(548, 187, 'asha1510', 'Yes'),
(549, 188, 'asha1510', 'No'),
(550, 189, 'asha1510', 'Yes'),
(551, 190, 'asha1510', 'No'),
(552, 179, 'asha1510', 'Yes'),
(553, 180, 'asha1510', 'Yes'),
(554, 181, 'asha1510', 'No'),
(555, 182, 'asha1510', 'No'),
(556, 183, 'asha1510', 'Yes'),
(557, 184, 'asha1510', 'No'),
(558, 185, 'asha1510', 'Yes'),
(559, 186, 'asha1510', 'No'),
(560, 187, 'asha1510', 'Yes'),
(561, 188, 'asha1510', 'No'),
(562, 189, 'asha1510', 'Yes'),
(563, 190, 'asha1510', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `hm_survey_template`
--

CREATE TABLE `hm_survey_template` (
  `Survey_template_id` int(10) UNSIGNED NOT NULL,
  `Programs_id` int(10) UNSIGNED NOT NULL,
  `Survey_Template_Name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Survey_Template_Description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Survey_Template_Type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_survey_template`
--

INSERT INTO `hm_survey_template` (`Survey_template_id`, `Programs_id`, `Survey_Template_Name`, `Survey_Template_Description`, `Survey_Template_Type`) VALUES
(1, 1, 'Preg_HRA', 'HRA description', 'hra'),
(2, 1, 'Preg_FB', 'Feedback form for pregnancy', 'feedback');

-- --------------------------------------------------------

--
-- Table structure for table `hm_tasks_patient`
--

CREATE TABLE `hm_tasks_patient` (
  `Tasks_Patient_id` int(10) UNSIGNED NOT NULL,
  `Patient_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `User_tasks_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_tasks_patient`
--

INSERT INTO `hm_tasks_patient` (`Tasks_Patient_id`, `Patient_id`, `User_tasks_id`) VALUES
(4, 'asha1512', 178),
(5, 'asha1510', 179),
(6, 'asha1511', 180);

-- --------------------------------------------------------

--
-- Table structure for table `hm_user`
--

CREATE TABLE `hm_user` (
  `User_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Programs_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_user`
--

INSERT INTO `hm_user` (`User_id`, `Programs_id`) VALUES
('ANM1', 1),
('ASHA1', 1),
('HO1', 1),
('MO1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hm_user_actor`
--

CREATE TABLE `hm_user_actor` (
  `User_actor_id` int(10) UNSIGNED NOT NULL,
  `Programs_id` int(10) UNSIGNED NOT NULL,
  `User_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Actor_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_user_actor`
--

INSERT INTO `hm_user_actor` (`User_actor_id`, `Programs_id`, `User_id`, `Actor_id`) VALUES
(1, 1, 'MO1', 2),
(2, 1, 'HO1', 1),
(3, 1, 'ANM1', 3),
(4, 1, 'ASHA1', 4);

-- --------------------------------------------------------

--
-- Table structure for table `hm_user_details`
--

CREATE TABLE `hm_user_details` (
  `User_Details_id` int(10) UNSIGNED NOT NULL,
  `User_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PHC_ID` int(10) UNSIGNED NOT NULL,
  `User_Name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `User_Password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `User_qualification` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `User_reg_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `User_contact_number` int(10) UNSIGNED DEFAULT NULL,
  `User_Emergency_contact` int(11) NOT NULL,
  `User_Address1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `User_Address2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `User_email_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `User_Place_ofWork` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `User_Profile_Image` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_user_details`
--

INSERT INTO `hm_user_details` (`User_Details_id`, `User_id`, `PHC_ID`, `User_Name`, `User_Password`, `User_qualification`, `User_reg_id`, `User_contact_number`, `User_Emergency_contact`, `User_Address1`, `User_Address2`, `User_email_id`, `User_Place_ofWork`, `User_Profile_Image`) VALUES
(1, 'MO1', 1, 'mo1', 'mo1', 'MBBS', NULL, 324234, 3434534, 'kothrud', 'pune', NULL, NULL, NULL),
(2, 'HO1', 1, 'ho1', 'ho1', 'MBBS', NULL, 33434, 3434, 'Nul stop', 'Pune', NULL, NULL, NULL),
(3, 'ANM1', 1, 'anm1', 'anm1', 'HSC', NULL, 34534, 567567, 'wakad', 'pune', NULL, NULL, NULL),
(4, 'ASHA1', 1, 'asha1', 'asha1', 'SSC', NULL, 3453454, 345345, 'chinchwad ', 'pune', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hm_user_tasks`
--

CREATE TABLE `hm_user_tasks` (
  `User_Tasks_id` int(10) UNSIGNED NOT NULL,
  `Andriod_User_Tasks_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `User_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Programs_id` int(10) UNSIGNED NOT NULL,
  `User_Task_Name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `User_Task_Description` text COLLATE utf8_unicode_ci,
  `User_Task_Type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `User_Task_Severity` int(10) UNSIGNED DEFAULT NULL,
  `User_Task_Date` datetime DEFAULT NULL,
  `User_Task_Actionable` tinyint(1) DEFAULT NULL,
  `User_Task_Action` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Created_Date` datetime DEFAULT NULL,
  `User_task_Venue` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `User_start_time` datetime DEFAULT NULL,
  `User_end_time` datetime DEFAULT NULL,
  `User_Reminder_interval` int(10) UNSIGNED DEFAULT NULL,
  `Task_Status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Task_Viewed` tinyint(1) DEFAULT NULL,
  `All_Day` tinyint(1) DEFAULT NULL,
  `Set_Reminder` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_user_tasks`
--

INSERT INTO `hm_user_tasks` (`User_Tasks_id`, `Andriod_User_Tasks_id`, `User_id`, `Programs_id`, `User_Task_Name`, `User_Task_Description`, `User_Task_Type`, `User_Task_Severity`, `User_Task_Date`, `User_Task_Actionable`, `User_Task_Action`, `Created_Date`, `User_task_Venue`, `User_start_time`, `User_end_time`, `User_Reminder_interval`, `Task_Status`, `Created_by`, `Task_Viewed`, `All_Day`, `Set_Reminder`) VALUES
(9, NULL, 'ASHA1', 1, 'Uploade latest videos for Asha', 'Uploade latest videos for Asha description', 'task', 1, '2016-09-12 17:15:00', 1, NULL, '2016-09-12 14:03:00', 'test venue33', '2016-09-12 17:15:00', '2016-09-12 17:45:00', NULL, NULL, 'MO1', NULL, NULL, NULL),
(10, NULL, 'ASHA1', 1, 'Task testing 27 july', 'Task testing 27 july', 'task', 1, '2016-07-27 17:15:00', 1, NULL, '2016-07-25 14:03:00', 'test venue33', '2016-07-25 17:15:00', '2016-07-25 17:45:00', NULL, NULL, 'MO1', NULL, NULL, NULL),
(11, NULL, 'ASHA1', 1, 'Notification testing 27 july', 'Notification testing 27 july', 'notification', 1, '2016-07-27 17:15:00', 1, NULL, '2016-07-25 14:03:00', 'test venue33', '2016-07-25 17:15:00', '2016-07-25 17:45:00', NULL, NULL, 'MO1', NULL, NULL, NULL),
(72, NULL, 'ASHA1', 1, 'Health checkup camp at kothrud', 'please attend Health checkup camp at kothrud', 'activity', NULL, '2016-07-27 00:00:00', NULL, NULL, '2016-07-27 15:57:00', 'kothrud', '2016-07-27 00:00:00', '2016-07-28 00:00:00', NULL, NULL, 'MO1', NULL, 1, NULL),
(74, NULL, 'ASHA1', 1, 'Team Meeting at null stop', 'Please attend Team Meeting at null stop', 'activity', NULL, '2016-07-28 15:00:00', NULL, NULL, '2016-07-27 15:57:00', 'null stop', '2016-07-28 15:00:00', '2016-07-28 16:00:00', NULL, NULL, 'MO1', NULL, NULL, NULL),
(81, NULL, 'MO1', 1, 'Training camp for ASHA', 'Please attend Training camp for ASHA', 'activity', NULL, '2016-07-27 16:30:00', NULL, NULL, '2016-07-27 16:03:00', 'Pandit Bhimsen joshi auditoriam', '2016-07-27 16:30:00', '2016-07-27 17:00:00', NULL, NULL, 'MO1', NULL, NULL, NULL),
(82, NULL, 'ANM1', 1, 'Training camp for ASHA', 'Please attend Training camp for ASHA', 'activity', NULL, '2016-07-27 16:30:00', NULL, NULL, '2016-07-27 16:03:00', 'Pandit Bhimsen joshi auditoriam', '2016-07-27 16:30:00', '2016-07-27 17:00:00', NULL, NULL, 'MO1', NULL, NULL, NULL),
(83, NULL, 'ASHA1', 1, 'Training camp for ASHA', 'Please attend Training camp for ASHA', 'activity', NULL, '2016-07-27 16:30:00', NULL, NULL, '2016-07-27 16:03:00', 'Pandit Bhimsen joshi auditoriam', '2016-07-27 16:30:00', '2016-07-27 17:00:00', NULL, NULL, 'MO1', NULL, NULL, NULL),
(84, NULL, 'ANM1', 1, 'Meeting for health problem discussions', 'Group meeting for health problem discussions', 'myactivity', NULL, '2016-07-27 16:07:00', NULL, NULL, '2016-07-27 16:07:00', 'location', '2016-07-27 16:07:00', '2016-07-27 22:07:00', NULL, NULL, 'MO1', NULL, NULL, NULL),
(85, 'asha1_a_406', 'ASHA1', 1, 'Meeting for health problem discussions', 'Group meeting for health problem discussions', 'myactivity', NULL, '2016-07-27 16:07:00', NULL, NULL, '2016-07-27 16:07:00', 'location', '2016-07-27 16:07:00', '2016-07-27 22:07:00', NULL, 'Done', 'MO1', NULL, NULL, NULL),
(90, 'asha1_a_27', 'ASHA1', 1, 'meeting in mercury conf room', 'plz attend meeting in mercury', 'myactivity', NULL, '2016-07-28 17:26:00', NULL, NULL, '2016-07-27 17:26:00', 'nul stop', '2016-07-28 17:26:00', '2016-07-28 23:26:00', NULL, 'Done', 'MO1', NULL, NULL, NULL),
(91, NULL, 'MO1', 1, 'Health check up camp in mercury', 'please attend health camp in mercury', 'activity', NULL, '2016-07-27 17:27:00', NULL, NULL, '2016-07-27 17:27:00', 'kothrud', '2016-07-27 17:27:00', '2016-07-27 18:00:00', NULL, NULL, 'MO1', NULL, NULL, NULL),
(92, NULL, 'ASHA1', 1, 'Health check up camp in mercury', 'please attend health camp in mercury', 'activity', NULL, '2016-07-27 17:27:00', NULL, NULL, '2016-07-27 17:27:00', 'kothrud', '2016-07-27 17:27:00', '2016-07-27 18:00:00', NULL, NULL, 'MO1', NULL, NULL, NULL),
(135, NULL, 'ANM1', 1, 'fghfgh', NULL, 'myactivity', NULL, '2016-07-28 16:42:00', NULL, NULL, '2016-07-28 16:42:00', 'fghfgh', '2016-07-28 16:42:00', '2016-07-28 22:42:00', NULL, NULL, 'MO1', NULL, NULL, NULL),
(145, NULL, 'MO1', 1, 'Megha Akash Sane(PID:asha149)', 'Normal', 'activity', NULL, NULL, NULL, NULL, '2016-07-28 17:45:24', '', '2016-07-28 14:00:00', '2016-07-28 14:15:00', 0, NULL, 'MO1', NULL, 0, 0),
(146, NULL, 'MO1', 1, 'Patient Nikita is Critical', 'Patient Nikita is Critical', 'notification', NULL, '2016-07-28 00:00:00', NULL, NULL, '2016-07-11 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(151, NULL, 'MO1', 1, 'Approve care plan of patient', 'Approve care plan of patient Shila Haris Pansare', 'task', 3, '2016-07-28 19:14:56', 1, NULL, '2016-07-28 19:14:56', NULL, NULL, NULL, NULL, NULL, 'MO1', NULL, NULL, NULL),
(157, NULL, 'MO1', 1, 'Approve care plan of patient', 'Approve care plan of patient Radha yadav ', 'task', 3, '2016-07-29 11:18:55', 1, NULL, '2016-07-29 11:18:55', NULL, NULL, NULL, NULL, NULL, 'MO1', NULL, NULL, NULL),
(160, NULL, 'MO1', 1, 'Approve care plan of patient', 'Approve care plan of patient Nikita \r\nID 254125', 'task', 3, '0000-00-00 00:00:00', 1, NULL, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, NULL, 'anm1', NULL, NULL, NULL),
(164, 'asha1_a_407', 'asha1', 1, 'Check blood pressure', 'critical', 'MyActivity', NULL, '2016-08-19 00:00:00', NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, NULL, 5, 'Due', 'asha1', NULL, NULL, 1),
(165, NULL, 'MO1', 1, 'Patient is referred', 'Patient Kalabai Tawde (PID: asha1509) is severely anemic', 'task', 1, '2016-09-08 14:46:53', 1, NULL, '2016-09-08 14:46:53', NULL, NULL, NULL, NULL, NULL, 'asha1', NULL, NULL, NULL),
(166, NULL, 'MO1', 1, 'Patient is referred', 'Patient Gangabai Aapte (PID: asha1510) has BP is Low', 'task', 1, '2016-09-08 18:16:42', 1, NULL, '2016-09-08 18:16:42', NULL, NULL, NULL, NULL, NULL, 'asha1', NULL, NULL, NULL),
(167, NULL, 'MO1', 1, 'Patient is referred', 'Patient Kantabai Tawde (PID: asha1511) has High BP', 'task', 1, '2016-09-08 19:08:47', 1, NULL, '2016-09-08 19:08:47', NULL, NULL, NULL, NULL, NULL, 'asha1', NULL, NULL, NULL),
(168, NULL, 'MO1', 1, 'Gangabai Ishwar Aapte(PID:asha1510)', 'Critical', 'activity', NULL, NULL, NULL, NULL, '2016-09-08 19:27:07', '', '2016-09-08 19:26:54', '2016-09-08 19:41:54', 0, NULL, 'MO1', NULL, 0, 0),
(169, NULL, 'MO1', 1, 'Patient is referred', 'Patient Kantabai Tawde (PID: asha1511) is severely anemic', 'task', 1, '2016-09-12 11:53:50', 1, NULL, '2016-09-12 11:53:50', NULL, NULL, NULL, NULL, NULL, 'asha1', NULL, NULL, NULL),
(170, 'asha1_a_408', 'ASHA1', 1, 'Visit Kantabai Tawde', NULL, 'myactivity', NULL, '2016-09-12 00:00:00', NULL, NULL, '2016-09-12 12:28:00', 'Pune', '2016-09-12 00:00:00', '2016-09-13 00:00:00', 10, NULL, 'MO1', NULL, 1, 1),
(171, NULL, 'MO1', 1, 'Patient is referred', 'Patient Gangabai Aapte (PID: asha1510) has High BP', 'task', 1, '2016-09-12 12:32:34', 1, NULL, '2016-09-12 12:32:34', NULL, NULL, NULL, NULL, NULL, 'asha1', NULL, NULL, NULL),
(172, NULL, 'MO1', 1, 'Shila Haris Pansare(PID:asha1512)', 'Normal', 'activity', NULL, NULL, NULL, NULL, '2016-09-12 13:23:16', '', '2016-09-12 13:22:50', '2016-09-12 13:37:50', 0, NULL, 'MO1', NULL, 0, 0),
(173, NULL, 'MO1', 1, 'Patient is referred', 'Patient Gangabai Aapte (PID: asha1510) has BP is Low', 'task', 1, '2016-09-12 13:41:38', 1, NULL, '2016-09-12 13:41:38', NULL, NULL, NULL, NULL, NULL, 'asha1', NULL, NULL, NULL),
(174, NULL, 'MO1', 1, 'Add Task for Asha', NULL, 'activity', NULL, NULL, NULL, NULL, '2016-09-12 14:44:00', 'Pune', '2016-09-13 14:44:00', '2016-09-12 16:44:00', 10, NULL, 'MO1', NULL, 0, 1),
(175, NULL, 'MO1', 1, 'Patient is referred', 'Patient Shila Pansare (PID: asha1512) is severely anemic', 'task', 1, '2016-09-12 16:32:59', 1, NULL, '2016-09-12 16:32:59', NULL, NULL, NULL, NULL, NULL, 'asha1', NULL, NULL, NULL),
(176, NULL, 'MO1', 1, 'Approve care plan of patient', 'Approve care plan of patient Shila Pansare(PID:  asha1512)', 'task', 3, '2016-09-12 17:00:32', 1, NULL, '2016-09-12 17:00:32', NULL, NULL, NULL, NULL, NULL, 'MO1', NULL, NULL, NULL),
(177, 'asha1_a_409', 'ASHA1', 1, 'Home visits for Counselling', 'Conduct visits for Counselling - Adolscents', 'myactivity', NULL, '2016-09-12 00:00:00', NULL, NULL, '2016-09-12 17:04:00', 'Ambegaon', '2016-09-12 00:00:00', '2016-09-13 00:00:00', 15, NULL, 'MO1', NULL, 1, 1),
(178, NULL, 'ASHA1', 1, 'Take Vitals for Shila Haris Pansare', 'Take Vitals for Shila Haris Pansare', 'task', 1, '2016-09-12 13:43:00', 1, NULL, '2016-09-12 07:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(179, NULL, 'ASHA1', 1, 'Take HB of patient', 'Take HB of patient', 'task', 2, '2016-09-13 12:00:00', 1, NULL, '2016-09-12 11:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(180, NULL, 'ASHA1', 1, 'Take BP', 'Take BP', 'task', 2, '2016-09-11 09:00:00', 1, NULL, '2016-09-11 11:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(181, NULL, 'ASHA1', 1, 'Health check up camp', 'Health check up camp at Pune', 'notification', 1, '2016-09-12 14:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(182, NULL, 'MO1', 1, 'Approve care plan of patient', 'Approve care plan of patient Gangabai Aapte(PID:  asha1510)', 'task', 3, '2016-09-12 18:10:17', 1, NULL, '2016-09-12 18:10:17', NULL, NULL, NULL, NULL, NULL, 'MO1', NULL, NULL, NULL),
(183, NULL, 'MO1', 1, 'Approve care plan of patient', 'Approve care plan of patient Gangabai Aapte(PID:  asha1510)', 'task', 3, '2016-09-12 18:10:17', 1, NULL, '2016-09-12 18:10:17', NULL, NULL, NULL, NULL, NULL, 'MO1', NULL, NULL, NULL),
(184, NULL, 'MO1', 1, 'Patient is referred', 'Patient Kantabai Tawde (PID: asha1511) is severely anemic', 'task', 1, '2016-09-12 18:15:16', 1, NULL, '2016-09-12 18:15:16', NULL, NULL, NULL, NULL, NULL, 'asha1', NULL, NULL, NULL),
(185, NULL, 'MO1', 1, 'Patient is referred', 'Patient Kantabai Tawde (PID: asha1511) is severely anemic', 'task', 1, '2016-09-12 18:15:26', 1, NULL, '2016-09-12 18:15:26', NULL, NULL, NULL, NULL, NULL, 'asha1', NULL, NULL, NULL),
(186, NULL, 'MO1', 1, 'Patient is referred', 'Patient Kantabai Tawde (PID: asha1511) has BP is High', 'task', 1, '2016-09-12 18:18:34', 1, NULL, '2016-09-12 18:18:34', NULL, NULL, NULL, NULL, NULL, 'asha1', NULL, NULL, NULL),
(187, NULL, 'MO1', 1, 'Patient is referred', 'Patient Shantabai Patil (PID: asha1513) is severely anemic', 'task', 1, '2016-09-12 18:22:08', 1, NULL, '2016-09-12 18:22:08', NULL, NULL, NULL, NULL, NULL, 'asha1', NULL, NULL, NULL),
(191, 'asha1_a_410', 'ASHA1', 1, 'Conduct Counselling session', 'Conduct session for Parents - Family Planning', 'myactivity', NULL, '2016-09-12 20:03:00', NULL, NULL, '2016-09-12 20:03:00', 'Ambegaon', '2016-09-12 20:03:00', '2016-09-12 23:04:00', 10, NULL, 'MO1', NULL, NULL, 1),
(192, NULL, 'MO1', 1, 'Kantabai Ramdas Tawde(PID:asha1511)', 'Critical', 'activity', NULL, NULL, NULL, NULL, '2016-09-13 18:37:29', '', '2016-09-13 18:37:22', '2016-09-13 18:52:22', 0, NULL, 'MO1', NULL, 0, 0),
(193, NULL, 'MO1', 1, 'Shila Haris Pansare(PID:asha1512)', 'Critical', 'activity', NULL, NULL, NULL, NULL, '2016-09-14 10:22:42', '', '2016-09-14 10:17:30', '2016-09-14 10:32:30', 0, NULL, 'MO1', NULL, 0, 0),
(194, NULL, 'MO1', 1, 'Patient is referred', 'Patient Suman Jadav (PID: asha1517) is severely anemic', 'task', 1, '2016-10-05 11:11:19', 1, NULL, '2016-10-05 11:11:19', NULL, NULL, NULL, NULL, NULL, 'asha1', NULL, NULL, NULL),
(196, NULL, 'HO1', 1, 'ssd', NULL, 'activity', NULL, '2016-10-15 00:00:00', NULL, NULL, '2016-10-13 10:38:00', 'sds', '2016-10-15 00:00:00', '2016-10-16 00:00:00', 5, NULL, 'MO1', NULL, 1, 1),
(199, NULL, 'ANM1', 1, 'gr', NULL, 'activity', NULL, '2016-10-27 00:00:00', NULL, NULL, '2016-10-17 15:29:00', 'verna', '2016-10-27 00:00:00', '2016-10-28 00:00:00', NULL, NULL, 'MO1', NULL, 1, NULL),
(201, NULL, 'HO1', 1, 'gh', NULL, 'activity', NULL, '2016-10-17 15:51:00', NULL, NULL, '2016-10-17 15:51:00', 'fg', '2016-10-17 15:51:00', '2016-10-18 15:51:00', 5, NULL, 'MO1', NULL, NULL, 1),
(203, NULL, 'MO1', 1, 'rer', NULL, 'activity', NULL, '2016-10-17 15:58:00', NULL, NULL, '2016-10-17 15:53:00', 'iuhui', '2016-10-17 15:58:00', '2016-10-18 15:53:00', 5, NULL, 'MO1', NULL, 0, 1),
(204, NULL, 'HO1', 1, 'rer', NULL, 'activity', NULL, '2016-10-17 15:58:00', NULL, NULL, '2016-10-17 15:53:00', 'iuhui', '2016-10-17 15:58:00', '2016-10-18 15:53:00', 5, NULL, 'MO1', NULL, NULL, 1),
(214, NULL, 'MO1', 1, 'Patient is referred', 'Patient Kamla More (PID: asha1514) is severely anemic', 'task', 1, '2016-11-14 17:23:09', 1, NULL, '2016-11-14 17:23:09', NULL, NULL, NULL, NULL, NULL, 'asha1', NULL, NULL, NULL),
(215, NULL, 'MO1', 1, 'Patient is referred', 'Patient Gangabai Aapte (PID: asha1510) has High BP', 'task', 1, '2016-11-15 11:11:34', 1, NULL, '2016-11-15 11:11:34', NULL, NULL, NULL, NULL, NULL, 'asha1', NULL, NULL, NULL),
(216, NULL, 'MO1', 1, 'Patient is referred', 'Patient Gangabai Aapte (PID: asha1510) has High BP', 'task', 1, '2016-11-15 14:19:35', 1, NULL, '2016-11-15 14:19:35', NULL, NULL, NULL, NULL, NULL, 'asha1', NULL, NULL, NULL),
(217, NULL, 'MO1', 1, 'dwd', 'asdsef', 'activity', NULL, '2016-11-16 00:00:00', NULL, NULL, '2016-11-16 14:20:00', 'sdfef', '2016-11-16 00:00:00', '2016-11-17 00:00:00', 10, NULL, 'MO1', NULL, 1, 1),
(218, NULL, 'HO1', 1, 'dwd', 'asdsef', 'activity', NULL, '2016-11-16 00:00:00', NULL, NULL, '2016-11-16 14:20:00', 'sdfef', '2016-11-16 00:00:00', '2016-11-17 00:00:00', 10, NULL, 'MO1', NULL, 1, 1),
(219, NULL, 'MO1', 1, 'Approve care plan of patient', 'Approve care plan of patient Kantabai Tawde(PID:  asha1511)', 'task', 3, '2016-09-12 07:36:48', 1, NULL, '2016-09-12 07:36:48', NULL, NULL, NULL, NULL, NULL, 'MO1', NULL, NULL, NULL),
(220, 'asha1_a_1', 'asha1', 1, 'good', '', 'MyActivity', NULL, '2016-12-09 00:00:00', NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 'Due', 'asha1', NULL, NULL, 1),
(221, 'asha1_a_1', 'asha1', 1, 'wake', 'hey', 'MyActivity', NULL, '2016-12-07 00:00:00', NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 'Due', 'asha1', NULL, NULL, 1),
(222, 'asha1_a_1', 'asha1', 1, 'sleep', 'wow', 'MyActivity', NULL, '2016-12-07 00:00:00', NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 'Due', 'asha1', NULL, NULL, 1),
(223, 'asha1_a_2', 'asha1', 1, 'mirza', 'yahoo', 'MyActivity', NULL, '2016-12-09 00:00:00', NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 'Due', 'asha1', NULL, NULL, 1),
(224, 'asha1_a_4', 'asha1', 1, 'playing game', '', 'MyActivity', NULL, '2016-12-07 00:00:00', NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 'Due', 'asha1', NULL, NULL, 1),
(225, 'asha1_a_1', 'asha1', 1, 'bathing', 'daily', 'MyActivity', NULL, '2016-12-07 00:00:00', NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 'Due', 'asha1', NULL, NULL, 1),
(226, 'asha1_a_1', 'asha1', 1, 'cooking', 'hello', 'MyActivity', NULL, '2016-12-10 00:00:00', NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 'Due', 'asha1', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hm_user_token`
--

CREATE TABLE `hm_user_token` (
  `Token_id` double NOT NULL,
  `User_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_user_token`
--

INSERT INTO `hm_user_token` (`Token_id`, `User_id`) VALUES
(0.006956511875614524, 'ANM1'),
(0.00870744395069778, 'ANM1'),
(0.01115301321260631, 'ANM1'),
(0.02212525508366525, 'ANM1'),
(0.023201701464131474, 'ANM1'),
(0.02398217818699777, 'ANM1'),
(0.026173419319093227, 'ANM1'),
(0.029461033875122666, 'ANM1'),
(0.03869598009623587, 'ANM1'),
(0.04251438821665943, 'ANM1'),
(0.04319602344185114, 'ANM1'),
(0.044887303840368986, 'ANM1'),
(0.0490434963721782, 'ANM1'),
(0.05082947853952646, 'ANM1'),
(0.0552317698020488, 'ANM1'),
(0.07138626836240292, 'ANM1'),
(0.07207274809479713, 'ANM1'),
(0.07585431193001568, 'ANM1'),
(0.07985660992562771, 'ANM1'),
(0.08144612284377217, 'ANM1'),
(0.08636545878835022, 'ANM1'),
(0.09975832514464855, 'ANM1'),
(0.10170863009989262, 'ANM1'),
(0.1120118519756943, 'ANM1'),
(0.11959328968077898, 'ANM1'),
(0.12114735483191907, 'ANM1'),
(0.12499056709930301, 'ANM1'),
(0.12892392999492586, 'ANM1'),
(0.1319265365600586, 'ANM1'),
(0.14081770041957498, 'ANM1'),
(0.1413841953035444, 'ANM1'),
(0.14476187014952302, 'ANM1'),
(0.14628828153945506, 'ANM1'),
(0.14673158270306885, 'ANM1'),
(0.14893872803077102, 'ANM1'),
(0.15221113502047956, 'ANM1'),
(0.15458171162754297, 'ANM1'),
(0.16184524935670197, 'ANM1'),
(0.16267900029197335, 'ANM1'),
(0.17007458768785, 'ANM1'),
(0.17245265771634877, 'ANM1'),
(0.17348908609710634, 'ANM1'),
(0.1750921260099858, 'ANM1'),
(0.17808664962649345, 'ANM1'),
(0.18436991958878934, 'ANM1'),
(0.18635780061595142, 'ANM1'),
(0.18718078336678445, 'ANM1'),
(0.18748596496880054, 'ANM1'),
(0.19346250500530005, 'ANM1'),
(0.19663983909413218, 'ANM1'),
(0.20382502395659685, 'ANM1'),
(0.2040594124700874, 'ANM1'),
(0.20411127735860646, 'ANM1'),
(0.20633577811531723, 'ANM1'),
(0.21391245210543275, 'ANM1'),
(0.22011263761669397, 'ANM1'),
(0.22197671211324632, 'ANM1'),
(0.22274847934022546, 'ANM1'),
(0.22539675515145063, 'ANM1'),
(0.22635834640823305, 'ANM1'),
(0.2367680964525789, 'ANM1'),
(0.24010850372724235, 'ANM1'),
(0.24560654582455754, 'ANM1'),
(0.2482980014756322, 'ANM1'),
(0.2511676005087793, 'ANM1'),
(0.2549748320598155, 'ANM1'),
(0.26343533606268466, 'ANM1'),
(0.2831221795640886, 'ANM1'),
(0.28718890831805766, 'ANM1'),
(0.29293488524854183, 'ANM1'),
(0.30136316805146635, 'ANM1'),
(0.3199760785792023, 'ANM1'),
(0.32607929804362357, 'ANM1'),
(0.33179732598364353, 'ANM1'),
(0.3362305876798928, 'ANM1'),
(0.33916695741936564, 'ANM1'),
(0.3393597458489239, 'ANM1'),
(0.34739264217205346, 'ANM1'),
(0.3548824554309249, 'ANM1'),
(0.3598692596424371, 'ANM1'),
(0.360865713795647, 'ANM1'),
(0.36094551952555776, 'ANM1'),
(0.3640979123301804, 'ANM1'),
(0.3904971815645695, 'ANM1'),
(0.3953120200894773, 'ANM1'),
(0.3956970237195492, 'ANM1'),
(0.40722135943360627, 'ANM1'),
(0.42360532050952315, 'ANM1'),
(0.4255230128765106, 'ANM1'),
(0.43547893571667373, 'ANM1'),
(0.4426360835786909, 'ANM1'),
(0.44510983605869114, 'ANM1'),
(0.4454217106103897, 'ANM1'),
(0.4479084920603782, 'ANM1'),
(0.4532684520818293, 'ANM1'),
(0.4582390997093171, 'ANM1'),
(0.464573566801846, 'ANM1'),
(0.4682084296364337, 'ANM1'),
(0.47412978298962116, 'ANM1'),
(0.47553263255394995, 'ANM1'),
(0.478417266625911, 'ANM1'),
(0.47887876140885055, 'ANM1'),
(0.48862232943065464, 'ANM1'),
(0.4900556483771652, 'ANM1'),
(0.49258619267493486, 'ANM1'),
(0.4995073890313506, 'ANM1'),
(0.5015125528443605, 'ANM1'),
(0.5054466270375997, 'ANM1'),
(0.506866981042549, 'ANM1'),
(0.5076254978775978, 'ANM1'),
(0.5189768399577588, 'ANM1'),
(0.5191950551234186, 'ANM1'),
(0.5206869093235582, 'ANM1'),
(0.524055213900283, 'ANM1'),
(0.5277577743399888, 'ANM1'),
(0.5296129917260259, 'ANM1'),
(0.5363914470653981, 'ANM1'),
(0.5406097073573619, 'ANM1'),
(0.5412597900722176, 'ANM1'),
(0.5417345829773694, 'ANM1'),
(0.544794179033488, 'ANM1'),
(0.5467867581173778, 'ANM1'),
(0.5531274965032935, 'ANM1'),
(0.5566710205748677, 'ANM1'),
(0.5697389941196889, 'ANM1'),
(0.5720445089973509, 'ANM1'),
(0.5738748412113637, 'ANM1'),
(0.5853355696890503, 'ANM1'),
(0.5878001721575856, 'ANM1'),
(0.5920327473431826, 'ANM1'),
(0.6108266066294163, 'ANM1'),
(0.6175230212975293, 'ANM1'),
(0.6292790989391506, 'ANM1'),
(0.6350222509354353, 'ANM1'),
(0.6477587032131851, 'ANM1'),
(0.648467296268791, 'ANM1'),
(0.653380993520841, 'ANM1'),
(0.6537464973516762, 'ANM1'),
(0.6560877826996148, 'ANM1'),
(0.6654030457139015, 'ANM1'),
(0.6749068952631205, 'ANM1'),
(0.6786896486300975, 'ANM1'),
(0.6816464576404542, 'ANM1'),
(0.6816973369568586, 'ANM1'),
(0.6839357989374548, 'ANM1'),
(0.6839925979729742, 'ANM1'),
(0.6965128008741885, 'ANM1'),
(0.704098732676357, 'ANM1'),
(0.7143320504110307, 'ANM1'),
(0.7151344718877226, 'ANM1'),
(0.7180107540916651, 'ANM1'),
(0.7272671989630908, 'ANM1'),
(0.7284069566521794, 'ANM1'),
(0.740713469684124, 'ANM1'),
(0.7423878374975175, 'ANM1'),
(0.7439489776734263, 'ANM1'),
(0.746238000690937, 'ANM1'),
(0.7576419564429671, 'ANM1'),
(0.7660812416579574, 'ANM1'),
(0.7662872136570513, 'ANM1'),
(0.7670095646753907, 'ANM1'),
(0.7698764349333942, 'ANM1'),
(0.7789981833193451, 'ANM1'),
(0.7803908388596028, 'ANM1'),
(0.7807076764293015, 'ANM1'),
(0.7832174741197377, 'ANM1'),
(0.7966269571334124, 'ANM1'),
(0.7988580237142742, 'ANM1'),
(0.804971038363874, 'ANM1'),
(0.8127954371739179, 'ANM1'),
(0.8176535007078201, 'ANM1'),
(0.8184108349960297, 'ANM1'),
(0.8209303021430969, 'ANM1'),
(0.830826900433749, 'ANM1'),
(0.833456548396498, 'ANM1'),
(0.8406190904788673, 'ANM1'),
(0.8441421743482351, 'ANM1'),
(0.8463065437972546, 'ANM1'),
(0.8473716340959072, 'ANM1'),
(0.8533946534153074, 'ANM1'),
(0.8535546180792153, 'ANM1'),
(0.8549936965573579, 'ANM1'),
(0.8581137415021658, 'ANM1'),
(0.8606848698109388, 'ANM1'),
(0.8634036327712238, 'ANM1'),
(0.871293585980311, 'ANM1'),
(0.8812511917203665, 'ANM1'),
(0.8824824637267739, 'ANM1'),
(0.887136343633756, 'ANM1'),
(0.8882456694263965, 'ANM1'),
(0.8900927065405995, 'ANM1'),
(0.8904470454435796, 'ANM1'),
(0.8957966845482588, 'ANM1'),
(0.9002610207535326, 'ANM1'),
(0.910907359328121, 'ANM1'),
(0.9133380560670048, 'ANM1'),
(0.9153642831370234, 'ANM1'),
(0.9299048478715122, 'ANM1'),
(0.941231201402843, 'ANM1'),
(0.945365212392062, 'ANM1'),
(0.9457004999276251, 'ANM1'),
(0.9671499254181981, 'ANM1'),
(0.9674436035566032, 'ANM1'),
(0.9780459431931376, 'ANM1'),
(0.9865730863530189, 'ANM1'),
(0.9871229380369186, 'ANM1'),
(0.9880682986695319, 'ANM1'),
(0.9929420682601631, 'ANM1'),
(0.9940580811817199, 'ANM1'),
(0.00047189369797706604, 'ASHA1'),
(0.002288615331053734, 'ASHA1'),
(0.003119258675724268, 'ASHA1'),
(0.005940559785813093, 'ASHA1'),
(0.006329515017569065, 'ASHA1'),
(0.011161033064126968, 'ASHA1'),
(0.011735140345990658, 'ASHA1'),
(0.012116816593334079, 'ASHA1'),
(0.012191798072308302, 'ASHA1'),
(0.014789060223847628, 'ASHA1'),
(0.01479943678714335, 'ASHA1'),
(0.014925491530448198, 'ASHA1'),
(0.016113454708829522, 'ASHA1'),
(0.018419032217934728, 'ASHA1'),
(0.01886330428533256, 'ASHA1'),
(0.020182084059342742, 'ASHA1'),
(0.021474994719028473, 'ASHA1'),
(0.022341172909364104, 'ASHA1'),
(0.02314247563481331, 'ASHA1'),
(0.026033919537439942, 'ASHA1'),
(0.027720410143956542, 'ASHA1'),
(0.027812853222712874, 'ASHA1'),
(0.031153144547715783, 'ASHA1'),
(0.03484020312316716, 'ASHA1'),
(0.03910763142630458, 'ASHA1'),
(0.04113923991099, 'ASHA1'),
(0.05052292882464826, 'ASHA1'),
(0.05169362621381879, 'ASHA1'),
(0.054435835452750325, 'ASHA1'),
(0.0557047997135669, 'ASHA1'),
(0.057521857554093, 'ASHA1'),
(0.058658931870013475, 'ASHA1'),
(0.061475652968510985, 'ASHA1'),
(0.06302829319611192, 'ASHA1'),
(0.06888016127049923, 'ASHA1'),
(0.07253409666009247, 'ASHA1'),
(0.07392693497240543, 'ASHA1'),
(0.07398131117224693, 'ASHA1'),
(0.07436323096044362, 'ASHA1'),
(0.07563715637661517, 'ASHA1'),
(0.07962137251161039, 'ASHA1'),
(0.08004432846792042, 'ASHA1'),
(0.08113434794358909, 'ASHA1'),
(0.08115024655126035, 'ASHA1'),
(0.08641478465870023, 'ASHA1'),
(0.09065369656309485, 'ASHA1'),
(0.0966097991913557, 'ASHA1'),
(0.09720138879492879, 'ASHA1'),
(0.09782512509264052, 'ASHA1'),
(0.09845478367060423, 'ASHA1'),
(0.09899448649957776, 'ASHA1'),
(0.10457069473341107, 'ASHA1'),
(0.10457984171807766, 'ASHA1'),
(0.1059415047056973, 'ASHA1'),
(0.10662354971282184, 'ASHA1'),
(0.10684244148433208, 'ASHA1'),
(0.10977955348789692, 'ASHA1'),
(0.11032676557078958, 'ASHA1'),
(0.11126101459376514, 'ASHA1'),
(0.11201381706632674, 'ASHA1'),
(0.11325115710496902, 'ASHA1'),
(0.1174419925082475, 'ASHA1'),
(0.1204620678909123, 'ASHA1'),
(0.12056683329865336, 'ASHA1'),
(0.12214127276092768, 'ASHA1'),
(0.12430438166484237, 'ASHA1'),
(0.12628214340656996, 'ASHA1'),
(0.12725428491830826, 'ASHA1'),
(0.12754470692016184, 'ASHA1'),
(0.12824859283864498, 'ASHA1'),
(0.1291925902478397, 'ASHA1'),
(0.13172912714071572, 'ASHA1'),
(0.13278199755586684, 'ASHA1'),
(0.1360991159453988, 'ASHA1'),
(0.13662198069505394, 'ASHA1'),
(0.1396692688576877, 'ASHA1'),
(0.14005531347356737, 'ASHA1'),
(0.1405879808589816, 'ASHA1'),
(0.1424050903879106, 'ASHA1'),
(0.14580413745716214, 'ASHA1'),
(0.14604218816384673, 'ASHA1'),
(0.14621200878173113, 'ASHA1'),
(0.14878391311503947, 'ASHA1'),
(0.15007165679708123, 'ASHA1'),
(0.1513545459602028, 'ASHA1'),
(0.15615093638189137, 'ASHA1'),
(0.15676877228543162, 'ASHA1'),
(0.15711044031195343, 'ASHA1'),
(0.15973361115902662, 'ASHA1'),
(0.162260334007442, 'ASHA1'),
(0.16270692576654255, 'ASHA1'),
(0.16750353877432644, 'ASHA1'),
(0.16848752298392355, 'ASHA1'),
(0.17323670559562743, 'ASHA1'),
(0.17468281742185354, 'ASHA1'),
(0.17471402883529663, 'ASHA1'),
(0.17481208150275052, 'ASHA1'),
(0.17515473812818527, 'ASHA1'),
(0.17837733239866793, 'ASHA1'),
(0.17845557164400816, 'ASHA1'),
(0.1856879002880305, 'ASHA1'),
(0.18579551787115633, 'ASHA1'),
(0.18875125935301185, 'ASHA1'),
(0.19030673755332828, 'ASHA1'),
(0.19050772115588188, 'ASHA1'),
(0.19111150433309376, 'ASHA1'),
(0.19730164436623454, 'ASHA1'),
(0.1973405524622649, 'ASHA1'),
(0.1982278865762055, 'ASHA1'),
(0.19851028639823198, 'ASHA1'),
(0.19870077702216804, 'ASHA1'),
(0.1996077240910381, 'ASHA1'),
(0.19979181024245918, 'ASHA1'),
(0.19979306892491877, 'ASHA1'),
(0.20130888931453228, 'ASHA1'),
(0.20275407214649022, 'ASHA1'),
(0.20490181748755276, 'ASHA1'),
(0.20565043902024627, 'ASHA1'),
(0.20932448212988675, 'ASHA1'),
(0.21104471269063652, 'ASHA1'),
(0.212593006901443, 'ASHA1'),
(0.21370018227025867, 'ASHA1'),
(0.21490558586083353, 'ASHA1'),
(0.21522320457734168, 'ASHA1'),
(0.2223429058212787, 'ASHA1'),
(0.22367413621395826, 'ASHA1'),
(0.22427273564971983, 'ASHA1'),
(0.22455130028538406, 'ASHA1'),
(0.22975649335421622, 'ASHA1'),
(0.2298866577912122, 'ASHA1'),
(0.23049470060504973, 'ASHA1'),
(0.23066838923841715, 'ASHA1'),
(0.23169620521366596, 'ASHA1'),
(0.2327712713740766, 'ASHA1'),
(0.23447223007678986, 'ASHA1'),
(0.2356550123076886, 'ASHA1'),
(0.24038485111668706, 'ASHA1'),
(0.24095050105825067, 'ASHA1'),
(0.24324350664392114, 'ASHA1'),
(0.24567524227313697, 'ASHA1'),
(0.2457816752139479, 'ASHA1'),
(0.2480985843576491, 'ASHA1'),
(0.24935832107439637, 'ASHA1'),
(0.24946736125275493, 'ASHA1'),
(0.2514196827542037, 'ASHA1'),
(0.2535886848345399, 'ASHA1'),
(0.2541601106058806, 'ASHA1'),
(0.25515339290723205, 'ASHA1'),
(0.2586443128529936, 'ASHA1'),
(0.2618626381736249, 'ASHA1'),
(0.26271455688402057, 'ASHA1'),
(0.2633655848912895, 'ASHA1'),
(0.2640607785433531, 'ASHA1'),
(0.2655750750564039, 'ASHA1'),
(0.26719200727529824, 'ASHA1'),
(0.2678573022130877, 'ASHA1'),
(0.26795198814943433, 'ASHA1'),
(0.2686751566361636, 'ASHA1'),
(0.27184666437096894, 'ASHA1'),
(0.27338595944456756, 'ASHA1'),
(0.27611587080173194, 'ASHA1'),
(0.27637738501653075, 'ASHA1'),
(0.2773569514974952, 'ASHA1'),
(0.27803021809086204, 'ASHA1'),
(0.2795880949124694, 'ASHA1'),
(0.28158681374043226, 'ASHA1'),
(0.2816804740577936, 'ASHA1'),
(0.28257202566601336, 'ASHA1'),
(0.285074244486168, 'ASHA1'),
(0.28545851283706725, 'ASHA1'),
(0.2861922241281718, 'ASHA1'),
(0.2863513841293752, 'ASHA1'),
(0.28648446104489267, 'ASHA1'),
(0.2927277637645602, 'ASHA1'),
(0.29687499813735485, 'ASHA1'),
(0.2974189016968012, 'ASHA1'),
(0.2975471157114953, 'ASHA1'),
(0.2980336064938456, 'ASHA1'),
(0.2987237386405468, 'ASHA1'),
(0.3008924664463848, 'ASHA1'),
(0.30193954845890403, 'ASHA1'),
(0.3020134752150625, 'ASHA1'),
(0.3046127811539918, 'ASHA1'),
(0.30939409672282636, 'ASHA1'),
(0.3116629885043949, 'ASHA1'),
(0.3119119117036462, 'ASHA1'),
(0.31196885625831783, 'ASHA1'),
(0.31233421387150884, 'ASHA1'),
(0.31342685711570084, 'ASHA1'),
(0.31444550049491227, 'ASHA1'),
(0.31568169267848134, 'ASHA1'),
(0.31665270309895277, 'ASHA1'),
(0.31839034077711403, 'ASHA1'),
(0.3203138024546206, 'ASHA1'),
(0.32089255563914776, 'ASHA1'),
(0.3222928165923804, 'ASHA1'),
(0.32291958830319345, 'ASHA1'),
(0.3237599607091397, 'ASHA1'),
(0.3257983063813299, 'ASHA1'),
(0.3281906512565911, 'ASHA1'),
(0.3295271878596395, 'ASHA1'),
(0.3327082747127861, 'ASHA1'),
(0.3327631496358663, 'ASHA1'),
(0.33308972720988095, 'ASHA1'),
(0.3333109763916582, 'ASHA1'),
(0.33386258012615144, 'ASHA1'),
(0.33644253946840763, 'ASHA1'),
(0.33678313391283154, 'ASHA1'),
(0.33716411935165524, 'ASHA1'),
(0.3394971452653408, 'ASHA1'),
(0.3411198991816491, 'ASHA1'),
(0.3426478791516274, 'ASHA1'),
(0.3446010129991919, 'ASHA1'),
(0.34727813489735126, 'ASHA1'),
(0.34881151490844786, 'ASHA1'),
(0.3504396758507937, 'ASHA1'),
(0.3524066547397524, 'ASHA1'),
(0.3533209462184459, 'ASHA1'),
(0.35450513823889196, 'ASHA1'),
(0.3597261016257107, 'ASHA1'),
(0.3610309613868594, 'ASHA1'),
(0.3654038568492979, 'ASHA1'),
(0.3719103701878339, 'ASHA1'),
(0.37527022627182305, 'ASHA1'),
(0.3757876872550696, 'ASHA1'),
(0.37871936080046, 'ASHA1'),
(0.3807173187378794, 'ASHA1'),
(0.3841516301035881, 'ASHA1'),
(0.38502312963828444, 'ASHA1'),
(0.3859713433776051, 'ASHA1'),
(0.38844060944393277, 'ASHA1'),
(0.38856867305003107, 'ASHA1'),
(0.39237315370701253, 'ASHA1'),
(0.39389464422129095, 'ASHA1'),
(0.39393886434845626, 'ASHA1'),
(0.3942283811047673, 'ASHA1'),
(0.39463948854245245, 'ASHA1'),
(0.3954112471546978, 'ASHA1'),
(0.3955067319329828, 'ASHA1'),
(0.3962824472691864, 'ASHA1'),
(0.39659358747303486, 'ASHA1'),
(0.39862863766029477, 'ASHA1'),
(0.4050120871979743, 'ASHA1'),
(0.40625038906000555, 'ASHA1'),
(0.407398333074525, 'ASHA1'),
(0.40949271945282817, 'ASHA1'),
(0.4095675062853843, 'ASHA1'),
(0.41034612990915775, 'ASHA1'),
(0.4107539802789688, 'ASHA1'),
(0.41170186386443675, 'ASHA1'),
(0.4124007907230407, 'ASHA1'),
(0.41772484336979687, 'ASHA1'),
(0.4184833678882569, 'ASHA1'),
(0.4216382782906294, 'ASHA1'),
(0.42501974501647055, 'ASHA1'),
(0.42508318508043885, 'ASHA1'),
(0.4255938692949712, 'ASHA1'),
(0.4266334332060069, 'ASHA1'),
(0.42826567171141505, 'ASHA1'),
(0.42885939637199044, 'ASHA1'),
(0.4290420163888484, 'ASHA1'),
(0.42976885032840073, 'ASHA1'),
(0.43467232724651694, 'ASHA1'),
(0.4368285674136132, 'ASHA1'),
(0.4376955982297659, 'ASHA1'),
(0.4460058147087693, 'ASHA1'),
(0.45343348383903503, 'ASHA1'),
(0.45353829581290483, 'ASHA1'),
(0.45652280398644507, 'ASHA1'),
(0.4572549485601485, 'ASHA1'),
(0.4606782414484769, 'ASHA1'),
(0.4612704182509333, 'ASHA1'),
(0.46423887298442423, 'ASHA1'),
(0.4657088543754071, 'ASHA1'),
(0.4662137986160815, 'ASHA1'),
(0.46668695961125195, 'ASHA1'),
(0.4687381898984313, 'ASHA1'),
(0.46966202463954687, 'ASHA1'),
(0.4735621945001185, 'ASHA1'),
(0.47387181618250906, 'ASHA1'),
(0.4756602926645428, 'ASHA1'),
(0.480151048861444, 'ASHA1'),
(0.4805908657144755, 'ASHA1'),
(0.48410028382204473, 'ASHA1'),
(0.48643610649742186, 'ASHA1'),
(0.49109378224238753, 'ASHA1'),
(0.4923650666605681, 'ASHA1'),
(0.4948293510824442, 'ASHA1'),
(0.49625121522694826, 'ASHA1'),
(0.49701161100529134, 'ASHA1'),
(0.4989733926486224, 'ASHA1'),
(0.5032254345715046, 'ASHA1'),
(0.5080585887189955, 'ASHA1'),
(0.5088428827002645, 'ASHA1'),
(0.5100365816615522, 'ASHA1'),
(0.5114058798644692, 'ASHA1'),
(0.5133021001238376, 'ASHA1'),
(0.5161061438266188, 'ASHA1'),
(0.5173488142900169, 'ASHA1'),
(0.5237137542571872, 'ASHA1'),
(0.5250499378889799, 'ASHA1'),
(0.5258989380672574, 'ASHA1'),
(0.5266104880720377, 'ASHA1'),
(0.5270121328067034, 'ASHA1'),
(0.5316958075854927, 'ASHA1'),
(0.5320635032840073, 'ASHA1'),
(0.5377370747737586, 'ASHA1'),
(0.5399429434910417, 'ASHA1'),
(0.540763373253867, 'ASHA1'),
(0.5428873973432928, 'ASHA1'),
(0.5441289218142629, 'ASHA1'),
(0.5462508527562022, 'ASHA1'),
(0.5486775042954832, 'ASHA1'),
(0.5493566209916025, 'ASHA1'),
(0.5526402681134641, 'ASHA1'),
(0.5551281271036714, 'ASHA1'),
(0.557996305404231, 'ASHA1'),
(0.5600257355254143, 'ASHA1'),
(0.5624031268525869, 'ASHA1'),
(0.5652673784643412, 'ASHA1'),
(0.5656726045999676, 'ASHA1'),
(0.5707677293103188, 'ASHA1'),
(0.5722204674966633, 'ASHA1'),
(0.5726186612155288, 'ASHA1'),
(0.5728225521743298, 'ASHA1'),
(0.5746342905331403, 'ASHA1'),
(0.5771632180549204, 'ASHA1'),
(0.578693704912439, 'ASHA1'),
(0.5818905676715076, 'ASHA1'),
(0.5819533986505121, 'ASHA1'),
(0.5825708815827966, 'ASHA1'),
(0.5837070296984166, 'ASHA1'),
(0.5854475779924542, 'ASHA1'),
(0.5865731749217957, 'ASHA1'),
(0.5873721439857036, 'ASHA1'),
(0.5880027150269598, 'ASHA1'),
(0.5892240204848349, 'ASHA1'),
(0.5892842758912593, 'ASHA1'),
(0.5913609378039837, 'ASHA1'),
(0.5924339985940605, 'ASHA1'),
(0.5961395234335214, 'ASHA1'),
(0.600311630172655, 'ASHA1'),
(0.6007742576766759, 'ASHA1'),
(0.6013700580224395, 'ASHA1'),
(0.6098986233118922, 'ASHA1'),
(0.6111077987588942, 'ASHA1'),
(0.61118133389391, 'ASHA1'),
(0.6127852494828403, 'ASHA1'),
(0.6135249864310026, 'ASHA1'),
(0.6153857698664069, 'ASHA1'),
(0.616712607908994, 'ASHA1'),
(0.6182836582884192, 'ASHA1'),
(0.6197787313722074, 'ASHA1'),
(0.6217728944029659, 'ASHA1'),
(0.6221101405099034, 'ASHA1'),
(0.6232980994973332, 'ASHA1'),
(0.6278293146751821, 'ASHA1'),
(0.6294093802571297, 'ASHA1'),
(0.6312149281147867, 'ASHA1'),
(0.6329237786121666, 'ASHA1'),
(0.638237644219771, 'ASHA1'),
(0.6402245559729636, 'ASHA1'),
(0.643410287797451, 'ASHA1'),
(0.6441492720041424, 'ASHA1'),
(0.6444921896327287, 'ASHA1'),
(0.6450160795357078, 'ASHA1'),
(0.647584113990888, 'ASHA1'),
(0.6479559338185936, 'ASHA1'),
(0.6479668118990958, 'ASHA1'),
(0.6486498976591974, 'ASHA1'),
(0.6506871348246932, 'ASHA1'),
(0.655100448988378, 'ASHA1'),
(0.6551630459725857, 'ASHA1'),
(0.6594729721546173, 'ASHA1'),
(0.6644808896817267, 'ASHA1'),
(0.6652147066779435, 'ASHA1'),
(0.6655215276405215, 'ASHA1'),
(0.6660291315056384, 'ASHA1'),
(0.6663973522372544, 'ASHA1'),
(0.6717257867567241, 'ASHA1'),
(0.6717730229720473, 'ASHA1'),
(0.6738052854780108, 'ASHA1'),
(0.6738504939712584, 'ASHA1'),
(0.6778091653250158, 'ASHA1'),
(0.6795117275323719, 'ASHA1'),
(0.6798811377957463, 'ASHA1'),
(0.6813656350132078, 'ASHA1'),
(0.6820620934013277, 'ASHA1'),
(0.6830688584595919, 'ASHA1'),
(0.6836030692793429, 'ASHA1'),
(0.6878546974621713, 'ASHA1'),
(0.6879184115678072, 'ASHA1'),
(0.6883299818728119, 'ASHA1'),
(0.6895995098166168, 'ASHA1'),
(0.6935147137846798, 'ASHA1'),
(0.6935424117837101, 'ASHA1'),
(0.6947105135768652, 'ASHA1'),
(0.7026852420531213, 'ASHA1'),
(0.7127843059133738, 'ASHA1'),
(0.7134432157035917, 'ASHA1'),
(0.7138453614898026, 'ASHA1'),
(0.7139293076470494, 'ASHA1'),
(0.7154184447135776, 'ASHA1'),
(0.7167321003507823, 'ASHA1'),
(0.716825615381822, 'ASHA1'),
(0.7237413330003619, 'ASHA1'),
(0.7243070360273123, 'ASHA1'),
(0.7252817882690579, 'ASHA1'),
(0.7275736378505826, 'ASHA1'),
(0.7285470617935061, 'ASHA1'),
(0.7292130475398153, 'ASHA1'),
(0.7340557721909136, 'ASHA1'),
(0.7367247543297708, 'ASHA1'),
(0.7402697568759322, 'ASHA1'),
(0.7439754796214402, 'ASHA1'),
(0.7462870154995471, 'ASHA1'),
(0.7479527317918837, 'ASHA1'),
(0.7531940517947078, 'ASHA1'),
(0.7567032549995929, 'ASHA1'),
(0.7614949767012149, 'ASHA1'),
(0.7618177183903754, 'ASHA1'),
(0.7626755218952894, 'ASHA1'),
(0.7640075723174959, 'ASHA1'),
(0.7641515822615474, 'ASHA1'),
(0.7669298727996647, 'ASHA1'),
(0.7684770952910185, 'ASHA1'),
(0.7717899733688682, 'ASHA1'),
(0.7731369745451957, 'ASHA1'),
(0.7759153693914413, 'ASHA1'),
(0.7762240353040397, 'ASHA1'),
(0.77845523878932, 'ASHA1'),
(0.7793659842573106, 'ASHA1'),
(0.7839545314200222, 'ASHA1'),
(0.7840041965246201, 'ASHA1'),
(0.7850355717819184, 'ASHA1'),
(0.7856410581152886, 'ASHA1'),
(0.7900097444653511, 'ASHA1'),
(0.7909775013104081, 'ASHA1'),
(0.7941571020055562, 'ASHA1'),
(0.7944654319435358, 'ASHA1'),
(0.7995698768645525, 'ASHA1'),
(0.8033695274498314, 'ASHA1'),
(0.8087081983685493, 'ASHA1'),
(0.8115474490914494, 'ASHA1'),
(0.81184586067684, 'ASHA1'),
(0.8144077276811004, 'ASHA1'),
(0.8150369848590344, 'ASHA1'),
(0.815529785817489, 'ASHA1'),
(0.8157533123157918, 'ASHA1'),
(0.8169207624159753, 'ASHA1'),
(0.8176085958257318, 'ASHA1'),
(0.81855248962529, 'ASHA1'),
(0.8187177265062928, 'ASHA1'),
(0.8251611897721887, 'ASHA1'),
(0.8264676013495773, 'ASHA1'),
(0.8289865734986961, 'ASHA1'),
(0.8310266437474638, 'ASHA1'),
(0.8315243078395724, 'ASHA1'),
(0.8345971882808954, 'ASHA1'),
(0.8347046331036836, 'ASHA1'),
(0.8348902107682079, 'ASHA1'),
(0.8408254610840231, 'ASHA1'),
(0.8412881835829467, 'ASHA1'),
(0.8422698068898171, 'ASHA1'),
(0.8453495332505554, 'ASHA1'),
(0.8489905311726034, 'ASHA1'),
(0.8506823992356658, 'ASHA1'),
(0.8535033548250794, 'ASHA1'),
(0.8546007913537323, 'ASHA1'),
(0.8555726883932948, 'ASHA1'),
(0.8561021240893751, 'ASHA1'),
(0.8569059886503965, 'ASHA1'),
(0.8582378937862813, 'ASHA1'),
(0.8620032370090485, 'ASHA1'),
(0.8653413674328476, 'ASHA1'),
(0.8655080669559538, 'ASHA1'),
(0.868322154507041, 'ASHA1'),
(0.8688900845590979, 'ASHA1'),
(0.8704208270646632, 'ASHA1'),
(0.8731047392357141, 'ASHA1'),
(0.8753960968460888, 'ASHA1'),
(0.8796372693032026, 'ASHA1'),
(0.8806756550911814, 'ASHA1'),
(0.8812162461690605, 'ASHA1'),
(0.8838118694256991, 'ASHA1'),
(0.8853986104950309, 'ASHA1'),
(0.8883382997009903, 'ASHA1'),
(0.8900635011959821, 'ASHA1'),
(0.8910064101219177, 'ASHA1'),
(0.8968541224021465, 'ASHA1'),
(0.9010262896772474, 'ASHA1'),
(0.9056094835978001, 'ASHA1'),
(0.9061027118004858, 'ASHA1'),
(0.9095945344306529, 'ASHA1'),
(0.9134594013448805, 'ASHA1'),
(0.9170554305892438, 'ASHA1'),
(0.9192498573102057, 'ASHA1'),
(0.920505166053772, 'ASHA1'),
(0.9220862451475114, 'ASHA1'),
(0.9221960443537682, 'ASHA1'),
(0.9233013924676925, 'ASHA1'),
(0.9249624786898494, 'ASHA1'),
(0.9249714168254286, 'ASHA1'),
(0.9257003522943705, 'ASHA1'),
(0.9259889267850667, 'ASHA1'),
(0.9273685135412961, 'ASHA1'),
(0.9293902963399887, 'ASHA1'),
(0.930368956644088, 'ASHA1'),
(0.9320775952655822, 'ASHA1'),
(0.9352828895207494, 'ASHA1'),
(0.9359576576389372, 'ASHA1'),
(0.9367943233810365, 'ASHA1'),
(0.9374564248137176, 'ASHA1'),
(0.9379172681365162, 'ASHA1'),
(0.938048827694729, 'ASHA1'),
(0.9381098707672209, 'ASHA1'),
(0.9383112208452076, 'ASHA1'),
(0.9391335882246494, 'ASHA1'),
(0.9395446761045605, 'ASHA1'),
(0.9404927203431726, 'ASHA1'),
(0.9409441908355802, 'ASHA1'),
(0.9448215439915657, 'ASHA1'),
(0.9509372708853334, 'ASHA1'),
(0.9511827901005745, 'ASHA1'),
(0.9515194124542177, 'ASHA1'),
(0.957623592345044, 'ASHA1'),
(0.9592849400360137, 'ASHA1'),
(0.9623032286763191, 'ASHA1'),
(0.9626383841969073, 'ASHA1'),
(0.968077540397644, 'ASHA1'),
(0.9691089380066842, 'ASHA1'),
(0.9717741063795984, 'ASHA1'),
(0.9723696678411216, 'ASHA1'),
(0.9776513508986682, 'ASHA1'),
(0.9783631851896644, 'ASHA1'),
(0.9792253077030182, 'ASHA1'),
(0.9792947717942297, 'ASHA1'),
(0.9808341050520539, 'ASHA1'),
(0.9819551175460219, 'ASHA1'),
(0.9833556700032204, 'ASHA1'),
(0.9845896470360458, 'ASHA1'),
(0.9864639427978545, 'ASHA1'),
(0.9881334204692394, 'ASHA1'),
(0.9892627408262342, 'ASHA1'),
(0.9925619352143258, 'ASHA1'),
(0.9989573801867664, 'ASHA1'),
(0.9992514585610479, 'ASHA1'),
(0.9994708707090467, 'ASHA1'),
(0.0038008540868759155, 'MO1'),
(0.006434558657929301, 'MO1'),
(0.0075168125331401825, 'MO1'),
(0.013223623158410192, 'MO1'),
(0.014323433861136436, 'MO1'),
(0.015198645880445838, 'MO1'),
(0.015388598199933767, 'MO1'),
(0.018712994642555714, 'MO1'),
(0.01892173197120428, 'MO1'),
(0.020797513192519546, 'MO1'),
(0.02619432914070785, 'MO1'),
(0.027982536237686872, 'MO1'),
(0.028166845440864563, 'MO1'),
(0.031841263407841325, 'MO1'),
(0.03365382761694491, 'MO1'),
(0.038291387958452106, 'MO1'),
(0.039900354808196425, 'MO1'),
(0.045066196005791426, 'MO1'),
(0.04611839191056788, 'MO1'),
(0.0487010944634676, 'MO1'),
(0.04908237396739423, 'MO1'),
(0.0620767124928534, 'MO1'),
(0.06503237714059651, 'MO1'),
(0.06755438446998596, 'MO1'),
(0.0678076921030879, 'MO1'),
(0.07018495141528547, 'MO1'),
(0.07038307748734951, 'MO1'),
(0.07492658379487693, 'MO1'),
(0.07584267598576844, 'MO1'),
(0.08180542360059917, 'MO1'),
(0.08336429111659527, 'MO1'),
(0.08425252768211067, 'MO1'),
(0.08776458306238055, 'MO1'),
(0.08897369541227818, 'MO1'),
(0.09386440482921898, 'MO1'),
(0.09713407116942108, 'MO1'),
(0.10530404187738895, 'MO1'),
(0.11067358660511672, 'MO1'),
(0.1149422568269074, 'MO1'),
(0.11756501509808004, 'MO1'),
(0.1201988747343421, 'MO1'),
(0.12026007869280875, 'MO1'),
(0.12222705874592066, 'MO1'),
(0.12682507513090968, 'MO1'),
(0.12819931330159307, 'MO1'),
(0.12972176377661526, 'MO1'),
(0.13238352490589023, 'MO1'),
(0.1369625348597765, 'MO1'),
(0.14763221773318946, 'MO1'),
(0.14992513344623148, 'MO1'),
(0.15051405504345894, 'MO1'),
(0.1532882102765143, 'MO1'),
(0.15333293285220861, 'MO1'),
(0.15554119111038744, 'MO1'),
(0.15569299878552556, 'MO1'),
(0.15898593398742378, 'MO1'),
(0.16394527326337993, 'MO1'),
(0.16687389370054007, 'MO1'),
(0.16799456253647804, 'MO1'),
(0.16910151485353708, 'MO1'),
(0.16923074331134558, 'MO1'),
(0.17166252038441598, 'MO1'),
(0.1771497456356883, 'MO1'),
(0.17893511638976634, 'MO1'),
(0.18249602965079248, 'MO1'),
(0.19340389384888113, 'MO1'),
(0.19381850701756775, 'MO1'),
(0.1938270793762058, 'MO1'),
(0.19654368795454502, 'MO1'),
(0.19766181334853172, 'MO1'),
(0.1996043238323182, 'MO1'),
(0.2000083727762103, 'MO1'),
(0.2013021360617131, 'MO1'),
(0.20297618908807635, 'MO1'),
(0.20534524298273027, 'MO1'),
(0.20805515674874187, 'MO1'),
(0.21008018590509892, 'MO1'),
(0.21257071429863572, 'MO1'),
(0.21450537629425526, 'MO1'),
(0.2152665804605931, 'MO1'),
(0.21718104812316597, 'MO1'),
(0.22210663091391325, 'MO1'),
(0.22466838802210987, 'MO1'),
(0.22524523548781872, 'MO1'),
(0.23386877472512424, 'MO1'),
(0.23499439749866724, 'MO1'),
(0.2397340745665133, 'MO1'),
(0.23995979689061642, 'MO1'),
(0.2400746603962034, 'MO1'),
(0.24143992899917066, 'MO1'),
(0.24478536169044673, 'MO1'),
(0.24602396320551634, 'MO1'),
(0.24736768659204245, 'MO1'),
(0.2505575204268098, 'MO1'),
(0.25101249339058995, 'MO1'),
(0.2522220800165087, 'MO1'),
(0.25977552495896816, 'MO1'),
(0.26085941144265234, 'MO1'),
(0.2629259512759745, 'MO1'),
(0.2641655632760376, 'MO1'),
(0.2704539755359292, 'MO1'),
(0.27794613875448704, 'MO1'),
(0.28136070584878325, 'MO1'),
(0.2852459531277418, 'MO1'),
(0.285475971410051, 'MO1'),
(0.28741404647007585, 'MO1'),
(0.29103239346295595, 'MO1'),
(0.29567698133178055, 'MO1'),
(0.29713087365962565, 'MO1'),
(0.29856426920741796, 'MO1'),
(0.30036587198264897, 'MO1'),
(0.3017804615665227, 'MO1'),
(0.3026598356664181, 'MO1'),
(0.3119813015218824, 'MO1'),
(0.31291213911026716, 'MO1'),
(0.31910587986931205, 'MO1'),
(0.32294735172763467, 'MO1'),
(0.3293495252728462, 'MO1'),
(0.33102803165093064, 'MO1'),
(0.33102955925278366, 'MO1'),
(0.33236529608257115, 'MO1'),
(0.3329950945917517, 'MO1'),
(0.3349664439447224, 'MO1'),
(0.3391823379788548, 'MO1'),
(0.3404875167179853, 'MO1'),
(0.34056496107950807, 'MO1'),
(0.340687011834234, 'MO1'),
(0.3417628544848412, 'MO1'),
(0.341844588983804, 'MO1'),
(0.34274541679769754, 'MO1'),
(0.3430500505492091, 'MO1'),
(0.3435984740499407, 'MO1'),
(0.35479180701076984, 'MO1'),
(0.3558288684580475, 'MO1'),
(0.3587300758808851, 'MO1'),
(0.35876253666356206, 'MO1'),
(0.35878139548003674, 'MO1'),
(0.3604174891952425, 'MO1'),
(0.36141769238747656, 'MO1'),
(0.3709323713555932, 'MO1'),
(0.37946716393344104, 'MO1'),
(0.3798235591966659, 'MO1'),
(0.38136294088326395, 'MO1'),
(0.3821641330141574, 'MO1'),
(0.3837506945710629, 'MO1'),
(0.3984343474730849, 'MO1'),
(0.40004041651263833, 'MO1'),
(0.4044450717046857, 'MO1'),
(0.4046426904387772, 'MO1'),
(0.406014749314636, 'MO1'),
(0.4064686931669712, 'MO1'),
(0.4102754113264382, 'MO1'),
(0.4116289101075381, 'MO1'),
(0.4136098662856966, 'MO1'),
(0.41636244975961745, 'MO1'),
(0.4179083174094558, 'MO1'),
(0.42068078904412687, 'MO1'),
(0.4223919650539756, 'MO1'),
(0.42321702162735164, 'MO1'),
(0.4245466338470578, 'MO1'),
(0.42499741073697805, 'MO1'),
(0.42586727160960436, 'MO1'),
(0.4270988958887756, 'MO1'),
(0.4315643203444779, 'MO1'),
(0.4337456305511296, 'MO1'),
(0.43614355218596756, 'MO1'),
(0.44066612934693694, 'MO1'),
(0.4468938324134797, 'MO1'),
(0.4471020756755024, 'MO1'),
(0.4500746666453779, 'MO1'),
(0.45455900439992547, 'MO1'),
(0.45700721186585724, 'MO1'),
(0.46195024088956416, 'MO1'),
(0.46213808562606573, 'MO1'),
(0.46280633797869086, 'MO1'),
(0.46392512088641524, 'MO1'),
(0.46457329159602523, 'MO1'),
(0.46603845921345055, 'MO1'),
(0.46661189617589116, 'MO1'),
(0.46715917414985597, 'MO1'),
(0.46740800864063203, 'MO1'),
(0.46781441662460566, 'MO1'),
(0.47011359594762325, 'MO1'),
(0.47405296680517495, 'MO1'),
(0.47523768548853695, 'MO1'),
(0.4779050052165985, 'MO1'),
(0.47810877044685185, 'MO1'),
(0.4837537987623364, 'MO1'),
(0.48647878505289555, 'MO1'),
(0.4898385948035866, 'MO1'),
(0.48986154492013156, 'MO1'),
(0.49112025601789355, 'MO1'),
(0.4946564813144505, 'MO1'),
(0.5057436772622168, 'MO1'),
(0.5103632647078484, 'MO1'),
(0.5109388513956219, 'MO1'),
(0.5131122258026153, 'MO1'),
(0.5135765038430691, 'MO1'),
(0.5167737340088934, 'MO1'),
(0.5244250395335257, 'MO1'),
(0.5260930494405329, 'MO1'),
(0.528119205031544, 'MO1'),
(0.5291502960026264, 'MO1'),
(0.5303260011132807, 'MO1'),
(0.534397560171783, 'MO1'),
(0.5344279839191586, 'MO1'),
(0.5378877550829202, 'MO1'),
(0.5427219381090254, 'MO1'),
(0.5453156954608858, 'MO1'),
(0.5470981162507087, 'MO1'),
(0.5486409454606473, 'MO1'),
(0.5491091313306242, 'MO1'),
(0.5553333063144237, 'MO1'),
(0.559011273086071, 'MO1'),
(0.5601741163991392, 'MO1'),
(0.5604989752173424, 'MO1'),
(0.5609043082222342, 'MO1'),
(0.5620836461894214, 'MO1'),
(0.5656508253887296, 'MO1'),
(0.5721339988522232, 'MO1'),
(0.5724503363016993, 'MO1'),
(0.5725380873773247, 'MO1'),
(0.5726965544745326, 'MO1'),
(0.5738595796283334, 'MO1'),
(0.5748336315155029, 'MO1'),
(0.5805494983214885, 'MO1'),
(0.5818581972271204, 'MO1'),
(0.5819321335293353, 'MO1'),
(0.5850694556720555, 'MO1'),
(0.585289589362219, 'MO1'),
(0.5869481496047229, 'MO1'),
(0.5869819773361087, 'MO1'),
(0.5877187068108469, 'MO1'),
(0.5879550871904939, 'MO1'),
(0.5900793098844588, 'MO1'),
(0.5902791942935437, 'MO1'),
(0.590329079888761, 'MO1'),
(0.5950288048479706, 'MO1'),
(0.5978528156410903, 'MO1'),
(0.5996471219696105, 'MO1'),
(0.6011511760298163, 'MO1'),
(0.6012668495532125, 'MO1'),
(0.6043493347242475, 'MO1'),
(0.6092467149719596, 'MO1'),
(0.6104300271254033, 'MO1'),
(0.6160021021496505, 'MO1'),
(0.6181928289588541, 'MO1'),
(0.6204261207021773, 'MO1'),
(0.6228082585148513, 'MO1'),
(0.6232116639148444, 'MO1'),
(0.6260638588573784, 'MO1'),
(0.6301123406738043, 'MO1'),
(0.6303301807492971, 'MO1'),
(0.6308617771137506, 'MO1'),
(0.6375246418174356, 'MO1'),
(0.640027557965368, 'MO1'),
(0.6400614602025598, 'MO1'),
(0.641288666985929, 'MO1'),
(0.6467788787558675, 'MO1'),
(0.6468933490104973, 'MO1'),
(0.6526413655374199, 'MO1'),
(0.659431895473972, 'MO1'),
(0.6598649681545794, 'MO1'),
(0.6615956979803741, 'MO1'),
(0.6629554112441838, 'MO1'),
(0.6645158946048468, 'MO1'),
(0.6652577281929553, 'MO1'),
(0.667822279734537, 'MO1'),
(0.682427957188338, 'MO1'),
(0.6832549041137099, 'MO1'),
(0.6845342284068465, 'MO1'),
(0.6861399919725955, 'MO1'),
(0.6919106882996857, 'MO1'),
(0.692457614466548, 'MO1'),
(0.6932077328674495, 'MO1'),
(0.6949707067105919, 'MO1'),
(0.7022644141688943, 'MO1'),
(0.7102162335067987, 'MO1'),
(0.7103300746530294, 'MO1'),
(0.7110090546775609, 'MO1'),
(0.711820020340383, 'MO1'),
(0.7145639297086746, 'MO1'),
(0.7155415678862482, 'MO1'),
(0.7176892815623432, 'MO1'),
(0.7197535873856395, 'MO1'),
(0.7212920701131225, 'MO1'),
(0.7241428955458105, 'MO1'),
(0.7260612759273499, 'MO1'),
(0.7288851921912283, 'MO1'),
(0.7307470622472465, 'MO1'),
(0.736329531064257, 'MO1'),
(0.7371088359504938, 'MO1'),
(0.7399503570050001, 'MO1'),
(0.7402619312051684, 'MO1'),
(0.7423581327311695, 'MO1'),
(0.7427497734315693, 'MO1'),
(0.7438926810864359, 'MO1'),
(0.744580783881247, 'MO1'),
(0.7519110527355224, 'MO1'),
(0.7562433152925223, 'MO1'),
(0.7585168874356896, 'MO1'),
(0.7598487397190183, 'MO1'),
(0.7687084979843348, 'MO1'),
(0.7693855580873787, 'MO1'),
(0.7712466181255877, 'MO1'),
(0.7759584435261786, 'MO1'),
(0.7793960948474705, 'MO1'),
(0.7813149592839181, 'MO1'),
(0.7824642120394856, 'MO1'),
(0.7854578685946763, 'MO1'),
(0.787951878271997, 'MO1'),
(0.7895356386434287, 'MO1'),
(0.7945511201396585, 'MO1'),
(0.7953784894198179, 'MO1'),
(0.796008154284209, 'MO1'),
(0.7963973372243345, 'MO1'),
(0.7986303584184498, 'MO1'),
(0.8011778395157307, 'MO1'),
(0.8064120472408831, 'MO1'),
(0.8066071514040232, 'MO1'),
(0.809059060877189, 'MO1'),
(0.8112740055657923, 'MO1'),
(0.8143248888663948, 'MO1'),
(0.8187438915483654, 'MO1'),
(0.8189667095430195, 'MO1'),
(0.8228799665812403, 'MO1'),
(0.8254121902864426, 'MO1'),
(0.8272774587385356, 'MO1'),
(0.8278262035455555, 'MO1'),
(0.8305094733368605, 'MO1'),
(0.8325884863734245, 'MO1'),
(0.8354884569998831, 'MO1'),
(0.8367129305843264, 'MO1'),
(0.8368134840857238, 'MO1'),
(0.8433834714815021, 'MO1'),
(0.8474677777849138, 'MO1'),
(0.8528215480037034, 'MO1'),
(0.8530896557494998, 'MO1'),
(0.8531211661174893, 'MO1'),
(0.8555221713613719, 'MO1'),
(0.8588369991630316, 'MO1'),
(0.8603730911854655, 'MO1'),
(0.8606702585238963, 'MO1'),
(0.8607576605863869, 'MO1'),
(0.8618610757403076, 'MO1'),
(0.8618990948889405, 'MO1'),
(0.8642603200860322, 'MO1'),
(0.8675384493544698, 'MO1'),
(0.868208578787744, 'MO1'),
(0.8685323095414788, 'MO1'),
(0.8685776677448303, 'MO1'),
(0.8705340845044702, 'MO1'),
(0.8710631104186177, 'MO1'),
(0.8712926560547203, 'MO1'),
(0.8776104208081961, 'MO1'),
(0.8838225377257913, 'MO1'),
(0.8855796311981976, 'MO1'),
(0.894133176188916, 'MO1'),
(0.8957956740632653, 'MO1'),
(0.8972285739146173, 'MO1'),
(0.8973814866039902, 'MO1'),
(0.8999697733670473, 'MO1'),
(0.9003007034771144, 'MO1'),
(0.9010545550845563, 'MO1'),
(0.9011818247381598, 'MO1'),
(0.9027769507374614, 'MO1'),
(0.9095812668092549, 'MO1'),
(0.9115153895691037, 'MO1'),
(0.9130558026954532, 'MO1'),
(0.9135283976793289, 'MO1'),
(0.9171338677406311, 'MO1'),
(0.9197507626377046, 'MO1'),
(0.9201890518888831, 'MO1'),
(0.9326198205817491, 'MO1'),
(0.9342576337512583, 'MO1'),
(0.9359600346069783, 'MO1'),
(0.9380060269031674, 'MO1'),
(0.9410088323056698, 'MO1'),
(0.9450644229073077, 'MO1'),
(0.9510203369427472, 'MO1'),
(0.9531922042369843, 'MO1'),
(0.9591495415661484, 'MO1'),
(0.9633901976048946, 'MO1'),
(0.9686383514199406, 'MO1'),
(0.9689288407098502, 'MO1'),
(0.9735718050505966, 'MO1'),
(0.9759597906377167, 'MO1'),
(0.9777561263181269, 'MO1'),
(0.9784217777196318, 'MO1'),
(0.9821764449588954, 'MO1'),
(0.9894670974463224, 'MO1'),
(0.9903379364404827, 'MO1'),
(0.9920534931588918, 'MO1'),
(0.9939935668371618, 'MO1'),
(0.9944608707446605, 'MO1'),
(0.9982153668534011, 'MO1');

-- --------------------------------------------------------

--
-- Table structure for table `hm_villages`
--

CREATE TABLE `hm_villages` (
  `Village_id` int(10) UNSIGNED NOT NULL,
  `Country_ID` int(10) UNSIGNED NOT NULL,
  `State_ID` int(10) UNSIGNED NOT NULL,
  `District_id` int(10) UNSIGNED NOT NULL,
  `Village_Name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `City_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_villages`
--

INSERT INTO `hm_villages` (`Village_id`, `Country_ID`, `State_ID`, `District_id`, `Village_Name`, `City_id`) VALUES
(1, 1, 1, 1, 'khadakwasla', 1),
(2, 1, 1, 1, 'Erandawane', 1),
(3, 1, 1, 1, 'Shivajinagar', 1),
(4, 1, 1, 1, 'Kothrud', 1),
(5, 1, 1, 1, 'Sadashiv Peth', 1),
(6, 1, 1, 1, 'Swargate', 1),
(7, 1, 1, 1, 'Sangvi', 2),
(8, 1, 1, 1, 'KhadkiStn', 2),
(9, 1, 1, 1, 'Bopodi', 2),
(10, 1, 1, 1, 'Dapodi', 2),
(11, 1, 1, 1, 'Navi Sangvi', 2),
(12, 1, 1, 1, 'Pimpri', 3),
(13, 1, 1, 1, 'Chinchwad', 3),
(14, 1, 1, 1, 'Nigdi', 3),
(15, 1, 1, 1, 'Akurdi', 3),
(16, 1, 1, 1, 'Bhosari', 3),
(17, 1, 1, 1, 'Magarpatta', 4),
(18, 1, 1, 1, 'GadiTal', 4),
(19, 1, 1, 1, 'Waidhwadi', 4),
(20, 1, 1, 1, 'Fatimanagar', 4),
(21, 1, 1, 1, 'Phursungi', 4),
(22, 1, 1, 1, 'SindhColony', 5),
(23, 1, 1, 1, 'National Society', 5),
(24, 1, 1, 1, 'Anand Park', 5),
(25, 1, 1, 1, 'AundhGaon', 5),
(26, 1, 1, 1, 'Siddharthnagar', 5),
(27, 1, 1, 2, 'NagpurEast', 6),
(28, 1, 1, 2, 'NagpurWest', 6),
(29, 1, 1, 2, 'NagpurNorth', 6),
(30, 1, 1, 2, 'NagpurSouth', 6),
(31, 1, 1, 2, 'RamtekEast', 7),
(32, 1, 1, 2, 'RamtekWest', 7),
(33, 1, 1, 2, 'RamtekNorth', 7),
(34, 1, 1, 2, 'RamtekSouth', 7),
(35, 1, 1, 2, 'KamteeEast', 8),
(36, 1, 1, 2, 'KamteeWest', 8),
(37, 1, 1, 2, 'KamteeNorth', 8),
(38, 1, 1, 2, 'KamteeSouth', 8),
(39, 1, 1, 2, 'UmredEast', 9),
(40, 1, 1, 2, 'UmredWest', 9),
(41, 1, 1, 2, 'UmredNorth', 9),
(42, 1, 1, 2, 'UmredSouth', 9),
(43, 1, 1, 2, 'SionerEast', 10),
(44, 1, 1, 2, 'SionerWest', 10),
(45, 1, 1, 2, 'SionerNorth', 10),
(46, 1, 1, 2, 'SionerSouth', 10);

-- --------------------------------------------------------

--
-- Table structure for table `hm_vitals`
--

CREATE TABLE `hm_vitals` (
  `Vitals_id` int(10) UNSIGNED NOT NULL,
  `Vital_Name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Vital_Unit` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hm_vitals`
--

INSERT INTO `hm_vitals` (`Vitals_id`, `Vital_Name`, `Vital_Unit`) VALUES
(1, 'Temperature', 'decimal'),
(2, 'Weight', 'decimal'),
(3, 'Height', 'decimal'),
(4, 'Bmi', 'decimal'),
(5, 'Girth', 'decimal'),
(6, 'Fundal_Heights', 'decimal');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hm_actor`
--
ALTER TABLE `hm_actor`
  ADD PRIMARY KEY (`Actor_id`);

--
-- Indexes for table `hm_actor_tasks`
--
ALTER TABLE `hm_actor_tasks`
  ADD PRIMARY KEY (`Actor_Tasks_id`),
  ADD KEY `HM_Actor_Tasks_FKIndex1` (`Programs_id`),
  ADD KEY `HM_Actor_Tasks_FKIndex2` (`Actor_id`);

--
-- Indexes for table `hm_allergy_item`
--
ALTER TABLE `hm_allergy_item`
  ADD PRIMARY KEY (`Allergy_Item_id`),
  ADD KEY `Allergy_Type_id` (`Allergy_Type_id`);

--
-- Indexes for table `hm_allergy_type`
--
ALTER TABLE `hm_allergy_type`
  ADD PRIMARY KEY (`Allergy_Type_id`);

--
-- Indexes for table `hm_appointments`
--
ALTER TABLE `hm_appointments`
  ADD PRIMARY KEY (`Appointment_id`),
  ADD KEY `HM_Appointment_FKIndex1` (`Patient_id`),
  ADD KEY `HM_Appointment_FKIndex2` (`User_id`);

--
-- Indexes for table `hm_cast_category`
--
ALTER TABLE `hm_cast_category`
  ADD PRIMARY KEY (`Cast_Category_Id`);

--
-- Indexes for table `hm_city`
--
ALTER TABLE `hm_city`
  ADD PRIMARY KEY (`City_id`),
  ADD KEY `HM_City_FKIndex1` (`Country_ID`,`State_ID`,`District_id`);

--
-- Indexes for table `hm_country`
--
ALTER TABLE `hm_country`
  ADD PRIMARY KEY (`Country_ID`);

--
-- Indexes for table `hm_cp_category`
--
ALTER TABLE `hm_cp_category`
  ADD PRIMARY KEY (`Category_id`),
  ADD KEY `HM_CP_Category_FKIndex1` (`Template_id`);

--
-- Indexes for table `hm_cp_frequency`
--
ALTER TABLE `hm_cp_frequency`
  ADD PRIMARY KEY (`Frequency_id`),
  ADD KEY `HM_CP_Frequency_FKIndex1` (`Template_id`),
  ADD KEY `HM_CP_Frequency_FKIndex2` (`Category_id`),
  ADD KEY `HM_CP_Frequency_FKIndex3` (`Template_Task_id`),
  ADD KEY `HM_CP_Frequency_FKIndex4` (`frequency_detail_id`);

--
-- Indexes for table `hm_cp_frequency_details`
--
ALTER TABLE `hm_cp_frequency_details`
  ADD PRIMARY KEY (`frequency_detail_id`);

--
-- Indexes for table `hm_cp_patient`
--
ALTER TABLE `hm_cp_patient`
  ADD PRIMARY KEY (`Patient_id`,`Template_id`,`Category_id`,`Template_Task_id`,`frequency_detail_id`,`role`),
  ADD KEY `HM_CP_Patient_FKIndex1` (`Patient_id`),
  ADD KEY `HM_CP_Patient_FKIndex2` (`Template_id`),
  ADD KEY `HM_CP_Patient_FKIndex3` (`Category_id`),
  ADD KEY `HM_CP_Patient_FKIndex4` (`Template_Task_id`),
  ADD KEY `HM_CP_Patient_FKIndex5` (`Frequency_id`),
  ADD KEY `HM_CP_Patient_FKIndex6` (`frequency_detail_id`),
  ADD KEY `HM_CP_Patient_FKIndex7` (`User_id`);

--
-- Indexes for table `hm_cp_tasks`
--
ALTER TABLE `hm_cp_tasks`
  ADD PRIMARY KEY (`Template_Task_id`),
  ADD KEY `HM_CP_Tasks_FKIndex1` (`Template_id`),
  ADD KEY `HM_CP_Tasks_FKIndex2` (`Programs_id`),
  ADD KEY `HM_CP_Tasks_FKIndex3` (`Actor_id`),
  ADD KEY `HM_CP_Tasks_FKIndex4` (`Category_id`);

--
-- Indexes for table `hm_cp_templates`
--
ALTER TABLE `hm_cp_templates`
  ADD PRIMARY KEY (`Template_id`),
  ADD KEY `HM_CP_Templates_FKIndex1` (`Programs_id`),
  ADD KEY `HM_CP_Templates_FKIndex2` (`User_id`);

--
-- Indexes for table `hm_devices`
--
ALTER TABLE `hm_devices`
  ADD PRIMARY KEY (`Devices_id`);

--
-- Indexes for table `hm_device_attributes`
--
ALTER TABLE `hm_device_attributes`
  ADD PRIMARY KEY (`Device_Attributes_id`),
  ADD KEY `HM_Device_Attributes_FKIndex1` (`Devices_id`);

--
-- Indexes for table `hm_diagnosis`
--
ALTER TABLE `hm_diagnosis`
  ADD PRIMARY KEY (`Diagnosis_id`);

--
-- Indexes for table `hm_districts`
--
ALTER TABLE `hm_districts`
  ADD PRIMARY KEY (`District_id`),
  ADD KEY `HM_Districts_FKIndex1` (`Country_ID`,`State_ID`);

--
-- Indexes for table `hm_drugmaster`
--
ALTER TABLE `hm_drugmaster`
  ADD PRIMARY KEY (`DrugId`);

--
-- Indexes for table `hm_gender`
--
ALTER TABLE `hm_gender`
  ADD PRIMARY KEY (`Gender_Id`);

--
-- Indexes for table `hm_identity_cards`
--
ALTER TABLE `hm_identity_cards`
  ADD PRIMARY KEY (`Card_Type_id`);

--
-- Indexes for table `hm_investigationtest`
--
ALTER TABLE `hm_investigationtest`
  ADD PRIMARY KEY (`InvestigationTest_id`);

--
-- Indexes for table `hm_learning_content`
--
ALTER TABLE `hm_learning_content`
  ADD PRIMARY KEY (`Learning_id`),
  ADD KEY `HM_Learning_content_FKIndex1` (`Programs_id`,`Program_Details_id`);

--
-- Indexes for table `hm_medication`
--
ALTER TABLE `hm_medication`
  ADD PRIMARY KEY (`HM_MedicationId`),
  ADD KEY `Table_43_FKIndex1` (`Patient_id`),
  ADD KEY `HM_Immunization_FKIndex2` (`DrugId`),
  ADD KEY `HM_Medication_FKIndex3` (`PHC_ID`);

--
-- Indexes for table `hm_patient`
--
ALTER TABLE `hm_patient`
  ADD PRIMARY KEY (`Patient_id`),
  ADD KEY `HM_Patient_FKIndex1` (`Cast_Category_Id`),
  ADD KEY `HM_Patient_FKIndex2` (`Gender_Id`),
  ADD KEY `HM_Patient_FKIndex3` (`Card_Type_id`),
  ADD KEY `HM_Patient_FKIndex4` (`Country_ID`,`State_ID`,`District_id`),
  ADD KEY `HM_Patient_FKIndex5` (`Country_ID`,`State_ID`,`District_id`,`City_id`),
  ADD KEY `HM_Patient_FKIndex6` (`Village_id`),
  ADD KEY `HM_Patient_FKIndex7` (`District_id`,`City_id`,`Country_ID`,`State_ID`,`PinCode`),
  ADD KEY `Country_ID` (`Country_ID`,`State_ID`,`District_id`,`City_id`,`PinCode`);

--
-- Indexes for table `hm_patientallergies`
--
ALTER TABLE `hm_patientallergies`
  ADD PRIMARY KEY (`Patient_Allergies_id`),
  ADD KEY `Allergy_Type_id` (`Allergy_Type_id`),
  ADD KEY `Allergy_Item_id` (`Allergy_Item_id`),
  ADD KEY `Patient_Id` (`Patient_Id`);

--
-- Indexes for table `hm_patientdiagnosis`
--
ALTER TABLE `hm_patientdiagnosis`
  ADD PRIMARY KEY (`PatientDiagnosisId`),
  ADD KEY `Diagnosis_id` (`Diagnosis_id`),
  ADD KEY `User_id` (`User_id`);

--
-- Indexes for table `hm_patientinvestigationtest`
--
ALTER TABLE `hm_patientinvestigationtest`
  ADD PRIMARY KEY (`PatientinvestigationtestId`),
  ADD KEY `Patient_id` (`Patient_id`);

--
-- Indexes for table `hm_patientprocedure`
--
ALTER TABLE `hm_patientprocedure`
  ADD PRIMARY KEY (`PatientProcedureId`),
  ADD KEY `Patient_id` (`Patient_id`),
  ADD KEY `User_id` (`User_id`);

--
-- Indexes for table `hm_patients_device_reading`
--
ALTER TABLE `hm_patients_device_reading`
  ADD PRIMARY KEY (`Patients_Device_Reading_id`),
  ADD KEY `Patients_Vitals_FKIndex3` (`Patient_id`),
  ADD KEY `Patients_Vitals_FKIndex2` (`Devices_id`,`Device_Attributes_id`);

--
-- Indexes for table `hm_patient_family`
--
ALTER TABLE `hm_patient_family`
  ADD PRIMARY KEY (`Patient_id`,`Family_Id`),
  ADD KEY `Patient_Family_FKIndex1` (`Patient_id`),
  ADD KEY `Patient_Family_FKIndex2` (`Cast_Category_Id`),
  ADD KEY `Patient_Family_FKIndex3` (`Gender_Id`),
  ADD KEY `HM_Patient_Family_FKIndex4` (`Card_Type_id`);

--
-- Indexes for table `hm_patient_vitals`
--
ALTER TABLE `hm_patient_vitals`
  ADD PRIMARY KEY (`id_Patient_Vitals`),
  ADD KEY `Patient_Vitals_FKIndex1` (`Vitals_id`),
  ADD KEY `Patient_Vitals_FKIndex2` (`Patient_id`);

--
-- Indexes for table `hm_phc`
--
ALTER TABLE `hm_phc`
  ADD PRIMARY KEY (`PHC_ID`),
  ADD KEY `HM_PHC_FKIndex1` (`PHC_ID`);

--
-- Indexes for table `hm_phcdetails`
--
ALTER TABLE `hm_phcdetails`
  ADD PRIMARY KEY (`PhcDetailsId`),
  ADD KEY `HM_PhcDetails_FKIndex1` (`PHC_ID`),
  ADD KEY `HM_PhcDetails_FKIndex2` (`Village_id`);

--
-- Indexes for table `hm_phc_user`
--
ALTER TABLE `hm_phc_user`
  ADD PRIMARY KEY (`PHC_User_id`),
  ADD KEY `HM_PHC_User_FKIndex1` (`PHC_ID`),
  ADD KEY `HM_PHC_User_FKIndex2` (`User_id`);

--
-- Indexes for table `hm_pincode`
--
ALTER TABLE `hm_pincode`
  ADD PRIMARY KEY (`PinCode`),
  ADD KEY `HM_Pincode_FKIndex1` (`Country_ID`,`State_ID`,`District_id`,`City_id`);

--
-- Indexes for table `hm_procedures`
--
ALTER TABLE `hm_procedures`
  ADD PRIMARY KEY (`Procedure_id`);

--
-- Indexes for table `hm_programs`
--
ALTER TABLE `hm_programs`
  ADD PRIMARY KEY (`Programs_id`);

--
-- Indexes for table `hm_program_details`
--
ALTER TABLE `hm_program_details`
  ADD PRIMARY KEY (`Program_Details_id`),
  ADD KEY `HM_Program_Details_FKIndex1` (`Programs_id`);

--
-- Indexes for table `hm_program_details_transactions`
--
ALTER TABLE `hm_program_details_transactions`
  ADD PRIMARY KEY (`Program_details_Transactions_id`),
  ADD KEY `HM_Program_details_Transactions_FKIndex1` (`Programs_id`,`Program_Details_id`),
  ADD KEY `HM_Program_details_Transactions_FKIndex2` (`Patient_id`);

--
-- Indexes for table `hm_referals`
--
ALTER TABLE `hm_referals`
  ADD PRIMARY KEY (`Referal_id`),
  ADD KEY `HM_Referals_FKIndex1` (`Patient_id`),
  ADD KEY `HM_Referals_FKIndex2` (`User_id`),
  ADD KEY `HM_Referals_FKIndex3` (`PHC_ID`),
  ADD KEY `HM_Referals_FKIndex4` (`Village_id`),
  ADD KEY `HM_Referals_FKIndex5` (`Referral_Reason_Id`);

--
-- Indexes for table `hm_referral_reason`
--
ALTER TABLE `hm_referral_reason`
  ADD PRIMARY KEY (`Referral_Reason_Id`);

--
-- Indexes for table `hm_severity`
--
ALTER TABLE `hm_severity`
  ADD PRIMARY KEY (`Severity_id`),
  ADD KEY `HM_severity_FKIndex1` (`Patient_id`);

--
-- Indexes for table `hm_states`
--
ALTER TABLE `hm_states`
  ADD PRIMARY KEY (`State_ID`),
  ADD KEY `HM_States_FKIndex1` (`Country_ID`);

--
-- Indexes for table `hm_survey_questionair`
--
ALTER TABLE `hm_survey_questionair`
  ADD PRIMARY KEY (`Survey_Questionair_id`),
  ADD KEY `HM_Survey_Questionair_FKIndex1` (`Programs_id`,`Survey_template_id`),
  ADD KEY `Actor_id` (`Actor_id`);

--
-- Indexes for table `hm_survey_results`
--
ALTER TABLE `hm_survey_results`
  ADD PRIMARY KEY (`Survey_Result_id`),
  ADD KEY `HM_Survey_Results_FKIndex1` (`Patient_id`),
  ADD KEY `HM_Survey_Results_FKIndex2` (`Survey_Questionair_id`);

--
-- Indexes for table `hm_survey_template`
--
ALTER TABLE `hm_survey_template`
  ADD PRIMARY KEY (`Survey_template_id`),
  ADD KEY `HM_Survey_Template_FKIndex1` (`Programs_id`);

--
-- Indexes for table `hm_tasks_patient`
--
ALTER TABLE `hm_tasks_patient`
  ADD PRIMARY KEY (`Tasks_Patient_id`),
  ADD KEY `HM_Tasks_Patient_FKIndex1` (`Patient_id`);

--
-- Indexes for table `hm_user`
--
ALTER TABLE `hm_user`
  ADD PRIMARY KEY (`User_id`),
  ADD KEY `HM_User_FKIndex1` (`Programs_id`);

--
-- Indexes for table `hm_user_actor`
--
ALTER TABLE `hm_user_actor`
  ADD PRIMARY KEY (`User_actor_id`),
  ADD KEY `HM_User_Actor_FKIndex1` (`User_id`),
  ADD KEY `HM_User_Actor_FKIndex2` (`Programs_id`),
  ADD KEY `HM_User_Actor_FKIndex3` (`Actor_id`);

--
-- Indexes for table `hm_user_details`
--
ALTER TABLE `hm_user_details`
  ADD PRIMARY KEY (`User_Details_id`),
  ADD KEY `HM_User_Details_FKIndex1` (`PHC_ID`),
  ADD KEY `HM_User_Details_FKIndex3` (`User_id`);

--
-- Indexes for table `hm_user_tasks`
--
ALTER TABLE `hm_user_tasks`
  ADD PRIMARY KEY (`User_Tasks_id`),
  ADD KEY `HM_User_Tasks_FKIndex1` (`User_id`),
  ADD KEY `HM_User_Tasks_FKIndex2` (`Programs_id`);

--
-- Indexes for table `hm_user_token`
--
ALTER TABLE `hm_user_token`
  ADD PRIMARY KEY (`Token_id`),
  ADD KEY `HM_User_Token_FKIndex1` (`User_id`);

--
-- Indexes for table `hm_villages`
--
ALTER TABLE `hm_villages`
  ADD PRIMARY KEY (`Village_id`),
  ADD KEY `HM_Villages_FKIndex1` (`Country_ID`,`State_ID`,`District_id`,`City_id`);

--
-- Indexes for table `hm_vitals`
--
ALTER TABLE `hm_vitals`
  ADD PRIMARY KEY (`Vitals_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hm_actor`
--
ALTER TABLE `hm_actor`
  MODIFY `Actor_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `hm_actor_tasks`
--
ALTER TABLE `hm_actor_tasks`
  MODIFY `Actor_Tasks_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hm_allergy_item`
--
ALTER TABLE `hm_allergy_item`
  MODIFY `Allergy_Item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `hm_allergy_type`
--
ALTER TABLE `hm_allergy_type`
  MODIFY `Allergy_Type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `hm_appointments`
--
ALTER TABLE `hm_appointments`
  MODIFY `Appointment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `hm_cast_category`
--
ALTER TABLE `hm_cast_category`
  MODIFY `Cast_Category_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `hm_city`
--
ALTER TABLE `hm_city`
  MODIFY `City_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `hm_country`
--
ALTER TABLE `hm_country`
  MODIFY `Country_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hm_cp_category`
--
ALTER TABLE `hm_cp_category`
  MODIFY `Category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `hm_cp_frequency`
--
ALTER TABLE `hm_cp_frequency`
  MODIFY `Frequency_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `hm_cp_frequency_details`
--
ALTER TABLE `hm_cp_frequency_details`
  MODIFY `frequency_detail_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `hm_cp_tasks`
--
ALTER TABLE `hm_cp_tasks`
  MODIFY `Template_Task_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `hm_devices`
--
ALTER TABLE `hm_devices`
  MODIFY `Devices_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `hm_device_attributes`
--
ALTER TABLE `hm_device_attributes`
  MODIFY `Device_Attributes_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `hm_diagnosis`
--
ALTER TABLE `hm_diagnosis`
  MODIFY `Diagnosis_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hm_districts`
--
ALTER TABLE `hm_districts`
  MODIFY `District_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `hm_drugmaster`
--
ALTER TABLE `hm_drugmaster`
  MODIFY `DrugId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `hm_gender`
--
ALTER TABLE `hm_gender`
  MODIFY `Gender_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `hm_identity_cards`
--
ALTER TABLE `hm_identity_cards`
  MODIFY `Card_Type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `hm_investigationtest`
--
ALTER TABLE `hm_investigationtest`
  MODIFY `InvestigationTest_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `hm_learning_content`
--
ALTER TABLE `hm_learning_content`
  MODIFY `Learning_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `hm_medication`
--
ALTER TABLE `hm_medication`
  MODIFY `HM_MedicationId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;
--
-- AUTO_INCREMENT for table `hm_patientallergies`
--
ALTER TABLE `hm_patientallergies`
  MODIFY `Patient_Allergies_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hm_patientdiagnosis`
--
ALTER TABLE `hm_patientdiagnosis`
  MODIFY `PatientDiagnosisId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `hm_patientinvestigationtest`
--
ALTER TABLE `hm_patientinvestigationtest`
  MODIFY `PatientinvestigationtestId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `hm_patientprocedure`
--
ALTER TABLE `hm_patientprocedure`
  MODIFY `PatientProcedureId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `hm_patients_device_reading`
--
ALTER TABLE `hm_patients_device_reading`
  MODIFY `Patients_Device_Reading_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=920;
--
-- AUTO_INCREMENT for table `hm_patient_vitals`
--
ALTER TABLE `hm_patient_vitals`
  MODIFY `id_Patient_Vitals` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=349;
--
-- AUTO_INCREMENT for table `hm_phc`
--
ALTER TABLE `hm_phc`
  MODIFY `PHC_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hm_phcdetails`
--
ALTER TABLE `hm_phcdetails`
  MODIFY `PhcDetailsId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `hm_phc_user`
--
ALTER TABLE `hm_phc_user`
  MODIFY `PHC_User_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `hm_procedures`
--
ALTER TABLE `hm_procedures`
  MODIFY `Procedure_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `hm_programs`
--
ALTER TABLE `hm_programs`
  MODIFY `Programs_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hm_program_details`
--
ALTER TABLE `hm_program_details`
  MODIFY `Program_Details_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `hm_program_details_transactions`
--
ALTER TABLE `hm_program_details_transactions`
  MODIFY `Program_details_Transactions_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=551;
--
-- AUTO_INCREMENT for table `hm_referals`
--
ALTER TABLE `hm_referals`
  MODIFY `Referal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT for table `hm_referral_reason`
--
ALTER TABLE `hm_referral_reason`
  MODIFY `Referral_Reason_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `hm_severity`
--
ALTER TABLE `hm_severity`
  MODIFY `Severity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `hm_states`
--
ALTER TABLE `hm_states`
  MODIFY `State_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hm_survey_questionair`
--
ALTER TABLE `hm_survey_questionair`
  MODIFY `Survey_Questionair_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;
--
-- AUTO_INCREMENT for table `hm_survey_results`
--
ALTER TABLE `hm_survey_results`
  MODIFY `Survey_Result_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=564;
--
-- AUTO_INCREMENT for table `hm_survey_template`
--
ALTER TABLE `hm_survey_template`
  MODIFY `Survey_template_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `hm_tasks_patient`
--
ALTER TABLE `hm_tasks_patient`
  MODIFY `Tasks_Patient_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `hm_user_actor`
--
ALTER TABLE `hm_user_actor`
  MODIFY `User_actor_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `hm_user_details`
--
ALTER TABLE `hm_user_details`
  MODIFY `User_Details_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `hm_user_tasks`
--
ALTER TABLE `hm_user_tasks`
  MODIFY `User_Tasks_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;
--
-- AUTO_INCREMENT for table `hm_villages`
--
ALTER TABLE `hm_villages`
  MODIFY `Village_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `hm_vitals`
--
ALTER TABLE `hm_vitals`
  MODIFY `Vitals_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `hm_actor_tasks`
--
ALTER TABLE `hm_actor_tasks`
  ADD CONSTRAINT `hm_actor_tasks_ibfk_1` FOREIGN KEY (`Programs_id`) REFERENCES `hm_programs` (`Programs_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_actor_tasks_ibfk_2` FOREIGN KEY (`Actor_id`) REFERENCES `hm_actor` (`Actor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_allergy_item`
--
ALTER TABLE `hm_allergy_item`
  ADD CONSTRAINT `hm_allergy_item_ibfk_1` FOREIGN KEY (`Allergy_Type_id`) REFERENCES `hm_allergy_type` (`Allergy_Type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_appointments`
--
ALTER TABLE `hm_appointments`
  ADD CONSTRAINT `hm_appointments_ibfk_1` FOREIGN KEY (`Patient_id`) REFERENCES `hm_patient` (`Patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_appointments_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `hm_user` (`User_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_city`
--
ALTER TABLE `hm_city`
  ADD CONSTRAINT `hm_city_ibfk_1` FOREIGN KEY (`Country_ID`,`State_ID`,`District_id`) REFERENCES `hm_districts` (`Country_ID`, `State_ID`, `District_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_cp_category`
--
ALTER TABLE `hm_cp_category`
  ADD CONSTRAINT `hm_cp_category_ibfk_1` FOREIGN KEY (`Template_id`) REFERENCES `hm_cp_templates` (`Template_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_cp_frequency`
--
ALTER TABLE `hm_cp_frequency`
  ADD CONSTRAINT `hm_cp_frequency_ibfk_1` FOREIGN KEY (`Template_id`) REFERENCES `hm_cp_templates` (`Template_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_cp_frequency_ibfk_2` FOREIGN KEY (`Category_id`) REFERENCES `hm_cp_category` (`Category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_cp_frequency_ibfk_3` FOREIGN KEY (`Template_Task_id`) REFERENCES `hm_cp_tasks` (`Template_Task_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_cp_frequency_ibfk_4` FOREIGN KEY (`frequency_detail_id`) REFERENCES `hm_cp_frequency_details` (`frequency_detail_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_cp_patient`
--
ALTER TABLE `hm_cp_patient`
  ADD CONSTRAINT `hm_cp_patient_ibfk_1` FOREIGN KEY (`Patient_id`) REFERENCES `hm_patient` (`Patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_cp_patient_ibfk_2` FOREIGN KEY (`Template_id`) REFERENCES `hm_cp_templates` (`Template_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_cp_patient_ibfk_3` FOREIGN KEY (`Category_id`) REFERENCES `hm_cp_category` (`Category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_cp_patient_ibfk_4` FOREIGN KEY (`Template_Task_id`) REFERENCES `hm_cp_tasks` (`Template_Task_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_cp_patient_ibfk_5` FOREIGN KEY (`Frequency_id`) REFERENCES `hm_cp_frequency` (`Frequency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_cp_patient_ibfk_6` FOREIGN KEY (`frequency_detail_id`) REFERENCES `hm_cp_frequency_details` (`frequency_detail_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_cp_patient_ibfk_7` FOREIGN KEY (`User_id`) REFERENCES `hm_user` (`User_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_cp_tasks`
--
ALTER TABLE `hm_cp_tasks`
  ADD CONSTRAINT `hm_cp_tasks_ibfk_1` FOREIGN KEY (`Template_id`) REFERENCES `hm_cp_templates` (`Template_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_cp_tasks_ibfk_2` FOREIGN KEY (`Actor_id`) REFERENCES `hm_actor` (`Actor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_cp_tasks_ibfk_3` FOREIGN KEY (`Programs_id`) REFERENCES `hm_programs` (`Programs_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_cp_tasks_ibfk_4` FOREIGN KEY (`Category_id`) REFERENCES `hm_cp_category` (`Category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_cp_templates`
--
ALTER TABLE `hm_cp_templates`
  ADD CONSTRAINT `hm_cp_templates_ibfk_1` FOREIGN KEY (`Programs_id`) REFERENCES `hm_programs` (`Programs_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_cp_templates_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `hm_user` (`User_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_device_attributes`
--
ALTER TABLE `hm_device_attributes`
  ADD CONSTRAINT `hm_device_attributes_ibfk_1` FOREIGN KEY (`Devices_id`) REFERENCES `hm_devices` (`Devices_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_districts`
--
ALTER TABLE `hm_districts`
  ADD CONSTRAINT `hm_districts_ibfk_1` FOREIGN KEY (`Country_ID`,`State_ID`) REFERENCES `hm_states` (`Country_ID`, `State_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_learning_content`
--
ALTER TABLE `hm_learning_content`
  ADD CONSTRAINT `hm_learning_content_ibfk_1` FOREIGN KEY (`Programs_id`,`Program_Details_id`) REFERENCES `hm_program_details` (`Programs_id`, `Program_Details_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_medication`
--
ALTER TABLE `hm_medication`
  ADD CONSTRAINT `hm_medication_ibfk_1` FOREIGN KEY (`Patient_id`) REFERENCES `hm_patient` (`Patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_medication_ibfk_2` FOREIGN KEY (`DrugId`) REFERENCES `hm_drugmaster` (`DrugId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_medication_ibfk_3` FOREIGN KEY (`PHC_ID`) REFERENCES `hm_phc` (`PHC_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_patient`
--
ALTER TABLE `hm_patient`
  ADD CONSTRAINT `hm_patient_ibfk_1` FOREIGN KEY (`Cast_Category_Id`) REFERENCES `hm_cast_category` (`Cast_Category_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_patient_ibfk_2` FOREIGN KEY (`Gender_Id`) REFERENCES `hm_gender` (`Gender_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_patient_ibfk_3` FOREIGN KEY (`Card_Type_id`) REFERENCES `hm_identity_cards` (`Card_Type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_patient_ibfk_4` FOREIGN KEY (`Country_ID`,`State_ID`,`District_id`) REFERENCES `hm_districts` (`Country_ID`, `State_ID`, `District_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_patient_ibfk_5` FOREIGN KEY (`Country_ID`,`State_ID`,`District_id`,`City_id`) REFERENCES `hm_city` (`Country_ID`, `State_ID`, `District_id`, `City_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_patient_ibfk_6` FOREIGN KEY (`Village_id`) REFERENCES `hm_villages` (`Village_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_patient_ibfk_7` FOREIGN KEY (`Country_ID`,`State_ID`,`District_id`,`City_id`,`PinCode`) REFERENCES `hm_pincode` (`Country_ID`, `State_ID`, `District_id`, `City_id`, `PinCode`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_patientallergies`
--
ALTER TABLE `hm_patientallergies`
  ADD CONSTRAINT `hm_patientallergies_ibfk_1` FOREIGN KEY (`Allergy_Type_id`) REFERENCES `hm_allergy_type` (`Allergy_Type_id`),
  ADD CONSTRAINT `hm_patientallergies_ibfk_2` FOREIGN KEY (`Allergy_Item_id`) REFERENCES `hm_allergy_item` (`Allergy_Item_id`),
  ADD CONSTRAINT `hm_patientallergies_ibfk_3` FOREIGN KEY (`Patient_Id`) REFERENCES `hm_patient` (`Patient_id`);

--
-- Constraints for table `hm_patientdiagnosis`
--
ALTER TABLE `hm_patientdiagnosis`
  ADD CONSTRAINT `hm_patientdiagnosis_ibfk_1` FOREIGN KEY (`Diagnosis_id`) REFERENCES `hm_diagnosis` (`Diagnosis_id`),
  ADD CONSTRAINT `hm_patientdiagnosis_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `hm_user` (`User_id`);

--
-- Constraints for table `hm_patientinvestigationtest`
--
ALTER TABLE `hm_patientinvestigationtest`
  ADD CONSTRAINT `hm_patientinvestigationtest_ibfk_1` FOREIGN KEY (`Patient_id`) REFERENCES `hm_patient` (`Patient_id`);

--
-- Constraints for table `hm_patientprocedure`
--
ALTER TABLE `hm_patientprocedure`
  ADD CONSTRAINT `hm_patientprocedure_ibfk_1` FOREIGN KEY (`Patient_id`) REFERENCES `hm_patient` (`Patient_id`),
  ADD CONSTRAINT `hm_patientprocedure_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `hm_user` (`User_id`);

--
-- Constraints for table `hm_patients_device_reading`
--
ALTER TABLE `hm_patients_device_reading`
  ADD CONSTRAINT `hm_patients_device_reading_ibfk_1` FOREIGN KEY (`Patient_id`) REFERENCES `hm_patient` (`Patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_patients_device_reading_ibfk_2` FOREIGN KEY (`Devices_id`,`Device_Attributes_id`) REFERENCES `hm_device_attributes` (`Devices_id`, `Device_Attributes_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_patient_family`
--
ALTER TABLE `hm_patient_family`
  ADD CONSTRAINT `hm_patient_family_ibfk_1` FOREIGN KEY (`Patient_id`) REFERENCES `hm_patient` (`Patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_patient_family_ibfk_2` FOREIGN KEY (`Cast_Category_Id`) REFERENCES `hm_cast_category` (`Cast_Category_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_patient_family_ibfk_3` FOREIGN KEY (`Gender_Id`) REFERENCES `hm_gender` (`Gender_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_patient_family_ibfk_4` FOREIGN KEY (`Card_Type_id`) REFERENCES `hm_identity_cards` (`Card_Type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_patient_vitals`
--
ALTER TABLE `hm_patient_vitals`
  ADD CONSTRAINT `hm_patient_vitals_ibfk_1` FOREIGN KEY (`Vitals_id`) REFERENCES `hm_vitals` (`Vitals_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_patient_vitals_ibfk_2` FOREIGN KEY (`Patient_id`) REFERENCES `hm_patient` (`Patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_phcdetails`
--
ALTER TABLE `hm_phcdetails`
  ADD CONSTRAINT `hm_phcdetails_ibfk_1` FOREIGN KEY (`PHC_ID`) REFERENCES `hm_phc` (`PHC_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_phcdetails_ibfk_2` FOREIGN KEY (`Village_id`) REFERENCES `hm_villages` (`Village_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_phc_user`
--
ALTER TABLE `hm_phc_user`
  ADD CONSTRAINT `hm_phc_user_ibfk_1` FOREIGN KEY (`PHC_ID`) REFERENCES `hm_phc` (`PHC_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_phc_user_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `hm_user` (`User_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_pincode`
--
ALTER TABLE `hm_pincode`
  ADD CONSTRAINT `hm_pincode_ibfk_1` FOREIGN KEY (`Country_ID`,`State_ID`,`District_id`,`City_id`) REFERENCES `hm_city` (`Country_ID`, `State_ID`, `District_id`, `City_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_program_details`
--
ALTER TABLE `hm_program_details`
  ADD CONSTRAINT `hm_program_details_ibfk_1` FOREIGN KEY (`Programs_id`) REFERENCES `hm_programs` (`Programs_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_program_details_transactions`
--
ALTER TABLE `hm_program_details_transactions`
  ADD CONSTRAINT `hm_program_details_transactions_ibfk_1` FOREIGN KEY (`Programs_id`,`Program_Details_id`) REFERENCES `hm_program_details` (`Programs_id`, `Program_Details_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_program_details_transactions_ibfk_2` FOREIGN KEY (`Patient_id`) REFERENCES `hm_patient` (`Patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_referals`
--
ALTER TABLE `hm_referals`
  ADD CONSTRAINT `hm_referals_ibfk_1` FOREIGN KEY (`Patient_id`) REFERENCES `hm_patient` (`Patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_referals_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `hm_user` (`User_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_referals_ibfk_3` FOREIGN KEY (`PHC_ID`) REFERENCES `hm_phc` (`PHC_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_referals_ibfk_4` FOREIGN KEY (`Village_id`) REFERENCES `hm_villages` (`Village_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_referals_ibfk_5` FOREIGN KEY (`Referral_Reason_Id`) REFERENCES `hm_referral_reason` (`Referral_Reason_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_severity`
--
ALTER TABLE `hm_severity`
  ADD CONSTRAINT `hm_severity_ibfk_1` FOREIGN KEY (`Patient_id`) REFERENCES `hm_patient` (`Patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_states`
--
ALTER TABLE `hm_states`
  ADD CONSTRAINT `hm_states_ibfk_1` FOREIGN KEY (`Country_ID`) REFERENCES `hm_country` (`Country_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_survey_questionair`
--
ALTER TABLE `hm_survey_questionair`
  ADD CONSTRAINT `hm_survey_questionair_ibfk_1` FOREIGN KEY (`Programs_id`,`Survey_template_id`) REFERENCES `hm_survey_template` (`Programs_id`, `Survey_template_id`),
  ADD CONSTRAINT `hm_survey_questionair_ibfk_2` FOREIGN KEY (`Actor_id`) REFERENCES `hm_actor` (`Actor_id`);

--
-- Constraints for table `hm_survey_results`
--
ALTER TABLE `hm_survey_results`
  ADD CONSTRAINT `hm_survey_results_ibfk_1` FOREIGN KEY (`Patient_id`) REFERENCES `hm_patient` (`Patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_survey_results_ibfk_2` FOREIGN KEY (`Survey_Questionair_id`) REFERENCES `hm_survey_questionair` (`Survey_Questionair_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_survey_template`
--
ALTER TABLE `hm_survey_template`
  ADD CONSTRAINT `hm_survey_template_ibfk_1` FOREIGN KEY (`Programs_id`) REFERENCES `hm_programs` (`Programs_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_tasks_patient`
--
ALTER TABLE `hm_tasks_patient`
  ADD CONSTRAINT `hm_tasks_patient_ibfk_1` FOREIGN KEY (`Patient_id`) REFERENCES `hm_patient` (`Patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_user`
--
ALTER TABLE `hm_user`
  ADD CONSTRAINT `hm_user_ibfk_1` FOREIGN KEY (`Programs_id`) REFERENCES `hm_programs` (`Programs_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_user_actor`
--
ALTER TABLE `hm_user_actor`
  ADD CONSTRAINT `hm_user_actor_ibfk_1` FOREIGN KEY (`Actor_id`) REFERENCES `hm_actor` (`Actor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_user_actor_ibfk_2` FOREIGN KEY (`Programs_id`) REFERENCES `hm_programs` (`Programs_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_user_actor_ibfk_3` FOREIGN KEY (`User_id`) REFERENCES `hm_user` (`User_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_user_details`
--
ALTER TABLE `hm_user_details`
  ADD CONSTRAINT `hm_user_details_ibfk_1` FOREIGN KEY (`PHC_ID`) REFERENCES `hm_phc` (`PHC_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_user_details_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `hm_user` (`User_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_user_tasks`
--
ALTER TABLE `hm_user_tasks`
  ADD CONSTRAINT `hm_user_tasks_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `hm_user` (`User_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hm_user_tasks_ibfk_2` FOREIGN KEY (`Programs_id`) REFERENCES `hm_programs` (`Programs_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_user_token`
--
ALTER TABLE `hm_user_token`
  ADD CONSTRAINT `hm_user_token_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `hm_user` (`User_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hm_villages`
--
ALTER TABLE `hm_villages`
  ADD CONSTRAINT `hm_villages_ibfk_1` FOREIGN KEY (`Country_ID`,`State_ID`,`District_id`,`City_id`) REFERENCES `hm_city` (`Country_ID`, `State_ID`, `District_id`, `City_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
