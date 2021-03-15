CREATE DATABASE  IF NOT EXISTS `alumanagementsystem` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `alumanagementsystem`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: universitymanagementsystem
-- ------------------------------------------------------
-- Server version	5.6.16-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administration`
--

DROP TABLE IF EXISTS `administration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administration` (
  `administratorID` int(11) NOT NULL,
  `designation` varchar(45) NOT NULL,
  PRIMARY KEY (`administratorID`),
  CONSTRAINT `fk_administratorID_admin` FOREIGN KEY (`administratorID`) REFERENCES `employee` (`employeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administration`
--

LOCK TABLES `administration` WRITE;
/*!40000 ALTER TABLE `administration` DISABLE KEYS */;
INSERT INTO `administration` VALUES (4006,'Director of Counseling and Health Services'),(4008,'Director of Finance Department');
/*!40000 ALTER TABLE `administration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment` (
  `assignmentID` int(11) NOT NULL,
  `sectionID` int(11) NOT NULL,
  `description` varchar(45) NOT NULL,
  `deadlineDate` date NOT NULL,
  `deadlineTime` time NOT NULL,
  `possiblePoints` tinyint(4) NOT NULL,
  PRIMARY KEY (`assignmentID`),
  KEY `fk_sectionID_idx` (`sectionID`),
  CONSTRAINT `fk_sectionID_assignment` FOREIGN KEY (`sectionID`) REFERENCES `section` (`sectionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (2000050,20000,'aed1hw','2021-04-18','23:59:59',100),(2001050,20010,'wd1hw','2014-04-19','23:59:59',100),(2001150,20011,'wd2hw','2014-04-20','00:00:00',100),(2002050,20020,'ba1hw','2014-04-21','23:00:00',50),(2003050,20030,'db1hw','2014-04-22','23:59:59',100),(2004050,20040,'wt1hw','2014-04-22','23:59:59',100),(2005050,20050,'ne1hw','2014-04-23','23:59:59',100);
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `buildingID` int(11) NOT NULL,
  `buildingName` varchar(45) NOT NULL,
  PRIMARY KEY (`buildingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (50,'Tanzania'),(51,'Ghana'),(52,'Kenya'),(53,'Togo'),(54,'Morocco');
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `courseID` int(11) NOT NULL,
  `courseName` varchar(45) NOT NULL,
  `credits` smallint(6) NOT NULL,
  `hours` smallint(6) NOT NULL,
  `description` varchar(45) NOT NULL,
  `departmentID` int(11) NOT NULL,
  `No_of_Classes` smallint(6) NOT NULL,
  `No_of_Seats` smallint(6) NOT NULL,
  PRIMARY KEY (`courseID`),
  KEY `fk_departmentID_idx` (`departmentID`),
  KEY `course_Idx` (`courseID`),
  CONSTRAINT `fk_departmentID_course` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (2000,'Application Engineering',4,60,'AED',100,10,120),(2001,'Web Design',4,60,'WD',100,20,30),(2002,'Business Analysis',4,60,'BA',101,12,40),(2003,'Database Management',4,70,'DB',100,11,80),(2004,'Web Tools',4,80,'WT',102,22,60),(2005,'Network Engineering',4,40,'NE',101,18,100),(2006,'Project Management',4,75,'PM',100,25,40);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_has_prerequisite`
--

DROP TABLE IF EXISTS `course_has_prerequisite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_has_prerequisite` (
  `courseID` int(11) NOT NULL,
  `prerequisiteID` int(11) NOT NULL,
  PRIMARY KEY (`courseID`,`prerequisiteID`),
  KEY `fk_course_has_prerequisite_prerequisite1_idx` (`prerequisiteID`),
  KEY `fk_course_has_prerequisite_course1_idx` (`courseID`),
  CONSTRAINT `fk_course_has_prerequisite_course1` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseid`),
  CONSTRAINT `fk_course_has_prerequisite_prerequisite1` FOREIGN KEY (`prerequisiteID`) REFERENCES `prerequisite` (`prerequisiteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_has_prerequisite`
--

LOCK TABLES `course_has_prerequisite` WRITE;
/*!40000 ALTER TABLE `course_has_prerequisite` DISABLE KEYS */;
INSERT INTO `course_has_prerequisite` VALUES (2004,2001),(2006,2002),(2000,2003),(2005,2003);
/*!40000 ALTER TABLE `course_has_prerequisite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `departmentID` int(11) NOT NULL,
  `departmentName` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  `budget` varchar(45) NOT NULL,
  `officeNo` varchar(15) NOT NULL,
  PRIMARY KEY (`departmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (100,'College of Engineering','This is a Graduate School.','10000','2541369857'),(101,'College of Computer Science','This is a Graduate School','20000','6541232589'),(102,'College of Professional Studies','Thsi is an Undergraduate and Graduate School','30000','5412879632'),(103,'Department of Finance','Maintains staff and student Finance records','1000','7531598524'),(104,'Department of Registrar','Maintain student and staff record','1000','3571598745'),(105,'Department of Health Services','Maintain insurance record of students','3000','1233211232'),(106,'Library Affairs','Library maintainance','10000','1235245232');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employeeID` int(11) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `middleName` varchar(45) DEFAULT NULL,
  `contactNo` varchar(15) NOT NULL,
  `address` varchar(45) NOT NULL,
  `hiringDate` date NOT NULL,
  `ssn` varchar(9) NOT NULL,
  `departmentID` int(11) NOT NULL,
  PRIMARY KEY (`employeeID`),
  KEY `fk_departmentID_idx` (`departmentID`),
  CONSTRAINT `fk_departmentID_employee` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (4000,'Lino','Lemelin',NULL,'1474147414','Kigali','2013-12-12','147414741',100),(4001,'Kandra','Kellems',NULL,'2587412587','Kigali','2012-03-26','258741258',101),(4002,'Micha','Matsui',NULL,'7898789878','Kigali','2011-08-08','258741255',102),(4003,'Jessia','July',NULL,'1020304050','Nairobi','2010-09-09','102030101',103),(4004,'Torri','Toledo',NULL,'6541230145','Nairobi','2009-02-02','654123010',100),(4005,'Catherina','Clement',NULL,'9515951595','Nairobi','2008-06-06','159515951',104),(4006,'Lindsey','Legendre',NULL,'7535753575','Kigali','2007-12-12','125634785',105),(4007,'Lorine','Larger',NULL,'4569852369','Kigali','2006-04-04','412563254',102),(4008,'James','Johanson',NULL,'5874587458','Kigali','2013-06-28','785478547',105);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_salarydetails`
--

DROP TABLE IF EXISTS `employee_salarydetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_salarydetails` (
  `accountID` int(11) NOT NULL,
  `date_on_bill` date NOT NULL,
  `employeeID` int(11) NOT NULL,
  `accountName` varchar(45) NOT NULL,
  `salary` float NOT NULL,
  `deductions` float NOT NULL,
  `tax` float NOT NULL,
  PRIMARY KEY (`accountID`,`date_on_bill`),
  KEY `fk_employeeID_salary_idx` (`employeeID`),
  CONSTRAINT `fk_employeeID_salary` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_salarydetails`
--

LOCK TABLES `employee_salarydetails` WRITE;
/*!40000 ALTER TABLE `employee_salarydetails` DISABLE KEYS */;
INSERT INTO `employee_salarydetails` VALUES (125,'2014-02-02',4002,'santander',110000,0,13),(258,'2013-02-01',4001,'citizen',100000,25,12.25),(745,'2012-11-14',4000,'boa',119500,0,13.75),(745,'2012-12-12',4000,'boa',120000,75,13.75);
/*!40000 ALTER TABLE `employee_salarydetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facilitator`
--

DROP TABLE IF EXISTS `facilitator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facilitator` (
  `facilitatorID` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`facilitatorID`),
  CONSTRAINT `fk_facilitatorID` FOREIGN KEY (`facilitatorID`) REFERENCES `employee` (`employeeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilitator`
--

LOCK TABLES `facilitator` WRITE;
/*!40000 ALTER TABLE `facilitator` DISABLE KEYS */;
INSERT INTO `facilitator` VALUES (4000,'lino@alueducation.com'),(4001,'kandra@alueducation.com'),(4002,'micha@aol.com'),(4004,'torri@yahoo.com'),(4007,'lorine@alueducation.com');
/*!40000 ALTER TABLE `facilitator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradereport`
--

DROP TABLE IF EXISTS `gradereport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gradereport` (
  `reportID` int(11) NOT NULL,
  `courseID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `attempt` tinyint(4) NOT NULL DEFAULT '1',
  `letterGrade` enum('A','A-','B+','B','B-','C+','C','F') NOT NULL,
  `numericGrade` float NOT NULL,
  `semester` varchar(45) NOT NULL,
  `year` year(4) NOT NULL,
  PRIMARY KEY (`reportID`),
  KEY `fk_studentID_idx` (`studentID`),
  KEY `fk_courseID_idx` (`courseID`),
  CONSTRAINT `fk_courseID_report` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseid`),
  CONSTRAINT `fk_studentID_report` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradereport`
--

LOCK TABLES `gradereport` WRITE;
/*!40000 ALTER TABLE `gradereport` DISABLE KEYS */;
INSERT INTO `gradereport` VALUES (101010,2000,1907894,1,'C',2.4,'Fall',2021),(101011,2000,1907894,2,'A-',3.7,'Spring',2021),(101012,2001,1907894,1,'B+',3.4,'Fall',2021),(101013,2001,1907895,1,'B',3,'Fall',2021),(101014,2002,1907896,1,'A-',3.7,'Summer',2021),(101015,2002,1907897,1,'A',4,'Fall ',2021),(101016,2002,1907898,1,'A',4,'Fall',2020),(101017,2003,1907898,1,'A-',3.7,'Fall',2020),(101018,2004,1907899,1,'B',3,'Fall',2020),(101019,2005,1907900,1,'A',4,'Fall',2020);
/*!40000 ALTER TABLE `gradereport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guardian`
--

DROP TABLE IF EXISTS `guardian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guardian` (
  `guardianID` int(11) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `middleName` varchar(45) DEFAULT NULL,
  `address` varchar(45) NOT NULL,
  `contactNo` varchar(15) NOT NULL,
  PRIMARY KEY (`guardianID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guardian`
--

LOCK TABLES `guardian` WRITE;
/*!40000 ALTER TABLE `guardian` DISABLE KEYS */;
INSERT INTO `guardian` VALUES (1000,'Donna','Kinnear',NULL,'Kigali','7894561373'),(1001,'Carlo','Kensinger','Sam','Kigali','9874563215'),(1002,'Oliver','Fondren',NULL,'Kigali','7412589632'),(1003,'Claris','Spotts','Samuel','Kigali','6547893215'),(1004,'Tona','Doxey',NULL,'Kigali','3214568524'),(1005,'Nakesha','Michael',NULL,'Kigali','7413698524');
/*!40000 ALTER TABLE `guardian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `roomID` smallint(6) NOT NULL,
  `roomName` varchar(45) NOT NULL,
  `buildingID` int(11) NOT NULL,
  `capacity` tinyint(4) NOT NULL,
  PRIMARY KEY (`roomID`),
  KEY `fk_buildingID_idx` (`buildingID`),
  CONSTRAINT `fk_buildingID_room` FOREIGN KEY (`buildingID`) REFERENCES `building` (`buildingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (500,'room1',50,50),(510,'room1',51,50),(520,'room1',52,60),(521,'room2',52,80),(530,'room1',53,100);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `sectionID` int(11) NOT NULL,
  `courseID` int(11) NOT NULL,
  `sectionName` varchar(45) NOT NULL,
  `facilitatorID` int(11) NOT NULL,
  PRIMARY KEY (`sectionID`),
  KEY `fk_courseID_idx` (`courseID`),
  KEY `fk_facilitatorID_idx` (`facilitatorID`),
  KEY `section_Idx` (`sectionID`),
  CONSTRAINT `fk_courseID_section` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseid`),
  CONSTRAINT `fk_facilitatorID_section` FOREIGN KEY (`facilitatorID`) REFERENCES `facilitator` (`facilitatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (20000,2000,'AED1',4000),(20010,2001,'WD1',4000),(20011,2001,'WD2',4000),(20020,2002,'BA1',4001),(20030,2003,'DB1',4004),(20040,2004,'WT1',4007),(20050,2005,'NE1',4001);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_dayslot`
--

DROP TABLE IF EXISTS `section_dayslot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section_dayslot` (
  `day` varchar(10) NOT NULL,
  `sectionID` int(11) NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  PRIMARY KEY (`day`,`sectionID`),
  KEY `fk_sectionID_idx` (`sectionID`),
  CONSTRAINT `fk_sectionID_slot` FOREIGN KEY (`sectionID`) REFERENCES `section` (`sectionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_dayslot`
--

LOCK TABLES `section_dayslot` WRITE;
/*!40000 ALTER TABLE `section_dayslot` DISABLE KEYS */;
INSERT INTO `section_dayslot` VALUES ('Fri',20000,'14:00:00','15:00:00'),('Fri',20011,'13:30:00','15:30:00'),('Mon',20010,'14:00:00','16:00:00'),('Tue',20011,'13:30:00','15:30:00'),('Wed',20010,'14:00:00','16:00:00');
/*!40000 ALTER TABLE `section_dayslot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_in_building`
--

DROP TABLE IF EXISTS `section_in_building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section_in_building` (
  `sectionID` int(11) NOT NULL,
  `buildingID` int(11) NOT NULL,
  PRIMARY KEY (`sectionID`,`buildingID`),
  KEY `fk_section_has_building_building1_idx` (`buildingID`),
  KEY `fk_section_has_building_section1_idx` (`sectionID`),
  CONSTRAINT `fk_section_has_building_building1` FOREIGN KEY (`buildingID`) REFERENCES `building` (`buildingid`),
  CONSTRAINT `fk_section_has_building_section1` FOREIGN KEY (`sectionID`) REFERENCES `section` (`sectionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_in_building`
--

LOCK TABLES `section_in_building` WRITE;
/*!40000 ALTER TABLE `section_in_building` DISABLE KEYS */;
INSERT INTO `section_in_building` VALUES (20000,50),(20030,50),(20010,51),(20040,51),(20011,52),(20020,53);
/*!40000 ALTER TABLE `section_in_building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studentID` int(11) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `middleName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) NOT NULL,
  `ssn` varchar(9) DEFAULT NULL,
  `dob` date NOT NULL,
  `currentAddress` varchar(45) NOT NULL,
  `sex` enum('Male','Female') NOT NULL,
  `currentPhoneNo` varchar(15) NOT NULL,
  `email` varchar(45) NOT NULL,
  `departmentID` int(11) NOT NULL,
  `guadianID` int(11) NOT NULL,
  PRIMARY KEY (`studentID`),
  KEY `fk_departmentID_idx` (`departmentID`),
  KEY `fk_guardianID_idx` (`guadianID`),
  KEY `student_Idx` (`studentID`),
  CONSTRAINT `fk_departmentID_student` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentid`),
  CONSTRAINT `fk_guardianID_student` FOREIGN KEY (`guadianID`) REFERENCES `guardian` (`guardianid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1907894,'Judith',NULL,'Mucyo',NULL,'1990-03-12','Kigali','Female','1236541256','judith@alustudent.com',101,1000),(1907895,'Paladie',NULL,'Murungu',NULL,'1991-12-25','Kigali','Female','5478547854','ronny@alustudent.com',101,1001),(1907896,'Mayra','','Harare',NULL,'1992-06-06','Harare','Female','1233214565','mayra@alustudent.com',102,1002),(1907897,'Tona',NULL,'Bekesa',NULL,'1985-05-05','Harare','Female','4566544569','tona@alustudent.com',102,1002),(1907898,'Maria',NULL,'Sakala',NULL,'1992-07-25','Harare','Female','5412145632','maria@alustudent.com',101,1003),(1907899,'Wilbur',NULL,'Sibanda',NULL,'1993-08-08','Kigali','Male','2585258525','wilbur@alustudent.com',100,1004),(1907900,'Christian','Sal','Uwase','789654123','1994-02-01','Harare','Male','7458963215','christian@alustudent.com',101,1005),(1907901,'Shelley',NULL,'Taiwo','654456987','1991-03-24','Harare','Female','6544569877','shelley@alustudent.com',100,1005);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_maintains_attendance`
--

DROP TABLE IF EXISTS `student_maintains_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_maintains_attendance` (
  `studentID` int(11) NOT NULL,
  `courseID` int(11) NOT NULL,
  `date` date NOT NULL,
  `count` smallint(6) NOT NULL,
  PRIMARY KEY (`studentID`,`courseID`,`date`),
  KEY `fk_courseID_idx` (`courseID`),
  CONSTRAINT `fk_courseID_attendance` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseid`),
  CONSTRAINT `fk_studentID_attendance` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_maintains_attendance`
--

LOCK TABLES `student_maintains_attendance` WRITE;
/*!40000 ALTER TABLE `student_maintains_attendance` DISABLE KEYS */;
INSERT INTO `student_maintains_attendance` VALUES (1907894,2000,'2013-07-07',7),(1907894,2000,'2014-08-25',9),(1907894,2001,'2013-09-25',18),(1907895,2001,'2013-09-12',19);
/*!40000 ALTER TABLE `student_maintains_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_registers_courses`
--

DROP TABLE IF EXISTS `student_registers_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_registers_courses` (
  `studentID` int(11) NOT NULL,
  `courseID` int(11) NOT NULL,
  `registrationDate` date NOT NULL,
  PRIMARY KEY (`studentID`,`courseID`,`registrationDate`),
  KEY `fk_student_has_course_course1_idx` (`courseID`),
  KEY `fk_student_has_course_student1_idx` (`studentID`),
  CONSTRAINT `fk_student_has_course_course1` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseid`),
  CONSTRAINT `fk_student_has_course_student1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_registers_courses`
--

LOCK TABLES `student_registers_courses` WRITE;
/*!40000 ALTER TABLE `student_registers_courses` DISABLE KEYS */;
INSERT INTO `student_registers_courses` VALUES (1907894,2000,'2021-04-07'),(1907894,2000,'2021-05-10'),(1907894,2001,'2021-04-07'),(1907895,2001,'2021-04-23'),(1907896,2002,'2021-06-28'),(1907897,2002,'2021-08-17'),(1907898,2002,'2021-05-22'),(1907898,2003,'2021-05-21'),(1907899,2004,'2021-05-20'),(1907900,2005,'2021-04-29');
/*!40000 ALTER TABLE `student_registers_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_submit_assignment`
--

DROP TABLE IF EXISTS `student_submit_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_submit_assignment` (
  `assignmentID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `evaluationDate` date DEFAULT NULL,
  `pointsObtained` tinyint(4) DEFAULT NULL,
  `writtenEvaluation` varchar(45) DEFAULT '-',
  `submissionDate` date NOT NULL,
  `submissionTime` time NOT NULL,
  PRIMARY KEY (`assignmentID`,`studentID`),
  KEY `fk_studentID_idx` (`studentID`),
  CONSTRAINT `fk_assignmentID_submit` FOREIGN KEY (`assignmentID`) REFERENCES `assignment` (`assignmentid`),
  CONSTRAINT `fk_studentID_submit` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_submit_assignment`
--

LOCK TABLES `student_submit_assignment` WRITE;
/*!40000 ALTER TABLE `student_submit_assignment` DISABLE KEYS */;
INSERT INTO `student_submit_assignment` VALUES (2000050,1907894,'2014-04-19',99,'great job','2021-04-18','23:00:00'),(2000050,1907895,'2014-04-11',100,'-','2014-04-19','22:00:00'),(2000050,1907896,NULL,NULL,'-','2014-04-10','21:00:00'),(2001050,1907895,'2014-04-20',90,'null pointer in q1','2014-04-19','22:20:20'),(2001050,1907896,'2014-04-20',92,'null pointer in q2','2014-04-20','12:20:20'),(2002050,1907897,'2014-04-25',45,'-','2014-04-21','23:00:01'),(2002050,1907898,NULL,NULL,'-','2014-04-22','05:05:05'),(2005050,1907897,'2014-04-30',95,'-','2014-04-23','23:59:58');
/*!40000 ALTER TABLE `student_submit_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `student_view`
--

DROP TABLE IF EXISTS `student_view`;
/*!50001 DROP VIEW IF EXISTS `student_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `student_view` (
  `firstName` tinyint NOT NULL,
  `courseName` tinyint NOT NULL,
  `sectionID` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `count` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `student_view`
--

/*!50001 DROP TABLE IF EXISTS `student_view`*/;
/*!50001 DROP VIEW IF EXISTS `student_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `student_view` AS (select `s`.`firstName` AS `firstName`,`c`.`courseName` AS `courseName`,`se`.`sectionID` AS `sectionID`,`a`.`description` AS `description`,`sma`.`count` AS `count` from (((((`student` `s` join `student_registers_courses`) join `course` `c`) join `section` `se`) join `assignment` `a`) join `student_maintains_attendance` `sma`) where ((`s`.`studentID` = `student_registers_courses`.`studentID`) and (`student_registers_courses`.`courseID` = `c`.`courseID`) and (`c`.`courseID` = `se`.`courseID`) and (`se`.`sectionID` = `a`.`sectionID`) and (`sma`.`studentID` = `s`.`studentID`) and (`sma`.`courseID` = `c`.`courseID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


















