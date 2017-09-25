-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: shareddb1d.hosting.stackcp.net
-- Generation Time: Sep 25, 2017 at 09:58 AM
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
