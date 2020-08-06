-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 03, 2020 at 06:25 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_exam`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
CREATE TABLE IF NOT EXISTS `announcement` (
  `Announcement_id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(20) NOT NULL,
  `Announcemnet` varchar(500) NOT NULL,
  `Date` date NOT NULL,
  `Batch_id` int(11) NOT NULL,
  `Faculty_id` int(11) NOT NULL,
  PRIMARY KEY (`Announcement_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `Attendence_id` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Student_id` int(11) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  PRIMARY KEY (`Attendence_id`),
  UNIQUE KEY `Attendence_id` (`Attendence_id`,`Date`),
  UNIQUE KEY `Date` (`Date`,`Student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

DROP TABLE IF EXISTS `batch`;
CREATE TABLE IF NOT EXISTS `batch` (
  `Batch_id` int(11) NOT NULL AUTO_INCREMENT,
  `Batch_name` varchar(10) NOT NULL,
  PRIMARY KEY (`Batch_id`),
  UNIQUE KEY `Batch_name` (`Batch_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
CREATE TABLE IF NOT EXISTS `exam` (
  `Exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `Exam_name` varchar(20) NOT NULL,
  `Batch_id` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Marks` int(11) NOT NULL,
  `Time` int(11) NOT NULL,
  `Faculty_id` int(11) NOT NULL,
  PRIMARY KEY (`Exam_id`),
  UNIQUE KEY `Exam_name` (`Exam_name`,`Batch_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
CREATE TABLE IF NOT EXISTS `faculty` (
  `Faculty_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Mobile_no` varchar(10) NOT NULL,
  `Email_id` varchar(50) NOT NULL,
  `Password` varchar(250) NOT NULL,
  `Date_of_birth` date NOT NULL,
  `Salary` int(11) NOT NULL,
  `Qualification` varchar(50) NOT NULL,
  `Role` int(11) NOT NULL,
  PRIMARY KEY (`Faculty_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`Faculty_id`, `Name`, `Mobile_no`, `Email_id`, `Password`, `Date_of_birth`, `Salary`, `Qualification`, `Role`) VALUES
(1, 'Deep Bhavsar', '8128240106', 'deepbhavsar9@gmail.com', 'deep9699', '1999-06-09', 25000, 'MSC.IT', 1);

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

DROP TABLE IF EXISTS `fees`;
CREATE TABLE IF NOT EXISTS `fees` (
  `Transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `Student_id` int(11) NOT NULL,
  `Paid_amount` int(11) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`Transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `Question_id` int(11) NOT NULL AUTO_INCREMENT,
  `Tag_id` int(11) NOT NULL,
  `Difficulty` int(11) NOT NULL,
  `Question` varchar(4000) NOT NULL,
  `Option1` varchar(100) NOT NULL,
  `Option2` varchar(100) NOT NULL,
  `Option3` varchar(100) NOT NULL,
  `Option4` varchar(100) NOT NULL,
  `Answer` varchar(100) NOT NULL,
  `Count` int(11) NOT NULL,
  `Faculty_id` int(11) NOT NULL,
  PRIMARY KEY (`Question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `question_paper`
--

DROP TABLE IF EXISTS `question_paper`;
CREATE TABLE IF NOT EXISTS `question_paper` (
  `Question_id` int(11) NOT NULL,
  `Exam_id` int(11) NOT NULL,
  PRIMARY KEY (`Question_id`,`Exam_id`),
  UNIQUE KEY `Question_id` (`Question_id`,`Exam_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
CREATE TABLE IF NOT EXISTS `result` (
  `Student_exam_id` int(11) NOT NULL,
  `Obtained_Marks` int(11) NOT NULL,
  PRIMARY KEY (`Student_exam_id`,`Obtained_Marks`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
CREATE TABLE IF NOT EXISTS `salary` (
  `Transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `Faculty_id` int(11) NOT NULL,
  `Paid_amount` int(11) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`Transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `Student_id` int(11) NOT NULL AUTO_INCREMENT,
  `Password` varchar(8) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Batch_no` int(11) NOT NULL,
  `Email_id` varchar(50) NOT NULL,
  `Phone_no` varchar(10) NOT NULL,
  `Last_name` varchar(20) NOT NULL,
  `Middle_name` varchar(20) NOT NULL,
  `Parent_name` varchar(50) NOT NULL,
  `Parent_mobile_no` varchar(10) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Date_of_birth` date NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Fees` int(11) NOT NULL,
  `Joining_date` date NOT NULL,
  `Gender` varchar(6) NOT NULL,
  PRIMARY KEY (`Student_id`),
  UNIQUE KEY `Email_id` (`Email_id`,`Phone_no`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_answer`
--

DROP TABLE IF EXISTS `student_answer`;
CREATE TABLE IF NOT EXISTS `student_answer` (
  `Student_exam_id` int(11) NOT NULL,
  `Question_id` int(11) NOT NULL,
  `Answer_id` varchar(100) NOT NULL,
  PRIMARY KEY (`Student_exam_id`,`Question_id`,`Answer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_exam`
--

DROP TABLE IF EXISTS `student_exam`;
CREATE TABLE IF NOT EXISTS `student_exam` (
  `Student_exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `Student_id` int(11) NOT NULL,
  `Exam_id` int(11) NOT NULL,
  PRIMARY KEY (`Student_exam_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `Subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  PRIMARY KEY (`Subject_id`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `Tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `Subject_id` int(11) NOT NULL,
  PRIMARY KEY (`Tag_id`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `to_do_list`
--

DROP TABLE IF EXISTS `to_do_list`;
CREATE TABLE IF NOT EXISTS `to_do_list` (
  `List_id` int(11) NOT NULL AUTO_INCREMENT,
  `Faculty_id` int(11) NOT NULL,
  `Topic` varchar(100) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  PRIMARY KEY (`List_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
