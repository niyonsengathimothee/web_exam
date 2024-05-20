-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2024 at 12:10 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `virtual art therapy sessions platform`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `AppointmentID` int(11) NOT NULL,
  `ClientID` int(11) DEFAULT NULL,
  `TherapistID` int(11) DEFAULT NULL,
  `AppointmentTime` datetime DEFAULT NULL,
  `Status` enum('Scheduled','Completed','Cancelled','NoShow') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`AppointmentID`, `ClientID`, `TherapistID`, `AppointmentTime`, `Status`) VALUES
(2, 7, 1, '2024-05-10 11:21:41', 'Completed'),
(4, 7, 3, '2024-05-31 11:22:52', 'Completed'),
(7, 2, 2, '2024-05-18 11:22:24', 'Cancelled');

-- --------------------------------------------------------

--
-- Table structure for table `artworkgallery`
--

CREATE TABLE `artworkgallery` (
  `ArtworkID` int(11) NOT NULL,
  `SessionID` int(11) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `ImageURL` varchar(255) DEFAULT NULL,
  `CreationDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `artworkgallery`
--

INSERT INTO `artworkgallery` (`ArtworkID`, `SessionID`, `Title`, `Description`, `ImageURL`, `CreationDate`) VALUES
(2, 3, NULL, NULL, NULL, '2024-05-29 11:20:18'),
(3, 4, NULL, NULL, NULL, '2024-05-28 11:19:41'),
(6, 3, NULL, NULL, NULL, '2024-05-03 11:21:10'),
(7, 3, NULL, NULL, NULL, '2024-05-31 11:20:37');

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `BillingID` int(11) NOT NULL,
  `SessionID` int(11) DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `PaymentStatus` enum('Pending','Completed','Refunded') DEFAULT NULL,
  `PaymentDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `billing`
--

INSERT INTO `billing` (`BillingID`, `SessionID`, `Amount`, `PaymentStatus`, `PaymentDate`) VALUES
(1, 1, 3.00, 'Pending', '2024-05-22 11:17:29'),
(2, 3, 4.00, 'Completed', '2024-05-22 11:17:29'),
(4, 1, 5.00, 'Pending', '2024-05-04 11:17:00'),
(5, 3, 2.00, 'Refunded', '2024-05-11 11:18:51'),
(7, 3, 2.00, 'Pending', '2024-05-10 11:08:24');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `ClientID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `TherapyBackground` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`ClientID`, `UserID`, `TherapyBackground`) VALUES
(2, 4, 'Hospitalizations'),
(5, 2, 'Outcomes and Experiences'),
(7, 4, 'Diagnoses');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `FeedbackID` int(11) NOT NULL,
  `SessionID` int(11) DEFAULT NULL,
  `ClientID` int(11) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Comment` text DEFAULT NULL,
  `FeedbackDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`FeedbackID`, `SessionID`, `ClientID`, `Rating`, `Comment`, `FeedbackDate`) VALUES
(2, 3, 2, 2, ' Therapist Observations\r\n', '2024-05-23 11:08:31'),
(3, 3, 7, 4, ' Therapist Observations\r\n', '2024-05-22 11:16:24'),
(4, 3, 5, NULL, NULL, '2024-05-15 11:15:58'),
(5, 3, 7, 1, NULL, '2024-05-29 11:15:31');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `NotificationID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Message` text DEFAULT NULL,
  `NotificationType` enum('Reminder','Alert','Update') DEFAULT NULL,
  `Seen` tinyint(1) DEFAULT 0,
  `NotificationDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`NotificationID`, `UserID`, `Message`, `NotificationType`, `Seen`, `NotificationDate`) VALUES
(2, 4, 'Reminders: Notifications that serve to remind users about upcoming appointments, deadlines, or necessary actions they need to take.', 'Reminder', 1, '2024-05-30 10:52:37'),
(4, 2, 'Reminders: Notifications ', 'Alert', 3, '2024-05-23 11:07:10'),
(7, 4, 'Reminder', 'Update', 5, '2024-05-31 11:06:22');

-- --------------------------------------------------------

--
-- Table structure for table `progressnotes`
--

CREATE TABLE `progressnotes` (
  `NoteID` int(11) NOT NULL,
  `SessionID` int(11) DEFAULT NULL,
  `TherapistID` int(11) DEFAULT NULL,
  `NoteText` text DEFAULT NULL,
  `NoteDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `progressnotes`
--

INSERT INTO `progressnotes` (`NoteID`, `SessionID`, `TherapistID`, `NoteText`, `NoteDate`) VALUES
(1, 3, 3, 'Progress Towards Goals', '2024-05-22 10:49:49'),
(3, 1, 3, ' Therapeutic Interventions\r\nProgress Towards Goals', '2024-05-29 10:47:26'),
(5, 3, 3, 'Client Statements', '2024-05-08 10:52:08');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `SessionID` int(11) NOT NULL,
  `TherapistID` int(11) DEFAULT NULL,
  `ClientID` int(11) DEFAULT NULL,
  `SessionDate` datetime DEFAULT NULL,
  `SessionDuration` int(11) DEFAULT NULL,
  `SessionType` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`SessionID`, `TherapistID`, `ClientID`, `SessionDate`, `SessionDuration`, `SessionType`) VALUES
(1, 1, 7, '2024-05-03 10:43:59', 4, 'group therapy'),
(3, 2, 5, '2024-05-23 10:46:40', 3, 'group therapy'),
(4, 3, 2, '2024-05-16 10:45:53', 6, 'individual therapy');

-- --------------------------------------------------------

--
-- Table structure for table `therapists`
--

CREATE TABLE `therapists` (
  `TherapistID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Qualifications` text DEFAULT NULL,
  `YearsOfExperience` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `therapists`
--

INSERT INTO `therapists` (`TherapistID`, `UserID`, `Qualifications`, `YearsOfExperience`) VALUES
(1, 2, 'Educational Background\r\n', 3),
(2, 4, '\r\nMaster’s Degree', 6),
(3, 1, '\r\nArt Therapy Programs', 1),
(4, 4, 'Educational Background\r\nMaster’s Degree: Therapists usually need a master\'s degree in art therapy or a related field such as counseling or psychology from an accredited institution.\r\nArt Therapy Programs: These programs should cover a variety of topics including psychology, human development, art therapy techniques, and assessment methods.', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `UserType` enum('Therapist','Client') NOT NULL,
  `CreationDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Username`, `Password`, `Email`, `UserType`, `CreationDate`) VALUES
(1, 'timo', '12', 't@gmail.com', 'Client', '2024-05-17 10:25:24'),
(2, 'timo12', '1234', 'timo@gmail.co', '', '2024-05-23 10:18:15'),
(4, 'niyo', '321', 'k@gmail.com', 'Client', '2024-05-23 10:27:49'),
(5, 'mote', '432', 'r@gmail.com', 'Client', '2024-05-16 10:29:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`AppointmentID`),
  ADD KEY `ClientID` (`ClientID`),
  ADD KEY `TherapistID` (`TherapistID`);

--
-- Indexes for table `artworkgallery`
--
ALTER TABLE `artworkgallery`
  ADD PRIMARY KEY (`ArtworkID`),
  ADD KEY `SessionID` (`SessionID`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`BillingID`),
  ADD KEY `SessionID` (`SessionID`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`ClientID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`FeedbackID`),
  ADD KEY `SessionID` (`SessionID`),
  ADD KEY `ClientID` (`ClientID`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`NotificationID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `progressnotes`
--
ALTER TABLE `progressnotes`
  ADD PRIMARY KEY (`NoteID`),
  ADD KEY `SessionID` (`SessionID`),
  ADD KEY `TherapistID` (`TherapistID`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`SessionID`),
  ADD KEY `TherapistID` (`TherapistID`),
  ADD KEY `ClientID` (`ClientID`);

--
-- Indexes for table `therapists`
--
ALTER TABLE `therapists`
  ADD PRIMARY KEY (`TherapistID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `AppointmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `artworkgallery`
--
ALTER TABLE `artworkgallery`
  MODIFY `ArtworkID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `BillingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `ClientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `FeedbackID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `NotificationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `progressnotes`
--
ALTER TABLE `progressnotes`
  MODIFY `NoteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `SessionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `therapists`
--
ALTER TABLE `therapists`
  MODIFY `TherapistID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `clients` (`ClientID`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`TherapistID`) REFERENCES `therapists` (`TherapistID`);

--
-- Constraints for table `artworkgallery`
--
ALTER TABLE `artworkgallery`
  ADD CONSTRAINT `artworkgallery_ibfk_1` FOREIGN KEY (`SessionID`) REFERENCES `sessions` (`SessionID`);

--
-- Constraints for table `billing`
--
ALTER TABLE `billing`
  ADD CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`SessionID`) REFERENCES `sessions` (`SessionID`);

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`SessionID`) REFERENCES `sessions` (`SessionID`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`ClientID`) REFERENCES `clients` (`ClientID`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `progressnotes`
--
ALTER TABLE `progressnotes`
  ADD CONSTRAINT `progressnotes_ibfk_1` FOREIGN KEY (`SessionID`) REFERENCES `sessions` (`SessionID`),
  ADD CONSTRAINT `progressnotes_ibfk_2` FOREIGN KEY (`TherapistID`) REFERENCES `therapists` (`TherapistID`);

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`TherapistID`) REFERENCES `therapists` (`TherapistID`),
  ADD CONSTRAINT `sessions_ibfk_2` FOREIGN KEY (`ClientID`) REFERENCES `clients` (`ClientID`);

--
-- Constraints for table `therapists`
--
ALTER TABLE `therapists`
  ADD CONSTRAINT `therapists_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
