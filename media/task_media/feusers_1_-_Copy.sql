-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 22, 2022 at 03:56 AM
-- Server version: 5.6.41-84.1
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `integols_osp`
--

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
  `is_active` tinyint(4) DEFAULT '0' COMMENT '0=active,1=not active',
  `company_id` int(11) DEFAULT NULL,
  `superviser_id` int(11) DEFAULT NULL,
  `role` int(11) DEFAULT '0' COMMENT '0=feuser,1=superviser,2=normal user, 5=GC',
  `by_admin_ban` tinyint(4) NOT NULL DEFAULT '0' COMMENT ' if ban by admin it is 1 or else 0',
  `web_email` varchar(70) DEFAULT NULL,
  `web_pass` varchar(45) DEFAULT NULL,
  `forgot_password_status` int(11) NOT NULL DEFAULT '0' COMMENT '1=request for forgot pass, 0=no ',
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feusers`
--

INSERT INTO `feusers` (`id`, `fname`, `mname`, `lname`, `cell_number`, `email`, `password`, `client`, `added_date`, `is_active`, `company_id`, `superviser_id`, `role`, `by_admin_ban`, `web_email`, `web_pass`, `forgot_password_status`, `token`) VALUES
(1, 'Brandon', 'Hill', '	701314917', 'brandon.hill@integertel.com', 'c1fe094db3b89499f9e3270407f6e3e3eb3e6f71', NULL, '2022-04-22', 0, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, '2022-04-14 17:03:34+05:30'),
(2, 'Christian', 'Dalby', '3182725918', 'christian@integertel.com', 'c1fe094db3b89499f9e3270407f6e3e3eb3e6f71', NULL, '2022-04-22', 0, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, '2022-04-14 17:03:34+05:30'),
(3, 'Gabrielle', 'Brouillette', '3183999886', 'gabriel.brouillette@integertel.com', 'c1fe094db3b89499f9e3270407f6e3e3eb3e6f71', NULL, '2022-04-22', 0, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, '2022-04-14 17:03:34+05:30'),
(4, 'Jeremy', 'Hefner', '3183474997', 'jeremy.hefner@integertel.com', 'c1fe094db3b89499f9e3270407f6e3e3eb3e6f71', NULL, '2022-04-22', 0, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, '2022-04-14 17:03:34+05:30'),
(5, 'Johnathon', 'Sebastien', '9548251726', 'johnathan.sebastien@integertel.com', 'c1fe094db3b89499f9e3270407f6e3e3eb3e6f71', NULL, '2022-04-22', 0, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, '2022-04-14 17:03:34+05:30'),
(6, 'Joey', 'Felts', '3212454469', 'joey.felts@integertel.com', 'c1fe094db3b89499f9e3270407f6e3e3eb3e6f71', NULL, '2022-04-22', 0, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, '2022-04-14 17:03:34+05:30'),
(7, 'Stacy', 'Moran', '', 'stacy.morgan@integertel.com', 'c1fe094db3b89499f9e3270407f6e3e3eb3e6f71', NULL, '2022-04-22', 0, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, '2022-04-14 17:03:34+05:30'),
(8, 'Jose', 'Monroy', '3613719734', 'jose.monroy@integertel.com', 'c1fe094db3b89499f9e3270407f6e3e3eb3e6f71', NULL, '2022-04-22', 0, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, '2022-04-14 17:03:34+05:30'),
(9, 'Virgil', 'Majors Jr.', '2145861095', 'virgil.majors@integertel.com', 'c1fe094db3b89499f9e3270407f6e3e3eb3e6f71', NULL, '2022-04-22', 0, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, '2022-04-14 17:03:34+05:30'),
(10, 'Quanit', 'Jamal', '8176471353', 'quanit.jamal@integertel.com', 'c1fe094db3b89499f9e3270407f6e3e3eb3e6f71', NULL, '2022-04-22', 0, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, '2022-04-14 17:03:34+05:30'),
(11, 'Lenny', 'Boutte', '2817951463', 'lenny.boutte@integertel.com', 'c1fe094db3b89499f9e3270407f6e3e3eb3e6f71', NULL, '2022-04-22', 0, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, '2022-04-14 17:03:34+05:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feusers`
--
ALTER TABLE `feusers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feusers`
--
ALTER TABLE `feusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
