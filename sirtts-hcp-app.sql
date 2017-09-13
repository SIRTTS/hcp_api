-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: shareddb1d.hosting.stackcp.net
-- Generation Time: Sep 13, 2017 at 07:40 PM
-- Server version: 10.1.14-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sirtts-hcp-app-3137fd82`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`sirtts-hcp-app-3137fd82`@`%` PROCEDURE `registration` (IN `email` VARCHAR(255), IN `password` VARCHAR(255), IN `token` VARCHAR(255), IN `gender` VARCHAR(20), IN `birthday` DATE)  BEGIN
   INSERT INTO `hcp-users`(`email`, `password`, `token`, `status`) VALUES (email, password, token, 0);
   INSERT INTO `hcp-user_details`(`userid`,`gender`,`birthday`) VALUES (LAST_INSERT_ID(),gender,birthday);
END$$

CREATE DEFINER=`sirtts-hcp-app-3137fd82`@`%` PROCEDURE `vital_signs` (IN `id` INT)  BEGIN
      SELECT `systolic`,`diastolic`, `date` FROM `hcp-vs_blood_pressure`
      WHERE `userid` = id ORDER BY `date` DESC, `time` DESC LIMIT 1;

      SELECT `celsius`, `date` FROM `hcp-vs_body_temperature`
      WHERE `userid` = id ORDER BY `date` DESC, `time` DESC LIMIT 1;

      SELECT `bpm`, `date` FROM `hcp-vs_heart_rate`
      WHERE `userid` = id ORDER BY `date` DESC, `time` DESC LIMIT 1;

      SELECT `bpm`, `date` FROM `hcp-vs_respiratory_rate`
      WHERE `userid` = id ORDER BY `date` DESC, `time` DESC LIMIT 1;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `hcp-diabetes_sugar_test`
--

CREATE TABLE `hcp-diabetes_sugar_test` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `test_result` float NOT NULL,
  `date` date NOT NULL,
  `time` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hcp-menstrual_cycle`
--

CREATE TABLE `hcp-menstrual_cycle` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hcp-users`
--

CREATE TABLE `hcp-users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(254) NOT NULL,
  `token` varchar(254) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hcp-user_details`
--

CREATE TABLE `hcp-user_details` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `firstname` varchar(55) DEFAULT NULL,
  `lastname` varchar(55) DEFAULT NULL,
  `gender` varchar(55) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `ethnicity` varchar(55) DEFAULT NULL,
  `marital_status` varchar(55) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hcp-vs_blood_pressure`
--

CREATE TABLE `hcp-vs_blood_pressure` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `systolic` int(11) NOT NULL,
  `diastolic` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hcp-vs_body_temperature`
--

CREATE TABLE `hcp-vs_body_temperature` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `celsius` float NOT NULL,
  `date` date NOT NULL,
  `time` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hcp-vs_heart_rate`
--

CREATE TABLE `hcp-vs_heart_rate` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `bpm` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hcp-vs_respiratory_rate`
--

CREATE TABLE `hcp-vs_respiratory_rate` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `bpm` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hcp-diabetes_sugar_test`
--
ALTER TABLE `hcp-diabetes_sugar_test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hcp-menstrual_cycle`
--
ALTER TABLE `hcp-menstrual_cycle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hcp-users`
--
ALTER TABLE `hcp-users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `hcp-user_details`
--
ALTER TABLE `hcp-user_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_uid` (`userid`);

--
-- Indexes for table `hcp-vs_blood_pressure`
--
ALTER TABLE `hcp-vs_blood_pressure`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hcp-vs_body_temperature`
--
ALTER TABLE `hcp-vs_body_temperature`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hcp-vs_heart_rate`
--
ALTER TABLE `hcp-vs_heart_rate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hcp-vs_respiratory_rate`
--
ALTER TABLE `hcp-vs_respiratory_rate`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hcp-diabetes_sugar_test`
--
ALTER TABLE `hcp-diabetes_sugar_test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `hcp-menstrual_cycle`
--
ALTER TABLE `hcp-menstrual_cycle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hcp-users`
--
ALTER TABLE `hcp-users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `hcp-user_details`
--
ALTER TABLE `hcp-user_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `hcp-vs_blood_pressure`
--
ALTER TABLE `hcp-vs_blood_pressure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `hcp-vs_body_temperature`
--
ALTER TABLE `hcp-vs_body_temperature`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `hcp-vs_heart_rate`
--
ALTER TABLE `hcp-vs_heart_rate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `hcp-vs_respiratory_rate`
--
ALTER TABLE `hcp-vs_respiratory_rate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
