-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2022 at 02:37 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fiber`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `id` int(11) NOT NULL,
  `ticket` varchar(20) NOT NULL,
  `rec_date` date DEFAULT NULL,
  `ecd` date DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `market` int(11) DEFAULT 0,
  `ewo` varchar(225) DEFAULT NULL,
  `da` varchar(20) DEFAULT NULL,
  `lus` varchar(20) DEFAULT NULL,
  `wire_center` text DEFAULT NULL,
  `pfp` text DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `job_type` varchar(50) DEFAULT NULL,
  `job_no` varchar(20) DEFAULT NULL,
  `f1cfas` varchar(20) DEFAULT NULL,
  `f1job_no` varchar(20) DEFAULT NULL,
  `f1_sow` text DEFAULT NULL,
  `f2cfas` varchar(20) DEFAULT NULL,
  `f2job_no` varchar(20) DEFAULT NULL,
  `f2_sow` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `activity` text DEFAULT NULL,
  `assign_fielder` int(11) DEFAULT NULL,
  `assign_int_eng` int(11) DEFAULT NULL,
  `int_eng2` int(11) DEFAULT NULL,
  `lead_eng` int(11) DEFAULT NULL,
  `work_print` varchar(20) DEFAULT NULL,
  `footage` int(11) DEFAULT NULL,
  `appr_footage` int(11) DEFAULT NULL,
  `terminal` int(11) DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `added_date` varchar(20) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`id`, `ticket`, `rec_date`, `ecd`, `client_id`, `market`, `ewo`, `da`, `lus`, `wire_center`, `pfp`, `latitude`, `longitude`, `job_type`, `job_no`, `f1cfas`, `f1job_no`, `f1_sow`, `f2cfas`, `f2job_no`, `f2_sow`, `notes`, `activity`, `assign_fielder`, `assign_int_eng`, `int_eng2`, `lead_eng`, `work_print`, `footage`, `appr_footage`, `terminal`, `added_by`, `added_date`, `timestamp`) VALUES
(3, '122421-117', '2021-12-21', '2021-12-31', 1, NULL, NULL, '120301', '145 ', 'MIAMFLAL', ' R 3295 NW 53rd St, Miami, FL 33142, USA', '25.823020', '80.250899', NULL, NULL, 'A02834F', '', '', 'A028R9W', '', '', 'SAI  F 3210 NW 50TH ST (25.819909, -80.249246) FID# 46296978\r\nF2:\r\nNOTE:  BOUNDARY IS DRAWN ACCORDING TO LUR BOUNDARY AND SOME OF ADDRESS LYING OUTSIDE OF THE BOUNDARY.\r\n\r\nNOTES FOR FIELDER – This DA is to be fielded as aerial and buried in accordance with the existing copper plant. This job will need to be fielded and designed to AT&T requirements.\r\n\r\nFielder please use good engineering judgement and determine that there is no obstructions to limit equipment access for boring or splice, rear easement, etc. that would prevent construction building this job.\r\nFielders will need to confirm if a Homeowners Association is in place and obtain contact with the Property Manager to notify of the fiber overbuild project.', 'a:2:{i:0;s:1:\"1\";i:1;s:1:\"3\";}', 108, 108, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1640348857', '2021-12-24 12:49:04'),
(4, '122421-0004', '2021-12-15', '2021-12-21', 2, NULL, NULL, '21457', '456123', '5454', 'Test address', '123', '545', NULL, NULL, 'A01245', 'AS4054', 'f1 sow testing2', 'A01456', 'KL12354', 'f2 sow testing', 'Notes', 'a:2:{i:0;s:1:\"1\";i:1;s:1:\"3\";}', 156, 99, 108, 38, NULL, NULL, NULL, NULL, NULL, '1640350034', '2021-12-29 11:37:43'),
(5, '010722-0005', '2022-01-02', '2022-01-05', 1, NULL, NULL, '21457', '456123', '5454', 'Test address', '123', '545', NULL, NULL, 'A01245', 'AS4054', 'f1 sow testing', 'A01456', 'AS12354', 'f2 sow testing', 'testing', 'a:1:{i:0;s:1:\"1\";}', 198, 99, 38, 108, '4', NULL, NULL, NULL, 99, '1641557815', '2022-01-07 12:16:55'),
(6, '010722-0006', '2022-01-02', '2022-01-05', 1, NULL, NULL, '21457', '456123', '5454', 'Test address', '123', '545', NULL, NULL, 'A01245', 'AS4054', 'f1 sow testing', 'A01456', 'AS12354', 'f2 sow testing', 'testing', 'a:1:{i:0;s:1:\"1\";}', 198, 99, 38, 108, '4', NULL, NULL, NULL, 99, '1641557958', '2022-01-07 12:19:18'),
(7, '010722-0007', '2022-01-02', '2022-01-05', 1, NULL, NULL, '21457', '456123', '5454', 'Test address', '123', '545', '', '5451', 'A01245', 'AS4054', 'f1 sow testing', 'A01456', 'AS12354', 'f2 sow testing', 'testing', 'a:1:{i:0;s:1:\"1\";}', 198, 99, 108, 108, '4', NULL, NULL, NULL, 99, '1641558001', '2022-02-24 05:20:45');

-- --------------------------------------------------------

--
-- Table structure for table `activity_media`
--

CREATE TABLE `activity_media` (
  `id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `file_name` text DEFAULT NULL,
  `file_type` text DEFAULT NULL,
  `media_name` varchar(50) DEFAULT NULL,
  `caption` text DEFAULT NULL,
  `added_date` datetime NOT NULL,
  `added_by` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activity_media`
--

INSERT INTO `activity_media` (`id`, `activity_id`, `file_name`, `file_type`, `media_name`, `caption`, `added_date`, `added_by`, `timestamp`) VALUES
(1, 1, 'Screenshot_4__234c.png', 'f1', 'aerial_view_map', NULL, '2021-12-23 14:55:51', NULL, '2021-12-23 09:25:51'),
(2, 1, 'Screenshot_3__ee0c.png', 'f1', 'aerial_view_f1', NULL, '2021-12-23 14:55:51', NULL, '2021-12-23 09:25:51'),
(3, 1, 'Screenshot_1__8986.png', 'f1', 'f1_design_file', NULL, '2021-12-23 14:55:51', NULL, '2021-12-23 09:25:51'),
(4, 1, 'testing__c4fa.png', 'f2', 'f2_images', NULL, '2021-12-23 14:55:51', NULL, '2021-12-23 09:25:51'),
(5, 1, 'Screenshot_2__6c32.png', 'f2', 'aerial_view_f2', NULL, '2021-12-23 14:55:51', NULL, '2021-12-23 09:25:51'),
(6, 1, 'Screenshot_1__fc05.png', 'f2', 'sow_file', NULL, '2021-12-23 14:55:51', NULL, '2021-12-23 09:25:51'),
(9, 3, 'PSA 1110PF__a8ce.kmz', 'f1', 'aerial_view_f1', NULL, '2021-12-24 17:57:37', NULL, '2021-12-24 12:27:37'),
(8, 1, 'avatar-3__97a0.jpg', 'f2', 'F2 New', 'F2 New', '2021-12-23 15:06:53', NULL, '2021-12-23 09:36:53'),
(10, 3, 'F1 SCOPE OF WORK A019E75__5219.pdf', 'f1', 'f1_sow_file', NULL, '2021-12-24 17:57:37', NULL, '2021-12-24 12:27:37'),
(11, 3, 'F2 SCOPE OF WORK A028R9W__e4be.docx', 'f2', 'sow_file', NULL, '2021-12-24 17:57:37', NULL, '2021-12-24 12:27:37'),
(12, 4, 'Screenshot_2__12e5.png', 'f1', 'aerial_view_map', NULL, '2021-12-24 18:17:14', NULL, '2021-12-24 12:47:14'),
(13, 4, 'Screenshot_4__d42f.png', 'f1', 'aerial_view_f1', NULL, '2021-12-24 18:17:14', NULL, '2021-12-24 12:47:14'),
(14, 4, 'testing__a55b.png', 'f1', 'f1_design_file', NULL, '2021-12-24 18:17:14', NULL, '2021-12-24 12:47:14'),
(15, 4, 'Screenshot_1__bd11.png', 'f1', 'f1_sow_file', NULL, '2021-12-24 18:17:14', NULL, '2021-12-24 12:47:14'),
(16, 4, 'testing__a042.png', 'f2', 'f2_images', NULL, '2021-12-24 18:17:14', NULL, '2021-12-24 12:47:14'),
(17, 4, 'Screenshot_4__8b6e.png', 'f2', 'aerial_view_f2', NULL, '2021-12-24 18:17:14', NULL, '2021-12-24 12:47:14'),
(18, 4, 'Screenshot_2__7647.png', 'f2', 'sow_file', NULL, '2021-12-24 18:17:14', NULL, '2021-12-24 12:47:14'),
(19, 7, '11Untitled__ab9e.png', 'f1', 'aerial_view_map', NULL, '2022-01-07 17:50:01', 99, '2022-01-07 12:20:01'),
(20, 7, '12Untitled__c38c.png', 'f1', 'aerial_view_f1', NULL, '2022-01-07 17:50:01', 99, '2022-01-07 12:20:01'),
(21, 7, '14Untitled__0ea6.png', 'f1', 'f1_design_file', NULL, '2022-01-07 17:50:01', 99, '2022-01-07 12:20:01'),
(23, 7, '11Untitled__5c2b.png', 'f2', 'f2_images', NULL, '2022-01-07 17:50:01', 99, '2022-01-07 12:20:01'),
(24, 7, '13Untitled__cc26.png', 'f2', 'aerial_view_f2', NULL, '2022-01-07 17:50:01', 99, '2022-01-07 12:20:01'),
(25, 7, '12Untitled__7f0b.png', 'f2', 'sow_file', NULL, '2022-01-07 17:50:01', 99, '2022-01-07 12:20:01');

-- --------------------------------------------------------

--
-- Table structure for table `activity_tasks`
--

CREATE TABLE `activity_tasks` (
  `id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT 'fielding=1, design=2, drafting=3',
  `subtask` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `complete_date` date DEFAULT NULL,
  `status` int(11) NOT NULL COMMENT 'pending=0, ongoing=1, completed=2',
  `added_by` int(11) NOT NULL,
  `added_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bay_roles`
--

CREATE TABLE `bay_roles` (
  `id` int(11) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `page_role_column` varchar(255) DEFAULT NULL COMMENT 'for page_role table',
  `orderby` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bay_roles`
--

INSERT INTO `bay_roles` (`id`, `name`, `page_role_column`, `orderby`) VALUES
(1, 'Account Management', 'sales', 3),
(2, 'PMO\n', 'customer_service', 4),
(3, 'Admin', 'admin', 1),
(4, 'Technical - Wireless', 'operations', 5),
(5, 'Technical - OSP/Wiredline', 'production', 6),
(6, 'IT Department', 'r_n_d', 10),
(7, 'HR', 'hr', 7),
(8, 'Accounts & Finance', 'account', 9),
(9, 'Marketing', 'marketing', NULL),
(10, 'Recruiting', 'logistics', 8),
(11, 'Executive Team', 'management', 2);

-- --------------------------------------------------------

--
-- Table structure for table `bay_users`
--

CREATE TABLE `bay_users` (
  `id` int(11) NOT NULL,
  `title` int(11) NOT NULL COMMENT 'mr.=1, mrs.=2, miss=3',
  `fname` varchar(25) DEFAULT NULL,
  `mname` varchar(25) DEFAULT NULL,
  `lname` varchar(25) DEFAULT NULL,
  `emp_id` varchar(50) DEFAULT NULL,
  `cell_number` varchar(10) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `department` int(11) DEFAULT NULL COMMENT 'wireless=1, wireline=2, not applicable=3, both=4',
  `job_location` varchar(255) DEFAULT NULL COMMENT 'city_zip_state id',
  `pan` varchar(10) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `otp` varchar(6) DEFAULT NULL,
  `added_date` datetime DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT 0 COMMENT '0=active,1=not active',
  `company_id` int(11) DEFAULT NULL,
  `role` int(11) DEFAULT 0 COMMENT 'role id from table',
  `job_title_id` int(11) DEFAULT NULL COMMENT 'Desgination',
  `spouse_name` varchar(255) DEFAULT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `if_lead` int(11) NOT NULL DEFAULT 0 COMMENT '0=default,1=lead',
  `asc_lead_percent` float DEFAULT NULL COMMENT 'Associate lead (%)',
  `asc_lead_id` int(11) DEFAULT NULL,
  `if_asc_lead` int(11) NOT NULL DEFAULT 0 COMMENT '0=Default,1=Associate Lead',
  `by_admin_ban` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'if ban by admin it is 1 or else 0',
  `self_recru` float DEFAULT NULL COMMENT 'Self Recruitment %',
  `team_recru` float DEFAULT NULL COMMENT 'Team Recruitment %',
  `hourly_payroll` varchar(10) DEFAULT NULL,
  `basic` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `hra` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `da` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `sub_group_name` int(11) DEFAULT NULL,
  `aadhar_number` varchar(20) DEFAULT NULL,
  `ssn` varchar(11) DEFAULT NULL,
  `driving_licence` varchar(20) DEFAULT NULL,
  `dl_expiry` date DEFAULT NULL,
  `state_of_issue` varchar(50) DEFAULT NULL,
  `marital_status` int(11) NOT NULL COMMENT 'married=1, unmarried=2',
  `address` text DEFAULT NULL,
  `p_address` varchar(255) DEFAULT NULL,
  `r_zip` int(11) DEFAULT NULL,
  `p_zip` int(11) DEFAULT NULL,
  `personal_mobile` varchar(20) DEFAULT NULL,
  `personal_email` varchar(255) DEFAULT NULL,
  `reporting_office` varchar(255) DEFAULT NULL,
  `job_country` int(11) DEFAULT NULL COMMENT '0=usa, 1=india, 2=canada',
  `emg_name` varchar(255) DEFAULT NULL,
  `emg_number` varchar(15) DEFAULT NULL,
  `linkedin` text DEFAULT NULL,
  `blog` text DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `date_of_joining` varchar(20) DEFAULT NULL,
  `probation_till` varchar(20) DEFAULT NULL,
  `dt_resign` varchar(20) DEFAULT NULL,
  `account_number` varchar(20) DEFAULT NULL,
  `medical_vali` varchar(20) DEFAULT NULL,
  `medical_amount` varchar(20) DEFAULT NULL,
  `term_vali` varchar(20) DEFAULT NULL,
  `term_amount` varchar(20) DEFAULT NULL,
  `company` int(10) DEFAULT NULL,
  `login_token` varchar(255) DEFAULT NULL,
  `secret_code` varchar(100) DEFAULT NULL COMMENT 'for google auth',
  `otp_code` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bay_users`
--

INSERT INTO `bay_users` (`id`, `title`, `fname`, `mname`, `lname`, `emp_id`, `cell_number`, `email`, `department`, `job_location`, `pan`, `password`, `otp`, `added_date`, `is_active`, `company_id`, `role`, `job_title_id`, `spouse_name`, `lead_id`, `if_lead`, `asc_lead_percent`, `asc_lead_id`, `if_asc_lead`, `by_admin_ban`, `self_recru`, `team_recru`, `hourly_payroll`, `basic`, `hra`, `da`, `state`, `sub_group_name`, `aadhar_number`, `ssn`, `driving_licence`, `dl_expiry`, `state_of_issue`, `marital_status`, `address`, `p_address`, `r_zip`, `p_zip`, `personal_mobile`, `personal_email`, `reporting_office`, `job_country`, `emg_name`, `emg_number`, `linkedin`, `blog`, `pic`, `date_of_joining`, `probation_till`, `dt_resign`, `account_number`, `medical_vali`, `medical_amount`, `term_vali`, `term_amount`, `company`, `login_token`, `secret_code`, `otp_code`) VALUES
(1, 1, 'Amit', NULL, 'Gupta', 'INT-001', '9897730303', 'amit@integertel.com', 3, 'Noida', 'asdfsdfs78', '6ea7ccdcf642953a24672d10b0d32cef576e0329', NULL, '2021-09-20 02:24:26', 0, 1, 3, 45, 'Shikha', 2, 0, NULL, NULL, 0, 0, 0, NULL, '15000', '', '', '', 34, 11, '123456789101', NULL, NULL, NULL, NULL, 1, 'kamla nagar', 'kamal nagar', 25959, 40976, '9897730303', 'amit.sandlus@gmail.com', 'Dallas', 1, 'gugfvhuyv', '4569874569', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, '5e174b088390c702e8bc9aa98ea11bc9bd5b15c3', 'NMTM6YQU74FQFFTN', 6415),
(2, 1, 'Amar', NULL, 'U', 'INT-AGA0005', '7060404714', 'amar@integertel.com', 4, 'Dallas', '123ASD321', '3528d53791b507955037ac6de3f112a9af9e8105', NULL, '2021-03-04 16:13:10', 0, 1, 3, 5, 'Alwa', 2, 0, NULL, NULL, 0, 0, 0, NULL, '20000', NULL, NULL, NULL, NULL, 11, '122222222222', NULL, NULL, NULL, NULL, 1, '2775', 'fwy', 34445, 34420, '9876543210', 'raamar@example.com', 'Flower Mound', 0, 'Anuj', '9876543210', 'www.linkedin.com/amar', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, 'Abhinav', NULL, 'Ramamurthy', 'INT-AGA0027', '7060404701', 'Abhinav@integertel.com', 4, 'GAUTAM BUDDHA NAGAR', 'ASDF12212S', '3528d53791b507955037ac6de3f112a9af9e8105', NULL, '2021-03-04 16:17:22', 0, 1, 1, 68, '', 2, 0, NULL, NULL, 0, 0, 0, NULL, '25000', '', '', '', 34, 1, '123333333333', NULL, NULL, NULL, NULL, 2, 'gurgaon', 'county omax', 57504, 54456, '9897877984', 'raabhinav@example.com', 'Gautam Buddh Nagar', 1, 'Anuj', '989898989898', '', '', NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'H7MQFBUII5GZHYZ7', NULL),
(4, 1, 'Kusum', NULL, 'Yadav', 'INT-AGA0006', '9458525701', 'kusum@integertel.com', 4, 'GAUTAM BUDDHA NAGAR', 'qwecd0805g', '3528d53791b507955037ac6de3f112a9af9e8105', NULL, '2021-03-04 16:22:18', 1, 1, 7, 6, 'Anuj', 6, 0, NULL, NULL, 0, 1, 0, NULL, '15000', NULL, NULL, NULL, NULL, 11, '987654321000', NULL, NULL, NULL, NULL, 1, 'dwarka', 'kasjmir', 57504, 57504, '9876543211', 'kusum@example.com', 'Gautam Buddh Nagar', 1, 'Anuj', '98765444444', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 1, 'Arun', NULL, 'Singh', 'INT-AGA0013', '9368711250', 'arun@integertel.com', 3, 'Noida', '123asd321', '3528d53791b507955037ac6de3f112a9af9e8105', NULL, '2021-03-04 16:25:37', 0, 1, 1, 12, 'nameste', 2, 0, NULL, NULL, 0, 0, 0, NULL, '75000', '', '', '', NULL, 11, '123456789012', NULL, NULL, NULL, NULL, 1, 'kamla nagar agra', '59A', 24303, 26057, '3214569870', 'arun@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 2, 'Sareena', NULL, 'Sharma ', 'INT-AGA0010', '9368711251', 'sareena@integertel.com', 0, NULL, NULL, '3528d53791b507955037ac6de3f112a9af9e8105', NULL, '2021-03-04 16:27:24', 0, 1, 1, 27, NULL, 17, 0, NULL, NULL, 0, 0, 0, NULL, '103000', NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 3, 'Varshika', NULL, 'Sharma ', 'INT-AGA0011', '9368711256', 'varshika@integertel.com', 0, NULL, NULL, '3528d53791b507955037ac6de3f112a9af9e8105', NULL, '2021-03-04 16:29:31', 0, 1, 1, 9, NULL, 18, 0, NULL, NULL, 0, 0, 0, NULL, '50000', NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 0, 'Bramhesh', NULL, 'Ji', 'INT-AGA0004', '8979004131', 'bramhesh@integertel.com', 0, NULL, NULL, '3528d53791b507955037ac6de3f112a9af9e8105', NULL, '2021-03-04 16:37:44', 1, 1, 11, 67, NULL, 25, 0, NULL, NULL, 0, 1, 0, NULL, '22000', '', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 0, 'Sanjay', NULL, 'Rathore', 'INT-AGA0023', '7060015032', 'sanjeev@integertel.com', 0, NULL, NULL, '59493a323d7c5ae6804e3c1b5bf58547e4a84448', NULL, '2021-03-04 17:10:58', 0, 1, 2, 20, NULL, 35, 0, NULL, NULL, 0, 0, 0, NULL, '12000', '', '', '', 0, 11, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(34, 0, 'Arjun', NULL, 'Shakya', 'INT-AGA0024', '7060404717', 'arjun@integertel.com', 0, NULL, NULL, '092acf80a68da8f24998b6f655548c1225eb0d60', NULL, '2021-03-04 17:12:12', 0, 1, 2, 21, NULL, 35, 0, NULL, NULL, 0, 0, 0, NULL, '15000', '', '', '', 0, 11, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(35, 0, 'Afzal', NULL, 'Saifi', 'INT-AGA0025', '9368711258', 'cares@integertel.com', 0, NULL, NULL, '6fec01bf978a03795fc106122fb2a966e867450d', NULL, '2021-03-04 17:14:24', 1, 1, 2, 71, NULL, 88, 0, NULL, NULL, 0, 1, 0, NULL, '15100', '15100', '', '', 34, 11, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '7668002062', 'afzalsaifi992@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-13', '2021-05-13', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(38, 1, 'Amit', NULL, 'Gupta', 'TEST123', '9897730303', 'amit@sandlus.co.in', 2, 'Noida', '12HZPK4578', '45fd212f13bbb6936c48875688f0e2319b7eb5c3', NULL, '2021-03-04 16:17:22', 0, 1, 11, 35, 'Manoj Gupta', 99, 1, NULL, NULL, 0, 0, 0, NULL, '10000', '', '', '', NULL, 0, '123456789303', NULL, '', NULL, '', 1, '1/25, Kamla Nagar', '57, Dayalbagh', 40976, 40978, '9897730303', 'personal@example.com', 'Flower Mound', 1, 'Cfddf', '7894561234', 'www.google.com', '', NULL, '2021-10-20', NULL, NULL, NULL, 'NA', NULL, NULL, NULL, NULL, '78fb1de3d835ea5a4555726346fbb1ab8fd167a7', 'MHEAU6W4IHSVVZQY', 8160),
(39, 0, 'Amit', NULL, 'Tech', '', '9897730303', 'amit.sandlus@gmail.com', 0, NULL, NULL, '6ea7ccdcf642953a24672d10b0d32cef576e0329', '209995', '2021-03-04 16:17:22', 0, 1, 8, 0, NULL, 88, 0, NULL, NULL, 0, 0, 0, NULL, '10000', '6000', '3000', '1000', 34, 2, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-27', '2021-07-27', NULL, NULL, NULL, NULL, NULL, NULL, 1, '945adedc0119089e76b8db49ca029c000f6d6677', NULL, NULL),
(40, 0, 'Shubham', NULL, 'Sharma', 'INT-AGA0032', '6397308621', 'subham@integertel.com', 0, NULL, NULL, 'b376c5bbf7d30f2e7211b0ac1c2abb7a5bafd593', NULL, '2021-03-16 12:05:20', 1, 1, 1, 14, NULL, 36, 0, NULL, NULL, 0, 1, 0, NULL, '10000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 0, 'SHAILESH', NULL, 'SHARMA ', 'INT-AGA0007', '9837000183', 'finance@integertel.com', 0, NULL, NULL, 'f619f98b32303673b8bb3aee651839ee0c042a89', NULL, '2021-03-16 12:17:19', 1, 1, 1, 7, NULL, 16, 0, NULL, NULL, 0, 1, 0, NULL, '25000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(98, 0, 'Pradeep', NULL, 'KUMAR`', '', '9520818173', 'pradeep@integertel.com', 0, NULL, NULL, 'eb236c57eb833533113d17968aa9a30c0aaeca18', NULL, '2021-07-30 17:38:16', 1, 1, 4, 60, NULL, 30, 0, NULL, NULL, 0, 1, 0, NULL, '8000', '', '', '', NULL, 10, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '9520818173', 'na', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(99, 1, 'Mayank', NULL, 'Kumar', 'MAY20INT', '8171781002', 'mayank.sandlus@gmail.com', 2, 'Noida', '12HZHH4578', '6ea7ccdcf642953a24672d10b0d32cef576e0329', '781262', '2021-08-11 12:56:29', 0, NULL, 4, 63, 'Deva', 108, 0, NULL, NULL, 0, 0, 0, NULL, '6000', '', '', '', NULL, 11, '547812365478', NULL, '', NULL, '', 2, '1 25  Saran Ashram Hospital Campus Dayalbagh', '1 25  Saran Ashram Hospital Campus Dayalbagh', 50366, 50366, '8745632145', 'mkumar935867@gmail.com', 'Gautam Buddh Nagar', 1, 'Demos', '4515151544', 'www.google.com', 'www.yahoo.com', NULL, '2021-01-09', NULL, NULL, NULL, 'NA', NULL, NULL, NULL, NULL, '2d69a6fbf3d42bc70d0d6a43d8314319e659a59b', 'ADGPPXBRO73GLA4H', NULL),
(100, 1, 'Test', NULL, 'Test', '', '9897625249', 'test@gmail.com', 1, 'CHITTOOR', 'qwer98745s', 'fb15a1bc444e13e2c58a0a502c74a54106b5a0dc', NULL, '2021-08-28 11:36:55', 0, 1, 2, 66, '', 96, 0, NULL, NULL, 0, 0, 0, NULL, '', '', '', '', NULL, 11, '456987101010', NULL, NULL, NULL, NULL, 2, 'shaiy road', 'shaiy road', 42345, 42345, '9876543210', 'ravishastri@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-12', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(101, 0, 'Sumit', NULL, 'Pahwa', 'msp0017', '7060404725', 'sumit@gmail.com', 0, NULL, NULL, 'f148b2ded769a09fb21a205e69c7ef7ba8500e18', NULL, '2021-09-06 20:15:17', 0, 1, 2, 64, NULL, 56, 0, NULL, NULL, 0, 0, 0, NULL, '12000', '', '', '', 34, 11, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-08', '', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL),
(104, 1, 'Amit Gupta', NULL, NULL, NULL, '9897730304', 'amit.sandlu@gmail.com', 1, 'Noida', '123123', '6ea7ccdcf642953a24672d10b0d32cef576e0329', NULL, '2021-09-23 18:08:12', 0, NULL, 4, 8, NULL, 2, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456789012', NULL, NULL, NULL, NULL, 1, 'kamla nagar', 'kamal nagar', 50366, 50366, '9897730303', 'ram@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'QWA5EVQDY36LBO7Q', NULL),
(105, 0, NULL, NULL, NULL, NULL, '9876543210', 'new@example.com', NULL, NULL, NULL, '6ea7ccdcf642953a24672d10b0d32cef576e0329', NULL, '2021-09-27 12:34:06', 0, NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(108, 1, 'Subodh', NULL, 'Jha', 'INT-180', '9759760359', 'subodh.sandlus@gmail.com', 2, 'Agra', 'DMNJHJKHDF', '6ea7ccdcf642953a24672d10b0d32cef576e0329', NULL, '2021-09-20 02:24:26', 0, NULL, 7, 45, '', 0, 1, NULL, NULL, 0, 0, 0, NULL, '15000', '', '', '', 34, 11, '894543543543543435', NULL, '', NULL, '', 1, 'aGRA', 'aGTRA', 49303, 49303, '9759760359', 'SUBO@G.COM', 'Gautam Buddh Nagar', 1, 'Demo', '4567892548', 'www.linkedin.com/subodh', '', NULL, '2021-10-11', '', NULL, NULL, 'frte4534534', NULL, NULL, 'XVQ2UIGO75SUBKUM', 1, 'bf2cadf397a2f278d943fd4098fc37eecea95ebd', 'GEF4D7EKNPKUG5PJ', NULL),
(109, 0, NULL, NULL, NULL, NULL, '9759760359', 'subodh@integertel.com', NULL, NULL, NULL, '6ea7ccdcf642953a24672d10b0d32cef576e0329', NULL, '2021-10-08 17:40:01', 0, NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'f349828d0ce8f4d86ff671f771081fcbc6604c6f', '75LTDMXZNBR2D5EO', NULL),
(110, 1, 'Amit Gupta', NULL, '', 'INT-171', '7017001305', 'sales@sandlus.co.in', 4, 'GAUTAM BUDDHA NAGAR', 'QWERE2334R', '6ea7ccdcf642953a24672d10b0d32cef576e0329', NULL, '2021-10-09 14:07:52', 0, NULL, 11, 6, 'Shikha', 38, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '456645664566', NULL, '', NULL, '', 1, '59A', 'kamla', 49303, 49303, '9877303030', 'amit.sandlus@gmail.com', 'Gautam Buddh Nagar', 1, 'Anuj', '9876543211', 'www.linkedin.com/amit', 'www.blog.com/seo', NULL, '2021-06-01', NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL, '1c38df83b429ead0cbd9b4a24c56a461a2df2a80', 'QMXLE5L46EFK3Z5Z', NULL),
(114, 0, NULL, NULL, NULL, NULL, '9897730654', 'jobs@sandlus.co.in', NULL, NULL, NULL, '6ea7ccdcf642953a24672d10b0d32cef576e0329', NULL, '2021-10-26 11:13:50', 0, NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ODDGNK7TGJ2RFZVC', NULL),
(115, 0, NULL, NULL, NULL, NULL, '9897730888', 'anshu.sandlus@gmail.com', NULL, NULL, NULL, '6ea7ccdcf642953a24672d10b0d32cef576e0329', NULL, '2021-10-26 11:15:59', 0, NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A7ZXAGTKAZQLKHX6', NULL),
(122, 0, NULL, NULL, NULL, NULL, '4561237589', 'subodhj88@gmail.com', NULL, NULL, NULL, '6ea7ccdcf642953a24672d10b0d32cef576e0329', NULL, '2021-10-26 11:54:32', 0, NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NIRKUE5JAZI4KFDI', NULL),
(123, 1, 'Amit Technical', NULL, NULL, 'INT-141', '9897730344', 'amitgupta@sandlus.co.in', 4, 'GAUTAM BUDDHA NAGAR', '123ASD321', '6ea7ccdcf642953a24672d10b0d32cef576e0329', NULL, '2021-10-26 16:01:42', 0, NULL, 4, 43, '', 1, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6546546545', NULL, NULL, NULL, NULL, 2, 'kamla nagar', 'kamal nagar', 57995, 54456, '6546546545', 'amittech@example.com', 'Gautam Buddh Nagar', 1, 'Ramlal', '6546546545', 'www.linkedin.com/amit', 'www.blog.com/seo', NULL, '2020-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '856b6190e81012dbfc9693b5e60c380ddc7c399e', 'KKJJ4QUWEQQBC2GQ', NULL),
(124, 1, 'New Manager', NULL, '', 'INT-1771', '6697730303', 'newmanager@integertel.com', 1, 'Dallas', 'ASDF12212S', '6ea7ccdcf642953a24672d10b0d32cef576e0329', NULL, '2021-10-26 16:05:47', 0, NULL, 4, 8, 'Nameste', 99, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '45645654654', '123-45-6789', 'TEST1234', '2021-12-31', 'TX', 1, '1/25, Kamla Nagar', 'kashmir', 24303, 24303, '4564565465', 'ram@gmail.com', 'Dallas', 0, 'Anuj', '4564565465', 'www.linkedin.com/amit', 'www.blog.com/seo', NULL, '1990-01-01', NULL, NULL, NULL, 'NA', NULL, NULL, NULL, NULL, '7f964df9ff3706be14d9b51a91af66c89d1cfbc8', 'UEDW6UYXT5MP3XOS', NULL),
(125, 0, NULL, NULL, NULL, NULL, '7897856756', 'subodh@gmail.com', NULL, NULL, NULL, '6ea7ccdcf642953a24672d10b0d32cef576e0329', NULL, '2021-10-29 17:37:31', 0, NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0212becfa204af1b3ca1f87b3d5b20c035b47d69', 'Q7HCGPV5OAXA3IAA', NULL),
(126, 1, 'Amit Softql', NULL, NULL, 'INT-202', '6398786785', 'amit@softql.com', 1, 'Flower Mound', '123ASD321', '6ea7ccdcf642953a24672d10b0d32cef576e0329', NULL, '2021-11-01 13:39:38', 0, NULL, 1, 8, '', 2, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123465789101', NULL, NULL, NULL, NULL, 2, '1/25, Kamla Nagar', 'kamal nagar', 24303, 49303, '9897730303', 'amit.sandlus@gmail.com', 'Flower Mound', 0, 'Anil', '9897730303', 'www.linkedin.com/amitsoft', 'www.blog.com/integer', NULL, '2021-09-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AKILGHFFDNGXYSES', NULL),
(127, 0, NULL, NULL, NULL, NULL, '9759760358', 'subodh@integertel.com', NULL, NULL, NULL, '6ea7ccdcf642953a24672d10b0d32cef576e0329', NULL, '2021-11-09 15:35:28', 0, NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(128, 0, NULL, NULL, NULL, NULL, '5754574865', 'subodh.kumar@integermobile.com', NULL, NULL, NULL, '6ea7ccdcf642953a24672d10b0d32cef576e0329', NULL, '2021-11-29 11:27:06', 0, NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'OG6S6F5S7NL5DWXS', NULL),
(129, 0, NULL, NULL, NULL, NULL, '7017001307', 'amit@integermobile.com', NULL, NULL, NULL, '6ea7ccdcf642953a24672d10b0d32cef576e0329', NULL, '2021-11-29 13:02:41', 0, NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '8edf8e651778b42ce584183600b436607073b962', '2562YQB4SCBWAMQX', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `name` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`) VALUES
(1, 'Amdocs'),
(2, 'Empire');

-- --------------------------------------------------------

--
-- Table structure for table `feusers`
--

CREATE TABLE `feusers` (
  `id` int(11) NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `mname` varchar(25) DEFAULT NULL,
  `lname` varchar(25) DEFAULT NULL,
  `cell_number` varchar(10) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `client` int(11) DEFAULT NULL,
  `added_date` datetime DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT 0 COMMENT '0=active,1=not active',
  `company_id` int(11) DEFAULT NULL,
  `superviser_id` int(11) DEFAULT NULL,
  `role` int(11) DEFAULT 0 COMMENT '0=feuser,1=superviser,2=normal user, 5=GC',
  `by_admin_ban` tinyint(4) NOT NULL DEFAULT 0 COMMENT ' if ban by admin it is 1 or else 0',
  `web_email` varchar(70) DEFAULT NULL,
  `web_pass` varchar(45) DEFAULT NULL,
  `forgot_password_status` int(11) NOT NULL DEFAULT 0 COMMENT '1=request for forgot pass, 0=no ',
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feusers`
--

INSERT INTO `feusers` (`id`, `fname`, `mname`, `lname`, `cell_number`, `email`, `password`, `client`, `added_date`, `is_active`, `company_id`, `superviser_id`, `role`, `by_admin_ban`, `web_email`, `web_pass`, `forgot_password_status`, `token`) VALUES
(24, 'Pradeep', '', 'Gagganapally', '6207190961', 'pradeepgagganapally@gmail.com', 'fb4aae121a09e69c1b3630ea9707bb46cc7f7247', NULL, '2019-07-09 14:24:51', 0, 1, NULL, 0, 0, '', '', 0, ''),
(35, 'Vidyanidhi', NULL, 'Danda', '6207190209', 'vinnydanda@gmail.com', '367582e08892d8c5360dbb5be812a582cb80e891', NULL, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, ''),
(44, 'William', NULL, 'Barry', '2516103974', 'MRBARRY77@GMAIL.COM', '367582e08892d8c5360dbb5be812a582cb80e891', NULL, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, ''),
(48, 'Shiva', '', 'Reddy', '6207047888', 'shiva@softql.com', '3a4d81ad77711f0df623c45f1b375047dd94591b', NULL, '2019-07-10 08:16:32', 0, 1, NULL, 0, 0, '', '', 0, ''),
(91, 'Amit', '', 'USA', '9897730303', 'amitusa@sandlus.co.in', 'fd9c94b602a3b2bffd7b2c53a26d7b0d9afdd2b7', 1, '2019-05-14 00:00:00', 0, 1, NULL, 5, 0, 'testgc@integermobile.com', 'softql@123', 0, ''),
(94, 'Phillip', '', 'Lwasa', '5088088760', 'phillip.lwasa@gmail.com', '3a4d81ad77711f0df623c45f1b375047dd94591b', NULL, '2019-07-11 12:42:51', 0, 1, NULL, 0, 0, '', '', 1, '7486'),
(95, 'Augustine', '', 'Ayankoya', '2024039913', 'woleayan@gmail.com', '3a4d81ad77711f0df623c45f1b375047dd94591b', NULL, '2019-07-17 12:57:10', 0, 1, NULL, 0, 0, 'woleayan@gmail.com', 'woleayan@gmail.com', 0, ''),
(97, 'Ron', '', 'Hanner', '3152817753', 'rhanner@empiretelecomm.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2019-08-12 23:51:56', 0, 1, NULL, 0, 0, '', '', 1, '2708'),
(98, 'Derek', '', 'Dydyk  ', '3154805153', 'ddydyk@empiretelecomm.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2019-08-12 23:52:32', 0, 1, NULL, 5, 0, 'ddydyk@empiretelecomm.com', 'Empire12345', 0, ''),
(99, 'Jesse', '', ' Murphy ', '9784301609', 'jmurphy@empiretelecomm.com', 'ac3f45e9b65340124a02c32f92e78202ae21d97b', NULL, '2019-08-13 09:22:19', 0, 1, NULL, 0, 0, '', '', 0, ''),
(101, 'Thomas', '', 'Hildreth', '3154810460', 'thildreth@empiretelecomm.com', '9d938d98103caacc204fe15d2814a61c89630664', NULL, '2019-08-13 09:23:56', 0, 1, NULL, 0, 0, '', '', 0, ''),
(102, 'Homer', '', ' Rice', '3153178155', 'hrice@empiretelecomm.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2019-08-15 12:03:20', 0, 1, NULL, 0, 0, '', '', 0, ''),
(103, 'Amit', NULL, 'Gupta', '4786456444', 'amit.sandlus@gmail.com', '6ea7ccdcf642953a24672d10b0d32cef576e0329', NULL, '2019-09-18 06:46:31', 0, 0, NULL, 5, 0, NULL, NULL, 0, ''),
(104, 'Subodh', NULL, 'Jha', '9759760359', 'subodh.sandlus@gmail.com', '6ea7ccdcf642953a24672d10b0d32cef576e0329', NULL, '2019-09-18 08:30:22', 0, 0, NULL, 5, 0, NULL, NULL, 0, ''),
(106, 'Amar Test', '', '', '9723107313', 'amar@integertel.com', '12bbdb8a2f500110fecc4853b0ece89199f1c517', NULL, '2019-09-20 13:26:43', 0, 1, NULL, 5, 0, 'amargc@integermobile.com', 'softql@123', 0, ''),
(107, 'Kunj Test', '', '', '2146863700', 'kunj@integertel.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2019-09-21 10:47:41', 0, 1, NULL, 5, 0, 'kunj@integertel.com', 'Empire1234', 0, ''),
(108, 'Abhinav Test', '', '', '9727526351', 'abhinav@integertel.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2019-09-21 12:11:50', 0, 1, NULL, 5, 0, 'abhinav@integermobile.com', 'softql@123', 0, ''),
(110, 'Bidhan', 'Chandra', 'Ghorai', '9727526355', 'bidhan@integertel.com', 'c1fe094db3b89499f9e3270407f6e3e3eb3e6f71', NULL, '2019-09-26 09:43:53', 0, 1, NULL, 5, 0, 'bidhan@integertel.com', 'Integer1234', 0, ''),
(112, 'Test', '', 'FE', '9727526351', 'abhinav.ramamurthy@gmail.com', '3a4d81ad77711f0df623c45f1b375047dd94591b', NULL, '2019-10-07 11:44:51', 0, 1, NULL, 0, 0, '', '', 1, '1786'),
(113, 'Moustaph', NULL, 'Fall', '7742322420', 'moustaphf@gmail.com', '2cc30c4146ad67c07984394ec1a56be3d4e042cb', NULL, '2019-10-16 12:27:21', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(114, 'Anwar', '', 'Jacobs', '6827173786', 'BIGWATER.AJ@GMAIL.COM', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2019-10-29 01:42:29', 0, 1, NULL, 0, 0, '', '', 0, ''),
(115, 'Iman', NULL, 'Morid', '1917809262', 'omidomid6002@gmail.com', '4b0aa894b49b09a28993efb07fe8c9c6345835d9', NULL, '2019-10-29 21:48:27', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(116, 'Jorge', NULL, 'Antonio', '8054249619', 'jorge@integertel.com', '64d7a02bfbf5b00c8c1c390557a264f0af41b1d6', NULL, '2019-10-31 17:20:28', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(117, 'TIM', NULL, 'TROUNG', '2142322078', 'TIM@INTEGERTEL.COM', 'fd9c94b602a3b2bffd7b2c53a26d7b0d9afdd2b7', NULL, '2019-11-01 10:09:47', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(118, 'Admin FE', '', '', '9727526351', 'PMO_Empire@integertel.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2019-11-07 13:56:21', 0, 1, NULL, 0, 0, '', '', 0, ''),
(119, 'James', NULL, 'Tuirok', '4012985428', 'jtuirok@empiretelecomm.com', '57184015799367b0077c6aa4fcbd0130b0d0af71', NULL, '2019-11-11 14:20:35', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(120, 'Kenan', NULL, 'Costello', '3152817853', 'kcostello@empiretelecomm.com', '98c1e5a334efba15fafb1e48a2ad2d032df85ece', NULL, '2019-11-11 14:58:49', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(122, 'James', NULL, 'Tuirok', '4012985428', 'jtuirok@gmail.com', '57184015799367b0077c6aa4fcbd0130b0d0af71', NULL, '2019-11-12 10:55:46', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(123, 'Neil', '', 'Pinigis', '4074321842', 'neil.pinigis@dish.com', 'c6098a0ece4c697c9b35200822eea73bbcb37561', NULL, '2019-11-12 13:22:42', 0, 1, NULL, 5, 0, 'neil.pinigis@dish.com', '', 0, ''),
(124, 'Nicholas', NULL, 'Hanson', '3157272705', 'nhanson@empiretelecomm.com', '300d64cc5b12a2ff4e040b835cc0b7c51155ce52', NULL, '2019-11-12 16:48:31', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(125, 'ABDUSAMAD', NULL, 'SHARIPOV', '2158823536', 'xopersian@gmail.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2019-11-12 16:52:53', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(126, 'Tammy', NULL, 'Nosek', '5188607063', 'tammy.nosek@crowncastle.com', '4adffbfdecda5c4323992adc5babe01f2bb19ef8', NULL, '2019-11-13 06:16:51', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(127, 'Kendall', NULL, 'McGree', '7067559015', 'kendall.mcgree@dish.com', '7536da74cfec2d8c0c07c740b687e003b3ae2c25', NULL, '2019-11-13 15:15:59', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(128, 'Jordi', NULL, 'Fernandez ', '9294129683', 'yordifernandez6@gmail.com', '4be30d9814c6d4e9800e0d2ea9ec9fb00efa887b', NULL, '2019-11-13 16:09:27', 0, 1, NULL, 5, 0, NULL, NULL, 1, '2326'),
(130, 'David', NULL, 'Burth', '3154617084', 'dburth@empiretelecomm.com', 'fab56ceb4a7c8ead46fc52d33293fa8e904812db', NULL, '2019-11-13 18:48:33', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(131, 'Charles', 'Chuck', 'Clark', '6624201697', 'charlesclark@integertel.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2019-11-14 01:46:02', 0, 1, NULL, 0, 0, '', '', 0, ''),
(134, 'Ronald', NULL, 'Ruiz', '7187102080', 'moranronald1984@gmail.com', '4be30d9814c6d4e9800e0d2ea9ec9fb00efa887b', NULL, '2019-11-20 10:18:29', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(135, 'Russell', NULL, 'Archer', '5182214549', 'Rarcher@empiretelecomm.com', '4303344b15b134d25a101a2d23ff701923724718', NULL, '2019-11-22 10:44:19', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(136, 'Test', NULL, 'Mail', '9897730303', 'testmail@sandlus.co.in', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2019-11-23 05:25:16', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(137, 'Amar', NULL, 'Gmail', '9723107313', 'amarendrau@gmail.com', '03d38d2166a7f547fc1d8ef2b50c7232683f270b', NULL, '2019-11-23 10:06:38', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(138, 'ABDUSAMAD', NULL, 'SHARIPOV', '2158823536', 'samad@sluniversal.com', '5e32e21c50477603fb333725e3c8f172946dfbc1', NULL, '2019-12-02 09:10:32', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(139, 'Stanislav', NULL, 'Kudinov', '3472957581', 'stanislavk@sluniversal.com', '4be30d9814c6d4e9800e0d2ea9ec9fb00efa887b', NULL, '2019-12-02 12:19:22', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(140, 'Aleksandr', NULL, 'Belov', '7182079207', 'alexb@sluniversal.com', 'cf1f9d41c45902f63252bd2198904246d7e66e6f', NULL, '2019-12-02 12:34:25', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(141, 'Brian', '', 'Bermeo', '3473034283', 'brian@masterinsidecorp.com', 'cf82b4a391e99680786200fc8f8d2af73ad124e0', NULL, '2019-12-12 07:44:36', 0, 1, NULL, 5, 0, '', '', 0, ''),
(142, 'Chad', NULL, 'Oakes', '8149317105', 'oakeschad@rocketmail.com', 'd5df1834492e923a31b8faf69dddf92b851ec865', NULL, '2019-12-17 19:07:02', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(143, 'Gerardo GC', NULL, 'Orozco GC', '2066028445', 'gerardo.omtz@gmail.com', '4be30d9814c6d4e9800e0d2ea9ec9fb00efa887b', NULL, '2019-12-17 19:14:13', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(144, 'Todd', NULL, 'Forshaw', '3308192197', 'tforshaw@aurorapgh.com', '7c75478c677b22c9f36f38ceb0d585db99ef5994', NULL, '2019-12-17 21:40:50', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(145, 'Phil', NULL, 'Blackburn ', '0778874046', 'pblackburn@elev8hire.com', '2ba51ec96407b752b68bb7d135f21230001f7675', NULL, '2019-12-22 23:27:04', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(146, 'Philip', NULL, 'Blackburn ', '0781301102', 'philblackburn69@gmail.com', '4a5d0d670dcc6a03a21820a329b31c1a2383ab6a', NULL, '2019-12-22 23:30:53', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(147, 'Nelson', NULL, 'Matos', '3153738317', 'nmatos@empiretelecomm.com', 'f73e0d39398053999e309d102d7d3fa92564cec0', NULL, '2019-12-31 14:11:28', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(148, 'Michael', NULL, 'Moerman', '3155764743', 'michael.moerman75@gmail.com', 'c9787224c391bc93c9ffa8a4f0784ab884b8966f', NULL, '2020-01-07 18:51:46', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(149, 'Mauricio', '', 'Martinez', '9293024407', 'mauricio@mastericorp.com', 'a0e82d248d2fbd72a1f5b4a3b5abccfd2b54d77d', NULL, '2020-01-08 11:18:28', 0, 1, NULL, 5, 0, 'mauricio@mastericorp.com', '', 0, ''),
(150, 'Andrei', NULL, 'Lenkov ', '2675744041', 'andrei.lenkou@sluniversal.com', '925153351cfd678c6b63c6a8122eb69b5a4c6eac', NULL, '2020-01-09 08:41:42', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(151, 'Rati', NULL, 'Gogolauri', '6092223082', 'arrete@yahoo.com', '222c62d6d820779f093663a105b4b171e25df0f6', NULL, '2020-01-09 09:30:55', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(152, 'Steven', '', 'Ielfield ', '3154869768', 'Steve@bluewavecomm.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-01-09 16:12:59', 0, 1, NULL, 5, 0, '', '', 0, ''),
(153, 'MAX', '', 'LANG', '9012578881', 'mxlang85@gmail.com', 'e5c9ed04c6825f6c4badfbecfb5d6f6c2a354b03', NULL, '2020-01-12 17:37:09', 0, 1, NULL, 0, 0, '', '', 0, ''),
(154, 'Philip', '', 'Bisesto', '2392843981', 'philip.bisesto@dish.com', '88a1df8232ed4c3d6041ddbcca45d2596021d440', NULL, '2020-01-13 09:54:34', 0, 1, NULL, 5, 0, '', '', 0, ''),
(156, 'alex', NULL, 'charvonik', '2159648582', 'chervonik.by@gmail.com', '6367c48dd193d56ea7b0baad25b19455e529f5ee', NULL, '2020-01-13 14:00:50', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(158, 'Ryan', NULL, 'Sousa', '7746275103', 'ryan@abrielltech.com', '079212b383441c1ded991d70815d5f047e7f1ad2', NULL, '2020-01-15 12:32:20', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(159, 'Mario', NULL, ' Borges', '7746441454', 'Mario@abrielltech.com', '67580c6ee91fe37c0cd93cf6787be4dcaa217701', NULL, '2020-01-16 08:14:29', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(160, 'Jamison', NULL, 'Haugh', '7247574001', 'jph2929@gmail.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-01-17 11:41:52', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(161, 'David', NULL, 'Thoma', '9732226959', 'dthoma@tnttelecomm.com', '9d938d98103caacc204fe15d2814a61c89630664', NULL, '2020-01-21 09:07:38', 0, 1, NULL, 5, 0, NULL, NULL, 1, '8544'),
(163, 'Mike', NULL, 'Cypranowski', '2012459987', 'mcypranowski@empiretelecomm.com', 'e192992ee57e736ace7fa7e952f7a480de977674', NULL, '2020-01-21 11:44:23', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(164, 'Vladimir', NULL, 'Balandin', '3235059900', 'vladimirb@sluniversal.com', 'e8467969bb1338dda0032a16e11139d5a19c77cc', NULL, '2020-01-22 09:00:54', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(165, 'Kiryl', '', 'Buyar', '2674085771', 'kirylb@sluniversal.com', '819875dcbbf524a1525d31bcba05b63e2ad0c4ec', NULL, '2020-01-22 09:24:03', 0, 1, NULL, 5, 0, '', '', 1, '4283'),
(166, 'farshid', NULL, 'heydari', '0991052524', 'farshidiran66@gmail.con', 'f07fe352669574ad122fe9d7677245fabdf7dc2a', NULL, '2020-01-22 10:31:35', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(167, 'Aliaksei', NULL, 'Bryliou ', '6462328708', 'abrylev@sluniversal.com', '1995a6d837d209ef4e517828715d74e3c70c3253', NULL, '2020-01-23 08:59:41', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(168, 'Anthony', '', 'Simmons', '9014968287', 'anthony@integertel.com', 'ebb5f819eb02e2467caa1b4b972b3fd03e7706c9', NULL, '2020-01-23 09:41:37', 0, 1, NULL, 0, 0, '', '', 0, ''),
(169, 'Giuseppe', NULL, 'Emmolo', '8563438010', 'giuseppe@fmkinfra.com', 'ed35313f23e30fbfc65aa8f300462132f8b501d4', NULL, '2020-01-23 15:04:52', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(170, 'Brandon', NULL, 'Noone ', '9893594084', 'bnoone@fmkinfra.com', '3fd762ea8e61263fab82a6fd88b09708ceb550f9', NULL, '2020-01-23 15:39:17', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(172, 'Luis', '', 'Ruiz', '3052135366', 'lruiz@wisetechcompany.com', '9791b727917b07d20545b4771e16bbfe0ba358b4', NULL, '2020-01-28 10:08:16', 0, 1, NULL, 5, 0, 'lruiz@wisetechcompany.com', 'Empire1234', 1, '7173'),
(173, 'Adrian', NULL, 'Martiniuc', '2673562999', 'adrian.m@invertice.net', '97c237790803ac9e95c666b7423e30cf85fef4f1', NULL, '2020-01-28 10:13:43', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(174, 'Yevhenii', NULL, 'Pinchuk', '3143494264', 'pinchuk.y@invertice.net', '9363fd724586537411ffebeee2ce6e1708e29b7b', NULL, '2020-01-28 10:31:30', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(175, 'Robert', '', 'Jayne ', '3157291004', 'rjayne@aerialwireless.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-01-29 10:18:57', 0, 1, NULL, 5, 0, 'rjayne@aerialwireless.com', 'Empire1234', 0, ''),
(176, 'Michael', NULL, 'Prior', '7743140370', 'mprior@prioritypcs.com', '2e632ca6f4605564608af3768c342d875dafdb61', NULL, '2020-01-29 12:37:14', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(177, 'Danny', NULL, 'Camara', '5089654010', 'dcamara@empiretelecomm.com', '40f37b956de5f3c33869b0cab3403e41de9bca4b', NULL, '2020-01-29 12:42:53', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(178, 'Alexandr', NULL, 'Pikin', '2159006897', 'alexpikin@alpikeinc.com', 'c61e4f9d0f3d87f0e10aefd36afb13f3e28dd46b', NULL, '2020-01-29 17:18:15', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(180, 'Vladimir', NULL, 'Zakharav ', '9294894453', 'vovaz@sluniversal.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-01-29 19:38:37', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(181, 'Mirislam', NULL, 'Mirkhamutov ', '9294441555', 'Mirkhamutov.m@gmail.com', 'bb63b938563a459607599616c437b39638a466fe', NULL, '2020-01-31 07:05:53', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(182, 'Bryon', '', 'Blue', '3528167168', 'bryonblue90@gmail.com', 'ebb5f819eb02e2467caa1b4b972b3fd03e7706c9', NULL, '2020-01-31 08:27:55', 0, 1, NULL, 0, 0, '', '', 0, ''),
(183, 'Dale', NULL, 'Thoma', '9739032670', 'dale.thoma@yahoo.com', '9d938d98103caacc204fe15d2814a61c89630664', NULL, '2020-01-31 12:41:10', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(184, 'Jason', NULL, 'Yannacci', '5517955068', 'jason.yannacci@eastalliance.com', '5f23ce12f36e141696a05dec89e852bbf68f9bbb', NULL, '2020-01-31 13:20:59', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(185, 'Anatoly', NULL, 'Soldatov', '6097701020', 'tony@tsntgroup.com', '9d938d98103caacc204fe15d2814a61c89630664', NULL, '2020-01-31 14:07:16', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(186, 'Volodymyr', NULL, 'Zelenyuk', '9293551655', 'zelenyuk.v@invertice.net', '54ebe5e1820a695918ff8a67ca7a4c4d721a87f8', NULL, '2020-01-31 14:10:53', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(187, 'Devyn', NULL, 'Thoma', '9739032803', 'devynthoma@gmail.com', '72dbf7f7d4f5f813501dc810595606d926d73bf3', NULL, '2020-01-31 15:25:13', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(188, 'Andrii', '', 'Shepeta ', '8659646349', 'a.shepeta@mkncomm.com', '27dd2fe27e66c889b7a513e368e53387dddfbaf0', NULL, '2020-01-31 16:09:24', 0, 1, NULL, 5, 0, '', '', 0, ''),
(189, 'Roger', NULL, 'Vasquez', '2016002278', 'rvasqueztnt@yahoo.com', 'ebb5f819eb02e2467caa1b4b972b3fd03e7706c9', NULL, '2020-02-02 16:28:10', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(191, 'Aleh', NULL, 'Maliarenko', '2672717447', 'Maliarenko.olek@yandex.ru', 'f73e0d39398053999e309d102d7d3fa92564cec0', NULL, '2020-02-02 19:23:52', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(192, 'Javier', NULL, 'Gonzalez', '2016611780', 'Javier.Gonzalez@EastAlliance.com', '9d938d98103caacc204fe15d2814a61c89630664', NULL, '2020-02-03 07:29:36', 0, 1, NULL, 5, 0, NULL, NULL, 1, '5653'),
(194, 'Paul', '', 'Famolaro', '3152439320', 'pfamolaro@qualtekwireless.com', 'ca6465db4fbd448bffe928613cf0e463980accf8', NULL, '2020-02-03 11:25:27', 0, 1, NULL, 5, 0, '', '', 0, ''),
(195, 'Sean', '', 'Williams', '3152006458', 'S.t.williams.7326@gmail.com', 'aee573952243e019ca78d7c9725867a43c57654d', NULL, '2020-02-03 11:37:27', 0, 1, NULL, 5, 0, 'S.t.williams.7326@gmail.com', 'Empire1234', 0, ''),
(196, 'geddy', '', 'kohler', '7742196041', 'gkohler@aerussolutions.com', '946c4c59e388ee409848d799357154e77170054e', NULL, '2020-02-03 12:43:42', 0, 1, NULL, 5, 0, 'gkohler@aerussolutions.com', 'Empire12345', 0, ''),
(197, 'George', NULL, 'Smith', '3159490244', 'gsmith@cell-techservices.com', '1b0be713776a82c590b58588e2e28b164aeae4ad', NULL, '2020-02-03 17:22:38', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(198, 'ALEX', '', '', '7185768354', 'maliarenko.olek@gmail.com', '0af7cea2eb70693c31f5d747f9b5df423a44765d', NULL, '2020-02-03 17:44:18', 0, 1, NULL, 5, 0, 'maliarenko.olek@gmail.com', 'GC123', 0, ''),
(199, 'Marlo', NULL, 'Cunha', '9788159186', 'marlo_cunha@jandlcable.com', '7452c8c9a4887dc9c9ef61003f935fa8403ed283', NULL, '2020-02-04 06:49:48', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(200, 'Eduardo', NULL, 'Moran', '7187302621', 'moranronald98@gmail.com', '4be30d9814c6d4e9800e0d2ea9ec9fb00efa887b', NULL, '2020-02-04 07:56:21', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(201, 'Jason', NULL, 'chafe', '5087458923', 'Jchafe@aerialwireless.com', '45f7377f75cdbf3e5c951edd644ae73b5e2ad8b6', NULL, '2020-02-04 10:01:29', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(202, 'Justin', NULL, 'Cotton', '7813612581', 'jcotton@aerialwireless.com', '3f1d8b28ea531bfb08ecc92c1134058037098839', NULL, '2020-02-04 10:02:01', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(203, 'Chris', NULL, 'Benson', '4014655733', 'cbenson@empiretelecomm.com', '5e59b1cfd445b2b4a48247c96e879300df0b76d1', NULL, '2020-02-04 11:03:35', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(204, 'Sean', NULL, 'Lenane', '7745392413', 'slenane@ariealwireless.com', '55b33c6141f67e1b302fe99e88fbd1156fc66843', NULL, '2020-02-04 11:19:38', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(205, 'Sean', NULL, 'Lenane', '7745392413', 'slenane@aerialwireless.com', '55b33c6141f67e1b302fe99e88fbd1156fc66843', NULL, '2020-02-04 11:27:20', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(206, 'Test', '', 'Test', '2066028444', 'gerardo@integertel.com.uk', '899a7e0e6022a6c3412bdfaf43de5ffabafc876d', NULL, '2020-02-04 13:05:09', 0, 1, NULL, 5, 0, '', '', 0, ''),
(207, 'Stephen', NULL, 'Esar', '3479444976', 'stephenesar123@gmail.com', '00079f9a53334c5ac3cebb991539f812accb6143', NULL, '2020-02-04 14:20:09', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(208, 'Joseph', NULL, 'Williams', '3159490186', 'jwilliams@cell-techservices.com', 'b0ed3f4b8684c0fea734f513bd39b1d877f40b2f', NULL, '2020-02-04 16:02:50', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(210, 'timothy', NULL, 'hull', '3153138126', 'thull@cell-techservices.com', '298e313e9d68e960fb9957c52a2f32f0050b4632', NULL, '2020-02-04 18:31:21', 0, 1, NULL, 5, 0, NULL, NULL, 1, '5686'),
(211, 'Aleksandr', NULL, 'Loskutnikov', '8654384919', 'a.loskutnikov@mkncomm.com', '2223e33027b95a5f3081a16ab5c2bac2965cef69', NULL, '2020-02-04 19:09:37', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(212, 'Anatol', NULL, 'Miadzvedzeu ', '2676159172', 'a.medvedev@mkncomm.com', '0db2429e0cf8158cae140019f1a3f3c3e29be697', NULL, '2020-02-04 19:12:39', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(213, 'Brian', NULL, 'Helm', '3154204349', 'bhelm@cell-techservices.com', 'e33eded75de73ce9b349db1fb69b73ebe926b5f5', NULL, '2020-02-05 08:33:35', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(214, 'Kyle', NULL, 'Presbrey', '3399879514', 'kpresbrey@empiretelecomm.com', 'c8b8a4d037e1ff05dcc08255e69ab0fdf93e5eb6', NULL, '2020-02-05 12:37:52', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(216, 'Scott', NULL, 'Brigham ', '9784087878', 'sbrigham@empiretelecomm.com', '8fd9100ee8e5a76683320f6aad981223ae3f75d4', NULL, '2020-02-05 18:50:21', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(217, 'Anton', NULL, 'Hilimovich', '2673344368', 'hilimovich.a@invertice.net', '1011051e18893da1b78420ecc75e02d7811d30b1', NULL, '2020-02-06 08:04:37', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(218, 'Jason', NULL, 'Pickett', '3216070223', 'thanatoscross1988@gmail.com', '2e6339f5de3f507270006da8db747916b422a6f4', NULL, '2020-02-06 09:20:09', 1, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(219, 'Viktor', '', 'Pilgun', '7185011819', 'pilgun.v@invertice.net', 'a3dc274af28cba188108cd5cb664c1c401406e66', NULL, '2020-02-06 10:19:45', 0, 1, NULL, 5, 0, 'gc1234', 'gc1234', 0, ''),
(220, 'Ronald', NULL, 'Hanner', '1315281775', 'ronhan2327@gmail.com', '50192fcf763a601f672d249a56062f2babb8a136', NULL, '2020-02-06 12:37:35', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(221, 'jason', NULL, 'blinkhorn', '4017876007', 'jblinkhorn@empiretelecomm.com', '04d9490cdc9c40c0db51da94ce5dab28e9e6b111', NULL, '2020-02-06 16:20:50', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(222, 'Felix', NULL, 'Lorry ', '7188666796', 'nicklorry056@gmail.com', '00ddc6002990067b9eba197ec5b8fac56eaed4db', NULL, '2020-02-06 20:56:52', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(223, 'Merdan', NULL, 'Moshakov', '6465994424', 'Merdan.M@invertice.net', '06e4981b297c68c6ed80fc020699a8475b817914', NULL, '2020-02-07 12:06:05', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(224, 'Viktor', NULL, 'Pilgun', '7185011819', 'pilgun.v@invertice.net', 'ce8da5b391b8ebfdba112c0735068d89ae060e07', NULL, '2020-02-08 08:53:09', 1, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(225, 'Mikhail', NULL, 'Kuznets', '2674028921', 'mikhail.kuznets@mkncomm.com', '219a884dc3f8fbe2192b5345a56b9279e2790bd9', NULL, '2020-02-09 09:18:55', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(226, 'Raymond', NULL, 'Wilson', '4135232527', 'rwilson@aerussolutions.com', '9d938d98103caacc204fe15d2814a61c89630664', NULL, '2020-02-10 09:56:39', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(227, 'Richard', NULL, 'Gallagher', '8622872102', 'rgallagher512@gmail.com', 'b44dda1dadd351948fcace1856ed97366e679239', NULL, '2020-02-10 10:53:41', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(228, 'Josh', '', 'DeAngelis', '4016517262', 'jdeangelis@empiretelecomm.com', '6147f470f0048419c168822fc0e15f3ddad67653', NULL, '2020-02-10 11:35:56', 0, 1, NULL, 0, 0, '', '', 0, ''),
(229, 'Shawn', '', 'Polen', '8023181676', 'spolen@empiretelecomm.com', '20d24dd07c42e2e4fc3b3f6bf9454b324fd478f3', NULL, '2020-02-10 11:37:00', 0, 1, NULL, 0, 0, '', '', 0, ''),
(230, 'Hassan', '', 'Moutawakeel', '7706090418', 'hmoutawakeel@empiretelecomm.com', 'bbefc1233b652eae6cb230a934f946b6a8f1a403', NULL, '2020-02-10 11:37:53', 0, 1, NULL, 0, 0, '', '', 0, ''),
(231, 'Red', '', 'Tadjer', '9876252949', 'rtadjer@empiretelecomm.com', 'b754777ebc5911dada7bfcfc377c14c851538569', NULL, '2020-02-10 11:38:46', 0, 1, NULL, 0, 0, '', '', 0, ''),
(232, 'Amr', '', 'Abdelhafez', '7815528611', 'aabdelhafez@empiretelecomm.com', 'ebb5f819eb02e2467caa1b4b972b3fd03e7706c9', NULL, '2020-02-10 11:39:29', 0, 1, NULL, 0, 0, '', '', 0, ''),
(233, 'Kontyantyn', '', 'Kozubenko', '3153175356', 'kkozubenko@empiretelecomm.com', 'ebb5f819eb02e2467caa1b4b972b3fd03e7706c9', NULL, '2020-02-10 13:13:25', 0, 1, NULL, 0, 0, '', '', 0, ''),
(234, 'Shiva Kumar Reddy', '', 'Burri', '6207047888', 'shiva@integertel.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-02-10 19:14:52', 0, 0, NULL, 0, 0, 'shiva@integertel.com', 'Empire1234', 0, ''),
(235, 'Anil Kumar', '', 'Vaddi', '9727526352', 'anil@integertel.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-02-10 19:16:54', 0, 0, NULL, 5, 0, 'anil@integertel.com', 'Empire1234', 0, ''),
(236, 'Danny', NULL, 'Mabie', '9089076891', 'dmabie@empiretelecomm.com', '73d355a39a7d3d5d0271f2f294446be68a679aab', NULL, '2020-02-11 08:23:17', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(237, 'Pat', '', 'Wilcox', '0000000000', 'pwilcox@aerialwireless.com', 'ebb5f819eb02e2467caa1b4b972b3fd03e7706c9', NULL, '2020-02-11 10:32:02', 0, 1, NULL, 5, 0, '', '', 0, ''),
(238, 'Sergei', NULL, 'Ukolov ', '2408058638', 'sergey.u@invertice.net', '6367c48dd193d56ea7b0baad25b19455e529f5ee', NULL, '2020-02-11 14:33:07', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(239, 'Donnie', '', 'Brown', '2073555380', 'dbrown@empiretelecomm.com', '6367c48dd193d56ea7b0baad25b19455e529f5ee', NULL, '2020-02-12 08:07:51', 0, 1, NULL, 5, 0, '', '', 0, ''),
(240, 'Stephen', NULL, 'Goodwin', '2075705353', 'sgoodwin@aerialwireless.com', 'b05a91e77e5f9103cad6359834353fd1337ef568', NULL, '2020-02-12 08:16:45', 1, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(241, 'Ronny', NULL, 'Caceres', '7185987759', 'ronny@futuracomllc.com', '1237dc996f7c435b7568e5cbc89a57213d06d398', NULL, '2020-02-13 15:17:17', 0, 1, NULL, 5, 0, NULL, NULL, 1, '5121'),
(242, 'David', NULL, 'Taveras', '2013594916', 'david.taveras@ramapocom.com', 'a437125b9243d527a4fe4dfb56b186000e80a939', NULL, '2020-02-14 09:38:07', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(243, 'Andrey Kalyakin', 'andrey', 'Kalyakin', '8654545100', 'a.kalyakin@mkncomm.com', '9d938d98103caacc204fe15d2814a61c89630664', NULL, '2020-02-16 09:41:44', 0, 1, NULL, 5, 0, 'a.kalyakin@mkncomm.com', 'ABC123', 0, ''),
(244, 'Thomas', NULL, 'Gregory', '7746443440', 'thomasg@abrielltech.com', '00f1a38cf8e9577ef7f0224e2b9110bb7debca46', NULL, '2020-02-17 06:26:50', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(245, 'Martin', NULL, 'Popkov', '9415872162', 'Martin@sluniversal.com', 'a21e010ecc178de21aa00f13a66c7899909428b2', NULL, '2020-02-17 08:41:16', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(246, 'Ivan', NULL, 'Audzei', '2154857999', 'avmisha01062015@gmail.com', '3dceabfc70985914e6395dfaa5c49262be5e7f79', NULL, '2020-02-17 10:47:32', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(247, 'Alex', NULL, 'Sidorenko', '3047670195', 'sidorenko_al@yahoo.com', '9d9544415782f0023f9cb6ead72c7c6882ac8562', NULL, '2020-02-17 10:49:00', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(249, 'Marlo', NULL, 'Cunha', '9788159186', 'marlo_cunha@jandlcomm.com', '7452c8c9a4887dc9c9ef61003f935fa8403ed283', NULL, '2020-02-17 18:20:56', 1, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(250, 'Bryon', 'Nolan', 'Blue', '3528167168', 'bryon@integertel.com', '0c91db9a69ea5c8f55a30602fd2004e168d3036e', NULL, '2020-02-18 10:41:00', 0, 1, NULL, 5, 0, 'bryon@integertel.com', '1981chevy', 0, ''),
(251, 'Daniel', NULL, 'Hatab', '2018703213', 'daniel.hatab@ramapocom.com', 'a437125b9243d527a4fe4dfb56b186000e80a939', NULL, '2020-02-18 11:24:35', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(252, 'Eugene', NULL, 'Nizhegorodov', '9293328411', 'zhegorodov@gmail.com', 'f09e029e49e0269a383b73e76c35105486d583bb', NULL, '2020-02-18 12:02:35', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(253, 'Raul', '', 'Maldonado', '5086136503', 'rmaldonado@aerialwireless.com', '9d938d98103caacc204fe15d2814a61c89630664', NULL, '2020-02-18 12:41:06', 0, 1, NULL, 5, 0, 'rmaldonado@aerialwireless.com', 'gc123', 0, ''),
(254, 'Shane', '', 'Eddy', '2076102144', 'seddy@qualtekwireless.com', 'e082ac0951c07a6f177c9990202cfe7b207c73b4', NULL, '2020-02-18 12:45:26', 0, 1, NULL, 5, 0, '', '', 0, ''),
(255, 'Aleh', NULL, 'Semechka', '8457724228', 'als@sluniversal.com', '9d938d98103caacc204fe15d2814a61c89630664', NULL, '2020-02-18 16:24:51', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(256, 'John', NULL, 'Byron', '2079244347', 'john_byron@jandlcomm.com', '9d938d98103caacc204fe15d2814a61c89630664', NULL, '2020-02-18 16:29:02', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(259, 'Anton', NULL, 'Yemelyanau', '8653328550', 'a.yemelyanau@mkncomm.com', '8d8e0faa17f7c1fd6f3a16a580c9116d12b9f102', NULL, '2020-02-19 09:26:19', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(260, 'Andrew', NULL, 'Trudeau', '7748362164', 'andrewmtrudeau@aerialwireless.com', '9d938d98103caacc204fe15d2814a61c89630664', NULL, '2020-02-20 08:11:14', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(261, 'Trevor', NULL, 'Green', '4013020850', 'Tgreen@aerialwireless.com', '473ec371df95d979ac0ccc37de8e5ba085ab3b85', NULL, '2020-02-20 08:13:51', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(262, 'Timothy', '', 'Binley', '9783379972', 'TBinley@EmpireTelecomm.com', '9d938d98103caacc204fe15d2814a61c89630664', NULL, '2020-02-20 13:23:31', 0, 1, NULL, 5, 0, 'TBinley@EmpireTelecomm.com', 'gc123', 0, ''),
(263, 'PAVEL', NULL, 'PANASEVCIH', '6093214177', 'pavel.p@blacktowergroup.net', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-02-21 11:41:40', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(264, 'Ivan', NULL, 'Morozov', '2679885014', 'ivanm@sluniversal.com', 'bccd80e5fa2818c52d6ff7eafdc164d2303084cd', NULL, '2020-02-23 18:07:56', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(265, 'Ihar', NULL, 'Khalko', '2672507866', 'ihar.k@blacktowergroup.net', 'a4991743b3641cce1e150d938ba6a9d38a4d92b8', NULL, '2020-02-24 20:40:28', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(266, 'Jesus', NULL, 'Tate', '4042173267', 'jesustate100@gmail.com', '7a0386cf60fb985c54fc741925d3cf6d1e287757', NULL, '2020-02-25 07:27:14', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(267, 'Kevon', NULL, 'Solomon', '4076922038', 'kevon3215@gmail.com', 'e52282dcdbdcd5108e109ddd046d0783154758ea', NULL, '2020-02-25 09:19:11', 1, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(268, 'Danny', '', 'Angamarca', '6464273128', 'Danny199796@live.com', '9d938d98103caacc204fe15d2814a61c89630664', NULL, '2020-02-25 09:49:33', 0, 1, NULL, 5, 0, 'Danny199796@live.com', 'gc123', 0, ''),
(269, 'Jesus', NULL, 'Tate', '4042173267', 'jtate@aerialwireless.com', '60dabffc95fd1993aa4270e25de1558fca567c80', NULL, '2020-02-25 11:29:47', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(271, 'Daniel', NULL, 'Mabie', '', 'dmabie@aerialwireless.com', '73d355a39a7d3d5d0271f2f294446be68a679aab', NULL, '2020-02-25 12:07:37', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(273, 'Timothy', NULL, 'Carey', '7742801606', 'tcarey@aerussolutions.com', '9d938d98103caacc204fe15d2814a61c89630664', NULL, '2020-02-26 12:29:55', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(274, 'Anton', '', 'hovar', '2159332418', 'tony.h@blacktowergroup.net', '9d938d98103caacc204fe15d2814a61c89630664', NULL, '2020-02-29 14:12:23', 0, 1, NULL, 5, 0, 'tony.h@blacktowergroup.net', 'gc123', 0, ''),
(275, 'Wyatt', '', 'Dutch ', '3152470351', 'wdutch@empiretelecomm.com', '849e713afe2a9d2c104e5510d9b6ea1305040e45', NULL, '2020-03-02 12:50:32', 0, 1, NULL, 5, 0, 'wdutch@empiretelecomm.com', 'gc123', 0, ''),
(276, 'Rambarrat', '', 'Satyanarine ', '9174426570', 'Ryanrambarrat@gmail.com', '9d938d98103caacc204fe15d2814a61c89630664', NULL, '2020-03-03 13:13:25', 0, 0, NULL, 5, 0, 'Ryanrambarrat@gmail.com ', 'gc123', 0, ''),
(277, 'ROGELIO', NULL, 'SANZ', '5548003066', 'rogelio@integertel.com', 'e1f2cd8c11c2c79be072036ec1faa3c54f62440f', NULL, '2020-03-03 15:12:34', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(278, 'Luis', NULL, 'Lara', '6017508310', 'luis@integertel.com', '13d6946295a925317e8c85a3a16350306610efb2', NULL, '2020-03-03 15:13:49', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(279, 'Steven', '', 'gillette', '6073737180', 'steven.gillette@pro-tel.com', '9d938d98103caacc204fe15d2814a61c89630664', NULL, '2020-03-04 08:16:55', 0, 1, NULL, 5, 0, 'steven.gillette@pro-tel.com', 'gc123', 0, ''),
(280, 'Nick', '', 'Cornescu', '2679382154', 'nicolae@sluniversal.com', '9d938d98103caacc204fe15d2814a61c89630664', NULL, '2020-03-04 16:47:19', 0, 0, NULL, 5, 0, 'nicolae@sluniversal.com', 'gc123', 0, ''),
(281, 'Gor', NULL, 'Khachatryan', '9294812071', 'khachatryan.g@invertice.net', '9d938d98103caacc204fe15d2814a61c89630664', NULL, '2020-03-05 08:11:57', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(282, 'Jesús', NULL, 'Reyes', '9148153563', 'jreyes@jnl.com', 'd62d143830c7e838bc34ba6d42fd49c5eabe738b', NULL, '2020-03-06 08:26:58', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(283, 'Jesus', NULL, 'Reyes ', '9148153563', 'jreyes@jnlrf.com', 'a3dc274af28cba188108cd5cb664c1c401406e66', NULL, '2020-03-06 08:38:11', 0, 1, NULL, 5, 0, NULL, NULL, 1, '9275'),
(284, 'Mikita', '', 'Kuryla', '4133264965', 'mikita.k@blacktowergroup.net', 'd1c46b044c0e01a7d03d6a8cd6537e89bda28eb5', NULL, '2020-03-06 13:07:25', 0, 1, NULL, 5, 0, 'mikita.k@blacktowergroup.net', 'gc1234', 0, ''),
(285, 'Graham', NULL, 'O’Dowd', '5088680240', 'godowd@atlasinnovativeservices.com', 'ff7b3a3f8cd3b96cecdd0d5928efe75f5eb36e80', NULL, '2020-03-09 10:03:05', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(286, 'Justin', NULL, 'Archambault ', '6039521489', 'jarchambault@saigrp.com', '1e6dcca70f5a066a10a1a2dcb37ecd211ecd11ac', NULL, '2020-03-09 10:32:10', 1, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(287, 'Joseph', NULL, 'Santos', '1603952110', 'jsantos@saigrp.com', 'ed941932cce41b9d489c19296e27b1b091c67317', NULL, '2020-03-09 11:23:47', 1, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(288, 'Mark', NULL, 'Ludwig', '7818441691', 'mludwig@atlasinnovativeservices.com', '522c6b8c62f2a379c654c78a6c385a0db4cd5d05', NULL, '2020-03-09 12:06:49', 1, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(289, 'Mitchell', NULL, 'Van Ormer', '3155206326', 'mitchell.vanormer@pro-tel.com', '4ebaec77808861fc4897601da6763b72841f0d68', NULL, '2020-03-09 12:53:57', 1, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(290, 'Adam', NULL, 'Alexander', '5085669167', 'aalexander@saigrp.com', 'd089b196a7059958e12263f7396001721fc10c28', NULL, '2020-03-09 20:31:57', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(291, 'Valentin', '', 'Fursa', '6094084868', 'val.f@rullex.net', '9d938d98103caacc204fe15d2814a61c89630664', NULL, '2020-03-10 10:27:42', 0, 1, NULL, 5, 0, 'val.f@rullex.net', 'gc123', 0, ''),
(292, 'Zackary', '', 'Shipley', '5086136515', 'zshipley@empiretelecomm.com', 'e3fefc61584e024a28ff648cf3d9175fa942553a', NULL, '2020-03-10 16:30:58', 0, 1, NULL, 5, 0, '', '', 0, ''),
(293, 'Andrei', NULL, 'Yekimtsou ', '6094350702', 'Andreiy@sluniversal.com', 'a0f92a5946b19c198cd6c11df8027f7adaee233d', NULL, '2020-03-11 20:43:28', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(294, 'James', '', 'Roderick', '4017677051', 'Jroderick@aerialwireless.com', 'a3dc274af28cba188108cd5cb664c1c401406e66', NULL, '2020-03-12 11:42:35', 0, 1, NULL, 5, 0, 'Jroderick@aerialwireless.com', 'gc1234', 0, ''),
(295, 'Artur', NULL, 'Kapaj', '2015434359', 'artur.kapaj@eastalliance.com', '12b09994bd35cc1a6bd86f3e83b9fb6e03c375bc', NULL, '2020-03-16 10:59:36', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(296, 'Matt', NULL, 'Jackowitz', '2015434352', 'Matt.Jackowitz@EastAlliance.com', '26e8e3d3a68a48f98a9cf89431a748dab33cf9e4', NULL, '2020-03-16 15:02:40', 1, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(297, 'Maximo', NULL, 'Cabrera', '2019687594', 'maximo.cabrera@eastalliance.com', '9d938d98103caacc204fe15d2814a61c89630664', NULL, '2020-03-16 15:47:22', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(299, 'Artem', NULL, 'Sannikov', '7815134050', 'sannikov.a@invertice.net', '61c9f69f81577602bb0c284fdaddd80d26a9ef49', NULL, '2020-03-18 09:33:55', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(300, 'Philip', NULL, 'Moloney', '9178214500', 'pmoloney@8gwirelessinc.com', 'a832a2570f7284ceb6ee3da0bfbc4f5c7f7d64a3', NULL, '2020-03-18 10:48:45', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(301, 'Matt', NULL, 'Frazier', '6033154714', 'matt_frazier@jandlcable.com', '6ba690aa8f2ecdb3d82778d70d3f7482e1d52e1e', NULL, '2020-03-19 13:43:02', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(302, 'Artsiom', NULL, 'Chykunou ', '2154212909', 'ottemy@yahoo.com', 'bb4f72316b24dcc436e86d1406493351dd4ea8f6', NULL, '2020-03-19 16:31:23', 0, 1, NULL, 5, 0, NULL, NULL, 1, '5495'),
(303, 'Oleksandr', NULL, 'Lapshyn', '3143797186', 'olapshyn@mpegcommunications.com', '9363fd724586537411ffebeee2ce6e1708e29b7b', NULL, '2020-03-21 08:21:29', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(304, 'Dmitry', NULL, 'Shchulepov', '8653897562', 'dmitry.s@invertice.net', '4cd3677e5f005658864de9f78234e8eb31b1013b', NULL, '2020-03-23 11:13:46', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(305, 'Matthew', NULL, 'Roy', '7742914237', 'mroy@empiretelecomm.com', '5746831e85934d553ed436d4810ac51cd1d59340', NULL, '2020-03-25 10:54:20', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(306, 'Andrei', NULL, 'Dzezhyts', '2159195315', 'andrei.d@blacktowergroup.net', '65a22754d1c20b1c0c806e0123628b307c3d19d1', NULL, '2020-03-25 12:36:42', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(308, 'Oleg', NULL, 'Mandzyuk', '4045428270', 'o.mandzyuk@mkncomm.com', '4761d12509634da25553101a3d75cf6e971a2bd9', NULL, '2020-03-30 11:04:40', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(309, 'Ilya', NULL, 'Kumets', '2679097700', 'ilya.k@blacktowergroup.net', '1e05ff534169954574eddc1d679523726b0a3ed9', NULL, '2020-03-30 15:15:52', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(310, 'Michael', NULL, 'Langlais', '4132812203', 'mlanglais@aerussolutions.com', '9623d3f13742cc319b2bf3e0bfa4d0f1be2108d7', NULL, '2020-03-31 11:53:22', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(311, 'Vadim', NULL, 'Masiukevich', '1267347037', 'vadim.m@blacktowergroup.net', '352b1f524de76992250302452515dcb3a1280c25', NULL, '2020-04-01 11:33:28', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(312, 'Andrei', NULL, 'Kazachonak', '2674010932', 'andrei.kazachenak@sluniversal.com', '6f7390ae8188be1b3dd2ee255498398d327265cc', NULL, '2020-04-01 13:34:03', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(313, 'Kofi', '', 'Andoh', '8455532094', 'Kandoh@empiretelecomm.com', '1594e838bbe83825a37c59ee4e68e8190eba3473', NULL, '2020-04-02 14:33:41', 0, 0, NULL, 5, 0, 'Kandoh@empiretelecomm.com', 'gc123', 0, ''),
(314, 'Oliver', NULL, 'Rojas', '1849271162', 'oliver@oz.com', 'f918ee4b5a77d65ef37d68e17799010aef4392d7', NULL, '2020-04-03 17:22:26', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(315, 'Nikita', NULL, 'Losenko', '8657650668', 'nl.invertice@gmail.com', '996e286ce2a8d2f6be1bd105ab4bb6e3a82e2100', NULL, '2020-04-04 20:02:25', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(317, 'Steve', NULL, 'Ielfield', '3154869768', 'ielfieldsteve@gmail.com', 'cce7119e5ec3d408d9bc4b551bb4a43cf5dbd05d', NULL, '2020-04-09 08:55:49', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(318, 'Matthew', NULL, 'Lajuett', '3157172366', 'Mlajuett@bluewavecomm.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-04-09 08:57:50', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(319, 'Delmar', NULL, 'Slate', '3154050196', 'delmarslate00@gmail.com', '3fa8ff5c4fb0f85d343a5da9a0a7eb9b928b141b', NULL, '2020-04-09 08:59:42', 1, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(320, 'Kile', '', 'Metott', '3159356269', 'kilem@bluewavecomm.com', '4a96a4ff9fb86c5aaf3f80807c4de321cdc14594', NULL, '2020-04-09 09:01:31', 0, 1, NULL, 5, 0, 'kilem@bluewavecomm.com', '', 0, ''),
(321, 'Michael', NULL, 'Shea', '3154846453', 'Mike@bluewavecomm.com', '82b6e54938850b37bab50dd9d2d57fb88531544c', NULL, '2020-04-09 09:02:48', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(322, 'Corey', NULL, 'Green', '3153141101', 'cgreen@bluewavecomm.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-04-09 09:04:37', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(323, 'Hamit', '', 'show', '2672507682', 'hamits@sluniversal.com', 'd5898478894a7dab6d3924ac65f0385864756029', NULL, '2020-04-09 09:37:25', 0, 1, NULL, 5, 0, 'hamits@sluniversal.com', 'gc123', 0, ''),
(324, 'John', NULL, 'Holohan', '6077314595', 'John@bluewavecomm.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-04-10 16:21:40', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(325, 'Charles', NULL, 'Thomas ', '6194199531', 'pepbrim71@gmail.com', 'd1bc5dd29e9fbf6602eb3b9d7be931f1f41432f3', NULL, '2020-04-11 11:44:55', 1, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(326, 'Mario', NULL, 'Wills', '8102800121', 'willsmario@gmail.com', 'cc6cc252423271132a68b3f6e50d90f4100e88a0', NULL, '2020-04-11 11:53:50', 1, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(328, 'Shodmon', '', 'Zaripov', '3478613052', 'sean@sluniversal.com', '81e7454862e22b46c4555ffbd74c647d68178da7', NULL, '2020-04-13 15:23:41', 0, 1, NULL, 5, 0, '', '', 0, ''),
(329, 'Keith', NULL, 'Artz', '3154204172', 'kartz@empiretelecomm.com', 'e71a1d05da09ccd4319a4b4bb994f4db8f45932d', NULL, '2020-04-13 18:09:00', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(330, 'Joshua', NULL, 'Wallace ', '4015331938', 'Jwallace@empiretelecomm.com', '1a6204ff341292865f966ec1bd36faa43747acbf', NULL, '2020-04-16 06:47:14', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(331, 'Eric', NULL, 'Peckham', '4014738630', 'epeckham@empiretelecomm.com', '70ccd9007338d6d81dd3b6271621b9cf9a97ea00', NULL, '2020-04-16 09:34:36', 1, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(332, 'Rick', NULL, 'Stanley', '4013307779', 'rstanley@empiretelecomm.com', '60cdf518f7c7235a54216792cb218e17cd4da02e', NULL, '2020-04-17 10:06:38', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(333, 'Artur', NULL, 'Tahil', '2674956300', 'artur.t@rullex.net', '8ac7b090527c4f03161e38d8f44ea93697371a13', NULL, '2020-04-17 10:25:23', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(335, 'Aliaksandr', NULL, 'Kapninski', '2674721743', 'aliaksandr.k@rullex.net', '8ac7b090527c4f03161e38d8f44ea93697371a13', NULL, '2020-04-17 11:55:06', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(336, 'Maksim', NULL, 'Surovich', '9292384671', 'maksim.s@rullex.net', '231bc03623c53492a89ceb7d28c5b4e8035e7f4c', NULL, '2020-04-17 22:47:46', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(337, 'Konstantin', NULL, 'Snytko', '1929430714', 'konstantin.s@rullex.net', '3b6d05e05943c60db15e63ce606f0d2d8a89c660', NULL, '2020-04-18 14:30:40', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(338, 'Bobby', NULL, 'Cataldo ', '6174386623', 'rcataldo@heidrea.com', '4897706a8ec40260e1926b4b60ffa1203209404f', NULL, '2020-04-20 10:35:11', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(339, 'Sean', NULL, 'Nicolosi', '3159414420', 'sean.nicolosi@pro-tel.com', 'ee7f567101d32e85fc88bbbb25af2806f3418b2d', NULL, '2020-04-20 18:58:53', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(340, 'Matthew', NULL, 'Cranford', '7744734277', 'mcranford@empiretelecomm.com', '19c560dbcea0041ecfb2c8511c1e3bc2182a3476', NULL, '2020-04-21 08:23:11', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(341, 'Marc', '', 'Champagne', '9786046894', 'mchampagne@empiretelecomm.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-04-21 11:59:01', 0, 1, NULL, 5, 0, 'mchampagne@empiretelecomm.com', 'Empire1234', 0, ''),
(343, 'Oscar', '', 'Pichado', '6462263084', 'calin0930@gmail.com', '075b4ae8a1feaf7eefd5efd22a8fcd99213f896e', NULL, '2020-04-23 09:23:00', 0, 1, NULL, 5, 0, 'calin0930@gmail.com', 'gc123', 0, ''),
(344, 'David', '', 'cosgrave', '3154169388', 'dcosgrave@cell-techservices.com', '1fa3657b6601d451f50ed43ab47dbff370b0631c', NULL, '2020-04-23 11:26:36', 0, 1, NULL, 5, 0, 'dcosgrave@cell-techservices.com', 'gc123', 0, ''),
(345, 'Daniil', NULL, 'Sokolov', '2156170866', 'daniil.s@blacktowergroup.net', '603069136fb6156843b4312921c2ffcc47b7d563', NULL, '2020-04-23 17:39:47', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(346, 'Konstantin', NULL, 'Churakov', '2672059954', 'konstantinc@sluniversal.com', '7d1da119079cbd82b0e78a89f4fda353aa399c41', NULL, '2020-04-24 12:41:51', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(347, 'Dzmitry', NULL, 'Shkliannik ', '2675927107', 'dzmitry.s@invertice.net', '8794f5fdd5a6591ee633d7952aaf1ce598765d69', NULL, '2020-04-24 15:38:45', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(348, 'Vitali', NULL, 'Matsyburski', '2154213355', 'matsyburski.v@invertice.net', 'de13550e1131bcea1a9cfd4e206b901ae0555e15', NULL, '2020-04-25 10:17:46', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(349, 'Viktar', NULL, 'Charniak', '2153596494', 'viktar.ch@rullex.net', '2bff7803d26081d19f9cfec548fc7a74a5670531', NULL, '2020-04-25 16:44:59', 1, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(350, 'David', NULL, 'Trudgen', '8623542880', 'dtrudgen@tbttelecomm.com', '27eb59f6c86e49837f67540b22db156d1352edde', NULL, '2020-04-27 11:42:14', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(351, 'Joe', '', 'Williams', '3158824042', 'jlw3200@gmail.com', '9d938d98103caacc204fe15d2814a61c89630664', NULL, '2020-04-28 16:56:23', 0, 1, NULL, 5, 0, 'jlw3200@gmail.com', 'gc123', 0, ''),
(352, 'Paul', '', 'Fenyuk', '2156880561', 'paul@tsntgroup.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-04-29 12:12:08', 0, 1, NULL, 5, 0, 'paul@tsntgroup.com', 'Empire1234', 0, ''),
(353, 'Denis', '', 'Polushkin ', '2157915086', 'denis@sluniversal.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-05-01 09:10:43', 0, 1, NULL, 5, 0, 'denis@sluniversal.com', 'Empire1234', 0, ''),
(354, 'william', '', 'Harris', '3525535032', 'wharris@cell-techservices.com', '9d938d98103caacc204fe15d2814a61c89630664', NULL, '2020-05-01 10:06:24', 0, 1, NULL, 5, 0, 'wharris@cell-techservices.com', 'gc123', 0, ''),
(355, 'Bertha', NULL, 'Sucuzhañay', '7183864968', 'betisucu77@gmail.com', 'a437125b9243d527a4fe4dfb56b186000e80a939', NULL, '2020-05-04 09:42:55', 1, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(357, 'Bertha', NULL, 'sucuzhanay', '7183864968', 'bertha.s@globaltelecomc.net', 'a437125b9243d527a4fe4dfb56b186000e80a939', NULL, '2020-05-04 09:57:24', 1, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(358, 'Shohruh', NULL, 'Umarov', '2672554677', 'seanumarov@sluniversal.com', '0e8812a7cfa712392555db08efccfc3a624fb535', NULL, '2020-05-04 10:41:35', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(359, 'Cristian', NULL, 'Puma', '3477302566', 'cpuma17@gmail.com', 'c3184f2116afb08e8bcb6239feac7a299543e1ef', NULL, '2020-05-04 14:25:10', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(361, 'Michael', '', 'Foley', '7742666906', 'mfoley@empiretelecomm.com', '3aaebd377d6f060143a58c2b9cc4e66f8e4b5258', NULL, '2020-05-11 10:43:38', 0, 1, NULL, 5, 0, 'mfoley@empiretelecomm.com', 'Empire1234', 0, ''),
(362, 'Travis', NULL, 'Malo', '7743039391', 'tmalo@empiretelecomm.com', '68e00abeae5490a69c78e6ebe5c502878aa92274', NULL, '2020-05-11 11:28:19', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(363, 'John', NULL, 'Mcneil', '3157274817', 'jmcneil@empiretelecomm.com', '51f257eb308ae151c3c4f87d8e38f9a3238e8808', NULL, '2020-05-11 12:24:21', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(364, 'Ruslan', NULL, 'Pateev', '9196412452', 'ruslan.p@invertice.net', 'f8ec7ac5bddda182e0bbfd4edb4330e679ca40e1', NULL, '2020-05-12 12:02:18', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(366, 'reza', NULL, 'mehrpouyan', '0098902218', 'rezamehrpouyan.dr.dds@gmail.com', 'aeff8cc491e93ab72605736972bc52c18aa543ea', NULL, '2020-05-13 15:55:01', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(367, 'Devin', '', 'Walker', '3152635793', 'dwalker@empiretelecomm.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-05-14 17:19:09', 0, 1, NULL, 5, 0, ' dwalker@empiretelecomm.com', 'Empire1234', 0, ''),
(368, 'Aleksander', '', 'Carroll ', '3156791370', 'acarroll@empiretelecomm.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-05-15 11:32:45', 0, 1, NULL, 0, 0, 'acarroll@empiretelecomm.com', 'Empire1234', 0, ''),
(369, 'Wofio', '', 'Neto', '4016606586', 'wneto@empiretelecomm.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-05-15 13:03:16', 0, 1, NULL, 0, 0, '', '', 0, ''),
(370, 'Dennis', NULL, 'Lowney ', '6174486086', 'powerup.dl@gmail.com', '962a64256f8a019f1497c8b4c156a1db882d51e4', NULL, '2020-05-18 09:12:59', 1, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(371, 'Steve', '', 'Frigon ', '3392234763', 'sfrigon@empiretelecomm.com', '0cfb399c9a286a23f8731d67efb933c64cde2e6f', NULL, '2020-05-18 22:25:15', 0, 0, NULL, 0, 0, 'sfrigon@empiretelecomm.com', 'Empire1234', 0, ''),
(372, 'Adil', NULL, 'Kanybek', '3214741264', 'kanybek.a@invertice.net', '8837456921b3b7f5baf48629b4f008c9b5663ff9', NULL, '2020-05-19 12:55:00', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(374, 'William', '', 'Ladnyak', '2158277596', 'ladnyak.w@invertice.net', '9d938d98103caacc204fe15d2814a61c89630664', NULL, '2020-05-20 08:50:31', 0, 1, NULL, 5, 0, 'ladnyak.w@intertice.net', 'gc123', 0, ''),
(376, 'ivan', NULL, 'koren', '3128105022', 'koren.i@invertice.net', 'c9e20bb60f2a48c66738975288e3419114a7d750', NULL, '2020-05-24 12:58:06', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(377, 'Joe', NULL, 'Curboy', '5086887282', 'Jwcurboy@gmail.com', 'daea0cbe29801181c958d236bbfa15a89ac508ba', NULL, '2020-05-27 08:47:50', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(378, 'Valiantsin', NULL, 'Kniha', '2154853883', 'val.k@rullex.net', 'c1ec0d0406cd0d2d68f56d5058c286ef9077b599', NULL, '2020-05-27 10:20:04', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(380, 'Emmanuel', '', 'Matias', '9789541386', 'ematias@empiretelecomm.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-05-28 11:06:43', 0, 1, NULL, 5, 0, 'ematias@empiretelecomm.com', 'Empire1234', 0, ''),
(381, 'David', NULL, 'Dowling', '6178169351', 'ddowling@aerialwireless.com', '0aa787a2697c489c2669299bb67854e4512b5564', NULL, '2020-05-28 11:41:41', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(382, 'Dave', NULL, 'Bugan', '5083359980', 'dave@superiorwirelessservices.com', 'd2451e2e38c84031dac3781bf1b1c62d92211f7a', NULL, '2020-06-01 08:00:45', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(383, 'Mark', '', 'Austin', '9893874894', 'maustin@fmkinfra.com', '9d938d98103caacc204fe15d2814a61c89630664', NULL, '2020-06-01 10:07:11', 0, 1, NULL, 5, 0, 'maustin@fmkinfra.com', 'gc123', 0, ''),
(385, 'Roosevelt', '', 'Fontes', '3392235459', 'rfontes@empiretelecomm.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-06-08 10:49:56', 0, 1, NULL, 5, 0, 'rfontes@empiretelecomm.com', 'Empire1234', 0, ''),
(386, 'DZMITRIY', NULL, 'SHKLIANNIK', '2675927107', 'dima0708@gmail.com', '8794f5fdd5a6591ee633d7952aaf1ce598765d69', NULL, '2020-06-08 13:46:16', 1, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(387, 'Aleksey', '', 'Poopkin', '2159006897', 'ap@sluniversal.com', '524e39484bc54f17d9a00c9a85bdcc986b985e23', NULL, '2020-06-09 07:59:26', 0, 1, NULL, 5, 0, '', '', 0, ''),
(389, 'Zackary', '', 'Shipley', '5086136515', 'zshipley@empiretelecomm.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-06-09 15:24:37', 0, 0, NULL, 5, 0, 'zshipley@empiretelecomm.com', 'Empire1234', 0, ''),
(390, 'Robert', NULL, 'Zaduri ', '9892212793', 'robertzaduri303@gmail.com', 'a12b55ea1b22a8da84848452ba1f2c06ce5cc60c', NULL, '2020-06-12 09:11:09', 0, 1, NULL, 5, 0, NULL, NULL, 0, '');
INSERT INTO `feusers` (`id`, `fname`, `mname`, `lname`, `cell_number`, `email`, `password`, `client`, `added_date`, `is_active`, `company_id`, `superviser_id`, `role`, `by_admin_ban`, `web_email`, `web_pass`, `forgot_password_status`, `token`) VALUES
(391, 'Vadim', NULL, 'MAkarets', '6789866772', 'v.makarets@mkncomm.com', 'd7220d3dffd93c966a4a8529b3d20e1cdd68fa94', NULL, '2020-06-13 08:53:24', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(392, 'Evgeny', NULL, 'Senkin', '2674956788', 'essenkin@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', NULL, '2020-06-15 14:08:00', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(393, 'Victor', NULL, 'Mindru', '2676508385', 'victor.mindru@sluniversal.com', '4f384c7d4fe30f7451ea85c282c27ae6090807dd', NULL, '2020-06-15 19:55:22', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(395, 'MARCO', NULL, 'Tigre', '3475799802', 'marco@mitservicesny.com', '8461b207b9f8885d2a505f6c569a5cb1d81670b7', NULL, '2020-06-17 11:55:00', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(396, 'Rooshan', NULL, 'Saheed', '9175002347', 'Rooshansaheed80@gmail.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-06-17 12:11:48', 0, 1, NULL, 5, 0, NULL, NULL, 1, '2833'),
(397, 'Aliy', NULL, 'Shegidevich', '2672505233', 'shegidevich@gmail.com', '15f848c08d4cb500eca338b8c516680823d0d662', NULL, '2020-06-19 09:15:26', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(398, 'Nachiket', NULL, 'Chaukhande ', '9834756764', 'Nachiket0166@gmail.com', 'd0ed7a3d1cb75d4add4d563cdde79c06c574e40a', NULL, '2020-06-22 01:14:04', 1, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(399, 'Anthony', NULL, 'Sinn', '4133294648', 'anthony@superiorwirelessservices.com', '31bb45120b8cc27010e27c4d344f2474737d1d8d', NULL, '2020-06-23 09:18:36', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(400, 'Medkhat', '', 'Imanberli', '5406840364', 'imanberli.m@gmail.com', '064444ba7cc77a837a2932567b49b7a799fb2795', NULL, '2020-06-23 20:32:50', 0, 1, NULL, 5, 0, '', '', 0, ''),
(403, 'Michael', NULL, 'Costner ', '9842341636', 'krissaspop@aol.com', '4be30d9814c6d4e9800e0d2ea9ec9fb00efa887b', NULL, '2020-06-25 10:21:24', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(404, 'Nickolas', NULL, 'Gaudino', '5082943944', 'ngaudino@empiretelecomm.com', '32ca9fc1a0f5b6330e3f4c8c1bbecde9bedb9573', NULL, '2020-06-26 08:35:53', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(406, 'Mitchell', NULL, 'Nierodzinski ', '5089432417', 'mjnierodzinski@gmail.com', 'caeb595c14d4c8f199f97b4474cde89163e75884', NULL, '2020-06-29 07:08:36', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(407, 'Kendall', NULL, 'Singleton', '8564624004', 'Ksingleton@kcadvancedtech.com', 'a2cf52d0a4698760026f964745014de99d9a5fdb', NULL, '2020-06-29 09:03:52', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(408, 'Ruslan', '', 'Tulegenov', '4709027785', 'r.tulegenov@ngtgroupllc.com', 'ebb5f819eb02e2467caa1b4b972b3fd03e7706c9', NULL, '2020-06-29 21:09:34', 0, 1, NULL, 5, 0, '', '', 0, ''),
(411, 'Kevin', NULL, 'Bearden', '7818255523', 'kbearden@empiretelecomm.com', '6dac8710c487f2972874fe90b9c61d548380b0e2', NULL, '2020-07-13 11:37:36', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(412, 'Andre', NULL, 'Daveiga', '4014424237', 'adaveiga@aerussolutions.com', 'eb3a68bbbf81db57b253ebed5560ada031bd5d89', NULL, '2020-07-15 08:34:14', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(413, 'Eugene', NULL, 'Khramtsou ', '2135000124', 'eugene.k@blacktowergroup.net', '349c343da3cb95f7183980a57d1ba489de2efdb8', NULL, '2020-07-15 13:07:03', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(414, 'Alex', NULL, 'Chervonik', '2159648582', 'ac992018@sluniversal.com', 'b408e36f102865620b5dcaa741c531e1706cd36b', NULL, '2020-07-15 14:26:14', 1, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(415, 'Arash', NULL, 'Nadri', '0912290185', 'arash.vippc@gmail.com', '7d7ab856aae94f4e0ee63cf7910e627747ea76d1', NULL, '2020-07-18 00:03:57', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(416, 'Shane', NULL, 'Matthews', '9788104365', 'smatthews@sentenia.net', 'fe0b28f91f76fa0aab1f5910b1ba7c9282a70777', NULL, '2020-07-19 10:23:58', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(417, 'Pete', NULL, 'Torian', '5089222751', 'ptorian@prioritypcs.com', 'aa3ba852f1df04e2a67f209564731867ffd70859', NULL, '2020-07-20 07:53:09', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(418, 'Mihail', NULL, 'Bordeianu ', '2678196310', 'michaelb@sluniversal.com', '7e2005f337348e55a91fab6b9745af5d4017702d', NULL, '2020-07-21 09:50:08', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(419, 'Juan', NULL, 'Muruzumbay ', '9292536493', 'juan@darwinsystem.org', 'de632929a7d49af58cc4afdf1e959dfd494ee9fb', NULL, '2020-07-25 08:07:12', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(420, 'Vladimir', NULL, 'Yakovenko', '9175888962', 'Yakovenko223@gmail.com', '8c96b502442ced688a01d5dc5ae721765572f613', NULL, '2020-07-27 08:48:46', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(421, 'Josh', NULL, 'Robinson', '5089189253', 'jrobinson@empiretelecomm.com', '77f8e7bb006451910a71e9f3ee546bd1ea5dd346', NULL, '2020-07-27 09:00:38', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(422, 'Mosi', NULL, 'Mirshafieu', '0779305563', 'mosi@2m-automation.co.uk', 'a2f1ef0789ee3799ed011fbde26932ae1901b14c', NULL, '2020-08-02 07:11:31', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(423, 'Ihar', NULL, 'Mazyrka', '2675630837', 'ihar.m@rullex.net', 'ce92c8d0109dde8e053cc3bd3110b7ae1b6425f3', NULL, '2020-08-04 14:17:27', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(424, 'CHRIS', NULL, 'BOLSTRIDGE', '2072703633', 'cbolstridge@empiretelecomm.com', '8c6825b0c7e7e8e33cec9da9f3e2d260484083c9', NULL, '2020-08-07 08:15:51', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(425, 'Gaige', NULL, 'Pleninger', '2077173473', 'gpleninger@empiretelecomm.com', 'f9a29e73ef55a7424f0f5f01775b0276543cd998', NULL, '2020-08-07 09:18:47', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(426, 'Rakhat', NULL, 'Kakimov', '7573242864', 'rakhat_11-2@mail.ru', '146a4ff806b46bc9ccc350b615d9ef265194c538', NULL, '2020-08-07 23:34:47', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(427, 'Iman', NULL, 'Imani', '9893899385', 'omisomid6002@gmail.com', 'd8c70c5f3e9c7b997571b164a1584edc9060e3ae', NULL, '2020-08-11 18:22:43', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(428, 'Alexander', NULL, 'Raedel', '5087175199', 'araedel@empiretelecomm.com', '66d69da068579d7b1ad4c67478126f2f8906bb5a', NULL, '2020-08-13 08:27:50', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(429, 'Ryan', '', 'Mantor', '3152636529', 'rmantor@qualtekwireless.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-08-13 09:23:12', 0, 1, NULL, 5, 0, 'rmantor@qualtekwireless.com', 'Empire1234', 0, ''),
(430, 'Blake', '', 'Whitehead', '3513224418', 'bwhitehead@qualtekwireless.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-08-13 10:34:35', 0, 1, NULL, 0, 0, 'bwhitehead@qualtekwireless.com', 'Empire1234', 0, ''),
(431, 'Andrei', NULL, 'Ajder', '2159042361', 'aajder@sluniversal.com', '5e357910cef3aaf31eee984f73906b42e483209b', NULL, '2020-08-14 09:15:41', 1, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(432, 'Aliaksandr', NULL, 'Trubila', '2155201393', 'aliaksandr.trubila@gmail.com', '37bd2c14679c44bfd50ebb9559659355e600f598', NULL, '2020-08-15 11:08:55', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(433, 'Babak', NULL, 'Poursistani ', '0912265005', 'babak.poursistani@gmail.com', '7b65511a5c1f3822c4ccf8b38812208e416b6e6a', NULL, '2020-08-16 16:58:32', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(434, 'Thomas', NULL, 'Reeves', '3159490510', 'treeves@cell-techservices.com', '281f8a9e0da6075ee1de966415b82297db2dae2c', NULL, '2020-08-17 13:02:07', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(435, 'Gary', NULL, 'Pylman', '3153174985', 'gpylman@empiretelecomm.com', '4be30d9814c6d4e9800e0d2ea9ec9fb00efa887b', NULL, '2020-08-17 15:24:52', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(437, 'CARLOS', NULL, 'LOJANO', '3477592084', 'clojano@hotmail.com', '81f6243a91770c1359607d34cdce7ba4dbd621df', NULL, '2020-08-20 07:03:05', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(438, 'Edison', NULL, 'Tenelema', '3474374226', 'edisont@mastericorp.com', 'bc6540f4a42842eee3374ddc9c66f7ddf1581d1f', NULL, '2020-08-20 07:18:58', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(439, 'David', NULL, 'Lojano ', '3476125502', 'lojanodavid@yahoo.com', 'bf11aa2ee780ca0c5ded80fc813a3956859d5f78', NULL, '2020-08-20 09:58:28', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(440, 'Dave', NULL, 'Cosgrave ', '3184169388', 'dcosgrave@cell-trchservices.con', '1fa3657b6601d451f50ed43ab47dbff370b0631c', NULL, '2020-08-24 07:36:48', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(441, 'Devin', NULL, 'Walker', '3152635793', 'dwalker@qualtekwireless.com', '53fb9bc3ebab088d82a2cc825b1faec26d80219c', NULL, '2020-08-24 19:20:30', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(442, 'Byron', '', 'Lojano', '3479624686', 'bjlojano@gmail.com', '34087bfd8b9ff46c1bc6edb63f0d2311200f4d7f', NULL, '2020-08-25 11:32:55', 0, 1, NULL, 5, 0, 'bjlojano@gmail.com', 'GC1234', 0, ''),
(443, 'shahram', NULL, 'shafighi', '0915107848', 'sistann_new@yahoo.com', '0f256babde6972b6f4428cc3a5b9e343b2147c52', NULL, '2020-08-30 03:42:04', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(444, 'Rob', NULL, 'Burns', '9788883771', 'rburns@qualtekwireless.com', '8e1825060a360980c3f1c8f5b8ef9618a22e862e', NULL, '2020-08-31 08:09:24', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(445, 'Deric', NULL, 'Dubois', '4016969693', 'ddubois@qualtekwireless.com', '61c6d6cc16b12a47ab05738d9c536b95fcf58056', NULL, '2020-08-31 12:30:37', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(446, 'Nickolas', NULL, 'Hartlaub', '7178414878', 'nhartlaub@kcadvancedtech.com', '78347cf893ed662801e73990454e41f64204f82f', NULL, '2020-09-02 14:58:12', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(448, 'trevor', NULL, 'albert', '8603981055', 'trevora@phalconusa.com', '00d9e8c5c918d3a0720d422bb6749a874a46eafd', NULL, '2020-09-08 10:32:54', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(449, 'Richard', NULL, 'Clemens ', '8138420644', 'rclemens55@gmail.com', '06a3fd76243303fcf0950997f6c3b56351eb0855', NULL, '2020-09-09 08:50:10', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(450, 'David', NULL, 'Smith', '3392154897', 'dsmith@qualtekwireless.com', '452b98776f4765040bcf043209ef68d175e81196', NULL, '2020-09-10 08:31:57', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(451, 'Aly', NULL, 'Aybek', '4077573577', 'aly.a@rullex.net', 'd7e721a6e5f67bfd068875fd4875ba8f7f16f596', NULL, '2020-09-11 08:54:34', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(452, 'Ryan', NULL, 'Fraser', '1978995117', 'ryanfraser1205@yahoo.com', '6064ecb5a588b8149189ddc9852f4fa060785eeb', NULL, '2020-09-11 09:34:24', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(453, 'Marc', NULL, 'Fowler', '2014140867', 'mfowler@itonbo.com', 'bcec8e91de7e163ca463ca9270ee2b68a63ad176', NULL, '2020-09-11 19:20:46', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(454, 'Marc', NULL, 'Fowler', '2014140867', 'mfowler@ironbo.com', 'bcec8e91de7e163ca463ca9270ee2b68a63ad176', NULL, '2020-09-11 19:21:12', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(455, 'Pavel', NULL, 'Kuleshov ', '8653673800', 'pavel.kuleshov@mkncomm.com', 'f8ec7ac5bddda182e0bbfd4edb4330e679ca40e1', NULL, '2020-09-13 15:16:31', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(456, 'Matt', NULL, 'Fastino ', '5084934393', 'Mtfjobs@yahoo.com', 'fb3641a4ffa970f27ca9dcd3adacabac92a313e0', NULL, '2020-09-14 07:42:09', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(457, 'Lamar', NULL, 'Morello', '7744345059', 'lmorello@qualtekwireless.com', 'f141a7a08b3dec0dcfde07a577902240174a8097', NULL, '2020-09-14 09:09:25', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(458, 'Dustin', NULL, 'Whipple', '2073998472', 'dwhipple@qualtekwireless.com', '580d7665aa9feb175844c8465a9ad879c1aad0b4', NULL, '2020-09-14 09:40:16', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(459, 'Chase', NULL, 'Bouton', '2072702363', 'cbouton@qualtekwireless.com', '75677f567fa871ecfdb8fb8a2a2b39b57109f59e', NULL, '2020-09-14 11:56:20', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(460, 'Vadzim', NULL, 'Charnetski', '2675007447', 'vadzim.c@rullex.net', '8ac7b090527c4f03161e38d8f44ea93697371a13', NULL, '2020-09-14 14:28:16', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(461, 'Aliaksei', NULL, 'Rabrou', '2156940426', 'alex.r@rullex.net', '317a526b49d8cc5126f34958f9312a37a1ee1d0f', NULL, '2020-09-14 20:32:00', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(462, 'Todd', NULL, 'Kane', '6079539239', 'todd.kane@yahoo.com', '5cdb224b311056495ef6cce6d61d43ec08edd1a6', NULL, '2020-09-15 08:25:53', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(463, 'Josh', NULL, 'Robbins', '7818310205', 'josh.robbins@induscom.com', '72b92d9c354f2fdec7222f79896b24a501dbd3bc', NULL, '2020-09-16 08:53:43', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(464, 'Shaik', NULL, 'Alam', '9294277155', 'alam@tarabuildersinc.com', '288acb7a3db1e66bd0e6fa2d3d649f6fa148d987', NULL, '2020-09-16 10:18:12', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(465, 'Nathan', NULL, 'Blile', '3304309517', 'nblile@empiretelecomm.com', 'd68773d7611d0b8823417f739b99ede150d54e24', NULL, '2020-09-16 15:05:42', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(466, 'Ryan', NULL, 'Morrell ', '5089189326', 'rmorrell@qualtekwireless.com', '6d52c3a0590733da6ca1b34d8eeab818f4d31cfb', NULL, '2020-09-17 08:51:16', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(467, 'Aliaksandr', NULL, 'Zaleuski ', '2676802973', 'alex.z@attowers.com', '0ddad0cdd46cc190bf3ebef5e8a823315dfb8cf0', NULL, '2020-09-17 10:35:20', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(468, 'Keith', NULL, 'Winn', '9198017809', 'kwinn@velocitel.com', '3497c0f9386a006f035185d02e9d1127164cb243', NULL, '2020-09-17 11:28:33', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(469, 'Jeffrey', NULL, 'Boston ', '9892251937', 'jboston@empiretelecomm.com', 'ad81be8a78bd917919b709094bc6ff95193b9c0e', NULL, '2020-09-18 09:20:56', 1, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(470, 'Keith', NULL, 'Sale', '8142797441', 'ksale@empiretelecomm.com', '9d072bfdb05e43ac58933c55dba0f9f304b3bf04', NULL, '2020-09-18 09:24:08', 1, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(471, 'Max', NULL, 'Napreyeu', '6105742229', 'max.napreyeu@mkncomm.com', '518df2ab6fe7b5b4f20c25be48c9145898609719', NULL, '2020-09-18 10:18:40', 0, 1, NULL, 5, 0, NULL, NULL, 0, ''),
(472, 'Michael', '', 'Recine ', '0000000000', 'michael.recine@imaginetelecomgroup.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-09-18 14:27:04', 0, 1, NULL, 5, 0, 'michael.recine@imaginetelecomgroup.com', 'Empire1234', 0, ''),
(473, 'Fred', '', 'Sageer', '0000000000', 'fred.sageer@imaginetelecomgroup.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-09-18 14:28:07', 0, 1, NULL, 5, 0, 'fred.sageer@imaginetelecomgroup.com', 'Empire1234', 0, ''),
(474, 'Eric', '', 'Hogarth ', '0000000000', 'Eric.H@invertice.net', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-09-18 14:30:53', 0, 1, NULL, 5, 0, 'Eric.H@invertice.net', 'Empire1234', 0, ''),
(475, 'Kyle', '', 'Lis ', '0000000000', 'kyle.l@invertice.net', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-09-18 14:31:53', 0, 1, NULL, 5, 0, 'kyle.l@invertice.net', 'Empire1234', 0, ''),
(476, 'Joseph', '', 'Naylor', '0000000000', 'joseph.naylor@ngtgroupllc.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-09-18 14:36:07', 0, 1, NULL, 5, 0, 'joseph.naylor@ngtgroupllc.com', 'Empire1234', 0, ''),
(477, 'Ikram', '', 'Zalland', '0000000000', 'i.zalland@ngtgroupllc.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-09-18 14:38:00', 0, 1, NULL, 5, 0, 'i.zalland@ngtgroupllc.com', 'Empire1234', 0, ''),
(478, 'Muzaffar', '', '', '0000000000', 'muzaffar@ngtgroupllc.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-09-18 14:40:39', 0, 1, NULL, 5, 0, 'muzaffar@ngtgroupllc.com', 'Empire1234', 0, ''),
(479, 'Matthew', '', 'Beacham', '0000000000', 'm.beacham@ngtgroupllc.com', 'cfef1bc799102e7c1b2dc4feba26c157c3a39e97', NULL, '2020-09-18 14:42:18', 0, 1, NULL, 5, 0, 'm.beacham@ngtgroupllc.com', 'Empire1234', 0, ''),
(480, 'Milton', NULL, 'Quito', '3477967327', 'multinquito@hotmail.es', '2e807d13a69ee7a0398b17f41dbcd0cbcb2e2276', NULL, '2020-09-19 10:09:48', 1, 1, NULL, 5, 0, NULL, NULL, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `logins`
--

CREATE TABLE `logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  `is_login` int(11) NOT NULL DEFAULT 1,
  `added_date` datetime DEFAULT NULL,
  `role` int(11) DEFAULT NULL COMMENT '0=admin,1=child admin,2=um,3=fe,4=client manager',
  `latitude` text DEFAULT NULL,
  `longitude` text DEFAULT NULL,
  `ip_details` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logins`
--

INSERT INTO `logins` (`id`, `user_id`, `ip`, `login_time`, `logout_time`, `is_login`, `added_date`, `role`, `latitude`, `longitude`, `ip_details`) VALUES
(1, 99, '192.168.10.2', '2021-12-25 10:22:35', '2021-12-25 10:36:09', 1, '2021-12-25 10:22:35', NULL, NULL, NULL, '{\"success\":false,\"error\":{\"code\":104,\"type\":\"usage_limit_reached\",\"info\":\"Your monthly usage limit has been reached. Please upgrade your Subscription Plan.\"}}'),
(2, 99, '192.168.10.2', '2021-12-25 10:36:37', '2021-12-25 10:46:12', 1, '2021-12-25 10:36:37', NULL, NULL, NULL, '{\"success\":false,\"error\":{\"code\":104,\"type\":\"usage_limit_reached\",\"info\":\"Your monthly usage limit has been reached. Please upgrade your Subscription Plan.\"}}'),
(3, 99, '192.168.10.2', '2021-12-25 11:26:21', '2021-12-25 11:26:36', 1, '2021-12-25 11:26:21', NULL, NULL, NULL, '{\"success\":false,\"error\":{\"code\":104,\"type\":\"usage_limit_reached\",\"info\":\"Your monthly usage limit has been reached. Please upgrade your Subscription Plan.\"}}'),
(4, 99, '192.168.10.2', '2021-12-25 11:27:29', '2021-12-25 11:32:16', 1, '2021-12-25 11:27:29', NULL, NULL, NULL, '{\"success\":false,\"error\":{\"code\":104,\"type\":\"usage_limit_reached\",\"info\":\"Your monthly usage limit has been reached. Please upgrade your Subscription Plan.\"}}'),
(5, 99, '192.168.10.2', '2021-12-25 11:44:19', NULL, 1, '2021-12-25 11:44:19', NULL, NULL, NULL, '{\"success\":false,\"error\":{\"code\":104,\"type\":\"usage_limit_reached\",\"info\":\"Your monthly usage limit has been reached. Please upgrade your Subscription Plan.\"}}'),
(6, 99, '192.168.10.2', '2021-12-29 11:35:41', '2021-12-29 16:11:17', 1, '2021-12-29 11:35:41', NULL, NULL, NULL, '{\"success\":false,\"error\":{\"code\":104,\"type\":\"usage_limit_reached\",\"info\":\"Your monthly usage limit has been reached. Please upgrade your Subscription Plan.\"}}'),
(7, 99, '192.168.10.2', '2021-12-29 16:15:19', NULL, 1, '2021-12-29 16:15:19', NULL, NULL, NULL, '{\"success\":false,\"error\":{\"code\":104,\"type\":\"usage_limit_reached\",\"info\":\"Your monthly usage limit has been reached. Please upgrade your Subscription Plan.\"}}'),
(8, 1, '192.168.10.9', '2021-12-30 13:50:08', NULL, 1, '2021-12-30 13:50:08', NULL, NULL, NULL, '{\"success\":false,\"error\":{\"code\":104,\"type\":\"usage_limit_reached\",\"info\":\"Your monthly usage limit has been reached. Please upgrade your Subscription Plan.\"}}'),
(9, 99, '192.168.10.7', '2021-12-31 16:05:14', NULL, 1, '2021-12-31 16:05:14', NULL, NULL, NULL, '{\"success\":false,\"error\":{\"code\":104,\"type\":\"usage_limit_reached\",\"info\":\"Your monthly usage limit has been reached. Please upgrade your Subscription Plan.\"}}'),
(10, 99, '192.168.10.8', '2022-01-03 11:20:09', NULL, 1, '2022-01-03 11:20:09', NULL, NULL, NULL, '{\"ip\": \"192.168.10.8\", \"type\": \"ipv4\", \"continent_code\": null, \"continent_name\": null, \"country_code\": null, \"country_name\": null, \"region_code\": null, \"region_name\": null, \"city\": null, \"zip\": null, \"latitude\": null, \"longitude\": null, \"location\": {\"geoname_id\": null, \"capital\": null, \"languages\": null, \"country_flag\": null, \"country_flag_emoji\": null, \"country_flag_emoji_unicode\": null, \"calling_code\": null, \"is_eu\": null}}'),
(11, 99, '192.168.10.5', '2022-01-03 15:39:00', NULL, 1, '2022-01-03 15:39:00', NULL, NULL, NULL, '{\"ip\": \"192.168.10.5\", \"type\": \"ipv4\", \"continent_code\": null, \"continent_name\": null, \"country_code\": null, \"country_name\": null, \"region_code\": null, \"region_name\": null, \"city\": null, \"zip\": null, \"latitude\": null, \"longitude\": null, \"location\": {\"geoname_id\": null, \"capital\": null, \"languages\": null, \"country_flag\": null, \"country_flag_emoji\": null, \"country_flag_emoji_unicode\": null, \"calling_code\": null, \"is_eu\": null}}'),
(12, 99, '192.168.10.2', '2022-01-05 11:55:09', NULL, 1, '2022-01-05 11:55:09', NULL, NULL, NULL, '{\"success\":false,\"error\":{\"code\":104,\"type\":\"usage_limit_reached\",\"info\":\"Your monthly usage limit has been reached. Please upgrade your Subscription Plan.\"}}'),
(13, 99, '192.168.10.2', '2022-01-06 12:14:04', NULL, 1, '2022-01-06 12:14:04', NULL, NULL, NULL, '{\"success\":false,\"error\":{\"code\":104,\"type\":\"usage_limit_reached\",\"info\":\"Your monthly usage limit has been reached. Please upgrade your Subscription Plan.\"}}'),
(14, 99, '192.168.10.2', '2022-01-07 10:41:08', NULL, 1, '2022-01-07 10:41:08', NULL, NULL, NULL, '{\"success\":false,\"error\":{\"code\":104,\"type\":\"usage_limit_reached\",\"info\":\"Your monthly usage limit has been reached. Please upgrade your Subscription Plan.\"}}'),
(15, 99, '192.168.10.2', '2022-01-10 10:48:42', NULL, 1, '2022-01-10 10:48:42', NULL, NULL, NULL, '{\"success\":false,\"error\":{\"code\":104,\"type\":\"usage_limit_reached\",\"info\":\"Your monthly usage limit has been reached. Please upgrade your Subscription Plan.\"}}'),
(16, 99, '192.168.10.2', '2022-01-11 11:11:30', NULL, 1, '2022-01-11 11:11:30', NULL, NULL, NULL, '{\"success\":false,\"error\":{\"code\":104,\"type\":\"usage_limit_reached\",\"info\":\"Your monthly usage limit has been reached. Please upgrade your Subscription Plan.\"}}'),
(17, 99, '192.168.10.2', '2022-01-14 10:28:09', '2022-01-14 10:29:03', 1, '2022-01-14 10:28:09', NULL, NULL, NULL, '{\"success\":false,\"error\":{\"code\":104,\"type\":\"usage_limit_reached\",\"info\":\"Your monthly usage limit has been reached. Please upgrade your Subscription Plan.\"}}'),
(18, 99, '::1', '2022-02-23 19:08:01', NULL, 1, '2022-02-23 19:08:01', NULL, NULL, NULL, '0'),
(19, 99, '::1', '2022-02-25 10:22:53', NULL, 1, '2022-02-25 10:22:53', NULL, NULL, NULL, '{\"success\":false,\"error\":{\"code\":104,\"type\":\"usage_limit_reached\",\"info\":\"Your monthly usage limit has been reached. Please upgrade your Subscription Plan.\"}}'),
(20, 99, '::1', '2022-03-02 16:28:17', NULL, 1, '2022-03-02 16:28:17', NULL, NULL, NULL, '{\"success\":false,\"error\":{\"code\":104,\"type\":\"usage_limit_reached\",\"info\":\"Your monthly usage limit has been reached. Please upgrade your Subscription Plan.\"}}'),
(21, 99, '::1', '2022-03-03 15:45:36', NULL, 1, '2022-03-03 15:45:36', NULL, NULL, NULL, '{\"success\":false,\"error\":{\"code\":104,\"type\":\"usage_limit_reached\",\"info\":\"Your monthly usage limit has been reached. Please upgrade your Subscription Plan.\"}}'),
(22, 99, '::1', '2022-03-07 18:04:59', NULL, 1, '2022-03-07 18:04:59', NULL, NULL, NULL, '{\"success\":false,\"error\":{\"code\":104,\"type\":\"usage_limit_reached\",\"info\":\"Your monthly usage limit has been reached. Please upgrade your Subscription Plan.\"}}'),
(23, 99, '::1', '2022-03-30 17:25:28', NULL, 1, '2022-03-30 17:25:28', NULL, NULL, NULL, '{\"success\":false,\"error\":{\"code\":104,\"type\":\"usage_limit_reached\",\"info\":\"Your monthly usage limit has been reached. Please upgrade your Subscription Plan.\"}}'),
(24, 99, '::1', '2022-04-01 21:58:46', NULL, 1, '2022-04-01 21:58:46', NULL, NULL, NULL, '{\"ip\": \"::1\", \"type\": \"ipv6\", \"continent_code\": null, \"continent_name\": null, \"country_code\": null, \"country_name\": null, \"region_code\": null, \"region_name\": null, \"city\": null, \"zip\": null, \"latitude\": null, \"longitude\": null, \"location\": {\"geoname_id\": null, \"capital\": null, \"languages\": null, \"country_flag\": null, \"country_flag_emoji\": null, \"country_flag_emoji_unicode\": null, \"calling_code\": null, \"is_eu\": null}}');

-- --------------------------------------------------------

--
-- Table structure for table `mail_setting`
--

CREATE TABLE `mail_setting` (
  `id` int(11) NOT NULL,
  `protocol` varchar(90) DEFAULT NULL,
  `host` varchar(90) DEFAULT NULL,
  `port` varchar(90) DEFAULT NULL,
  `user` varchar(90) DEFAULT NULL,
  `pass` varchar(90) DEFAULT NULL,
  `from` varchar(90) DEFAULT NULL,
  `reply_to` varchar(90) DEFAULT NULL,
  `name` varchar(90) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mail_setting`
--

INSERT INTO `mail_setting` (`id`, `protocol`, `host`, `port`, `user`, `pass`, `from`, `reply_to`, `name`, `priority`) VALUES
(1, 'smtp', 'mail.integermobile.com', '587', 'support@integermobile.com', 'softql@123', 'support@integermobile.com', NULL, 'Integertel', 2),
(2, 'smtp', 'mail.softql.com', '465', 'integer@softql.com', 'softql@123', 'integer@softql.com', NULL, 'Integertel', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subtask`
--

CREATE TABLE `subtask` (
  `id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL COMMENT '1=fielding,2=design/planning,3=drafting',
  `subtask` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0=active,1=inactive'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subtask`
--

INSERT INTO `subtask` (`id`, `task_id`, `subtask`, `status`) VALUES
(1, 1, 'Fielding', 0),
(2, 1, 'Fielding QC', 0),
(3, 1, 'Fielding Correction', 0),
(4, 1, 'Submission', 0),
(5, 2, 'Design', 0),
(6, 2, 'Design QC', 0),
(7, 2, 'Design Correction', 0),
(8, 2, 'Submission', 0),
(9, 3, 'Drafting', 0),
(10, 3, 'Drafting QC', 0),
(11, 3, 'Drafting Correction', 0),
(12, 3, 'Submission', 0);

-- --------------------------------------------------------

--
-- Table structure for table `task_media`
--

CREATE TABLE `task_media` (
  `id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `media` varchar(225) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `task_remark`
--

CREATE TABLE `task_remark` (
  `id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `remark` text NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_media`
--
ALTER TABLE `activity_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_tasks`
--
ALTER TABLE `activity_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `bay_roles`
--
ALTER TABLE `bay_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bay_users`
--
ALTER TABLE `bay_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feusers`
--
ALTER TABLE `feusers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fname` (`fname`);

--
-- Indexes for table `logins`
--
ALTER TABLE `logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_setting`
--
ALTER TABLE `mail_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subtask`
--
ALTER TABLE `subtask`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_media`
--
ALTER TABLE `task_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_id` (`task_id`);

--
-- Indexes for table `task_remark`
--
ALTER TABLE `task_remark`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_id` (`task_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `activity_media`
--
ALTER TABLE `activity_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `activity_tasks`
--
ALTER TABLE `activity_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bay_roles`
--
ALTER TABLE `bay_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `bay_users`
--
ALTER TABLE `bay_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `feusers`
--
ALTER TABLE `feusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=481;

--
-- AUTO_INCREMENT for table `logins`
--
ALTER TABLE `logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `subtask`
--
ALTER TABLE `subtask`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `task_media`
--
ALTER TABLE `task_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_remark`
--
ALTER TABLE `task_remark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
