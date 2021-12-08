CREATE DATABASE  IF NOT EXISTS `tenantapp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tenantapp`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: tenantapp
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `fl_id` int NOT NULL,
  `airline_serv` text NOT NULL,
  `from_city` text NOT NULL,
  `to_city` text NOT NULL,
  `avail_seats` int NOT NULL,
  PRIMARY KEY (`fl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (1,'indigo','indore','goa',50),(2,'air india','indore','delhi',30),(3,'kingfisher','delhi','bombay',10);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `ht_id` int NOT NULL,
  `hotel_name` text NOT NULL,
  `city` text NOT NULL,
  `avail_rooms` int NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`ht_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (1,'wow','indore',5,4000),(2,'sayaji','indore',6,3500),(3,'effotel','indore',9,2300);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxi`
--

DROP TABLE IF EXISTS `taxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxi` (
  `tx_id` int NOT NULL,
  `taxi_number` varchar(20) NOT NULL,
  `oper_city` varchar(20) NOT NULL,
  `rate_km` int NOT NULL,
  PRIMARY KEY (`tx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxi`
--

LOCK TABLES `taxi` WRITE;
/*!40000 ALTER TABLE `taxi` DISABLE KEYS */;
INSERT INTO `taxi` VALUES (1,'t01','indore',12),(2,'t02','delhi',15),(3,'t03','mumbai',50);
/*!40000 ALTER TABLE `taxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant`
--

DROP TABLE IF EXISTS `tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenant` (
  `t_id` int NOT NULL AUTO_INCREMENT,
  `tname` text NOT NULL,
  `userId` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant`
--

LOCK TABLES `tenant` WRITE;
/*!40000 ALTER TABLE `tenant` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_service`
--

DROP TABLE IF EXISTS `tenant_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenant_service` (
  `t_id` int NOT NULL,
  `service_type` varchar(20) NOT NULL,
  PRIMARY KEY (`t_id`,`service_type`),
  CONSTRAINT `fk_tenant` FOREIGN KEY (`t_id`) REFERENCES `tenant` (`t_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_service`
--

LOCK TABLES `tenant_service` WRITE;
/*!40000 ALTER TABLE `tenant_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train` (
  `tr_id` int NOT NULL,
  `train_name` text NOT NULL,
  `from_city` text NOT NULL,
  `to_city` text NOT NULL,
  `price` int NOT NULL,
  `avail_seats` int NOT NULL,
  PRIMARY KEY (`tr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train` VALUES (1,'avantika','indore','delhi',1500,15),(2,'duranto','indore','mumbai',1200,10),(3,'mptourism','indore','mandav',1000,14);
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_flight`
--

DROP TABLE IF EXISTS `user_flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_flight` (
  `t_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `fl_id` int NOT NULL,
  `from_city` text NOT NULL,
  `to_city` text NOT NULL,
  PRIMARY KEY (`t_id`,`username`),
  KEY `fk_idx` (`fl_id`),
  CONSTRAINT `fk` FOREIGN KEY (`fl_id`) REFERENCES `flight` (`fl_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_flight`
--

LOCK TABLES `user_flight` WRITE;
/*!40000 ALTER TABLE `user_flight` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_hotel`
--

DROP TABLE IF EXISTS `user_hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_hotel` (
  `t_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `ht_id` int NOT NULL,
  `city` text NOT NULL,
  PRIMARY KEY (`t_id`,`username`),
  KEY `fk_hotel_idx` (`ht_id`),
  CONSTRAINT `fk_hotel` FOREIGN KEY (`ht_id`) REFERENCES `hotel` (`ht_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_hotel`
--

LOCK TABLES `user_hotel` WRITE;
/*!40000 ALTER TABLE `user_hotel` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_taxi`
--

DROP TABLE IF EXISTS `user_taxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_taxi` (
  `t_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `tx_id` int NOT NULL,
  `taxi_number` varchar(20) NOT NULL,
  `oper_city` text NOT NULL,
  `rate_km` int NOT NULL,
  PRIMARY KEY (`t_id`,`username`),
  KEY `fk_taxi_idx` (`tx_id`),
  CONSTRAINT `fk_taxi` FOREIGN KEY (`tx_id`) REFERENCES `taxi` (`tx_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_taxi`
--

LOCK TABLES `user_taxi` WRITE;
/*!40000 ALTER TABLE `user_taxi` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_taxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_train`
--

DROP TABLE IF EXISTS `user_train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_train` (
  `t_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `tr_id` int NOT NULL,
  `from_city` text NOT NULL,
  `to_city` text NOT NULL,
  PRIMARY KEY (`t_id`,`username`),
  KEY `fk_train_idx` (`tr_id`),
  CONSTRAINT `fk_train` FOREIGN KEY (`tr_id`) REFERENCES `train` (`tr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_train`
--

LOCK TABLES `user_train` WRITE;
/*!40000 ALTER TABLE `user_train` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `t_id` int NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_user_idx` (`t_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`t_id`) REFERENCES `tenant` (`t_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-07 20:06:27
