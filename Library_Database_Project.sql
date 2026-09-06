-- MySQL dump 10.13  Distrib 8.0.46, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: cs311_library
-- ------------------------------------------------------
-- Server version	9.6.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '26fb6930-36ac-11f1-b7e2-b4c4ba57838e:1-417';

--
-- Table structure for table `Book`
--

DROP TABLE IF EXISTS `Book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Book` (
  `Book_ID` varchar(50) NOT NULL,
  `Title` varchar(200) NOT NULL,
  `Author` varchar(100) NOT NULL,
  `ISBN` varchar(50) NOT NULL,
  `Publisher` varchar(100) DEFAULT NULL,
  `Year` int DEFAULT NULL,
  `Status` varchar(50) DEFAULT 'Available',
  `Category_ID` int DEFAULT NULL,
  PRIMARY KEY (`Book_ID`),
  UNIQUE KEY `ISBN` (`ISBN`),
  KEY `Category_ID` (`Category_ID`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`Category_ID`) REFERENCES `Category` (`Category_ID`),
  CONSTRAINT `book_chk_1` CHECK (((`Year` >= 1900) and (`Year` <= 2026))),
  CONSTRAINT `book_chk_2` CHECK ((`Status` in (_utf8mb4'Available',_utf8mb4'Borrowed',_utf8mb4'Lost')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Book`
--

LOCK TABLES `Book` WRITE;
/*!40000 ALTER TABLE `Book` DISABLE KEYS */;
INSERT INTO `Book` VALUES ('BK_1','Database System Concepts','Abraham Silberschatz','978-1111','McGraw-Hill',2024,'Available',1),('BK_10','Introduction to Algorithms','Thomas Cormen','978-1010','MIT Press',2024,'Available',10),('BK_2','Software Engineering Principles','Ian Sommerville','978-2222','Pearson',2025,'Available',2),('BK_3','Operating System Concepts','Peter Galvin','978-3333','Wiley',2024,'Borrowed',3),('BK_4','Computer Networking: Top-Down Approach','James Kurose','978-4444','Pearson',2023,'Available',4),('BK_5','Computer Security Principles','William Stallings','978-5555','Pearson',2024,'Borrowed',5),('BK_6','Artificial Intelligence: A Modern Approach','Stuart Russell','978-6666','Pearson',2023,'Available',6),('BK_7','Embedded Systems Architecture','Tammie Noergaard','978-7777','Elsevier',2022,'Available',7),('BK_8','Python for Data Analysis','Wes McKinney','978-8888','O Reilly',2023,'Borrowed',8),('BK_9','Learning Web Design','Jennifer Robbins','978-9999','O Reilly',2022,'Available',9);
/*!40000 ALTER TABLE `Book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Book_Update`
--

DROP TABLE IF EXISTS `Book_Update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Book_Update` (
  `Update_ID` varchar(50) NOT NULL,
  `Book_ID` varchar(50) NOT NULL,
  `Employee_ID` int NOT NULL,
  `Update_Date` date NOT NULL,
  PRIMARY KEY (`Update_ID`),
  KEY `Book_ID` (`Book_ID`),
  KEY `Employee_ID` (`Employee_ID`),
  CONSTRAINT `book_update_ibfk_1` FOREIGN KEY (`Book_ID`) REFERENCES `Book` (`Book_ID`),
  CONSTRAINT `book_update_ibfk_2` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Book_Update`
--

LOCK TABLES `Book_Update` WRITE;
/*!40000 ALTER TABLE `Book_Update` DISABLE KEYS */;
INSERT INTO `Book_Update` VALUES ('UP_1','BK_1',44515,'2026-07-01'),('UP_10','BK_10',44323,'2026-07-25'),('UP_2','BK_2',44315,'2026-07-15'),('UP_3','BK_5',44316,'2026-07-18'),('UP_4','BK_3',44317,'2026-07-19'),('UP_5','BK_4',44318,'2026-07-20'),('UP_6','BK_6',44319,'2026-07-21'),('UP_7','BK_7',44320,'2026-07-22'),('UP_8','BK_8',44321,'2026-07-23'),('UP_9','BK_9',44322,'2026-07-24');
/*!40000 ALTER TABLE `Book_Update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Borrow`
--

DROP TABLE IF EXISTS `Borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Borrow` (
  `Borrow_ID` varchar(50) NOT NULL,
  `Borrow_Date` date NOT NULL,
  `Due_Date` date NOT NULL,
  `Book_ID` varchar(50) NOT NULL,
  `Student_ID` int NOT NULL,
  PRIMARY KEY (`Borrow_ID`),
  KEY `Book_ID` (`Book_ID`),
  KEY `Student_ID` (`Student_ID`),
  CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`Book_ID`) REFERENCES `Book` (`Book_ID`),
  CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`Student_ID`) REFERENCES `Student` (`Student_ID`),
  CONSTRAINT `borrow_chk_1` CHECK ((`Due_Date` >= `Borrow_Date`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Borrow`
--

LOCK TABLES `Borrow` WRITE;
/*!40000 ALTER TABLE `Borrow` DISABLE KEYS */;
INSERT INTO `Borrow` VALUES ('BR_1','2026-07-20','2026-07-27','BK_1',451500543),('BR_10','2026-07-30','2026-08-06','BK_10',451500107),('BR_2','2026-07-21','2026-07-28','BK_3',451500603),('BR_3','2026-07-10','2026-07-17','BK_5',451500569),('BR_4','2026-07-15','2026-07-22','BK_8',451500101),('BR_5','2026-07-25','2026-08-01','BK_2',451500102),('BR_6','2026-07-26','2026-08-02','BK_4',451500103),('BR_7','2026-07-27','2026-08-03','BK_6',451500104),('BR_8','2026-07-28','2026-08-04','BK_7',451500105),('BR_9','2026-07-29','2026-08-05','BK_9',451500106);
/*!40000 ALTER TABLE `Borrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Category` (
  `Category_ID` int NOT NULL,
  `Category_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`Category_ID`),
  UNIQUE KEY `Category_Name` (`Category_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES (10,'Algorithms & Data Structures'),(6,'Artificial Intelligence'),(4,'Computer Networks'),(5,'Cybersecurity'),(8,'Data Science'),(1,'Database Systems'),(7,'Embedded Systems'),(3,'Operating Systems'),(2,'Software Engineering'),(9,'Web Development');
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `Employee_ID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Position` varchar(50) NOT NULL DEFAULT 'Staff',
  `Manager_ID` int DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `Manager_ID` (`Manager_ID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Manager_ID`) REFERENCES `Manager` (`Manager_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (44315,'Rawan Al-Dosari','rawan@lib.com','Assistant',101),(44316,'Huda Al-Qahtani','huda@lib.com','Cataloger',101),(44317,'Fatimah Al-Tamimi','fatimah@lib.com','Circulation Clerk',102),(44318,'Nouf Al-Anzi','nouf@lib.com','Assistant Librarian',102),(44319,'Reem Al-Malki','reem@lib.com','IT Support',103),(44320,'Amal Al-Shammari','amal@lib.com','Archivist',104),(44321,'Laila Al-Qarni','laila@lib.com','Librarian',105),(44322,'Sara Al-Asiri','sara.emp@lib.com','Assistant',106),(44323,'Nawal Al-Thobiti','nawal@lib.com','Clerk',107),(44515,'Mona Al-Subaie','mona@lib.com','Librarian',101);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Manager`
--

DROP TABLE IF EXISTS `Manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Manager` (
  `Manager_ID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Office` varchar(50) DEFAULT 'Main Office',
  PRIMARY KEY (`Manager_ID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manager`
--

LOCK TABLES `Manager` WRITE;
/*!40000 ALTER TABLE `Manager` DISABLE KEYS */;
INSERT INTO `Manager` VALUES (101,'Dr. Kajal Nusratullah','kajal@yic.edu.sa','Main Office A-10'),(102,'Dr. Ahmed Al-Ahmadi','a.ahmadi@yic.edu.sa','Admin Office B-05'),(103,'Dr. Sarah Smith','ssmith@yic.edu.sa','Office A-11'),(104,'Dr. Ali Hassan','ahassan@yic.edu.sa','Office B-06'),(105,'Dr. Mona Zaki','mzaki@yic.edu.sa','Office A-12'),(106,'Dr. Yasser Omar','yomar@yic.edu.sa','Office B-07'),(107,'Dr. Huda Khaled','hkhaled@yic.edu.sa','Office A-13'),(108,'Dr. Sami Saeed','ssaeed@yic.edu.sa','Office B-08'),(109,'Dr. Nada Tariq','ntariq@yic.edu.sa','Office A-14'),(110,'Dr. Fahad Salem','fsalem@yic.edu.sa','Office B-09');
/*!40000 ALTER TABLE `Manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Return`
--

DROP TABLE IF EXISTS `Return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Return` (
  `Return_ID` varchar(50) NOT NULL,
  `Return_Date` date NOT NULL,
  `Borrow_ID` varchar(50) NOT NULL,
  `Employee_ID` int NOT NULL,
  `Fine` decimal(10,2) DEFAULT '0.00',
  `Book_ID` varchar(50) NOT NULL,
  PRIMARY KEY (`Return_ID`),
  KEY `Borrow_ID` (`Borrow_ID`),
  KEY `Employee_ID` (`Employee_ID`),
  KEY `Book_ID` (`Book_ID`),
  CONSTRAINT `return_ibfk_1` FOREIGN KEY (`Borrow_ID`) REFERENCES `Borrow` (`Borrow_ID`),
  CONSTRAINT `return_ibfk_2` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`),
  CONSTRAINT `return_ibfk_3` FOREIGN KEY (`Book_ID`) REFERENCES `Book` (`Book_ID`),
  CONSTRAINT `return_chk_1` CHECK ((`Fine` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Return`
--

LOCK TABLES `Return` WRITE;
/*!40000 ALTER TABLE `Return` DISABLE KEYS */;
INSERT INTO `Return` VALUES ('RET_1','2026-07-28','BR_1',44515,15.50,'BK_1'),('RET_10','2026-08-07','BR_10',44322,0.00,'BK_10'),('RET_2','2026-07-20','BR_3',44315,25.00,'BK_5'),('RET_3','2026-07-22','BR_4',44515,0.00,'BK_8'),('RET_4','2026-07-29','BR_2',44316,5.00,'BK_3'),('RET_5','2026-08-01','BR_5',44317,0.00,'BK_2'),('RET_6','2026-08-03','BR_6',44318,10.00,'BK_4'),('RET_7','2026-08-05','BR_7',44319,0.00,'BK_6'),('RET_8','2026-08-05','BR_8',44320,15.00,'BK_7'),('RET_9','2026-08-06','BR_9',44321,0.00,'BK_9');
/*!40000 ALTER TABLE `Return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room_Booking`
--

DROP TABLE IF EXISTS `Room_Booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Room_Booking` (
  `Booking_ID` varchar(50) NOT NULL,
  `Student_ID` int NOT NULL,
  `Room_ID` varchar(50) NOT NULL,
  `Booking_Date` date NOT NULL,
  `Start_Time` time NOT NULL,
  `End_Time` time NOT NULL,
  `Employee_ID` int NOT NULL,
  PRIMARY KEY (`Booking_ID`),
  KEY `Student_ID` (`Student_ID`),
  KEY `Room_ID` (`Room_ID`),
  KEY `Employee_ID` (`Employee_ID`),
  CONSTRAINT `room_booking_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `Student` (`Student_ID`),
  CONSTRAINT `room_booking_ibfk_2` FOREIGN KEY (`Room_ID`) REFERENCES `Study_Room` (`Room_ID`),
  CONSTRAINT `room_booking_ibfk_3` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`),
  CONSTRAINT `room_booking_chk_1` CHECK ((`Start_Time` < `End_Time`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room_Booking`
--

LOCK TABLES `Room_Booking` WRITE;
/*!40000 ALTER TABLE `Room_Booking` DISABLE KEYS */;
INSERT INTO `Room_Booking` VALUES ('RB_1',451500543,'R101','2026-07-22','10:00:00','12:00:00',44515),('RB_10',451500107,'R101','2026-08-01','10:00:00','12:00:00',44322),('RB_2',451500603,'R102','2026-07-25','13:00:00','15:00:00',44515),('RB_3',451500569,'R101','2026-07-23','09:00:00','11:00:00',44315),('RB_4',451500101,'R103','2026-07-26','14:00:00','16:00:00',44316),('RB_5',451500102,'R104','2026-07-27','11:00:00','13:00:00',44317),('RB_6',451500103,'R106','2026-07-28','08:00:00','10:00:00',44318),('RB_7',451500104,'R107','2026-07-29','09:00:00','11:00:00',44319),('RB_8',451500105,'R108','2026-07-30','12:00:00','14:00:00',44320),('RB_9',451500106,'R109','2026-07-31','13:00:00','15:00:00',44321);
/*!40000 ALTER TABLE `Room_Booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Student` (
  `Student_ID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  PRIMARY KEY (`Student_ID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES (451500101,'Sara Al-Ghamdi','sara.g@yic.edu.sa'),(451500102,'Noura Al-Otaibi','noura.o@yic.edu.sa'),(451500103,'Reem Al-Zahrani','reem.z@yic.edu.sa'),(451500104,'Mona Al-Harbi','mona.h@yic.edu.sa'),(451500105,'Amal Al-Mutairi','amal.m@yic.edu.sa'),(451500106,'Hana Al-Shehri','hana.s@yic.edu.sa'),(451500107,'Shahad Al-Kahlani','shahad.k@yic.edu.sa'),(451500543,'Layan Aljohani','layan@yic.edu.sa'),(451500569,'Wadeef Alalwani','wadeef@yic.edu.sa'),(451500603,'Alhanouf Aljohani','alhanouf@yic.edu.sa');
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Study_Room`
--

DROP TABLE IF EXISTS `Study_Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Study_Room` (
  `Room_ID` varchar(50) NOT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'Available',
  `Capacity` int NOT NULL,
  PRIMARY KEY (`Room_ID`),
  CONSTRAINT `study_room_chk_1` CHECK ((`Status` in (_utf8mb4'Available',_utf8mb4'Booked'))),
  CONSTRAINT `study_room_chk_2` CHECK (((`Capacity` >= 2) and (`Capacity` <= 10)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Study_Room`
--

LOCK TABLES `Study_Room` WRITE;
/*!40000 ALTER TABLE `Study_Room` DISABLE KEYS */;
INSERT INTO `Study_Room` VALUES ('R101','Available',5),('R102','Available',8),('R103','Booked',4),('R104','Available',6),('R105','Booked',4),('R106','Available',10),('R107','Booked',4),('R108','Available',6),('R109','Available',5),('R110','Booked',2);
/*!40000 ALTER TABLE `Study_Room` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-03 16:30:56
