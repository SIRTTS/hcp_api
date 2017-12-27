SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sirtts_hcp_app`
--

CREATE DATABASE IF NOT EXISTS `sirtts_hcp_app`;

USE `sirtts_hcp_app`;

DELIMITER $$
--
-- Procedures
--
CREATE PROCEDURE `registration` (IN `email` VARCHAR(255), IN `password` VARCHAR(255), IN `token` VARCHAR(255), IN `gender` VARCHAR(20), IN `birthday` DATE)  BEGIN
   INSERT INTO `hcp-users`(`email`, `password`, `token`, `status`) VALUES (email, password, token, 0);
   INSERT INTO `hcp-user_details`(`userid`,`gender`,`birthday`) VALUES (LAST_INSERT_ID(),gender,birthday);
END$$

CREATE PROCEDURE `vital_signs` (IN `id` INT)  BEGIN
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
-- Table structure for table `hcp-blood_test`
--

CREATE TABLE `hcp-blood_test` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `17 Hydroxyprogesterone` float DEFAULT NULL,
  `25-hydroxyvitamin D` float DEFAULT NULL,
  `Acetoacetate` float DEFAULT NULL,
  `Acidity` float DEFAULT NULL,
  `Alcohol` float DEFAULT NULL,
  `Ammonia` float DEFAULT NULL,
  `Amylase` float DEFAULT NULL,
  `Ascorbic Acid` float DEFAULT NULL,
  `Bicarbonate` float DEFAULT NULL,
  `Bilirubin` float DEFAULT NULL,
  `Blood Volume` float DEFAULT NULL,
  `Calcium` float DEFAULT NULL,
  `Carbon Dioxide Pressure` float DEFAULT NULL,
  `Carbon Monoxide` float DEFAULT NULL,
  `CD4 Cell Count` float DEFAULT NULL,
  `Ceruloplasmin` float DEFAULT NULL,
  `Chloride` float DEFAULT NULL,
  `Complete Blood Cell Count` float DEFAULT NULL,
  `Copper` float DEFAULT NULL,
  `Creatine Kinase` float DEFAULT NULL,
  `Creatine Kinase Isoenzymes` float DEFAULT NULL,
  `Creatinine` float DEFAULT NULL,
  `Electrolytes` float DEFAULT NULL,
  `Erythrocyte Sedimentation Rate` float DEFAULT NULL,
  `Glucose` float DEFAULT NULL,
  `Hematocrit` float DEFAULT NULL,
  `Hemoglobin` float DEFAULT NULL,
  `Iron` float DEFAULT NULL,
  `Iron-binding Capacity` float DEFAULT NULL,
  `Lactate` float DEFAULT NULL,
  `Lactic Dehydrogenase` float DEFAULT NULL,
  `Lead` float DEFAULT NULL,
  `Lipase` float DEFAULT NULL,
  `Zinc` float DEFAULT NULL,
  `Lipids Cholesterol` float DEFAULT NULL,
  `Lipids Triglycerides` float DEFAULT NULL,
  `Magnesium` float DEFAULT NULL,
  `Mean Corpuscular Hemoglobin` float DEFAULT NULL,
  `Mean Corpuscular Hemoglobin Concentration` float DEFAULT NULL,
  `Mean Corpuscular Volume` float DEFAULT NULL,
  `Osmolality` float DEFAULT NULL,
  `Oxygen Pressure` float DEFAULT NULL,
  `Oxygen Saturation` float DEFAULT NULL,
  `Phosphatase, Prostatic` float DEFAULT NULL,
  `Phosphatase` float DEFAULT NULL,
  `Phosphorus` float DEFAULT NULL,
  `Platelet Count` float DEFAULT NULL,
  `Potassium` float DEFAULT NULL,
  `Prostate-Specific Antigen` float DEFAULT NULL,
  `Proteins Total` float DEFAULT NULL,
  `Proteins Albumin` float DEFAULT NULL,
  `Proteins Globulin` float DEFAULT NULL,
  `Prothrombin` float DEFAULT NULL,
  `Pyruvic Acid` float DEFAULT NULL,
  `Red Blood Cell Count` float DEFAULT NULL,
  `Sodium` float DEFAULT NULL,
  `Thyroid-Stimulating Hormone` float DEFAULT NULL,
  `Transaminase Alanine` float DEFAULT NULL,
  `Transaminase Aspartate` float DEFAULT NULL,
  `Urea Nitrogen` float DEFAULT NULL,
  `BUN/Creatinine Ratio` float DEFAULT NULL,
  `Uric Acid` float DEFAULT NULL,
  `Vitamin A` float DEFAULT NULL,
  `WBC` float DEFAULT NULL,
  `White Blood Cell Count` float DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hcp-blood_test`
--

INSERT INTO `hcp-blood_test` (`id`, `userid`, `17 Hydroxyprogesterone`, `25-hydroxyvitamin D`, `Acetoacetate`, `Acidity`, `Alcohol`, `Ammonia`, `Amylase`, `Ascorbic Acid`, `Bicarbonate`, `Bilirubin`, `Blood Volume`, `Calcium`, `Carbon Dioxide Pressure`, `Carbon Monoxide`, `CD4 Cell Count`, `Ceruloplasmin`, `Chloride`, `Complete Blood Cell Count`, `Copper`, `Creatine Kinase`, `Creatine Kinase Isoenzymes`, `Creatinine`, `Electrolytes`, `Erythrocyte Sedimentation Rate`, `Glucose`, `Hematocrit`, `Hemoglobin`, `Iron`, `Iron-binding Capacity`, `Lactate`, `Lactic Dehydrogenase`, `Lead`, `Lipase`, `Zinc`, `Lipids Cholesterol`, `Lipids Triglycerides`, `Magnesium`, `Mean Corpuscular Hemoglobin`, `Mean Corpuscular Hemoglobin Concentration`, `Mean Corpuscular Volume`, `Osmolality`, `Oxygen Pressure`, `Oxygen Saturation`, `Phosphatase, Prostatic`, `Phosphatase`, `Phosphorus`, `Platelet Count`, `Potassium`, `Prostate-Specific Antigen`, `Proteins Total`, `Proteins Albumin`, `Proteins Globulin`, `Prothrombin`, `Pyruvic Acid`, `Red Blood Cell Count`, `Sodium`, `Thyroid-Stimulating Hormone`, `Transaminase Alanine`, `Transaminase Aspartate`, `Urea Nitrogen`, `BUN/Creatinine Ratio`, `Uric Acid`, `Vitamin A`, `WBC`, `White Blood Cell Count`, `date`, `time`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2017-09-21', '04:13:05', '2017-09-20 12:31:00', '0000-00-00 00:00:00'),
(2, 3, 11, NULL, NULL, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-24', '12:19:00', '2017-09-24 10:19:12', '0000-00-00 00:00:00'),
(3, 3, 1, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-09-24', '12:19:00', '2017-09-24 10:20:08', '0000-00-00 00:00:00'),
(4, 3, 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-24', '12:34:00', '2017-09-24 10:34:25', '0000-00-00 00:00:00'),
(5, 3, 100, 101, NULL, NULL, NULL, NULL, 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-24', '12:35:00', '2017-09-24 10:35:37', '0000-00-00 00:00:00'),
(6, 3, 100, 101, NULL, NULL, NULL, NULL, 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-24', '12:35:00', '2017-09-24 10:36:52', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `hcp-dentist_visit`
--

CREATE TABLE `hcp-dentist_visit` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `treatments` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hcp-dentist_visit`
--

INSERT INTO `hcp-dentist_visit` (`id`, `userid`, `treatments`, `date`, `time`, `created_at`, `updated_at`) VALUES
(1, 3, 'cleaning, crown and restoration', '2017-09-10', '12:30:30', '2017-09-14 18:22:11', '0000-00-00 00:00:00'),
(2, 3, 'extraction, examination and cleaning', '2017-09-11', '12:30:30', '2017-09-14 18:22:46', '0000-00-00 00:00:00'),
(3, 3, 'cleaning, whitening and extraction', '2017-09-19', '13:33:00', '2017-09-19 11:33:41', '0000-00-00 00:00:00');

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

--
-- Dumping data for table `hcp-diabetes_sugar_test`
--

INSERT INTO `hcp-diabetes_sugar_test` (`id`, `userid`, `test_result`, `date`, `time`, `created_at`, `updated_at`) VALUES
(1, 3, 120, '2017-09-10', '12:30:00', '2017-09-12 11:41:17', '0000-00-00 00:00:00'),
(2, 3, 111, '2017-09-10', '12:35:00', '2017-09-12 11:44:16', '0000-00-00 00:00:00'),
(3, 3, 23, '2017-09-13', '22:05:00', '2017-09-13 20:06:01', '0000-00-00 00:00:00'),
(4, 3, 55, '2017-09-14', '10:53:00', '2017-09-14 08:53:58', '0000-00-00 00:00:00'),
(5, 3, 7887, '2017-09-14', '20:54:00', '2017-09-14 18:55:06', '0000-00-00 00:00:00'),
(6, 3, 150, '2017-09-19', '13:40:00', '2017-09-19 11:40:53', '0000-00-00 00:00:00');

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

--
-- Dumping data for table `hcp-menstrual_cycle`
--

INSERT INTO `hcp-menstrual_cycle` (`id`, `userid`, `start_time`, `end_time`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 3, '01:05:30', '12:30:22', '2017-09-07', '2017-09-12', '2017-09-12 10:54:47', '0000-00-00 00:00:00'),
(2, 3, '21:07:00', '21:07:00', '2017-09-12', '2017-09-13', '2017-09-13 19:07:45', '0000-00-00 00:00:00'),
(3, 3, '22:14:00', '22:14:00', '2012-09-13', '2014-09-13', '2017-09-13 20:14:30', '0000-00-00 00:00:00'),
(4, 3, '20:55:00', '20:55:00', '2017-09-13', '2017-09-14', '2017-09-14 18:55:53', '0000-00-00 00:00:00');

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

--
-- Dumping data for table `hcp-users`
--

INSERT INTO `hcp-users` (`id`, `email`, `password`, `token`, `status`, `created_at`, `updated_at`) VALUES
(1, 'test@cloud9ers.com', '44e3554a6d18344416a4ede9d0a7b23', '1505222584882575f356075cd4252ac0a70d58e2ed2e3', 1, '2017-09-12 13:11:15', '2017-09-12 13:23:07'),
(3, 'amostafa@cloud9ers.com', '44e3554a6d18344416a4ede9d0a7b23', '1505222210210173b6581612349a3bd4cff09a2b145c8', 1, '2017-09-12 13:12:11', '2017-09-12 13:16:50'),
(4, 'egyptayman@gmail.com', '86e8f7ab32cfd12577bc2619bc635690', '1505224451722f8a34b923af14e0686e79548bc60cab0', 1, '2017-09-12 13:53:36', '2017-09-12 13:57:58'),
(5, 'ahmadmuhamo@gmail.com', '53b0f274ac474160abc8cd41a5efb99b', '15053278452218ae18ce79cbc42e2a125c6df8174c55f', 1, '2017-09-13 18:36:50', '2017-09-13 18:37:26');

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

--
-- Dumping data for table `hcp-user_details`
--

INSERT INTO `hcp-user_details` (`id`, `userid`, `firstname`, `lastname`, `gender`, `birthday`, `ethnicity`, `marital_status`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, 'Male', '1993-12-29', NULL, NULL, '2017-09-12 13:11:15', '0000-00-00 00:00:00'),
(2, 3, NULL, NULL, 'Male', '1993-12-29', NULL, NULL, '2017-09-12 13:12:11', '2017-09-19 13:51:06'),
(3, 4, NULL, NULL, 'Male', '1993-12-29', NULL, NULL, '2017-09-12 13:53:36', '0000-00-00 00:00:00'),
(4, 5, NULL, NULL, 'Male', '1993-01-07', NULL, NULL, '2017-09-13 18:36:50', '0000-00-00 00:00:00');

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

--
-- Dumping data for table `hcp-vs_blood_pressure`
--

INSERT INTO `hcp-vs_blood_pressure` (`id`, `userid`, `systolic`, `diastolic`, `date`, `time`, `created_at`, `updated_at`) VALUES
(1, 3, 120, 80, '2017-09-09', '12:27:23', '2017-09-11 16:20:11', '2017-09-11 18:56:20'),
(2, 3, 122, 60, '2017-09-11', '20:54:00', '2017-09-11 18:55:16', '2017-09-12 10:15:11'),
(3, 3, 111, 90, '2017-09-11', '21:56:00', '2017-09-11 18:57:47', '2017-09-12 10:15:15'),
(4, 4, 110, 14, '2017-09-12', '16:52:00', '2017-09-12 14:52:33', '0000-00-00 00:00:00'),
(5, 4, 11, 5, '2017-09-12', '17:38:00', '2017-09-12 15:38:10', '0000-00-00 00:00:00'),
(6, 3, 33, 33, '2017-09-13', '08:10:00', '2017-09-13 06:11:17', '0000-00-00 00:00:00');

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

--
-- Dumping data for table `hcp-vs_body_temperature`
--

INSERT INTO `hcp-vs_body_temperature` (`id`, `userid`, `celsius`, `date`, `time`, `created_at`, `updated_at`) VALUES
(1, 3, 23, '2017-09-14', '04:15:14', '2017-09-11 16:03:30', '2017-09-11 18:13:18'),
(2, 3, 33, '2017-09-12', '14:42:00', '2017-09-12 12:43:20', '0000-00-00 00:00:00'),
(3, 4, 22, '2017-09-13', '10:33:00', '2017-09-13 08:33:04', '0000-00-00 00:00:00'),
(4, 3, 140, '2017-09-14', '09:38:00', '2017-09-14 07:39:00', '0000-00-00 00:00:00');

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

--
-- Dumping data for table `hcp-vs_heart_rate`
--

INSERT INTO `hcp-vs_heart_rate` (`id`, `userid`, `bpm`, `date`, `time`, `created_at`, `updated_at`) VALUES
(1, 3, 80, '2017-09-20', '05:15:28', '2017-09-11 16:22:19', '2017-09-11 18:13:12'),
(2, 3, 7, '2017-09-12', '14:29:00', '2017-09-12 12:29:57', '0000-00-00 00:00:00'),
(3, 3, 7777, '2017-09-12', '14:43:00', '2017-09-12 12:50:43', '0000-00-00 00:00:00'),
(4, 4, 55, '2017-09-12', '17:38:00', '2017-09-12 15:38:19', '0000-00-00 00:00:00'),
(5, 3, 222, '2017-09-13', '08:09:00', '2017-09-13 06:09:50', '0000-00-00 00:00:00');

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
-- Dumping data for table `hcp-vs_respiratory_rate`
--

INSERT INTO `hcp-vs_respiratory_rate` (`id`, `userid`, `bpm`, `date`, `time`, `created_at`, `updated_at`) VALUES
(1, 3, 12, '2017-09-12', '14:59:00', '2017-09-12 13:00:04', '0000-00-00 00:00:00'),
(2, 4, 8, '2017-09-12', '17:20:00', '2017-09-12 15:20:43', '0000-00-00 00:00:00'),
(3, 4, 4444, '2017-09-13', '10:33:00', '2017-09-13 08:33:13', '0000-00-00 00:00:00'),
(4, 3, 34, '2017-09-14', '20:55:00', '2017-09-14 18:55:31', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `hcp-vs_spo2`
--

CREATE TABLE `hcp-vs_spo2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `percent` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hcp-blood_test`
--
ALTER TABLE `hcp-blood_test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hcp-dentist_visit`
--
ALTER TABLE `hcp-dentist_visit`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `hcp-blood_test`
--
ALTER TABLE `hcp-blood_test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `hcp-dentist_visit`
--
ALTER TABLE `hcp-dentist_visit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `hcp-diabetes_sugar_test`
--
ALTER TABLE `hcp-diabetes_sugar_test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `hcp-menstrual_cycle`
--
ALTER TABLE `hcp-menstrual_cycle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `hcp-vs_heart_rate`
--
ALTER TABLE `hcp-vs_heart_rate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `hcp-vs_respiratory_rate`
--
ALTER TABLE `hcp-vs_respiratory_rate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
