-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: railway
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `arrival_time`
--

DROP TABLE IF EXISTS `arrival_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `arrival_time` (
  `route_number` int(11) NOT NULL,
  `arrival_time` datetime NOT NULL,
  PRIMARY KEY (`arrival_time`),
  KEY `route_number` (`route_number`),
  CONSTRAINT `arrival_time_ibfk_1` FOREIGN KEY (`route_number`) REFERENCES `route` (`route_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arrival_time`
--

LOCK TABLES `arrival_time` WRITE;
/*!40000 ALTER TABLE `arrival_time` DISABLE KEYS */;
INSERT INTO `arrival_time` VALUES (111,'2020-04-21 00:30:00');
/*!40000 ALTER TABLE `arrival_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `available_ticket`
--

DROP TABLE IF EXISTS `available_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `available_ticket` (
  `route_number` int(11) NOT NULL,
  `price` varchar(45) NOT NULL,
  `available` tinyint(4) NOT NULL,
  `class` varchar(45) NOT NULL,
  KEY `route_number` (`route_number`),
  CONSTRAINT `available_ticket_ibfk_1` FOREIGN KEY (`route_number`) REFERENCES `route` (`route_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `available_ticket`
--

LOCK TABLES `available_ticket` WRITE;
/*!40000 ALTER TABLE `available_ticket` DISABLE KEYS */;
INSERT INTO `available_ticket` VALUES (111,'190',1,'economy'),(111,'230',1,'business');
/*!40000 ALTER TABLE `available_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cargo` (
  `Barcode` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  `volume` decimal(10,2) DEFAULT NULL,
  `train_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Barcode`),
  KEY `train_id` (`train_id`),
  CONSTRAINT `cargo_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`trainID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `city` (
  `city_name` varchar(45) NOT NULL,
  `province` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`city_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES ('Calgary','AB'),('Toronto','ON'),('Vancouver','BC');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `company` (
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('CNR'),('CPR');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departure_time`
--

DROP TABLE IF EXISTS `departure_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `departure_time` (
  `route_number` int(11) NOT NULL,
  `departure_time` datetime NOT NULL,
  PRIMARY KEY (`departure_time`),
  KEY `route_number` (`route_number`),
  CONSTRAINT `departure_time_ibfk_1` FOREIGN KEY (`route_number`) REFERENCES `route` (`route_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departure_time`
--

LOCK TABLES `departure_time` WRITE;
/*!40000 ALTER TABLE `departure_time` DISABLE KEYS */;
INSERT INTO `departure_time` VALUES (111,'2020-04-20 08:30:00');
/*!40000 ALTER TABLE `departure_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `driver` (
  `driverID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`driverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (888,'Tom'),(889,'Spencer');
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver_train`
--

DROP TABLE IF EXISTS `driver_train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `driver_train` (
  `driverID` int(11) NOT NULL,
  `trainID` int(11) NOT NULL,
  `driving_hours` int(11) DEFAULT NULL,
  KEY `driverID` (`driverID`),
  KEY `trainID` (`trainID`),
  CONSTRAINT `driver_train_ibfk_1` FOREIGN KEY (`driverID`) REFERENCES `driver` (`driverID`),
  CONSTRAINT `driver_train_ibfk_2` FOREIGN KEY (`trainID`) REFERENCES `train` (`trainID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver_train`
--

LOCK TABLES `driver_train` WRITE;
/*!40000 ALTER TABLE `driver_train` DISABLE KEYS */;
INSERT INTO `driver_train` VALUES (888,1,0),(888,1,0),(889,2,0);
/*!40000 ALTER TABLE `driver_train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `include`
--

DROP TABLE IF EXISTS `include`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `include` (
  `track_id` int(11) NOT NULL,
  `route_number` int(11) NOT NULL,
  KEY `track_id` (`track_id`),
  KEY `route_number` (`route_number`),
  CONSTRAINT `include_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `track` (`ID`),
  CONSTRAINT `include_ibfk_2` FOREIGN KEY (`route_number`) REFERENCES `route` (`route_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `include`
--

LOCK TABLES `include` WRITE;
/*!40000 ALTER TABLE `include` DISABLE KEYS */;
/*!40000 ALTER TABLE `include` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintain`
--

DROP TABLE IF EXISTS `maintain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `maintain` (
  `mechanic_id` int(11) NOT NULL,
  `train_id` int(11) NOT NULL,
  KEY `mechanic_id` (`mechanic_id`),
  KEY `train_id` (`train_id`),
  CONSTRAINT `maintain_ibfk_1` FOREIGN KEY (`mechanic_id`) REFERENCES `mechanic` (`mechanic_id`),
  CONSTRAINT `maintain_ibfk_2` FOREIGN KEY (`train_id`) REFERENCES `train` (`trainID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintain`
--

LOCK TABLES `maintain` WRITE;
/*!40000 ALTER TABLE `maintain` DISABLE KEYS */;
INSERT INTO `maintain` VALUES (901,1),(901,1),(901,1),(901,1),(901,1),(902,2);
/*!40000 ALTER TABLE `maintain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mechanic`
--

DROP TABLE IF EXISTS `mechanic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mechanic` (
  `mechanic_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`mechanic_id`),
  UNIQUE KEY `mechanic_id_UNIQUE` (`mechanic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mechanic`
--

LOCK TABLES `mechanic` WRITE;
/*!40000 ALTER TABLE `mechanic` DISABLE KEYS */;
INSERT INTO `mechanic` VALUES (901,'Tyler'),(902,'Ken');
/*!40000 ALTER TABLE `mechanic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pass_by`
--

DROP TABLE IF EXISTS `pass_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pass_by` (
  `city_name` varchar(45) NOT NULL,
  `station_name` varchar(45) NOT NULL,
  `route_number` int(11) NOT NULL,
  KEY `route_number` (`route_number`),
  KEY `city_name` (`city_name`),
  KEY `station_name` (`station_name`),
  CONSTRAINT `pass_by_ibfk_1` FOREIGN KEY (`route_number`) REFERENCES `route` (`route_number`),
  CONSTRAINT `pass_by_ibfk_2` FOREIGN KEY (`city_name`) REFERENCES `city` (`city_name`),
  CONSTRAINT `pass_by_ibfk_3` FOREIGN KEY (`station_name`) REFERENCES `station` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pass_by`
--

LOCK TABLES `pass_by` WRITE;
/*!40000 ALTER TABLE `pass_by` DISABLE KEYS */;
INSERT INTO `pass_by` VALUES ('Vancouver','Center Station',111),('Calgary','City Center',111),('Toronto','Union Station',111),('Toronto','union station',111),('Toronto','union station',111);
/*!40000 ALTER TABLE `pass_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `passenger` (
  `passenger_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `train_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`passenger_id`),
  KEY `train_id` (`train_id`),
  CONSTRAINT `passenger_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`trainID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (201,'Bobby',1),(202,'Kyle',NULL);
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `route` (
  `route_number` int(11) NOT NULL,
  `train_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`route_number`),
  KEY `train_id` (`train_id`),
  CONSTRAINT `route_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`trainID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (111,1),(112,2);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `station` (
  `name` varchar(45) NOT NULL,
  `city_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `city_name` (`city_name`),
  CONSTRAINT `station_ibfk_1` FOREIGN KEY (`city_name`) REFERENCES `city` (`city_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES ('City Center','Calgary'),('Union Station','Toronto'),('Center Station','Vancouver');
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ticket` (
  `ticket_number` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `route_number` int(11) DEFAULT NULL,
  `company_name` varchar(45) DEFAULT NULL,
  `passenger_id` int(11) DEFAULT NULL,
  `seating_position` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ticket_number`),
  KEY `company_name` (`company_name`),
  KEY `route_number` (`route_number`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`company_name`) REFERENCES `company` (`name`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`route_number`) REFERENCES `route` (`route_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (301,200.00,111,'CPR',201,'1A'),(302,220.00,111,'CPR',202,'2B');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `train` (
  `trainID` int(11) NOT NULL,
  `no.of cars` int(11) DEFAULT NULL,
  `company_name` varchar(45) DEFAULT NULL,
  `passenger_flag` tinyint(4) DEFAULT NULL,
  `economy_class` int(11) DEFAULT NULL,
  `business_class` int(11) DEFAULT NULL,
  `freight_flag` tinyint(4) DEFAULT NULL,
  `max_cargo` decimal(10,2) DEFAULT NULL,
  `max_volume` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`trainID`),
  KEY `company_name` (`company_name`),
  CONSTRAINT `train_ibfk_1` FOREIGN KEY (`company_name`) REFERENCES `company` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train` VALUES (1,11,'CPR',1,200,100,0,0.00,0.00),(2,12,'CNR',1,220,120,1,3000.00,20.00),(3,11,'CNR',1,220,100,0,0.00,0.00),(5,11,'CPR',1,200,100,0,0.00,0.00);
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-11 16:44:52
