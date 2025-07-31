CREATE DATABASE  IF NOT EXISTS `df_ticketing` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `df_ticketing`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 135.235.193.181    Database: df_ticketing
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `academic_cost_center`
--

DROP TABLE IF EXISTS `academic_cost_center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_cost_center` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cost_center_id` int DEFAULT NULL,
  `year_id` int DEFAULT NULL,
  `entity_id` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cost_center_id` (`cost_center_id`),
  KEY `entity_id` (`entity_id`),
  KEY `year_id` (`year_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `academic_cost_center_ibfk_1` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_center` (`cost_center_id`),
  CONSTRAINT `academic_cost_center_ibfk_2` FOREIGN KEY (`entity_id`) REFERENCES `entities` (`entity_id`),
  CONSTRAINT `academic_cost_center_ibfk_3` FOREIGN KEY (`year_id`) REFERENCES `academic_year` (`year_id`),
  CONSTRAINT `academic_cost_center_ibfk_4` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_cost_center`
--

LOCK TABLES `academic_cost_center` WRITE;
/*!40000 ALTER TABLE `academic_cost_center` DISABLE KEYS */;
INSERT INTO `academic_cost_center` VALUES (1,1,2025,1,1),(2,2,2025,1,1),(3,3,2025,1,1),(4,4,2025,1,1),(5,5,2025,1,1),(6,6,2025,1,1),(7,5,2025,4,1),(8,7,2025,1,1),(9,8,2025,1,1),(10,9,2025,1,1),(11,10,2025,1,1),(12,11,2025,1,1),(13,12,2025,4,1),(14,13,2025,1,1),(15,14,2025,1,1),(16,15,2025,1,1),(17,16,2025,1,1),(18,17,2025,4,1),(19,18,2025,1,1),(20,19,2025,1,1),(21,20,2025,1,1),(22,21,2025,1,1),(23,18,2025,4,1),(24,22,2025,1,1),(25,23,2025,1,1),(26,24,2025,2,1),(27,9,2025,2,1),(28,23,2025,2,1),(29,20,2025,2,1),(30,25,2025,3,1),(31,9,2025,2,1),(32,26,2025,3,1),(33,27,2025,1,1),(34,24,2025,2,1),(35,23,2025,2,1),(36,20,2025,2,1),(37,9,2025,3,1);
/*!40000 ALTER TABLE `academic_cost_center` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academic_entity`
--

DROP TABLE IF EXISTS `academic_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_entity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entity_id` int DEFAULT NULL,
  `year_id` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entity_id` (`entity_id`),
  KEY `status_id` (`status_id`),
  KEY `year_id` (`year_id`),
  CONSTRAINT `academic_entity_ibfk_1` FOREIGN KEY (`entity_id`) REFERENCES `entities` (`entity_id`),
  CONSTRAINT `academic_entity_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`),
  CONSTRAINT `academic_entity_ibfk_3` FOREIGN KEY (`year_id`) REFERENCES `academic_year` (`year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_entity`
--

LOCK TABLES `academic_entity` WRITE;
/*!40000 ALTER TABLE `academic_entity` DISABLE KEYS */;
INSERT INTO `academic_entity` VALUES (1,1,2025,1),(2,2,2025,1),(3,3,2025,1),(4,4,2025,1);
/*!40000 ALTER TABLE `academic_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academic_expense_category`
--

DROP TABLE IF EXISTS `academic_expense_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_expense_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `expence_category_id` int DEFAULT NULL,
  `year_id` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expence_category_id` (`expence_category_id`),
  KEY `status_id` (`status_id`),
  KEY `year_id` (`year_id`),
  CONSTRAINT `academic_expense_category_ibfk_1` FOREIGN KEY (`expence_category_id`) REFERENCES `expense_category` (`expense_category_id`),
  CONSTRAINT `academic_expense_category_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`),
  CONSTRAINT `academic_expense_category_ibfk_3` FOREIGN KEY (`year_id`) REFERENCES `academic_year` (`year_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_expense_category`
--

LOCK TABLES `academic_expense_category` WRITE;
/*!40000 ALTER TABLE `academic_expense_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `academic_expense_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academic_organization`
--

DROP TABLE IF EXISTS `academic_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_organization` (
  `id` int NOT NULL AUTO_INCREMENT,
  `org_id` int DEFAULT NULL,
  `year_id` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`),
  KEY `year_id` (`year_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `academic_organization_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `organization` (`org_id`),
  CONSTRAINT `academic_organization_ibfk_2` FOREIGN KEY (`year_id`) REFERENCES `academic_year` (`year_id`),
  CONSTRAINT `academic_organization_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_organization`
--

LOCK TABLES `academic_organization` WRITE;
/*!40000 ALTER TABLE `academic_organization` DISABLE KEYS */;
INSERT INTO `academic_organization` VALUES (1,1,2025,1);
/*!40000 ALTER TABLE `academic_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academic_year`
--

DROP TABLE IF EXISTS `academic_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_year` (
  `year_id` int NOT NULL AUTO_INCREMENT,
  `year_name` varchar(20) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`year_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `academic_year_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2026 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_year`
--

LOCK TABLES `academic_year` WRITE;
/*!40000 ALTER TABLE `academic_year` DISABLE KEYS */;
INSERT INTO `academic_year` VALUES (2025,'2526',1,'2025-04-01 00:00:00','2026-03-31 23:59:59');
/*!40000 ALTER TABLE `academic_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accommodation`
--

DROP TABLE IF EXISTS `accommodation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accommodation` (
  `accommodation_id` int NOT NULL AUTO_INCREMENT,
  `reimb_dtls_id` int DEFAULT NULL,
  `hotel_name` varchar(200) DEFAULT NULL,
  `address` text,
  `check_in_date` datetime DEFAULT NULL,
  `check_out_date` datetime DEFAULT NULL,
  `stay_days` int DEFAULT NULL,
  PRIMARY KEY (`accommodation_id`),
  KEY `reimb_dtls_id` (`reimb_dtls_id`),
  CONSTRAINT `accommodation_ibfk_1` FOREIGN KEY (`reimb_dtls_id`) REFERENCES `re_ticket_details` (`reimb_dtls_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accommodation`
--

LOCK TABLES `accommodation` WRITE;
/*!40000 ALTER TABLE `accommodation` DISABLE KEYS */;
/*!40000 ALTER TABLE `accommodation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adv_ticket_details`
--

DROP TABLE IF EXISTS `adv_ticket_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adv_ticket_details` (
  `adv_dtls_id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `manager_file` text,
  `description` text,
  PRIMARY KEY (`adv_dtls_id`),
  KEY `ticket_id` (`ticket_id`),
  CONSTRAINT `adv_ticket_details_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adv_ticket_details`
--

LOCK TABLES `adv_ticket_details` WRITE;
/*!40000 ALTER TABLE `adv_ticket_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `adv_ticket_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `bill_id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int DEFAULT NULL,
  `exp_catg_id` int DEFAULT NULL,
  `ticket_dtls_id` int DEFAULT NULL,
  `bill_number` varchar(45) DEFAULT NULL,
  `bill_amount` varchar(100) DEFAULT NULL,
  `bill_date` datetime DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `bill_path` text,
  `created_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `exp_catg_id` (`exp_catg_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`),
  CONSTRAINT `bills_ibfk_2` FOREIGN KEY (`exp_catg_id`) REFERENCES `expense_category` (`expense_category_id`),
  CONSTRAINT `bills_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (1,1,1,1,NULL,'400',NULL,1,NULL,'2025-07-01 17:38:09',6,NULL,NULL),(2,1,1,2,NULL,'110',NULL,1,'https://dfticketing.org/documents/reimbursement/bills/file_1751371689336_9295.pdf','2025-07-01 17:38:09',6,NULL,NULL),(3,2,1,3,'51051212501488','350','2025-07-02 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1751459070176_6301.jpeg','2025-07-02 17:54:30',56,NULL,NULL),(4,4,1,5,'NMK-AD19096','1729','2025-07-02 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1751522171530_8139.jpg','2025-07-03 11:26:12',56,NULL,NULL),(5,5,1,6,NULL,'378',NULL,1,NULL,'2025-07-05 08:50:19',23,NULL,NULL),(6,5,1,7,NULL,'224',NULL,1,NULL,'2025-07-05 09:00:48',23,NULL,NULL),(7,5,1,8,NULL,'234.5',NULL,1,NULL,'2025-07-05 09:03:39',23,NULL,NULL),(8,5,1,9,NULL,'234.5',NULL,1,NULL,'2025-07-05 09:14:16',23,NULL,NULL),(9,6,1,10,NULL,'91',NULL,1,NULL,'2025-07-07 10:31:06',11,NULL,NULL),(10,6,1,11,NULL,'43',NULL,1,'https://dfticketing.org/documents/reimbursement/bills/file_1751864568127_9534.jpg','2025-07-07 10:32:48',11,NULL,NULL),(11,7,1,12,NULL,'245',NULL,1,NULL,'2025-07-07 10:40:52',11,NULL,NULL),(12,8,1,13,NULL,'99','2025-06-19 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1751869353767_8757.pdf','2025-07-07 11:52:34',37,NULL,NULL),(13,8,1,14,NULL,'200','2025-07-01 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1751870133742_8666.pdf','2025-07-07 12:05:34',37,NULL,NULL),(14,8,1,15,NULL,'196','2025-07-05 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1751870225446_5632.jpeg','2025-07-07 12:07:05',37,NULL,NULL),(15,8,1,14,NULL,'160','2025-07-01 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1751870303927_1959.jpeg','2025-07-07 12:08:24',37,NULL,NULL),(16,8,1,14,NULL,'30','2025-07-01 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1751870372534_5387.jpeg','2025-07-07 12:09:33',37,NULL,NULL),(17,8,1,15,NULL,'120','2025-07-05 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1751870445393_4040.jpeg','2025-07-07 12:10:45',37,NULL,NULL),(18,7,1,16,NULL,'245',NULL,1,NULL,'2025-07-07 13:59:58',11,NULL,NULL),(22,12,1,23,NULL,'136.5',NULL,1,NULL,'2025-07-07 14:53:04',57,NULL,NULL),(23,14,1,25,NULL,'73.5',NULL,1,NULL,'2025-07-07 14:58:19',57,NULL,NULL),(25,16,1,27,NULL,'140',NULL,1,NULL,'2025-07-07 15:04:28',57,NULL,NULL),(26,17,1,28,NULL,'77',NULL,1,NULL,'2025-07-07 15:08:45',57,NULL,NULL),(27,17,1,29,NULL,'42',NULL,1,NULL,'2025-07-07 15:10:10',57,NULL,NULL),(28,18,1,30,NULL,'73.5',NULL,1,NULL,'2025-07-07 15:11:57',57,NULL,NULL),(29,19,1,31,NULL,'5558',NULL,1,'https://dfticketing.org/documents/reimbursement/bills/file_1751885297921_2322.pdf','2025-07-07 16:18:18',16,NULL,NULL),(30,19,1,32,NULL,'3322',NULL,1,'https://dfticketing.org/documents/reimbursement/bills/file_1751885532173_9519.pdf','2025-07-07 16:22:12',16,NULL,NULL),(31,19,1,32,NULL,'1495',NULL,1,'https://dfticketing.org/documents/reimbursement/bills/file_1751885532174_1101.pdf','2025-07-07 16:22:12',16,NULL,NULL),(32,20,1,33,NULL,'1000',NULL,1,NULL,'2025-07-08 13:06:03',1,NULL,NULL),(33,18,1,34,NULL,'59.5',NULL,1,NULL,'2025-07-10 20:40:05',57,NULL,NULL),(34,21,1,35,NULL,'77',NULL,1,NULL,'2025-07-10 20:42:57',57,NULL,NULL),(35,22,1,36,NULL,'15','2025-07-11 00:00:00',2,'https://dfticketing.org/documents/reimbursement/bills/file_1752227570816_3228.jpg','2025-07-11 15:22:51',11,'2025-07-11 15:24:12',11),(36,22,1,36,NULL,'15','2025-07-11 00:00:00',2,'https://dfticketing.org/documents/reimbursement/bills/file_1752227570817_2986.jpg','2025-07-11 15:22:51',11,'2025-07-11 15:23:57',11),(37,23,1,37,NULL,'15','2025-07-11 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1752227835096_5024.jpg','2025-07-11 15:27:15',11,NULL,NULL),(38,24,1,38,NULL,'15','2025-07-11 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1752227944198_6402.jpg','2025-07-11 15:29:04',11,NULL,NULL),(39,25,1,39,NULL,'294',NULL,1,NULL,'2025-07-11 22:04:38',41,NULL,NULL),(40,26,1,40,NULL,'444.5',NULL,1,NULL,'2025-07-11 22:11:16',41,NULL,NULL),(41,27,1,41,'812','845','2025-07-12 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1752318278554_1383.jpg','2025-07-12 16:34:39',31,NULL,NULL),(42,28,1,42,'1','676','2025-07-12 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1752318546948_4496.pdf','2025-07-12 16:39:07',16,NULL,NULL),(43,29,1,43,NULL,'77',NULL,1,NULL,'2025-07-12 17:31:13',57,NULL,NULL),(44,30,1,44,NULL,'80',NULL,1,'https://dfticketing.org/documents/reimbursement/bills/file_1752322304856_6095.jpeg','2025-07-12 17:41:45',57,NULL,NULL),(45,30,1,45,NULL,'177.25','2025-07-09 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1752322304857_2094.pdf','2025-07-12 17:41:45',57,NULL,NULL),(46,30,1,46,NULL,'15','2025-07-11 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1752322304857_1627.jpeg','2025-07-12 17:41:45',57,NULL,NULL),(47,30,1,47,NULL,'57','2025-07-11 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1752322304858_6455.jpeg','2025-07-12 17:41:45',57,NULL,NULL),(48,31,1,48,NULL,'538','2025-07-09 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1752322561139_3295.pdf','2025-07-12 17:46:01',57,NULL,NULL),(49,32,1,49,NULL,'273',NULL,1,NULL,'2025-07-14 21:48:47',41,NULL,NULL),(50,33,1,50,NULL,'409.5',NULL,1,NULL,'2025-07-14 21:56:29',41,NULL,NULL),(51,34,1,51,NULL,'91',NULL,1,NULL,'2025-07-15 10:28:16',11,NULL,NULL),(52,31,1,52,NULL,'65','2025-07-13 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1752573817333_2631.jpeg','2025-07-15 15:33:37',57,NULL,NULL),(53,35,1,53,NULL,'63',NULL,1,NULL,'2025-07-15 15:35:54',57,NULL,NULL),(54,35,1,54,NULL,'66.5',NULL,1,NULL,'2025-07-15 15:37:34',57,NULL,NULL),(55,36,1,55,NULL,'367.5',NULL,1,NULL,'2025-07-16 07:41:42',41,NULL,NULL),(56,37,1,56,NULL,'570.50',NULL,1,NULL,'2025-07-16 13:16:41',6,NULL,NULL),(57,38,1,57,NULL,'623',NULL,1,NULL,'2025-07-16 13:18:30',6,NULL,NULL),(58,35,1,58,NULL,'66.5','2025-07-14 00:00:00',1,NULL,'2025-07-18 10:31:50',57,NULL,NULL),(59,39,1,59,NULL,'77',NULL,1,NULL,'2025-07-18 10:36:54',57,NULL,NULL),(60,39,1,60,NULL,'59.5',NULL,1,NULL,'2025-07-18 10:38:53',57,NULL,NULL),(61,40,1,61,NULL,'42',NULL,1,NULL,'2025-07-18 10:44:33',57,NULL,NULL),(62,40,1,62,NULL,'59.5',NULL,1,NULL,'2025-07-18 10:46:27',57,NULL,NULL),(63,41,1,63,NULL,'80.5',NULL,1,NULL,'2025-07-18 10:55:39',57,NULL,NULL),(64,41,1,64,NULL,'77',NULL,1,NULL,'2025-07-18 10:57:37',57,NULL,NULL),(65,42,1,65,NULL,'70',NULL,1,NULL,'2025-07-18 11:00:38',57,NULL,NULL),(66,43,1,66,NULL,'1099','2025-07-07 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1753076112369_5505.pdf','2025-07-21 11:05:12',3,NULL,NULL),(67,43,1,67,NULL,'200','2025-07-02 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1753076112370_2323.pdf','2025-07-21 11:05:12',3,NULL,NULL),(68,43,1,67,NULL,'200','2025-07-02 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1753076112371_5395.pdf','2025-07-21 11:05:12',3,NULL,NULL),(69,42,1,68,NULL,'73.5',NULL,1,NULL,'2025-07-21 12:48:53',57,NULL,NULL),(70,44,1,69,NULL,'287',NULL,1,NULL,'2025-07-21 20:09:31',11,NULL,NULL),(71,45,1,70,NULL,'287',NULL,1,NULL,'2025-07-22 20:17:38',11,NULL,NULL),(72,46,1,71,NULL,'287',NULL,1,NULL,'2025-07-22 20:22:29',11,NULL,NULL),(73,47,1,72,NULL,'59.5',NULL,1,NULL,'2025-07-22 21:12:48',57,NULL,NULL),(74,47,1,73,NULL,'63',NULL,1,NULL,'2025-07-22 21:14:35',57,NULL,NULL),(75,48,1,74,NULL,'63',NULL,1,NULL,'2025-07-22 21:16:44',57,NULL,NULL),(76,48,1,75,NULL,'63',NULL,1,NULL,'2025-07-22 21:20:29',57,NULL,NULL),(77,49,1,76,NULL,'287',NULL,1,NULL,'2025-07-23 18:50:46',11,NULL,NULL),(78,50,1,77,NULL,'270','2025-07-21 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1753288385903_9417.jpeg','2025-07-23 22:03:06',31,NULL,NULL),(79,51,1,78,'298','420','2025-07-23 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1753288457764_2191.jpeg','2025-07-23 22:04:18',31,NULL,NULL),(80,52,1,79,'29202','84','2025-07-23 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1753288501880_9307.jpeg','2025-07-23 22:05:02',31,NULL,NULL),(81,53,1,80,'29265','152','2025-07-24 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1753326071633_3997.jpeg','2025-07-24 08:31:12',31,NULL,NULL),(82,54,1,81,NULL,'1200','2025-07-23 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1753351589464_6961.pdf','2025-07-24 15:36:29',13,NULL,NULL),(83,54,1,82,NULL,'1133','2025-07-24 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1753351589465_7920.pdf','2025-07-24 15:36:29',13,NULL,NULL),(84,55,1,83,NULL,'470','2025-07-24 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1753354012552_3620.jpeg','2025-07-24 16:16:53',31,NULL,NULL),(85,56,1,84,NULL,'493.5','2025-07-23 00:00:00',1,NULL,'2025-07-24 17:33:07',15,NULL,NULL),(86,57,1,85,NULL,'287',NULL,1,NULL,'2025-07-24 18:40:33',11,NULL,NULL),(87,58,1,86,NULL,'346.5',NULL,1,NULL,'2025-07-24 21:14:38',23,NULL,NULL),(88,58,1,86,NULL,'240','2025-07-12 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1753371957512_3461.jpeg','2025-07-24 21:15:58',23,NULL,NULL),(89,58,1,87,NULL,'262.5',NULL,1,NULL,'2025-07-24 21:18:44',23,NULL,NULL),(90,58,1,88,NULL,'420',NULL,1,NULL,'2025-07-24 21:23:52',23,NULL,NULL),(91,58,1,88,NULL,'110',NULL,1,'https://dfticketing.org/documents/reimbursement/bills/file_1753372431914_9408.jpeg','2025-07-24 21:23:52',23,NULL,NULL),(92,59,1,89,'29428','131','2025-07-24 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1753372560676_7760.jpeg','2025-07-24 21:26:01',31,NULL,NULL),(93,58,1,90,NULL,'395.5','2025-07-24 00:00:00',1,NULL,'2025-07-24 21:31:05',23,NULL,NULL),(94,58,1,90,NULL,'80','2025-07-24 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1753372865439_7291.jpeg','2025-07-24 21:31:05',23,NULL,NULL),(95,58,1,90,NULL,'40','2025-07-24 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1753372865440_7289.jpeg','2025-07-24 21:31:05',23,NULL,NULL),(96,58,1,90,NULL,'40','2025-07-23 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1753372865440_6363.jpeg','2025-07-24 21:31:05',23,NULL,NULL),(97,60,1,91,'294565','172','2025-07-25 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1753415340352_8572.jpeg','2025-07-25 09:19:00',31,NULL,NULL),(98,58,1,92,NULL,'238',NULL,1,NULL,'2025-07-25 13:54:11',23,NULL,NULL),(99,61,1,93,NULL,'66.5',NULL,1,NULL,'2025-07-25 14:18:09',57,NULL,NULL),(100,61,1,94,'0021559','108','2025-07-23 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1753433652559_4192.jpeg','2025-07-25 14:24:13',57,NULL,NULL),(101,61,1,95,'0008869','63','2025-07-23 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1753433652560_7472.jpeg','2025-07-25 14:24:13',57,NULL,NULL),(102,61,1,96,'269','78','2025-07-23 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1753433652560_4523.jpeg','2025-07-25 14:24:13',57,NULL,NULL),(103,61,1,97,NULL,'250','2025-07-23 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1753433724345_6447.jpeg','2025-07-25 14:25:24',57,NULL,NULL),(104,61,1,98,NULL,'77',NULL,1,NULL,'2025-07-25 14:29:29',57,NULL,NULL),(105,62,1,99,NULL,'77',NULL,1,NULL,'2025-07-25 14:35:17',57,NULL,NULL),(106,62,1,100,NULL,'70',NULL,1,NULL,'2025-07-25 14:38:11',57,NULL,NULL),(107,63,1,101,NULL,'45.5',NULL,1,NULL,'2025-07-25 14:40:30',57,NULL,NULL),(108,63,1,102,'3514','300','2025-07-25 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1753434841381_2415.jpeg','2025-07-25 14:44:01',57,NULL,NULL),(109,64,1,103,NULL,'287',NULL,1,NULL,'2025-07-25 18:50:41',11,NULL,NULL),(110,63,1,104,NULL,'35',NULL,1,NULL,'2025-07-26 13:41:53',57,NULL,NULL),(111,63,1,105,NULL,'66.5',NULL,1,NULL,'2025-07-26 13:43:16',57,NULL,NULL),(112,65,1,106,NULL,'287',NULL,1,NULL,'2025-07-26 19:25:15',11,NULL,NULL),(113,66,1,107,NULL,'353.5',NULL,1,NULL,'2025-07-27 07:11:47',41,NULL,NULL),(114,67,1,108,NULL,'266',NULL,1,NULL,'2025-07-27 07:17:02',41,NULL,NULL),(115,68,1,109,NULL,'399',NULL,1,NULL,'2025-07-27 07:25:37',41,NULL,NULL),(116,69,1,110,NULL,'360.5',NULL,1,NULL,'2025-07-27 07:31:11',41,NULL,NULL),(117,70,1,111,NULL,'437.5',NULL,1,NULL,'2025-07-27 07:37:36',41,NULL,NULL),(118,71,1,112,NULL,'136.5',NULL,1,NULL,'2025-07-27 07:43:29',41,NULL,NULL),(119,72,1,113,'60','645','2025-07-26 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1753693405114_1358.jpg','2025-07-28 14:33:25',31,NULL,NULL),(120,73,1,114,NULL,'70','2025-07-28 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1753693485572_3365.jpg','2025-07-28 14:34:46',31,NULL,NULL),(121,74,1,115,'000','10820','2025-07-28 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1753710566051_9548.pdf','2025-07-28 19:19:26',31,NULL,NULL),(122,75,1,116,NULL,'418.15',NULL,1,'https://dfticketing.org/documents/reimbursement/bills/file_1753770639241_5400.jpg','2025-07-29 12:00:39',6,NULL,NULL),(123,76,1,117,NULL,'59.5',NULL,1,NULL,'2025-07-29 12:00:49',57,NULL,NULL),(124,77,1,118,NULL,'292.70',NULL,1,'https://dfticketing.org/documents/reimbursement/bills/file_1753770717353_8623.jpg','2025-07-29 12:01:57',6,NULL,NULL),(125,76,1,119,NULL,'77',NULL,1,NULL,'2025-07-29 12:02:16',57,NULL,NULL),(126,78,1,120,NULL,'53',NULL,1,'https://dfticketing.org/documents/reimbursement/bills/file_1753771042168_9676.jpg','2025-07-29 12:07:22',6,NULL,NULL),(127,79,1,121,NULL,'53',NULL,1,'https://dfticketing.org/documents/reimbursement/bills/file_1753771098806_3197.jpg','2025-07-29 12:08:19',6,NULL,NULL),(128,80,1,122,NULL,'493.5',NULL,1,NULL,'2025-07-29 17:13:10',15,NULL,NULL),(129,81,1,123,NULL,'213.5',NULL,1,NULL,'2025-07-29 17:17:57',15,NULL,NULL),(130,82,1,124,NULL,'66.5',NULL,1,NULL,'2025-07-30 20:30:31',57,NULL,NULL),(131,82,1,125,NULL,'63',NULL,1,NULL,'2025-07-30 20:31:45',57,NULL,NULL),(132,83,1,126,NULL,'535.50',NULL,1,NULL,'2025-07-30 21:03:40',11,NULL,NULL),(133,84,1,127,NULL,'542.50',NULL,1,NULL,'2025-07-31 07:17:04',11,NULL,NULL),(134,85,1,128,'0065675','211','2025-07-28 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1753947349126_4737.jpeg','2025-07-31 13:05:49',38,NULL,NULL),(135,85,1,129,'00196927','217','2025-07-28 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1753947455847_8317.jpeg','2025-07-31 13:07:36',38,NULL,NULL),(136,85,1,130,'1059','150','2025-07-28 00:00:00',1,'https://dfticketing.org/documents/reimbursement/bills/file_1753947455848_7329.jpeg','2025-07-31 13:07:36',38,NULL,NULL);
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budget_type`
--

DROP TABLE IF EXISTS `budget_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budget_type` (
  `budget_id` int NOT NULL AUTO_INCREMENT,
  `budget_name` varchar(255) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  PRIMARY KEY (`budget_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `budget_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budget_type`
--

LOCK TABLES `budget_type` WRITE;
/*!40000 ALTER TABLE `budget_type` DISABLE KEYS */;
INSERT INTO `budget_type` VALUES (1,'Revenue Budget',1),(2,'Capex Budget',1);
/*!40000 ALTER TABLE `budget_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_type` varchar(30) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Food',1),(2,'Travel',1),(3,'Accommodation',1),(4,'Others',1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contribution_type`
--

DROP TABLE IF EXISTS `contribution_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contribution_type` (
  `contribution_id` int NOT NULL AUTO_INCREMENT,
  `contribution_name` varchar(255) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  PRIMARY KEY (`contribution_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `contribution_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contribution_type`
--

LOCK TABLES `contribution_type` WRITE;
/*!40000 ALTER TABLE `contribution_type` DISABLE KEYS */;
INSERT INTO `contribution_type` VALUES (1,'FC',1),(2,'NFC',1);
/*!40000 ALTER TABLE `contribution_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cost_center`
--

DROP TABLE IF EXISTS `cost_center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cost_center` (
  `cost_center_id` int NOT NULL AUTO_INCREMENT,
  `cost_center_name` varchar(255) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`cost_center_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `cost_center_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost_center`
--

LOCK TABLES `cost_center` WRITE;
/*!40000 ALTER TABLE `cost_center` DISABLE KEYS */;
INSERT INTO `cost_center` VALUES (1,'DF-Finance',1,NULL),(2,'KS-CEO Office',1,NULL),(3,'DF -Technology',1,NULL),(4,'DF-CEO Office',1,NULL),(5,'DF-Integrated Area Development',1,NULL),(6,'DF-Operations',1,NULL),(7,'KS-Corporate social responsibility',1,NULL),(8,'KS-Finance & Accounts',1,NULL),(9,'Operation',1,NULL),(10,'DF-Human Resource',1,NULL),(11,'DF-MEDP',1,NULL),(12,'Farm Pond- Telengana',1,NULL),(13,'Program Strategy and Analysis',1,NULL),(14,'KS-Human Resource',1,NULL),(15,'KS-Operation',1,NULL),(16,'KS-IT',1,NULL),(17,'New Agri Initiatives',1,NULL),(18,'DF-Financial Inclusion',1,NULL),(19,'K-Hub Construction',1,NULL),(20,'IT',1,NULL),(21,'DF-Information technology',1,NULL),(22,'DF-Farm Pond',1,NULL),(23,'HR',1,NULL),(24,'CEO Office',1,NULL),(25,'DS-CEO Office',1,NULL),(26,'KREST',1,NULL),(27,'DF - GIS & Tech',1,NULL);
/*!40000 ALTER TABLE `cost_center` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`department_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_history`
--

DROP TABLE IF EXISTS `employee_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_history` (
  `employee_history_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `employee_number` varchar(50) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `work_email` varchar(100) DEFAULT NULL,
  `DOB` varchar(30) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `marital_status` varchar(30) DEFAULT NULL,
  `marriage_date` varchar(30) DEFAULT NULL,
  `blood_group` varchar(30) DEFAULT NULL,
  `physically_handicapped` varchar(30) DEFAULT NULL,
  `nationality` varchar(30) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `work_mobile` varchar(20) DEFAULT NULL,
  `home_mobile` varchar(20) DEFAULT NULL,
  `personal_email` varchar(100) DEFAULT NULL,
  `skype` varchar(30) DEFAULT NULL,
  `current_address_line_1` text,
  `current_address_line_2` text,
  `current_address_city` text,
  `current_address_state` text,
  `current_address_zip` text,
  `current_address_country` text,
  `permanent_address_line_1` text,
  `permanent_address_line_2` text,
  `permanent_address_city` text,
  `permanent_address_state` text,
  `permanent_address_zip` text,
  `permanent_address_country` text,
  `father_name` varchar(30) DEFAULT NULL,
  `mother_name` varchar(30) DEFAULT NULL,
  `spouse_name` varchar(30) DEFAULT NULL,
  `children_name` varchar(30) DEFAULT NULL,
  `attendance_number` varchar(30) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `location_country` varchar(30) DEFAULT NULL,
  `business_unit` varchar(30) DEFAULT NULL,
  `department` varchar(30) DEFAULT NULL,
  `sub_department` varchar(30) DEFAULT NULL,
  `job_title` varchar(100) DEFAULT NULL,
  `secondary_job_title` varchar(100) DEFAULT NULL,
  `reporting_manager_en` varchar(50) DEFAULT NULL,
  `reporting_manager` varchar(100) DEFAULT NULL,
  `dotted_line_manager` varchar(30) DEFAULT NULL,
  `date_of_joining` varchar(30) DEFAULT NULL,
  `leave_plan` varchar(100) DEFAULT NULL,
  `band` varchar(30) DEFAULT NULL,
  `pay_grade` varchar(30) DEFAULT NULL,
  `time_type` varchar(30) DEFAULT NULL,
  `worker_type` varchar(30) DEFAULT NULL,
  `shift_policy_name` varchar(30) DEFAULT NULL,
  `week_off_policy_name` varchar(30) DEFAULT NULL,
  `tracking_policy_name` varchar(100) DEFAULT NULL,
  `attendance_capture_scheme` varchar(30) DEFAULT NULL,
  `holiday_list_name` varchar(30) DEFAULT NULL,
  `expense_policy_name` varchar(30) DEFAULT NULL,
  `notice_period` varchar(30) DEFAULT NULL,
  `PAN_number` varchar(30) DEFAULT NULL,
  `aadhaar_number` varchar(30) DEFAULT NULL,
  `pf_number` varchar(30) DEFAULT NULL,
  `UAN_number` varchar(30) DEFAULT NULL,
  `employment_status` varchar(30) DEFAULT NULL,
  `exit_date` varchar(30) DEFAULT NULL,
  `comments` varchar(30) DEFAULT NULL,
  `exit_status` varchar(30) DEFAULT NULL,
  `termination_type` varchar(30) DEFAULT NULL,
  `termination_reason` varchar(30) DEFAULT NULL,
  `resignation_note` varchar(30) DEFAULT NULL,
  `cost_center` varchar(225) DEFAULT NULL,
  `entity` varchar(100) DEFAULT NULL,
  `emergency_name` varchar(30) DEFAULT NULL,
  `emergency_number` varchar(30) DEFAULT NULL,
  `emergency_relation` varchar(30) DEFAULT NULL,
  `emergency_address` text,
  `employees_name` varchar(100) DEFAULT NULL,
  `degree` varchar(30) DEFAULT NULL,
  `specialization` varchar(30) DEFAULT NULL,
  `year_of_completion` varchar(30) DEFAULT NULL,
  `CGPA_or_percentage` varchar(100) DEFAULT NULL,
  `university_or_college` varchar(100) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `previous_job_title` varchar(100) DEFAULT NULL,
  `job_duration` varchar(30) DEFAULT NULL,
  `certification` varchar(30) DEFAULT NULL,
  `year_of_passing` varchar(30) DEFAULT NULL,
  `institute` varchar(30) DEFAULT NULL,
  `course_appraisal` varchar(30) DEFAULT NULL,
  `pay_group` varchar(100) DEFAULT NULL,
  `work_location` text,
  `employee_name_on_bank` varchar(100) DEFAULT NULL,
  `employee_bank_name` varchar(100) DEFAULT NULL,
  `employee_account_number` varchar(20) DEFAULT NULL,
  `employee_IFSC` varchar(50) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`employee_history_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `employee_history_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_history`
--

LOCK TABLES `employee_history` WRITE;
/*!40000 ALTER TABLE `employee_history` DISABLE KEYS */;
INSERT INTO `employee_history` VALUES (1,1,'000010782',NULL,NULL,NULL,'Deepu Kumar',NULL,'deepu.kumar@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9065446115',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Software Development Engineer 1',NULL,'000010782','Deepu Kumar',NULL,NULL,NULL,'L2','L2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF -Technology','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Deepu Kumar','CENTRAL BANK OF INDIA','3543912655','CBIN0284137','2025-07-01 17:33:30',1),(2,1,'000010782',NULL,NULL,NULL,'Deepu Kumar',NULL,'deepu.kumar@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9065446115',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Software Development Engineer 1',NULL,'000010725','Gautham V Shanbhogue',NULL,NULL,NULL,'L2','L2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF - GIS & Tech','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Deepu Kumar','Central Bank of India','3543912655','CBIN0284137','2025-07-01 17:37:30',1),(3,1,'000010782',NULL,NULL,NULL,'Deepu Kumar',NULL,'deepu.kumar@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9065446115',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Software Development Engineer - 1',NULL,'000010725','Gautham V Shanbhogue',NULL,NULL,NULL,'L2','L2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF - GIS & Tech','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,',NULL,'Central Bank of India','3543912655','CBIN0284137','2025-07-01 17:38:25',1),(4,1,'000010782',NULL,NULL,NULL,'Deepu Kumar',NULL,'deepu.kumar@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9065446115',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Software Development Engineer 1',NULL,'000010725','Gautham V Shanbhogue',NULL,NULL,NULL,'L2','L2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF - GIS & Tech','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,',NULL,'Central Bank of India','3543912655','CBIN0284137','2025-07-02 11:01:30',1),(5,1,'000010782',NULL,NULL,NULL,'Deepu Kumar',NULL,'deepu.kumar@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9065446115',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Software Development Engineer 1',NULL,'000010782','Gautham V Shanbhogue',NULL,NULL,NULL,'L2','L2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF - GIS & Tech','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,',NULL,'Central Bank of India','3543912655','CBIN0284137','2025-07-02 11:02:23',1),(6,71,'000010784',NULL,NULL,NULL,'Amlanjyoti Laha',NULL,'amlanjyoti.laha@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9830624865',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Data Analyst',NULL,'000010725','Gautham V Shanbhogue',NULL,NULL,NULL,'L3','L3.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF - GIS & Tech','Deshpande Foundation Trust',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Amlanjyoti Laha','State Bank of India','37488694534','SBIN0012459','2025-07-02 13:09:58',1),(7,71,'000010784',NULL,NULL,NULL,'Amlanjyoti Laha',NULL,'amlanjyoti.laha@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9830624865',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Data Analyst',NULL,'000010725','Gautham V Shanbhogue',NULL,NULL,NULL,'L3','L3.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF - GIS & Tech','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,',NULL,'State Bank of India','37488694534','SBIN0012459','2025-07-02 13:39:33',1),(8,71,'000010784',NULL,NULL,NULL,'Amlanjyoti Laha',NULL,'amlanjyoti.laha@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9830624865',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Data Analyst',NULL,'000010725','Gautham V Shanbhogue',NULL,NULL,NULL,'L3','L3.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF - GIS & Tech','Deshpande Foundation 2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,',NULL,'State Bank of India','37488694534','SBIN0012459','2025-07-02 13:40:41',1);
/*!40000 ALTER TABLE `employee_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `employee_number` varchar(50) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `work_email` varchar(100) DEFAULT NULL,
  `DOB` varchar(30) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `marital_status` varchar(30) DEFAULT NULL,
  `marriage_date` varchar(30) DEFAULT NULL,
  `blood_group` varchar(30) DEFAULT NULL,
  `physically_handicapped` varchar(30) DEFAULT NULL,
  `nationality` varchar(30) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `work_mobile` varchar(20) DEFAULT NULL,
  `home_mobile` varchar(20) DEFAULT NULL,
  `personal_email` varchar(100) DEFAULT NULL,
  `skype` varchar(30) DEFAULT NULL,
  `current_address_line_1` text,
  `current_address_line_2` text,
  `current_address_city` text,
  `current_address_state` text,
  `current_address_zip` text,
  `current_address_country` text,
  `permanent_address_line_1` text,
  `permanent_address_line_2` text,
  `permanent_address_city` text,
  `permanent_address_state` text,
  `permanent_address_zip` text,
  `permanent_address_country` text,
  `father_name` varchar(30) DEFAULT NULL,
  `mother_name` varchar(30) DEFAULT NULL,
  `spouse_name` varchar(30) DEFAULT NULL,
  `children_name` varchar(30) DEFAULT NULL,
  `attendance_number` varchar(30) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `location_country` varchar(30) DEFAULT NULL,
  `business_unit` varchar(30) DEFAULT NULL,
  `department` varchar(30) DEFAULT NULL,
  `sub_department` varchar(30) DEFAULT NULL,
  `job_title` varchar(100) DEFAULT NULL,
  `secondary_job_title` varchar(100) DEFAULT NULL,
  `reporting_manager_en` varchar(50) DEFAULT NULL,
  `reporting_manager` varchar(100) DEFAULT NULL,
  `dotted_line_manager` varchar(30) DEFAULT NULL,
  `date_of_joining` varchar(30) DEFAULT NULL,
  `leave_plan` varchar(100) DEFAULT NULL,
  `band` varchar(30) DEFAULT NULL,
  `pay_grade` varchar(30) DEFAULT NULL,
  `time_type` varchar(30) DEFAULT NULL,
  `worker_type` varchar(30) DEFAULT NULL,
  `shift_policy_name` varchar(30) DEFAULT NULL,
  `week_off_policy_name` varchar(30) DEFAULT NULL,
  `tracking_policy_name` varchar(100) DEFAULT NULL,
  `attendance_capture_scheme` varchar(30) DEFAULT NULL,
  `holiday_list_name` varchar(30) DEFAULT NULL,
  `expense_policy_name` varchar(30) DEFAULT NULL,
  `notice_period` varchar(30) DEFAULT NULL,
  `PAN_number` varchar(30) DEFAULT NULL,
  `aadhaar_number` varchar(30) DEFAULT NULL,
  `pf_number` varchar(30) DEFAULT NULL,
  `UAN_number` varchar(30) DEFAULT NULL,
  `employment_status` varchar(30) DEFAULT NULL,
  `exit_date` varchar(30) DEFAULT NULL,
  `comments` varchar(30) DEFAULT NULL,
  `exit_status` varchar(30) DEFAULT NULL,
  `termination_type` varchar(30) DEFAULT NULL,
  `termination_reason` varchar(30) DEFAULT NULL,
  `resignation_note` varchar(30) DEFAULT NULL,
  `cost_center` varchar(225) DEFAULT NULL,
  `entity` varchar(100) DEFAULT NULL,
  `emergency_name` varchar(30) DEFAULT NULL,
  `emergency_number` varchar(30) DEFAULT NULL,
  `emergency_relation` varchar(30) DEFAULT NULL,
  `emergency_address` text,
  `employees_name` varchar(100) DEFAULT NULL,
  `degree` varchar(30) DEFAULT NULL,
  `specialization` varchar(30) DEFAULT NULL,
  `year_of_completion` varchar(30) DEFAULT NULL,
  `CGPA_or_percentage` varchar(100) DEFAULT NULL,
  `university_or_college` varchar(100) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `previous_job_title` varchar(100) DEFAULT NULL,
  `job_duration` varchar(30) DEFAULT NULL,
  `certification` varchar(30) DEFAULT NULL,
  `year_of_passing` varchar(30) DEFAULT NULL,
  `institute` varchar(30) DEFAULT NULL,
  `course_appraisal` varchar(30) DEFAULT NULL,
  `pay_group` varchar(100) DEFAULT NULL,
  `work_location` text,
  `employee_name_on_bank` varchar(100) DEFAULT NULL,
  `employee_bank_name` varchar(100) DEFAULT NULL,
  `employee_account_number` varchar(20) DEFAULT NULL,
  `employee_IFSC` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'000010782',NULL,NULL,NULL,'Deepu Kumar',NULL,'deepu.kumar@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9065446115',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Software Development Engineer 1',NULL,'000010725','Gautham V Shanbhogue',NULL,NULL,NULL,'L2','L2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DF - GIS & Tech','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,',NULL,'Central Bank of India','3543912655','CBIN0284137','2025-06-25 14:46:41','1',NULL,'2025-07-02 11:02:22',1),(2,'000010748',NULL,NULL,NULL,'Akshay Goharkar',NULL,'akshay.goharkar@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9493454123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Manager',NULL,'000010655','Manish Kumar Jaiswal',NULL,NULL,NULL,'L4','L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'KS-CEO Office','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Rukmini Chambers, Mahalaxmi Nagar,Vinayak Nagar','Akshay Goharkar','ICICI Bank','333401504203','ICIC0003334','2025-07-01 17:33:29','1',1,NULL,NULL),(3,'000010781',NULL,NULL,NULL,'Amith Krishnan C',NULL,'amith.krishnan@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-7356468013',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Executive',NULL,'000010725','Gautham V Shanbhogue',NULL,NULL,NULL,'L1','L1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF - GIS & Tech','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Amith Krishnan C','Canara Bank','0724101096164','CNRB0000724','2025-07-01 17:33:29','1',1,NULL,NULL),(5,'CON00022',NULL,NULL,NULL,'Anand Jayantilal Bariya',NULL,'anand.bariya@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9886506025',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Chief Executive officer',NULL,'CON00022','Anand Jayantilal Bariya',NULL,NULL,NULL,'C7','C7.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-CEO Office','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Anand Jayantilal Bariya','IDFC Bank','10006892568','IDFB0042401','2025-07-01 17:33:29','1',1,NULL,NULL),(6,'000010808',NULL,NULL,NULL,'Arunkumar Manthale',NULL,'arunkumar.manthale@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-8147232635',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site Incharge',NULL,'000010807','Nanjundappa Jugali',NULL,NULL,NULL,'L3','L3.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Integrated Area Development','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Arunkumar Manthale','HDFC Bank','50100701195392','HDFC0000768','2025-07-01 17:33:29','1',1,NULL,NULL),(7,'000010273',NULL,NULL,NULL,'Ashok Hanamantappa',NULL,'ashok.birannavar@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-7259888818',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Driver',NULL,'000010035','Basavaraj S.B',NULL,NULL,NULL,'L1','L1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Operations','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Ashok Hanamantappa','Karnataka Vikas Grameena Bank','17058024442','KVGB0004405','2025-07-01 17:33:29','1',1,NULL,NULL),(8,'000010750',NULL,NULL,NULL,'Bachewar Kamaji Ramrao',NULL,'bachewar.kamaji@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-7769919772',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Associate',NULL,'000010485','Narasimha Nayak Perampalli',NULL,NULL,NULL,'L1','L1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'KS-Corporate social responsibility','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Rukmini Chambers, Mahalaxmi Nagar,Vinayak Nagar','Bachewar Kamaji Ramrao','State Bank of India','40381614973','SBIN0005938','2025-07-01 17:33:29','1',1,NULL,NULL),(9,'000010035',NULL,NULL,NULL,'Basavaraj S.B',NULL,'basavaraj.baraker@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9900053759',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Assistant Manager',NULL,'000010348','Vijay Purohit',NULL,NULL,NULL,'L3','L3.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Operations','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Basavaraj S.B','ICICI Bank','142601505445','ICIC0001426','2025-07-01 17:33:29','1',1,NULL,NULL),(10,'000010771',NULL,NULL,NULL,'Bejjenki Alekhya',NULL,'alekhya.bejjenki@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9133891882',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Senior Executive',NULL,'000010086','Muttanna Waleekar',NULL,NULL,NULL,'L2','L2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'KS-Finance & Accounts','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Rukmini Chambers, Mahalaxmi Nagar,Vinayak Nagar','Bejjenki Alekhya','State Bank of India','62249445481','SBIN0020137','2025-07-01 17:33:29','1',1,NULL,NULL),(11,'DFINT2505',NULL,NULL,NULL,'Chandrashekhar M Madivalar',NULL,'chandrashekhar.madiwalar@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-6363820359',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Intern',NULL,'000010807','Nanjundappa Jugali',NULL,NULL,NULL,'L0','L0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Integrated Area Development','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Chandrashekhar M Madivalar','Union Bank of India','520481034180529','UBIN0903094','2025-07-01 17:33:30','1',1,NULL,NULL),(12,'CON400021',NULL,NULL,NULL,'Channabasava',NULL,'channabasava.yankoba@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9986925320',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Field Facilitator',NULL,'000010065','Kotresha Sandera',NULL,NULL,NULL,'L0','L0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Integrated Area Development','USF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Siruguppa','Channabasava','State Bank of India','64106855269','SBIN0040639','2025-07-01 17:33:30','1',1,NULL,NULL),(13,'000010744',NULL,NULL,NULL,'Ciyedin Salim',NULL,'ciyedin.salim@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9061886584',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Assistant Manager',NULL,'000010725','Gautham V Shanbhogue',NULL,NULL,NULL,'L3','L3.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF - GIS & Tech','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Ciyedin Salim','HDFC Bank','50100227560250','HDFC0004681','2025-07-01 17:33:30','1',1,NULL,NULL),(14,'CONT0146',NULL,NULL,NULL,'Dasari Varaprasad',NULL,'dasari.varaprasad@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-7036902254',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Executive',NULL,'000010749','Kodali Sumasree',NULL,NULL,NULL,'L1','L1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'Operation','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Rukmini Chambers, Mahalaxmi Nagar,Vinayak Nagar','Dasari Varaprasad','Union Bank of India','21510100175310','UBIN0802158','2025-07-01 17:33:30','1',1,NULL,NULL),(15,'DFINT2504',NULL,NULL,NULL,'Faiz Ali K Mulla',NULL,'faiz.ali@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9353203769',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Intern',NULL,'000010453','Santhoshkumar S Badami',NULL,NULL,NULL,'L0','L0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-MEDP','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Faiz Ali K Mulla','Canara Bank','2949101004436','CNRB0002949','2025-07-01 17:33:30','1',1,NULL,NULL),(16,'000010725',NULL,NULL,NULL,'Gautham V Shanbhogue',NULL,'gautham.shanbhogue@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9482044677',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Head - Strategy & Program Analysis',NULL,'CON00022','Anand Jayantilal Bariya',NULL,NULL,NULL,'L6','L6.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'Program Strategy and Analysis','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Gautham V Shanbhogue','Kotak Mahindra Bank','3411327223','KKBK0008079','2025-07-01 17:33:30','1',1,NULL,NULL),(17,'000010010',NULL,NULL,NULL,'Hemavathi Malleshappa Purad',NULL,'hemavathi@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9900053760',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Assistant Manager',NULL,'000010285','Savitha Kulkarni',NULL,NULL,NULL,'L3','L3.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Human Resource','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Hemavathi Malleshappa Purad','Axis Bank','913010021354676','UTIB0001811','2025-07-01 17:33:30','1',1,NULL,NULL),(18,'CON00032',NULL,NULL,NULL,'Jayathirtha Y S',NULL,'jayathirtha.ys@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9343566392',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Director',NULL,'CON00022','Anand Jayantilal Bariya',NULL,NULL,NULL,'C6','C6.2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Finance','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Jayathirtha Y S','ICICI Bank','007801013180','ICIC0000078','2025-07-01 17:33:30','1',1,NULL,NULL),(19,'CON100075',NULL,NULL,NULL,'Kallappa  Patted',NULL,'kallappa.patte@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9731069120',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Field Facilitator',NULL,'000010807','Nanjundappa Jugali',NULL,NULL,NULL,'L0','L0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Integrated Area Development','USF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Annigeri','Kallappa  Patted','Canara Bank','12502250038485','CNRB0011250','2025-07-01 17:33:30','1',1,NULL,NULL),(20,'000010805',NULL,NULL,NULL,'Kesha Udvitha',NULL,'kesha.udvitha@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9381190195',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Executive',NULL,'000010199','Ananda Kammara',NULL,NULL,NULL,'L1','L1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'KS-Human Resource','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Rukmini Chambers, Mahalaxmi Nagar,Vinayak Nagar','Kesha Udvitha','HDFC Bank','50100732986219','HDFC0002604','2025-07-01 17:33:30','1',1,NULL,NULL),(21,'CON100122',NULL,NULL,NULL,'Kiran Walikar',NULL,'kiran.walikar@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-7483163432',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Field Facilitator',NULL,'000010728','Ravi Ramudu',NULL,NULL,NULL,'L0','L0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Integrated Area Development','USF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Bagalkote','Kiran Walikar','Union Bank of India','520101237656325','UBIN0902951','2025-07-01 17:33:31','1',1,NULL,NULL),(22,'000010749',NULL,NULL,NULL,'Kodali Sumasree',NULL,'kodali.sumasree@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9398498337',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Assistant Manager',NULL,'000010733','Sahiti Meduri',NULL,NULL,NULL,'L3','L3.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'KS-Operation','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Rukmini Chambers, Mahalaxmi Nagar,Vinayak Nagar','Kodali Sumasree','Axis Bank','918010012892685','UTIB0000291','2025-07-01 17:33:31','1',1,NULL,NULL),(23,'000010065',NULL,NULL,NULL,'Kotresha Sandera',NULL,'kotresh.sandera@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9482309065',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Senior Manager',NULL,'000010807','Nanjundappa Jugali',NULL,NULL,NULL,'L5','L5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Integrated Area Development','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Sindhanur','Kotresha Sandera','Canara Bank','06132200110709','CNRB0010613','2025-07-01 17:33:31','1',1,NULL,NULL),(24,'DFCON0021',NULL,NULL,NULL,'Linganolla Srikanth',NULL,'srikanth.linganolla@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9160088735',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Executive',NULL,'000010749','Kodali Sumasree',NULL,NULL,NULL,'C1','C1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'KS-IT','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Rukmini Chambers, Mahalaxmi Nagar,Vinayak Nagar','Linganolla Srikanth','Telangana Grameena Bank','79056714334','TGRB0000414','2025-07-01 17:33:31','1',1,NULL,NULL),(25,'CON400019',NULL,NULL,NULL,'Mallikarjun K',NULL,'mallikarjun.kademane@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9535463930',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Manager',NULL,'CON00022','Anand Jayantilal Bariya',NULL,NULL,NULL,'L4','L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'New Agri Initiatives','USF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Mallikarjun K','Canara Bank','2737101012615','CNRB0002737','2025-07-01 17:33:31','1',1,NULL,NULL),(26,'000010740',NULL,NULL,NULL,'Manjula Arasapur',NULL,'manjula.arasapur@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-8747844150',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Manager',NULL,'CON00022','Anand Jayantilal Bariya',NULL,NULL,NULL,'L4','L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Financial Inclusion','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Manjula Arasapur','Bank of India','898410110001899','BKID0008984','2025-07-01 17:33:31','1',1,NULL,NULL),(27,'000010484',NULL,NULL,NULL,'Manjunath P',NULL,'manjunath.petkar@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-7411135276',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Driver',NULL,'000010035','Basavaraj S.B',NULL,NULL,NULL,'L1','L1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Operations','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Manjunath P','Karnataka Vikas Grameena Bank','89032211561','KVGB0004118','2025-07-01 17:33:31','1',1,NULL,NULL),(28,'000010483',NULL,NULL,NULL,'Manjunath Yallappa Kaihuttanavar',NULL,'manjunath.yallappa@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9148044867',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Driver',NULL,'000010035','Basavaraj S.B',NULL,NULL,NULL,'L1','L1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Operations','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Manjunath Yallappa Kaihuttanavar','Union Bank of India','520441029341519','UBIN0900648','2025-07-01 17:33:31','1',1,NULL,NULL),(29,'000010699',NULL,NULL,NULL,'Mohsin Taj',NULL,'mohsin.taj@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9986866687',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Executive',NULL,'000010348','Vijay Purohit',NULL,NULL,NULL,'L1','L1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Operations','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Mohsin Taj','Kotak Mahindra Bank','9048666988','KKBK0000446','2025-07-01 17:33:31','1',1,NULL,NULL),(30,'000010086',NULL,NULL,NULL,'Muttanna Waleekar',NULL,'muttanna.waleekar@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-7353116583',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Assistant Manager',NULL,'CON00034','Parthasarathy Sudarsanam',NULL,NULL,NULL,'L3','L3.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Finance','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Muttanna Waleekar','Canara Bank','110114910378','CNRB0011244','2025-07-01 17:33:32','1',1,NULL,NULL),(31,'000010807',NULL,NULL,NULL,'Nanjundappa Jugali',NULL,'nanjundappa.jugali@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9342150266',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Sites and Partnerships',NULL,'CON00022','Anand Jayantilal Bariya',NULL,NULL,NULL,'L6','L6.2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Integrated Area Development','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Nanjundappa Jugali','State Bank of India','64041031637','SBIN0000840','2025-07-01 17:33:32','1',1,NULL,NULL),(32,'000010075',NULL,NULL,NULL,'Naveen Kumar M P M',NULL,'naveen.mpm@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9742746502',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Senior Executive',NULL,'000010275','Shankarsingh Kalaghatagi',NULL,NULL,NULL,'L2','L2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'IT','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Naveen Kumar M P M','Kotak Mahindra Bank','3148257985','KKBK0000446','2025-07-01 17:33:32','1',1,NULL,NULL),(33,'000010806',NULL,NULL,NULL,'Parmeshwar Kanhere',NULL,'parmeshwar.kanhere@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-8408973695',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Executive',NULL,'000010275','Shankarsingh Kalaghatagi',NULL,NULL,NULL,'L2','L2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Information technology','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Parmeshwar Kanhere','Maharashtra Gramin Bank','80062657865','MAHG0005209','2025-07-01 17:33:32','1',1,NULL,NULL),(34,'CON00034',NULL,NULL,NULL,'Parthasarathy Sudarsanam',NULL,'parthasarathy.sudarsanam@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9845076901',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Head Finance & Accounts',NULL,'000010485','Narasimha Nayak Perampalli',NULL,NULL,NULL,'C6','C6.2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Finance','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Parthasarathy Sudarsanam','Union Bank of India','520101066963172','UBIN0901440','2025-07-01 17:33:32','1',1,NULL,NULL),(35,'000010094',NULL,NULL,NULL,'Pavan Mahendrakar',NULL,'pavan.mahendrakar@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9980486880',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Senior Executive',NULL,'000010086','Muttanna Waleekar',NULL,NULL,NULL,'L2','L2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Finance','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Pavan Mahendrakar','Canara Bank','08102190001429','CNRB0011244','2025-07-01 17:33:32','1',1,NULL,NULL),(36,'CON100220',NULL,NULL,NULL,'Payal Ekbote',NULL,'payal.ekbote@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9606143719',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Executive',NULL,'000010740','Manjula Arasapur',NULL,NULL,NULL,'L1','L1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Financial Inclusion','USF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Payal Ekbote','Canara Bank','8655101005997','CNRB0008655','2025-07-01 17:33:32','1',1,NULL,NULL),(37,'000010624',NULL,NULL,NULL,'Praveen Honnappa Ambiga',NULL,'praveen.ambiga@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9535680880',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Deputy  Manager',NULL,'000010740','Manjula Arasapur',NULL,NULL,NULL,'L3','L3.2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Financial Inclusion','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Praveen Honnappa Ambiga','State Bank of India','54058659341','SBIN0041044','2025-07-01 17:33:32','1',1,NULL,NULL),(38,'000010769',NULL,NULL,NULL,'Rahul Vishnu Ghope',NULL,'rahul.ghope@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-8793042404',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Innovation Associate',NULL,'000010807','Nanjundappa Jugali',NULL,NULL,NULL,'L2','L2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-CEO Office','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Sindhudurg','Rahul Vishnu Ghope','State Bank of India','32466215839','SBIN0000407','2025-07-01 17:33:32','1',1,NULL,NULL),(39,'CON100102',NULL,NULL,NULL,'Ramajansab Allisab Nadaf',NULL,'ramajanasab.nadaf@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9743164393',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Field Facilitator',NULL,'000010807','Nanjundappa Jugali',NULL,NULL,NULL,'L0','L0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Integrated Area Development','USF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Navalgund','Ramajansab Allisab Nadaf','State Bank of India','64148066739','SBIN0040828','2025-07-01 17:33:32','1',1,NULL,NULL),(40,'CONT0150',NULL,NULL,NULL,'Rasoolabai Mohammed Waseem Ahammed',NULL,'waseemahammed.rm@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-8125295088',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Deputy Manager',NULL,'000010655','Manish Kumar Jaiswal',NULL,NULL,NULL,'C3','C3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'Operation','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Rukmini Chambers, Mahalaxmi Nagar,Vinayak Nagar','Rasoolabai Mohammed Waseem Ahammed','State Bank of India','30404956237','SBIN0000923','2025-07-01 17:33:33','1',1,NULL,NULL),(41,'000010728',NULL,NULL,NULL,'Ravi Ramudu',NULL,'ravi.ramudu@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9742178750',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Assistant Manager',NULL,'000010807','Nanjundappa Jugali',NULL,NULL,NULL,'L3','L3.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Integrated Area Development','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Bagalkote','Ravi Ramudu','State Bank of India','64067432541','SBIN0013290','2025-07-01 17:33:33','1',1,NULL,NULL),(42,'000010325',NULL,NULL,NULL,'Ravichandrayya Kadlimath',NULL,'ravichandrayya.kadlimath@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9591075582',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Assistant Manager',NULL,'000010018','Sandeepkumar Naik',NULL,NULL,NULL,'L3','L3.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Farm Pond','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Ravichandrayya Kadlimath','Karnataka Vikas Grameena Bank','89033186789','KVGB0007601','2025-07-01 17:33:33','1',1,NULL,NULL),(43,'000010013',NULL,NULL,NULL,'Sagar Shanthaveer Hosur',NULL,'sagar.h@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-8904881522',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Assistant Manager',NULL,'000010251','Sunil Chitragar',NULL,NULL,NULL,'L3','L3.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'Operation','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Sagar Shanthaveer Hosur','Kotak Mahindra Bank','3148257978','KKBK0000446','2025-07-01 17:33:33','1',1,NULL,NULL),(44,'000010018',NULL,NULL,NULL,'Sandeepkumar Naik',NULL,'sandeepkumar@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9740657513',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Deputy Director',NULL,'CON00022','Anand Jayantilal Bariya',NULL,NULL,NULL,'L6','L6.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Farm Pond','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Sandeepkumar Naik','Axis Bank','913010051453552','UTIB0001811','2025-07-01 17:33:33','1',1,NULL,NULL),(45,'000010453',NULL,NULL,NULL,'Santhoshkumar S Badami',NULL,'santoshkumar.badami@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-8050170402',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Deputy Manager',NULL,'CON00022','Anand Jayantilal Bariya',NULL,NULL,NULL,'L3','L3.2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-MEDP','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Santhoshkumar S Badami','ICICI Bank','015701536206','ICIC0000157','2025-07-01 17:33:33','1',1,NULL,NULL),(46,'000010187',NULL,NULL,NULL,'Santosh B Barker',NULL,'santosh.baraker@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9538278943',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Driver',NULL,'000010027','Ramesh Channappa Hubballi',NULL,NULL,NULL,'L1','L1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'Operation','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Deshpande Skill Development Center,Airport Road,','Santosh B Barker','Union Bank of India','520101004343227','UBIN0533173','2025-07-01 17:33:33','1',1,NULL,NULL),(47,'000010285',NULL,NULL,NULL,'Savitha Kulkarni',NULL,'savitha.kulkarni@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9036064713',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Senior Manager',NULL,'000010726','Sonali Sarma',NULL,NULL,NULL,'L5','L5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'HR','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Savitha Kulkarni','HDFC Bank','50100315589260','HDFC0000254','2025-07-01 17:33:33','1',1,NULL,NULL),(48,'000010244',NULL,NULL,NULL,'Seema Kudari',NULL,'seema.kudari@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9739729014',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Assistant Manager',NULL,'000010726','Sonali Sarma',NULL,NULL,NULL,'L3','L3.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Human Resource','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Seema Kudari','Karnataka Vikas Grameena Bank','89134768208','KVGB0004008','2025-07-01 17:33:33','1',1,NULL,NULL),(49,'000010014',NULL,NULL,NULL,'Shivanand Somannavar',NULL,'shivanand.s@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9743759138',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Senior Manager',NULL,'CON00022','Anand Jayantilal Bariya',NULL,NULL,NULL,'L5','L5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-MEDP','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Shivanand Somannavar','Axis Bank','913010023899542','UTIB0001811','2025-07-01 17:33:33','1',1,NULL,NULL),(50,'DFCON2502',NULL,NULL,NULL,'Siddhesh Babu Palav',NULL,'siddhesh.palav@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-7558605130',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Associate',NULL,'000010807','Nanjundappa Jugali',NULL,NULL,NULL,'L1','L1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Integrated Area Development','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Sindhudurg','Siddhesh Babu Palav','State Bank of India','41070294173','SBIN0001245','2025-07-01 17:33:34','1',1,NULL,NULL),(51,'000010726',NULL,NULL,NULL,'Sonali Sarma',NULL,'sonali.sarma@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9004476309',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Head-HR',NULL,'CON00022','Anand Jayantilal Bariya',NULL,NULL,NULL,'L7','L7.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'HR','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Sonali Sarma','HDFC Bank','01461140021548','HDFC0000146','2025-07-01 17:33:34','1',1,NULL,NULL),(52,'000010286',NULL,NULL,NULL,'Srinivasa H',NULL,'shrinivas.holagundi@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-8722589919',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Deputy  Manager',NULL,'000010807','Nanjundappa Jugali',NULL,NULL,NULL,'L3','L3.2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Integrated Area Development','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Sindhanur','Srinivasa H','ICICI Bank','142601000654','ICIC0001426','2025-07-01 17:33:34','1',1,NULL,NULL),(53,'000010150',NULL,NULL,NULL,'Sunita Abbai',NULL,'sunita.abbai@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9902893476',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Senior Executive',NULL,'000010251','Sunil Chitragar',NULL,NULL,NULL,'L2','L2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Operations','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Sunita Abbai','Kotak Mahindra Bank','9048666957','KKBK0000446','2025-07-01 17:33:34','1',1,NULL,NULL),(54,'000010774',NULL,NULL,NULL,'Suraj Shripad Patil',NULL,'suraj.patil@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-8660702126',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Executive',NULL,'000010725','Gautham V Shanbhogue',NULL,NULL,NULL,'L1','L1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF - GIS & Tech','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Suraj Shripad Patil','Karnataka Bank','3052500114866001','KARB0000305','2025-07-01 17:33:34','1',1,NULL,NULL),(55,'CON100208',NULL,NULL,NULL,'Suresh Talawar',NULL,'suresh.talwar@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-7899696190',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Labour',NULL,'CON100016','VIJAY KULKARNI',NULL,NULL,NULL,'L0','L1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'New Agri Initiatives','USF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Hulgur','Suresh Talawar','State Bank of India','39378011152','SBIN0040856','2025-07-01 17:33:34','1',1,NULL,NULL),(56,'000010600',NULL,NULL,NULL,'Swapna Ankola',NULL,'swapna.ankola@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9620333036',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Senior Manager',NULL,'000010725','Gautham V Shanbhogue',NULL,NULL,NULL,'L5','L5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'Program Strategy and Analysis','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Swapna Ankola','Canara Bank','12442010032484','CNRB0011244','2025-07-01 17:33:34','1',1,NULL,NULL),(57,'DFCON2503',NULL,NULL,NULL,'Tejas Tukaram Sawant',NULL,'tejas.sawant@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-7620882245',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Associate',NULL,'000010807','Nanjundappa Jugali',NULL,NULL,NULL,'L1','L1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Integrated Area Development','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Sindhudurg','Tejas Tukaram Sawant','State Bank of India','41607309719','SBIN0001245','2025-07-01 17:33:34','1',1,NULL,NULL),(58,'CON100016',NULL,NULL,NULL,'Vijay Kulkarni',NULL,'vijaykeshavrao.kulkarni@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-7996398693',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Field Facilitator',NULL,'CON400019','Mallikarjun K',NULL,NULL,NULL,'L0','L0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'New Agri Initiatives','USF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Hulgur','Vijay Kulkarni','Union Bank of India','520291021426530','UBIN0915688','2025-07-01 17:33:34','1',1,NULL,NULL),(59,'000010752',NULL,NULL,NULL,'Vinaykumar Vardhaman Upadhye',NULL,'vinaykumar.upadhye@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-8748895071',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Executive',NULL,'000010285','Savitha Kulkarni',NULL,NULL,NULL,'L1','L1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Human Resource','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Vinaykumar Vardhaman Upadhye','State Bank of India','64117192310','SBIN0040997','2025-07-01 17:33:34','1',1,NULL,NULL),(60,'CON100132',NULL,NULL,NULL,'Vinod Gangadhar Meti',NULL,'vinod.meti@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9741303553',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Field Facilitator',NULL,'000010807','Nanjundappa Jugali',NULL,NULL,NULL,'L0','L0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Integrated Area Development','USF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Annigeri','Vinod Gangadhar Meti','Canara Bank','12502210019027','CNRB0011250','2025-07-01 17:33:34','1',1,NULL,NULL),(61,'CON100006',NULL,NULL,NULL,'Virappa Bhimappa Bijapur',NULL,'virappa.bijapur@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9535220110',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Field Facilitator',NULL,'000010807','Nanjundappa Jugali',NULL,NULL,NULL,'L0','L0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Integrated Area Development','USF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Navalgund','Virappa Bhimappa Bijapur','CANARA BANK','3039101004982','CNRB0003039','2025-07-01 17:33:35','1',1,NULL,NULL),(62,'CON100042',NULL,NULL,NULL,'Vitthal Shankar Metri',NULL,'vitthal.metri@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9620566146',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Field Facilitator',NULL,'000010728','Ravi Ramudu',NULL,NULL,NULL,'L0','L0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DF-Integrated Area Development','USF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Bijapur','Vitthal Shankar Metri','State Bank of India','31674630140','SBIN0002224','2025-07-01 17:33:35','1',1,NULL,NULL),(63,'000010655',NULL,NULL,NULL,'Manish Kumar Jaiswal',NULL,'manish.jaiswal@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9043385719',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Chief executive officer',NULL,'000010655','Manish Kumar Jaiswal',NULL,NULL,NULL,'L7','L7.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'DS-CEO Office','Foundation for Sandboxstartup Initiatives',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Foundation for Sandboxstartup Initiatives, Gokul Road,','Manish Kumar Jaiswal','HDFC Bank','50100164188599','HDFC0002757','2025-07-01 17:54:11','1',1,NULL,NULL),(64,'000010485',NULL,NULL,NULL,'Narasimha Nayak Perampalli',NULL,'pnnayak@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9849656663',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Chief executive officer',NULL,'000010485','Narasimha Nayak Perampalli',NULL,NULL,NULL,'L7','L7.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'CEO Office','Deshpande Educational Trust',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Deshpande Skill Development Center,Airport Road,','Narasimha Nayak Perampalli','ICICI Bank','004801018696','ICIC0000048','2025-07-01 17:54:11','1',1,NULL,NULL),(65,'000010348',NULL,NULL,NULL,'Vijay Purohit',NULL,'vijay.purohit@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9591217091',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Senior Director',NULL,'CON00022','Anand Jayantilal Bariya',NULL,NULL,NULL,'L6','L6.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'Operation','Foundation for Sandboxstartup Initiatives',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Vijay Purohit','State Bank of India','36518584505','SBIN0040606','2025-07-01 17:54:11','1',1,NULL,NULL),(66,'000010199',NULL,NULL,NULL,'Ananda Kammara',NULL,'anand.kammara@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9538935778',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Deputy Manager',NULL,'000010726','Sonali Sarma',NULL,NULL,NULL,'L3','L3.2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'HR','Deshpande Educational Trust',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Deshpande Skill Development Center,Airport Road,','Ananda Kammara','Kotak Mahindra Bank','3649258375','KKBK0000446','2025-07-01 17:54:11','1',1,NULL,NULL),(67,'000010733',NULL,NULL,NULL,'Sahiti Meduri',NULL,'sahiti.meduri@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9398184137',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Head - kakatiya Sandbox',NULL,'000010655','Manish Kumar Jaiswal',NULL,NULL,NULL,'L4','L4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'KREST','Foundation for Sandboxstartup Initiatives',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Rukmini Chambers, Mahalaxmi Nagar,Vinayak Nagar','Sahiti Meduri','Axis Bank','922010017287555','UTIB0003659','2025-07-01 17:54:11','1',1,NULL,NULL),(68,'000010275',NULL,NULL,NULL,'Shankarsingh Kalaghatagi',NULL,'shankarsingh.kalaghatagi@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9448707761',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Assistant Manager',NULL,'000010348','Vijay Purohit',NULL,NULL,NULL,'L3','L3.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'IT','Deshpande Educational Trust',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Deshpande Skill Development Center,Airport Road,','Shankarsingh Kalaghatagi','ICICI Bank','015701523016','ICIC0000157','2025-07-01 17:54:11','1',1,NULL,NULL),(69,'000010251',NULL,NULL,NULL,'Sunil Chitragar',NULL,'sunil.c@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9845283722',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Deputy Manager',NULL,'000010348','Vijay Purohit',NULL,NULL,NULL,'L3','L3.2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'Operation','Deshpande Educational Trust',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Deshpande Skill Development Center,Airport Road,','Sunil Chitragar','Bank of Baroda','139101011000594','BARB0VJMDHA','2025-07-01 17:54:11','1',1,NULL,NULL),(70,'000010027',NULL,NULL,NULL,'Ramesh Channappa Hubballi',NULL,'ramesh.hubballi@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-7676442646',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Senior Executive',NULL,'000010032','Chandrashekhar G',NULL,NULL,NULL,'L2','L2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'Operation','Foundation for Sandboxstartup Initiatives',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Deshpande Skill Development Center,Airport Road,','Ramesh Channappa Hubballi','ICICI Bank','142601505258','ICIC0001426','2025-07-01 17:54:12','1',1,NULL,NULL),(71,'000010784',NULL,NULL,NULL,'Amlanjyoti Laha',NULL,'amlanjyoti.laha@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9830624865',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Data Analyst',NULL,'000010725','Gautham V Shanbhogue',NULL,NULL,NULL,'L3','L3.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DF - GIS & Tech','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,',NULL,'State Bank of India','37488694534','SBIN0012459','2025-07-02 13:06:00','1',NULL,'2025-07-02 13:40:40',1);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entities`
--

DROP TABLE IF EXISTS `entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entities` (
  `entity_id` int NOT NULL AUTO_INCREMENT,
  `org_id` int DEFAULT NULL,
  `entity_name` varchar(255) DEFAULT NULL,
  `address` text,
  `entity_code` varchar(50) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`entity_id`),
  KEY `org_id` (`org_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `entities_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `organization` (`org_id`),
  CONSTRAINT `entities_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities`
--

LOCK TABLES `entities` WRITE;
/*!40000 ALTER TABLE `entities` DISABLE KEYS */;
INSERT INTO `entities` VALUES (1,1,'Deshpande Foundation','DCSE Building, B, V.B. Campus, Vidya Nagar, Hubballi, Karnataka 580031','DF',1,NULL,'Deshpande Foundation'),(2,1,'Deshpande Educational Trust','9338+8JV, Hosur - Unkal Bypass Rd, Chetana Colony, Vidya Nagar, Hubballi, Karnataka 580021','DE',1,NULL,'Deshpande Skilling'),(3,1,'Foundation for Sandboxstartup Initiatives','Foundation for Sandboxstartup Initiatives, Gokul Rd, next to International Airport, opposite Gokul, Gokul, Hubballi, Karnataka 580030','DS',1,NULL,'Deshpande Startup'),(4,1,'USF','DCSE Building, B, V.B. Campus, Vidya Nagar, Hubballi, Karnataka 580031','DF',1,NULL,'Deshpande Foundation');
/*!40000 ALTER TABLE `entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense`
--

DROP TABLE IF EXISTS `expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense` (
  `expense_id` int NOT NULL AUTO_INCREMENT,
  `expense_name` varchar(255) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  PRIMARY KEY (`expense_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `expense_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense`
--

LOCK TABLES `expense` WRITE;
/*!40000 ALTER TABLE `expense` DISABLE KEYS */;
INSERT INTO `expense` VALUES (1,'Program Expense',1),(2,'General & Administrative Expense',1);
/*!40000 ALTER TABLE `expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense_category`
--

DROP TABLE IF EXISTS `expense_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense_category` (
  `expense_category_id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(30) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`expense_category_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `expense_category_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense_category`
--

LOCK TABLES `expense_category` WRITE;
/*!40000 ALTER TABLE `expense_category` DISABLE KEYS */;
INSERT INTO `expense_category` VALUES (1,'Reimbursement',1,'Reimbursement'),(2,'Procurement',1,'Procurement'),(3,'Advance',1,'Advance');
/*!40000 ALTER TABLE `expense_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `reimb_dtls_id` int DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `reimb_dtls_id` (`reimb_dtls_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`reimb_dtls_id`) REFERENCES `re_ticket_details` (`reimb_dtls_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,2,'2025-07-01 00:00:00'),(2,31,'2025-06-27 00:00:00'),(3,41,'2025-07-12 00:00:00'),(4,42,'2025-07-12 00:00:00'),(5,47,'2025-07-11 00:00:00'),(6,77,'2025-07-21 00:00:00'),(7,78,'2025-07-23 00:00:00'),(8,79,'2025-07-23 00:00:00'),(9,80,'2025-07-24 00:00:00'),(10,81,'2025-07-23 00:00:00'),(11,82,'2025-07-24 00:00:00'),(12,83,'2025-07-24 00:00:00'),(13,89,'2025-07-24 00:00:00'),(14,91,'2025-07-25 00:00:00'),(15,97,'2025-07-23 00:00:00'),(16,102,'2025-07-25 00:00:00'),(17,113,'2025-07-26 00:00:00'),(18,114,'2025-07-28 00:00:00'),(19,130,'2025-07-28 00:00:00');
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ledgers`
--

DROP TABLE IF EXISTS `ledgers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ledgers` (
  `ledger_id` int NOT NULL AUTO_INCREMENT,
  `entity_id` int DEFAULT NULL,
  `ledger_code` varchar(50) DEFAULT NULL,
  `ledger_name` varchar(100) DEFAULT NULL,
  `ledger_type` varchar(50) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  PRIMARY KEY (`ledger_id`),
  KEY `status_id` (`status_id`),
  KEY `categories` (`category_id`),
  CONSTRAINT `ledgers_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`),
  CONSTRAINT `ledgers_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ledgers`
--

LOCK TABLES `ledgers` WRITE;
/*!40000 ALTER TABLE `ledgers` DISABLE KEYS */;
INSERT INTO `ledgers` VALUES (1,NULL,'00001','Awards & Gifts-Program','1',4,1),(2,NULL,'00002','Guest Expenses- Program','1',4,1),(3,NULL,'00003','Travel Expenses-Program','1',2,1),(4,NULL,'00004','Food Expenses-Program','1',1,1),(5,NULL,'00005','Accommodation Expenses-Program','1',3,1),(6,NULL,'00006','Cell phone Charges-Program','1',4,1),(7,NULL,'00007','Electricity Charges-Program','1',4,1),(8,NULL,'00008','Event Expenses-Program','1',4,1),(9,NULL,'00009','Fuel Expenses - Office Vehicle','1',4,1),(10,NULL,'00010','Housekeeping and Security Charges','1',4,1),(11,NULL,'00011','Housekeeping Materials','1',4,1),(12,NULL,'00012','Internet Broadband & Data Card Charges-Program','1',4,1),(13,NULL,'00013','Lease & Rentals-Program','1',4,1),(14,NULL,'00014','License & Renewals-Program','1',4,1),(15,NULL,'00015','Medical Expenses-Program','1',4,1),(16,NULL,'00016','News Paper & Periodicals-Program','1',4,1),(17,NULL,'00017','Other Office Expenses-Program','1',4,1),(18,NULL,'00018','Postage & Courier Charges-Program','1',4,1),(19,NULL,'00019','Printing & Stationery- Program','1',4,1),(20,NULL,'00020','Professional Fees- Program','1',4,1),(21,NULL,'00021','Rates & Taxes-Program','1',4,1),(22,NULL,'00022','Staff Welfare-Program','1',4,1),(23,NULL,'00023','Telephone Charges-Program','1',4,1),(24,NULL,'00024','Toll & Parking Charges-Program','1',4,1),(25,NULL,'00025','Training Expenses-Program','1',4,1),(26,NULL,'00026','Water Charges-Program','1',4,1),(27,NULL,'00027','Web Maintenance & Domain Charges-Program','1',4,1),(28,NULL,'00028','Fuel expenses- DG-Program','1',4,1),(29,NULL,'00029','Awards & Gifts-Admin','2',4,1),(30,NULL,'00030','Guest Expenses- Admin','2',4,1),(31,NULL,'00031','Travel Expenses-Admin','2',2,1),(32,NULL,'00032','Food Expenses-Admin','2',1,1),(33,NULL,'00033','Accommodation Expenses-Admin','2',3,1),(34,NULL,'00034','Cell phone Charges-Admin','2',4,1),(35,NULL,'00035','Electricity Charges-Admin','2',4,1),(36,NULL,'00036','Event Expenses-Admin','2',4,1),(37,NULL,'00037','Internet Broadband & Data Card Charges-admin','2',4,1),(38,NULL,'00038','Lease & Rentals-Admin','2',4,1),(39,NULL,'00039','License & Renewals-Admin','2',4,1),(40,NULL,'00040','Medical Expenses-Admin','2',4,1),(41,NULL,'00041','Other Office Expenses-Admin','2',4,1),(42,NULL,'00042','Postage & Courier Charges-Admin','2',4,1),(43,NULL,'00043','Printing & Stationery- Admin','2',4,1),(44,NULL,'00044','Professional Fees- Admin','2',4,1),(45,NULL,'00045','Rates & Taxes- Admin','2',4,1),(46,NULL,'00046','Repairs & Maintenance -Building-Admin','2',4,1),(47,NULL,'00047','Repairs & Maintenance -Computers-Admin','2',4,1),(48,NULL,'00048','Repairs & Maintenance -General-Admin','2',4,1),(49,NULL,'00049','Repairs & Maintenance -Vehicles-Admin','2',4,1),(50,NULL,'00050','Staff Welfare-Admin','2',4,1),(51,NULL,'00051','Telephone Charges-Admin','2',4,1),(52,NULL,'00052','Toll & Parking Charges-Admin','2',4,1),(53,NULL,'00053','Training Expenses-Admin','2',4,1),(54,NULL,'00054','Water Charges-Admin','2',4,1),(55,NULL,'00055','Web Maintenance & Domain Charges-Admin','2',4,1),(56,NULL,'00056','Fuel expenses- DG-Admin','2',4,1),(57,NULL,'00057','Vehicle Insurance-Admin','2',4,1),(58,NULL,'00058','Vehicle Tax-Admin','2',4,1);
/*!40000 ALTER TABLE `ledgers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `levels` (
  `level_id` int NOT NULL AUTO_INCREMENT,
  `level_name` varchar(100) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`level_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `level_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES (1,'User',1,'At any condition it is at the initial stage(User Stage)'),(2,'Manager',1,'At this stage the report is with the Manager.'),(3,'Finance Processor',1,'At this stage the report is with Finance Processor'),(4,'Finance Approver',1,'At this stage the report is with Finance Approver'),(5,'Excel Ready for Payment',1,'At this stage excel is ready to be downloaded'),(6,'FA Excel Downloaded for Payment',1,'At this stage the ticket has been downloaded in excel for Bank Payment'),(7,'UTR Uploaded',1,'At this stage the UTR number is being uploaded'),(8,NULL,1,'Just Blank');
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_details`
--

DROP TABLE IF EXISTS `login_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_details` (
  `login_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `login_type` varchar(30) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  PRIMARY KEY (`login_id`),
  KEY `status_id` (`status_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `login_details_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`),
  CONSTRAINT `login_details_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_details`
--

LOCK TABLES `login_details` WRITE;
/*!40000 ALTER TABLE `login_details` DISABLE KEYS */;
INSERT INTO `login_details` VALUES (1,6,'google','2025-07-01 17:33:59','2025-07-16 13:11:33',5),(2,39,'google','2025-07-01 17:36:47',NULL,1),(3,33,'google','2025-07-01 17:37:20','2025-07-02 17:36:15',5),(4,32,'google','2025-07-01 17:38:00','2025-07-02 11:42:38',5),(5,1,'normal','2025-07-01 17:42:29','2025-07-01 17:42:33',5),(6,1,'normal','2025-07-01 17:53:59','2025-07-01 17:56:36',5),(7,1,'normal','2025-07-02 10:58:15','2025-07-02 11:53:44',5),(8,1,'normal','2025-07-02 13:01:23','2025-07-02 16:39:43',5),(9,72,'normal','2025-07-02 13:10:11','2025-07-02 13:23:40',5),(10,72,'normal','2025-07-02 13:38:30','2025-07-02 13:39:57',5),(11,72,'normal','2025-07-02 13:40:47','2025-07-02 16:39:58',5),(12,1,'google','2025-07-02 16:39:51','2025-07-02 16:48:11',5),(13,72,'google','2025-07-02 16:40:16','2025-07-02 16:40:24',5),(14,72,'google','2025-07-02 16:40:34','2025-07-02 16:43:07',5),(15,72,'google','2025-07-02 16:43:21','2025-07-02 16:43:29',5),(16,72,'normal','2025-07-02 16:43:48','2025-07-03 09:36:18',5),(17,19,'normal','2025-07-02 16:50:07','2025-07-02 19:06:06',5),(18,10,'google','2025-07-02 16:51:31',NULL,1),(19,59,'google','2025-07-02 16:53:49',NULL,1),(20,54,'normal','2025-07-02 16:55:34',NULL,1),(21,1,'normal','2025-07-02 16:55:50','2025-07-02 17:09:32',5),(22,32,'google','2025-07-02 17:01:41','2025-07-04 09:51:55',5),(23,66,'normal','2025-07-02 17:05:36',NULL,1),(24,1,'normal','2025-07-02 17:09:47','2025-07-02 17:09:51',5),(25,1,'google','2025-07-02 17:09:56','2025-07-03 10:37:31',5),(26,5,'normal','2025-07-02 17:11:34',NULL,1),(27,48,'google','2025-07-02 17:26:15',NULL,1),(28,21,'normal','2025-07-02 17:28:34',NULL,1),(29,56,'normal','2025-07-02 17:37:57','2025-07-02 17:45:47',5),(30,56,'google','2025-07-02 17:46:12','2025-07-03 11:13:56',5),(31,16,'google','2025-07-02 17:56:33','2025-07-02 18:08:59',5),(32,15,'google','2025-07-02 18:03:35','2025-07-24 17:25:26',5),(33,16,'google','2025-07-02 18:09:48','2025-07-05 10:16:35',5),(34,19,'normal','2025-07-02 19:07:32','2025-07-02 23:03:38',5),(35,61,'google','2025-07-02 19:25:06','2025-07-02 19:46:05',5),(36,31,'google','2025-07-02 19:29:52','2025-07-07 13:03:34',5),(37,60,'normal','2025-07-02 21:03:16','2025-07-02 21:28:54',5),(38,60,'normal','2025-07-02 21:28:59',NULL,1),(39,61,'google','2025-07-02 23:12:12',NULL,1),(40,72,'normal','2025-07-03 09:36:32','2025-07-03 09:37:42',5),(41,31,'normal','2025-07-03 09:37:50','2025-07-03 09:38:24',5),(42,72,'google','2025-07-03 09:38:32',NULL,1),(43,38,'normal','2025-07-03 09:54:32',NULL,1),(44,72,'normal','2025-07-03 09:57:19',NULL,1),(45,1,'normal','2025-07-03 10:37:39',NULL,1),(46,72,'normal','2025-07-03 10:38:42','2025-07-03 10:40:56',5),(47,56,'google','2025-07-03 11:14:11',NULL,1),(48,47,'normal','2025-07-03 11:28:35','2025-07-03 17:08:18',5),(49,35,'google','2025-07-03 12:15:49',NULL,1),(50,1,'google','2025-07-03 14:36:18',NULL,1),(51,35,'normal','2025-07-03 15:38:51','2025-07-03 15:52:57',5),(52,30,'normal','2025-07-03 15:38:57','2025-07-03 15:41:21',5),(53,71,'normal','2025-07-03 15:41:41','2025-07-03 15:44:07',5),(54,71,'normal','2025-07-03 15:44:16','2025-07-03 16:08:42',5),(55,35,'normal','2025-07-03 15:53:13','2025-07-03 16:35:39',5),(56,35,'normal','2025-07-03 16:35:53','2025-07-03 16:49:16',5),(57,71,'normal','2025-07-03 16:40:58','2025-07-03 16:41:30',5),(58,30,'normal','2025-07-03 16:42:08','2025-07-03 16:42:58',5),(59,71,'normal','2025-07-03 16:45:18','2025-07-03 17:29:32',5),(60,71,'normal','2025-07-03 16:54:56',NULL,1),(61,1,'google','2025-07-03 17:16:29','2025-07-03 17:18:03',5),(62,1,'normal','2025-07-03 18:14:45','2025-07-07 18:16:01',5),(63,71,'normal','2025-07-04 10:41:35','2025-07-04 11:20:00',5),(64,35,'normal','2025-07-04 10:42:20','2025-07-05 17:44:25',5),(65,68,'normal','2025-07-04 10:46:59','2025-07-04 10:50:16',5),(66,72,'normal','2025-07-04 10:56:35',NULL,1),(67,1,'normal','2025-07-04 10:57:24','2025-07-04 10:57:27',5),(68,57,'google','2025-07-04 11:55:07','2025-07-15 15:28:59',5),(69,19,'normal','2025-07-04 16:11:50',NULL,1),(70,23,'normal','2025-07-05 08:38:58','2025-07-24 21:08:39',5),(71,72,'google','2025-07-05 09:27:27',NULL,1),(72,11,'normal','2025-07-05 09:53:56','2025-07-05 13:15:55',5),(73,16,'google','2025-07-05 10:16:45','2025-07-06 18:14:42',5),(74,11,'google','2025-07-05 13:25:46','2025-07-07 10:18:48',5),(75,71,'normal','2025-07-05 16:41:18','2025-07-05 17:03:16',5),(76,18,'normal','2025-07-05 17:04:57','2025-07-05 17:10:14',5),(77,35,'normal','2025-07-05 17:48:05','2025-07-05 17:53:14',5),(78,71,'normal','2025-07-05 17:53:41',NULL,1),(79,11,'normal','2025-07-07 10:19:50','2025-07-07 15:19:50',5),(80,37,'normal','2025-07-07 10:50:43',NULL,1),(81,31,'google','2025-07-07 13:04:02',NULL,1),(82,16,'google','2025-07-07 13:15:25','2025-07-07 13:41:53',5),(83,1,'normal','2025-07-07 13:42:10','2025-07-07 13:46:15',5),(84,16,'google','2025-07-07 13:42:49','2025-07-12 16:39:28',5),(85,71,'normal','2025-07-07 14:17:34','2025-07-07 14:18:37',5),(86,71,'normal','2025-07-07 14:25:47','2025-07-07 14:26:46',5),(87,11,'normal','2025-07-07 15:23:48','2025-07-07 16:59:03',5),(88,11,'normal','2025-07-07 17:33:08','2025-07-09 16:31:53',5),(89,1,'google','2025-07-08 10:01:05','2025-07-08 13:36:49',5),(90,71,'normal','2025-07-08 10:47:02','2025-07-08 10:47:49',5),(91,31,'google','2025-07-08 11:43:21','2025-07-16 09:37:40',5),(92,35,'normal','2025-07-08 13:05:49',NULL,1),(93,71,'normal','2025-07-08 13:07:19','2025-07-08 13:17:31',5),(94,1,'google','2025-07-08 13:37:07',NULL,1),(95,1,'google','2025-07-08 17:04:35','2025-07-08 17:44:47',5),(96,1,'google','2025-07-08 17:44:55',NULL,1),(97,41,'google','2025-07-09 09:20:28','2025-07-16 10:59:59',5),(98,11,'normal','2025-07-09 16:34:13',NULL,1),(99,11,'normal','2025-07-10 10:04:31','2025-07-17 10:05:16',5),(100,1,'normal','2025-07-10 10:05:10',NULL,1),(101,35,'normal','2025-07-10 10:06:06',NULL,1),(102,1,'normal','2025-07-10 10:24:30',NULL,1),(103,35,'normal','2025-07-10 10:24:33','2025-07-12 15:00:49',5),(104,71,'normal','2025-07-10 10:28:45','2025-07-10 10:49:13',5),(105,71,'normal','2025-07-10 10:49:01','2025-07-10 13:20:45',5),(106,1,'normal','2025-07-10 11:10:34',NULL,1),(107,1,'google','2025-07-10 11:27:25',NULL,1),(108,30,'normal','2025-07-10 13:21:27','2025-07-10 13:21:37',5),(109,71,'normal','2025-07-10 14:48:53','2025-07-10 18:06:38',5),(110,54,'google','2025-07-11 10:16:46','2025-07-18 16:36:35',5),(111,72,'google','2025-07-11 10:17:06','2025-07-11 10:48:33',5),(112,71,'normal','2025-07-11 10:17:50','2025-07-11 18:36:08',5),(113,57,'normal','2025-07-11 10:49:23','2025-07-23 16:23:26',5),(114,1,'google','2025-07-11 19:00:59','2025-07-21 10:40:45',5),(115,1,'normal','2025-07-11 19:04:35','2025-07-23 16:22:56',5),(116,41,'google','2025-07-11 19:25:50',NULL,1),(117,41,'google','2025-07-11 21:59:04',NULL,1),(118,62,'normal','2025-07-12 14:52:53','2025-07-26 13:07:47',5),(119,31,'google','2025-07-12 16:29:28',NULL,1),(120,57,'normal','2025-07-12 17:25:33','2025-07-12 18:02:32',5),(121,3,'google','2025-07-14 12:20:34','2025-07-21 12:20:54',5),(122,54,'normal','2025-07-14 12:28:04','2025-07-14 12:29:42',5),(123,41,'google','2025-07-14 21:38:02','2025-07-27 07:01:13',5),(124,35,'normal','2025-07-15 10:14:55','2025-07-22 14:27:46',5),(125,71,'normal','2025-07-15 10:15:24','2025-07-15 10:15:52',5),(126,13,'normal','2025-07-15 11:17:28','2025-07-15 15:08:42',5),(127,13,'normal','2025-07-15 15:08:48','2025-07-24 15:31:14',5),(128,57,'normal','2025-07-15 15:29:31','2025-07-15 15:38:31',5),(129,31,'google','2025-07-16 09:37:54',NULL,1),(130,41,'google','2025-07-16 13:04:09',NULL,1),(131,6,'google','2025-07-16 13:11:48','2025-07-29 11:58:23',5),(132,11,'normal','2025-07-17 10:19:28',NULL,1),(133,11,'google','2025-07-17 10:21:19','2025-07-24 18:31:15',5),(134,18,'normal','2025-07-17 13:57:30',NULL,1),(135,71,'normal','2025-07-18 09:38:37','2025-07-18 10:11:51',5),(136,57,'normal','2025-07-18 10:25:09','2025-07-25 14:02:43',5),(137,18,'normal','2025-07-18 10:54:31',NULL,1),(138,48,'normal','2025-07-18 13:14:46',NULL,1),(139,1,'google','2025-07-21 10:40:52','2025-07-28 11:08:46',5),(140,5,'normal','2025-07-22 12:46:55','2025-07-29 22:34:12',5),(141,16,'google','2025-07-22 13:21:56','2025-07-25 13:10:34',5),(142,35,'normal','2025-07-22 14:28:25','2025-07-29 17:47:17',5),(143,71,'normal','2025-07-22 14:37:53','2025-07-22 14:39:49',5),(144,71,'normal','2025-07-22 15:03:04','2025-07-22 15:05:54',5),(145,1,'normal','2025-07-23 16:23:02',NULL,1),(146,72,'google','2025-07-23 16:23:33',NULL,1),(147,72,'normal','2025-07-23 16:24:17',NULL,1),(148,31,'google','2025-07-23 21:59:14',NULL,1),(149,72,'normal','2025-07-24 10:34:35','2025-07-31 12:04:28',5),(150,18,'normal','2025-07-24 11:43:00',NULL,1),(151,18,'normal','2025-07-24 11:49:56',NULL,1),(152,13,'google','2025-07-24 15:31:27','2025-07-31 15:55:25',5),(153,3,'google','2025-07-24 15:40:09',NULL,1),(154,15,'google','2025-07-24 17:25:34',NULL,1),(155,11,'google','2025-07-24 18:32:08',NULL,1),(156,23,'normal','2025-07-24 21:08:45',NULL,1),(157,31,'google','2025-07-24 21:25:08',NULL,1),(158,57,'normal','2025-07-25 14:05:37',NULL,1),(159,33,'google','2025-07-25 16:06:42',NULL,1),(160,50,'normal','2025-07-26 10:44:31',NULL,1),(161,62,'google','2025-07-26 13:09:59',NULL,1),(162,41,'google','2025-07-27 07:03:04',NULL,1),(163,1,'google','2025-07-28 11:08:53','2025-07-31 17:15:28',5),(164,31,'google','2025-07-28 14:31:31',NULL,1),(165,31,'google','2025-07-28 19:25:16',NULL,1),(166,6,'google','2025-07-29 11:58:33',NULL,1),(167,35,'normal','2025-07-29 17:47:27',NULL,1),(168,5,'normal','2025-07-29 22:34:15',NULL,1),(169,3,'google','2025-07-30 11:00:31',NULL,1),(170,71,'normal','2025-07-30 13:23:48','2025-07-30 13:29:52',5),(171,11,'normal','2025-07-30 21:00:20',NULL,1),(172,11,'normal','2025-07-31 07:14:24',NULL,1),(173,72,'normal','2025-07-31 12:04:50','2025-07-31 12:04:55',5),(174,38,'google','2025-07-31 13:01:18',NULL,1),(175,38,'google','2025-07-31 14:35:22',NULL,1),(176,13,'google','2025-07-31 15:56:23',NULL,1),(177,1,'normal','2025-07-31 17:16:41','2025-07-31 17:16:49',5),(178,1,'google','2025-07-31 17:17:45','2025-07-31 17:35:30',5),(179,1,'normal','2025-07-31 17:35:45',NULL,1);
/*!40000 ALTER TABLE `login_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_status`
--

DROP TABLE IF EXISTS `master_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_status` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(50) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_status`
--

LOCK TABLES `master_status` WRITE;
/*!40000 ALTER TABLE `master_status` DISABLE KEYS */;
INSERT INTO `master_status` VALUES (1,'Active','Active'),(2,'Inactive','Inactive'),(3,'Deleted','Deleted'),(4,'Resigned','Employee has Resigned'),(5,'Completed','Completed'),(6,'In Progress','Process is currently ongoing'),(7,'Manager Pending','Manager Approval Pending'),(8,'Manager Rejected','Manager declined the request'),(9,'FP Pending','Awaiting action from the Finance Processor'),(10,'FA Pending','Finance Approver Approval Pending'),(11,'FA Rejected','Finance Approver declined the request'),(12,'FA Approved','Finance Approver has Approved'),(13,'Payment Progress','Payment is yet to be processed by the bank'),(14,'Payment Completed','The payment has been successfully processed'),(15,'Closed','The process is closed'),(16,'Approved','Approved action by manager or finance '),(17,'Rejected','Rejected action by manager or finance'),(18,'Proceed','Proceed action by manager or finance'),(19,'Initialized','Report and Ticket raised but not submitted'),(20,'System Error','Internal server error'),(21,NULL,'Just Blank'),(22,'Download Cancelled','Excel download for payment cancelled'),(23,'Tally Pending','Tally Excel pending for Download'),(24,'Tally Processed','Tally Excel have been Downloaded'),(25,'Reverted','Recall all tickets in a report');
/*!40000 ALTER TABLE `master_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `menu_name` varchar(50) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `sort` varchar(50) DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `action` varchar(30) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`menu_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,NULL,'Home',NULL,'01',1,1,'home','Home Page'),(2,NULL,'Reports',NULL,'02',1,1,'reports','It will contain all the Reports of that user'),(3,NULL,'HRPortal',NULL,'03',1,1,'hrportal','HR will Upload Employee details in the system.'),(4,NULL,'My Team',NULL,'04',1,1,'myteam','This is only for Manager and contains the team reports. '),(5,NULL,'Finance Approval',NULL,'05',1,1,'financeapproval','For Finance team'),(6,NULL,'Operations',NULL,'06',1,2,'operations','For Operations team.'),(7,NULL,'Config',NULL,'07',1,2,'config','To manage the Org and its Entities. Only for Admin'),(8,NULL,'Permission',NULL,'08',1,2,'permission','To give access to any specific role to any specific person. Only for Admin'),(9,NULL,'Contact Us',NULL,'09',1,1,'contactus','Contact Details for the Tech Support'),(10,NULL,'Finance Panel',NULL,'05',1,1,'financepanel','Holds tickets waiting for payments, bank update,closed'),(11,NULL,'Summary',NULL,'06',1,1,'summary','To download summary of reports and tickets');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization` (
  `org_id` int NOT NULL AUTO_INCREMENT,
  `org_name` varchar(50) DEFAULT NULL,
  `org_code` varchar(50) DEFAULT NULL,
  `address` text,
  `status_id` int DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`org_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `organization_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (1,'Deshpande Foundation','DF','DCSE Building, B, V.B. Campus, Vidya Nagar, Hubballi, Karnataka 580031',1,NULL);
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_bank`
--

DROP TABLE IF EXISTS `organization_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization_bank` (
  `org_bank_id` int NOT NULL AUTO_INCREMENT,
  `org_id` int DEFAULT NULL,
  `entity_id` int DEFAULT NULL,
  `account_type` varchar(50) DEFAULT NULL,
  `client_code` varchar(100) DEFAULT NULL,
  `entity_bank_name` varchar(100) DEFAULT NULL,
  `entity_bank_account_no` varchar(50) DEFAULT NULL,
  `entity_name_on_bank` varchar(100) DEFAULT NULL,
  `entity_bank_IFSC` varchar(50) DEFAULT NULL,
  `bank_ledger` text,
  `bank_address` text,
  `bank_contact_no` varchar(30) DEFAULT NULL,
  `bank_contact_person` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `entity_bank_format` text,
  `status_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`org_bank_id`),
  KEY `status_id` (`status_id`),
  KEY `org_id` (`org_id`),
  KEY `entity_id` (`entity_id`),
  CONSTRAINT `organization_bank_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`),
  CONSTRAINT `organization_bank_ibfk_2` FOREIGN KEY (`org_id`) REFERENCES `organization` (`org_id`),
  CONSTRAINT `organization_bank_ibfk_3` FOREIGN KEY (`entity_id`) REFERENCES `entities` (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_bank`
--

LOCK TABLES `organization_bank` WRITE;
/*!40000 ALTER TABLE `organization_bank` DISABLE KEYS */;
INSERT INTO `organization_bank` VALUES (1,1,1,'FCRA','DESHPANDE','HDFC BANK','50100114012217','Deshpande Foundation','HDFC0000254','HDFC Bank A/c No-50100114012217','Tb Revankar Complex,Vivekanand Hospital Road,Hubli, karnataka- 580029','9343982426','Krishnag Desai',NULL,NULL,2,'2025-06-24 13:17:48',NULL),(2,1,1,'FCRA','DESHPANDE','ICICI BANK','015701014774','Deshpande Foundation','ICIC0000157','ICICI Bank A/c No-015701014774','Icici Bank Ltd, Eureka Junction, Travellers Bungalow Road, Hubli, Karnataka, 580029','8971912459','Vinay Joshi',NULL,NULL,2,'2025-06-24 13:17:48',NULL),(3,1,1,'FCRA','DESHPANDE','RATNAKAR BANK LTD','309023289619','Deshpande Foundation','RATN0000056','RBL Bank A/c NO.-309023289619','Nazare Complex, Tikare Road, Line Bazar, Dharwad 580001','9538926434','Anandkumar Chimmalagi','dfpayments@dfmail.org','Payment Type,Cust Ref Number,Source Account Number,Source Narration,Destination Account Number,Currency,Amount,Destination Narration,Destination bank,Destination Bank IFS Code,Beneficiary Name,Beneficiary Account Type,Email ',1,'2025-06-24 13:17:48',NULL),(4,1,1,'FCRA','DESHPANDE','Kotak BANK','6411841218','Deshpande Foundation','KKBK0000446','Kotak Bank A/c No.-6411841218','Club Road, Corporation Ward No.46, Old No.1, Hubli Dharwad-500 020, Karnataka','6364570480','Muzammil Ahmedb','dfpayments@dfmail.org','Client_Code,Product_Code,Payment_Type,Payment_Ref_No.,Payment_Date,Instrument,Date,Dr_Ac_No,Amount,Bank_Code_Indicator,Beneficiary_Code,Beneficiary_Name,Beneficiary_Bank,Beneficiary_Branch / IFSC Code,Beneficiary_Acc_No,Location,Print_Location,Instrument_Number,Ben_Add1,Ben_Add2,Ben_Add3,Ben_Add4,Beneficiary_Email,Beneficiary_Mobile,Debit_Narration,Credit_Narration,Payment Details 1,Payment Details 2,Payment Details 3,Payment Details 4,Enrichment_1,Enrichment_2,Enrichment_3,Enrichment_4,Enrichment_5,Enrichment_6,Enrichment_7,Enrichment_8,Enrichment_9,Enrichment_10,Enrichment_11,Enrichment_12,Enrichment_13,Enrichment_14,Enrichment_15,Enrichment_16,Enrichment_17,Enrichment_18,Enrichment_19,Enrichment_20',1,'2025-06-24 13:17:48',NULL),(5,1,1,'FCRA','DESHPANDE','YES BANK','024994600000027','Deshpande Foundation','YESB0000249','Yes Bank A/c No-024994600000027','Ground Floor,Svb City Centre Club Road,Hubli Karnataka 580020','9986123798','Firozkhan Pathan',NULL,NULL,2,'2025-06-24 13:17:48',NULL),(6,1,1,'FCRA','DESHPANDE','SBI BANK','33058846735','Deshpande Foundation','SBIN0009297','State Bank of India A/c No-33058846735','Mahila Vidyapeeth Complex, Vidyanagar, Distt. Dharwar, Karnataka 580021','9342893567','Jayshree',NULL,NULL,2,'2025-06-24 13:17:48',NULL),(7,1,1,'FCRA','DESHPANDE','SBI BANK','40095443444','Deshpande Foundation','SBIN0000691','State Bank of India A/c No 40095443444-Main FCRA','\"11Sansad Marg, New Delhi 110 001\nState: Delhi\"','9711906089','Mohammed Shahid',NULL,NULL,2,'2025-06-24 13:17:48',NULL),(8,1,1,'Non-FCRA','DESHPANDE','HDFC BANK','50100462351706','Deshpande Foundation','HDFC0006090','HDFC Bank A/c No: 50100462351706','Gr Flr Anusharan Arcade Nagshanti Building Shirur Park Road Vidyanagari Hubli Karnataka 580030','9343982426','Krishnag Desai',NULL,NULL,2,'2025-06-24 13:17:48',NULL),(9,1,1,'Non-FCRA','DESHPANDE','RATNAKAR BANK LTD','309003312050','Deshpande Foundation','RATN0000056','RBL Bank A/c No.-309003312050','Nazare Complex, Tikare Road, Line Bazar, Dharwad 580001','9538926434','Anandkumar Chimmalagi','dfpayments@dfmail.org','Payment Type,Cust Ref Number,Source Account Number,Source Narration,Destination Account Number,Currency,Amount,Destination Narration,Destination bank,Destination Bank IFS Code,Beneficiary Name,Beneficiary Account Type,Email ',1,'2025-06-24 13:17:48',NULL),(10,1,1,'Non-FCRA','DESHPANDE','SBI BANK','37058263175','Deshpande Foundation','SBIN0009297','SBI Bank A/c No.-37058263175','Mahila Vidyapeeth Complex, Vidyanagar, Distt. Dharwar, Karnataka 580021','9342893567','Jayshree',NULL,NULL,2,'2025-06-24 13:17:48',NULL),(11,1,2,'Non-FCRA','DESHTI','Canara Bank','1628101016715','Deshpande Education Trust','CNRB0001628','Canara Bank SB A/c No 1628101016715-EIR','1st Floor, Mirjankar Building, Vidyanagar, P B Road, Hubli, Karnataka - 580 021','+91 94498 67176',NULL,'cb1628@canarabank.com',NULL,2,'2025-06-24 13:17:48',NULL),(12,1,2,'OD','DESHTI','Canara Bank','1628257005280','Deshpande Education Trust','CNRB0001628','Canara Bank OD A/c.No.1628257005280','1st Floor, Mirjankar Building, Vidyanagar, P B Road, Hubli, Karnataka - 580 021','+91 94498 67176',NULL,'cb1628@canarabank.com',NULL,2,'2025-06-24 13:17:48',NULL),(13,1,2,'Non-FCRA','DESHTI','State Bank of India','33058845324','Deshpande Education Trust','SBIN0009297','SBI Bank A/c No: 33058845324 HBL','Vidyanagar, Hubballi','+91 93428 93567',NULL,'SBI.09297@sbi.co.in',NULL,2,'2025-06-24 13:17:48',NULL),(14,1,2,'Non-FCRA','DESHTI','State Bank of India','37592898899','Deshpande Education Trust','SBIN0009297','SBI Bank A/c No: 37592898899 AP','Vidyanagar, Hubballi','+91 93428 93567',NULL,'SBI.09297@sbi.co.in',NULL,2,'2025-06-24 13:17:48',NULL),(15,1,2,'Non-FCRA','DESHTI','State Bank of India','37592924740','Deshpande Education Trust','SBIN0009297','SBI Bank A/c No: 37592924740 KKT','Vidyanagar, Hubballi','+91 93428 93567',NULL,'SBI.09297@sbi.co.in',NULL,2,'2025-06-24 13:17:48',NULL),(16,1,2,'FCRA','DESHTI','State Bank of India','40095732865','Deshpande Education Trust','SBIN0000691','SBI Bank A/c No: 40095732865(FCRA)','Parliment Street, N. D. Main Branch, New Delhi','8026599990',NULL,'fcrasupport9.00691@sbi.co.in',NULL,2,'2025-06-24 13:17:48',NULL),(17,1,2,'FCRA','DESHTI','Kotak Mahindra','714421269','Deshpande Education Trust','KKBK0000446','Kotak Bank A/c No:0714421269 (FCRA)','Club Road, Hubballi','+91 63645 70480',NULL,'detpayments@dfmail.org','Client_Code,Product_Code,Payment_Type,Payment_Ref_No.,Payment_Date,Instrument,Date,Dr_Ac_No,Amount,Bank_Code_Indicator,Beneficiary_Code,Beneficiary_Name,Beneficiary_Bank,Beneficiary_Branch / IFSC Code,Beneficiary_Acc_No,Location,Print_Location,Instrument_Number,Ben_Add1,Ben_Add2,Ben_Add3,Ben_Add4,Beneficiary_Email,Beneficiary_Mobile,Debit_Narration,Credit_Narration,Payment Details 1,Payment Details 2,Payment Details 3,Payment Details 4,Enrichment_1,Enrichment_2,Enrichment_3,Enrichment_4,Enrichment_5,Enrichment_6,Enrichment_7,Enrichment_8,Enrichment_9,Enrichment_10,Enrichment_11,Enrichment_12,Enrichment_13,Enrichment_14,Enrichment_15,Enrichment_16,Enrichment_17,Enrichment_18,Enrichment_19,Enrichment_20',1,'2025-06-24 13:17:48',NULL),(18,1,2,'Non-FCRA','DESHTI','Kotak Mahindra','746116324','Deshpande Education Trust','KKBK0000446','Kotak Bank A/c No:0746116324 (Non FCRA)','Club Road, Hubballi','+91 63645 70480',NULL,'detpayments@dfmail.org','Client_Code,Product_Code,Payment_Type,Payment_Ref_No.,Payment_Date,Instrument,Date,Dr_Ac_No,Amount,Bank_Code_Indicator,Beneficiary_Code,Beneficiary_Name,Beneficiary_Bank,Beneficiary_Branch / IFSC Code,Beneficiary_Acc_No,Location,Print_Location,Instrument_Number,Ben_Add1,Ben_Add2,Ben_Add3,Ben_Add4,Beneficiary_Email,Beneficiary_Mobile,Debit_Narration,Credit_Narration,Payment Details 1,Payment Details 2,Payment Details 3,Payment Details 4,Enrichment_1,Enrichment_2,Enrichment_3,Enrichment_4,Enrichment_5,Enrichment_6,Enrichment_7,Enrichment_8,Enrichment_9,Enrichment_10,Enrichment_11,Enrichment_12,Enrichment_13,Enrichment_14,Enrichment_15,Enrichment_16,Enrichment_17,Enrichment_18,Enrichment_19,Enrichment_20',1,'2025-06-24 13:17:48',NULL),(19,1,2,'FCRA','DESHTI','RBL Bank Ltd','309023236264','Deshpande Education Trust','RATN0000056',NULL,'Jubilee Circle, Dharwad','+91 95389 26434',NULL,'anand.chimmalagi@rblbank.com','Payment Type,Cust Ref Number,Source Account Number,Source Narration,Destination Account Number,Currency,Amount,Destination Narration,Destination bank,Destination Bank IFS Code,Beneficiary Name,Beneficiary Account Type,Email ',2,'2025-06-24 13:17:48',NULL),(20,1,2,'Non-FCRA','DESHTI','RBL Bank Ltd','309006956664','Deshpande Education Trust','RATN0000056','RBL Bank A/c No: 309006956664','Jubilee Circle, Dharwad','+91 95389 26434',NULL,'detpayments@dfmail.org','Payment Type,Cust Ref Number,Source Account Number,Source Narration,Destination Account Number,Currency,Amount,Destination Narration,Destination bank,Destination Bank IFS Code,Beneficiary Name,Beneficiary Account Type,Email ',1,'2025-06-24 13:17:48',NULL),(21,1,2,'OD','DESHTI','RBL Bank Ltd','609001110406','Deshpande Education Trust','RATN0000056',NULL,'Jubilee Circle, Dharwad','+91 95389 26434',NULL,'anand.chimmalagi@rblbank.com','Payment Type,Cust Ref Number,Source Account Number,Source Narration,Destination Account Number,Currency,Amount,Destination Narration,Destination bank,Destination Bank IFS Code,Beneficiary Name,Beneficiary Account Type,Email ',2,'2025-06-24 13:17:48',NULL),(22,1,2,'CSR','DESHTI','HDFC','50200105967093','Deshpande Education Trust','HDFC0006090','HDFC Bank A/C No : 50200105967093','Vidyanagar Hubli','+91 93439 82426',NULL,'krishnag.desai@hdfcbank.com',NULL,2,'2025-06-24 13:17:48',NULL),(23,1,3,'FCRA',NULL,'RBL Bank Ltd','309023300170','Foundation for Sandboxstartup Initiatives','RATN0000056','RBL FC A/c No.309023300170','Jubilee Circle, Dharwad','+91 95389 26434',NULL,'sandboxaccounts@dfmail.org','Payment Type,Cust Ref Number,Source Account Number,Source Narration,Destination Account Number,Currency,Amount,Destination Narration,Destination bank,Destination Bank IFS Code,Beneficiary Name,Beneficiary Account Type,Email ',1,'2025-06-24 13:17:48',NULL),(24,1,3,'FCRA',NULL,'RBL Bank Ltd','300000580030','Foundation for Sandboxstartup Initiatives','RATN0000056','RBL FC A/c No.300000580030','Jubilee Circle, Dharwad','+91 95389 26434',NULL,'sandboxaccounts@dfmail.org','Payment Type,Cust Ref Number,Source Account Number,Source Narration,Destination Account Number,Currency,Amount,Destination Narration,Destination bank,Destination Bank IFS Code,Beneficiary Name,Beneficiary Account Type,Email ',1,'2025-06-24 13:17:48',NULL),(25,1,3,'FCRA',NULL,'State Bank of India','40095425888','Foundation for Sandboxstartup Initiatives','SBIN0009297',NULL,'Vidyanagar, Hubballi','+91 93428 93567',NULL,'SBI.09297@sbi.co.in',NULL,2,'2025-06-24 13:17:48',NULL),(26,1,3,'Non-FCRA',NULL,'Canara Bank','1628101016715','Foundation for Sandboxstartup Initiatives','CNRB0001628','Canara Bank SB A/c No 1628101016715-EIR','1st Floor, Mirjankar Building, Vidyanagar, P B Road, Hubli, Karnataka - 580 021','+91 94498 67176',NULL,'cb1628@canarabank.com',NULL,2,'2025-06-24 13:17:48',NULL),(27,1,3,'Non-FCRA',NULL,'RBL Bank Ltd','309006967837','Foundation for Sandboxstartup Initiatives','RATN0000056','RBL SB A/c No.309006967837-Operating','Jubilee Circle, Dharwad','+91 95389 26434',NULL,'sandboxaccounts@dfmail.org','Payment Type,Cust Ref Number,Source Account Number,Source Narration,Destination Account Number,Currency,Amount,Destination Narration,Destination bank,Destination Bank IFS Code,Beneficiary Name,Beneficiary Account Type,Email ',1,'2025-06-24 13:17:48',NULL),(28,1,3,'Non-FCRA',NULL,'State Bank of India','35823266728','Foundation for Sandboxstartup Initiatives','SBIN0009297','State Bank of India C.A/c.No.35823266728-Statutory','Vidyanagar, Hubballi','+91 93428 93567',NULL,'SBI.09297@sbi.co.in',NULL,2,'2025-06-24 13:17:48',NULL),(29,1,3,'Non-FCRA',NULL,'State Bank of India','35834648411','Foundation for Sandboxstartup Initiatives','SBIN0009297','State Bank of India SB A/c. No.35834648411-Accelara','Vidyanagar, Hubballi','+91 93428 93567',NULL,'SBI.09297@sbi.co.in',NULL,2,'2025-06-24 13:17:48',NULL),(30,1,3,'Non-FCRA',NULL,'Bank of Baroda','07790100021289','Foundation for Sandboxstartup Initiatives',NULL,'Bank of Baroda SB A/c. No. 07790100021289-Prayas',NULL,NULL,NULL,NULL,NULL,2,'2025-06-24 13:17:48',NULL),(31,1,3,'Non-FCRA',NULL,'Union Bank of India','066922010001223','Foundation for Sandboxstartup Initiatives',NULL,'Union Bank of India SB.A/c.No.066922010001223-SISFS',NULL,NULL,NULL,NULL,NULL,2,'2025-06-24 13:17:48',NULL),(32,1,3,NULL,NULL,'Other Bank',NULL,'Foundation for Sandboxstartup Initiatives',NULL,'Other Bank',NULL,NULL,NULL,NULL,NULL,1,'2025-07-31 14:37:44',NULL);
/*!40000 ALTER TABLE `organization_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_mode`
--

DROP TABLE IF EXISTS `payment_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_mode` (
  `mode_id` int NOT NULL AUTO_INCREMENT,
  `mode_name` varchar(50) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  PRIMARY KEY (`mode_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `payment_mode_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_mode`
--

LOCK TABLES `payment_mode` WRITE;
/*!40000 ALTER TABLE `payment_mode` DISABLE KEYS */;
INSERT INTO `payment_mode` VALUES (1,'Online',1),(2,'Cash',1);
/*!40000 ALTER TABLE `payment_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_route`
--

DROP TABLE IF EXISTS `payment_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_route` (
  `route_id` int NOT NULL AUTO_INCREMENT,
  `route_from` varchar(100) DEFAULT NULL,
  `route_to` varchar(100) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`route_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `payment_route_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_route`
--

LOCK TABLES `payment_route` WRITE;
/*!40000 ALTER TABLE `payment_route` DISABLE KEYS */;
INSERT INTO `payment_route` VALUES (1,'Organization','User',1,'Payment from Organization to User'),(2,'User','Organization',1,'Payment from User to Organization'),(3,'Organization','Vendor',1,'Payment from Organization to Vendor'),(4,'Vendor','Organization',1,'Payment from Vendor to Organization');
/*!40000 ALTER TABLE `payment_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_type`
--

DROP TABLE IF EXISTS `payment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_type` (
  `pay_type_id` int NOT NULL AUTO_INCREMENT,
  `pay_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`pay_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_type`
--

LOCK TABLES `payment_type` WRITE;
/*!40000 ALTER TABLE `payment_type` DISABLE KEYS */;
INSERT INTO `payment_type` VALUES (1,'NFT'),(2,'IMPS'),(3,'RTGS'),(4,'IFT'),(5,'NEFT'),(6,'TPT'),(7,'RTS');
/*!40000 ALTER TABLE `payment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int DEFAULT NULL,
  `transaction_id` varchar(45) DEFAULT NULL,
  `route_id` int DEFAULT NULL,
  `pay_type_id` int DEFAULT NULL,
  `paid_from` int DEFAULT NULL,
  `paid_to` int DEFAULT NULL,
  `paid_from_bank` int DEFAULT NULL,
  `paid_to_bank` int DEFAULT NULL,
  `amount` varchar(30) DEFAULT NULL,
  `UTR_number` varchar(100) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `payment_mode_id` int DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `level_id` int DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `unique_transaction_id` (`transaction_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `status_id` (`status_id`),
  KEY `payment_mode_id` (`payment_mode_id`),
  KEY `route_id` (`route_id`),
  KEY `pay_type_id` (`pay_type_id`),
  KEY `created_by` (`created_by`),
  KEY `level_id` (`level_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`),
  CONSTRAINT `payments_ibfk_10` FOREIGN KEY (`level_id`) REFERENCES `levels` (`level_id`),
  CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`),
  CONSTRAINT `payments_ibfk_3` FOREIGN KEY (`payment_mode_id`) REFERENCES `payment_mode` (`mode_id`),
  CONSTRAINT `payments_ibfk_4` FOREIGN KEY (`route_id`) REFERENCES `payment_route` (`route_id`),
  CONSTRAINT `payments_ibfk_5` FOREIGN KEY (`pay_type_id`) REFERENCES `payment_type` (`pay_type_id`),
  CONSTRAINT `payments_ibfk_9` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,2,'DF25000201',1,1,1,56,4,56,'350','CMS1862519716185',14,1,'2025-07-05 17:57:36',71,'2025-07-03 16:48:39',5,NULL),(2,4,'DF25000401',1,1,1,56,4,56,'1729','CMS1862519716196',14,1,'2025-07-05 17:57:36',71,'2025-07-04 10:45:21',5,NULL),(3,5,'DF25000501',1,1,1,23,3,23,'1071','NEFT/000452058023',14,1,'2025-07-11 00:00:00',71,'2025-07-10 10:39:53',5,NULL),(4,19,'DF25001901',1,1,1,16,3,16,'10375','NEFT/000452058024',14,1,'2025-07-11 00:00:00',71,'2025-07-10 10:54:40',5,NULL),(5,6,'DF25000601',1,1,1,11,4,10,'43','NEFT/000452058027',14,1,'2025-07-11 00:00:00',71,'2025-07-10 12:27:01',5,NULL),(6,7,'DF25000701',1,1,1,11,3,10,'245','NEFT/000453376058',14,1,'2025-07-21 00:00:00',71,'2025-07-18 10:09:25',5,NULL),(7,23,'DF25002301',1,1,1,11,3,10,'15','NEFT/000453376058',14,1,'2025-07-21 00:00:00',71,'2025-07-18 10:09:45',5,NULL),(8,24,'DF25002401',1,1,1,11,3,10,'15','NEFT/000453376058',14,1,'2025-07-21 00:00:00',71,'2025-07-18 10:10:10',5,NULL),(9,25,'DF25002501',1,1,1,41,3,41,'294','NEFT/000453376060',14,1,'2025-07-21 00:00:00',71,'2025-07-18 10:10:29',5,NULL),(10,26,'DF25002601',1,1,1,41,3,41,'444.5','NEFT/000453376060',14,1,'2025-07-21 00:00:00',71,'2025-07-18 10:10:57',5,NULL),(11,32,'DF25003201',1,1,1,41,3,41,'273','NEFT/000453376060',14,1,'2025-07-21 00:00:00',71,'2025-07-18 10:11:11',5,NULL),(12,33,'DF25003301',1,1,1,41,3,41,'409.5','NEFT/000453376060',14,1,'2025-07-21 00:00:00',71,'2025-07-18 10:11:18',5,NULL),(13,34,'DF25003401',1,1,1,11,3,10,'91','NEFT/000453376058',14,1,'2025-07-21 00:00:00',71,'2025-07-18 10:11:21',5,NULL),(14,36,'DF25003601',1,1,1,41,3,41,'367.5','NEFT/000453376060',14,1,'2025-07-21 00:00:00',71,'2025-07-18 10:11:26',5,NULL),(15,28,'DF25002801',1,1,1,16,3,16,'676','NEFT/000454208037',14,1,'2025-07-23 00:00:00',71,'2025-07-22 15:05:38',5,NULL),(16,27,'DF25002701',1,1,1,31,3,31,'845',NULL,13,1,NULL,71,'2025-07-30 13:25:17',5,NULL),(17,43,'DF25004301',1,1,1,3,3,2,'1499',NULL,13,1,NULL,71,'2025-07-30 13:26:15',5,NULL),(18,50,'DF25005001',1,1,1,31,3,31,'270',NULL,13,1,NULL,71,'2025-07-30 13:26:35',5,NULL),(19,51,'DF25005101',1,1,1,31,3,31,'420',NULL,13,1,NULL,71,'2025-07-30 13:26:49',5,NULL),(20,52,'DF25005201',1,1,1,31,3,31,'84',NULL,13,1,NULL,71,'2025-07-30 13:26:56',5,NULL),(21,53,'DF25005301',1,1,1,31,3,31,'152',NULL,13,1,NULL,71,'2025-07-30 13:27:09',5,NULL),(22,54,'DF25005401',1,1,1,13,3,12,'2333',NULL,13,1,NULL,71,'2025-07-30 13:27:21',5,NULL),(23,55,'DF25005501',1,1,1,31,3,31,'470',NULL,13,1,NULL,71,'2025-07-30 13:27:31',5,NULL),(24,58,'DF25005801',1,1,1,23,3,23,'2171.5',NULL,13,1,NULL,71,'2025-07-30 13:28:18',5,NULL),(25,59,'DF25005901',1,1,1,31,3,31,'131',NULL,13,1,NULL,71,'2025-07-30 13:28:27',5,NULL),(26,60,'DF25006001',1,1,1,31,3,31,'172',NULL,13,1,NULL,71,'2025-07-30 13:28:34',5,NULL),(27,72,'DF25007201',1,1,1,31,3,31,'645',NULL,13,1,NULL,71,'2025-07-30 13:28:41',5,NULL),(28,73,'DF25007301',1,1,1,31,3,31,'70',NULL,13,1,NULL,71,'2025-07-30 13:28:53',5,NULL),(29,74,'DF25007401',1,1,1,31,3,31,'10820',NULL,13,1,NULL,71,'2025-07-30 13:29:45',5,NULL);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_details`
--

DROP TABLE IF EXISTS `pf_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_details` (
  `pf_id` int NOT NULL AUTO_INCREMENT,
  `pf_establishment_id` int DEFAULT NULL,
  `pf_details_available` varchar(255) DEFAULT NULL,
  `pf_number` varchar(50) DEFAULT NULL,
  `pf_joining_date` date DEFAULT NULL,
  `name_on_pf_account` varchar(50) DEFAULT NULL,
  `UAN` varchar(50) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`pf_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `pf_details_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_details`
--

LOCK TABLES `pf_details` WRITE;
/*!40000 ALTER TABLE `pf_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `pf_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_ticket_details`
--

DROP TABLE IF EXISTS `pro_ticket_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pro_ticket_details` (
  `pro_dtls_id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int DEFAULT NULL,
  `procurement_type` varchar(30) DEFAULT NULL,
  `particulars` varchar(30) DEFAULT NULL,
  `description` text,
  `upload_file` text,
  PRIMARY KEY (`pro_dtls_id`),
  KEY `ticket_id` (`ticket_id`),
  CONSTRAINT `pro_ticket_details_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_ticket_details`
--

LOCK TABLES `pro_ticket_details` WRITE;
/*!40000 ALTER TABLE `pro_ticket_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `pro_ticket_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_ticket_details`
--

DROP TABLE IF EXISTS `re_ticket_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_ticket_details` (
  `reimb_dtls_id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `ledger_id` int DEFAULT NULL,
  `total_expense` varchar(100) DEFAULT NULL,
  `m_granted_amount` varchar(100) DEFAULT NULL,
  `f_granted_amount` varchar(100) DEFAULT NULL,
  `f_granted_by` int DEFAULT NULL,
  `exp_pay_date` datetime DEFAULT NULL,
  `reimbursed` varchar(100) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `description` text,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`reimb_dtls_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `category_id` (`category_id`),
  KEY `status_id` (`status_id`),
  KEY `ledger_id` (`ledger_id`),
  CONSTRAINT `re_ticket_details_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`),
  CONSTRAINT `re_ticket_details_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  CONSTRAINT `re_ticket_details_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`),
  CONSTRAINT `re_ticket_details_ibfk_4` FOREIGN KEY (`ledger_id`) REFERENCES `ledgers` (`ledger_id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_ticket_details`
--

LOCK TABLES `re_ticket_details` WRITE;
/*!40000 ALTER TABLE `re_ticket_details` DISABLE KEYS */;
INSERT INTO `re_ticket_details` VALUES (1,1,2,3,'400',NULL,NULL,NULL,NULL,NULL,1,'2025-07-01 17:38:09',NULL,NULL,NULL),(2,1,1,4,'110',NULL,NULL,NULL,NULL,NULL,1,'2025-07-01 17:38:09',NULL,NULL,NULL),(3,2,4,25,'350','350','350',35,NULL,NULL,1,'2025-07-02 17:54:30',NULL,NULL,NULL),(4,3,4,8,'0',NULL,NULL,NULL,NULL,NULL,1,'2025-07-03 11:19:22',NULL,NULL,NULL),(5,4,4,8,'1729','1729','1729',71,NULL,NULL,1,'2025-07-03 11:26:11',NULL,NULL,NULL),(6,5,2,3,'378','378','378',35,NULL,NULL,1,'2025-07-05 08:50:18',NULL,NULL,NULL),(7,5,2,3,'224','224','224',35,NULL,NULL,1,'2025-07-05 09:00:47',NULL,NULL,NULL),(8,5,2,3,'234.5','234.5','234.5',35,NULL,NULL,1,'2025-07-05 09:03:38',NULL,NULL,NULL),(9,5,2,3,'234.5','234.5','234.5',35,NULL,NULL,1,'2025-07-05 09:14:15',NULL,NULL,NULL),(10,6,2,3,'91','91','0',35,NULL,NULL,1,'2025-07-07 10:31:05',NULL,NULL,NULL),(11,6,2,3,'43','43','43',35,NULL,NULL,1,'2025-07-07 10:32:48',NULL,NULL,NULL),(12,7,2,3,'245',NULL,NULL,NULL,NULL,NULL,3,'2025-07-07 10:40:51',NULL,NULL,NULL),(13,8,2,3,'99',NULL,NULL,NULL,NULL,NULL,1,'2025-07-07 11:52:33',NULL,NULL,NULL),(14,8,2,3,'390',NULL,NULL,NULL,NULL,NULL,1,'2025-07-07 12:05:33',NULL,NULL,NULL),(15,8,2,3,'316',NULL,NULL,NULL,NULL,NULL,1,'2025-07-07 12:07:05',NULL,NULL,NULL),(16,7,2,3,'245','245','245',35,NULL,NULL,1,'2025-07-07 13:59:58',NULL,NULL,NULL),(23,12,2,3,'136.5',NULL,NULL,NULL,NULL,NULL,1,'2025-07-07 14:53:04',NULL,NULL,NULL),(24,13,2,3,'0',NULL,NULL,NULL,NULL,NULL,1,'2025-07-07 14:57:44',NULL,NULL,NULL),(25,14,2,3,'73.5',NULL,NULL,NULL,NULL,NULL,1,'2025-07-07 14:58:19',NULL,NULL,NULL),(27,16,2,3,'140',NULL,NULL,NULL,NULL,NULL,1,'2025-07-07 15:04:27',NULL,NULL,NULL),(28,17,2,3,'77',NULL,NULL,NULL,NULL,NULL,1,'2025-07-07 15:08:45',NULL,NULL,NULL),(29,17,2,3,'42',NULL,NULL,NULL,NULL,NULL,1,'2025-07-07 15:10:10',NULL,NULL,NULL),(30,18,2,3,'73.5',NULL,NULL,NULL,NULL,NULL,1,'2025-07-07 15:11:57',NULL,NULL,NULL),(31,19,1,4,'5558','5558','5558',35,NULL,NULL,1,'2025-07-07 16:18:17',NULL,NULL,NULL),(32,19,2,3,'4817','4817','4817',35,NULL,NULL,1,'2025-07-07 16:22:12',NULL,NULL,NULL),(33,20,2,3,'1000',NULL,NULL,NULL,NULL,NULL,1,'2025-07-08 13:06:03',NULL,NULL,NULL),(34,18,2,3,'59.5',NULL,NULL,NULL,NULL,NULL,1,'2025-07-10 20:40:05',NULL,NULL,NULL),(35,21,2,3,'77',NULL,NULL,NULL,NULL,NULL,1,'2025-07-10 20:42:56',NULL,NULL,NULL),(36,22,2,3,'0',NULL,NULL,NULL,NULL,NULL,1,'2025-07-11 15:22:50',NULL,NULL,NULL),(37,23,2,3,'15','15','15',35,NULL,NULL,1,'2025-07-11 15:27:15',NULL,NULL,NULL),(38,24,2,3,'15','15','15',71,NULL,NULL,1,'2025-07-11 15:29:04',NULL,NULL,NULL),(39,25,2,3,'294','294','294',35,NULL,NULL,1,'2025-07-11 22:04:38',NULL,NULL,NULL),(40,26,2,3,'444.5','444.5','444.5',35,NULL,NULL,1,'2025-07-11 22:11:16',NULL,NULL,NULL),(41,27,1,4,'845','845','845',35,NULL,NULL,1,'2025-07-12 16:34:38',NULL,NULL,NULL),(42,28,1,4,'676','676','676',35,NULL,NULL,1,'2025-07-12 16:39:06',NULL,NULL,NULL),(43,29,2,3,'77',NULL,NULL,NULL,NULL,NULL,1,'2025-07-12 17:31:13',NULL,NULL,NULL),(44,30,2,3,'80',NULL,NULL,NULL,NULL,NULL,1,'2025-07-12 17:41:44',NULL,NULL,NULL),(45,30,2,3,'177.25',NULL,NULL,NULL,NULL,NULL,1,'2025-07-12 17:41:44',NULL,NULL,NULL),(46,30,2,3,'15',NULL,NULL,NULL,NULL,NULL,1,'2025-07-12 17:41:44',NULL,NULL,NULL),(47,30,1,4,'57',NULL,NULL,NULL,NULL,NULL,1,'2025-07-12 17:41:44',NULL,NULL,NULL),(48,31,2,3,'538',NULL,NULL,NULL,NULL,NULL,1,'2025-07-12 17:46:01',NULL,NULL,NULL),(49,32,2,3,'273','273','273',35,NULL,NULL,1,'2025-07-14 21:48:46',NULL,NULL,NULL),(50,33,2,3,'409.5','409.5','409.5',35,NULL,NULL,1,'2025-07-14 21:56:29',NULL,NULL,NULL),(51,34,2,3,'91','91','91',35,NULL,NULL,1,'2025-07-15 10:28:15',NULL,NULL,NULL),(52,31,2,3,'65',NULL,NULL,NULL,NULL,NULL,1,'2025-07-15 15:33:37',NULL,NULL,NULL),(53,35,2,3,'63',NULL,NULL,NULL,NULL,NULL,1,'2025-07-15 15:35:54',NULL,NULL,NULL),(54,35,2,3,'66.5',NULL,NULL,NULL,NULL,NULL,3,'2025-07-15 15:37:33',NULL,NULL,NULL),(55,36,2,3,'367.5','367.5','367.5',35,NULL,NULL,1,'2025-07-16 07:41:42',NULL,NULL,NULL),(56,37,2,3,'570.5','570.5','570',35,NULL,NULL,1,'2025-07-16 13:16:41',NULL,NULL,NULL),(57,38,2,3,'623','623','623',35,NULL,NULL,1,'2025-07-16 13:18:30',NULL,NULL,NULL),(58,35,2,3,'66.5',NULL,NULL,NULL,NULL,NULL,1,'2025-07-18 10:31:49',NULL,NULL,NULL),(59,39,2,3,'77',NULL,NULL,NULL,NULL,NULL,1,'2025-07-18 10:36:54',NULL,NULL,NULL),(60,39,2,3,'59.5',NULL,NULL,NULL,NULL,NULL,1,'2025-07-18 10:38:52',NULL,NULL,NULL),(61,40,2,3,'42',NULL,NULL,NULL,NULL,NULL,1,'2025-07-18 10:44:33',NULL,NULL,NULL),(62,40,2,3,'59.5',NULL,NULL,NULL,NULL,NULL,1,'2025-07-18 10:46:26',NULL,NULL,NULL),(63,41,2,3,'80.5',NULL,NULL,NULL,NULL,NULL,1,'2025-07-18 10:55:39',NULL,NULL,NULL),(64,41,2,3,'77',NULL,NULL,NULL,NULL,NULL,1,'2025-07-18 10:57:37',NULL,NULL,NULL),(65,42,2,3,'70',NULL,NULL,NULL,NULL,NULL,1,'2025-07-18 11:00:37',NULL,NULL,NULL),(66,43,2,3,'1099','1099','1099',35,NULL,NULL,1,'2025-07-21 11:05:12',NULL,NULL,NULL),(67,43,4,25,'400','400','400',35,NULL,NULL,1,'2025-07-21 11:05:12',NULL,NULL,NULL),(68,42,2,3,'73.5',NULL,NULL,NULL,NULL,NULL,1,'2025-07-21 12:48:53',NULL,NULL,NULL),(69,44,2,3,'287',NULL,NULL,NULL,NULL,NULL,1,'2025-07-21 20:09:30',NULL,NULL,NULL),(70,45,2,3,'287',NULL,NULL,NULL,NULL,NULL,1,'2025-07-22 20:17:37',NULL,NULL,NULL),(71,46,2,3,'287',NULL,NULL,NULL,NULL,NULL,1,'2025-07-22 20:22:29',NULL,NULL,NULL),(72,47,2,3,'59.5',NULL,NULL,NULL,NULL,NULL,1,'2025-07-22 21:12:48',NULL,NULL,NULL),(73,47,2,3,'63',NULL,NULL,NULL,NULL,NULL,1,'2025-07-22 21:14:35',NULL,NULL,NULL),(74,48,2,3,'63',NULL,NULL,NULL,NULL,NULL,1,'2025-07-22 21:16:44',NULL,NULL,NULL),(75,48,2,3,'63',NULL,NULL,NULL,NULL,NULL,1,'2025-07-22 21:20:28',NULL,NULL,NULL),(76,49,2,3,'287',NULL,NULL,NULL,NULL,NULL,1,'2025-07-23 18:50:45',NULL,NULL,NULL),(77,50,1,4,'270','270','270',35,NULL,NULL,1,'2025-07-23 22:03:05',NULL,NULL,NULL),(78,51,1,4,'420','420','420',35,NULL,NULL,1,'2025-07-23 22:04:17',NULL,NULL,NULL),(79,52,1,4,'84','84','84',35,NULL,NULL,1,'2025-07-23 22:05:01',NULL,NULL,NULL),(80,53,1,4,'152','152','152',35,NULL,NULL,1,'2025-07-24 08:31:11',NULL,NULL,NULL),(81,54,1,4,'1200','1200','1200',35,NULL,NULL,1,'2025-07-24 15:36:29',NULL,NULL,NULL),(82,54,1,4,'1133','1133','1133',35,NULL,NULL,1,'2025-07-24 15:36:29',NULL,NULL,NULL),(83,55,1,4,'470','470','470',35,NULL,NULL,1,'2025-07-24 16:16:52',NULL,NULL,NULL),(84,56,2,3,'493.5',NULL,NULL,NULL,NULL,NULL,1,'2025-07-24 17:33:07',NULL,NULL,NULL),(85,57,2,3,'287',NULL,NULL,NULL,NULL,NULL,1,'2025-07-24 18:40:32',NULL,NULL,NULL),(86,58,2,3,'586.5','586.5','586',35,NULL,NULL,1,'2025-07-24 21:14:37',NULL,NULL,NULL),(87,58,2,3,'262.5','262.5','262',35,NULL,NULL,1,'2025-07-24 21:18:43',NULL,NULL,NULL),(88,58,2,3,'530','530','530',35,NULL,NULL,1,'2025-07-24 21:23:51',NULL,NULL,NULL),(89,59,1,4,'131','131','131',35,NULL,NULL,1,'2025-07-24 21:26:00',NULL,NULL,NULL),(90,58,2,3,'555.5','555.5','555.5',35,NULL,NULL,1,'2025-07-24 21:31:05',NULL,NULL,NULL),(91,60,1,4,'172','172','172',35,NULL,NULL,1,'2025-07-25 09:19:00',NULL,NULL,NULL),(92,58,2,3,'238','238','238',35,NULL,NULL,1,'2025-07-25 13:54:10',NULL,NULL,NULL),(93,61,2,3,'66.5',NULL,NULL,NULL,NULL,NULL,1,'2025-07-25 14:18:09',NULL,NULL,NULL),(94,61,2,3,'108',NULL,NULL,NULL,NULL,NULL,1,'2025-07-25 14:24:12',NULL,NULL,NULL),(95,61,2,3,'63',NULL,NULL,NULL,NULL,NULL,1,'2025-07-25 14:24:12',NULL,NULL,NULL),(96,61,2,3,'78',NULL,NULL,NULL,NULL,NULL,1,'2025-07-25 14:24:12',NULL,NULL,NULL),(97,61,1,4,'250',NULL,NULL,NULL,NULL,NULL,1,'2025-07-25 14:25:24',NULL,NULL,NULL),(98,61,2,3,'77',NULL,NULL,NULL,NULL,NULL,1,'2025-07-25 14:29:28',NULL,NULL,NULL),(99,62,2,3,'77',NULL,NULL,NULL,NULL,NULL,1,'2025-07-25 14:35:17',NULL,NULL,NULL),(100,62,2,3,'70',NULL,NULL,NULL,NULL,NULL,1,'2025-07-25 14:38:10',NULL,NULL,NULL),(101,63,2,3,'45.5',NULL,NULL,NULL,NULL,NULL,1,'2025-07-25 14:40:29',NULL,NULL,NULL),(102,63,1,4,'300',NULL,NULL,NULL,NULL,NULL,1,'2025-07-25 14:44:01',NULL,NULL,NULL),(103,64,2,3,'287',NULL,NULL,NULL,NULL,NULL,1,'2025-07-25 18:50:40',NULL,NULL,NULL),(104,63,2,3,'35',NULL,NULL,NULL,NULL,NULL,1,'2025-07-26 13:41:53',NULL,NULL,NULL),(105,63,2,3,'66.5',NULL,NULL,NULL,NULL,NULL,1,'2025-07-26 13:43:16',NULL,NULL,NULL),(106,65,2,3,'287',NULL,NULL,NULL,NULL,NULL,1,'2025-07-26 19:25:15',NULL,NULL,NULL),(107,66,2,3,'353.5',NULL,NULL,NULL,NULL,NULL,1,'2025-07-27 07:11:46',NULL,NULL,NULL),(108,67,2,3,'266',NULL,NULL,NULL,NULL,NULL,1,'2025-07-27 07:17:02',NULL,NULL,NULL),(109,68,2,3,'399',NULL,NULL,NULL,NULL,NULL,1,'2025-07-27 07:25:36',NULL,NULL,NULL),(110,69,2,3,'360.5',NULL,NULL,NULL,NULL,NULL,1,'2025-07-27 07:31:10',NULL,NULL,NULL),(111,70,2,3,'437.5',NULL,NULL,NULL,NULL,NULL,1,'2025-07-27 07:37:35',NULL,NULL,NULL),(112,71,2,3,'136.5',NULL,NULL,NULL,NULL,NULL,1,'2025-07-27 07:43:28',NULL,NULL,NULL),(113,72,1,4,'645','645','645',35,NULL,NULL,1,'2025-07-28 14:33:25',NULL,NULL,NULL),(114,73,1,4,'70','70','70',35,NULL,NULL,1,'2025-07-28 14:34:45',NULL,NULL,NULL),(115,74,4,28,'10820','10820','10820',35,NULL,NULL,1,'2025-07-28 19:19:26',NULL,NULL,NULL),(116,75,2,3,'418.15','418.15','418',35,NULL,NULL,1,'2025-07-29 12:00:39',NULL,NULL,NULL),(117,76,2,3,'59.5',NULL,NULL,NULL,NULL,NULL,1,'2025-07-29 12:00:48',NULL,NULL,NULL),(118,77,2,3,'292.7','292.7','292',35,NULL,NULL,1,'2025-07-29 12:01:57',NULL,NULL,NULL),(119,76,2,3,'77',NULL,NULL,NULL,NULL,NULL,1,'2025-07-29 12:02:15',NULL,NULL,NULL),(120,78,2,3,'53','53','53',35,NULL,NULL,1,'2025-07-29 12:07:22',NULL,NULL,NULL),(121,79,2,3,'53','53','53',35,NULL,NULL,1,'2025-07-29 12:08:18',NULL,NULL,NULL),(122,80,2,31,'493.5',NULL,NULL,NULL,NULL,NULL,1,'2025-07-29 17:13:09',NULL,NULL,NULL),(123,81,2,31,'213.5',NULL,NULL,NULL,NULL,NULL,1,'2025-07-29 17:17:57',NULL,NULL,NULL),(124,82,2,3,'66.5',NULL,NULL,NULL,NULL,NULL,1,'2025-07-30 20:30:31',NULL,NULL,NULL),(125,82,2,3,'63',NULL,NULL,NULL,NULL,NULL,1,'2025-07-30 20:31:44',NULL,NULL,NULL),(126,83,2,3,'535.5',NULL,NULL,NULL,NULL,NULL,1,'2025-07-30 21:03:39',NULL,NULL,NULL),(127,84,2,3,'542.5',NULL,NULL,NULL,NULL,NULL,1,'2025-07-31 07:17:03',NULL,NULL,NULL),(128,85,2,3,'211','211',NULL,NULL,NULL,NULL,1,'2025-07-31 13:05:49',NULL,NULL,NULL),(129,85,2,3,'217','217',NULL,NULL,NULL,NULL,1,'2025-07-31 13:07:35',NULL,NULL,NULL),(130,85,1,4,'150','150',NULL,NULL,NULL,NULL,1,'2025-07-31 13:07:35',NULL,NULL,NULL);
/*!40000 ALTER TABLE `re_ticket_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reimb_others`
--

DROP TABLE IF EXISTS `reimb_others`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reimb_others` (
  `reimb_other_id` int NOT NULL AUTO_INCREMENT,
  `reimb_dtls_id` int DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`reimb_other_id`),
  KEY `reimb_dtls_id` (`reimb_dtls_id`),
  CONSTRAINT `reimb_others_ibfk_1` FOREIGN KEY (`reimb_dtls_id`) REFERENCES `re_ticket_details` (`reimb_dtls_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reimb_others`
--

LOCK TABLES `reimb_others` WRITE;
/*!40000 ALTER TABLE `reimb_others` DISABLE KEYS */;
INSERT INTO `reimb_others` VALUES (1,3,'2025-07-02 00:00:00','Chocolate Grinder repair charges.'),(2,4,'2025-07-02 00:00:00','R&D for Chocolate making '),(3,5,'2025-07-02 00:00:00','R&D for Chocolate making '),(4,67,'2025-07-02 00:00:00','Fitness certificate for drone training'),(5,115,'2025-07-21 00:00:00','Own Car Fuel Charges');
/*!40000 ALTER TABLE `reimb_others` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reimbursement_history`
--

DROP TABLE IF EXISTS `reimbursement_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reimbursement_history` (
  `reimb_hst_id` int NOT NULL AUTO_INCREMENT,
  `reimb_dtls_id` int DEFAULT NULL,
  `ticket_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `ledger_id` int DEFAULT NULL,
  `total_expense` varchar(100) DEFAULT NULL,
  `m_granted_amount` varchar(100) DEFAULT NULL,
  `f_granted_amount` varchar(100) DEFAULT NULL,
  `reimbursed` varchar(100) DEFAULT NULL,
  `hotel_name` varchar(200) DEFAULT NULL,
  `address` text,
  `check_in_date` datetime DEFAULT NULL,
  `check_out_date` datetime DEFAULT NULL,
  `stay_days` int DEFAULT NULL,
  `vehicle_id` int DEFAULT NULL,
  `start_odo` varchar(100) DEFAULT NULL,
  `end_odo` varchar(100) DEFAULT NULL,
  `start_odo_path` text,
  `end_odo_path` text,
  `distance` int DEFAULT NULL,
  `from` varchar(100) DEFAULT NULL,
  `to` varchar(100) DEFAULT NULL,
  `travel_date` datetime DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `description` text,
  `edit_description` text,
  PRIMARY KEY (`reimb_hst_id`),
  KEY `status_id` (`status_id`),
  KEY `reimb_dtls_id` (`reimb_dtls_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `reimbursement_history_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`),
  CONSTRAINT `reimbursement_history_ibfk_2` FOREIGN KEY (`reimb_dtls_id`) REFERENCES `re_ticket_details` (`reimb_dtls_id`),
  CONSTRAINT `reimbursement_history_ibfk_3` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`),
  CONSTRAINT `reimbursement_history_ibfk_4` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reimbursement_history`
--

LOCK TABLES `reimbursement_history` WRITE;
/*!40000 ALTER TABLE `reimbursement_history` DISABLE KEYS */;
INSERT INTO `reimbursement_history` VALUES (1,14,8,1,NULL,'200',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,37,'2025-07-07 12:08:23',NULL,'Lunch Expenses Me and Kotresh'),(2,14,8,1,NULL,'360',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,37,'2025-07-07 12:09:32',NULL,'Breakfast '),(3,15,8,1,NULL,'196',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,37,'2025-07-07 12:10:45',NULL,'Lunch Expenses'),(4,12,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,11,'2025-07-07 13:58:10',NULL,'odometer wrongly uploaded'),(9,10,6,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,'2025-07-10 12:17:36',NULL,NULL),(10,10,6,NULL,NULL,NULL,NULL,'91',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,'2025-07-10 12:17:53',NULL,NULL),(11,36,22,2,NULL,'30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,11,'2025-07-11 15:23:57',NULL,'Wrongly entered'),(12,36,22,2,NULL,'15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,11,'2025-07-11 15:24:12',NULL,'Wrongly entered'),(13,54,35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,57,'2025-07-18 10:29:43',NULL,'Speedometer not added'),(14,86,58,1,NULL,'346.5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,23,'2025-07-24 21:15:57',NULL,'Community Pond Visit '),(15,86,58,NULL,NULL,NULL,NULL,'586.5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,'2025-07-30 12:40:48',NULL,NULL),(16,87,58,NULL,NULL,NULL,NULL,'262.5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,'2025-07-30 12:41:37',NULL,NULL),(17,90,58,NULL,NULL,NULL,NULL,'555.5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,'2025-07-30 12:42:28',NULL,NULL),(18,90,58,NULL,NULL,NULL,NULL,'555',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,'2025-07-30 12:43:53',NULL,NULL),(19,56,37,NULL,NULL,NULL,NULL,'570.5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,'2025-07-31 10:17:58',NULL,NULL),(20,116,75,NULL,NULL,NULL,NULL,'418.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,'2025-07-31 10:21:57',NULL,NULL),(21,118,77,NULL,NULL,NULL,NULL,'292.7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,'2025-07-31 10:26:54',NULL,NULL);
/*!40000 ALTER TABLE `reimbursement_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_history`
--

DROP TABLE IF EXISTS `report_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_history` (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `report_id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `description` text,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `edit_description` text,
  PRIMARY KEY (`history_id`),
  KEY `report_id` (`report_id`),
  CONSTRAINT `report_history_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_history`
--

LOCK TABLES `report_history` WRITE;
/*!40000 ALTER TABLE `report_history` DISABLE KEYS */;
INSERT INTO `report_history` VALUES (1,8,NULL,'2025-06-22 00:00:00','2025-07-04 00:00:00',NULL,16,'2025-07-06 17:33:25','Addition of bills'),(2,8,NULL,'2025-06-22 00:00:00','2025-07-04 00:00:00',NULL,16,'2025-07-06 17:33:56','Addition of tickets'),(3,11,NULL,'2025-07-01 00:00:00','2025-07-31 00:00:00',NULL,11,'2025-07-07 10:41:49','I want 10 days of expenses.'),(7,8,NULL,NULL,'2025-07-06 00:00:00',NULL,16,'2025-07-07 16:31:22','To reflect actual travel date'),(8,17,NULL,NULL,'2025-07-20 00:00:00',NULL,11,'2025-07-15 11:46:28','Wrongly entered'),(9,22,NULL,NULL,'2025-07-31 00:00:00',NULL,6,'2025-07-29 12:09:30','Submitting reports till 30th July instead of 31st July.'),(10,32,NULL,NULL,NULL,'Visit to Belgum for Corsera Courses',38,'2025-07-31 13:08:37','spelling mistake');
/*!40000 ALTER TABLE `report_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_logs`
--

DROP TABLE IF EXISTS `report_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_logs` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `report_id` int DEFAULT NULL,
  `pre_status_id` int DEFAULT NULL,
  `aft_status_id` int DEFAULT NULL,
  `pre_process_id` int DEFAULT NULL,
  `aft_process_id` int DEFAULT NULL,
  `level_id` int DEFAULT NULL,
  `action_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`log_id`),
  KEY `report_id` (`report_id`),
  KEY `pre_status_id` (`pre_status_id`),
  KEY `level_id` (`level_id`),
  KEY `aft_status_id` (`aft_status_id`),
  KEY `pre_process_id` (`pre_process_id`),
  KEY `aft_process_id` (`aft_process_id`),
  KEY `action_id` (`action_id`),
  CONSTRAINT `fk_report_logs_level` FOREIGN KEY (`level_id`) REFERENCES `levels` (`level_id`),
  CONSTRAINT `report_logs_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`),
  CONSTRAINT `report_logs_ibfk_2` FOREIGN KEY (`pre_status_id`) REFERENCES `master_status` (`status_id`),
  CONSTRAINT `report_logs_ibfk_4` FOREIGN KEY (`aft_status_id`) REFERENCES `master_status` (`status_id`),
  CONSTRAINT `report_logs_ibfk_5` FOREIGN KEY (`pre_process_id`) REFERENCES `master_status` (`status_id`),
  CONSTRAINT `report_logs_ibfk_6` FOREIGN KEY (`aft_process_id`) REFERENCES `master_status` (`status_id`),
  CONSTRAINT `report_logs_ibfk_7` FOREIGN KEY (`action_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_logs`
--

LOCK TABLES `report_logs` WRITE;
/*!40000 ALTER TABLE `report_logs` DISABLE KEYS */;
INSERT INTO `report_logs` VALUES (1,1,1,3,NULL,NULL,1,NULL,6,'2025-07-01 17:39:01','This was just practiced for testing how to enter the details in the report and how to claim the expenses.'),(2,2,NULL,NULL,19,6,1,18,56,'2025-07-02 17:54:41',''),(3,5,NULL,NULL,19,6,1,18,56,'2025-07-03 11:38:59',''),(4,9,NULL,NULL,19,6,1,18,23,'2025-07-07 12:53:48',''),(6,8,NULL,NULL,19,6,1,18,16,'2025-07-07 16:31:28',''),(7,11,NULL,NULL,19,6,1,18,11,'2025-07-08 10:49:30',''),(8,14,1,3,NULL,NULL,1,NULL,35,'2025-07-10 11:29:32','na'),(9,15,1,3,NULL,NULL,1,NULL,35,'2025-07-10 12:17:12','naaa'),(10,16,1,3,NULL,NULL,1,NULL,11,'2025-07-11 15:24:45','Wrongly enered'),(11,20,NULL,NULL,19,6,1,18,16,'2025-07-12 16:39:18',''),(12,17,NULL,NULL,19,6,1,18,11,'2025-07-15 11:46:35',''),(13,18,NULL,NULL,19,6,1,18,41,'2025-07-16 07:43:36',''),(14,23,NULL,NULL,19,6,1,18,3,'2025-07-21 11:05:24',''),(15,27,NULL,NULL,19,6,1,18,13,'2025-07-24 15:36:51',''),(16,3,1,3,NULL,NULL,1,NULL,15,'2025-07-24 17:26:30','NA'),(17,29,NULL,NULL,19,6,1,18,23,'2025-07-25 14:30:23',''),(18,28,NULL,NULL,19,6,1,18,15,'2025-07-28 13:30:53',''),(19,21,NULL,NULL,19,6,1,18,31,'2025-07-28 19:19:40',''),(20,26,NULL,NULL,19,6,1,18,31,'2025-07-28 19:19:51',''),(21,28,NULL,NULL,6,25,1,25,15,'2025-07-29 17:01:47','N/A'),(22,28,1,3,NULL,NULL,1,NULL,15,'2025-07-29 17:03:59','NA'),(23,22,NULL,NULL,19,6,1,18,6,'2025-07-30 13:30:23',''),(24,32,NULL,NULL,19,6,1,18,38,'2025-07-31 13:08:49','');
/*!40000 ALTER TABLE `report_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `year_id` int DEFAULT NULL,
  `org_id` int DEFAULT NULL,
  `entity_id` int DEFAULT NULL,
  `report_code` varchar(30) DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `process_status_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `description` text,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`report_id`),
  UNIQUE KEY `unique_report_code` (`report_code`),
  KEY `status_id` (`status_id`),
  KEY `process_status_id` (`process_status_id`),
  KEY `user_id` (`user_id`),
  KEY `year_id` (`year_id`),
  KEY `org_id` (`org_id`),
  KEY `entity_id` (`entity_id`),
  CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`),
  CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`process_status_id`) REFERENCES `master_status` (`status_id`),
  CONSTRAINT `reports_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `reports_ibfk_4` FOREIGN KEY (`year_id`) REFERENCES `academic_year` (`year_id`),
  CONSTRAINT `reports_ibfk_5` FOREIGN KEY (`org_id`) REFERENCES `organization` (`org_id`),
  CONSTRAINT `reports_ibfk_6` FOREIGN KEY (`entity_id`) REFERENCES `entities` (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (1,6,2025,1,1,'DF25260001',NULL,'',3,19,'2025-07-01 17:34:41','2025-07-01 00:00:00','2025-07-31 00:00:00','July Month Expenses',NULL),(2,56,2025,1,1,'DF25260002',16,'',1,15,'2025-07-02 17:46:24','2025-07-02 00:00:00','2025-07-05 00:00:00','Materials for Bean to Bar (Chocolate), R& D Project.',NULL),(3,15,2025,1,1,'DF25260003',NULL,'',3,19,'2025-07-02 18:06:05','2025-07-01 00:00:00','2025-07-31 00:00:00','DF MEDP PROJECTS',NULL),(4,61,2025,1,4,'DF25260004',NULL,'',1,19,'2025-07-02 19:30:11','2025-07-02 00:00:00','2025-07-02 00:00:00','Finencial inclustion enrollment \nVarmicampost pursued list collected',NULL),(5,56,2025,1,1,'DF25260005',16,'',1,6,'2025-07-03 11:15:46','2025-07-02 00:00:00','2025-07-03 00:00:00','Bean to Bar (Chocolate) Project - Materials required for R&D.',NULL),(6,57,2025,1,1,'DF25260006',NULL,'',1,19,'2025-07-04 11:57:12','2025-07-01 00:00:00','2025-07-31 00:00:00','Sindhudurg IAD Programe',NULL),(7,19,2025,1,4,'DF25260007',NULL,'',1,19,'2025-07-04 16:14:11','2025-07-01 00:00:00','2025-07-31 00:00:00','Integrated Area Devolpment realted Feild visits',NULL),(8,16,2025,1,1,'DF25260008',5,'',1,15,'2025-07-04 22:38:32','2025-06-22 00:00:00','2025-06-27 00:00:00','Asteria drone pilot training','2025-07-07 16:31:22'),(9,23,2025,1,1,'DF25260009',31,'',1,15,'2025-07-05 08:43:51','2025-07-01 00:00:00','2025-07-05 00:00:00','July Month TA Report',NULL),(10,18,2025,1,1,'DF25260010',NULL,'',1,19,'2025-07-05 17:06:02','2025-07-01 00:00:00','2025-07-05 00:00:00','05072025',NULL),(11,11,2025,1,1,'DF25260011',31,'',1,15,'2025-07-07 10:21:22','2025-07-01 00:00:00','2025-07-10 00:00:00','July Expenses','2025-07-07 10:41:49'),(12,37,2025,1,1,'DF25260012',NULL,'',1,19,'2025-07-07 11:45:17','2025-06-01 00:00:00','2025-07-07 00:00:00','Field Visit for FI',NULL),(13,1,2025,1,1,'DF25260013',NULL,'',1,19,'2025-07-08 13:04:49','2025-07-04 00:00:00','2025-07-23 00:00:00','Testing',NULL),(14,35,2025,1,1,'DF25260014',NULL,'',3,19,'2025-07-10 11:21:42','2025-07-02 00:00:00','2025-07-04 00:00:00','travel',NULL),(15,35,2025,1,1,'DF25260015',NULL,'',3,19,'2025-07-10 12:15:32','2025-07-01 00:00:00','2025-07-10 00:00:00','ndrfgdf',NULL),(16,11,2025,1,1,'DF25260016',NULL,'',3,19,'2025-07-11 15:10:49','2025-07-11 00:00:00','2025-07-20 00:00:00','Weekly expenses.',NULL),(17,11,2025,1,1,'DF25260017',31,'',1,15,'2025-07-11 15:25:24','2025-07-11 00:00:00','2025-07-15 00:00:00','July weekly expenses','2025-07-15 11:46:28'),(18,41,2025,1,1,'DF25260018',31,'',1,15,'2025-07-11 19:27:55','2025-07-01 00:00:00','2025-07-15 00:00:00','July Month 2025',NULL),(19,62,2025,1,4,'DF25260019',NULL,'',1,19,'2025-07-12 14:53:45','2025-07-01 00:00:00','2025-07-31 00:00:00','Field visit',NULL),(20,16,2025,1,1,'DF25260020',5,'',1,15,'2025-07-12 16:31:45','2025-07-12 00:00:00','2025-07-12 00:00:00','Trip for drone mapping at Kudarimoti, Koppal',NULL),(21,31,2025,1,1,'DF25260021',5,'',1,6,'2025-07-12 16:32:43','2025-07-12 00:00:00','2025-07-12 00:00:00','Kudaremoti',NULL),(22,6,2025,1,1,'DF25260022',31,'',1,6,'2025-07-16 13:12:51','2025-07-01 00:00:00','2025-07-30 00:00:00','July Month Expenses','2025-07-29 12:09:30'),(23,3,2025,1,1,'DF25260023',16,'',1,6,'2025-07-21 10:50:47','2025-07-01 00:00:00','2025-07-21 00:00:00','Drone training',NULL),(24,41,2025,1,1,'DF25260024',NULL,'',1,19,'2025-07-21 18:15:25','2025-07-16 00:00:00','2025-07-31 00:00:00','July month TA 2',NULL),(25,11,2025,1,1,'DF25260025',NULL,'',1,19,'2025-07-21 19:56:06','2025-07-21 00:00:00','2025-07-31 00:00:00','July Expenses',NULL),(26,31,2025,1,1,'DF25260026',5,'',1,6,'2025-07-23 21:59:53','2025-07-21 00:00:00','2025-07-28 00:00:00','Bagalkot , Sindhudurg and Belgaum Cluster Visit',NULL),(27,13,2025,1,1,'DF25260027',16,'',1,6,'2025-07-24 15:32:16','2025-07-23 00:00:00','2025-07-24 00:00:00','Kudrimoti field visit',NULL),(28,15,2025,1,1,'DF25260028',NULL,'',3,25,'2025-07-24 17:28:14','2025-07-22 00:00:00','2025-07-23 00:00:00','Vendor Visiting',NULL),(29,23,2025,1,1,'DF25260029',31,'',1,6,'2025-07-24 21:09:55','2025-07-12 00:00:00','2025-07-26 00:00:00','July Month TA',NULL),(30,50,2025,1,1,'DF25260030',NULL,'',1,19,'2025-07-26 10:48:59','2025-07-01 00:00:00','2025-07-30 00:00:00','This report contains a summary of the daily travel expenses.',NULL),(31,15,2025,1,1,'DF25260031',NULL,'',1,19,'2025-07-29 17:04:53','2025-07-22 00:00:00','2025-07-29 00:00:00','Visiting Vendors for Plastic Flakes',NULL),(32,38,2025,1,1,'DF25260032',31,'',1,6,'2025-07-31 13:02:31','2025-07-20 00:00:00','2025-07-31 00:00:00','Visit to Belagavi for Coursera Program','2025-07-31 13:08:37');
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_actions`
--

DROP TABLE IF EXISTS `role_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_actions` (
  `role_action_id` int NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL,
  `action` varchar(100) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  PRIMARY KEY (`role_action_id`),
  KEY `role_id` (`role_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `role_action_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  CONSTRAINT `role_action_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_actions`
--

LOCK TABLES `role_actions` WRITE;
/*!40000 ALTER TABLE `role_actions` DISABLE KEYS */;
INSERT INTO `role_actions` VALUES (1,1,'*',1),(2,2,'home',1),(3,2,'config',1),(4,2,'contactus',1),(5,2,'reports',1),(6,2,'reports/report',1),(7,2,'reports/ticket',1),(8,2,'userprofile',1),(9,3,'home',1),(10,3,'reports',1),(11,3,'reports/report',1),(12,3,'reports/ticket',1),(13,3,'financeapproval',1),(14,3,'financeapproval/ticket',1),(15,3,'contactus',1),(16,3,'userprofile',1),(17,4,'home',1),(18,4,'reports',1),(19,4,'reports/report',1),(20,4,'reports/ticket',1),(21,4,'financeapproval',1),(22,4,'financeapproval/ticket',1),(23,4,'financepanel',1),(24,4,'financepanel/ticket',1),(25,4,'contactus',1),(26,4,'userprofile',1),(27,5,'home',1),(28,5,'operations',1),(29,5,'reports',1),(30,5,'reports/report',1),(31,5,'reports/ticket',1),(32,5,'contactus',1),(33,5,'userprofile',1),(34,6,'home',1),(35,6,'reports',1),(36,6,'reports/report',1),(37,6,'reports/ticket',1),(38,6,'hrportal',1),(39,6,'hrportal/newemployee',1),(40,6,'contactus',1),(41,6,'userprofile',1),(42,7,'home',1),(43,7,'reports',1),(44,7,'reports/report',1),(45,7,'reports/ticket',1),(46,7,'contactus',1),(47,7,'userprofile',1),(48,8,'home',1),(49,8,'reports',1),(50,8,'reports/report',1),(51,8,'reports/ticket',1),(52,8,'myteam',1),(53,8,'myteam/report',1),(54,8,'myteam/ticket',1),(55,8,'contactus',1),(56,8,'userprofile',1),(57,2,'summary',1),(58,3,'summary',1),(59,4,'summary',1),(60,3,'financepanel',1),(61,3,'financepanel/ticket',1);
/*!40000 ALTER TABLE `role_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_menu`
--

DROP TABLE IF EXISTS `role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_menu` (
  `role_menu_id` int NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL,
  `menu_id` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  PRIMARY KEY (`role_menu_id`),
  KEY `status_id` (`status_id`),
  KEY `role_id` (`role_id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `role_menu_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`),
  CONSTRAINT `role_menu_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  CONSTRAINT `role_menu_ibfk_3` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_menu`
--

LOCK TABLES `role_menu` WRITE;
/*!40000 ALTER TABLE `role_menu` DISABLE KEYS */;
INSERT INTO `role_menu` VALUES (1,1,1,1),(2,2,1,1),(3,3,1,1),(4,4,1,1),(5,5,1,1),(6,6,1,1),(7,7,1,1),(8,1,2,1),(9,2,2,1),(10,3,2,1),(11,4,2,1),(12,5,2,1),(13,6,2,1),(14,7,2,1),(15,1,9,1),(16,2,9,1),(17,3,9,1),(18,4,9,1),(19,5,9,1),(20,6,9,1),(21,7,9,1),(22,6,3,1),(23,8,4,1),(24,3,5,1),(25,4,5,1),(26,5,6,1),(27,2,3,1),(28,2,7,1),(29,1,3,1),(30,1,4,1),(31,1,5,1),(32,1,6,1),(33,1,7,1),(34,1,8,1),(35,8,1,1),(36,8,2,1),(37,8,9,1),(38,4,10,1),(39,1,10,1),(40,1,11,1),(41,2,11,1),(42,3,11,1),(43,4,11,1),(44,3,10,1);
/*!40000 ALTER TABLE `role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `create_by` varchar(50) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`role_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Super Admin','2025-02-28 10:39:50','1',1,'Super Admin is one person using ticketing loging '),(2,'Admin','2025-02-28 10:41:41','1',1,'Admin can be from Tech, Finance, HR'),(3,'Finance Processor','2025-02-28 12:25:23','1',1,'Finance Team person who checks everything and proceed the report or Ticket'),(4,'Finance Approver','2025-02-28 12:25:23','1',1,'Finance Team person who checks everything and Approve or Reject the report or Ticket'),(5,'Operations','2025-02-28 12:25:23','1',1,'Operations team who checks everything and Approve or Reject the report or Ticket'),(6,'Onboarder','2025-02-28 12:25:23','1',1,'This is for HR who will add the employees in our system.'),(7,'User','2025-02-28 12:25:23','1',1,'All active employees if DF.'),(8,'Manager','2025-02-28 12:36:00','1',1,'Manager of every team');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_departments`
--

DROP TABLE IF EXISTS `sub_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_departments` (
  `sub_department_id` int NOT NULL AUTO_INCREMENT,
  `department_id` int DEFAULT NULL,
  `sub_department_name` varchar(50) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`sub_department_id`),
  KEY `department_id` (`department_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `sub_departments_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  CONSTRAINT `sub_departments_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_departments`
--

LOCK TABLES `sub_departments` WRITE;
/*!40000 ALTER TABLE `sub_departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tally_booking`
--

DROP TABLE IF EXISTS `tally_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tally_booking` (
  `tally_booking_id` int NOT NULL AUTO_INCREMENT,
  `voucher_type` varchar(100) DEFAULT NULL,
  `ticket_id` int DEFAULT NULL,
  `expense_category_id` int DEFAULT NULL,
  `ticket_dtls_id` int DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  `paid_amount` varchar(100) DEFAULT NULL,
  `tally_pay_id` int DEFAULT NULL,
  `dr/cr` varchar(10) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `process_status_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `update_remarks` text,
  PRIMARY KEY (`tally_booking_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `expense_category_id` (`expense_category_id`),
  KEY `payment_id` (`payment_id`),
  KEY `status_id` (`status_id`),
  KEY `process_status_id` (`process_status_id`),
  CONSTRAINT `tally_booking_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`),
  CONSTRAINT `tally_booking_ibfk_2` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_category` (`expense_category_id`),
  CONSTRAINT `tally_booking_ibfk_3` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`payment_id`),
  CONSTRAINT `tally_booking_ibfk_4` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`),
  CONSTRAINT `tally_booking_ibfk_6` FOREIGN KEY (`process_status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tally_booking`
--

LOCK TABLES `tally_booking` WRITE;
/*!40000 ALTER TABLE `tally_booking` DISABLE KEYS */;
INSERT INTO `tally_booking` VALUES (1,'Journal',2,1,3,1,'350',3,'Dr',1,24,18,'2025-07-24 11:47:41',18,'2025-07-24 11:47:10','Test downloaded'),(2,'Journal',4,1,5,2,'1729',3,'Dr',1,24,18,'2025-07-24 11:47:41',18,'2025-07-24 11:47:10','Test downloaded'),(3,'Journal',5,1,6,3,'378',3,'Dr',1,24,18,'2025-07-24 11:47:41',18,'2025-07-24 11:47:10','Test downloaded'),(4,'Journal',5,1,7,3,'224',3,'Dr',1,24,18,'2025-07-24 11:47:41',18,'2025-07-24 11:47:10','Test downloaded'),(5,'Journal',5,1,8,3,'234.5',3,'Dr',1,24,18,'2025-07-24 11:47:41',18,'2025-07-24 11:47:10','Test downloaded'),(6,'Journal',5,1,9,3,'234.5',3,'Dr',1,24,18,'2025-07-24 11:47:41',18,'2025-07-24 11:47:10','Test downloaded'),(7,'Journal',19,1,31,4,'5558',3,'Dr',1,24,18,'2025-07-24 11:47:41',18,'2025-07-24 11:47:10','Test downloaded'),(8,'Journal',19,1,32,4,'4817',3,'Dr',1,24,18,'2025-07-24 11:47:41',18,'2025-07-24 11:47:10','Test downloaded'),(9,'Journal',6,1,10,5,'0',3,'Dr',1,24,18,'2025-07-24 11:47:41',18,'2025-07-24 11:47:10','Test downloaded'),(10,'Journal',6,1,11,5,'43',3,'Dr',1,24,18,'2025-07-24 11:47:41',18,'2025-07-24 11:47:10','Test downloaded'),(11,'Journal',7,1,16,6,'245',3,'Dr',1,24,18,'2025-07-24 11:47:41',NULL,NULL,NULL),(12,'Journal',23,1,37,7,'15',3,'Dr',1,24,18,'2025-07-24 11:47:41',NULL,NULL,NULL),(13,'Journal',24,1,38,8,'15',3,'Dr',1,24,18,'2025-07-24 11:47:41',NULL,NULL,NULL),(14,'Journal',25,1,39,9,'294',3,'Dr',1,24,18,'2025-07-24 11:47:41',NULL,NULL,NULL),(15,'Journal',32,1,49,11,'273',3,'Dr',1,24,18,'2025-07-24 11:47:41',NULL,NULL,NULL),(16,'Journal',34,1,51,13,'91',3,'Dr',1,24,18,'2025-07-24 11:47:41',NULL,NULL,NULL),(17,'Journal',26,1,40,10,'444.5',3,'Dr',1,24,18,'2025-07-24 11:47:41',NULL,NULL,NULL),(18,'Journal',33,1,50,12,'409.5',3,'Dr',1,24,18,'2025-07-24 11:47:41',NULL,NULL,NULL),(19,'Journal',36,1,55,14,'367.5',3,'Dr',1,24,18,'2025-07-24 11:47:41',NULL,NULL,NULL),(20,NULL,28,1,42,15,'676',NULL,NULL,1,23,35,'2025-07-24 14:36:22',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tally_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tally_pay_bank`
--

DROP TABLE IF EXISTS `tally_pay_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tally_pay_bank` (
  `tally_pay_bank_id` int NOT NULL AUTO_INCREMENT,
  `voucher_type` varchar(100) DEFAULT NULL,
  `tally_pay_id` int DEFAULT NULL,
  `route_id` int DEFAULT NULL,
  `bank_id` int DEFAULT NULL,
  `ledger` varchar(100) DEFAULT NULL,
  `amount` varchar(225) DEFAULT NULL,
  `dr/cr` varchar(10) DEFAULT NULL,
  `led_narration` text,
  `narration` text,
  `status_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `update_remarks` text,
  PRIMARY KEY (`tally_pay_bank_id`),
  KEY `tally_pay_id` (`tally_pay_id`),
  KEY `status_id` (`status_id`),
  KEY `route_id` (`route_id`),
  CONSTRAINT `fk_tpb_route_id` FOREIGN KEY (`route_id`) REFERENCES `payment_route` (`route_id`),
  CONSTRAINT `fk_tpb_status_id` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`),
  CONSTRAINT `fk_tpb_tally_pay_id` FOREIGN KEY (`tally_pay_id`) REFERENCES `tally_payment` (`tally_pay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tally_pay_bank`
--

LOCK TABLES `tally_pay_bank` WRITE;
/*!40000 ALTER TABLE `tally_pay_bank` DISABLE KEYS */;
INSERT INTO `tally_pay_bank` VALUES (1,'Payment',1,1,4,'Kotak Bank A/c No.-6411841218','0','Cr',NULL,NULL,1,18,'2025-07-17 14:01:10',18,'2025-07-19 15:58:53','reversed due to recheck'),(2,'Payment',1,1,3,'RBL Bank A/c NO.-309023289619','0','Cr',NULL,NULL,1,18,'2025-07-17 14:01:10',18,'2025-07-19 15:58:53','reversed due to recheck'),(4,'Payment',2,1,4,'Kotak Bank A/c No.-6411841218','0','Cr',NULL,NULL,1,18,'2025-07-19 15:58:57',18,'2025-07-24 11:47:10','Test downloaded'),(5,'Payment',2,1,3,'RBL Bank A/c NO.-309023289619','0','Cr',NULL,NULL,1,18,'2025-07-19 15:58:57',18,'2025-07-24 11:47:10','Test downloaded'),(7,'Payment',3,1,4,'Kotak Bank A/c No.-6411841218','2122','Cr',NULL,NULL,1,18,'2025-07-24 11:47:41',NULL,NULL,NULL),(8,'Payment',3,1,3,'RBL Bank A/c NO.-309023289619','13600.5','Cr',NULL,NULL,1,18,'2025-07-24 11:47:41',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tally_pay_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tally_payment`
--

DROP TABLE IF EXISTS `tally_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tally_payment` (
  `tally_pay_id` int NOT NULL AUTO_INCREMENT,
  `voucher_type` varchar(100) DEFAULT NULL,
  `ledger` varchar(100) DEFAULT NULL,
  `amount` varchar(225) DEFAULT NULL,
  `dr/cr` varchar(10) DEFAULT NULL,
  `led_narration` text,
  `narration` text,
  `status_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `update_remarks` text,
  PRIMARY KEY (`tally_pay_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `tally_payment_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tally_payment`
--

LOCK TABLES `tally_payment` WRITE;
/*!40000 ALTER TABLE `tally_payment` DISABLE KEYS */;
INSERT INTO `tally_payment` VALUES (1,'Payment','Expenses Payable','0','Dr',NULL,NULL,1,18,'2025-07-17 14:01:10',18,'2025-07-19 15:58:53','reversed due to recheck'),(2,'Payment','Expenses Payable','0','Dr',NULL,NULL,1,18,'2025-07-19 15:58:57',18,'2025-07-24 11:47:10','Test downloaded'),(3,'Payment','Expenses Payable','15722.5','Dr',NULL,NULL,1,18,'2025-07-24 11:47:41',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tally_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_history`
--

DROP TABLE IF EXISTS `ticket_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_history` (
  `ticket_hst_id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int DEFAULT NULL,
  `cost_center_id` int DEFAULT NULL,
  `expense_id` int DEFAULT NULL,
  `budget_id` int DEFAULT NULL,
  `contribution_id` int DEFAULT NULL,
  `description` text,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `edit_description` text,
  PRIMARY KEY (`ticket_hst_id`),
  KEY `ticket_id` (`ticket_id`),
  CONSTRAINT `ticket_history_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_history`
--

LOCK TABLES `ticket_history` WRITE;
/*!40000 ALTER TABLE `ticket_history` DISABLE KEYS */;
INSERT INTO `ticket_history` VALUES (1,2,NULL,NULL,2,NULL,NULL,71,'2025-07-03 16:46:30',''),(2,2,13,NULL,NULL,NULL,NULL,71,'2025-07-03 16:46:49',''),(3,4,NULL,NULL,2,NULL,NULL,35,'2025-07-04 10:43:07',''),(4,4,13,NULL,NULL,NULL,NULL,35,'2025-07-04 10:43:14',''),(5,4,NULL,NULL,NULL,1,NULL,71,'2025-07-04 10:44:46',NULL),(6,4,NULL,NULL,NULL,2,NULL,71,'2025-07-04 10:44:50',NULL),(7,20,NULL,NULL,NULL,NULL,'Testing Description 1',1,'2025-07-08 13:06:28','Testing2'),(8,19,NULL,NULL,2,NULL,NULL,71,'2025-07-10 10:47:32',''),(9,19,13,NULL,NULL,NULL,NULL,71,'2025-07-10 10:48:08',''),(10,85,4,NULL,NULL,NULL,NULL,35,'2025-07-31 14:40:13','Coursera'),(11,85,10,NULL,NULL,NULL,NULL,35,'2025-07-31 14:41:29','Coursera');
/*!40000 ALTER TABLE `ticket_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_logs`
--

DROP TABLE IF EXISTS `ticket_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_logs` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int DEFAULT NULL,
  `pre_status_id` int DEFAULT NULL,
  `aft_status_id` int DEFAULT NULL,
  `pre_process_id` int DEFAULT NULL,
  `aft_process_id` int DEFAULT NULL,
  `level_id` int DEFAULT NULL,
  `action_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`log_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `pre_status_id` (`pre_status_id`),
  KEY `level_id` (`level_id`),
  KEY `aft_status_id` (`aft_status_id`),
  KEY `pre_process_id` (`pre_process_id`),
  KEY `aft_process_id` (`aft_process_id`),
  KEY `action_id` (`action_id`),
  CONSTRAINT `fk_ticket_logs_level` FOREIGN KEY (`level_id`) REFERENCES `levels` (`level_id`),
  CONSTRAINT `ticket_logs_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`),
  CONSTRAINT `ticket_logs_ibfk_2` FOREIGN KEY (`pre_status_id`) REFERENCES `master_status` (`status_id`),
  CONSTRAINT `ticket_logs_ibfk_4` FOREIGN KEY (`aft_status_id`) REFERENCES `master_status` (`status_id`),
  CONSTRAINT `ticket_logs_ibfk_5` FOREIGN KEY (`pre_process_id`) REFERENCES `master_status` (`status_id`),
  CONSTRAINT `ticket_logs_ibfk_6` FOREIGN KEY (`aft_process_id`) REFERENCES `master_status` (`status_id`),
  CONSTRAINT `ticket_logs_ibfk_7` FOREIGN KEY (`action_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_logs`
--

LOCK TABLES `ticket_logs` WRITE;
/*!40000 ALTER TABLE `ticket_logs` DISABLE KEYS */;
INSERT INTO `ticket_logs` VALUES (1,1,1,3,NULL,NULL,NULL,NULL,6,'2025-07-01 17:39:01','This was just practiced for testing how to enter the details in the report and how to claim the expenses.'),(2,2,NULL,NULL,19,7,1,18,56,'2025-07-02 17:54:41',''),(3,2,NULL,NULL,7,9,2,16,16,'2025-07-02 18:01:06',''),(4,3,1,3,NULL,NULL,1,NULL,56,'2025-07-03 11:38:14','no bills attached'),(5,4,NULL,NULL,19,7,1,18,56,'2025-07-03 11:38:59',''),(6,2,NULL,NULL,9,10,3,18,35,'2025-07-03 16:43:39','verified'),(7,2,NULL,NULL,10,12,4,16,71,'2025-07-03 16:48:39',''),(8,2,NULL,NULL,12,13,6,21,71,'2025-07-03 16:50:30','Payment in Progress...'),(9,4,NULL,NULL,7,9,2,16,16,'2025-07-04 10:38:47',''),(10,4,NULL,NULL,9,10,3,18,35,'2025-07-04 10:43:53',''),(11,4,NULL,NULL,10,12,4,16,71,'2025-07-04 10:45:21',''),(12,4,NULL,NULL,12,13,6,21,35,'2025-07-05 17:49:26','Payment in Progress...'),(13,2,NULL,NULL,13,15,7,21,71,'2025-07-05 17:57:36','Payment Completed And Ticket Closed.'),(14,4,NULL,NULL,13,15,7,21,71,'2025-07-05 17:57:36','Payment Completed And Ticket Closed.'),(15,5,NULL,NULL,19,7,1,18,23,'2025-07-07 12:53:48',''),(16,11,1,3,NULL,NULL,1,NULL,57,'2025-07-07 14:54:20','expences not added'),(17,13,1,3,NULL,NULL,1,NULL,57,'2025-07-07 14:59:15','expences not showing'),(22,19,NULL,NULL,19,7,1,18,16,'2025-07-07 16:31:28',''),(23,6,NULL,NULL,19,7,1,18,11,'2025-07-08 10:49:30',''),(24,7,NULL,NULL,19,7,1,18,11,'2025-07-08 10:49:30',''),(25,6,NULL,NULL,7,9,2,16,31,'2025-07-08 11:45:02',''),(26,5,NULL,NULL,7,9,2,16,31,'2025-07-08 11:45:21',''),(27,19,NULL,NULL,7,9,2,16,5,'2025-07-09 14:03:57',''),(28,5,NULL,NULL,9,10,3,18,35,'2025-07-10 10:27:14',''),(29,5,NULL,NULL,10,12,4,16,71,'2025-07-10 10:39:52',''),(30,19,NULL,NULL,9,10,3,18,35,'2025-07-10 10:42:47',''),(31,19,NULL,NULL,10,12,4,16,71,'2025-07-10 10:54:40',''),(32,5,NULL,NULL,12,13,6,21,35,'2025-07-10 11:35:53','Payment in Progress...'),(33,19,NULL,NULL,12,13,6,21,35,'2025-07-10 11:35:53','Payment in Progress...'),(34,6,NULL,NULL,9,10,3,18,35,'2025-07-10 12:19:15','kinldy attached odometer supporting document for next payment process. '),(35,6,NULL,NULL,10,12,4,16,71,'2025-07-10 12:27:01','Kindly attach the odometer for next payment'),(36,6,NULL,NULL,12,13,6,21,35,'2025-07-10 12:33:36','Payment in Progress...'),(37,22,1,3,NULL,NULL,NULL,NULL,11,'2025-07-11 15:24:45','Wrongly enered'),(38,5,NULL,NULL,13,15,7,21,35,'2025-07-12 14:59:09','Payment Completed And Ticket Closed.'),(39,19,NULL,NULL,13,15,7,21,35,'2025-07-12 14:59:09','Payment Completed And Ticket Closed.'),(40,6,NULL,NULL,13,15,7,21,35,'2025-07-12 14:59:09','Payment Completed And Ticket Closed.'),(41,28,NULL,NULL,19,7,1,18,16,'2025-07-12 16:39:18',''),(42,21,1,3,NULL,NULL,1,NULL,57,'2025-07-12 17:27:17','want to add photos'),(43,23,NULL,NULL,19,7,1,18,11,'2025-07-15 11:46:35',''),(44,24,NULL,NULL,19,7,1,18,11,'2025-07-15 11:46:35',''),(45,34,NULL,NULL,19,7,1,18,11,'2025-07-15 11:46:35',''),(46,25,NULL,NULL,19,7,1,18,41,'2025-07-16 07:43:36',''),(47,26,NULL,NULL,19,7,1,18,41,'2025-07-16 07:43:36',''),(48,32,NULL,NULL,19,7,1,18,41,'2025-07-16 07:43:36',''),(49,33,NULL,NULL,19,7,1,18,41,'2025-07-16 07:43:36',''),(50,36,NULL,NULL,19,7,1,18,41,'2025-07-16 07:43:36',''),(51,7,NULL,NULL,7,9,2,16,31,'2025-07-16 10:32:00',''),(52,23,NULL,NULL,7,9,2,16,31,'2025-07-16 10:32:22',''),(53,34,NULL,NULL,7,9,2,16,31,'2025-07-16 10:34:09','Approved'),(54,24,NULL,NULL,7,9,2,16,31,'2025-07-16 10:34:21',''),(55,25,NULL,NULL,7,9,2,16,31,'2025-07-16 10:34:38',''),(56,26,NULL,NULL,7,9,2,16,31,'2025-07-16 10:34:56',''),(57,32,NULL,NULL,7,9,2,16,31,'2025-07-16 10:35:05',''),(58,36,NULL,NULL,7,9,2,16,31,'2025-07-16 10:35:13',''),(59,33,NULL,NULL,7,9,2,16,31,'2025-07-16 10:35:20',''),(60,7,NULL,NULL,9,10,3,18,35,'2025-07-17 17:35:36',''),(61,23,NULL,NULL,9,10,3,18,35,'2025-07-17 17:36:19',''),(62,24,NULL,NULL,9,10,3,18,35,'2025-07-17 17:37:05',''),(63,25,NULL,NULL,9,10,3,18,35,'2025-07-17 17:37:56',''),(64,26,NULL,NULL,9,10,3,18,35,'2025-07-17 17:38:30',''),(65,32,NULL,NULL,9,10,3,18,35,'2025-07-17 17:39:07',''),(66,36,NULL,NULL,9,10,3,18,35,'2025-07-17 17:40:10',''),(67,33,NULL,NULL,9,10,3,18,35,'2025-07-17 17:40:29',''),(68,34,NULL,NULL,9,10,3,18,35,'2025-07-17 17:40:48',''),(69,7,NULL,NULL,10,12,4,16,71,'2025-07-18 10:09:25',''),(70,23,NULL,NULL,10,12,4,16,71,'2025-07-18 10:09:45',''),(71,24,NULL,NULL,10,12,4,16,71,'2025-07-18 10:10:10',''),(72,25,NULL,NULL,10,12,4,16,71,'2025-07-18 10:10:29',''),(73,26,NULL,NULL,10,12,4,16,71,'2025-07-18 10:10:57',''),(74,32,NULL,NULL,10,12,4,16,71,'2025-07-18 10:11:11',''),(75,33,NULL,NULL,10,12,4,16,71,'2025-07-18 10:11:18',''),(76,34,NULL,NULL,10,12,4,16,71,'2025-07-18 10:11:21',''),(77,36,NULL,NULL,10,12,4,16,71,'2025-07-18 10:11:26',''),(78,7,NULL,NULL,12,13,6,21,35,'2025-07-18 12:39:06','Payment in Progress...'),(79,23,NULL,NULL,12,13,6,21,35,'2025-07-18 12:39:06','Payment in Progress...'),(80,24,NULL,NULL,12,13,6,21,35,'2025-07-18 12:39:07','Payment in Progress...'),(81,25,NULL,NULL,12,13,6,21,35,'2025-07-18 12:39:07','Payment in Progress...'),(82,26,NULL,NULL,12,13,6,21,35,'2025-07-18 12:39:07','Payment in Progress...'),(83,32,NULL,NULL,12,13,6,21,35,'2025-07-18 12:39:07','Payment in Progress...'),(84,33,NULL,NULL,12,13,6,21,35,'2025-07-18 12:39:07','Payment in Progress...'),(85,34,NULL,NULL,12,13,6,21,35,'2025-07-18 12:39:07','Payment in Progress...'),(86,36,NULL,NULL,12,13,6,21,35,'2025-07-18 12:39:07','Payment in Progress...'),(87,7,NULL,NULL,13,15,7,21,35,'2025-07-21 10:55:26','Payment Completed And Ticket Closed.'),(88,23,NULL,NULL,13,15,7,21,35,'2025-07-21 10:55:26','Payment Completed And Ticket Closed.'),(89,24,NULL,NULL,13,15,7,21,35,'2025-07-21 10:55:26','Payment Completed And Ticket Closed.'),(90,25,NULL,NULL,13,15,7,21,35,'2025-07-21 10:55:26','Payment Completed And Ticket Closed.'),(91,32,NULL,NULL,13,15,7,21,35,'2025-07-21 10:55:26','Payment Completed And Ticket Closed.'),(92,34,NULL,NULL,13,15,7,21,35,'2025-07-21 10:55:26','Payment Completed And Ticket Closed.'),(93,26,NULL,NULL,13,15,7,21,35,'2025-07-21 10:59:27','Payment Completed And Ticket Closed.'),(94,33,NULL,NULL,13,15,7,21,35,'2025-07-21 10:59:27','Payment Completed And Ticket Closed.'),(95,36,NULL,NULL,13,15,7,21,35,'2025-07-21 10:59:27','Payment Completed And Ticket Closed.'),(96,43,NULL,NULL,19,7,1,18,3,'2025-07-21 11:05:24',''),(97,28,NULL,NULL,7,9,2,16,5,'2025-07-22 12:47:48','Approved.'),(98,28,NULL,NULL,9,10,3,18,35,'2025-07-22 14:48:41',''),(99,28,NULL,NULL,10,12,4,16,71,'2025-07-22 15:05:38',''),(100,28,NULL,NULL,12,13,6,21,35,'2025-07-22 15:25:45','Payment in Progress...'),(101,45,1,3,NULL,NULL,1,NULL,11,'2025-07-22 20:20:40','odometer picture not showing'),(102,28,NULL,NULL,13,15,7,21,35,'2025-07-24 14:36:22','Payment Completed And Ticket Closed.'),(103,54,NULL,NULL,19,7,1,18,13,'2025-07-24 15:36:51',''),(104,54,NULL,NULL,7,9,2,16,16,'2025-07-25 12:10:09',''),(105,43,NULL,NULL,7,9,2,16,16,'2025-07-25 13:10:11',''),(106,58,NULL,NULL,19,7,1,18,23,'2025-07-25 14:30:23',''),(107,54,NULL,NULL,9,10,3,18,35,'2025-07-25 15:48:27',''),(108,56,NULL,NULL,19,7,1,18,15,'2025-07-28 13:30:53',''),(109,27,NULL,NULL,19,7,1,18,31,'2025-07-28 19:19:40',''),(110,50,NULL,NULL,19,7,1,18,31,'2025-07-28 19:19:51',''),(111,51,NULL,NULL,19,7,1,18,31,'2025-07-28 19:19:51',''),(112,52,NULL,NULL,19,7,1,18,31,'2025-07-28 19:19:51',''),(113,53,NULL,NULL,19,7,1,18,31,'2025-07-28 19:19:51',''),(114,55,NULL,NULL,19,7,1,18,31,'2025-07-28 19:19:51',''),(115,59,NULL,NULL,19,7,1,18,31,'2025-07-28 19:19:51',''),(116,60,NULL,NULL,19,7,1,18,31,'2025-07-28 19:19:51',''),(117,72,NULL,NULL,19,7,1,18,31,'2025-07-28 19:19:51',''),(118,73,NULL,NULL,19,7,1,18,31,'2025-07-28 19:19:51',''),(119,74,NULL,NULL,19,7,1,18,31,'2025-07-28 19:19:51',''),(120,58,NULL,NULL,7,9,2,16,31,'2025-07-28 19:23:02',''),(121,27,NULL,NULL,7,9,2,16,5,'2025-07-28 19:40:22',''),(122,50,NULL,NULL,7,9,2,16,5,'2025-07-28 19:41:02',''),(123,51,NULL,NULL,7,9,2,16,5,'2025-07-28 19:41:30',''),(124,52,NULL,NULL,7,9,2,16,5,'2025-07-28 19:41:49',''),(125,56,NULL,NULL,7,25,1,25,15,'2025-07-29 17:01:47','N/A'),(126,56,1,3,NULL,NULL,1,NULL,15,'2025-07-29 17:02:20','NA'),(127,53,NULL,NULL,7,9,2,16,5,'2025-07-29 22:34:34',''),(128,55,NULL,NULL,7,9,2,16,5,'2025-07-29 22:35:05',''),(129,59,NULL,NULL,7,9,2,16,5,'2025-07-29 22:35:22',''),(130,60,NULL,NULL,7,9,2,16,5,'2025-07-29 22:35:33',''),(131,72,NULL,NULL,7,9,2,16,5,'2025-07-29 22:35:47',''),(132,73,NULL,NULL,7,9,2,16,5,'2025-07-29 22:36:03',''),(133,74,NULL,NULL,7,9,2,16,5,'2025-07-29 22:36:29',''),(134,27,NULL,NULL,9,10,3,18,35,'2025-07-30 12:19:22',''),(135,43,NULL,NULL,9,10,3,18,35,'2025-07-30 12:21:07',''),(136,50,NULL,NULL,9,10,3,18,35,'2025-07-30 12:22:25',''),(137,51,NULL,NULL,9,10,3,18,35,'2025-07-30 12:23:16',''),(138,52,NULL,NULL,9,10,3,18,35,'2025-07-30 12:25:24',''),(139,53,NULL,NULL,9,10,3,18,35,'2025-07-30 12:25:54',''),(140,55,NULL,NULL,9,10,3,18,35,'2025-07-30 12:26:29',''),(141,59,NULL,NULL,9,10,3,18,35,'2025-07-30 12:28:20',''),(142,60,NULL,NULL,9,10,3,18,35,'2025-07-30 12:29:23',''),(143,72,NULL,NULL,9,10,3,18,35,'2025-07-30 12:30:08',''),(144,73,NULL,NULL,9,10,3,18,35,'2025-07-30 12:30:28',''),(145,74,NULL,NULL,9,10,3,18,35,'2025-07-30 12:37:33',''),(146,58,NULL,NULL,9,10,3,18,35,'2025-07-30 12:44:26',''),(147,27,NULL,NULL,10,12,4,16,71,'2025-07-30 13:25:17',''),(148,43,NULL,NULL,10,12,4,16,71,'2025-07-30 13:26:14',''),(149,50,NULL,NULL,10,12,4,16,71,'2025-07-30 13:26:34',''),(150,51,NULL,NULL,10,12,4,16,71,'2025-07-30 13:26:49',''),(151,52,NULL,NULL,10,12,4,16,71,'2025-07-30 13:26:56',''),(152,53,NULL,NULL,10,12,4,16,71,'2025-07-30 13:27:09',''),(153,54,NULL,NULL,10,12,4,16,71,'2025-07-30 13:27:21',''),(154,55,NULL,NULL,10,12,4,16,71,'2025-07-30 13:27:31',''),(155,58,NULL,NULL,10,12,4,16,71,'2025-07-30 13:28:17',''),(156,59,NULL,NULL,10,12,4,16,71,'2025-07-30 13:28:27',''),(157,60,NULL,NULL,10,12,4,16,71,'2025-07-30 13:28:34',''),(158,72,NULL,NULL,10,12,4,16,71,'2025-07-30 13:28:40',''),(159,73,NULL,NULL,10,12,4,16,71,'2025-07-30 13:28:53',''),(160,74,NULL,NULL,10,12,4,16,71,'2025-07-30 13:29:45',''),(161,37,NULL,NULL,19,7,1,18,6,'2025-07-30 13:30:23',''),(162,38,NULL,NULL,19,7,1,18,6,'2025-07-30 13:30:23',''),(163,75,NULL,NULL,19,7,1,18,6,'2025-07-30 13:30:23',''),(164,77,NULL,NULL,19,7,1,18,6,'2025-07-30 13:30:23',''),(165,78,NULL,NULL,19,7,1,18,6,'2025-07-30 13:30:23',''),(166,79,NULL,NULL,19,7,1,18,6,'2025-07-30 13:30:23',''),(167,37,NULL,NULL,7,9,2,16,31,'2025-07-30 13:31:18',''),(168,75,NULL,NULL,7,9,2,16,31,'2025-07-30 13:31:30',''),(169,38,NULL,NULL,7,9,2,16,31,'2025-07-30 13:31:38',''),(170,77,NULL,NULL,7,9,2,16,31,'2025-07-30 13:31:45',''),(171,78,NULL,NULL,7,9,2,16,31,'2025-07-30 13:31:52',''),(172,79,NULL,NULL,7,9,2,16,31,'2025-07-30 13:32:10',''),(173,37,NULL,NULL,9,10,3,18,35,'2025-07-31 10:18:47',''),(174,38,NULL,NULL,9,10,3,18,35,'2025-07-31 10:21:01','odometer photo attached missing. '),(175,75,NULL,NULL,9,10,3,18,35,'2025-07-31 10:23:22',''),(176,77,NULL,NULL,9,10,3,18,35,'2025-07-31 10:26:57',''),(177,78,NULL,NULL,9,10,3,18,35,'2025-07-31 10:27:20',''),(178,79,NULL,NULL,9,10,3,18,35,'2025-07-31 10:27:33',''),(179,27,NULL,NULL,12,13,6,21,35,'2025-07-31 10:42:14','Payment in Progress...'),(180,43,NULL,NULL,12,13,6,21,35,'2025-07-31 10:42:14','Payment in Progress...'),(181,50,NULL,NULL,12,13,6,21,35,'2025-07-31 10:42:14','Payment in Progress...'),(182,51,NULL,NULL,12,13,6,21,35,'2025-07-31 10:42:14','Payment in Progress...'),(183,52,NULL,NULL,12,13,6,21,35,'2025-07-31 10:42:14','Payment in Progress...'),(184,53,NULL,NULL,12,13,6,21,35,'2025-07-31 10:42:14','Payment in Progress...'),(185,54,NULL,NULL,12,13,6,21,35,'2025-07-31 10:42:14','Payment in Progress...'),(186,55,NULL,NULL,12,13,6,21,35,'2025-07-31 10:42:14','Payment in Progress...'),(187,58,NULL,NULL,12,13,6,21,35,'2025-07-31 10:42:14','Payment in Progress...'),(188,59,NULL,NULL,12,13,6,21,35,'2025-07-31 10:42:14','Payment in Progress...'),(189,60,NULL,NULL,12,13,6,21,35,'2025-07-31 10:42:14','Payment in Progress...'),(190,72,NULL,NULL,12,13,6,21,35,'2025-07-31 10:42:14','Payment in Progress...'),(191,73,NULL,NULL,12,13,6,21,35,'2025-07-31 10:42:14','Payment in Progress...'),(192,74,NULL,NULL,12,13,6,21,35,'2025-07-31 10:42:14','Payment in Progress...'),(193,85,NULL,NULL,19,7,1,18,38,'2025-07-31 13:08:49',''),(194,85,NULL,NULL,7,9,2,16,31,'2025-07-31 14:14:47',''),(195,85,NULL,NULL,9,10,3,18,35,'2025-07-31 14:42:34','Cost center : Coursera');
/*!40000 ALTER TABLE `ticket_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `ticket_id` int NOT NULL AUTO_INCREMENT,
  `entity_id` int DEFAULT NULL,
  `report_id` int DEFAULT NULL,
  `year_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `ticket_number` varchar(45) DEFAULT NULL,
  `cost_center_id` int DEFAULT NULL,
  `expense_id` int DEFAULT NULL,
  `budget_id` int DEFAULT NULL,
  `contribution_id` int DEFAULT NULL,
  `exp_catg_id` int DEFAULT NULL,
  `granted_amount` varchar(100) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `process_status_id` int DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  UNIQUE KEY `unique_ticket_number` (`ticket_number`),
  KEY `entity_id` (`entity_id`),
  KEY `report_id` (`report_id`),
  KEY `exp_catg_id` (`exp_catg_id`),
  KEY `status_id` (`status_id`),
  KEY `process_status_id` (`process_status_id`),
  KEY `year_id` (`year_id`),
  KEY `cost_center_id` (`cost_center_id`),
  KEY `contribution_id` (`contribution_id`),
  KEY `budget_id` (`budget_id`),
  KEY `expense_id` (`expense_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`entity_id`) REFERENCES `entities` (`entity_id`),
  CONSTRAINT `ticket_ibfk_10` FOREIGN KEY (`expense_id`) REFERENCES `expense` (`expense_id`),
  CONSTRAINT `ticket_ibfk_11` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`),
  CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`exp_catg_id`) REFERENCES `expense_category` (`expense_category_id`),
  CONSTRAINT `ticket_ibfk_4` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`),
  CONSTRAINT `ticket_ibfk_5` FOREIGN KEY (`process_status_id`) REFERENCES `master_status` (`status_id`),
  CONSTRAINT `ticket_ibfk_6` FOREIGN KEY (`year_id`) REFERENCES `academic_year` (`year_id`),
  CONSTRAINT `ticket_ibfk_7` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_center` (`cost_center_id`),
  CONSTRAINT `ticket_ibfk_8` FOREIGN KEY (`contribution_id`) REFERENCES `contribution_type` (`contribution_id`),
  CONSTRAINT `ticket_ibfk_9` FOREIGN KEY (`budget_id`) REFERENCES `budget_type` (`budget_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,1,1,2025,6,'DF07250001',5,1,1,NULL,1,NULL,3,19,'Just testing, not a real claim ','2025-07-01 17:38:09',NULL,NULL),(2,1,2,2025,56,'DF07250002',11,1,1,1,1,'350',1,15,'Chocolate Grinder Machine Repair Invoice.','2025-07-02 17:54:30',71,'2025-07-03 16:46:49'),(3,1,5,2025,56,'DF07250003',13,1,2,NULL,1,NULL,3,19,'Materials for Chocolate making - R&D','2025-07-03 11:19:22',NULL,NULL),(4,1,5,2025,56,'DF07250004',11,1,1,1,1,'1729',1,15,'Materials for Chocolate making - R&D','2025-07-03 11:26:11',71,'2025-07-04 10:44:50'),(5,1,9,2025,23,'DF07250005',5,1,1,1,1,'1071',1,15,'Community Pond Visit ','2025-07-05 08:50:18',35,'2025-07-10 10:08:23'),(6,1,11,2025,11,'DF07250006',5,1,1,1,1,'43',1,15,'visit to kundagol municipality with kallappa for identifying waste available for vermi compost.','2025-07-07 10:31:05',35,'2025-07-10 10:29:35'),(7,1,11,2025,11,'DF07250007',5,1,1,1,1,'245',1,15,'Field visit with Kallappa Patted village name is Nelawadi. For the pupose of Financial  \r\nIncusion.','2025-07-07 10:40:51',71,'2025-07-18 10:09:19'),(8,1,12,2025,37,'DF07250008',18,1,1,NULL,1,NULL,1,19,'Field Visit for FI Enrollment','2025-07-07 11:52:33',NULL,NULL),(11,1,6,2025,57,'DF07250011',5,1,1,NULL,1,NULL,3,19,'Visit to DF office in SRM College Kudal.','2025-07-07 14:52:36',NULL,NULL),(12,1,6,2025,57,'DF07250012',5,1,1,NULL,1,NULL,1,19,'Visit to DF office in SRM College Kudal.','2025-07-07 14:53:04',NULL,NULL),(13,1,6,2025,57,'DF07250013',5,1,1,NULL,1,NULL,3,19,'Visit to Pinguli for meeting with Milind Patil, bamboo Ph.D. Scholar','2025-07-07 14:57:44',NULL,NULL),(14,1,6,2025,57,'DF07250014',5,1,1,NULL,1,NULL,1,19,'Visit to Pinguli for meeting with Milind Patil, bamboo Ph.D. Scholar','2025-07-07 14:58:19',NULL,NULL),(16,1,6,2025,57,'DF07250016',5,1,1,NULL,1,NULL,1,19,'Visit to DF office Hirlok to Kudal and Kudal to Hirlok Traveling expense','2025-07-07 15:04:27',NULL,NULL),(17,1,6,2025,57,'DF07250017',5,1,1,NULL,1,NULL,1,19,'Visit to SRM College Kudal DF office for work.','2025-07-07 15:08:45',NULL,NULL),(18,1,6,2025,57,'DF07250018',5,1,1,NULL,1,NULL,1,19,' Visit to SRM College Kudal Coursera related work','2025-07-07 15:11:57',NULL,NULL),(19,1,8,2025,16,'DF07250019',27,1,1,1,1,'10375',1,15,'The reimbursement is for 4 employees (Gautham Shanbhogue, Ciyedin Salim, Amith Krishnan & Tejas Sawant) for 5 days (22/6/2025 to 27/6/2025) as part of drone pilot training by Asteria Aerospace held in Yelahanka, Bangalore.','2025-07-07 16:18:17',71,'2025-07-10 10:48:08'),(20,1,13,2025,1,'DF07250020',27,1,1,NULL,1,NULL,1,19,'Testing Description 2','2025-07-08 13:06:03',1,'2025-07-08 13:06:28'),(21,1,6,2025,57,'DF07250021',5,1,1,NULL,1,NULL,3,19,'Visit to DF Office Kudal.','2025-07-10 20:42:56',NULL,NULL),(22,1,16,2025,11,'DF07250022',5,1,1,NULL,1,NULL,3,19,'Field visit to nursery for vermi compost trade.\r\nSecond is return ticket.','2025-07-11 15:22:50',NULL,NULL),(23,1,17,2025,11,'DF07250023',5,1,1,1,1,'15',1,15,'Field Visit to nursery for vermi compost trade','2025-07-11 15:27:15',35,'2025-07-17 17:36:04'),(24,1,17,2025,11,'DF07250024',5,1,1,1,1,'15',1,15,'This is same day return bill.','2025-07-11 15:29:04',35,'2025-07-17 17:36:56'),(25,1,18,2025,41,'DF07250025',5,1,1,1,1,'294',1,15,'To discuss regarding the agroforestry plantation.','2025-07-11 22:04:38',35,'2025-07-17 17:37:39'),(26,1,18,2025,41,'DF07250026',5,1,1,1,1,'444.5',1,15,'Gangar Plantation and Financial inclusion','2025-07-11 22:11:16',35,'2025-07-17 17:38:08'),(27,1,21,2025,31,'DF07250027',5,1,1,1,1,'845',1,13,'Lunch for 6 people at Koppal - Me , Gautham,Ciyden,Amit,Teajs,Manju','2025-07-12 16:34:38',35,'2025-07-29 17:47:59'),(28,1,20,2025,16,'DF07250028',13,1,1,1,1,'676',1,15,'Food bill for breakfast during drone mapping trip to Kudarimoti. 6 employees - Gautham V Shanbhgoue, Ciyedin Salim, Amith Krishnan, Nanjundappa Jugali, Tejas Sawant.','2025-07-12 16:39:06',35,'2025-07-22 14:29:49'),(29,1,6,2025,57,'DF07250029',5,1,1,NULL,1,NULL,1,19,'Visit to Kudal DF Office.','2025-07-12 17:31:13',NULL,NULL),(30,1,6,2025,57,'DF07250030',5,1,1,NULL,1,NULL,1,19,'Traveling from Kudal To Hubbali For Drone Operation.','2025-07-12 17:41:44',NULL,NULL),(31,1,6,2025,57,'DF07250031',5,1,1,NULL,1,NULL,1,19,'Traveling To Kudal from Hubbli','2025-07-12 17:46:01',NULL,NULL),(32,1,18,2025,41,'DF07250032',5,1,1,1,1,'273',1,15,'For Financial inclusion, L&T program, agroforestry plantation visit','2025-07-14 21:48:46',35,'2025-07-17 17:38:50'),(33,1,18,2025,41,'DF07250033',5,1,1,1,1,'409.5',1,15,'Vermicompost farmer, financial inclusion, Dragon fruit farmer visit','2025-07-14 21:56:29',35,'2025-07-17 17:40:23'),(34,1,17,2025,11,'DF07250034',5,1,1,1,1,'91',1,15,'Went to Kundagol muncipality with Kallappa Patted for waste to prepare vermicompost. \r\nFor the first time I went field work, So I Did not knew taking photos of bike odometer. In field I came to know from my senior. Afterwards I will surely take the picture of odometer and upload.','2025-07-15 10:28:15',35,'2025-07-17 17:40:38'),(35,1,6,2025,57,'DF07250035',5,1,1,NULL,1,NULL,1,19,'Visit to SRM College DF Office.','2025-07-15 15:35:54',NULL,NULL),(36,1,18,2025,41,'DF07250036',5,1,1,1,1,'367.5',1,15,'Vermicompost farmer visit and Dragon crop and Financial inclusion','2025-07-16 07:41:42',35,'2025-07-17 17:39:55'),(37,1,22,2025,6,'DF07250037',5,1,1,1,1,NULL,1,10,'Visit to Chandankera and Hudadalli community ponds for survey ','2025-07-16 13:16:41',35,'2025-07-31 10:17:30'),(38,1,22,2025,6,'DF07250038',5,1,1,1,1,NULL,1,10,'Visit to Chandankera and Tumkunta community ponds survey ','2025-07-16 13:18:30',35,'2025-07-31 10:20:30'),(39,1,6,2025,57,'DF07250039',5,1,1,NULL,1,NULL,1,19,'Sindhudurg office visit SRM College kudal.','2025-07-18 10:36:54',NULL,NULL),(40,1,6,2025,57,'DF07250040',5,1,1,NULL,1,NULL,1,19,'Visit To SRM College DF Office ','2025-07-18 10:44:33',NULL,NULL),(41,1,6,2025,57,'DF07250041',5,1,1,NULL,1,NULL,1,19,'Visit To DF Office SRM College Kudal.','2025-07-18 10:55:39',NULL,NULL),(42,1,6,2025,57,'DF07250042',5,1,1,NULL,1,NULL,1,19,'Visit to SRM College Kudal DF Office.','2025-07-18 11:00:37',NULL,NULL),(43,1,23,2025,3,'DF07250043',27,1,1,1,1,'1499',1,13,'Return travel (Amith) and Fitness Certificate cost (Amith & Ciyedin), during Drone Pilot Certification Training held at Bangalore.','2025-07-21 11:05:12',35,'2025-07-30 12:19:34'),(44,1,25,2025,11,'DF07250044',5,1,1,NULL,1,NULL,1,19,'Field work Bhadrapura. ','2025-07-21 20:09:30',NULL,NULL),(45,1,25,2025,11,'DF07250045',5,1,1,NULL,1,NULL,3,19,'Field work at Bhadrapura. \r\n','2025-07-22 20:17:37',NULL,NULL),(46,1,25,2025,11,'DF07250046',5,1,1,NULL,1,NULL,1,19,'Field work at Bhadraoura. ','2025-07-22 20:22:29',NULL,NULL),(47,1,6,2025,57,'DF07250047',5,1,1,NULL,1,NULL,1,19,'Visit To DF Office SRM College Kudal ','2025-07-22 21:12:48',NULL,NULL),(48,1,6,2025,57,'DF07250048',5,1,1,NULL,1,NULL,1,19,'Visit To SRM Collge DF Office','2025-07-22 21:16:44',NULL,NULL),(49,1,25,2025,11,'DF07250049',5,1,1,NULL,1,NULL,1,19,'Field work at Bhadrapura. ','2025-07-23 18:50:45',NULL,NULL),(50,1,26,2025,31,'DF07250050',5,1,1,1,1,'270',1,13,'Had lunch at Bagalkot with Clusterhead and FF','2025-07-23 22:03:05',35,'2025-07-30 12:21:19'),(51,1,26,2025,31,'DF07250051',5,1,1,1,1,'420',1,13,'Lunch at Kudal with 3 FFs','2025-07-23 22:04:17',35,'2025-07-30 12:23:07'),(52,1,26,2025,31,'DF07250052',5,1,1,1,1,'84',1,13,'Had dinner at Kudal','2025-07-23 22:05:01',35,'2025-07-30 12:23:58'),(53,1,26,2025,31,'DF07250053',5,1,1,1,1,'152',1,13,'Had breakfast at Kudal','2025-07-24 08:31:11',71,'2025-07-30 13:27:04'),(54,1,27,2025,13,'DF07250054',27,1,1,1,1,'2333',1,13,'Drone survey- Kudrimoti community pond','2025-07-24 15:36:29',35,'2025-07-25 15:46:04'),(55,1,26,2025,31,'DF07250055',5,1,1,1,1,'470',1,13,'Had lunch with FFs at @ Kudal','2025-07-24 16:16:52',35,'2025-07-30 12:26:11'),(56,1,28,2025,15,'DF07250056',11,1,2,NULL,1,NULL,3,25,'Travelled from DF to Belur Industrial Area UP and Down Twice','2025-07-24 17:33:07',NULL,NULL),(57,1,25,2025,11,'DF07250057',5,1,1,NULL,1,NULL,1,19,'Field work at Bhadrapura. ','2025-07-24 18:40:32',NULL,NULL),(58,1,29,2025,23,'DF07250058',5,1,1,1,1,'2171.5',1,13,'Community Pond and Field Visit ','2025-07-24 21:14:37',35,'2025-07-30 12:27:08'),(59,1,26,2025,31,'DF07250059',5,1,1,1,1,'131',1,13,'Had dinner at Kudal','2025-07-24 21:26:00',35,'2025-07-30 12:27:58'),(60,1,26,2025,31,'DF07250060',5,1,1,1,1,'172',1,13,'Had breakfast @Kudal','2025-07-25 09:19:00',35,'2025-07-30 12:28:43'),(61,1,6,2025,57,'DF07250061',5,1,1,NULL,1,NULL,1,19,'Visit To Morle Dodamarg for Check Dam Visit 3 Person traveling and food Expense','2025-07-25 14:18:09',NULL,NULL),(62,1,6,2025,57,'DF07250062',5,1,1,NULL,1,NULL,1,19,'Visit To Narur Bamboo Farmer and Young entrepreneur in Kudal ','2025-07-25 14:35:17',NULL,NULL),(63,1,6,2025,57,'DF07250063',5,1,1,NULL,1,NULL,1,19,'Visit To Agrikart FPO pandur ','2025-07-25 14:40:29',NULL,NULL),(64,1,25,2025,11,'DF07250064',5,1,1,NULL,1,NULL,1,19,'Field work at Bhadrapuara. \r\n','2025-07-25 18:50:40',NULL,NULL),(65,1,25,2025,11,'DF07250065',5,1,1,NULL,1,NULL,1,19,'Field work at Bhadrapura. ','2025-07-26 19:25:15',NULL,NULL),(66,1,24,2025,41,'DF07250066',5,1,1,NULL,1,NULL,1,19,'To Visit Vermicompost site and Farmer','2025-07-27 07:11:46',NULL,NULL),(67,1,24,2025,41,'DF07250067',5,1,1,NULL,1,NULL,1,19,'For Financial inclusion activities','2025-07-27 07:17:02',NULL,NULL),(68,1,24,2025,41,'DF07250068',5,1,1,NULL,1,NULL,1,19,'To visit farm pond farmer, Nanjund sir visited to Injanavari and Mullur,and tallikeri vermicompost farmer.','2025-07-27 07:25:36',NULL,NULL),(69,1,24,2025,41,'DF07250069',5,1,1,NULL,1,NULL,1,19,'For Financial inclusion activities.','2025-07-27 07:31:10',NULL,NULL),(70,1,24,2025,41,'DF07250070',5,1,1,NULL,1,NULL,1,19,'To visit farm pond farmer, financial inclusion activities','2025-07-27 07:37:35',NULL,NULL),(71,1,24,2025,41,'DF07250071',5,1,1,NULL,1,NULL,1,19,'To visit Dragon fruit farm and vermicompost farmer','2025-07-27 07:43:28',NULL,NULL),(72,1,26,2025,31,'DF07250072',5,1,1,1,1,'645',1,13,'Had lunch at Mudhol with Shivanand and Plastic Shreds buyers ','2025-07-28 14:33:25',35,'2025-07-30 12:29:58'),(73,1,26,2025,31,'DF07250073',5,1,1,1,1,'70',1,13,'Had lunch at Belgaum ','2025-07-28 14:34:45',71,'2025-07-30 13:28:49'),(74,1,26,2025,31,'DF07250074',5,1,1,1,1,'10820',1,13,'Had visited Bagalkot , Sindhudurg,Belgaum Cluster with own Car and total 1082 KM in last 10 days 1082x10= 10820','2025-07-28 19:19:26',35,'2025-07-30 12:30:39'),(75,1,22,2025,6,'DF07250075',5,1,1,1,1,NULL,1,10,'Travel from Hubballi to Kalaburagi for visiting three community ponds for survey related to di-silting of community ponds.  ','2025-07-29 12:00:39',35,'2025-07-31 10:21:15'),(76,1,6,2025,57,'DF07250076',5,1,1,NULL,1,NULL,1,19,'Visit To Kudal DF Office','2025-07-29 12:00:48',NULL,NULL),(77,1,22,2025,6,'DF07250077',5,1,1,1,1,NULL,1,10,'Return travel from Kalaburagi to Hubballi after community pond survey study. ','2025-07-29 12:01:57',35,'2025-07-31 10:23:30'),(78,1,22,2025,6,'DF07250078',5,1,1,1,1,NULL,1,10,'Visit to vermicompost interested farmers in Navalagund area ','2025-07-29 12:07:22',35,'2025-07-31 10:27:03'),(79,1,22,2025,6,'DF07250079',5,1,1,1,1,NULL,1,10,'Return travel from Navalagund after visiting vermicompost interested farmers','2025-07-29 12:08:18',35,'2025-07-31 10:27:29'),(80,1,31,2025,15,'DF07250080',11,2,2,NULL,1,NULL,1,19,'Visiting to vendors from DF to Gamangatti, Tarihal and Belur for Two days','2025-07-29 17:13:09',NULL,NULL),(81,1,31,2025,15,'DF07250081',11,2,2,NULL,1,NULL,1,19,'Travelled Varur to lookout for Potential Vendors ','2025-07-29 17:17:56',NULL,NULL),(82,1,6,2025,57,'DF07250082',5,1,1,NULL,1,NULL,1,19,'Visit to DF Office Sindhudurg ','2025-07-30 20:30:31',NULL,NULL),(83,1,25,2025,11,'DF07250083',5,1,1,NULL,1,NULL,1,19,'Field work at Kadadalli. ','2025-07-30 21:03:39',NULL,NULL),(84,1,25,2025,11,'DF07250084',5,1,1,NULL,1,NULL,1,19,'Field work at Kadadalli. ','2025-07-31 07:17:03',NULL,NULL),(85,1,32,2025,38,'DF07250085',5,1,1,1,1,NULL,1,10,'Visit to Belagavi for Coursera Programe','2025-07-31 13:05:49',35,'2025-07-31 14:41:29');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travels`
--

DROP TABLE IF EXISTS `travels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travels` (
  `travel_id` int NOT NULL AUTO_INCREMENT,
  `reimb_dtls_id` int DEFAULT NULL,
  `vehicle_id` int DEFAULT NULL,
  `from` varchar(100) DEFAULT NULL,
  `to` varchar(100) DEFAULT NULL,
  `start_odo` varchar(100) DEFAULT NULL,
  `end_odo` varchar(100) DEFAULT NULL,
  `start_odo_path` text,
  `end_odo_path` text,
  `distance` varchar(10) DEFAULT NULL,
  `travel_date` datetime DEFAULT NULL,
  PRIMARY KEY (`travel_id`),
  KEY `vehicle_id` (`vehicle_id`),
  KEY `reimb_dtls_id` (`reimb_dtls_id`),
  CONSTRAINT `travel_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`),
  CONSTRAINT `travel_ibfk_2` FOREIGN KEY (`reimb_dtls_id`) REFERENCES `re_ticket_details` (`reimb_dtls_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travels`
--

LOCK TABLES `travels` WRITE;
/*!40000 ALTER TABLE `travels` DISABLE KEYS */;
INSERT INTO `travels` VALUES (1,1,2,'Hubballi','Gadag','101100','101220',NULL,NULL,'120','2025-07-01 00:00:00'),(2,6,2,'Mudenur','Kudaremoti','22244','22352','https://dfticketing.org/documents/reimbursement/odometer/start_1751685618690_7816.png','https://dfticketing.org/documents/reimbursement/odometer/end_1751685618692_9174.png','108','2025-07-01 00:00:00'),(3,7,2,'Mudenur','Talekhan','22352','22416','https://dfticketing.org/documents/reimbursement/odometer/start_1751686247685_3377.png','https://dfticketing.org/documents/reimbursement/odometer/end_1751686247686_1120.png','64','2025-07-02 00:00:00'),(4,8,2,'Mudenur','Talekhan','22416','22483','https://dfticketing.org/documents/reimbursement/odometer/start_1751686418814_3579.png','https://dfticketing.org/documents/reimbursement/odometer/end_1751686418815_4834.png','67','2025-07-03 00:00:00'),(5,9,2,'Mudenur','Talekhan','22483','22550','https://dfticketing.org/documents/reimbursement/odometer/start_1751687055913_9923.png','https://dfticketing.org/documents/reimbursement/odometer/end_1751687055914_6771.png','67','2025-07-04 00:00:00'),(6,10,2,'yaliwal','kundagol',NULL,NULL,NULL,NULL,'26','2025-07-02 00:00:00'),(7,11,3,'lakshmeshwara','kundagol',NULL,NULL,NULL,NULL,NULL,'2025-07-02 00:00:00'),(8,12,2,'yaliwal','nelawadi','3593','3663','https://dfticketing.org/documents/reimbursement/odometer/start_1751865051806_7816.png','https://dfticketing.org/documents/reimbursement/odometer/end_1751865051807_3275.png','70','2025-07-03 00:00:00'),(9,13,3,'Hubli','Ingalagi',NULL,NULL,NULL,NULL,NULL,'2025-06-19 00:00:00'),(10,14,3,'Hubli','Kustagi',NULL,NULL,NULL,NULL,NULL,'2025-07-01 00:00:00'),(11,15,3,'Kustagi','Hubli',NULL,NULL,NULL,NULL,NULL,'2025-07-05 00:00:00'),(12,16,2,'yaliwal','nelawadi','3593','3663','https://dfticketing.org/documents/reimbursement/odometer/start_1751876998028_4156.png','https://dfticketing.org/documents/reimbursement/odometer/end_1751876998029_4030.png','70','2025-07-03 00:00:00'),(19,23,2,'Hirlok/Kudal','Kudal/Hirlok','01026','01065','https://dfticketing.org/documents/reimbursement/odometer/start_1751880184182_8670.png','https://dfticketing.org/documents/reimbursement/odometer/end_1751880184183_8100.png','39','2025-07-01 00:00:00'),(20,24,2,'Hirlok','Kudal','01065','01086','https://dfticketing.org/documents/reimbursement/odometer/start_1751880464275_4113.png','https://dfticketing.org/documents/reimbursement/odometer/end_1751880464276_6540.png','21','2025-07-02 00:00:00'),(21,25,2,'Hirlok','Kudal','01065','01086','https://dfticketing.org/documents/reimbursement/odometer/start_1751880499166_5599.png','https://dfticketing.org/documents/reimbursement/odometer/end_1751880499167_8924.png','21','2025-07-02 00:00:00'),(22,27,2,'Hirlok/Kudal','Kudal/Hirlok','01086','01126','https://dfticketing.org/documents/reimbursement/odometer/start_1751880867657_2894.png','https://dfticketing.org/documents/reimbursement/odometer/end_1751880867658_1615.png','40','2025-07-03 00:00:00'),(23,28,2,'Hirlok','Kudal','01126','01148','https://dfticketing.org/documents/reimbursement/odometer/start_1751881125156_2596.png','https://dfticketing.org/documents/reimbursement/odometer/end_1751881125157_6502.png','22','2025-07-04 00:00:00'),(24,29,2,'Bambarde','hirlok','01225','01237','https://dfticketing.org/documents/reimbursement/odometer/start_1751881210506_7433.png','https://dfticketing.org/documents/reimbursement/odometer/end_1751881210507_3176.png','12','2025-07-04 00:00:00'),(25,30,2,'Hirlok','Kudal','01237','01258','https://dfticketing.org/documents/reimbursement/odometer/start_1751881317175_5853.png','https://dfticketing.org/documents/reimbursement/odometer/end_1751881317176_2877.png','21','2025-07-07 00:00:00'),(26,32,1,'Hubli','Bangalore','45200','46080',NULL,NULL,'880','2025-06-27 00:00:00'),(27,33,6,'dharwad','patna',NULL,NULL,NULL,NULL,NULL,'2025-07-09 00:00:00'),(28,34,2,'kudal','hirlok','01312','01329','https://dfticketing.org/documents/reimbursement/odometer/start_1752160205503_5577.png','https://dfticketing.org/documents/reimbursement/odometer/end_1752160205504_6145.png','17','2025-07-07 00:00:00'),(29,35,2,'Hirlok','Kudal','01378','01400',NULL,NULL,'22','2025-07-10 00:00:00'),(30,36,3,'Old bus stand ','Basaveshwar nagara cross',NULL,NULL,NULL,NULL,NULL,'2025-07-11 00:00:00'),(31,37,3,'Old bus stand ','New Bus Stand',NULL,NULL,NULL,NULL,NULL,'2025-07-11 00:00:00'),(32,38,3,'Manjunath Cross','HDMC',NULL,NULL,NULL,NULL,NULL,'2025-07-11 00:00:00'),(33,39,2,'Amingad','Kandagal, Maratageri','69829','69913','https://dfticketing.org/documents/reimbursement/odometer/start_1752251678478_1110.png','https://dfticketing.org/documents/reimbursement/odometer/end_1752251678480_3918.png','84','2025-07-08 00:00:00'),(34,40,2,'Amingad','Gorbal, Kandagal, Maratageri','69913','70040','https://dfticketing.org/documents/reimbursement/odometer/start_1752252076142_4802.png','https://dfticketing.org/documents/reimbursement/odometer/end_1752252076143_1111.png','127','2025-07-10 00:00:00'),(35,43,2,'Hirlok','Kudal','01378','01400','https://dfticketing.org/documents/reimbursement/odometer/start_1752321673448_4477.png','https://dfticketing.org/documents/reimbursement/odometer/end_1752321673450_5544.png','22','2025-07-10 00:00:00'),(36,44,4,'kudal','Madgaon',NULL,NULL,NULL,NULL,NULL,'2025-07-11 00:00:00'),(37,45,4,'Madgaon','Hubbali',NULL,NULL,NULL,NULL,NULL,'2025-07-11 00:00:00'),(38,46,3,'Hubbali Railway Station','BVB',NULL,NULL,NULL,NULL,NULL,'2025-07-11 00:00:00'),(39,48,4,'Hubbali','Kudal',NULL,NULL,NULL,NULL,NULL,'2025-07-12 00:00:00'),(40,49,2,'Amingad','Ilakal, Gorbal, Kandagal','70040','70118','https://dfticketing.org/documents/reimbursement/odometer/start_1752509926804_9890.png','https://dfticketing.org/documents/reimbursement/odometer/end_1752509926805_1179.png','78','2025-07-12 00:00:00'),(41,50,2,'Amingad','Kandagal, Maratagei, kamatagi, injanavari','70118','70235','https://dfticketing.org/documents/reimbursement/odometer/start_1752510389356_6257.png','https://dfticketing.org/documents/reimbursement/odometer/end_1752510389357_7004.png','117','2025-07-14 00:00:00'),(42,51,2,'Yaliwal ','Kundagol',NULL,NULL,NULL,NULL,'26','2025-07-12 00:00:00'),(43,52,4,'Madgaon','Kudal',NULL,NULL,NULL,NULL,NULL,'2025-07-13 00:00:00'),(44,53,2,'Hirlok','Kudal','01448','01466','https://dfticketing.org/documents/reimbursement/odometer/start_1752573954242_6018.png','https://dfticketing.org/documents/reimbursement/odometer/end_1752573954242_8207.png','18','2025-07-14 00:00:00'),(45,54,2,'kudal','hirlok','01466','01485',NULL,NULL,'19','2025-07-14 00:00:00'),(46,55,2,'Amingad','Ilakal, Gorbal, Kamatagi, Injanavari','70235','70340','https://dfticketing.org/documents/reimbursement/odometer/start_1752631902355_7893.png','https://dfticketing.org/documents/reimbursement/odometer/end_1752631902356_7733.png','105','2025-07-15 00:00:00'),(47,56,2,'Kalaburagi','Chandankera and Hudadalli','126309','126472','https://dfticketing.org/documents/reimbursement/odometer/start_1752652001174_5014.png','https://dfticketing.org/documents/reimbursement/odometer/end_1752652001175_9791.png','163','2025-07-14 00:00:00'),(48,57,2,'Kalaburagi','Chandankera and Tumkunta','126474','126652',NULL,NULL,'178','2025-07-15 00:00:00'),(49,58,2,'kudal','hirlok','01466','01485','https://dfticketing.org/documents/reimbursement/odometer/start_1752814909745_1187.png','https://dfticketing.org/documents/reimbursement/odometer/end_1752814909746_9912.png','19','2025-07-14 00:00:00'),(50,59,2,'Hirlok','Kudal','01485','01507','https://dfticketing.org/documents/reimbursement/odometer/start_1752815214178_3980.png','https://dfticketing.org/documents/reimbursement/odometer/end_1752815214179_2438.png','22','2025-07-15 00:00:00'),(51,60,2,'Kudal','Hirlok','01507','01524','https://dfticketing.org/documents/reimbursement/odometer/start_1752815332996_5421.png','https://dfticketing.org/documents/reimbursement/odometer/end_1752815332996_9619.png','17','2025-07-15 00:00:00'),(52,61,2,'Hirlok','Kudal','01524','01536','https://dfticketing.org/documents/reimbursement/odometer/start_1752815673127_1970.png','https://dfticketing.org/documents/reimbursement/odometer/end_1752815673127_3744.png','12','2025-07-16 00:00:00'),(53,62,2,'kudal','hirlok','01536','01553','https://dfticketing.org/documents/reimbursement/odometer/start_1752815786648_4608.png','https://dfticketing.org/documents/reimbursement/odometer/end_1752815786648_3010.png','17','2025-07-16 00:00:00'),(54,63,2,'Hirlok','Kudal','01553','01576','https://dfticketing.org/documents/reimbursement/odometer/start_1752816339301_8340.png','https://dfticketing.org/documents/reimbursement/odometer/end_1752816339302_2187.png','23','2025-07-17 00:00:00'),(55,64,2,'kudal','Hirlok','01576','01598','https://dfticketing.org/documents/reimbursement/odometer/start_1752816457065_8448.png','https://dfticketing.org/documents/reimbursement/odometer/end_1752816457065_7673.png','22','2025-07-17 00:00:00'),(56,65,2,'Hirlok','Kudal','01598','01618','https://dfticketing.org/documents/reimbursement/odometer/start_1752816637821_2246.png','https://dfticketing.org/documents/reimbursement/odometer/end_1752816637822_1663.png','20','2025-07-18 00:00:00'),(57,66,4,'KSR Bengaluru','SSS Hubballi',NULL,NULL,NULL,NULL,NULL,'2025-07-07 00:00:00'),(58,68,2,'kudal','hirlok','01618','01639','https://dfticketing.org/documents/reimbursement/odometer/start_1753082333360_3888.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753082333361_9896.png','21','2025-07-18 00:00:00'),(59,69,2,'Yaliwal','Bhadrapura ','3772','3854','https://dfticketing.org/documents/reimbursement/odometer/start_1753108770997_8804.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753108770998_4927.png','82','2025-07-21 00:00:00'),(60,70,2,'Yaliwal','Bhadrapura ','3854','3936',NULL,'https://dfticketing.org/documents/reimbursement/odometer/end_1753195657634_5806.png','82','2025-07-22 00:00:00'),(61,71,2,'Yaliwal','Bhadrapura ','3854','3936','https://dfticketing.org/documents/reimbursement/odometer/start_1753195949311_1205.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753195949311_4313.png','82','2025-07-22 00:00:00'),(62,72,2,'Hirlok','Kudal','01738','01755','https://dfticketing.org/documents/reimbursement/odometer/start_1753198968061_9971.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753198968062_9521.png','17','2025-07-21 00:00:00'),(63,73,2,'kudal','hirlok','01755','01773','https://dfticketing.org/documents/reimbursement/odometer/start_1753199075082_6280.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753199075083_6922.png','18','2025-07-21 00:00:00'),(64,74,2,'Hirlok','Kudal','01773','01791','https://dfticketing.org/documents/reimbursement/odometer/start_1753199204111_7505.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753199204112_1399.png','18','2025-07-22 00:00:00'),(65,75,2,'Kudal','Hirlok','01796','01814','https://dfticketing.org/documents/reimbursement/odometer/start_1753199428887_7281.png',NULL,'18','2025-07-22 00:00:00'),(66,76,2,'Yaliwal','Bhadrapura ','3936','4018','https://dfticketing.org/documents/reimbursement/odometer/start_1753276845589_7054.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753276845590_1775.png','82','2025-07-23 00:00:00'),(67,84,2,'DF','Belur Industrial Area','2995','3136','https://dfticketing.org/documents/reimbursement/odometer/start_1753358587499_8430.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753358587500_2865.png','141','2025-07-23 00:00:00'),(68,85,2,'Yaliwal','Bhadrapura ','4018','4100','https://dfticketing.org/documents/reimbursement/odometer/start_1753362632929_8532.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753362632929_4882.png','82','2025-07-24 00:00:00'),(69,86,2,'Mudenur','Kudaremoti','22935','23034','https://dfticketing.org/documents/reimbursement/odometer/start_1753371877995_5513.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753371877996_5231.png','99','2025-07-12 00:00:00'),(70,87,2,'Mudenur','Talekhan','23280','23355','https://dfticketing.org/documents/reimbursement/odometer/start_1753372123658_2799.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753372123658_5535.png','75','2025-07-16 00:00:00'),(71,88,2,'Mudenur','Kudaremoti','23688','23808','https://dfticketing.org/documents/reimbursement/odometer/start_1753372431924_1389.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753372431924_5097.png','120','2025-07-23 00:00:00'),(72,90,2,'Mudenur','Kudaremoti','23808','23921','https://dfticketing.org/documents/reimbursement/odometer/start_1753372865447_2895.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753372865448_3823.png','113','2025-07-24 00:00:00'),(73,92,2,'Mudenur','Talekhan','23921','23989','https://dfticketing.org/documents/reimbursement/odometer/start_1753431850754_1791.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753431850755_6954.png','68','2025-07-25 00:00:00'),(74,93,2,'Hirlok','Kudal','01814','01833','https://dfticketing.org/documents/reimbursement/odometer/start_1753433289496_8966.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753433289497_8379.png','19','2025-07-23 00:00:00'),(75,94,3,'Kudal','Sawantwadi',NULL,NULL,NULL,NULL,NULL,'2025-07-23 00:00:00'),(76,95,3,'Dodamarg','Bhedshi',NULL,NULL,NULL,NULL,NULL,'2025-07-23 00:00:00'),(77,96,3,'Bhedshi','Morle',NULL,NULL,NULL,NULL,NULL,'2025-07-23 00:00:00'),(78,98,2,'Kudal','Hirlok','01833','01855','https://dfticketing.org/documents/reimbursement/odometer/start_1753433968826_7936.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753433968827_5431.png','22','2025-07-23 00:00:00'),(79,99,2,'Hirlok','Kudal','01855','01877','https://dfticketing.org/documents/reimbursement/odometer/start_1753434317498_2379.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753434317499_6394.png','22','2025-07-24 00:00:00'),(80,100,2,'kudal','hirlok','01877','01897','https://dfticketing.org/documents/reimbursement/odometer/start_1753434490682_1824.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753434490682_6082.png','20','2025-07-24 00:00:00'),(81,101,2,'Hirlok','Pandur','01897','01910','https://dfticketing.org/documents/reimbursement/odometer/start_1753434629858_3105.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753434629859_9520.png','13','2025-07-25 00:00:00'),(82,103,2,'Yaliwal','Bhadrapura ','4100','4182','https://dfticketing.org/documents/reimbursement/odometer/start_1753449640923_9110.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753449640924_8244.png','82','2025-07-25 00:00:00'),(83,104,2,'Pandur ','Kudal','01910','01920','https://dfticketing.org/documents/reimbursement/odometer/start_1753517513411_4560.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753517513412_1567.png','10','2025-07-25 00:00:00'),(84,105,2,'kudal','hirlok','01920','01939','https://dfticketing.org/documents/reimbursement/odometer/start_1753517596489_7194.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753517596490_7467.png','19','2025-07-25 00:00:00'),(85,106,2,'Yaliwal','Bhadrapura ','4181','4263','https://dfticketing.org/documents/reimbursement/odometer/start_1753538115382_9566.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753538115383_8054.png','82','2025-07-26 00:00:00'),(86,107,2,'Amingad','Ninjanavari, Mullur, Tallikeri','70340','70441','https://dfticketing.org/documents/reimbursement/odometer/start_1753580506987_6188.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753580506988_2083.png','101','2025-07-17 00:00:00'),(87,108,2,'Amingad','Gorbal, Herur','70441','70517','https://dfticketing.org/documents/reimbursement/odometer/start_1753580822092_8591.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753580822093_6355.png','76','2025-07-18 00:00:00'),(88,109,2,'Amingad','Maratagei, Injanavari, mullur,','71561','71675','https://dfticketing.org/documents/reimbursement/odometer/start_1753581336942_7785.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753581336943_4358.png','114','2025-07-21 00:00:00'),(89,110,2,'Amingad','Vadageri, Ilakal, Dammur','71675','71778','https://dfticketing.org/documents/reimbursement/odometer/start_1753581670756_8956.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753581670757_9727.png','103','2025-07-23 00:00:00'),(90,111,2,'Amingad','Gorbal, Ilakal, Dammur','71778','71903','https://dfticketing.org/documents/reimbursement/odometer/start_1753582055814_5850.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753582055815_3429.png','125','2025-07-24 00:00:00'),(91,112,2,'Amingad','Kamatagi, Injanavari,and Mullur','71903','71942','https://dfticketing.org/documents/reimbursement/odometer/start_1753582408711_8788.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753582408711_5500.png','39','2025-07-26 00:00:00'),(92,116,4,'Hubballi','Kalaburagi',NULL,NULL,NULL,NULL,NULL,'2025-07-11 00:00:00'),(93,117,2,'Hirlok','Kudal','01939','01956','https://dfticketing.org/documents/reimbursement/odometer/start_1753770648709_2716.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753770648710_7346.png','17','2025-07-28 00:00:00'),(94,118,4,'Kalaburagi','Hubballi',NULL,NULL,NULL,NULL,NULL,'2025-07-20 00:00:00'),(95,119,2,'kudal','Hirlok','01956','01978',NULL,NULL,'22','2025-07-28 00:00:00'),(96,120,3,'Hubballi','Navalagund',NULL,NULL,NULL,NULL,NULL,'2025-07-25 00:00:00'),(97,121,3,'Navalagund','Hubballi',NULL,NULL,NULL,NULL,NULL,'2025-07-25 00:00:00'),(98,122,2,'DF','Belur Industrial Area','2995','3136','https://dfticketing.org/documents/reimbursement/odometer/start_1753789389989_6036.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753789389990_7800.png','141','2025-07-22 00:00:00'),(99,123,2,'DF','Varur','3249','3310','https://dfticketing.org/documents/reimbursement/odometer/start_1753789677005_9263.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753789677005_2866.png','61','2025-07-29 00:00:00'),(100,124,2,'Hirlok','Kudal','01978','01997','https://dfticketing.org/documents/reimbursement/odometer/start_1753887631016_1411.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753887631016_9533.png','19','2025-07-30 00:00:00'),(101,125,2,'Kudal','Hirlok','01997','02015','https://dfticketing.org/documents/reimbursement/odometer/start_1753887704645_7377.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753887704645_7506.png','18','2025-07-30 00:00:00'),(102,126,2,'Yaliwal ','Kadadalli ','4324','4477','https://dfticketing.org/documents/reimbursement/odometer/start_1753889619680_1636.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753889619681_2686.png','153','2025-07-28 00:00:00'),(103,127,2,'Yaliwal ','Kadadalli ','4477','4632','https://dfticketing.org/documents/reimbursement/odometer/start_1753926423921_1491.png','https://dfticketing.org/documents/reimbursement/odometer/end_1753926423922_9712.png','155','2025-07-30 00:00:00'),(104,128,3,'Kudal','Belagavi',NULL,NULL,NULL,NULL,NULL,'2025-07-28 00:00:00'),(105,129,3,'Belagavi','Kudal',NULL,NULL,NULL,NULL,NULL,'2025-07-28 00:00:00');
/*!40000 ALTER TABLE `travels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_bank`
--

DROP TABLE IF EXISTS `user_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_bank` (
  `bank_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `name_on_bank` varchar(100) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `account_number` varchar(20) DEFAULT NULL,
  `IFSC` varchar(50) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`bank_id`),
  KEY `status_id` (`status_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_bank_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`),
  CONSTRAINT `user_bank_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_bank`
--

LOCK TABLES `user_bank` WRITE;
/*!40000 ALTER TABLE `user_bank` DISABLE KEYS */;
INSERT INTO `user_bank` VALUES (1,2,'Akshay Goharkar','ICICI Bank','333401504203','ICIC0003334',1,'2025-07-01 17:33:28',NULL),(2,3,'Amith Krishnan C','Canara Bank','0724101096164','CNRB0000724',1,'2025-07-01 17:33:28',NULL),(4,5,'Anand Jayantilal Bariya','IDFC Bank','10006892568','IDFB0042401',1,'2025-07-01 17:33:29',NULL),(5,6,'Arunkumar Manthale','HDFC Bank','50100701195392','HDFC0000768',1,'2025-07-01 17:33:29',NULL),(6,7,'Ashok Hanamantappa','Karnataka Vikas Grameena Bank','17058024442','KVGB0004405',1,'2025-07-01 17:33:29',NULL),(7,8,'Bachewar Kamaji Ramrao','State Bank of India','40381614973','SBIN0005938',1,'2025-07-01 17:33:29',NULL),(8,9,'Basavaraj S.B','ICICI Bank','142601505445','ICIC0001426',1,'2025-07-01 17:33:29',NULL),(9,10,'Bejjenki Alekhya','State Bank of India','62249445481','SBIN0020137',1,'2025-07-01 17:33:29',NULL),(10,11,'Chandrashekhar M Madivalar','Union Bank of India','520481034180529','UBIN0903094',1,'2025-07-01 17:33:29',NULL),(11,12,'Channabasava','State Bank of India','64106855269','SBIN0040639',1,'2025-07-01 17:33:29',NULL),(12,13,'Ciyedin Salim','HDFC Bank','50100227560250','HDFC0004681',1,'2025-07-01 17:33:29',NULL),(13,14,'Dasari Varaprasad','Union Bank of India','21510100175310','UBIN0802158',1,'2025-07-01 17:33:29',NULL),(14,1,'Deepu Kumar','Central Bank of India','3543912655','CBIN0284137',1,'2025-07-01 17:33:29',NULL),(15,15,'Faiz Ali K Mulla','Canara Bank','2949101004436','CNRB0002949',1,'2025-07-01 17:33:30',NULL),(16,16,'Gautham V Shanbhogue','Kotak Mahindra Bank','3411327223','KKBK0008079',1,'2025-07-01 17:33:30',NULL),(17,17,'Hemavathi Malleshappa Purad','Axis Bank','913010021354676','UTIB0001811',1,'2025-07-01 17:33:30',NULL),(18,18,'Jayathirtha Y S','ICICI Bank','007801013180','ICIC0000078',1,'2025-07-01 17:33:30',NULL),(19,19,'Kallappa  Patted','Canara Bank','12502250038485','CNRB0011250',1,'2025-07-01 17:33:30',NULL),(20,20,'Kesha Udvitha','HDFC Bank','50100732986219','HDFC0002604',1,'2025-07-01 17:33:30',NULL),(21,21,'Kiran Walikar','Union Bank of India','520101237656325','UBIN0902951',1,'2025-07-01 17:33:30',NULL),(22,22,'Kodali Sumasree','Axis Bank','918010012892685','UTIB0000291',1,'2025-07-01 17:33:30',NULL),(23,23,'Kotresha Sandera','Canara Bank','06132200110709','CNRB0010613',1,'2025-07-01 17:33:30',NULL),(24,24,'Linganolla Srikanth','Telangana Grameena Bank','79056714334','TGRB0000414',1,'2025-07-01 17:33:30',NULL),(25,25,'Mallikarjun K','Canara Bank','2737101012615','CNRB0002737',1,'2025-07-01 17:33:31',NULL),(26,26,'Manjula Arasapur','Bank of India','898410110001899','BKID0008984',1,'2025-07-01 17:33:31',NULL),(27,27,'Manjunath P','Karnataka Vikas Grameena Bank','89032211561','KVGB0004118',1,'2025-07-01 17:33:31',NULL),(28,28,'Manjunath Yallappa Kaihuttanavar','Union Bank of India','520441029341519','UBIN0900648',1,'2025-07-01 17:33:31',NULL),(29,29,'Mohsin Taj','Kotak Mahindra Bank','9048666988','KKBK0000446',1,'2025-07-01 17:33:31',NULL),(30,30,'Muttanna Waleekar','Canara Bank','110114910378','CNRB0011244',1,'2025-07-01 17:33:31',NULL),(31,31,'Nanjundappa Jugali','State Bank of India','64041031637','SBIN0000840',1,'2025-07-01 17:33:31',NULL),(32,32,'Naveen Kumar M P M','Kotak Mahindra Bank','3148257985','KKBK0000446',1,'2025-07-01 17:33:31',NULL),(33,33,'Parmeshwar Kanhere','Maharashtra Gramin Bank','80062657865','MAHG0005209',1,'2025-07-01 17:33:31',NULL),(34,34,'Parthasarathy Sudarsanam','Union Bank of India','520101066963172','UBIN0901440',1,'2025-07-01 17:33:32',NULL),(35,35,'Pavan Mahendrakar','Canara Bank','08102190001429','CNRB0011244',1,'2025-07-01 17:33:32',NULL),(36,36,'Payal Ekbote','Canara Bank','8655101005997','CNRB0008655',1,'2025-07-01 17:33:32',NULL),(37,37,'Praveen Honnappa Ambiga','State Bank of India','54058659341','SBIN0041044',1,'2025-07-01 17:33:32',NULL),(38,38,'Rahul Vishnu Ghope','State Bank of India','32466215839','SBIN0000407',1,'2025-07-01 17:33:32',NULL),(39,39,'Ramajansab Allisab Nadaf','State Bank of India','64148066739','SBIN0040828',1,'2025-07-01 17:33:32',NULL),(40,40,'Rasoolabai Mohammed Waseem Ahammed','State Bank of India','30404956237','SBIN0000923',1,'2025-07-01 17:33:32',NULL),(41,41,'Ravi Ramudu','State Bank of India','64067432541','SBIN0013290',1,'2025-07-01 17:33:32',NULL),(42,42,'Ravichandrayya Kadlimath','Karnataka Vikas Grameena Bank','89033186789','KVGB0007601',1,'2025-07-01 17:33:32',NULL),(43,43,'Sagar Shanthaveer Hosur','Kotak Mahindra Bank','3148257978','KKBK0000446',1,'2025-07-01 17:33:32',NULL),(44,44,'Sandeepkumar Naik','Axis Bank','913010051453552','UTIB0001811',1,'2025-07-01 17:33:32',NULL),(45,45,'Santhoshkumar S Badami','ICICI Bank','015701536206','ICIC0000157',1,'2025-07-01 17:33:33',NULL),(46,46,'Santosh B Barker','Union Bank of India','520101004343227','UBIN0533173',1,'2025-07-01 17:33:33',NULL),(47,47,'Savitha Kulkarni','HDFC Bank','50100315589260','HDFC0000254',1,'2025-07-01 17:33:33',NULL),(48,48,'Seema Kudari','Karnataka Vikas Grameena Bank','89134768208','KVGB0004008',1,'2025-07-01 17:33:33',NULL),(49,49,'Shivanand Somannavar','Axis Bank','913010023899542','UTIB0001811',1,'2025-07-01 17:33:33',NULL),(50,50,'Siddhesh Babu Palav','State Bank of India','41070294173','SBIN0001245',1,'2025-07-01 17:33:33',NULL),(51,51,'Sonali Sarma','HDFC Bank','01461140021548','HDFC0000146',1,'2025-07-01 17:33:33',NULL),(52,52,'Srinivasa H','ICICI Bank','142601000654','ICIC0001426',1,'2025-07-01 17:33:33',NULL),(53,53,'Sunita Abbai','Kotak Mahindra Bank','9048666957','KKBK0000446',1,'2025-07-01 17:33:33',NULL),(54,54,'Suraj Shripad Patil','Karnataka Bank','3052500114866001','KARB0000305',1,'2025-07-01 17:33:33',NULL),(55,55,'Suresh Talawar','State Bank of India','39378011152','SBIN0040856',1,'2025-07-01 17:33:34',NULL),(56,56,'Swapna Ankola','Canara Bank','12442010032484','CNRB0011244',1,'2025-07-01 17:33:34',NULL),(57,57,'Tejas Tukaram Sawant','State Bank of India','41607309719','SBIN0001245',1,'2025-07-01 17:33:34',NULL),(58,58,'Vijay Kulkarni','Union Bank of India','520291021426530','UBIN0915688',1,'2025-07-01 17:33:34',NULL),(59,59,'Vinaykumar Vardhaman Upadhye','State Bank of India','64117192310','SBIN0040997',1,'2025-07-01 17:33:34',NULL),(60,60,'Vinod Gangadhar Meti','Canara Bank','12502210019027','CNRB0011250',1,'2025-07-01 17:33:34',NULL),(61,61,'Virappa Bhimappa Bijapur','CANARA BANK','3039101004982','CNRB0003039',1,'2025-07-01 17:33:34',NULL),(62,62,'Vitthal Shankar Metri','State Bank of India','31674630140','SBIN0002224',1,'2025-07-01 17:33:34',NULL),(63,63,'Manish Kumar Jaiswal','HDFC Bank','50100164188599','HDFC0002757',1,'2025-07-01 17:54:10',NULL),(64,64,'Narasimha Nayak Perampalli','ICICI Bank','004801018696','ICIC0000048',1,'2025-07-01 17:54:11',NULL),(65,65,'Vijay Purohit','State Bank of India','36518584505','SBIN0040606',1,'2025-07-01 17:54:11',NULL),(66,66,'Ananda Kammara','Kotak Mahindra Bank','3649258375','KKBK0000446',1,'2025-07-01 17:54:11',NULL),(67,67,'Sahiti Meduri','Axis Bank','922010017287555','UTIB0003659',1,'2025-07-01 17:54:11',NULL),(68,68,'Shankarsingh Kalaghatagi','ICICI Bank','015701523016','ICIC0000157',1,'2025-07-01 17:54:11',NULL),(69,69,'Sunil Chitragar','Bank of Baroda','139101011000594','BARB0VJMDHA',1,'2025-07-01 17:54:11',NULL),(70,70,'Ramesh Channappa Hubballi','ICICI Bank','142601505258','ICIC0001426',1,'2025-07-01 17:54:11',NULL),(71,72,'Amlanjyoti Laha','State Bank of India','37488694534','SBIN0012459',1,'2025-07-02 13:06:03',NULL);
/*!40000 ALTER TABLE `user_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_history`
--

DROP TABLE IF EXISTS `user_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_history` (
  `user_history_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `employee_number` varchar(50) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `work_email` varchar(100) DEFAULT NULL,
  `password` text,
  `mobile` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `PAN_number` varchar(50) DEFAULT NULL,
  `aadhaar_number` varchar(30) DEFAULT NULL,
  `enrollment_number` int DEFAULT NULL,
  `DOB` varchar(30) DEFAULT NULL,
  `entity_id` int DEFAULT NULL,
  `cost_center_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `sub_department_id` int DEFAULT NULL,
  `job_title` varchar(100) DEFAULT NULL,
  `secondary_job_title` varchar(100) DEFAULT NULL,
  `manager_user_id` int DEFAULT NULL,
  `personal_email` varchar(100) DEFAULT NULL,
  `father_name` varchar(50) DEFAULT NULL,
  `mother_name` varchar(50) DEFAULT NULL,
  `blood_group` varchar(20) DEFAULT NULL,
  `nationality` varchar(30) DEFAULT NULL,
  `bank_id` int DEFAULT NULL,
  `pf_id` int DEFAULT NULL,
  `pay_group` varchar(100) DEFAULT NULL,
  `band` varchar(30) DEFAULT NULL,
  `pay_grade` varchar(100) DEFAULT NULL,
  `work_location` text,
  `status_id` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`user_history_id`),
  KEY `user_id` (`user_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `user_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_history_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_history`
--

LOCK TABLES `user_history` WRITE;
/*!40000 ALTER TABLE `user_history` DISABLE KEYS */;
INSERT INTO `user_history` VALUES (1,53,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-07-01 17:55:19',1),(2,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-07-02 13:41:10',1),(3,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-07-02 13:41:36',1),(4,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-07-02 13:42:37',1),(5,22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2025-07-02 13:42:47',1),(6,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'2025-07-31 15:44:39',1),(7,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'2025-07-31 15:45:37',1),(8,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'2025-07-31 15:46:20',1),(9,22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'2025-07-31 15:46:23',1);
/*!40000 ALTER TABLE `user_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_role_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  PRIMARY KEY (`user_role_id`),
  KEY `status_id` (`status_id`),
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`),
  CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  CONSTRAINT `user_roles_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,1,7,'2025-06-25 11:43:26','System',1),(2,1,1,'2025-06-25 11:43:26','System',1),(3,2,7,'2025-07-01 17:33:34','System',1),(4,3,7,'2025-07-01 17:33:34','System',1),(6,5,7,'2025-07-01 17:33:34','System',1),(7,6,7,'2025-07-01 17:33:34','System',1),(8,7,7,'2025-07-01 17:33:34','System',1),(9,8,7,'2025-07-01 17:33:34','System',1),(10,9,7,'2025-07-01 17:33:34','System',1),(11,10,7,'2025-07-01 17:33:34','System',1),(12,11,7,'2025-07-01 17:33:34','System',1),(13,12,7,'2025-07-01 17:33:34','System',1),(14,13,7,'2025-07-01 17:33:34','System',1),(15,14,7,'2025-07-01 17:33:34','System',1),(16,15,7,'2025-07-01 17:33:34','System',1),(17,16,7,'2025-07-01 17:33:34','System',1),(18,17,7,'2025-07-01 17:33:34','System',1),(19,18,7,'2025-07-01 17:33:34','System',1),(20,19,7,'2025-07-01 17:33:34','System',1),(21,20,7,'2025-07-01 17:33:34','System',1),(22,21,7,'2025-07-01 17:33:34','System',1),(23,22,7,'2025-07-01 17:33:34','System',1),(24,23,7,'2025-07-01 17:33:34','System',1),(25,24,7,'2025-07-01 17:33:34','System',1),(26,25,7,'2025-07-01 17:33:34','System',1),(27,26,7,'2025-07-01 17:33:34','System',1),(28,27,7,'2025-07-01 17:33:34','System',1),(29,28,7,'2025-07-01 17:33:34','System',1),(30,29,7,'2025-07-01 17:33:34','System',1),(31,30,7,'2025-07-01 17:33:34','System',1),(32,31,7,'2025-07-01 17:33:34','System',1),(33,32,7,'2025-07-01 17:33:34','System',1),(34,33,7,'2025-07-01 17:33:34','System',1),(35,34,7,'2025-07-01 17:33:34','System',1),(36,35,7,'2025-07-01 17:33:34','System',1),(37,36,7,'2025-07-01 17:33:34','System',1),(38,37,7,'2025-07-01 17:33:34','System',1),(39,38,7,'2025-07-01 17:33:34','System',1),(40,39,7,'2025-07-01 17:33:34','System',1),(41,40,7,'2025-07-01 17:33:34','System',1),(42,41,7,'2025-07-01 17:33:34','System',1),(43,42,7,'2025-07-01 17:33:34','System',1),(44,43,7,'2025-07-01 17:33:34','System',1),(45,44,7,'2025-07-01 17:33:34','System',1),(46,45,7,'2025-07-01 17:33:34','System',1),(47,46,7,'2025-07-01 17:33:34','System',1),(48,47,7,'2025-07-01 17:33:34','System',1),(49,48,7,'2025-07-01 17:33:34','System',1),(50,49,7,'2025-07-01 17:33:34','System',1),(51,50,7,'2025-07-01 17:33:34','System',1),(52,51,7,'2025-07-01 17:33:34','System',1),(53,52,7,'2025-07-01 17:33:34','System',1),(54,53,7,'2025-07-01 17:33:34','System',2),(55,54,7,'2025-07-01 17:33:34','System',1),(56,55,7,'2025-07-01 17:33:34','System',1),(57,56,7,'2025-07-01 17:33:34','System',1),(58,57,7,'2025-07-01 17:33:34','System',1),(59,58,7,'2025-07-01 17:33:34','System',1),(60,59,7,'2025-07-01 17:33:34','System',1),(61,60,7,'2025-07-01 17:33:34','System',1),(62,61,7,'2025-07-01 17:33:34','System',1),(63,62,7,'2025-07-01 17:33:34','System',1),(64,1,8,'2025-07-01 17:33:34','System',2),(66,16,8,'2025-07-01 17:37:30','System',1),(67,5,8,'2025-07-01 17:37:30','System',1),(68,31,8,'2025-07-01 17:37:30','System',1),(69,9,8,'2025-07-01 17:37:30','System',1),(70,30,8,'2025-07-01 17:37:30','System',1),(71,23,8,'2025-07-01 17:37:30','System',1),(72,22,8,'2025-07-01 17:37:30','System',1),(73,45,8,'2025-07-01 17:37:30','System',1),(74,47,8,'2025-07-01 17:37:30','System',1),(75,41,8,'2025-07-01 17:37:30','System',1),(76,34,8,'2025-07-01 17:37:30','System',1),(77,26,8,'2025-07-01 17:37:30','System',1),(78,44,8,'2025-07-01 17:37:30','System',1),(79,51,8,'2025-07-01 17:37:30','System',1),(80,58,8,'2025-07-01 17:37:30','System',1),(81,25,8,'2025-07-01 17:37:30','System',1),(97,63,7,'2025-07-01 17:54:11','System',1),(98,64,7,'2025-07-01 17:54:11','System',1),(99,65,7,'2025-07-01 17:54:11','System',1),(100,66,7,'2025-07-01 17:54:11','System',1),(101,67,7,'2025-07-01 17:54:11','System',1),(102,68,7,'2025-07-01 17:54:11','System',1),(103,69,7,'2025-07-01 17:54:11','System',1),(104,70,7,'2025-07-01 17:54:11','System',1),(105,63,8,'2025-07-01 17:54:11','System',1),(106,64,8,'2025-07-01 17:54:11','System',1),(107,65,8,'2025-07-01 17:54:11','System',1),(108,66,8,'2025-07-01 17:54:11','System',1),(109,67,8,'2025-07-01 17:54:11','System',1),(110,68,8,'2025-07-01 17:54:11','System',1),(111,69,8,'2025-07-01 17:54:11','System',1),(112,70,8,'2025-07-01 17:54:11','System',1),(113,1,8,'2025-07-02 11:01:29','System',2),(114,35,3,'2025-07-02 11:06:50','System',1),(115,48,6,'2025-07-02 11:06:50','System',1),(116,71,7,'2025-07-02 11:06:50','System',1),(117,71,4,'2025-07-02 11:06:50','System',1),(118,72,7,'2025-07-02 13:09:57','System',2),(119,72,7,'2025-07-02 13:40:40','System',1),(120,18,3,'2025-07-07 10:26:40','System',1),(121,18,4,'2025-07-07 10:26:40','System',1),(122,73,7,'2025-07-31 14:46:11','System',1),(123,73,4,'2025-07-31 14:46:11','System',1),(124,74,7,'2025-07-31 14:46:11','System',1),(125,74,4,'2025-07-31 14:46:11','System',1);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `employee_number` varchar(50) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `work_email` varchar(100) DEFAULT NULL,
  `password` text,
  `mobile` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `PAN_number` varchar(50) DEFAULT NULL,
  `aadhaar_number` varchar(30) DEFAULT NULL,
  `enrollment_number` int DEFAULT NULL,
  `DOB` varchar(30) DEFAULT NULL,
  `entity_id` int DEFAULT NULL,
  `cost_center_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `sub_department_id` int DEFAULT NULL,
  `job_title` varchar(100) DEFAULT NULL,
  `secondary_job_title` varchar(100) DEFAULT NULL,
  `manager_user_id` int DEFAULT NULL,
  `personal_email` varchar(100) DEFAULT NULL,
  `father_name` varchar(50) DEFAULT NULL,
  `mother_name` varchar(50) DEFAULT NULL,
  `blood_group` varchar(20) DEFAULT NULL,
  `nationality` varchar(30) DEFAULT NULL,
  `bank_id` int DEFAULT NULL,
  `pf_id` int DEFAULT NULL,
  `pay_group` varchar(100) DEFAULT NULL,
  `band` varchar(30) DEFAULT NULL,
  `pay_grade` varchar(100) DEFAULT NULL,
  `work_location` text,
  `sended_email` int DEFAULT '0',
  `status_id` int DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `department_id` (`department_id`),
  KEY `employee_id` (`employee_id`),
  KEY `cost_center_id` (`cost_center_id`),
  KEY `entity_id` (`entity_id`),
  KEY `bank_id` (`bank_id`),
  KEY `pf_id` (`pf_id`),
  KEY `status_id` (`status_id`),
  KEY `sub_department_id` (`sub_department_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  CONSTRAINT `users_ibfk_3` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_center` (`cost_center_id`),
  CONSTRAINT `users_ibfk_4` FOREIGN KEY (`entity_id`) REFERENCES `entities` (`entity_id`),
  CONSTRAINT `users_ibfk_5` FOREIGN KEY (`bank_id`) REFERENCES `user_bank` (`bank_id`),
  CONSTRAINT `users_ibfk_6` FOREIGN KEY (`pf_id`) REFERENCES `pf_details` (`pf_id`),
  CONSTRAINT `users_ibfk_7` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`),
  CONSTRAINT `users_ibfk_8` FOREIGN KEY (`sub_department_id`) REFERENCES `sub_departments` (`sub_department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'000010782','Deepu Kumar','deepu.kumar@dfmail.org','$2b$10$fxKdXqzFvZZYHqL7s/pK0e2V7LM5vF/FI55whYNPe.hHjBHya26Mu','91-9065446115',NULL,NULL,NULL,NULL,NULL,1,27,NULL,NULL,'Software Development Engineer 1',NULL,16,NULL,NULL,NULL,NULL,NULL,14,NULL,NULL,'L2','L2','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-02 11:02:22'),(2,2,'000010748','Akshay Goharkar','akshay.goharkar@dfmail.org','$2b$10$SEel0uaYM32low2O4YouOOE1PrLmxZqXYFBNLsEQPE56KxZu1EEXq','91-9493454123',NULL,NULL,NULL,NULL,NULL,1,2,NULL,NULL,'Manager',NULL,63,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'L4','L4','Rukmini Chambers, Mahalaxmi Nagar,Vinayak Nagar',0,1,'2025-07-01 17:33:28'),(3,3,'000010781','Amith Krishnan C','amith.krishnan@dfmail.org','$2b$10$J21qRmrdZC2PX2Ec9OnlYexXRJjNGD4Fo92BjFfkjfxQMWOgU8jFe','91-7356468013',NULL,NULL,NULL,NULL,NULL,1,27,NULL,NULL,'Executive',NULL,16,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,'L1','L1','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:28'),(5,5,'CON00022','Anand Jayantilal Bariya','anand.bariya@dfmail.org','$2b$10$4Lw0B2P7Mmm9rmN8QDEnXur8cWIq6Q2c77bcd15cLNm/WQUh4Dphm','91-9886506025',NULL,NULL,NULL,NULL,NULL,1,4,NULL,NULL,'Chief Executive officer',NULL,5,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,'C7','C7.3','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:29'),(6,6,'000010808','Arunkumar Manthale','arunkumar.manthale@dfmail.org','$2b$10$ay4p1NwOG/sx/7jrfj5P7uYTo9.bED.MYcML0cCFH7.WBFvhSZbMW','91-8147232635',NULL,NULL,NULL,NULL,NULL,1,5,NULL,NULL,'Site Incharge',NULL,31,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,'L3','L3.1','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:29'),(7,7,'000010273','Ashok Hanamantappa','ashok.birannavar@dfmail.org','$2b$10$xWqxs91BBwonB8zM6VByGuCAjktMdByjPk7qQiqk8AWKfAx7F1adm','91-7259888818',NULL,NULL,NULL,NULL,NULL,1,6,NULL,NULL,'Driver',NULL,9,NULL,NULL,NULL,NULL,NULL,6,NULL,NULL,'L1','L1','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:29'),(8,8,'000010750','Bachewar Kamaji Ramrao','bachewar.kamaji@dfmail.org','$2b$10$xLOZs/zUOHr50RF.VKgm0uuNS61ax3vGqvzqqktdWEmk2/sFr3M0i','91-7769919772',NULL,NULL,NULL,NULL,NULL,1,7,NULL,NULL,'Associate',NULL,64,NULL,NULL,NULL,NULL,NULL,7,NULL,NULL,'L1','L1','Rukmini Chambers, Mahalaxmi Nagar,Vinayak Nagar',0,1,'2025-07-01 17:33:29'),(9,9,'000010035','Basavaraj S.B','basavaraj.baraker@dfmail.org','$2b$10$GRcyg9lwHNu7pszJvIxLOOerVEy5a4ucDMYmpyFEEq7tZY/3MHs.K','91-9900053759',NULL,NULL,NULL,NULL,NULL,1,6,NULL,NULL,'Assistant Manager',NULL,65,NULL,NULL,NULL,NULL,NULL,8,NULL,NULL,'L3','L3.1','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:29'),(10,10,'000010771','Bejjenki Alekhya','alekhya.bejjenki@dfmail.org','$2b$10$it0I3HP9MsSYv7tG8L5CuuXMubEtyH6/OoWqATn.q11F4UOu2TomC','91-9133891882',NULL,NULL,NULL,NULL,NULL,1,8,NULL,NULL,'Senior Executive',NULL,30,NULL,NULL,NULL,NULL,NULL,9,NULL,NULL,'L2','L2','Rukmini Chambers, Mahalaxmi Nagar,Vinayak Nagar',1,1,'2025-07-01 17:33:29'),(11,11,'DFINT2505','Chandrashekhar M Madivalar','chandrashekhar.madiwalar@dfmail.org','$2b$10$B7VYdl/ra6ki.4N55zBYnOOT2lRjss/Jd.jLEPh9wo9oExEfxZm7O','91-6363820359',NULL,NULL,NULL,NULL,NULL,1,5,NULL,NULL,'Intern',NULL,31,NULL,NULL,NULL,NULL,NULL,10,NULL,NULL,'L0','L0','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:29'),(12,12,'CON400021','Channabasava','channabasava.yankoba@dfmail.org','$2b$10$Rd3yvTe5srufeqOJOtw0Huy2ZalMRFly0JZAW9aCBdxAd4bDk3XaS','91-9986925320',NULL,NULL,NULL,NULL,NULL,4,5,NULL,NULL,'Field Facilitator',NULL,23,NULL,NULL,NULL,NULL,NULL,11,NULL,NULL,'L0','L0','Siruguppa',1,1,'2025-07-01 17:33:29'),(13,13,'000010744','Ciyedin Salim','ciyedin.salim@dfmail.org','$2b$10$cxSZwduD8lKKG/8bv78LWuDpLgQBjGFfeCvGyQ0fQCZfyvI2GRevu','91-9061886584',NULL,NULL,NULL,NULL,NULL,1,27,NULL,NULL,'Assistant Manager',NULL,16,NULL,NULL,NULL,NULL,NULL,12,NULL,NULL,'L3','L3.1','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:29'),(14,14,'CONT0146','Dasari Varaprasad','dasari.varaprasad@dfmail.org','$2b$10$BBVSi4MddYaXXgWNPWUTvu2lpNNogZOFWeYot88V.MB3ZArNY6hDm','91-7036902254',NULL,NULL,NULL,NULL,NULL,1,9,NULL,NULL,'Executive',NULL,22,NULL,NULL,NULL,NULL,NULL,13,NULL,NULL,'L1','L1','Rukmini Chambers, Mahalaxmi Nagar,Vinayak Nagar',1,1,'2025-07-01 17:33:29'),(15,15,'DFINT2504','Faiz Ali K Mulla','faiz.ali@dfmail.org','$2b$10$3GYH1M2C2st29gpj4Z0Cs.qP4bXSEdu5feACjoQEkIVfa8Rt0nqq.','91-9353203769',NULL,NULL,NULL,NULL,NULL,1,11,NULL,NULL,'Intern',NULL,45,NULL,NULL,NULL,NULL,NULL,15,NULL,NULL,'L0','L0','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:30'),(16,16,'000010725','Gautham V Shanbhogue','gautham.shanbhogue@dfmail.org','$2b$10$lkTP4bIKmcwvVtSKdcKKb.04L7nW7.WknB.HqQ9s4pOkWU0LrV1T.','91-9482044677',NULL,NULL,NULL,NULL,NULL,1,13,NULL,NULL,'Head - Strategy & Program Analysis',NULL,5,NULL,NULL,NULL,NULL,NULL,16,NULL,NULL,'L6','L6.1','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:30'),(17,17,'000010010','Hemavathi Malleshappa Purad','hemavathi@dfmail.org','$2b$10$2zmji8e1MRg/hArn4f9GSO1NpBZCerduBS.S9yxJbvWx624.68USu','91-9900053760',NULL,NULL,NULL,NULL,NULL,1,10,NULL,NULL,'Assistant Manager',NULL,47,NULL,NULL,NULL,NULL,NULL,17,NULL,NULL,'L3','L3.1','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:30'),(18,18,'CON00032','Jayathirtha Y S','jayathirtha.ys@dfmail.org','$2b$10$zRrQ0uOfhn04A7vajNcgZ.QHJ3b8e8q0vGZ5VDGIvwttyllbnN2Mq','91-9343566392',NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,'Director',NULL,5,NULL,NULL,NULL,NULL,NULL,18,NULL,NULL,'C6','C6.2','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:30'),(19,19,'CON100075','Kallappa  Patted','kallappa.patte@dfmail.org','$2b$10$CnhDPAGkPFKvLNyW5c1K3OpbVpYm8IgoKvtejEUdPfzbFY5tDA6zi','91-9731069120',NULL,NULL,NULL,NULL,NULL,4,5,NULL,NULL,'Field Facilitator',NULL,31,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,'L0','L0','Annigeri',1,1,'2025-07-01 17:33:30'),(20,20,'000010805','Kesha Udvitha','kesha.udvitha@dfmail.org','$2b$10$ykapu.4WaZXlyEQKc3/uhuPfjuRco8VogGQZcW6VD8Tdu6Rb5MD1O','91-9381190195',NULL,NULL,NULL,NULL,NULL,1,14,NULL,NULL,'Executive',NULL,66,NULL,NULL,NULL,NULL,NULL,20,NULL,NULL,'L1','L1','Rukmini Chambers, Mahalaxmi Nagar,Vinayak Nagar',0,1,'2025-07-01 17:33:30'),(21,21,'CON100122','Kiran Walikar','kiran.walikar@dfmail.org','$2b$10$o7wszvebtkIFWocok5wLwOkDU3xXwQ3KmrsjmJsISQ6X3kQo4MXam','91-7483163432',NULL,NULL,NULL,NULL,NULL,4,5,NULL,NULL,'Field Facilitator',NULL,41,NULL,NULL,NULL,NULL,NULL,21,NULL,NULL,'L0','L0','Bagalkote',1,1,'2025-07-01 17:33:30'),(22,22,'000010749','Kodali Sumasree','kodali.sumasree@dfmail.org','$2b$10$zALxLZmMHQF968ncoZUp4.9z4y2sGiPyiCzIQbe2i/gi74Kd798/.','91-9398498337',NULL,NULL,NULL,NULL,NULL,1,15,NULL,NULL,'Assistant Manager',NULL,67,NULL,NULL,NULL,NULL,NULL,22,NULL,NULL,'L3','L3.1','Rukmini Chambers, Mahalaxmi Nagar,Vinayak Nagar',0,1,'2025-07-01 17:33:30'),(23,23,'000010065','Kotresha Sandera','kotresh.sandera@dfmail.org','$2b$10$Gfayz0C/VudXMPTSbvAXjeAe9IJb/2RryNXj1Z/nbjfGFJ2j4xw3.','91-9482309065',NULL,NULL,NULL,NULL,NULL,1,5,NULL,NULL,'Senior Manager',NULL,31,NULL,NULL,NULL,NULL,NULL,23,NULL,NULL,'L5','L5','Sindhanur',1,1,'2025-07-01 17:33:30'),(24,24,'DFCON0021','Linganolla Srikanth','srikanth.linganolla@dfmail.org','$2b$10$G/ZeY6JuHBTiVtNHSqnOUuY4ByeYqRP5g.yC0cWFN12fVhFq4EDVm','91-9160088735',NULL,NULL,NULL,NULL,NULL,1,16,NULL,NULL,'Executive',NULL,22,NULL,NULL,NULL,NULL,NULL,24,NULL,NULL,'C1','C1','Rukmini Chambers, Mahalaxmi Nagar,Vinayak Nagar',1,1,'2025-07-01 17:33:30'),(25,25,'CON400019','Mallikarjun K','mallikarjun.kademane@dfmail.org','$2b$10$HXBdURk2prIaXVpVcuRH6.6eu0q8qDKKaVfXX.bLaqgGyf06SgnDC','91-9535463930',NULL,NULL,NULL,NULL,NULL,4,17,NULL,NULL,'Manager',NULL,5,NULL,NULL,NULL,NULL,NULL,25,NULL,NULL,'L4','L4','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:31'),(26,26,'000010740','Manjula Arasapur','manjula.arasapur@dfmail.org','$2b$10$24fAhEAA5dAW90iM65joRuRIjD1rpsso.Z0zTj784zXd7u7lP0As.','91-8747844150',NULL,NULL,NULL,NULL,NULL,1,18,NULL,NULL,'Manager',NULL,5,NULL,NULL,NULL,NULL,NULL,26,NULL,NULL,'L4','L4','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:31'),(27,27,'000010484','Manjunath P','manjunath.petkar@dfmail.org','$2b$10$PZzu84/o0na2yKGQxiWbYOT1rWumHUnmrUBcLmQ8oDLFCRuwj/rhS','91-7411135276',NULL,NULL,NULL,NULL,NULL,1,6,NULL,NULL,'Driver',NULL,9,NULL,NULL,NULL,NULL,NULL,27,NULL,NULL,'L1','L1','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:31'),(28,28,'000010483','Manjunath Yallappa Kaihuttanavar','manjunath.yallappa@dfmail.org','$2b$10$kjG31gR9NXWF9Hyiy0VGZuj0MzzGAJB/sdFWMCSNwFJn7O9FlygDa','91-9148044867',NULL,NULL,NULL,NULL,NULL,1,6,NULL,NULL,'Driver',NULL,9,NULL,NULL,NULL,NULL,NULL,28,NULL,NULL,'L1','L1','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:31'),(29,29,'000010699','Mohsin Taj','mohsin.taj@dfmail.org','$2b$10$mxL7kYMt7o3sbCq24/ADVuQIF9LrzvgVNxwdO.ItIxt.xAH/U7xzS','91-9986866687',NULL,NULL,NULL,NULL,NULL,1,6,NULL,NULL,'Executive',NULL,65,NULL,NULL,NULL,NULL,NULL,29,NULL,NULL,'L1','L1','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:31'),(30,30,'000010086','Muttanna Waleekar','muttanna.waleekar@dfmail.org','$2b$10$yY09ejxK0zc2.Oi4VfR6He06tOjrqbST1HYJZ9Y0mOQ5d1YPvzSnm','91-7353116583',NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,'Assistant Manager',NULL,34,NULL,NULL,NULL,NULL,NULL,30,NULL,NULL,'L3','L3.1','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:31'),(31,31,'000010807','Nanjundappa Jugali','nanjundappa.jugali@dfmail.org','$2b$10$Z7WJ9ARSmwikAH./iYu0R.fnsfORfhgPJZqgExfWLbG.v2FyrHtwy','91-9342150266',NULL,NULL,NULL,NULL,NULL,1,5,NULL,NULL,'Sites and Partnerships',NULL,5,NULL,NULL,NULL,NULL,NULL,31,NULL,NULL,'L6','L6.2','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:31'),(32,32,'000010075','Naveen Kumar M P M','naveen.mpm@dfmail.org','$2b$10$wKruIXT72wmKU0e9DqK6PurnVH8uvWo4zXu3Da49UMVtMnkQ4iREa','91-9742746502',NULL,NULL,NULL,NULL,NULL,1,20,NULL,NULL,'Senior Executive',NULL,68,NULL,NULL,NULL,NULL,NULL,32,NULL,NULL,'L2','L2','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:31'),(33,33,'000010806','Parmeshwar Kanhere','parmeshwar.kanhere@dfmail.org','$2b$10$Kx2VazHRNio4z8sADSzGRuloI89rSfOKFzF5uRPFNS7sruFp3sd.6','91-8408973695',NULL,NULL,NULL,NULL,NULL,1,21,NULL,NULL,'Executive',NULL,68,NULL,NULL,NULL,NULL,NULL,33,NULL,NULL,'L2','L2','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:31'),(34,34,'CON00034','Parthasarathy Sudarsanam','parthasarathy.sudarsanam@dfmail.org','$2b$10$U/WtErkQ3QM0aCx5IK8.xez93/U0n.rxREqhocfCjqvAADQMhpqAC','91-9845076901',NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,'Head Finance & Accounts',NULL,64,NULL,NULL,NULL,NULL,NULL,34,NULL,NULL,'C6','C6.2','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:31'),(35,35,'000010094','Pavan Mahendrakar','pavan.mahendrakar@dfmail.org','$2b$10$Ak69zIlEE3GpsbgPMkIXpOj0Zyk9OJ8Zo37ik7mVYCB2Ntv43oOHG','91-9980486880',NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,'Senior Executive',NULL,30,NULL,NULL,NULL,NULL,NULL,35,NULL,NULL,'L2','L2','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:32'),(36,36,'CON100220','Payal Ekbote','payal.ekbote@dfmail.org','$2b$10$RtVkqNF11HoWGDVjrFzDDehK0317.JmzJzvjqLpT1.6rZbXXInG02','91-9606143719',NULL,NULL,NULL,NULL,NULL,4,18,NULL,NULL,'Executive',NULL,26,NULL,NULL,NULL,NULL,NULL,36,NULL,NULL,'L1','L1','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:32'),(37,37,'000010624','Praveen Honnappa Ambiga','praveen.ambiga@dfmail.org','$2b$10$C98fmbPXc2UUjf778R69/OhIppDzyPH/Ce3L59v7BrbwIeuJ6icC6','91-9535680880',NULL,NULL,NULL,NULL,NULL,1,18,NULL,NULL,'Deputy  Manager',NULL,26,NULL,NULL,NULL,NULL,NULL,37,NULL,NULL,'L3','L3.2','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:32'),(38,38,'000010769','Rahul Vishnu Ghope','rahul.ghope@dfmail.org','$2b$10$2598TSuc3vUyUL9JL55k6un0Ue4N6fEWN25PqiPXzmcvnGuBcKdIq','91-8793042404',NULL,NULL,NULL,NULL,NULL,1,4,NULL,NULL,'Innovation Associate',NULL,31,NULL,NULL,NULL,NULL,NULL,38,NULL,NULL,'L2','L2','Sindhudurg',1,1,'2025-07-01 17:33:32'),(39,39,'CON100102','Ramajansab Allisab Nadaf','ramajanasab.nadaf@dfmail.org','$2b$10$y5Y5vQHITDyxgttWXr5Df.wwdrrdXHuOvkv0o0DOzQT3mHg0XzXAC','91-9743164393',NULL,NULL,NULL,NULL,NULL,4,5,NULL,NULL,'Field Facilitator',NULL,31,NULL,NULL,NULL,NULL,NULL,39,NULL,NULL,'L0','L0','Navalgund',1,1,'2025-07-01 17:33:32'),(40,40,'CONT0150','Rasoolabai Mohammed Waseem Ahammed','waseemahammed.rm@dfmail.org','$2b$10$dTHktvsgQ5hbt3xeG8XjfO1.RUhiMxfkkgEplgYau3C2TwHXUZZMy','91-8125295088',NULL,NULL,NULL,NULL,NULL,1,9,NULL,NULL,'Deputy Manager',NULL,63,NULL,NULL,NULL,NULL,NULL,40,NULL,NULL,'C3','C3','Rukmini Chambers, Mahalaxmi Nagar,Vinayak Nagar',1,1,'2025-07-01 17:33:32'),(41,41,'000010728','Ravi Ramudu','ravi.ramudu@dfmail.org','$2b$10$XcuUKYEAmnS15YVMD5.aQOSyLo3e90SbWX4YBue/Lu4W1JanHd6ly','91-9742178750',NULL,NULL,NULL,NULL,NULL,1,5,NULL,NULL,'Assistant Manager',NULL,31,NULL,NULL,NULL,NULL,NULL,41,NULL,NULL,'L3','L3.1','Bagalkote',1,1,'2025-07-01 17:33:32'),(42,42,'000010325','Ravichandrayya Kadlimath','ravichandrayya.kadlimath@dfmail.org','$2b$10$GrMK7ym6K/6UvJy8ezaEwuE6y4FLNrJp89ZnBvC3QKRiU1P39wLU6','91-9591075582',NULL,NULL,NULL,NULL,NULL,1,22,NULL,NULL,'Assistant Manager',NULL,44,NULL,NULL,NULL,NULL,NULL,42,NULL,NULL,'L3','L3.1','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:32'),(43,43,'000010013','Sagar Shanthaveer Hosur','sagar.h@dfmail.org','$2b$10$fsZ6sVoCjT5DwDJokZWAsO.aoI97j6.YUD2JIi0j0KtlDcSy9Zx4S','91-8904881522',NULL,NULL,NULL,NULL,NULL,1,9,NULL,NULL,'Assistant Manager',NULL,69,NULL,NULL,NULL,NULL,NULL,43,NULL,NULL,'L3','L3.1','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:32'),(44,44,'000010018','Sandeepkumar Naik','sandeepkumar@dfmail.org','$2b$10$ds6LqpMv3Uk78MLqkd.Mw.yC/8DpF/CWfwTn83C4uGVJyYPRKzRba','91-9740657513',NULL,NULL,NULL,NULL,NULL,1,22,NULL,NULL,'Deputy Director',NULL,5,NULL,NULL,NULL,NULL,NULL,44,NULL,NULL,'L6','L6.1','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:32'),(45,45,'000010453','Santhoshkumar S Badami','santoshkumar.badami@dfmail.org','$2b$10$3p9uRcrTIW/SpUWf9hGpd.EfpMLC8QLSMObCH1eWfySYshWmJlbMK','91-8050170402',NULL,NULL,NULL,NULL,NULL,1,11,NULL,NULL,'Deputy Manager',NULL,5,NULL,NULL,NULL,NULL,NULL,45,NULL,NULL,'L3','L3.2','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:33'),(46,46,'000010187','Santosh B Barker','santosh.baraker@dfmail.org','$2b$10$//kfCDOm8DLyk46Ia8dGyeNpSeFG/8ndn02BDofxscdFOc8LGJq6e','91-9538278943',NULL,NULL,NULL,NULL,NULL,1,9,NULL,NULL,'Driver',NULL,70,NULL,NULL,NULL,NULL,NULL,46,NULL,NULL,'L1','L1','Deshpande Skill Development Center,Airport Road,',1,1,'2025-07-01 17:33:33'),(47,47,'000010285','Savitha Kulkarni','savitha.kulkarni@dfmail.org','$2b$10$qBMvXrqmVp9KUF8VCfvc9elGdQqt0REGu7k0ZN8bQSq2rLONNPQ4u','91-9036064713',NULL,NULL,NULL,NULL,NULL,1,23,NULL,NULL,'Senior Manager',NULL,51,NULL,NULL,NULL,NULL,NULL,47,NULL,NULL,'L5','L5','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:33'),(48,48,'000010244','Seema Kudari','seema.kudari@dfmail.org','$2b$10$A0jfA2ixlu57Km49IY5LUeIb3nytJvpUjfqTBhGB/yFZkBaZgjE6O','91-9739729014',NULL,NULL,NULL,NULL,NULL,1,10,NULL,NULL,'Assistant Manager',NULL,51,NULL,NULL,NULL,NULL,NULL,48,NULL,NULL,'L3','L3.1','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:33'),(49,49,'000010014','Shivanand Somannavar','shivanand.s@dfmail.org','$2b$10$ef7NG3Qq.2MbDNmoyfKWR.C6vQ5Z.iQ3s06WDQZq9kc4GhDyDIV1K','91-9743759138',NULL,NULL,NULL,NULL,NULL,1,11,NULL,NULL,'Senior Manager',NULL,5,NULL,NULL,NULL,NULL,NULL,49,NULL,NULL,'L5','L5','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:33'),(50,50,'DFCON2502','Siddhesh Babu Palav','siddhesh.palav@dfmail.org','$2b$10$nJSjDpyOAYD6wFuTX9JIe.v9jMmInkt4M9SOYcUoiqsnJ72touShK','91-7558605130',NULL,NULL,NULL,NULL,NULL,1,5,NULL,NULL,'Associate',NULL,31,NULL,NULL,NULL,NULL,NULL,50,NULL,NULL,'L1','L1','Sindhudurg',1,1,'2025-07-01 17:33:33'),(51,51,'000010726','Sonali Sarma','sonali.sarma@dfmail.org','$2b$10$dL4DAgiZbu.8uEd2GJSJoejWmmwxGPvYoOdO3dsRlEEyxYZGORrRi','91-9004476309',NULL,NULL,NULL,NULL,NULL,1,23,NULL,NULL,'Head-HR',NULL,5,NULL,NULL,NULL,NULL,NULL,51,NULL,NULL,'L7','L7.1','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:33'),(52,52,'000010286','Srinivasa H','shrinivas.holagundi@dfmail.org','$2b$10$cMEOEgczDiEUvtg9lkkB..B5ZUO2gqNlxTGlW0DQji0NoaLn9qKbq','91-8722589919',NULL,NULL,NULL,NULL,NULL,1,5,NULL,NULL,'Deputy  Manager',NULL,31,NULL,NULL,NULL,NULL,NULL,52,NULL,NULL,'L3','L3.2','Sindhanur',1,1,'2025-07-01 17:33:33'),(53,53,'000010150','Sunita Abbai','sunita.abbai@dfmail.org','$2b$10$KggU/a7huO6EiH2HLl/6xe8FoZeNFT/JPLPJLvgjAZ9PG6cOCQntO','91-9902893476',NULL,NULL,NULL,NULL,NULL,1,6,NULL,NULL,'Senior Executive',NULL,69,NULL,NULL,NULL,NULL,NULL,53,NULL,NULL,'L2','L2','DCSE Building, B, V.B. Campus, Vidya Nagar,',0,2,'2025-07-01 17:33:33'),(54,54,'000010774','Suraj Shripad Patil','suraj.patil@dfmail.org','$2b$10$ZispAcnAyT2nCxMDR/Dhpuweirpaa8HbklEVzaP8c4T4ggyRF2df6','91-8660702126',NULL,NULL,NULL,NULL,NULL,1,27,NULL,NULL,'Executive',NULL,16,NULL,NULL,NULL,NULL,NULL,54,NULL,NULL,'L1','L1','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:33'),(55,55,'CON100208','Suresh Talawar','suresh.talwar@dfmail.org','$2b$10$ua3nUiHZJsb5iYkfp8DHuOPxSdU7IaAlSiVZh8mSKrRkrHqVqmvjK','91-7899696190',NULL,NULL,NULL,NULL,NULL,4,17,NULL,NULL,'Labour',NULL,58,NULL,NULL,NULL,NULL,NULL,55,NULL,NULL,'L0','L1','Hulgur',1,1,'2025-07-01 17:33:34'),(56,56,'000010600','Swapna Ankola','swapna.ankola@dfmail.org','$2b$10$/sqSrriTONxLdaQmit8nj.koDQQYIwKhFFXgCknRFCUq2cDJ7jYDm','91-9620333036',NULL,NULL,NULL,NULL,NULL,1,13,NULL,NULL,'Senior Manager',NULL,16,NULL,NULL,NULL,NULL,NULL,56,NULL,NULL,'L5','L5','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:34'),(57,57,'DFCON2503','Tejas Tukaram Sawant','tejas.sawant@dfmail.org','$2b$10$AEdJOW686HEwNxslIPSKHehH71j1p2NWwKrWKveX2CxNBLG4EERCS','91-7620882245',NULL,NULL,NULL,NULL,NULL,1,5,NULL,NULL,'Associate',NULL,31,NULL,NULL,NULL,NULL,NULL,57,NULL,NULL,'L1','L1','Sindhudurg',1,1,'2025-07-01 17:33:34'),(58,58,'CON100016','Vijay Kulkarni','vijaykeshavrao.kulkarni@dfmail.org','$2b$10$bMP24YQvS6VFakHLyKTud.4udv2b78WQV2zMMd06Ay9bD7FxGkDna','91-7996398693',NULL,NULL,NULL,NULL,NULL,4,17,NULL,NULL,'Field Facilitator',NULL,25,NULL,NULL,NULL,NULL,NULL,58,NULL,NULL,'L0','L0','Hulgur',1,1,'2025-07-01 17:33:34'),(59,59,'000010752','Vinaykumar Vardhaman Upadhye','vinaykumar.upadhye@dfmail.org','$2b$10$Cr2iUojEq7WlWiITb/iNhOilnc.OZiWIvs0206o4SagdyacB9Eo0q','91-8748895071',NULL,NULL,NULL,NULL,NULL,1,10,NULL,NULL,'Executive',NULL,47,NULL,NULL,NULL,NULL,NULL,59,NULL,NULL,'L1','L1','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:33:34'),(60,60,'CON100132','Vinod Gangadhar Meti','vinod.meti@dfmail.org','$2b$10$Vrlb1n3AMsv83j0.t8B8X.Ebw8J9yb0Yzt1k2ZVIEsPwQU4vyXhym','91-9741303553',NULL,NULL,NULL,NULL,NULL,4,5,NULL,NULL,'Field Facilitator',NULL,31,NULL,NULL,NULL,NULL,NULL,60,NULL,NULL,'L0','L0','Annigeri',1,1,'2025-07-01 17:33:34'),(61,61,'CON100006','Virappa Bhimappa Bijapur','virappa.bijapur@dfmail.org','$2b$10$19ewvD4YWtkqF4GT47rkI.Uiq7kYXh9Vj2v6rlRRCpLYQZtqQbJTm','91-9535220110',NULL,NULL,NULL,NULL,NULL,4,5,NULL,NULL,'Field Facilitator',NULL,31,NULL,NULL,NULL,NULL,NULL,61,NULL,NULL,'L0','L0','Navalgund',1,1,'2025-07-01 17:33:34'),(62,62,'CON100042','Vitthal Shankar Metri','vitthal.metri@dfmail.org','$2b$10$qAkVIHHpRW7rdOjA.4y/OePlfGE5gnSMx7LPpwP7Z9Rfz1d7xSMjS','91-9620566146',NULL,NULL,NULL,NULL,NULL,4,5,NULL,NULL,'Field Facilitator',NULL,41,NULL,NULL,NULL,NULL,NULL,62,NULL,NULL,'L0','L0','Bijapur',1,1,'2025-07-01 17:33:34'),(63,63,'000010655','Manish Kumar Jaiswal','manish.jaiswal@dfmail.org','$2b$10$3/wTduRwgxILlov/MNOOx.DjIm5jm6/NlgRE1CyqYZamVJ7CqpSd2','91-9043385719',NULL,NULL,NULL,NULL,NULL,3,25,NULL,NULL,'Chief executive officer',NULL,63,NULL,NULL,NULL,NULL,NULL,63,NULL,NULL,'L7','L7.3','Foundation for Sandboxstartup Initiatives, Gokul Road,',1,1,'2025-07-01 17:54:10'),(64,64,'000010485','Narasimha Nayak Perampalli','pnnayak@dfmail.org','$2b$10$pKDVuQXRdSfJ.psTuE7To.QdBPPLn6Yj0PCQ.7w5ukT1raTQCQPhi','91-9849656663',NULL,NULL,NULL,NULL,NULL,2,24,NULL,NULL,'Chief executive officer',NULL,64,NULL,NULL,NULL,NULL,NULL,64,NULL,NULL,'L7','L7.3','Deshpande Skill Development Center,Airport Road,',1,1,'2025-07-01 17:54:11'),(65,65,'000010348','Vijay Purohit','vijay.purohit@dfmail.org','$2b$10$EjltAqVknW54y6L7VU9vQe6Im9mfVK1aR57FRJdBaF8SZ50REwmA6','91-9591217091',NULL,NULL,NULL,NULL,NULL,3,9,NULL,NULL,'Senior Director',NULL,5,NULL,NULL,NULL,NULL,NULL,65,NULL,NULL,'L6','L6.3','DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-01 17:54:11'),(66,66,'000010199','Ananda Kammara','anand.kammara@dfmail.org','$2b$10$BMZsYYB9nBAiESxY7DMrVOAHT6peYJ8FosK2V8a6GTr.ZHskDR8AW','91-9538935778',NULL,NULL,NULL,NULL,NULL,2,23,NULL,NULL,'Deputy Manager',NULL,51,NULL,NULL,NULL,NULL,NULL,66,NULL,NULL,'L3','L3.2','Deshpande Skill Development Center,Airport Road,',1,1,'2025-07-01 17:54:11'),(67,67,'000010733','Sahiti Meduri','sahiti.meduri@dfmail.org','$2b$10$nw1je1I8ZGNurs/bG5Gs9ekqQuAq6Jr/xfR/kC1YAQiCjkYuTDoq.','91-9398184137',NULL,NULL,NULL,NULL,NULL,3,26,NULL,NULL,'Head - kakatiya Sandbox',NULL,63,NULL,NULL,NULL,NULL,NULL,67,NULL,NULL,'L4','L4','Rukmini Chambers, Mahalaxmi Nagar,Vinayak Nagar',1,1,'2025-07-01 17:54:11'),(68,68,'000010275','Shankarsingh Kalaghatagi','shankarsingh.kalaghatagi@dfmail.org','$2b$10$u.GD.Q4oydJL1QIEd1Ob2uQCbmEbeXJy7m.UimzRsPFzwQpMpDrbC','91-9448707761',NULL,NULL,NULL,NULL,NULL,2,20,NULL,NULL,'Assistant Manager',NULL,65,NULL,NULL,NULL,NULL,NULL,68,NULL,NULL,'L3','L3.1','Deshpande Skill Development Center,Airport Road,',1,1,'2025-07-01 17:54:11'),(69,69,'000010251','Sunil Chitragar','sunil.c@dfmail.org','$2b$10$qI7S1vQVt7CeWzyFC9Ae4uKsWfGAGRs2I8I2mDL7/KEWvAnY8Na7.','91-9845283722',NULL,NULL,NULL,NULL,NULL,2,9,NULL,NULL,'Deputy Manager',NULL,65,NULL,NULL,NULL,NULL,NULL,69,NULL,NULL,'L3','L3.2','Deshpande Skill Development Center,Airport Road,',1,1,'2025-07-01 17:54:11'),(70,70,'000010027','Ramesh Channappa Hubballi','ramesh.hubballi@dfmail.org','$2b$10$OnOHSNmjEe/9L6oHOEnOU.4.9hEDzASC.5UliwJLJZN6StNcFwxEO','91-7676442646',NULL,NULL,NULL,NULL,NULL,3,9,NULL,NULL,'Senior Executive',NULL,NULL,NULL,NULL,NULL,NULL,NULL,70,NULL,NULL,'L2','L2','Deshpande Skill Development Center,Airport Road,',1,1,'2025-07-01 17:54:11'),(71,NULL,NULL,'DF Finance','dfpayments@dfmail.org','$2b$10$gEXEQoD6VMumH3tIFR1E3ucY7cguzjFzQNWoTVb329rwPUCRg0jNq',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,'Finance Approver',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,',1,1,'2025-07-02 11:06:31'),(72,71,'000010784','Amlanjyoti Laha','amlanjyoti.laha@dfmail.org','$2b$10$s.pyPuGgQKwLKvH1LvZDFeiDun8orVxp83jMRsJXlGaikxh3u7lky','91-9830624865',NULL,NULL,NULL,NULL,NULL,1,27,NULL,NULL,'Data Analyst',NULL,16,NULL,NULL,NULL,NULL,NULL,71,NULL,NULL,'L3','L3.1','DCSE Building, B, V.B. Campus, Vidya Nagar,',3,1,'2025-07-02 13:40:40'),(73,NULL,NULL,'DET Finance','detpayments@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,'Finance Approver',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9338+8JV, Hosur - Unkal Bypass Rd, Chetana Colony, Vidya Nagar, Hubballi, Karnataka 580021',0,1,'2025-07-31 14:42:27'),(74,NULL,NULL,'DS Finance','sandboxaccounts@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,'Finance Approver',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Foundation for Sandboxstartup Initiatives, Gokul Rd, next to International Airport, opposite Gokul, Gokul, Hubballi, Karnataka 580030',0,1,'2025-07-31 14:42:27');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles` (
  `vehicle_id` int NOT NULL AUTO_INCREMENT,
  `vehicle_type` varchar(30) DEFAULT NULL,
  `per_km_amount` int DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`vehicle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (1,'Car',NULL,'Four Wheeler'),(2,'Bike',NULL,'2 Wheeler'),(3,'Bus',NULL,'Bus'),(4,'Train',NULL,'Train'),(5,'Flight',NULL,'Flight'),(6,'Auto/Taxi',NULL,'Auto / Taxi');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_bank`
--

DROP TABLE IF EXISTS `vendor_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_bank` (
  `vendor_bank_id` int NOT NULL AUTO_INCREMENT,
  `vendor_id` int DEFAULT NULL,
  `name_on_bank` varchar(100) DEFAULT NULL,
  `bank_name` varchar(30) DEFAULT NULL,
  `bank_branch` varchar(20) DEFAULT NULL,
  `account_number` varchar(20) DEFAULT NULL,
  `IFSC` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`vendor_bank_id`),
  KEY `vendor_id` (`vendor_id`),
  CONSTRAINT `vendor_bank_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_bank`
--

LOCK TABLES `vendor_bank` WRITE;
/*!40000 ALTER TABLE `vendor_bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors` (
  `vendor_id` int NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(30) DEFAULT NULL,
  `phone` int DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `address` text,
  `GST` varchar(50) DEFAULT NULL,
  `vendor_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'df_ticketing'
--

--
-- Dumping routines for database 'df_ticketing'
--
/*!50003 DROP PROCEDURE IF EXISTS `USP_API_GET_REPORT_DETAILS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Ticketing`@`%` PROCEDURE `USP_API_GET_REPORT_DETAILS`(
    IN p_report_id INT
)
BEGIN
    DECLARE v_status_id INT;

    -- Fetch status_id for the report
    SELECT status_id INTO v_status_id
    FROM reports
    WHERE report_id = p_report_id;

    -- Result 1: Report Details
    IF v_status_id = 1 THEN
        SELECT 
            r.report_id, r.user_id, r.year_id, r.org_id, o.org_name, 
            r.entity_id, e.entity_name, r.report_code, r.manager_id, 
            m.user_name AS manager_name, m.work_email AS manager_email, 
            m.mobile AS manager_phone, m.gender AS manager_gender, 
            r.name, r.status_id, ms1.status AS report_status, 
            r.process_status_id, ms2.status AS process_status, 
            DATE_FORMAT(r.created_at, '%d-%m-%Y') AS created_at, 
            DATE_FORMAT(r.start_date, '%d-%m-%Y') AS start_date, 
            DATE_FORMAT(r.end_date, '%d-%m-%Y') AS end_date, 
            r.description, 
            DATE_FORMAT(r.updated_at, '%d-%m-%Y') AS updated_at
        FROM reports r
        LEFT JOIN master_status ms1 ON r.status_id = ms1.status_id
        LEFT JOIN master_status ms2 ON r.process_status_id = ms2.status_id
        LEFT JOIN organization o ON r.org_id = o.org_id
        LEFT JOIN entities e ON r.entity_id = e.entity_id
        LEFT JOIN users m ON r.manager_id = m.user_id
        WHERE r.report_id = p_report_id;
    ELSE
        SELECT 
            NULL AS report_id, NULL AS user_id, NULL AS year_id, NULL AS org_id, NULL AS org_name, 
            NULL AS entity_id, NULL AS entity_name, NULL AS report_code, NULL AS manager_id, 
            NULL AS manager_name, NULL AS manager_email, NULL AS manager_phone, NULL AS manager_gender, 
            NULL AS name, NULL AS status_id, NULL AS report_status, 
            NULL AS process_status_id, NULL AS process_status, 
            NULL AS created_at, NULL AS start_date, NULL AS end_date, 
            NULL AS description, NULL AS updated_at;
    END IF;

    -- Result 2: Report Logs
    IF v_status_id = 1 THEN
        SELECT 
            rl.log_id, rl.report_id, 
            rl.pre_status_id, ms1.status AS pre_status, 
            rl.aft_status_id, ms2.status AS aft_status, 
            rl.pre_process_id, ms3.status AS pre_process, 
            rl.aft_process_id, ms4.status AS aft_process, 
            rl.level_id, l.level_name, 
            rl.created_by, u.user_name AS creater_name, 
            DATE_FORMAT(rl.created_at, '%d-%m-%Y') AS created_at
        FROM report_logs rl
        LEFT JOIN master_status ms1 ON rl.pre_status_id = ms1.status_id
        LEFT JOIN master_status ms2 ON rl.aft_status_id = ms2.status_id
        LEFT JOIN master_status ms3 ON rl.pre_process_id = ms3.status_id
        LEFT JOIN master_status ms4 ON rl.aft_process_id = ms4.status_id
        LEFT JOIN levels l ON rl.level_id = l.level_id
        LEFT JOIN users u ON rl.created_by = u.user_id
        WHERE rl.report_id = p_report_id;
    ELSE
        SELECT 
            NULL AS log_id, NULL AS report_id, 
            NULL AS pre_status_id, NULL AS pre_status, 
            NULL AS aft_status_id, NULL AS aft_status, 
            NULL AS pre_process_id, NULL AS pre_process, 
            NULL AS aft_process_id, NULL AS aft_process, 
            NULL AS level_id, NULL AS level_name, 
            NULL AS created_by, NULL AS creater_name, NULL AS created_at;
    END IF;

    -- Result 3: Report History
    IF v_status_id = 1 THEN
        SELECT 
            rh.history_id, rh.report_id, rh.name, 
            DATE_FORMAT(rh.start_date, '%d-%m-%Y') AS start_date, 
            DATE_FORMAT(rh.end_date, '%d-%m-%Y') AS end_date, 
            rh.description, 
            rh.updated_by, u.user_name AS updater_name, 
            DATE_FORMAT(rh.updated_at, '%d-%m-%Y') AS updated_at, 
            rh.edit_description
        FROM report_history rh
        LEFT JOIN users u ON rh.updated_by = u.user_id
        WHERE rh.report_id = p_report_id;
    ELSE
        SELECT 
            NULL AS history_id, NULL AS report_id, NULL AS name, 
            NULL AS start_date, NULL AS end_date, 
            NULL AS description, 
            NULL AS updated_by, NULL AS updater_name, 
            NULL AS updated_at, NULL AS edit_description;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_API_GET_TICKET_DETAILS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Ticketing`@`%` PROCEDURE `USP_API_GET_TICKET_DETAILS`(
    IN p_ticket_id INT
)
BEGIN
    DECLARE v_exp_catg_id INT;

    -- Fetch exp_catg_id from tickets table
SELECT 
    exp_catg_id
INTO v_exp_catg_id FROM
    tickets
WHERE
    ticket_id = p_ticket_id and status_id =1;

		-- If exp_catg_id is NULL or not 1, return NULL results and exit
		IF v_exp_catg_id IS NULL OR v_exp_catg_id != 1 THEN
			-- Result 1: Empty Ticket Details
			SELECT 
				NULL AS ticket_id, 
				NULL AS report_id, 
				NULL AS report_code,
				NULL AS year_id,
				NULL AS user_id, 
				NULL AS ticket_number, 
                NULL AS entity_id,
                NULL AS entity_name,
				NULL AS cost_center_id, 
				NULL AS cost_center_name,
				NULL AS expense_id,
				NULL AS expense_name,
				NULL AS budget_id,
				NULL AS budget_name,
				NULL AS contribution_id,
				NULL AS contribution_name,
				NULL AS exp_catg_id, 
				NULL AS expanse_category, 
				NULL AS granted_amount, 
				NULL AS status_id, 
				NULL AS ticket_status,
				NULL AS process_status_id,
				NULL AS process_status,
                NULL AS ticket_description,
				NULL AS manager_id,
				NULL AS manager_name,
				NULL AS t_created_at, 
				NULL AS t_updated_by , 
				NULL AS t_updater_name, 
				NULL AS t_updated_at;

			-- Result 2: Empty Reimbursement Details and Empty Ticket Bills Details
			SELECT 
				NULL AS reimb_dtls_id,
				NULL AS category_id,
				NULL AS ledger_id,
				NULL AS ledger_code,
				NULL AS ledger_name,
				NULL AS total_expense,
				NULL AS m_granted_amount,
				NULL AS f_granted_amount, 
				NULL AS f_granted_by,
				NULL AS f_granter_name, 
				NULL AS exp_pay_date, 
				NULL AS reimbursed, 
				NULL AS rtd_status_id,
				NULL AS rtd_status, 
				NULL AS created_at, 
				NULL AS description ,
				NULL AS td_updated_by,
				NULL AS td_updated_at,
				NULL AS food_id,
				NULL AS food_date,
				NULL AS travel_id,
				NULL AS vehicle_id,
                NULL AS vehicle_type,
				NULL AS `from`,
				NULL AS `to`,
				NULL AS start_odo,
				NULL AS end_odo,
				NULL AS start_odo_path,
				NULL AS end_odo_path,
				NULL AS distance,
				NULL AS travel_date,
				NULL AS accommodation_id,
				NULL AS hotel_name,
				NULL AS address,
				NULL AS check_in_date,
				NULL AS check_out_date,
				NULL AS stay_days,
				NULL AS reimb_other_id,
				NULL AS other_date,
				NULL AS other_remarks,
				NULL AS bill_id,
				NULL AS ticket_id,
				NULL AS exp_catg_id,
				NULL AS expanse_category,
				NULL AS bill_path,
				NULL AS bill_number,
				NULL AS bill_amount,
				NULL AS bill_date,
				NULL AS status_id,
				NULL AS bill_status,
				NULL AS bl_created_at,
				NULL AS bl_created_by,
				NULL AS bl_creater_name,
				NULL AS bl_updated_at,
				NULL AS bl_updated_by,
				NULL AS bl_updater_name;

			-- Result 3: Empty Ticket Logs
			SELECT 
				NULL AS log_id,
				NULL AS ticket_id,
				NULL AS pre_status_id,
				NULL AS pre_status,
				NULL AS aft_status_id,
				NULL AS aft_status,
				NULL AS pre_process_id,
				NULL AS pre_process,
				NULL AS aft_process_id,
				NULL AS aft_process,
				NULL AS level_id,
				NULL AS action_id,
				NULL AS action,
				NULL AS level_name,
				NULL AS created_by,
				NULL AS creater_name,
				NULL AS created_at,
				NULL AS remarks;
				   
		   -- Result 4: Fetch Payment Details
			SELECT 
				NULL AS payment_id,
				NULL AS ticket_id,
				NULL AS transaction_id,
				NULL AS route_id,
				NULL AS route_from,
				NULL AS route_to,
				NULL AS pay_type_id,
				NULL AS paid_from,
				NULL AS paid_from_name,
				NULL AS paid_to,
				NULL AS paid_to_name,
				NULL AS paid_from_bank,
				NULL AS paid_from_bank_name,
				NULL AS paid_from_account_number,
				NULL AS paid_from_name_on_bank,
				NULL AS paid_from_IFSC,
				NULL AS paid_to_bank,
				NULL AS paid_to_bank_name,
				NULL AS paid_to_account_number,
				NULL AS paid_to_name_on_bank,
				NULL AS paid_to_IFSC,
				NULL AS amount,
				NULL AS UTR_number,
				NULL AS status_id,
				NULL AS payment_status,
				NULL AS payment_mode_id,
				NULL AS payment_mode,
				NULL AS payment_date,
				NULL AS created_by,
				NULL AS creator_name,
				NULL AS created_at,
				NULL AS level_id,
				NULL AS level_name,
				NULL AS description;
                
/*
			-- Result 5: Empty Ticket History
			SELECT 
				NULL AS ticket_hst_id,
				NULL AS ticket_id,
				NULL AS cost_center_id,
				NULL AS cost_center_name,
				NULL AS expense_id,
				NULL AS expense_name,
				NULL AS budget_id,
				NULL AS budget_name,
				NULL AS contribution_id,
				NULL AS contribution_name,
                NULL AS description,
				NULL AS updated_by,
				NULL AS updater_name,
				NULL AS updated_at,
				NULL AS edit_description;

			-- Result 6: Empty Reimbursement History
			SELECT 
				NULL AS reimb_hst_id,
				NULL AS reimb_dtls_id,
				NULL AS ticket_id,
				NULL AS category_id,
				NULL AS category_type,
				NULL AS ledger_id,
				NULL AS ledger_code,
				NULL AS ledger_name,
				NULL AS total_expense,
				NULL AS m_granted_amount,
				NULL AS f_granted_amount,
				NULL AS reimbursed,
				NULL AS hotel_name,
				NULL AS address,
				NULL AS check_in_date,
				NULL AS check_out_date,
				NULL AS stay_days,
				NULL AS vehicle_id,
				NULL AS vehicle_type,
				NULL AS start_odo,
				NULL AS end_odo,
				NULL AS start_odo_path,
				NULL AS end_odo_path,
				NULL AS distance,
				NULL AS `from`,
				NULL AS `to`,
				NULL AS rth_status_id,
				NULL AS rth_status,
				NULL AS updated_by,
				NULL AS updater_name,
				NULL AS updated_at,
				NULL AS description,
				NULL AS edit_description;
*/		

		-- Exit procedure naturally after NULL results
		ELSE
		-- Normal execution for valid tickets

			-- Result 1: Fetch Ticket Details
			SELECT 
				t.ticket_id,
				t.report_id,
				r.report_code,
				t.year_id,
				t.user_id,
				t.ticket_number,
                t.entity_id,
                e.entity_name,
				t.cost_center_id,
				cc.cost_center_name,
				t.expense_id,
				ex.expense_name,
				t.budget_id,
				bt.budget_name,
				t.contribution_id,
				ct.contribution_name,
				t.exp_catg_id,
				ec.category AS expanse_category,
                t.granted_amount,
				t.status_id,
				ms1.status AS ticket_status,
				t.process_status_id,
				ms2.status AS process_status,
                t.description AS ticket_description,
				r.manager_id AS manager_id,
                u.user_name AS manager_name,
				DATE_FORMAT(t.created_at, '%d-%m-%Y') AS t_created_at,
				t.updated_by AS t_updated_by,
				u1.user_name AS t_updater_name,
				DATE_FORMAT(t.updated_at, '%d-%m-%Y') AS t_updated_at
			FROM
				tickets t
                	LEFT JOIN
				reports r ON t.report_id = r.report_id
                	LEFT JOIN
				users u ON r.manager_id= u.user_id	
					LEFT JOIN
				master_status ms1 ON t.status_id = ms1.status_id
					LEFT JOIN
				master_status ms2 ON t.process_status_id = ms2.status_id
					LEFT JOIN
				cost_center cc ON t.cost_center_id = cc.cost_center_id
					LEFT JOIN
				entities e ON t.entity_id = e.entity_id
					LEFT JOIN
				expense_category ec ON t.exp_catg_id = ec.expense_category_id
					LEFT JOIN
				expense ex ON t.expense_id = ex.expense_id
					LEFT JOIN
				budget_type bt ON t.budget_id = bt.budget_id
					LEFT JOIN
				contribution_type ct ON t.contribution_id = ct.contribution_id
					LEFT JOIN
				users u1 ON t.updated_by = u1.user_id
			WHERE
				t.ticket_id = p_ticket_id AND r.status_id = 1;

			-- Result 2: Fetch Reimbursement Details and Ticket Bills
			SELECT 
				rtd.reimb_dtls_id,
				rtd.category_id,
				cat.category_type,
				rtd.ledger_id,
				ld.ledger_code,
				ld.ledger_name,
				rtd.total_expense,
				rtd.m_granted_amount,
				rtd.f_granted_amount,
				rtd.f_granted_by,
				u3.user_name AS f_granter_name,
				DATE_FORMAT(rtd.exp_pay_date, '%d-%m-%Y') AS exp_pay_date,
				rtd.reimbursed,
				rtd.status_id AS rtd_status_id,
				ms3.status AS rtd_status,
				DATE_FORMAT(rtd.created_at, '%d-%m-%Y') AS created_at,
				rtd.description,
				DATE_FORMAT(rtd.updated_at, '%d-%m-%Y') AS td_updated_at,
				rtd.updated_by AS td_updated_by,
				u2.user_name AS td_updater_name,
				f.food_id,
				DATE_FORMAT(f.date, '%d-%m-%Y') AS food_date,
				tr.travel_id,
				tr.vehicle_id,
				v.vehicle_type,
                tr.`from`,
                tr.`to`,
				tr.start_odo,
				tr.end_odo,
				tr.start_odo_path,
				tr.end_odo_path,
				tr.distance,
				DATE_FORMAT(tr.travel_date, '%d-%m-%Y') AS travel_date,
				acc.accommodation_id,
				acc.hotel_name,
				acc.address,
				DATE_FORMAT(acc.check_in_date, '%d-%m-%Y') AS check_in_date,
				DATE_FORMAT(acc.check_out_date, '%d-%m-%Y') AS check_out_date,
				acc.stay_days,
				ro.reimb_other_id,
				DATE_FORMAT(ro.date, '%d-%m-%Y') AS other_date,
				ro.remarks AS other_remarks,
				bl.bill_id,
				bl.ticket_id,
				bl.exp_catg_id,
				ec.category AS expanse_category,
				bl.bill_path,
				bl.bill_number,
				bl.bill_amount,
				DATE_FORMAT(bl.bill_date, '%d-%m-%Y') AS bill_date,
				bl.status_id,
				ms1.status AS bill_status,
				DATE_FORMAT(bl.created_at, '%d-%m-%Y') AS bl_created_at,
				bl.created_by AS bl_created_by,
				u1.user_name AS bl_creater_name,
				DATE_FORMAT(bl.updated_at, '%d-%m-%Y') AS bl_updated_at,
				bl.updated_by AS bl_updated_by,
				u.user_name AS bl_updater_name
			FROM
				re_ticket_details rtd
					LEFT JOIN
				food f ON rtd.reimb_dtls_id = f.reimb_dtls_id
					AND rtd.category_id = 1
					LEFT JOIN
				travels tr ON rtd.reimb_dtls_id = tr.reimb_dtls_id
					AND rtd.category_id = 2
					LEFT JOIN
				vehicles v ON tr.vehicle_id = v.vehicle_id
					LEFT JOIN
				accommodation acc ON rtd.reimb_dtls_id = acc.reimb_dtls_id
					AND rtd.category_id = 3
					LEFT JOIN
				reimb_others ro ON rtd.reimb_dtls_id = ro.reimb_dtls_id
					AND rtd.category_id = 4
					LEFT JOIN
				bills bl ON rtd.reimb_dtls_id = bl.ticket_dtls_id
					AND bl.status_id = 1
					LEFT JOIN
				master_status ms1 ON bl.status_id = ms1.status_id
					LEFT JOIN 
				expense_category ec ON bl.exp_catg_id = ec.expense_category_id
					LEFT JOIN
				users u ON bl.updated_by = u.user_id
					LEFT JOIN
				users u1 ON bl.created_by = u1.user_id
					LEFT JOIN
				users u2 ON rtd.updated_by = u2.user_id
					LEFT JOIN
				users u3 ON rtd.f_granted_by = u2.user_id
					LEFT JOIN
				categories cat ON rtd.category_id = cat.category_id
					LEFT JOIN
				ledgers ld ON rtd.ledger_id = ld.ledger_id
					LEFT JOIN
				master_status ms3 ON rtd.status_id = ms3.status_id
			WHERE
				rtd.ticket_id = p_ticket_id AND rtd.status_id =1;


			-- Result 3: Fetch Ticket Logs
			SELECT 
				tl.log_id,
				tl.ticket_id,
				tl.pre_status_id,
				ms1.status AS pre_status,
				tl.aft_status_id,
				ms2.status AS aft_status,
				tl.pre_process_id,
				ms3.status AS pre_process,
				tl.aft_process_id,
				ms4.status AS aft_process,
				tl.level_id,
				lvl.level_name,
				tl.action_id,
				ms5.status AS action,
				tl.created_by,
				u.user_name AS creater_name,
				DATE_FORMAT(tl.created_at, '%d-%m-%Y') AS created_at,
				tl.remarks
			FROM
				ticket_logs tl
					LEFT JOIN
				master_status ms1 ON tl.pre_status_id = ms1.status_id
					LEFT JOIN
				master_status ms2 ON tl.aft_status_id = ms2.status_id
					LEFT JOIN
				master_status ms3 ON tl.pre_process_id = ms3.status_id
					LEFT JOIN
				master_status ms4 ON tl.aft_process_id = ms4.status_id
					LEFT JOIN
				master_status ms5 ON tl.action_id = ms5.status_id
					LEFT JOIN
				levels lvl ON tl.level_id = lvl.level_id
					LEFT JOIN
				users u ON tl.created_by = u.user_id
			WHERE
				tl.ticket_id = p_ticket_id
			ORDER BY tl.created_at ASC;

			-- Result 4: Fetch Payment Details
			SELECT 
				p.payment_id,
				p.ticket_id,
				p.transaction_id,
				p.route_id,
				pr.route_from,
				pr.route_to,
				p.pay_type_id,
				p.paid_from,
				CASE
					WHEN p.route_id = 1 THEN e1.entity_name
					WHEN p.route_id = 2 THEN u1.user_name
					WHEN p.route_id = 3 THEN e1.entity_name
					WHEN p.route_id = 4 THEN v1.vendor_name
				END AS paid_from_name,
				p.paid_to,
				CASE
					WHEN p.route_id = 1 THEN u2.user_name
					WHEN p.route_id = 2 THEN e2.entity_name
					WHEN p.route_id = 3 THEN v2.vendor_name
					WHEN p.route_id = 4 THEN e2.entity_name
				END AS paid_to_name,
				p.paid_from_bank,
				CASE
					WHEN p.route_id IN (1 , 3) THEN ob_from.entity_bank_name
					WHEN p.route_id = 2 THEN ub_from.bank_name
					WHEN p.route_id = 4 THEN vb_from.bank_name
					ELSE NULL
				END AS paid_from_bank_name,
				CASE
					WHEN p.route_id IN (1 , 3) THEN ob_from.entity_bank_account_no
					WHEN p.route_id = 2 THEN ub_from.account_number
					WHEN p.route_id = 4 THEN vb_from.account_number
					ELSE NULL
				END AS paid_from_account_number,
				CASE
					WHEN p.route_id IN (1 , 3) THEN ob_from.entity_name_on_bank
					WHEN p.route_id = 2 THEN ub_from.name_on_bank
					WHEN p.route_id = 4 THEN vb_from.name_on_bank
					ELSE NULL
				END AS paid_from_name_on_bank,
				CASE
					WHEN p.route_id IN (1 , 3) THEN ob_from.entity_bank_IFSC
					WHEN p.route_id = 2 THEN ub_from.IFSC
					WHEN p.route_id = 4 THEN vb_from.IFSC
					ELSE NULL
				END AS paid_from_IFSC,
				p.paid_to_bank,
				CASE
					WHEN p.route_id = 1 THEN ub_to.bank_name
					WHEN p.route_id IN (2 , 4) THEN ob_to.entity_bank_name
					WHEN p.route_id = 3 THEN vb_to.bank_name
					ELSE NULL
				END AS paid_to_bank_name,
				CASE
					WHEN p.route_id = 1 THEN ub_to.account_number
					WHEN p.route_id IN (2 , 4) THEN ob_to.entity_bank_account_no
					WHEN p.route_id = 3 THEN vb_to.account_number
					ELSE NULL
				END AS paid_to_account_number,
				CASE
					WHEN p.route_id = 1 THEN ub_to.name_on_bank
					WHEN p.route_id IN (2 , 4) THEN ob_to.entity_name_on_bank
					WHEN p.route_id = 3 THEN vb_to.name_on_bank
					ELSE NULL
				END AS paid_to_name_on_bank,
				CASE
					WHEN p.route_id = 1 THEN ub_to.IFSC
					WHEN p.route_id IN (2 , 4) THEN ob_to.entity_bank_IFSC
					WHEN p.route_id = 3 THEN vb_to.IFSC
					ELSE NULL
				END AS paid_to_IFSC,
				p.amount,
				p.UTR_number,
				p.status_id,
				ms.status AS payment_status,
				p.payment_mode_id,
				pm.mode_name AS payment_mode,
				DATE_FORMAT(p.payment_date, '%d-%m-%Y') AS payment_date,
				p.created_by,
				u3.user_name AS creator_name,
				DATE_FORMAT(p.created_at, '%d-%m-%Y') AS created_at,
				p.level_id,
				l.level_name,
				p.description
			FROM
				payments p
					LEFT JOIN
				payment_route pr ON p.route_id = pr.route_id
					LEFT JOIN
				payment_type pt ON p.pay_type_id = pt.pay_type_id
					LEFT JOIN
				entities e1 ON p.paid_from = e1.entity_id
					AND p.route_id IN (1 , 3)
					LEFT JOIN
				users u1 ON p.paid_from = u1.user_id
					AND p.route_id = 2
					LEFT JOIN
				vendors v1 ON p.paid_from = v1.vendor_id
					AND p.route_id = 4
					LEFT JOIN
				users u2 ON p.paid_to = u2.user_id
					AND p.route_id = 1
					LEFT JOIN
				entities e2 ON p.paid_to = e2.entity_id
					AND p.route_id IN (2 , 4)
					LEFT JOIN
				vendors v2 ON p.paid_to = v2.vendor_id
					AND p.route_id = 3
					LEFT JOIN
				organization_bank ob_from ON p.paid_from_bank = ob_from.org_bank_id
					AND p.route_id IN (1 , 3)
					LEFT JOIN
				user_bank ub_from ON p.paid_from_bank = ub_from.bank_id
					AND p.route_id = 2
					LEFT JOIN
				vendor_bank vb_from ON p.paid_from_bank = vb_from.vendor_bank_id
					AND p.route_id = 4
					LEFT JOIN
				user_bank ub_to ON p.paid_to_bank = ub_to.bank_id
					AND p.route_id = 1
					LEFT JOIN
				organization_bank ob_to ON p.paid_to_bank = ob_to.org_bank_id
					AND p.route_id IN (2 , 4)
					LEFT JOIN
				vendor_bank vb_to ON p.paid_to_bank = vb_to.vendor_bank_id
					AND p.route_id = 3
					LEFT JOIN
				master_status ms ON p.status_id = ms.status_id
					LEFT JOIN
				payment_mode pm ON p.payment_mode_id = pm.mode_id
					LEFT JOIN
				users u3 ON p.created_by = u3.user_id
					LEFT JOIN
				levels l ON p.level_id = l.level_id
			WHERE
				p.ticket_id = p_ticket_id;

/*                
			-- Result 5: Fetch Ticket History
			SELECT 
				th.ticket_hst_id,
				th.ticket_id,
				th.cost_center_id,
				cc.cost_center_name,
				th.expense_id,
				ex.expense_name,
				th.budget_id,
				bt.budget_name,
				th.contribution_id,
				ct.contribution_name,
                th.description,
				th.updated_by,
				u.user_name AS updater_name,
				DATE_FORMAT(th.updated_at, '%d-%m-%Y') AS updated_at,
				th.edit_description
			FROM
				ticket_history th
					LEFT JOIN
				cost_center cc ON th.cost_center_id = cc.cost_center_id
					LEFT JOIN
				expense ex ON th.expense_id = ex.expense_id
					LEFT JOIN
				budget_type bt ON th.budget_id = bt.budget_id
					LEFT JOIN
				contribution_type ct ON th.contribution_id = ct.contribution_id
					LEFT JOIN
				users u ON th.updated_by = u.user_id
			WHERE
				th.ticket_id = p_ticket_id;
                

			-- Result 6: Fetch Reimbursement History
			SELECT 
				rh.reimb_hst_id,
				rh.reimb_dtls_id,
				rh.ticket_id,
				rh.category_id,
				cat.category_type,
				rh.ledger_id,
				ld.ledger_code,
				ld.ledger_name,
				rh.total_expense,
				rh.m_granted_amount,
				rh.f_granted_amount,
				rh.reimbursed,
				rh.hotel_name,
				rh.address,
				DATE_FORMAT(rh.check_in_date, '%d-%m-%Y') AS check_in_date,
				DATE_FORMAT(rh.check_out_date, '%d-%m-%Y') AS check_out_date,
				rh.stay_days,
				rh.vehicle_id,
				rh.start_odo,
				rh.end_odo,
				rh.start_odo_path,
				rh.end_odo_path,
				rh.distance,
				rh.`from`,
				rh.`to`,
				rh.status_id AS rth_status_id,
				ms.status AS rth_status,
				rh.updated_by,
				u.user_name AS updater_name,
				DATE_FORMAT(rh.updated_at, '%d-%m-%Y') AS updated_at,
				rh.description,
				rh.edit_description
			FROM
				reimbursement_history rh
					LEFT JOIN
				categories cat ON rh.category_id = cat.category_id
					LEFT JOIN
				master_status ms ON rh.status_id = ms.status_id
					LEFT JOIN
				ledgers ld ON rh.ledger_id = ld.ledger_id
					LEFT JOIN
				users u ON rh.updated_by = u.user_id
			WHERE
				rh.ticket_id = p_ticket_id;
*/					


    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_API_GET_USER_ORG_DETAILS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Ticketing`@`%` PROCEDURE `USP_API_GET_USER_ORG_DETAILS`(
    IN p_org_id INT,
    IN p_entity_name VARCHAR(255),
    IN p_cost_center_name VARCHAR(255),
    IN p_department_name VARCHAR(255),
    IN p_sub_department_name VARCHAR(255)
)
BEGIN
    DECLARE v_entity_id INT DEFAULT NULL;
    DECLARE v_cost_center_id INT DEFAULT NULL;
    DECLARE v_department_id INT DEFAULT NULL;
    DECLARE v_sub_department_id INT DEFAULT NULL;
    DECLARE v_year_id INT;

    -- Get active academic year_id
    SELECT year_id INTO v_year_id
    FROM academic_year
    WHERE status_id = 1
    LIMIT 1;

    -- Convert empty strings to NULL
    SET p_entity_name = NULLIF(p_entity_name, '');
    SET p_cost_center_name = NULLIF(p_cost_center_name, '');
    SET p_department_name = NULLIF(p_department_name, '');
    SET p_sub_department_name = NULLIF(p_sub_department_name, '');

    -- Process entity
    IF p_entity_name IS NOT NULL THEN
        SELECT entity_id INTO v_entity_id
        FROM entities
        WHERE entity_name = p_entity_name AND status_id = 1
        LIMIT 1;

    END IF;

    -- Process cost center
    IF p_cost_center_name IS NOT NULL THEN
        SELECT cost_center_id INTO v_cost_center_id
        FROM cost_center
        WHERE cost_center_name = p_cost_center_name AND status_id = 1
        LIMIT 1;

        IF v_cost_center_id IS NULL THEN
            INSERT INTO cost_center (cost_center_name, status_id)
            VALUES (p_cost_center_name, 1);
            SET v_cost_center_id = LAST_INSERT_ID();
        END IF;

        -- Check or insert into academic_cost_center
        IF v_year_id IS NOT NULL AND v_cost_center_id IS NOT NULL AND v_entity_id IS NOT NULL THEN
            IF NOT EXISTS (
                SELECT 1 FROM academic_cost_center
                WHERE cost_center_id = v_cost_center_id AND entity_id = v_entity_id AND year_id = v_year_id AND status_id = 1
            ) THEN
                INSERT INTO academic_cost_center (cost_center_id, year_id, entity_id, status_id)
                VALUES (v_cost_center_id, v_year_id, v_entity_id, 1);
            END IF;
        END IF;
    END IF;

    
    -- Process department
    IF p_department_name IS NOT NULL THEN
        SELECT department_id INTO v_department_id
        FROM departments
        WHERE department_name = p_department_name AND status_id = 1
        LIMIT 1;

        IF v_department_id IS NULL THEN
            INSERT INTO departments (department_name, status_id)
            VALUES (p_department_name, 1);
            SET v_department_id = LAST_INSERT_ID();
        END IF;
    END IF;

    -- Process sub-department
    IF p_sub_department_name IS NOT NULL AND v_department_id IS NOT NULL THEN
        SELECT sub_department_id INTO v_sub_department_id
        FROM sub_departments
        WHERE department_id = v_department_id
          AND sub_department_name = p_sub_department_name
          AND status_id = 1
        LIMIT 1;

        IF v_sub_department_id IS NULL THEN
            INSERT INTO sub_departments (department_id, sub_department_name, status_id)
            VALUES (v_department_id, p_sub_department_name, 1);
            SET v_sub_department_id = LAST_INSERT_ID();
        END IF;
    END IF;

    -- Final output
    SELECT 
        v_entity_id AS entity_id,
        v_cost_center_id AS cost_center_id,
        v_department_id AS department_id,
        v_sub_department_id AS sub_department_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_API_GET_USER_PROFILE_DETAILS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Ticketing`@`%` PROCEDURE `USP_API_GET_USER_PROFILE_DETAILS`(
    IN p_User_ID INT
)
BEGIN

        -- Result 1: Fetch user profile details & login details
        SELECT 
            p_User_ID as user_id,u.employee_id, u.employee_number, u.user_name, u.work_email, u.mobile, 
            u.gender, u.PAN_number, u.aadhaar_number, u.enrollment_number, u.DOB,  e.org_id,o.org_name,
            u.entity_id,e.entity_name, e.entity_code, u.cost_center_id,cc.cost_center_name, u.department_id,d.department_name, u.sub_department_id, 
            sd.sub_department_name,u.job_title, u.secondary_job_title, u.manager_user_id, rm.user_name AS manager_name,
            u.personal_email, u.father_name, u.mother_name, u.blood_group, 
            u.nationality, u.bank_id,ub.name_on_bank, ub.bank_name, ub.account_number, ub.IFSC, u.pf_id,
            pf.pf_establishment_id, pf.pf_details_available, pf.pf_number,DATE_FORMAT(pf.pf_joining_date, '%d-%m-%y') AS pf_joining_date,
            pf.name_on_pf_account, pf.UAN,
            u.pay_grade, u.work_location, 
            u.status_id, ms.status , 
            GROUP_CONCAT(ld.login_id) as login_ids ,
            DATE_FORMAT(u.timestamp, '%d-%m-%y %H:%i:%s')  as updated_at
        FROM users u
            LEFT JOIN entities e ON u.entity_id = e.entity_id AND e.status_id = 1
            LEFT JOIN organization o ON e.org_id = o.org_id AND o.status_id = 1
            LEFT JOIN cost_center cc ON u.cost_center_id = cc.cost_center_id AND cc.status_id = 1
            LEFT JOIN departments d ON u.department_id = d.department_id AND d.status_id = 1
            LEFT JOIN sub_departments sd ON u.sub_department_id = sd.sub_department_id AND sd.status_id = 1
            LEFT JOIN users rm ON u.manager_user_id = rm.user_id AND rm.status_id = 1
            LEFT JOIN user_bank ub ON u.bank_id = ub.bank_id AND ub.status_id = 1
            LEFT JOIN pf_details pf ON u.pf_id = pf.pf_id AND pf.status_id = 1
            LEFT JOIN master_status ms ON u.status_id = ms.status_id
            LEFT JOIN login_details ld ON ld.user_id = p_User_ID AND ld.status_id = 1
        WHERE u.user_id = p_User_ID
        GROUP BY u.user_id;

        -- Result 2: Fetch user role details 
        SELECT ur.role_id, r.role_name
        FROM user_roles ur
            LEFT JOIN roles r ON r.role_id = ur.role_id
        WHERE ur.user_id = p_User_ID AND ur.status_id = 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_API_GET_USER_ROLE_MENU_DETAILS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Ticketing`@`%` PROCEDURE `USP_API_GET_USER_ROLE_MENU_DETAILS`(
    IN p_user_id INT
)
BEGIN
    DECLARE v_status_id INT;
    DECLARE v_role_count INT;

    -- Check if user exists and is active
    SELECT status_id INTO v_status_id
    FROM users 
    WHERE user_id = p_user_id;

    -- Check if user has assigned roles
    SELECT COUNT(*) INTO v_role_count
    FROM user_roles ur
    JOIN roles r ON ur.role_id = r.role_id AND r.status_id = 1
    WHERE ur.user_id = p_user_id AND ur.status_id = 1;

    -- If user is inactive or has no roles, return NULL results
    IF v_status_id IS NULL OR v_status_id <> 1 OR v_role_count = 0 THEN
        SELECT NULL AS role_id, NULL AS role_name, NULL AS action;
        SELECT NULL AS menu_id, NULL AS menu_name, NULL AS action, NULL AS description;
    ELSE
        -- First Output: User roles and actions
        SELECT 
            ur.role_id,
            r.role_name,
            GROUP_CONCAT(DISTINCT ra.action ORDER BY ra.action SEPARATOR ',') AS action
        FROM users u
        INNER JOIN user_roles ur ON u.user_id = ur.user_id AND ur.status_id = 1
        INNER JOIN roles r ON ur.role_id = r.role_id AND r.status_id = 1
        LEFT JOIN role_actions ra ON ur.role_id = ra.role_id AND ra.status_id = 1
        WHERE u.user_id = p_user_id
        GROUP BY ur.role_id, r.role_name;

        -- Second Output: Distinct menu access
        SELECT DISTINCT
            rm.menu_id AS menu_id,
            m.menu_name AS menu_name,
            m.action AS action,
            m.description AS description,
            m.sort
        FROM users u
        INNER JOIN user_roles ur ON u.user_id = ur.user_id AND ur.status_id = 1
        INNER JOIN roles r ON ur.role_id = r.role_id AND r.status_id = 1
        INNER JOIN role_menu rm ON r.role_id = rm.role_id AND rm.status_id = 1
        INNER JOIN menus m ON rm.menu_id = m.menu_id AND m.status_id = 1
        WHERE u.user_id = p_user_id
        ORDER BY m.sort;
    END IF;

    -- Third Output: User basic details and status (always returned)
    SELECT 
        u.user_id,
        u.user_name,
        u.work_email,
        u.entity_id,
        e.entity_name,
        u.status_id,
        ms.status
    FROM users u
    LEFT JOIN master_status ms ON u.status_id = ms.status_id
    LEFT JOIN entities e ON u.entity_id = e.entity_id
    WHERE u.user_id = p_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_API_SET_USER_ROLES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Ticketing`@`%` PROCEDURE `USP_API_SET_USER_ROLES`()
BEGIN
    -- Step 1: Update user_role.status_id = 2 for users whose status has changed in the users table
    UPDATE user_roles ur
    JOIN users u ON ur.user_id = u.user_id
    SET ur.status_id = 2
    WHERE u.status_id = 2
    AND ur.status_id = 1;

    -- Step 2: Use a Temporary Table to store new role assignments before inserting
    CREATE TEMPORARY TABLE tmp_new_roles (
        user_id INT,
        role_id INT
    );

    -- Insert role 7 for active users
    INSERT INTO tmp_new_roles (user_id, role_id)
    SELECT DISTINCT u.user_id, 7
    FROM users u
    WHERE u.status_id = 1
    AND NOT EXISTS (
        SELECT 1 FROM user_roles ur 
        WHERE ur.user_id = u.user_id 
        AND ur.role_id = 7 
        AND ur.status_id = 1
    );

    -- Insert role 8 for users who are managers
    INSERT INTO tmp_new_roles (user_id, role_id)
    SELECT DISTINCT u.manager_user_id, 8
    FROM users u
    WHERE u.manager_user_id IS NOT NULL  
    AND NOT EXISTS (
        SELECT 1 FROM user_roles ur 
        WHERE ur.user_id = u.manager_user_id 
        AND ur.role_id = 8 
        AND ur.status_id = 1
    );

    -- Step 3: Insert from temporary table to user_roles
    INSERT INTO user_roles (user_id, role_id, status_id, created_at, created_by)
    SELECT user_id, role_id, 1, NOW(), 'System'
    FROM tmp_new_roles;

    --  Step 4: Deactivate role 8 for users who are no longer managers
    UPDATE user_roles
	SET status_id = 2
	WHERE role_id = 8
	  AND status_id = 1
	  AND user_id NOT IN (
		  SELECT DISTINCT manager_user_id
		  FROM users
		  WHERE manager_user_id IS NOT NULL
          AND status_id =1
	  );

    -- Step 5: Drop the Temporary Table after use
    DROP TEMPORARY TABLE tmp_new_roles;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_EDIT_REPORT_DATE_DESCRIPTION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Ticketing`@`%` PROCEDURE `USP_EDIT_REPORT_DATE_DESCRIPTION`(
    IN p_user_id INT,
    IN p_report_id INT,
    IN p_start_date DATE,
    IN p_end_date DATE,
    IN p_description TEXT,
    IN p_edit_description TEXT
)
proc: BEGIN
    -- Variable declarations
    DECLARE rpt_start_date DATE;
    DECLARE rpt_end_date DATE;
    DECLARE rpt_description TEXT;
    DECLARE v_ticket_id INT;
    DECLARE v_reimb_dtls_id INT;
    DECLARE v_category_id INT;
    DECLARE v_min_date DATE DEFAULT NULL;
    DECLARE v_max_date DATE DEFAULT NULL;
    DECLARE v_tmp_min DATE;
    DECLARE v_tmp_max DATE;
    DECLARE done_tk INT DEFAULT FALSE;
    DECLARE done_dtls INT DEFAULT FALSE;

    -- Cursor for looping through tickets
    DECLARE cur_tk CURSOR FOR
        SELECT t.ticket_id
        FROM tickets t
        WHERE t.report_id = p_report_id AND t.exp_catg_id = 1 AND t.status_id = 1;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_tk = TRUE;

    -- Step 1: Get report details
    SELECT start_date, end_date, description
    INTO rpt_start_date, rpt_end_date, rpt_description
    FROM reports
    WHERE report_id = p_report_id AND user_id = p_user_id AND status_id = 1;

    -- Step 2: Loop through tickets and get overall min/max date range
    OPEN cur_tk;

    read_tk_loop: LOOP
        FETCH cur_tk INTO v_ticket_id;
        IF done_tk THEN
            LEAVE read_tk_loop;
        END IF;

        -- Inner cursor for all reimb_dtls under the ticket
        BEGIN
            DECLARE cur_dtls CURSOR FOR
                SELECT reimb_dtls_id, category_id
                FROM re_ticket_details
                WHERE ticket_id = v_ticket_id AND status_id = 1;

            DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_dtls = TRUE;
            SET done_dtls = FALSE;
            OPEN cur_dtls;

            read_dtls_loop: LOOP
                FETCH cur_dtls INTO v_reimb_dtls_id, v_category_id;
                IF done_dtls THEN
                    LEAVE read_dtls_loop;
                END IF;

                IF v_category_id = 1 THEN
                    SELECT MIN(date), MAX(date)
                    INTO v_tmp_min, v_tmp_max
                    FROM food
                    WHERE reimb_dtls_id = v_reimb_dtls_id;

                ELSEIF v_category_id = 2 THEN
                    SELECT MIN(travel_date), MAX(travel_date)
                    INTO v_tmp_min, v_tmp_max
                    FROM travels
                    WHERE reimb_dtls_id = v_reimb_dtls_id;

                ELSEIF v_category_id = 3 THEN
                    SELECT MIN(check_in_date), MAX(check_out_date)
                    INTO v_tmp_min, v_tmp_max
                    FROM accommodation
                    WHERE reimb_dtls_id = v_reimb_dtls_id;

                ELSEIF v_category_id = 4 THEN
                    SELECT MIN(date), MAX(date)
                    INTO v_tmp_min, v_tmp_max
                    FROM reimb_others
                    WHERE reimb_dtls_id = v_reimb_dtls_id;
                END IF;

                -- Update overall min and max if not null
                IF v_tmp_min IS NOT NULL THEN
                    SET v_min_date = IF(v_min_date IS NULL OR v_tmp_min < v_min_date, v_tmp_min, v_min_date);
                END IF;

                IF v_tmp_max IS NOT NULL THEN
                    SET v_max_date = IF(v_max_date IS NULL OR v_tmp_max > v_max_date, v_tmp_max, v_max_date);
                END IF;

            END LOOP;
            CLOSE cur_dtls;
        END;

    END LOOP;

    CLOSE cur_tk;

    -- Step 3: If ticket date range exists, validate new range
    IF v_min_date IS NOT NULL AND v_max_date IS NOT NULL THEN
        IF p_start_date > v_min_date OR p_end_date < v_max_date THEN
            SELECT 
                CONCAT('Cannot Edit: Tickets have entries between ', DATE_FORMAT(v_min_date, '%d-%m-%Y'),
                       ' and ', DATE_FORMAT(v_max_date, '%d-%m-%Y'), '. Please ensure new dates cover this range.') AS Message,
                0 AS Success;
            LEAVE proc;
        END IF;
    END IF;

    -- Step 4: No change detected
    IF rpt_start_date = p_start_date AND
       rpt_end_date = p_end_date AND
       rpt_description = p_description THEN
        SELECT 'No Change Detected, Everything is Same' AS Message, 0 AS Success;
        LEAVE proc;
    END IF;

    -- Step 5: Apply change and insert into history
    IF rpt_description <> p_description AND rpt_start_date = p_start_date AND rpt_end_date = p_end_date THEN
        INSERT INTO report_history (report_id, description, updated_by, updated_at, edit_description)
        VALUES (p_report_id, rpt_description, p_user_id, NOW(), p_edit_description);

        UPDATE reports
        SET description = p_description,
            updated_at = NOW()
        WHERE report_id = p_report_id;

        SELECT 'Description Edited Successfully' AS Message, 1 AS Success;

    ELSEIF rpt_start_date <> p_start_date AND rpt_end_date = p_end_date AND rpt_description = p_description THEN
        INSERT INTO report_history (report_id, start_date, updated_by, updated_at, edit_description)
        VALUES (p_report_id, rpt_start_date, p_user_id, NOW(), p_edit_description);

        UPDATE reports
        SET start_date = p_start_date,
            updated_at = NOW()
        WHERE report_id = p_report_id;

        SELECT 'Start Date Edited Successfully' AS Message, 1 AS Success;

    ELSEIF rpt_end_date <> p_end_date AND rpt_start_date = p_start_date AND rpt_description = p_description THEN
        INSERT INTO report_history (report_id, end_date, updated_by, updated_at, edit_description)
        VALUES (p_report_id, rpt_end_date, p_user_id, NOW(), p_edit_description);

        UPDATE reports
        SET end_date = p_end_date,
            updated_at = NOW()
        WHERE report_id = p_report_id;

        SELECT 'End Date Edited Successfully' AS Message, 1 AS Success;

    ELSE
        INSERT INTO report_history (report_id, start_date, end_date, description, updated_by, updated_at, edit_description)
        VALUES (p_report_id, rpt_start_date, rpt_end_date, rpt_description, p_user_id, NOW(), p_edit_description);

        UPDATE reports
        SET start_date = p_start_date,
            end_date = p_end_date,
            description = p_description,
            updated_at = NOW()
        WHERE report_id = p_report_id;

        SELECT 'Date and Description Edited Successfully' AS Message, 1 AS Success;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_EDIT_TICKET_DESCRIPTION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Ticketing`@`%` PROCEDURE `USP_EDIT_TICKET_DESCRIPTION`(
	IN p_user_id INT,
    IN p_ticket_id INT,
    IN p_description TEXT,
    IN p_edit_description TEXT
)
proc: BEGIN
    DECLARE v_old_description TEXT;
    
    -- Step 1: Check if p_description has at least 5 characters
    IF LENGTH(p_description) < 5 THEN
        SELECT 'Minimum 5 characters needed' AS Message, 0 AS Success;
        LEAVE proc;
    END IF;

    -- Step 2: Fetch the existing description if the ticket is active
    SELECT description
    INTO v_old_description
    FROM tickets
    WHERE ticket_id = p_ticket_id AND status_id = 1 AND user_id = p_user_id;

    -- Step 3: Check if the new description is the same as the old one
    IF v_old_description = p_description THEN
        SELECT 'No Change Detected, Everything is Same' AS Message, 0 AS Success;
        LEAVE proc;
    END IF;

    -- Step 4: Insert the old description into ticket_history
    INSERT INTO ticket_history (
        ticket_id,
        description,
        updated_by,
        updated_at,
        edit_description
    )
    VALUES (
        p_ticket_id,
        v_old_description,
        p_user_id,
        NOW(),
        p_edit_description
    );

    -- Step 5: Update the new description in tickets table
    UPDATE tickets
    SET description = p_description,
        updated_at = NOW(),
        updated_by = p_user_id
    WHERE ticket_id = p_ticket_id;

    -- Step 5: Return success message
    SELECT 'Description Changed Successfully' AS Message, 1 AS Success;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_EXPORT_TALLY_DATA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Ticketing`@`%` PROCEDURE `USP_EXPORT_TALLY_DATA`(
    IN p_user_id INT,
    IN p_tally_booking_ids TEXT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 'Data Insertion Failed' AS Message, 0 AS Success;
	END;

    export_proc: BEGIN

        START TRANSACTION;

        -- Drop temp tables if they exist
        DROP TEMPORARY TABLE IF EXISTS temp_booking_ids;
        DROP TEMPORARY TABLE IF EXISTS temp_bank_summary;

        -- Step 1: Create temporary table for booking IDs
        CREATE TEMPORARY TABLE temp_booking_ids (
            id INT
        );

        -- Step 2: Parse comma-separated IDs into temp_booking_ids
        SET @input := p_tally_booking_ids;

        WHILE LENGTH(TRIM(@input)) > 0 DO
            SET @next_comma := LOCATE(',', @input);
            IF @next_comma > 0 THEN
                INSERT INTO temp_booking_ids (id)
                VALUES (CAST(TRIM(SUBSTRING(@input, 1, @next_comma - 1)) AS UNSIGNED));
                SET @input := SUBSTRING(@input, @next_comma + 1);
            ELSE
                INSERT INTO temp_booking_ids (id)
                VALUES (CAST(TRIM(@input) AS UNSIGNED));
                SET @input := '';
            END IF;
        END WHILE;

        -- Step 3 + 5 Combined: Create temp_bank_summary with all necessary info
        CREATE TEMPORARY TABLE temp_bank_summary AS
        SELECT 
            tb.tally_booking_id,
            tb.ticket_id,
            tb.expense_category_id,
            tb.ticket_dtls_id,
            tb.payment_id,
            tb.paid_amount,
            p.paid_from_bank AS bank_id,
            p.route_id,
            CASE 
                WHEN p.route_id IN (1, 3) THEN ob_from.bank_ledger 
                ELSE NULL 
            END AS bank_ledger
        FROM 
            tally_booking tb
        JOIN 
            payments p ON tb.payment_id = p.payment_id
        LEFT JOIN 
            organization_bank ob_from ON ob_from.org_bank_id = p.paid_from_bank
        WHERE 
            tb.status_id = 1 
            AND tb.process_status_id = 23
            AND tb.tally_booking_id IN (SELECT id FROM temp_booking_ids);

        -- Step 3.5: Check if any eligible records exist
        SELECT COUNT(*) INTO @row_count FROM temp_bank_summary;
        IF @row_count = 0 THEN
            ROLLBACK;
            SELECT 'No eligible records to process' AS Message, 0 AS Success;
            LEAVE export_proc;
        END IF;

        -- Step 4: Compute total paid amount
        SELECT SUM(paid_amount) INTO @tally_total FROM temp_bank_summary;

        -- Step 5: Get any one bank_ledger from non-null rows
        SELECT bank_ledger INTO @bank_ledger
        FROM temp_bank_summary
        WHERE bank_ledger IS NOT NULL
        LIMIT 1;

        -- Also compute the total for bank_ledger related payments
        SELECT SUM(paid_amount) INTO @payment_grand_total
        FROM temp_bank_summary
        WHERE bank_ledger IS NOT NULL;

        -- Step 6: Insert into tally_payment
        INSERT INTO tally_payment (
            voucher_type,
            ledger,
            amount,
            `dr/cr`,
            status_id,
            created_by,
            created_at
        ) VALUES (
            'Payment',
            'Expenses Payable',
            @tally_total,
            'Dr',
            1,
            p_user_id,
            NOW()
        );

        SET @last_tally_pay_id := LAST_INSERT_ID();

        -- Step 7: Insert into tally_pay_bank
        INSERT INTO tally_pay_bank (
            voucher_type,
            tally_pay_id,
            ledger,
            amount,
            `dr/cr`,
            bank_id,
            route_id,
            status_id,
            created_by,
            created_at
        )
        SELECT 
            'Payment',
            @last_tally_pay_id,
            bank_ledger,
            SUM(paid_amount),
            'Cr',
            bank_id,
            route_id,
            1,
            p_user_id,
            NOW()
        FROM temp_bank_summary
        WHERE bank_ledger IS NOT NULL
        GROUP BY bank_id, route_id, bank_ledger;

        -- Step 8: Update tally_booking
        UPDATE tally_booking
        SET 
            voucher_type = 'Journal',
            tally_pay_id = @last_tally_pay_id,
            `dr/cr` = 'Dr',
            process_status_id = 24,
            created_by = p_user_id,
            created_at = NOW()
        WHERE tally_booking_id IN (
            SELECT tally_booking_id FROM temp_bank_summary
        );

        COMMIT;

        SELECT 'Data Inserted Successfully' AS Message, 1 AS Success;

    END export_proc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_GET_COST_CENTER_BY_YEAR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Ticketing`@`%` PROCEDURE `USP_GET_COST_CENTER_BY_YEAR`(
    IN p_Year_ID VARCHAR(10),
    IN p_User_ID VARCHAR(50)
)
BEGIN
    DECLARE v_Year_ID INT;
    DECLARE v_Is_Super_Admin INT DEFAULT 0;

    -- Determine Year_ID
    IF p_Year_ID = '*' THEN
        SELECT year_id INTO v_Year_ID
        FROM academic_year
        WHERE status_id = 1
        LIMIT 1;
    ELSE
        SET v_Year_ID = p_Year_ID;
    END IF;

    -- Check if user is Super Admin (role_id = 1)
    SELECT COUNT(*) INTO v_Is_Super_Admin
    FROM user_roles
    WHERE user_id = p_User_ID AND role_id = 1;

    -- Final Output
    IF v_Is_Super_Admin > 0 THEN
        -- Super Admin: Get all cost centers for all entities for that year
        SELECT 
            cc.cost_center_id AS cc_id,
            cc.cost_center_name AS cc_name
        FROM academic_cost_center acc
        JOIN cost_center cc ON acc.cost_center_id = cc.cost_center_id
        WHERE acc.year_id = v_Year_ID
          AND acc.entity_id IN (
              SELECT entity_id
              FROM academic_entity
              WHERE year_id = v_Year_ID
                AND status_id = 1
          )
          AND acc.status_id = 1;
    ELSE
        -- Regular user: Get cost centers for user's entity
        SELECT 
            cc.cost_center_id AS cc_id,
            cc.cost_center_name AS cc_name
        FROM academic_cost_center acc
        JOIN cost_center cc ON acc.cost_center_id = cc.cost_center_id
        WHERE acc.year_id = v_Year_ID
          AND acc.entity_id = (
              SELECT entity_id
              FROM users
              WHERE user_id = p_User_ID
              LIMIT 1
          )
          AND acc.status_id = 1;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_GET_FA_FP_BY_ENTITY` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Ticketing`@`%` PROCEDURE `USP_GET_FA_FP_BY_ENTITY`(
    p_entity_id INT
)
BEGIN
    SELECT 
        u.user_id,
        u.employee_number,
        u.user_name,
        u.work_email,
        ur.role_id,
        r.role_name
    FROM 
        users u
    INNER JOIN 
        user_roles ur ON u.user_id = ur.user_id
    INNER JOIN 
        roles r ON ur.role_id = r.role_id
    WHERE 
        (u.entity_id = p_entity_id OR (p_entity_id = 4 AND u.entity_id = 1))
        AND ur.status_id = 1
        AND ur.role_id IN (3, 4);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_GET_LEDGERS_BY_USER_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Ticketing`@`%` PROCEDURE `USP_GET_LEDGERS_BY_USER_ID`(
    IN p_user_id INT
)
BEGIN
    DECLARE v_entity_id INT;

    -- Step 1: Get entity_id from users table
    SELECT entity_id INTO v_entity_id
    FROM users
    WHERE user_id = p_user_id
    LIMIT 1;

    -- Step 2: Get ledger details for the entity_id
    SELECT 
        ledger_id,
        ledger_code,
        ledger_name,
        ledger_type,
        category_id
    FROM ledgers
    WHERE status_id = 1
      ORDER BY ledger_name ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_GET_MANAGER_REPORTS_NUMBER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Ticketing`@`%` PROCEDURE `USP_GET_MANAGER_REPORTS_NUMBER`(
    IN p_user_id INT
)
BEGIN
    -- Step 1: Create temporary table to store relevant report_ids
    CREATE TEMPORARY TABLE IF NOT EXISTS TempReportIds (
        report_id INT PRIMARY KEY
    );

    INSERT INTO TempReportIds (report_id)
    SELECT report_id 
    FROM reports 
    WHERE manager_id = p_user_id 
      AND status_id = 1;

    -- Step 2: Fetch counts of reports grouped by process_status_id
    SELECT 
        COUNT(DISTINCT CASE WHEN t.process_status_id = 7 THEN t.report_id END) AS pending,
        COUNT(DISTINCT CASE WHEN t.process_status_id NOT IN (7, 8, 19) THEN t.report_id END) AS approved,
        COUNT(DISTINCT CASE WHEN t.process_status_id = 8 THEN t.report_id END) AS rejected,
        COUNT(DISTINCT CASE WHEN t.process_status_id = 15 THEN t.report_id END) AS closed
    FROM tickets t
    INNER JOIN TempReportIds tr ON t.report_id = tr.report_id;

    -- Step 3: Clean up
    DROP TEMPORARY TABLE IF EXISTS TempReportIds;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_GET_MANAGER_TICKETS_NUMBER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Ticketing`@`%` PROCEDURE `USP_GET_MANAGER_TICKETS_NUMBER`(
    IN p_report_id INT
)
BEGIN
    -- Fetch the report counts based on process_status_id
    SELECT 
        COUNT(CASE WHEN t.process_status_id = 7 THEN 1 END) AS pending,
        COUNT(CASE WHEN t.process_status_id NOT IN (19, 7, 8) THEN 1 END) AS approved,
        COUNT(CASE WHEN t.process_status_id = 8 THEN 1 END) AS rejected,
        COUNT(CASE WHEN t.process_status_id = 15 THEN 1 END) AS closed
    FROM tickets t
    WHERE t.report_id = p_report_id 
      AND t.status_id = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_GET_TALLY_LIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Ticketing`@`%` PROCEDURE `USP_GET_TALLY_LIST`(
    IN p_status_id VARCHAR(10),
    IN p_entity_id VARCHAR(10),
    IN p_expense_category_id VARCHAR(10),
    IN p_limit VARCHAR(10)
)
BEGIN
    DROP TEMPORARY TABLE IF EXISTS temp_tally_list;

    CREATE TEMPORARY TABLE temp_tally_list
    SELECT 
        -- Conditional logic for last_tally_pay_id based on p_status_id
        CASE
            WHEN p_status_id = '23' THEN (SELECT IFNULL(MAX(tally_pay_id), 0) + 1 FROM tally_payment)
            ELSE
                CASE
                    WHEN tb.tally_pay_id IS NOT NULL THEN tb.tally_pay_id
                    ELSE (SELECT IFNULL(MAX(tally_pay_id), 0) + 1 FROM tally_payment)
                END
        END AS last_tally_pay_id,
        tb.tally_booking_id, 
        tb.voucher_type,
        tb.ticket_id, 
        tb.expense_category_id,
        ex.category AS expense_category,
        tb.ticket_dtls_id,
        tb.tally_pay_id, 
        tb.paid_amount,
        tb.`dr/cr`, 
        tb.status_id AS tally_booking_status_id, 
        ms1.status AS tally_booking_status,
        tb.process_status_id AS tally_process_status_id,
        ms2.status AS tally_process_status,
        
        t.entity_id,
        e.entity_name,
        t.report_id,
        t.ticket_number,
        t.cost_center_id,
        cc.cost_center_name,
        t.contribution_id,
        ct.contribution_name,
        t.granted_amount AS ticket_granted_amount,
        t.process_status_id AS ticket_process_status_id,
        ms.status AS ticket_process_status,
        t.description AS ticket_description,
        DATE_FORMAT(t.created_at, '%d-%m-%Y') AS ticket_created_date,

        rm.reimb_dtls_id,
        rm.category_id,
        cat.category_type,
        rm.ledger_id,
        ld.ledger_name,
        rm.total_expense,
        rm.m_granted_amount,
        rm.f_granted_amount,
        
        u.employee_number,
        
        p.payment_id,
        p.transaction_id,
        p.route_id,
        p.pay_type_id,
        pt.pay_type,
        p.paid_from,
        CASE
            WHEN p.route_id = 1 THEN e1.entity_name
            WHEN p.route_id = 2 THEN u1.user_name
            WHEN p.route_id = 3 THEN e1.entity_name
            WHEN p.route_id = 4 THEN v1.vendor_name
        END AS paid_from_name,
        p.paid_to,
        CASE
            WHEN p.route_id = 1 THEN u2.user_name
            WHEN p.route_id = 2 THEN e2.entity_name
            WHEN p.route_id = 3 THEN v2.vendor_name
            WHEN p.route_id = 4 THEN e2.entity_name
        END AS paid_to_name,
        p.paid_from_bank,
        CASE
            WHEN p.route_id IN (1 , 3) THEN ob_from.entity_bank_name
            WHEN p.route_id = 2 THEN ub_from.bank_name
            WHEN p.route_id = 4 THEN vb_from.bank_name
        END AS paid_from_bank_name,
        CASE
            WHEN p.route_id IN (1 , 3) THEN ob_from.entity_bank_account_no
            WHEN p.route_id = 2 THEN ub_from.account_number
            WHEN p.route_id = 4 THEN vb_from.account_number
        END AS paid_from_account_number,
        CASE
            WHEN p.route_id IN (1 , 3) THEN ob_from.entity_name_on_bank
            WHEN p.route_id = 2 THEN ub_from.name_on_bank
            WHEN p.route_id = 4 THEN vb_from.name_on_bank
        END AS paid_from_name_on_bank,
        CASE
            WHEN p.route_id IN (1 , 3) THEN ob_from.entity_bank_IFSC
            WHEN p.route_id = 2 THEN ub_from.IFSC
            WHEN p.route_id = 4 THEN vb_from.IFSC
        END AS paid_from_IFSC,
        CASE
            WHEN p.route_id IN (1 , 3) THEN ob_from.bank_ledger
        END AS paid_from_bank_ledger,
        p.paid_to_bank,
        CASE
            WHEN p.route_id = 1 THEN ub_to.bank_name
            WHEN p.route_id IN (2 , 4) THEN ob_to.entity_bank_name
            WHEN p.route_id = 3 THEN vb_to.bank_name
        END AS paid_to_bank_name,
        CASE
            WHEN p.route_id = 1 THEN ub_to.account_number
            WHEN p.route_id IN (2 , 4) THEN ob_to.entity_bank_account_no
            WHEN p.route_id = 3 THEN vb_to.account_number
        END AS paid_to_account_number,
        CASE
            WHEN p.route_id = 1 THEN ub_to.name_on_bank
            WHEN p.route_id IN (2 , 4) THEN ob_to.entity_name_on_bank
            WHEN p.route_id = 3 THEN vb_to.name_on_bank
        END AS paid_to_name_on_bank,
        CASE
            WHEN p.route_id = 1 THEN ub_to.IFSC
            WHEN p.route_id IN (2 , 4) THEN ob_to.entity_bank_IFSC
            WHEN p.route_id = 3 THEN vb_to.IFSC
        END AS paid_to_IFSC,
        CASE
            WHEN p.route_id IN (2 , 4) THEN ob_to.bank_ledger
        END AS paid_to_bank_ledger,
        p.amount,
        p.UTR_number,
        p.status_id AS payment_status_id,
        ms3.status AS payment_status,
        DATE_FORMAT(p.payment_date, '%d-%m-%Y') AS payment_date

    FROM tally_booking tb
    LEFT JOIN tickets t ON tb.ticket_id = t.ticket_id AND t.status_id = 1
    LEFT JOIN entities e ON t.entity_id = e.entity_id
    LEFT JOIN cost_center cc ON t.cost_center_id = cc.cost_center_id
    LEFT JOIN contribution_type ct ON t.contribution_id = ct.contribution_id
    LEFT JOIN expense_category ex ON tb.expense_category_id = ex.expense_category_id
    LEFT JOIN master_status ms ON t.process_status_id = ms.status_id
    LEFT JOIN master_status ms1 ON tb.status_id = ms1.status_id
    LEFT JOIN master_status ms2 ON tb.process_status_id = ms2.status_id
    LEFT JOIN users u ON t.user_id = u.user_id 
    LEFT JOIN payments p ON tb.ticket_id = p.ticket_id AND p.status_id = 14
    LEFT JOIN payment_type pt ON p.pay_type_id = pt.pay_type_id
    LEFT JOIN entities e1 ON p.paid_from = e1.entity_id AND p.route_id IN (1 , 3)
    LEFT JOIN users u1 ON p.paid_from = u1.user_id AND p.route_id = 2
    LEFT JOIN vendors v1 ON p.paid_from = v1.vendor_id AND p.route_id = 4
    LEFT JOIN users u2 ON p.paid_to = u2.user_id AND p.route_id = 1
    LEFT JOIN entities e2 ON p.paid_to = e2.entity_id AND p.route_id IN (2 , 4)
    LEFT JOIN vendors v2 ON p.paid_to = v2.vendor_id AND p.route_id = 3
    LEFT JOIN organization_bank ob_from ON p.paid_from_bank = ob_from.org_bank_id AND p.route_id IN (1 , 3)
    LEFT JOIN user_bank ub_from ON p.paid_from_bank = ub_from.bank_id AND p.route_id = 2
    LEFT JOIN vendor_bank vb_from ON p.paid_from_bank = vb_from.vendor_bank_id AND p.route_id = 4
    LEFT JOIN user_bank ub_to ON p.paid_to_bank = ub_to.bank_id AND p.route_id = 1
    LEFT JOIN organization_bank ob_to ON p.paid_to_bank = ob_to.org_bank_id AND p.route_id IN (2 , 4)
    LEFT JOIN vendor_bank vb_to ON p.paid_to_bank = vb_to.vendor_bank_id AND p.route_id = 3
    LEFT JOIN master_status ms3 ON p.status_id = ms3.status_id
    LEFT JOIN re_ticket_details rm ON tb.ticket_dtls_id = rm.reimb_dtls_id AND tb.expense_category_id = 1 AND rm.status_id = 1
    LEFT JOIN categories cat ON rm.category_id = cat.category_id
    LEFT JOIN ledgers ld ON rm.ledger_id = ld.ledger_id

    WHERE 
    tb.status_id = 1 
    AND (CAST(tb.process_status_id AS CHAR) = p_status_id OR p_status_id = '*')
    AND (CAST(tb.expense_category_id AS CHAR) = p_expense_category_id OR p_expense_category_id = '*')
    AND (CAST(t.entity_id AS CHAR) = p_entity_id OR p_entity_id = '*')
    ORDER BY tb.created_at DESC;

    -- Display data from temp table with limit handling
    IF p_limit = '*' THEN
		SELECT * FROM temp_tally_list;
	ELSEIF p_limit REGEXP '^[0-9]+$' THEN
		SET @sql := CONCAT('SELECT * FROM temp_tally_list LIMIT ', CAST(p_limit AS UNSIGNED));
		PREPARE stmt FROM @sql;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
	ELSE
		-- fallback if p_limit is invalid
		SELECT * FROM temp_tally_list;
	END IF;

    DROP TEMPORARY TABLE IF EXISTS temp_tally_list;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_GET_USER_ENTITIES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Ticketing`@`%` PROCEDURE `USP_GET_USER_ENTITIES`(
    IN p_user_id INT,
    IN p_year_id VARCHAR(10)
)
BEGIN
    DECLARE effective_year_id INT;
    DECLARE is_super_admin INT;

    -- Step 1: Check if user is super admin
    SELECT COUNT(*) INTO is_super_admin
    FROM user_roles
    WHERE user_id = p_user_id AND role_id = 1 AND status_id = 1;

    -- Step 2: If year_id = '*', skip academic year checks
    IF p_year_id = '*' THEN

        IF is_super_admin > 0 THEN
            -- Super Admin with access to all active entities
            SELECT '*' AS entity_id, 'All Entities' AS entity_name, 'All Entities' AS entity_code
            UNION
            SELECT e.entity_id, e.entity_name, e.entity_code
            FROM entities e 
            WHERE e.status_id = 1;
        ELSE
            -- Regular user - show only their assigned entity
            SELECT e.entity_id, e.entity_name, e.entity_code
            FROM users u
            JOIN entities e ON u.entity_id = e.entity_id
            WHERE u.user_id = p_user_id
              AND e.status_id = 1;
        END IF;

    ELSE
        -- Step 3: Convert p_year_id and validate
        SET effective_year_id = CAST(p_year_id AS UNSIGNED);

        -- Step 4: Logic when specific year is provided
        IF is_super_admin > 0 THEN
            -- Super Admin: Only return All+Entities if valid year data exists
            IF EXISTS (
                SELECT 1
                FROM academic_entity ae
                JOIN entities e ON ae.entity_id = e.entity_id
                WHERE ae.year_id = effective_year_id
                  AND ae.status_id = 1
                  AND e.status_id = 1
            ) THEN
                SELECT '*' AS entity_id, 'All Entities' AS entity_name, 'All Entities' AS entity_code
                UNION
                SELECT e.entity_id, e.entity_name, e.entity_code
                FROM academic_entity ae
                JOIN entities e ON ae.entity_id = e.entity_id
                WHERE ae.year_id = effective_year_id
                  AND ae.status_id = 1
                  AND e.status_id = 1;
            ELSE
                -- No data: return empty set
                SELECT e.entity_id, e.entity_name, e.entity_code
                FROM entities e
                WHERE 1=0;
            END IF;

        ELSE
            -- Regular user: filter by their entity and year
            SELECT e.entity_id, e.entity_name, e.entity_code
            FROM users u
            JOIN academic_entity ae ON u.entity_id = ae.entity_id
            JOIN entities e ON u.entity_id = e.entity_id
            WHERE u.user_id = p_user_id
              AND ae.year_id = effective_year_id
              AND ae.status_id = 1
              AND e.status_id = 1;
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_GET_USER_REPORT_NUMBERS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Ticketing`@`%` PROCEDURE `USP_GET_USER_REPORT_NUMBERS`(
    IN p_user_id INT
)
BEGIN
    SELECT 
        -- Report Details
        COUNT(DISTINCT r.report_id) AS raised_reports,
        COUNT(DISTINCT CASE WHEN r.status_id = 1 THEN r.report_id END) AS active_reports,
        COUNT(DISTINCT CASE WHEN r.status_id = 1 AND r.process_status_id != 15 THEN r.report_id END) AS pending_reports,
        COUNT(DISTINCT CASE WHEN r.process_status_id = 15 THEN r.report_id END) AS closed_reports,

        -- Reimbursement Details (exp_catg_id = 1)
        COUNT(DISTINCT CASE WHEN t.exp_catg_id = 1 THEN t.ticket_id END) AS re_raised_tickets,
        COUNT(DISTINCT CASE WHEN t.exp_catg_id = 1 AND t.status_id = 1 THEN t.ticket_id END) AS re_active_tickets,
        COUNT(DISTINCT CASE WHEN t.exp_catg_id = 1 AND t.status_id = 1 AND t.process_status_id != 15 THEN t.ticket_id END) AS re_pending_tickets,
        COUNT(DISTINCT CASE WHEN t.exp_catg_id = 1 AND t.process_status_id = 15 THEN t.ticket_id END) AS re_closed_tickets,

        -- Procurement Details (exp_catg_id = 2)
        COUNT(DISTINCT CASE WHEN t.exp_catg_id = 2 THEN t.ticket_id END) AS pro_raised_tickets,
        COUNT(DISTINCT CASE WHEN t.exp_catg_id = 2 AND t.status_id = 1 THEN t.ticket_id END) AS pro_active_tickets,
        COUNT(DISTINCT CASE WHEN t.exp_catg_id = 2 AND t.status_id = 1 AND t.process_status_id != 15 THEN t.ticket_id END) AS pro_pending_tickets,
        COUNT(DISTINCT CASE WHEN t.exp_catg_id = 2 AND t.process_status_id = 15 THEN t.ticket_id END) AS pro_closed_tickets,

        -- Advance Details (exp_catg_id = 3)
        COUNT(DISTINCT CASE WHEN t.exp_catg_id = 3 THEN t.ticket_id END) AS adv_raised_tickets,
        COUNT(DISTINCT CASE WHEN t.exp_catg_id = 3 AND t.status_id = 1 THEN t.ticket_id END) AS adv_active_tickets,
        COUNT(DISTINCT CASE WHEN t.exp_catg_id = 3 AND t.status_id = 1 AND t.process_status_id != 15 THEN t.ticket_id END) AS adv_pending_tickets,
        COUNT(DISTINCT CASE WHEN t.exp_catg_id = 3 AND t.process_status_id = 15 THEN t.ticket_id END) AS adv_closed_tickets

    FROM reports r
    LEFT JOIN tickets t ON r.report_id = t.report_id
    WHERE r.user_id = p_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_INSERT_USER_BANK_DETAILS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Ticketing`@`%` PROCEDURE `USP_INSERT_USER_BANK_DETAILS`(
    IN p_updated_by INT,
    IN p_employee_number varchar(50),
    IN p_employee_name_on_bank VARCHAR(100),
    IN p_employee_bank_name VARCHAR(100),
    IN p_employee_account_number VARCHAR(20),
    IN p_employee_IFSC VARCHAR(50)
)
BEGIN
    DECLARE v_employee_id INT;
    DECLARE v_user_id INT;
    DECLARE v_bank_id INT;
    DECLARE v_existing_bank_id INT;
    DECLARE v_existing_account_number VARCHAR(20);
    DECLARE v_existing_IFSC VARCHAR(50);
    DECLARE v_existing_name_on_bank VARCHAR(100);
    DECLARE v_existing_bank_name VARCHAR(100);

    proc_end: BEGIN

        -- Fetch employee_id
        SELECT employee_id INTO v_employee_id
        FROM employees
        WHERE employee_number = p_employee_number;

        -- If employee not found
        IF v_employee_id IS NULL THEN
            SELECT CONCAT('Employee with employee_number ', p_employee_number, ' not found') AS message, FALSE AS status;
            LEAVE proc_end;
        END IF;

        -- Get user_id and existing bank_id
        SELECT user_id, bank_id INTO v_user_id, v_existing_bank_id
        FROM users
        WHERE employee_id = v_employee_id;

        -- Get latest bank details
        SELECT bank_id, name_on_bank, bank_name, account_number, IFSC
        INTO v_bank_id, v_existing_name_on_bank, v_existing_bank_name, v_existing_account_number, v_existing_IFSC
        FROM user_bank
        WHERE user_id = v_user_id and bank_id = v_existing_bank_id
        ORDER BY created_at DESC
        LIMIT 1;

        -- Case 1: No Existing Bank Data
        IF v_bank_id IS NULL THEN

            INSERT INTO user_bank (user_id, name_on_bank, bank_name, account_number, IFSC, status_id, created_at)
            VALUES (v_user_id, p_employee_name_on_bank, p_employee_bank_name, p_employee_account_number, p_employee_IFSC, 1, NOW());

            SET v_bank_id = LAST_INSERT_ID();

            UPDATE users 
            SET bank_id = v_bank_id 
            WHERE user_id = v_user_id;

            UPDATE employees
            SET employee_name_on_bank = p_employee_name_on_bank,
                employee_bank_name = p_employee_bank_name,
                employee_account_number = p_employee_account_number,
                employee_IFSC = p_employee_IFSC
            WHERE employee_id = v_employee_id;

        -- Case 2: Existing Account Number Same
        ELSEIF v_existing_account_number = p_employee_account_number THEN

            -- Check if other details are different
            IF v_existing_name_on_bank <> p_employee_name_on_bank
               OR v_existing_bank_name <> p_employee_bank_name
               OR v_existing_IFSC <> p_employee_IFSC THEN

                -- Insert old record in history
                INSERT INTO employee_history (employee_id, updated_by, updated_at, employee_name_on_bank, employee_bank_name, employee_account_number, employee_IFSC)
                VALUES (v_employee_id, p_updated_by, NOW(), v_existing_name_on_bank, v_existing_bank_name, v_existing_account_number, v_existing_IFSC);

                -- Update existing user_bank record
                UPDATE user_bank
                SET name_on_bank = p_employee_name_on_bank,
                    bank_name = p_employee_bank_name,
                    IFSC = p_employee_IFSC,
                    updated_at = NOW()
                WHERE bank_id = v_bank_id;

                -- Update employees table
                UPDATE employees
                SET employee_name_on_bank = p_employee_name_on_bank,
                    employee_bank_name = p_employee_bank_name,
                    employee_IFSC = p_employee_IFSC
                WHERE employee_id = v_employee_id;

            ELSE
                -- Case 3: Everything is same → No Action
                SELECT 'Bank Details already exist. No changes done.' AS message, TRUE AS status;
                LEAVE proc_end;
            END IF;

        -- Case 4: Different Account Number
        ELSE

            INSERT INTO user_bank (user_id, name_on_bank, bank_name, account_number, IFSC, status_id, created_at)
            VALUES (v_user_id, p_employee_name_on_bank, p_employee_bank_name, p_employee_account_number, p_employee_IFSC, 1, NOW());

            SET v_bank_id = LAST_INSERT_ID();

            INSERT INTO employee_history (employee_id, updated_by, updated_at, employee_name_on_bank, employee_bank_name, employee_account_number, employee_IFSC)
            VALUES (v_employee_id, p_updated_by, NOW(), v_existing_name_on_bank, v_existing_bank_name, v_existing_account_number, v_existing_IFSC);

            INSERT INTO user_history (user_id, bank_id, updated_at, updated_by)
            VALUES (v_user_id, v_existing_bank_id, NOW(), p_updated_by);

            UPDATE users 
            SET bank_id = v_bank_id 
            WHERE user_id = v_user_id;

            UPDATE employees
            SET employee_name_on_bank = p_employee_name_on_bank,
                employee_bank_name = p_employee_bank_name,
                employee_account_number = p_employee_account_number,
                employee_IFSC = p_employee_IFSC
            WHERE employee_id = v_employee_id;

        END IF;

        -- Final Success Message
        SELECT 'Employee Bank data inserted/updated successfully' AS message, TRUE AS status;

    END proc_end;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_MARK_TICKETS_DELETED_BY_REPORT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Ticketing`@`%` PROCEDURE `USP_MARK_TICKETS_DELETED_BY_REPORT`(
    IN p_user_id INT,
    IN p_report_id INT,
    IN p_remarks TEXT
)
BEGIN
    DECLARE report_exists INT DEFAULT 0;

    -- Step 1: Check if report has status_id = 3
    SELECT COUNT(*) INTO report_exists
    FROM reports
    WHERE report_id = p_report_id AND status_id = 3;

    IF report_exists > 0 THEN

        -- Step 2: Insert into ticket_logs for related tickets before update
        INSERT INTO ticket_logs (
            ticket_id,
            pre_status_id,
            aft_status_id,
            created_by,
            created_at,
            remarks
        )
        SELECT 
            t.ticket_id,
            t.status_id AS pre_status_id,
            3 AS aft_status_id,
            p_user_id,
            NOW(),
            p_remarks
        FROM tickets t
        WHERE t.report_id = p_report_id AND t.status_id <> 3;

        -- Step 3: Update tickets status to 3 (Deleted)
        UPDATE tickets
        SET status_id = 3
        WHERE report_id = p_report_id AND status_id <> 3;

        -- Step 4: Return success
        SELECT 'Deletion Successful' AS Message, 1 AS Success;

    ELSE
        -- Report not marked as deleted
        SELECT 'Failed to delete' AS Message, 0 AS Success;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_REVERT_REPORT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Ticketing`@`%` PROCEDURE `USP_REVERT_REPORT`(
    IN p_user_id INT,
    IN p_report_id INT,
    IN p_remarks TEXT
)
BEGIN
    DECLARE report_pre_process_id INT;

    -- Step 1: Get previous process status for the report
    SELECT process_status_id INTO report_pre_process_id
    FROM reports
    WHERE report_id = p_report_id AND status_id = 1;

    -- Step 2: Prepare eligible ticket_ids (those that do NOT have granted_amount)
    DROP TEMPORARY TABLE IF EXISTS temp_ticket_ids;

    CREATE TEMPORARY TABLE temp_ticket_ids (
        ticket_id INT,
        ticket_pre_process_id INT
    );

    INSERT INTO temp_ticket_ids (ticket_id, ticket_pre_process_id)
	SELECT t.ticket_id, t.process_status_id
	FROM tickets t
	WHERE t.report_id = p_report_id
	  AND t.status_id = 1
	  AND t.granted_amount IS NULL
	  AND NOT EXISTS (
		  SELECT 1
		  FROM payments p
		  WHERE p.ticket_id = t.ticket_id
	  );

    -- Step 3: If eligible tickets found, proceed with update
    IF EXISTS (SELECT 1 FROM temp_ticket_ids) THEN

        -- Step 4: Nullify fields in re_ticket_details
        UPDATE re_ticket_details rtd
        JOIN temp_ticket_ids tmp ON rtd.ticket_id = tmp.ticket_id
        SET rtd.m_granted_amount = NULL,
            rtd.f_granted_amount = NULL,
            rtd.f_granted_by = NULL;

        -- Step 5: Update process_status_id for relevant tickets
        UPDATE tickets t
        JOIN temp_ticket_ids tmp ON t.ticket_id = tmp.ticket_id
        SET t.process_status_id = 25;

        -- Step 6: Update report process_status_id
        UPDATE reports
        SET process_status_id = 25,
			manager_id = NULL
        WHERE report_id = p_report_id;

        -- Step 7: Insert report log
        INSERT INTO report_logs (
            report_id, pre_process_id, aft_process_id,
            level_id, action_id, created_by, created_at, remarks
        )
        VALUES (
            p_report_id, report_pre_process_id, 25,
            1, 25, p_user_id, NOW(), p_remarks
        );

        -- Step 8: Insert ticket logs for each ticket
        INSERT INTO ticket_logs (
            ticket_id, pre_process_id, aft_process_id,
            level_id, action_id, created_by, created_at, remarks
        )
        SELECT
            tmp.ticket_id, tmp.ticket_pre_process_id, 25,
            1, 25, p_user_id, NOW(), p_remarks
        FROM temp_ticket_ids tmp;

        -- Step 9: Return success message
        SELECT 'Report Reverted Successfully' AS Message, 1 AS Success;

    ELSE
        -- No eligible tickets to revert
        SELECT 'Report Reversion Failed' AS Message, 0 AS Success;
    END IF;

    -- Final cleanup
    DROP TEMPORARY TABLE IF EXISTS temp_ticket_ids;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_UNDO_TALLY_DATA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Ticketing`@`%` PROCEDURE `USP_UNDO_TALLY_DATA`(
    IN p_user_id INT,
    IN p_tally_booking_id TEXT,
    IN p_updated_remarks TEXT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Data Undo Failed' AS Message, 0 AS Success;
    END;

    export_proc: BEGIN
        START TRANSACTION;

        -- Step 1: Create temp table for booking IDs
        DROP TEMPORARY TABLE IF EXISTS temp_booking_ids;
        CREATE TEMPORARY TABLE temp_booking_ids (
            id INT PRIMARY KEY
        );

        -- Step 2: Parse comma-separated IDs
        SET @input := p_tally_booking_id;
        WHILE LENGTH(TRIM(@input)) > 0 DO
            SET @next_comma := LOCATE(',', @input);
            IF @next_comma > 0 THEN
                INSERT INTO temp_booking_ids (id)
                VALUES (CAST(TRIM(SUBSTRING(@input, 1, @next_comma - 1)) AS UNSIGNED));
                SET @input := SUBSTRING(@input, @next_comma + 1);
            ELSE
                INSERT INTO temp_booking_ids (id)
                VALUES (CAST(TRIM(@input) AS UNSIGNED));
                SET @input := '';
            END IF;
        END WHILE;

        -- Step 3: Validate eligible records
        IF (
            SELECT COUNT(*)
            FROM tally_booking tb
            JOIN temp_booking_ids tbi ON tb.tally_booking_id = tbi.id
            WHERE tb.status_id = 1 AND tb.process_status_id = 24
        ) = 0 THEN
            ROLLBACK;
            SELECT 'No eligible records to process' AS Message, 0 AS Success;
            LEAVE export_proc;
        END IF;

        -- Step 4: Update tally_payment
        UPDATE tally_payment tp
        JOIN (
            SELECT tb.tally_pay_id, SUM(tb.paid_amount) AS deduction
            FROM tally_booking tb
            JOIN temp_booking_ids tbi ON tb.tally_booking_id = tbi.id
            WHERE tb.status_id = 1 AND tb.process_status_id = 24
            GROUP BY tb.tally_pay_id
        ) tbd ON tp.tally_pay_id = tbd.tally_pay_id
        SET 
            tp.amount = tp.amount - tbd.deduction,
            tp.updated_by = p_user_id,
            tp.updated_at = NOW(),
            tp.update_remarks = p_updated_remarks;

        -- Step 5: Create temp_bank_summary with actual paid bank and conditional bank_ledger
		DROP TEMPORARY TABLE IF EXISTS temp_bank_summary;
		CREATE TEMPORARY TABLE temp_bank_summary AS
		SELECT 
			tpb.tally_pay_bank_id,
			p.paid_from_bank AS bank_id,
			SUM(tb.paid_amount) AS payment_grand_total,
			CASE 
				WHEN p.route_id IN (1, 3) THEN ob_from.bank_ledger 
				ELSE NULL 
			END AS bank_ledger
		FROM tally_booking tb
		JOIN temp_booking_ids tbi ON tb.tally_booking_id = tbi.id
		JOIN payments p ON tb.payment_id = p.payment_id
		LEFT JOIN organization_bank ob_from ON p.paid_from_bank = ob_from.org_bank_id
		JOIN tally_pay_bank tpb ON tb.tally_pay_id = tpb.tally_pay_id 
								 AND p.paid_from_bank = tpb.bank_id
		WHERE tb.status_id = 1 AND tb.process_status_id = 24
		GROUP BY tpb.tally_pay_bank_id, p.paid_from_bank, 
        CASE 
        WHEN p.route_id IN (1, 3) THEN ob_from.bank_ledger 
        ELSE NULL 
    END;


		-- Step 6: Update tally_pay_bank using matched bank_id and tally_pay_bank_id
		UPDATE tally_pay_bank tpb
		JOIN temp_bank_summary tbs 
			ON tpb.tally_pay_bank_id = tbs.tally_pay_bank_id
			AND tpb.bank_id = tbs.bank_id
		SET 
			tpb.amount = tpb.amount - tbs.payment_grand_total,
			tpb.updated_by = p_user_id,
			tpb.updated_at = NOW(),
			tpb.update_remarks = p_updated_remarks;


        -- Step 7: Update tally_booking
        UPDATE tally_booking tb
        JOIN temp_booking_ids tbi ON tb.tally_booking_id = tbi.id
        SET 
            tb.updated_by = p_user_id,
            tb.updated_at = NOW(),
            tb.update_remarks = p_updated_remarks,
            tb.process_status_id = 23,
            tb.voucher_type = NULL,
            tb.`dr/cr` = NULL;

        COMMIT;

        SELECT 'Data Undo Successfully' AS Message, 1 AS Success;

        -- Cleanup
        DROP TEMPORARY TABLE IF EXISTS temp_booking_ids;
        DROP TEMPORARY TABLE IF EXISTS temp_bank_summary;
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_UPDATE_REPORT_CLOSE_STATUS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Ticketing`@`%` PROCEDURE `USP_UPDATE_REPORT_CLOSE_STATUS`(
    IN p_report_id INT
)
BEGIN
    DECLARE v_all_closed INT DEFAULT 0;
    
    -- Check if all tickets for the given report_id have process_status_id = 15
    SELECT 
        COUNT(*) = SUM(CASE WHEN process_status_id = 15 THEN 1 ELSE 0 END)
    INTO v_all_closed
    FROM tickets
    WHERE report_id = p_report_id;

    -- Update reports only if all tickets have process_status_id = 15
    IF v_all_closed = 1 THEN
        UPDATE reports 
        SET process_status_id = 15
        WHERE report_id = p_report_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-31 17:56:46
