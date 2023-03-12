CREATE DATABASE  IF NOT EXISTS `pokes` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pokes`;
-- MySQL dump 10.13  Distrib 8.0.29, for macos12 (x86_64)
--
-- Host: localhost    Database: pokes
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `touchs`
--

DROP TABLE IF EXISTS `touchs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `touchs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `poked_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_touchs_users_idx` (`user_id`),
  KEY `fk_touchs_users1_idx` (`poked_id`),
  CONSTRAINT `fk_touchs_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_touchs_users1` FOREIGN KEY (`poked_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `touchs`
--

LOCK TABLES `touchs` WRITE;
/*!40000 ALTER TABLE `touchs` DISABLE KEYS */;
INSERT INTO `touchs` VALUES (1,2,1,'2023-03-12 01:17:01','2023-03-12 01:17:01'),(2,2,1,'2023-03-12 01:17:02','2023-03-12 01:17:02'),(3,2,1,'2023-03-12 01:17:02','2023-03-12 01:17:02'),(4,2,1,'2023-03-12 01:17:03','2023-03-12 01:17:03'),(5,2,1,'2023-03-12 01:17:04','2023-03-12 01:17:04'),(6,3,1,'2023-03-12 01:17:07','2023-03-12 01:17:07'),(7,3,1,'2023-03-12 01:17:07','2023-03-12 01:17:07'),(8,3,1,'2023-03-12 01:17:08','2023-03-12 01:17:08'),(9,3,1,'2023-03-12 01:17:09','2023-03-12 01:17:09'),(10,1,2,'2023-03-12 01:17:58','2023-03-12 01:17:58'),(11,1,2,'2023-03-12 01:17:58','2023-03-12 01:17:58'),(12,1,2,'2023-03-12 01:17:59','2023-03-12 01:17:59'),(13,1,2,'2023-03-12 01:17:59','2023-03-12 01:17:59'),(14,1,2,'2023-03-12 01:18:00','2023-03-12 01:18:00'),(15,3,2,'2023-03-12 01:18:01','2023-03-12 01:18:01'),(16,3,2,'2023-03-12 01:18:02','2023-03-12 01:18:02'),(17,3,2,'2023-03-12 01:18:02','2023-03-12 01:18:02'),(18,3,2,'2023-03-12 01:18:03','2023-03-12 01:18:03'),(19,3,2,'2023-03-12 01:18:03','2023-03-12 01:18:03'),(20,3,2,'2023-03-12 01:18:03','2023-03-12 01:18:03'),(21,2,3,'2023-03-12 01:18:39','2023-03-12 01:18:39'),(22,2,3,'2023-03-12 01:18:42','2023-03-12 01:18:42'),(23,1,3,'2023-03-12 01:18:45','2023-03-12 01:18:45'),(24,1,3,'2023-03-12 01:18:46','2023-03-12 01:18:46'),(25,1,3,'2023-03-12 01:18:46','2023-03-12 01:18:46'),(26,1,3,'2023-03-12 01:18:46','2023-03-12 01:18:46'),(27,1,3,'2023-03-12 01:18:47','2023-03-12 01:18:47'),(28,1,3,'2023-03-12 01:18:47','2023-03-12 01:18:47'),(29,1,3,'2023-03-12 01:18:47','2023-03-12 01:18:47'),(30,1,3,'2023-03-12 01:18:48','2023-03-12 01:18:48'),(31,1,3,'2023-03-12 01:18:48','2023-03-12 01:18:48'),(32,1,3,'2023-03-12 01:18:48','2023-03-12 01:18:48'),(33,2,3,'2023-03-12 01:19:33','2023-03-12 01:19:33'),(35,3,1,'2023-03-12 03:12:32','2023-03-12 03:12:32'),(36,3,1,'2023-03-12 03:12:34','2023-03-12 03:12:34'),(37,3,1,'2023-03-12 03:12:42','2023-03-12 03:12:42'),(38,1,4,'2023-03-12 03:24:21','2023-03-12 03:24:21'),(39,1,4,'2023-03-12 03:24:50','2023-03-12 03:24:50'),(40,2,4,'2023-03-12 03:25:05','2023-03-12 03:25:05'),(41,2,1,'2023-03-12 03:30:55','2023-03-12 03:30:55'),(42,4,1,'2023-03-12 03:45:27','2023-03-12 03:45:27');
/*!40000 ALTER TABLE `touchs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-12  4:09:56