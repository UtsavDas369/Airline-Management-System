-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: airline
-- ------------------------------------------------------
-- Server version	8.0.23

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

--
-- Table structure for table `add_flights`
--

DROP TABLE IF EXISTS `add_flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `add_flights` (
  `flight_no` int NOT NULL,
  `flight_model` varchar(225) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `source` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `destination` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `departure_time` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `arrival_time` varchar(225) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `flight_date` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `mcheck` varchar(225) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `ercheck` varchar(225) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `wcheck` varchar(225) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `capacity` int NOT NULL,
  PRIMARY KEY (`flight_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `add_flights`
--

LOCK TABLES `add_flights` WRITE;
/*!40000 ALTER TABLE `add_flights` DISABLE KEYS */;
INSERT INTO `add_flights` VALUES (77,'Emirates','Bangalore','Delhi','10:00','21:00','2020-06-23','Maintainance Check','Electronics and Radar Check','Weather Check',100),(122,'IndianAirlines','Bangalore','Kerela','09:00','11:00','2020-06-23','Maintainance Check','','Weather Check',50);
/*!40000 ALTER TABLE `add_flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `last_name` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `email_id` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `password` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `phone_no` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `email_id` (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Utsav','Das','utsav@gmail.com','admin','1234567890'),(2,'Jayanth ','C','jc@gmail.com','123','0987654321'),(3,'Tarun','Arcot','ta@gmail.com','456','5555555555'),(4,'Jyothi','K','jk@gmail.com','789','2222222222');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `passport_no` int NOT NULL,
  `fname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `lname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `flight_no` int DEFAULT NULL,
  `source` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `destination` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `date` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `category` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `classid` int DEFAULT NULL,
  PRIMARY KEY (`passport_no`),
  KEY `flight_no` (`flight_no`) /*!80000 INVISIBLE */,
  KEY `customer_id_fk` (`customer_id`),
  KEY `class_fk` (`classid`),
  CONSTRAINT `classid_fk` FOREIGN KEY (`classid`) REFERENCES `price` (`classid`),
  CONSTRAINT `customer_id_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `flight_no_fk` FOREIGN KEY (`flight_no`) REFERENCES `add_flights` (`flight_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (13572468,'Utsav','Das',77,'Bangalore','Delhi','1234567890','2020-06-23',13,'Adult ',1);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `state` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `landmark` varchar(255) NOT NULL,
  `pincode` int NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email_id` (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (13,'Utsav','Das','utsav.das369@gmail.com','password','1234567890','karnataka','bangalore','landmark',565656);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_details`
--

DROP TABLE IF EXISTS `payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_details` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `card_number` varchar(16) NOT NULL,
  `card_holder_name` varchar(255) NOT NULL,
  `cvv` int NOT NULL,
  `exp_month` int NOT NULL,
  `exp_year` int NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `payment_details_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_details`
--

LOCK TABLES `payment_details` WRITE;
/*!40000 ALTER TABLE `payment_details` DISABLE KEYS */;
INSERT INTO `payment_details` VALUES (27,13,'2121564365436666','Utsav Das',123,12,22,'2021-06-23 17:13:12');
/*!40000 ALTER TABLE `payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price` (
  `classid` int NOT NULL,
  `class` varchar(45) DEFAULT NULL,
  `adultprice` int DEFAULT NULL,
  `childprice` int DEFAULT NULL,
  PRIMARY KEY (`classid`),
  KEY `class_fk` (`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
INSERT INTO `price` VALUES (1,'First Class',90000,50000),(2,'Business Class',30000,45000),(3,'Economy Class',20000,15000);
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-23 22:50:51
