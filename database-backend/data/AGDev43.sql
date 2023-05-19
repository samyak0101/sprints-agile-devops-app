-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db2
-- Generation Time: May 14, 2023 at 05:57 PM
-- Server version: 8.0.32
-- PHP Version: 8.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `AGDev43`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`%` PROCEDURE `submit_answer` (IN `userEmail` VARCHAR(200), IN `answer` INT)   BEGIN
    DECLARE time_diff INT;
    DECLARE email_story_exists INT;
    DECLARE first_story_name VARCHAR(500);

    -- Get the first story name
    SELECT StoryName INTO first_story_name FROM SP ORDER BY T1 ASC LIMIT 1;

    -- Check if time difference between current timestamp and the timestamp of the first record is greater than 60 seconds
    SELECT TIMESTAMPDIFF(SECOND, MIN(T1), NOW()) INTO time_diff FROM SP;

    IF time_diff > 60 THEN
        -- Return NULL
        SELECT NULL;
    ELSE
        -- Check if the user_email and storyName exist
        SELECT COUNT(*) INTO email_story_exists FROM SP WHERE Email = userEmail AND StoryName = first_story_name;

        IF email_story_exists > 0 THEN
            -- If the user_email and storyName exist, update the record
            UPDATE SP
            SET Answer = answer
            WHERE Email = userEmail AND StoryName = first_story_name;
        ELSE
            -- If the user_email and storyName don't exist, create a new record
            INSERT INTO SP (Email, StoryName, Answer, T1)
            VALUES (userEmail, first_story_name, answer, NOW());
        END IF;
    END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Assigned`
--

CREATE TABLE `Assigned` (
  `Email` varchar(200) NOT NULL,
  `TaskNum` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Assigned`
--

INSERT INTO `Assigned` (`Email`, `TaskNum`) VALUES
('abc@gmail.com', 1),
('def@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Project`
--

CREATE TABLE `Project` (
  `PNum` int NOT NULL,
  `Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Project`
--

INSERT INTO `Project` (`PNum`, `Name`) VALUES
(1, 'AGDv43'),
(2, 'WebsiteCreation');

-- --------------------------------------------------------

--
-- Table structure for table `SP`
--

CREATE TABLE `SP` (
  `Email` varchar(200) NOT NULL,
  `StoryName` varchar(500) NOT NULL,
  `Answer` int DEFAULT NULL,
  `T1` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Task`
--

CREATE TABLE `Task` (
  `TaskNum` int NOT NULL,
  `PNum` int NOT NULL,
  `Title` varchar(200) DEFAULT NULL,
  `Desc` varchar(3000) DEFAULT NULL,
  `DueDate` date DEFAULT NULL,
  `Hours` int DEFAULT NULL,
  `Priority` enum('low','medium','high') DEFAULT NULL,
  `Status` enum('unassigned','todo','inprogress','complete') DEFAULT NULL,
  `Sprint` int DEFAULT NULL,
  `DateCreated` date DEFAULT NULL,
  `CreatorEmail` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Task`
--

INSERT INTO `Task` (`TaskNum`, `PNum`, `Title`, `Desc`, `DueDate`, `Hours`, `Priority`, `Status`, `Sprint`, `DateCreated`, `CreatorEmail`) VALUES
(76, 8, 'Crossing picnic point on the boat', 'Samyak', '2023-06-06', 2, 'medium', NULL, NULL, NULL, 'samyyj101@gmail.com'),
(77, 8, 'Ordering tasty snacks for the boat ride', 'Manisha', '2023-05-10', 1, 'high', NULL, NULL, NULL, 'samyyj101@gmail.com'),
(78, 8, 'Source wood planks for boat', 'Casilda', '2023-05-06', 3, 'high', NULL, NULL, NULL, 'samyyj101@gmail.com'),
(80, 8, 'built boat', 'Allen', '2023-05-11', 21, 'medium', NULL, NULL, NULL, 'samyyj101@gmail.com'),
(85, 8, 'Go To Gym Every day ', 'irving', '0001-01-01', 2, 'medium', NULL, NULL, NULL, 'irvingcpeng@gmail.com'),
(92, 8, 'pp can do masti', 'preru', '2023-05-05', 8, 'medium', NULL, NULL, NULL, 'samyak0101@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `Team`
--

CREATE TABLE `Team` (
  `Email` varchar(200) NOT NULL,
  `PNum` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Team`
--

INSERT INTO `Team` (`Email`, `PNum`) VALUES
('abc@gmail.com', 1),
('def@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `Email` varchar(200) NOT NULL,
  `Username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`Email`, `Username`) VALUES
('abc@gmail.com', 'abc'),
('def@gmail.com', 'def');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Assigned`
--
ALTER TABLE `Assigned`
  ADD PRIMARY KEY (`Email`,`TaskNum`);

--
-- Indexes for table `Project`
--
ALTER TABLE `Project`
  ADD PRIMARY KEY (`PNum`);

--
-- Indexes for table `SP`
--
ALTER TABLE `SP`
  ADD PRIMARY KEY (`Email`);

--
-- Indexes for table `Task`
--
ALTER TABLE `Task`
  ADD PRIMARY KEY (`TaskNum`);

--
-- Indexes for table `Team`
--
ALTER TABLE `Team`
  ADD PRIMARY KEY (`Email`,`PNum`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Project`
--
ALTER TABLE `Project`
  MODIFY `PNum` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Task`
--
ALTER TABLE `Task`
  MODIFY `TaskNum` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
