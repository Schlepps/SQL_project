-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 13, 2024 at 03:53 PM
-- Server version: 10.5.21-MariaDB-0+deb11u1
-- PHP Version: 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edickie02`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `AllJobs`
-- (See below for the actual view)
--
CREATE TABLE `AllJobs` (
`ID` int(11)
,`Name` varchar(255)
,`Salary` varchar(255)
,`Description` mediumtext
,`Category` varchar(255)
,`LocationID` int(11)
,`EmployerID` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `Candidates`
--

CREATE TABLE `Candidates` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `ContactID` int(11) DEFAULT NULL,
  `LocationID` int(11) DEFAULT NULL,
  `UnderReview` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Candidates`
--

INSERT INTO `Candidates` (`ID`, `Name`, `ContactID`, `LocationID`, `UnderReview`) VALUES
(1, 'Fred Wilkinson', 1, 1, 0),
(2, 'John SuspiciousActor', 2, 2, 1),
(3, 'Simon Splinters', 3, 3, 0),
(4, 'Murphy Splinter', 3, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `CandidateSkills`
--

CREATE TABLE `CandidateSkills` (
  `CandidateID` int(11) NOT NULL,
  `SkillID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `CandidateSkills`
--

INSERT INTO `CandidateSkills` (`CandidateID`, `SkillID`) VALUES
(1, 1),
(3, 1),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ContactInfo`
--

CREATE TABLE `ContactInfo` (
  `ID` int(11) NOT NULL,
  `EmailAddress` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ContactInfo`
--

INSERT INTO `ContactInfo` (`ID`, `EmailAddress`, `PhoneNumber`) VALUES
(1, 'Wilkinson@SyMail.com', '+445560678992'),
(2, 'MaliciousActor@SpookyMail.com', '+441721126161'),
(3, 'SimonSplinters@SimonMail.com', '+441507713881'),
(4, 'RRAugustusIndustries@NetMail.com', '+442015772033'),
(5, 'HagaEntertainmentGroup@NetMail.com', '+445585568131'),
(6, 'JCCorp@MondayMail.com', '+447727128839');

-- --------------------------------------------------------

--
-- Stand-in structure for view `EmployerLocationAndContactInfo`
-- (See below for the actual view)
--
CREATE TABLE `EmployerLocationAndContactInfo` (
`Name` varchar(255)
,`EmployerDescription` text
,`Industry` varchar(255)
,`Website` text
,`EmailAddress` varchar(255)
,`PhoneNumber` varchar(255)
,`Address` varchar(255)
,`PostCode` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `Employers`
--

CREATE TABLE `Employers` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Industry` varchar(255) DEFAULT NULL,
  `Website` text DEFAULT NULL,
  `EmployerDescription` text DEFAULT NULL,
  `LocationID` int(11) DEFAULT NULL,
  `ContactID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Employers`
--

INSERT INTO `Employers` (`ID`, `Name`, `Industry`, `Website`, `EmployerDescription`, `LocationID`, `ContactID`) VALUES
(1, 'R.R.Augustus Industries', 'Heavy Manufacturing', 'RRAugustusVision.com', 'R.R. Augustus Industries produces  machinery, trading blows as one of the largest manufacturing companies in the UK. Headed by the patriarch of the Augustus family, Rene-Richard Augustus, R.R. Augustus is most famous for its production of much of the machinery behind Cargo Ships, and it’s resulting prosperity across maritime trade.', 4, 4),
(2, 'Haga Entertainment Group', 'Entertainment', 'HagaGroupLandingPage.NET', 'Haga produces mainstream feature length films, TV series and music, remaining one of the biggest names in the UK entertainment industry.', 5, 5),
(3, 'J.C.Corporation', 'Pharmaceuticals', 'JCCorpSolutions.com', 'J.C. Corporation is a leading pharmaceutical research organisation in the UK, producing a wide-range of medicines and beauty products,', 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `Interviews`
--

CREATE TABLE `Interviews` (
  `ID` int(11) NOT NULL,
  `InterviewDate` date DEFAULT NULL,
  `CandidateID` int(11) DEFAULT NULL,
  `JobID` int(11) DEFAULT NULL,
  `StatusID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Interviews`
--

INSERT INTO `Interviews` (`ID`, `InterviewDate`, `CandidateID`, `JobID`, `StatusID`) VALUES
(2, '1970-01-01', 1, 1, 2),
(3, '1970-01-01', 1, 3, 3),
(1, '2038-01-19', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `JobApplications`
--

CREATE TABLE `JobApplications` (
  `ID` int(11) NOT NULL,
  `JobID` int(11) DEFAULT NULL,
  `CandidateID` int(11) NOT NULL,
  `ApplicationDate` date DEFAULT NULL,
  `StatusID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `JobApplications`
--

INSERT INTO `JobApplications` (`ID`, `JobID`, `CandidateID`, `ApplicationDate`, `StatusID`) VALUES
(1, 1, 1, '2038-01-19', 1),
(2, 2, 2, '1970-01-01', 2),
(3, 3, 3, '1970-01-01', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Jobs`
--

CREATE TABLE `Jobs` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Salary` varchar(255) DEFAULT NULL,
  `Description` mediumtext DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `LocationID` int(11) DEFAULT NULL,
  `EmployerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Jobs`
--

INSERT INTO `Jobs` (`ID`, `Name`, `Salary`, `Description`, `Category`, `LocationID`, `EmployerID`) VALUES
(1, 'Production Manager', '£60,000 per year', 'Optimising manufacturing lines for company products and goods, and maintaining good morale amongst the manufacturing team.', 'Management', 1, 1),
(2, 'IT support', '£90 an hour', 'Supporting customers with hardware and software erros with associated company products and services.', 'IT', 4, 2),
(3, 'Researcher', '£120,000 a year', 'Working on a 4-6 man research team with other company personnel. Must sign Confidentiality agreement.', 'Research', 5, 3);

-- --------------------------------------------------------

--
-- Stand-in structure for view `LegitimateCandidates`
-- (See below for the actual view)
--
CREATE TABLE `LegitimateCandidates` (
`ID` int(11)
,`Name` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `Locations`
--

CREATE TABLE `Locations` (
  `ID` int(11) NOT NULL,
  `Region` varchar(255) DEFAULT NULL,
  `TownCity` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `PostCode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Locations`
--

INSERT INTO `Locations` (`ID`, `Region`, `TownCity`, `Address`, `PostCode`) VALUES
(1, 'County Antrim', 'Belfast', '27 Gormo Street', 'B6 2GH'),
(2, 'Greater London', 'London', '46 Young Avenue', 'C6 4RT'),
(3, 'Greater Manchester', 'Manchester', '43 Gorotta Road', 'X4 TBH'),
(4, 'Lesser Turin', 'Toggl', '12 Lambast Street', 'Z2 RBH'),
(5, 'Devon', 'Greenberg', '6 Rhododendron Road', 'T3 YUH'),
(6, 'Isling', 'Princeton', '19 Glasmore Street', '4R TBC');

-- --------------------------------------------------------

--
-- Stand-in structure for view `SalaryOrderedJobs`
-- (See below for the actual view)
--
CREATE TABLE `SalaryOrderedJobs` (
`ID` int(11)
,`Name` varchar(255)
,`Salary` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `Skills`
--

CREATE TABLE `Skills` (
  `ID` int(11) NOT NULL,
  `SkillName` varchar(255) DEFAULT NULL,
  `SkillDescription` mediumtext DEFAULT NULL,
  `SkillField` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Skills`
--

INSERT INTO `Skills` (`ID`, `SkillName`, `SkillDescription`, `SkillField`) VALUES
(1, 'Customer expertise', 'Experience with customer-client interactions', 'Interpersonal'),
(2, 'BsC in Computer Science', 'Degree in Computer Science from accredited institution', 'Education'),
(3, 'Project Management experience', 'Experience with managing extended projects and deliverables', 'Management');

-- --------------------------------------------------------

--
-- Table structure for table `Status`
--

CREATE TABLE `Status` (
  `StatusID` int(11) NOT NULL,
  `StatusEnum` enum('ACCEPTED','REJECTED','PENDING') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Status`
--

INSERT INTO `Status` (`StatusID`, `StatusEnum`) VALUES
(1, 'PENDING'),
(2, 'REJECTED'),
(3, 'ACCEPTED');

-- --------------------------------------------------------

--
-- Stand-in structure for view `UpcomingInterviews`
-- (See below for the actual view)
--
CREATE TABLE `UpcomingInterviews` (
`InterviewDate` date
,`CandidateID` int(11)
,`JobID` int(11)
,`StatusEnum` enum('ACCEPTED','REJECTED','PENDING')
);

-- --------------------------------------------------------

--
-- Structure for view `AllJobs`
--
DROP TABLE IF EXISTS `AllJobs`;

CREATE ALGORITHM=UNDEFINED DEFINER=`edickie02`@`localhost` SQL SECURITY DEFINER VIEW `AllJobs`  AS SELECT `Jobs`.`ID` AS `ID`, `Jobs`.`Name` AS `Name`, `Jobs`.`Salary` AS `Salary`, `Jobs`.`Description` AS `Description`, `Jobs`.`Category` AS `Category`, `Jobs`.`LocationID` AS `LocationID`, `Jobs`.`EmployerID` AS `EmployerID` FROM `Jobs` ;

-- --------------------------------------------------------

--
-- Structure for view `EmployerLocationAndContactInfo`
--
DROP TABLE IF EXISTS `EmployerLocationAndContactInfo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`edickie02`@`localhost` SQL SECURITY DEFINER VIEW `EmployerLocationAndContactInfo`  AS SELECT `Employers`.`Name` AS `Name`, `Employers`.`EmployerDescription` AS `EmployerDescription`, `Employers`.`Industry` AS `Industry`, `Employers`.`Website` AS `Website`, `ContactInfo`.`EmailAddress` AS `EmailAddress`, `ContactInfo`.`PhoneNumber` AS `PhoneNumber`, `Locations`.`Address` AS `Address`, `Locations`.`PostCode` AS `PostCode` FROM ((`Employers` join `ContactInfo` on(`Employers`.`ContactID` = `ContactInfo`.`ID`)) join `Locations` on(`Employers`.`LocationID` = `Locations`.`ID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `LegitimateCandidates`
--
DROP TABLE IF EXISTS `LegitimateCandidates`;

CREATE ALGORITHM=UNDEFINED DEFINER=`edickie02`@`localhost` SQL SECURITY DEFINER VIEW `LegitimateCandidates`  AS SELECT `Candidates`.`ID` AS `ID`, `Candidates`.`Name` AS `Name` FROM `Candidates` WHERE `Candidates`.`UnderReview` = '0' ;

-- --------------------------------------------------------

--
-- Structure for view `SalaryOrderedJobs`
--
DROP TABLE IF EXISTS `SalaryOrderedJobs`;

CREATE ALGORITHM=UNDEFINED DEFINER=`edickie02`@`localhost` SQL SECURITY DEFINER VIEW `SalaryOrderedJobs`  AS SELECT `Jobs`.`ID` AS `ID`, `Jobs`.`Name` AS `Name`, `Jobs`.`Salary` AS `Salary` FROM `Jobs` GROUP BY `Jobs`.`Name` ORDER BY max(`Jobs`.`Salary`) ASC ;

-- --------------------------------------------------------

--
-- Structure for view `UpcomingInterviews`
--
DROP TABLE IF EXISTS `UpcomingInterviews`;

CREATE ALGORITHM=UNDEFINED DEFINER=`edickie02`@`localhost` SQL SECURITY DEFINER VIEW `UpcomingInterviews`  AS SELECT `Interviews`.`InterviewDate` AS `InterviewDate`, `Interviews`.`CandidateID` AS `CandidateID`, `Interviews`.`JobID` AS `JobID`, `Status`.`StatusEnum` AS `StatusEnum` FROM (`Interviews` join `Status` on(`Interviews`.`StatusID` = `Status`.`StatusID`)) WHERE `Interviews`.`InterviewDate` >= '20240311' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Candidates`
--
ALTER TABLE `Candidates`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `index_name` (`Name`),
  ADD KEY `LocationID` (`LocationID`),
  ADD KEY `ContactID` (`ContactID`);

--
-- Indexes for table `CandidateSkills`
--
ALTER TABLE `CandidateSkills`
  ADD PRIMARY KEY (`CandidateID`),
  ADD KEY `CandidateSkillsIndex` (`SkillID`);

--
-- Indexes for table `ContactInfo`
--
ALTER TABLE `ContactInfo`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Employers`
--
ALTER TABLE `Employers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `EMPLOYERINDEX` (`Name`,`Industry`,`LocationID`),
  ADD KEY `LocationID` (`LocationID`),
  ADD KEY `ContactID` (`ContactID`);

--
-- Indexes for table `Interviews`
--
ALTER TABLE `Interviews`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CandidateID` (`CandidateID`),
  ADD KEY `JobID` (`JobID`),
  ADD KEY `InterviewsIndex` (`InterviewDate`,`CandidateID`,`JobID`,`StatusID`),
  ADD KEY `StatusID` (`StatusID`);

--
-- Indexes for table `JobApplications`
--
ALTER TABLE `JobApplications`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ApplicationINdex` (`CandidateID`),
  ADD KEY `JobID` (`JobID`),
  ADD KEY `StatusID` (`StatusID`);

--
-- Indexes for table `Jobs`
--
ALTER TABLE `Jobs`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `JobsIndex` (`Name`,`Salary`,`Category`),
  ADD KEY `EmployerID` (`EmployerID`),
  ADD KEY `LocationID` (`LocationID`);

--
-- Indexes for table `Locations`
--
ALTER TABLE `Locations`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `LocationsIndex` (`Region`,`TownCity`,`PostCode`);

--
-- Indexes for table `Skills`
--
ALTER TABLE `Skills`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SkillIndex` (`SkillName`,`SkillField`);

--
-- Indexes for table `Status`
--
ALTER TABLE `Status`
  ADD PRIMARY KEY (`StatusID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Candidates`
--
ALTER TABLE `Candidates`
  ADD CONSTRAINT `Candidates_ibfk_1` FOREIGN KEY (`ContactID`) REFERENCES `ContactInfo` (`ID`),
  ADD CONSTRAINT `Candidates_ibfk_2` FOREIGN KEY (`ContactID`) REFERENCES `ContactInfo` (`ID`),
  ADD CONSTRAINT `Candidates_ibfk_3` FOREIGN KEY (`ContactID`) REFERENCES `ContactInfo` (`ID`),
  ADD CONSTRAINT `Candidates_ibfk_4` FOREIGN KEY (`ContactID`) REFERENCES `ContactInfo` (`ID`),
  ADD CONSTRAINT `Candidates_ibfk_5` FOREIGN KEY (`LocationID`) REFERENCES `Locations` (`ID`),
  ADD CONSTRAINT `Candidates_ibfk_6` FOREIGN KEY (`ContactID`) REFERENCES `ContactInfo` (`ID`),
  ADD CONSTRAINT `LocationID` FOREIGN KEY (`LocationID`) REFERENCES `Locations` (`ID`);

--
-- Constraints for table `CandidateSkills`
--
ALTER TABLE `CandidateSkills`
  ADD CONSTRAINT `CandidateSkills_ibfk_1` FOREIGN KEY (`CandidateID`) REFERENCES `Candidates` (`ID`),
  ADD CONSTRAINT `CandidateSkills_ibfk_2` FOREIGN KEY (`SkillID`) REFERENCES `Skills` (`ID`);

--
-- Constraints for table `Employers`
--
ALTER TABLE `Employers`
  ADD CONSTRAINT `Employers_ibfk_1` FOREIGN KEY (`LocationID`) REFERENCES `Locations` (`ID`),
  ADD CONSTRAINT `Employers_ibfk_2` FOREIGN KEY (`ContactID`) REFERENCES `ContactInfo` (`ID`);

--
-- Constraints for table `Interviews`
--
ALTER TABLE `Interviews`
  ADD CONSTRAINT `Interviews_ibfk_1` FOREIGN KEY (`CandidateID`) REFERENCES `Candidates` (`ID`),
  ADD CONSTRAINT `Interviews_ibfk_2` FOREIGN KEY (`JobID`) REFERENCES `Jobs` (`ID`),
  ADD CONSTRAINT `Interviews_ibfk_3` FOREIGN KEY (`StatusID`) REFERENCES `Status` (`StatusID`);

--
-- Constraints for table `JobApplications`
--
ALTER TABLE `JobApplications`
  ADD CONSTRAINT `JobApplications_ibfk_1` FOREIGN KEY (`CandidateID`) REFERENCES `Candidates` (`ID`),
  ADD CONSTRAINT `JobApplications_ibfk_2` FOREIGN KEY (`JobID`) REFERENCES `Jobs` (`ID`),
  ADD CONSTRAINT `JobApplications_ibfk_3` FOREIGN KEY (`StatusID`) REFERENCES `Status` (`StatusID`);

--
-- Constraints for table `Jobs`
--
ALTER TABLE `Jobs`
  ADD CONSTRAINT `Jobs_ibfk_1` FOREIGN KEY (`EmployerID`) REFERENCES `Employers` (`ID`),
  ADD CONSTRAINT `Jobs_ibfk_2` FOREIGN KEY (`LocationID`) REFERENCES `Locations` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
