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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_cost_center`
--

LOCK TABLES `academic_cost_center` WRITE;
/*!40000 ALTER TABLE `academic_cost_center` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost_center`
--

LOCK TABLES `cost_center` WRITE;
/*!40000 ALTER TABLE `cost_center` DISABLE KEYS */;
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
  `employee_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
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
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`employee_history_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `employee_history_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_history`
--

LOCK TABLES `employee_history` WRITE;
/*!40000 ALTER TABLE `employee_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `status_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'000010782',NULL,NULL,NULL,'Deepu Kumar',NULL,'deepu.kumar@dfmail.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'91-9065446115',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Software Development Engineer 1',NULL,'000010725','Gautham V Shanbhogue',NULL,NULL,NULL,'L2','L2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DF -Technology','Deshpande Foundation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DCSE Building, B, V.B. Campus, Vidya Nagar,','Deepu Kumar','Canara Bank','3543912655','CBIN0284137',NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `entities` VALUES (1,1,'Deshpande Foundation','DCSE Building, B, V.B. Campus, Vidya Nagar, Hubballi, Karnataka 580031','DF',1,NULL,'Deshpande Foundation'),(2,1,'Deshpande Educational Trust','9338+8JV, Hosur - Unkal Bypass Rd, Chetana Colony, Vidya Nagar, Hubballi, Karnataka 580021','DE',1,NULL,'Deshpande Skilling'),(3,1,'Foundation for Sandboxstartup Initiatives','Foundation for Sandboxstartup Initiatives, Gokul Rd, next to International Airport, opposite Gokul, Gokul, Hubballi, Karnataka 580030','DS',1,NULL,'Deshpande Startup'),(4,1,'USF','DCSE Building, B, V.B. Campus, Vidya Nagar, Hubballi, Karnataka 580031','DF',1,NULL,'Under Deshpande Foundation');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_details`
--

LOCK TABLES `login_details` WRITE;
/*!40000 ALTER TABLE `login_details` DISABLE KEYS */;
INSERT INTO `login_details` VALUES (1,1,'google','2025-06-25 11:46:51','2025-06-25 11:46:52',5),(2,1,'google','2025-06-25 12:00:38',NULL,1);
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
INSERT INTO `menus` VALUES (1,NULL,'Home',NULL,'01',1,1,'home','Home Page'),(2,NULL,'Reports',NULL,'02',1,1,'reports','It will contain all the Reports of that user'),(3,NULL,'HRPortal',NULL,'03',1,1,'hrportal','HR will Upload Employee details in the system.'),(4,NULL,'My Team',NULL,'04',1,1,'myteam','This is only for Manager and contains the team reports. '),(5,NULL,'Finance Approval',NULL,'05',1,1,'financeapproval','For Finance team'),(6,NULL,'Operations',NULL,'06',1,1,'operations','For Operations team.'),(7,NULL,'Config',NULL,'07',1,1,'config','To manage the Org and its Entities. Only for Admin'),(8,NULL,'Permission',NULL,'08',1,1,'permission','To give access to any specific role to any specific person. Only for Admin'),(9,NULL,'Contact Us',NULL,'09',1,1,'contactus','Contact Details for the Tech Support'),(10,NULL,'Finance Panel',NULL,'05',1,1,'financepanel','Holds tickets waiting for payments, bank update,closed'),(11,NULL,'Summary',NULL,'06',1,1,'summary','To download summary of reports and tickets');
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_bank`
--

LOCK TABLES `organization_bank` WRITE;
/*!40000 ALTER TABLE `organization_bank` DISABLE KEYS */;
INSERT INTO `organization_bank` VALUES (1,1,1,'FCRA','DESHPANDE','HDFC BANK','50100114012217','Deshpande Foundation','HDFC0000254','HDFC Bank A/c No-50100114012217','Tb Revankar Complex,Vivekanand Hospital Road,Hubli, karnataka- 580029','9343982426','Krishnag Desai',NULL,NULL,2,'2025-06-24 13:17:48',NULL),(2,1,1,'FCRA','DESHPANDE','ICICI BANK','015701014774','Deshpande Foundation','ICIC0000157','ICICI Bank A/c No-015701014774','Icici Bank Ltd, Eureka Junction, Travellers Bungalow Road, Hubli, Karnataka, 580029','8971912459','Vinay Joshi',NULL,NULL,2,'2025-06-24 13:17:48',NULL),(3,1,1,'FCRA','DESHPANDE','RATNAKAR BANK LTD','309023289619','Deshpande Foundation','RATN0000056','RBL Bank A/c NO.-309023289619','Nazare Complex, Tikare Road, Line Bazar, Dharwad 580001','9538926434','Anandkumar Chimmalagi','dfpayments@dfmail.org','Payment Type,Cust Ref Number,Source Account Number,Source Narration,Destination Account Number,Currency,Amount,Destination Narration,Destination bank,Destination Bank IFS Code,Beneficiary Name,Beneficiary Account Type,Email ',1,'2025-06-24 13:17:48',NULL),(4,1,1,'FCRA','DESHPANDE','Kotak BANK','6411841218','Deshpande Foundation','KKBK0000446','Kotak Bank A/c No.-6411841218','Club Road, Corporation Ward No.46, Old No.1, Hubli Dharwad-500 020, Karnataka','6364570480','Muzammil Ahmedb','dfpayments@dfmail.org','Client_Code,Product_Code,Payment_Type,Payment_Ref_No.,Payment_Date,Instrument,Date,Dr_Ac_No,Amount,Bank_Code_Indicator,Beneficiary_Code,Beneficiary_Name,Beneficiary_Bank,Beneficiary_Branch / IFSC Code,Beneficiary_Acc_No,Location,Print_Location,Instrument_Number,Ben_Add1,Ben_Add2,Ben_Add3,Ben_Add4,Beneficiary_Email,Beneficiary_Mobile,Debit_Narration,Credit_Narration,Payment Details 1,Payment Details 2,Payment Details 3,Payment Details 4,Enrichment_1,Enrichment_2,Enrichment_3,Enrichment_4,Enrichment_5,Enrichment_6,Enrichment_7,Enrichment_8,Enrichment_9,Enrichment_10,Enrichment_11,Enrichment_12,Enrichment_13,Enrichment_14,Enrichment_15,Enrichment_16,Enrichment_17,Enrichment_18,Enrichment_19,Enrichment_20',1,'2025-06-24 13:17:48',NULL),(5,1,1,'FCRA','DESHPANDE','YES BANK','024994600000027','Deshpande Foundation','YESB0000249','Yes Bank A/c No-024994600000027','Ground Floor,Svb City Centre Club Road,Hubli Karnataka 580020','9986123798','Firozkhan Pathan',NULL,NULL,2,'2025-06-24 13:17:48',NULL),(6,1,1,'FCRA','DESHPANDE','SBI BANK','33058846735','Deshpande Foundation','SBIN0009297','State Bank of India A/c No-33058846735','Mahila Vidyapeeth Complex, Vidyanagar, Distt. Dharwar, Karnataka 580021','9342893567','Jayshree',NULL,NULL,2,'2025-06-24 13:17:48',NULL),(7,1,1,'FCRA','DESHPANDE','SBI BANK','40095443444','Deshpande Foundation','SBIN0000691','State Bank of India A/c No 40095443444-Main FCRA','\"11Sansad Marg, New Delhi 110 001\nState: Delhi\"','9711906089','Mohammed Shahid',NULL,NULL,2,'2025-06-24 13:17:48',NULL),(8,1,1,'Non-FCRA','DESHPANDE','HDFC BANK','50100462351706','Deshpande Foundation','HDFC0006090','HDFC Bank A/c No: 50100462351706','Gr Flr Anusharan Arcade Nagshanti Building Shirur Park Road Vidyanagari Hubli Karnataka 580030','9343982426','Krishnag Desai',NULL,NULL,2,'2025-06-24 13:17:48',NULL),(9,1,1,'Non-FCRA','DESHPANDE','RATNAKAR BANK LTD','309003312050','Deshpande Foundation','RATN0000056','RBL Bank A/c No.-309003312050','Nazare Complex, Tikare Road, Line Bazar, Dharwad 580001','9538926434','Anandkumar Chimmalagi','dfpayments@dfmail.org','Payment Type,Cust Ref Number,Source Account Number,Source Narration,Destination Account Number,Currency,Amount,Destination Narration,Destination bank,Destination Bank IFS Code,Beneficiary Name,Beneficiary Account Type,Email ',1,'2025-06-24 13:17:48',NULL),(10,1,1,'Non-FCRA','DESHPANDE','SBI BANK','37058263175','Deshpande Foundation','SBIN0009297','SBI Bank A/c No.-37058263175','Mahila Vidyapeeth Complex, Vidyanagar, Distt. Dharwar, Karnataka 580021','9342893567','Jayshree',NULL,NULL,2,'2025-06-24 13:17:48',NULL),(11,1,2,'Non-FCRA','DESHTI','Canara Bank','1628101016715','Deshpande Education Trust','CNRB0001628','Canara Bank SB A/c No 1628101016715-EIR','1st Floor, Mirjankar Building, Vidyanagar, P B Road, Hubli, Karnataka - 580 021','+91 94498 67176',NULL,'cb1628@canarabank.com',NULL,2,'2025-06-24 13:17:48',NULL),(12,1,2,'OD','DESHTI','Canara Bank','1628257005280','Deshpande Education Trust','CNRB0001628','Canara Bank OD A/c.No.1628257005280','1st Floor, Mirjankar Building, Vidyanagar, P B Road, Hubli, Karnataka - 580 021','+91 94498 67176',NULL,'cb1628@canarabank.com',NULL,2,'2025-06-24 13:17:48',NULL),(13,1,2,'Non-FCRA','DESHTI','State Bank of India','33058845324','Deshpande Education Trust','SBIN0009297','SBI Bank A/c No: 33058845324 HBL','Vidyanagar, Hubballi','+91 93428 93567',NULL,'SBI.09297@sbi.co.in',NULL,2,'2025-06-24 13:17:48',NULL),(14,1,2,'Non-FCRA','DESHTI','State Bank of India','37592898899','Deshpande Education Trust','SBIN0009297','SBI Bank A/c No: 37592898899 AP','Vidyanagar, Hubballi','+91 93428 93567',NULL,'SBI.09297@sbi.co.in',NULL,2,'2025-06-24 13:17:48',NULL),(15,1,2,'Non-FCRA','DESHTI','State Bank of India','37592924740','Deshpande Education Trust','SBIN0009297','SBI Bank A/c No: 37592924740 KKT','Vidyanagar, Hubballi','+91 93428 93567',NULL,'SBI.09297@sbi.co.in',NULL,2,'2025-06-24 13:17:48',NULL),(16,1,2,'FCRA','DESHTI','State Bank of India','40095732865','Deshpande Education Trust','SBIN0000691','SBI Bank A/c No: 40095732865(FCRA)','Parliment Street, N. D. Main Branch, New Delhi','8026599990',NULL,'fcrasupport9.00691@sbi.co.in',NULL,2,'2025-06-24 13:17:48',NULL),(17,1,2,'FCRA','DESHTI','Kotak Mahindra','714421269','Deshpande Education Trust','KKBK0000446','Kotak Bank A/c No:0714421269 (FCRA)','Club Road, Hubballi','+91 63645 70480',NULL,'detpayments@dfmail.org','Client_Code,Product_Code,Payment_Type,Payment_Ref_No.,Payment_Date,Instrument,Date,Dr_Ac_No,Amount,Bank_Code_Indicator,Beneficiary_Code,Beneficiary_Name,Beneficiary_Bank,Beneficiary_Branch / IFSC Code,Beneficiary_Acc_No,Location,Print_Location,Instrument_Number,Ben_Add1,Ben_Add2,Ben_Add3,Ben_Add4,Beneficiary_Email,Beneficiary_Mobile,Debit_Narration,Credit_Narration,Payment Details 1,Payment Details 2,Payment Details 3,Payment Details 4,Enrichment_1,Enrichment_2,Enrichment_3,Enrichment_4,Enrichment_5,Enrichment_6,Enrichment_7,Enrichment_8,Enrichment_9,Enrichment_10,Enrichment_11,Enrichment_12,Enrichment_13,Enrichment_14,Enrichment_15,Enrichment_16,Enrichment_17,Enrichment_18,Enrichment_19,Enrichment_20',1,'2025-06-24 13:17:48',NULL),(18,1,2,'Non-FCRA','DESHTI','Kotak Mahindra','746116324','Deshpande Education Trust','KKBK0000446','Kotak Bank A/c No:0746116324 (Non FCRA)','Club Road, Hubballi','+91 63645 70480',NULL,'detpayments@dfmail.org','Client_Code,Product_Code,Payment_Type,Payment_Ref_No.,Payment_Date,Instrument,Date,Dr_Ac_No,Amount,Bank_Code_Indicator,Beneficiary_Code,Beneficiary_Name,Beneficiary_Bank,Beneficiary_Branch / IFSC Code,Beneficiary_Acc_No,Location,Print_Location,Instrument_Number,Ben_Add1,Ben_Add2,Ben_Add3,Ben_Add4,Beneficiary_Email,Beneficiary_Mobile,Debit_Narration,Credit_Narration,Payment Details 1,Payment Details 2,Payment Details 3,Payment Details 4,Enrichment_1,Enrichment_2,Enrichment_3,Enrichment_4,Enrichment_5,Enrichment_6,Enrichment_7,Enrichment_8,Enrichment_9,Enrichment_10,Enrichment_11,Enrichment_12,Enrichment_13,Enrichment_14,Enrichment_15,Enrichment_16,Enrichment_17,Enrichment_18,Enrichment_19,Enrichment_20',1,'2025-06-24 13:17:48',NULL),(19,1,2,'FCRA','DESHTI','RBL Bank Ltd','309023236264','Deshpande Education Trust','RATN0000056',NULL,'Jubilee Circle, Dharwad','+91 95389 26434',NULL,'anand.chimmalagi@rblbank.com','Payment Type,Cust Ref Number,Source Account Number,Source Narration,Destination Account Number,Currency,Amount,Destination Narration,Destination bank,Destination Bank IFS Code,Beneficiary Name,Beneficiary Account Type,Email ',1,'2025-06-24 13:17:48',NULL),(20,1,2,'Non-FCRA','DESHTI','RBL Bank Ltd','309006956664','Deshpande Education Trust','RATN0000056','RBL Bank A/c No: 309006956664','Jubilee Circle, Dharwad','+91 95389 26434',NULL,'detpayments@dfmail.org','Payment Type,Cust Ref Number,Source Account Number,Source Narration,Destination Account Number,Currency,Amount,Destination Narration,Destination bank,Destination Bank IFS Code,Beneficiary Name,Beneficiary Account Type,Email ',1,'2025-06-24 13:17:48',NULL),(21,1,2,'OD','DESHTI','RBL Bank Ltd','609001110406','Deshpande Education Trust','RATN0000056',NULL,'Jubilee Circle, Dharwad','+91 95389 26434',NULL,'anand.chimmalagi@rblbank.com','Payment Type,Cust Ref Number,Source Account Number,Source Narration,Destination Account Number,Currency,Amount,Destination Narration,Destination bank,Destination Bank IFS Code,Beneficiary Name,Beneficiary Account Type,Email ',1,'2025-06-24 13:17:48',NULL),(22,1,2,'CSR','DESHTI','HDFC','50200105967093','Deshpande Education Trust','HDFC0006090','HDFC Bank A/C No : 50200105967093','Vidyanagar Hubli','+91 93439 82426',NULL,'krishnag.desai@hdfcbank.com',NULL,2,'2025-06-24 13:17:48',NULL),(23,1,3,'FCRA',NULL,'RBL Bank Ltd','309023300170','Foundation for Sandboxstartup Initiatives','RATN0000056',NULL,'Jubilee Circle, Dharwad','+91 95389 26434',NULL,'anand.chimmalagi@rblbank.com','Payment Type,Cust Ref Number,Source Account Number,Source Narration,Destination Account Number,Currency,Amount,Destination Narration,Destination bank,Destination Bank IFS Code,Beneficiary Name,Beneficiary Account Type,Email ',1,'2025-06-24 13:17:48',NULL),(24,1,3,'FCRA',NULL,'RBL Bank Ltd','300000580030','Foundation for Sandboxstartup Initiatives','RATN0000056',NULL,'Jubilee Circle, Dharwad','+91 95389 26434',NULL,'anand.chimmalagi@rblbank.com','Payment Type,Cust Ref Number,Source Account Number,Source Narration,Destination Account Number,Currency,Amount,Destination Narration,Destination bank,Destination Bank IFS Code,Beneficiary Name,Beneficiary Account Type,Email ',1,'2025-06-24 13:17:48',NULL),(25,1,3,'FCRA',NULL,'State Bank of India','40095425888','Foundation for Sandboxstartup Initiatives','SBIN0009297',NULL,'Vidyanagar, Hubballi','+91 93428 93567',NULL,'SBI.09297@sbi.co.in',NULL,2,'2025-06-24 13:17:48',NULL),(26,1,3,'Non-FCRA',NULL,'Canara Bank','1628101016715','Foundation for Sandboxstartup Initiatives','CNRB0001628','Canara Bank SB A/c No 1628101016715-EIR','1st Floor, Mirjankar Building, Vidyanagar, P B Road, Hubli, Karnataka - 580 021','+91 94498 67176',NULL,'cb1628@canarabank.com',NULL,2,'2025-06-24 13:17:48',NULL),(27,1,3,'Non-FCRA',NULL,'RBL Bank Ltd','309006967837','Foundation for Sandboxstartup Initiatives','RATN0000056',NULL,'Jubilee Circle, Dharwad','+91 95389 26434',NULL,'anand.chimmalagi@rblbank.com','Payment Type,Cust Ref Number,Source Account Number,Source Narration,Destination Account Number,Currency,Amount,Destination Narration,Destination bank,Destination Bank IFS Code,Beneficiary Name,Beneficiary Account Type,Email ',1,'2025-06-24 13:17:48',NULL),(28,1,3,'Non-FCRA',NULL,'State Bank of India','35823266728','Foundation for Sandboxstartup Initiatives','SBIN0009297','State Bank of India C.A/c.No.35823266728-Statutory','Vidyanagar, Hubballi','+91 93428 93567',NULL,'SBI.09297@sbi.co.in',NULL,2,'2025-06-24 13:17:48',NULL),(29,1,3,'Non-FCRA',NULL,'State Bank of India','35834648411','Foundation for Sandboxstartup Initiatives','SBIN0009297','State Bank of India SB A/c. No.35834648411-Accelara','Vidyanagar, Hubballi','+91 93428 93567',NULL,'SBI.09297@sbi.co.in',NULL,2,'2025-06-24 13:17:48',NULL),(30,1,3,'Non-FCRA',NULL,'Bank of Baroda','07790100021289','Foundation for Sandboxstartup Initiatives',NULL,'Bank of Baroda SB A/c. No. 07790100021289-Prayas',NULL,NULL,NULL,NULL,NULL,2,'2025-06-24 13:17:48',NULL),(31,1,3,'Non-FCRA',NULL,'Union Bank of India','066922010001223','Foundation for Sandboxstartup Initiatives',NULL,'Union Bank of India SB.A/c.No.066922010001223-SISFS',NULL,NULL,NULL,NULL,NULL,2,'2025-06-24 13:17:48',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_type`
--

LOCK TABLES `payment_type` WRITE;
/*!40000 ALTER TABLE `payment_type` DISABLE KEYS */;
INSERT INTO `payment_type` VALUES (1,'NFT'),(2,'IMPS'),(3,'RTGS'),(4,'IFT');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_ticket_details`
--

LOCK TABLES `re_ticket_details` WRITE;
/*!40000 ALTER TABLE `re_ticket_details` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reimb_others`
--

LOCK TABLES `reimb_others` WRITE;
/*!40000 ALTER TABLE `reimb_others` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reimbursement_history`
--

LOCK TABLES `reimbursement_history` WRITE;
/*!40000 ALTER TABLE `reimbursement_history` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_history`
--

LOCK TABLES `report_history` WRITE;
/*!40000 ALTER TABLE `report_history` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_logs`
--

LOCK TABLES `report_logs` WRITE;
/*!40000 ALTER TABLE `report_logs` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_menu`
--

LOCK TABLES `role_menu` WRITE;
/*!40000 ALTER TABLE `role_menu` DISABLE KEYS */;
INSERT INTO `role_menu` VALUES (1,1,1,1),(2,2,1,1),(3,3,1,1),(4,4,1,1),(5,5,1,1),(6,6,1,1),(7,7,1,1),(8,1,2,1),(9,2,2,1),(10,3,2,1),(11,4,2,1),(12,5,2,1),(13,6,2,1),(14,7,2,1),(15,1,9,1),(16,2,9,1),(17,3,9,1),(18,4,9,1),(19,5,9,1),(20,6,9,1),(21,7,9,1),(22,6,3,1),(23,8,4,1),(24,3,5,1),(25,4,5,1),(26,5,6,1),(27,2,3,1),(28,2,7,1),(29,1,3,1),(30,1,4,1),(31,1,5,1),(32,1,6,1),(33,1,7,1),(34,1,8,1),(35,8,1,1),(36,8,2,1),(37,8,9,1),(38,4,10,1),(39,1,10,1),(40,1,11,1),(41,2,11,1),(42,3,11,1),(43,4,11,1),(44,3,1,1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tally_booking`
--

LOCK TABLES `tally_booking` WRITE;
/*!40000 ALTER TABLE `tally_booking` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tally_pay_bank`
--

LOCK TABLES `tally_pay_bank` WRITE;
/*!40000 ALTER TABLE `tally_pay_bank` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tally_payment`
--

LOCK TABLES `tally_payment` WRITE;
/*!40000 ALTER TABLE `tally_payment` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_history`
--

LOCK TABLES `ticket_history` WRITE;
/*!40000 ALTER TABLE `ticket_history` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_logs`
--

LOCK TABLES `ticket_logs` WRITE;
/*!40000 ALTER TABLE `ticket_logs` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travels`
--

LOCK TABLES `travels` WRITE;
/*!40000 ALTER TABLE `travels` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_bank`
--

LOCK TABLES `user_bank` WRITE;
/*!40000 ALTER TABLE `user_bank` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_history`
--

LOCK TABLES `user_history` WRITE;
/*!40000 ALTER TABLE `user_history` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,1,7,'2025-06-25 11:43:26','System',1),(2,1,1,'2025-06-25 11:43:26','System',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'000010782','Deepu Kumar','deepu.kumar@dfmail.org','$2b$10$CxlSjM9vLF2QUrdtwYp8Vea7a/VVrOqTkJ4Nuuc/ElH55XYBiy2/S',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,'2025-06-25 11:46:30');
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
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq` (
  `faq_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `faq_description` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `solved_description` text,
  `solved_by` int DEFAULT NULL,
  `solved_at` datetime DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  PRIMARY KEY (`faq_id`),
  KEY `user_id` (`user_id`),
  KEY `solved_by` (`solved_by`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `faq_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `faq_ibfk_2` FOREIGN KEY (`solved_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `faq_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq`
--

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_files`
--

DROP TABLE IF EXISTS `faq_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_files` (
  `faq_file_id` int NOT NULL AUTO_INCREMENT,
  `faq_id` int DEFAULT NULL,
  `file_path` text,
  `faq_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`faq_file_id`),
  KEY `faq_id` (`faq_id`),
  CONSTRAINT `faq_files_ibfk_1` FOREIGN KEY (`faq_id`) REFERENCES `faq` (`faq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_files`
--

LOCK TABLES `faq_files` WRITE;
/*!40000 ALTER TABLE `faq_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_chat`
--

DROP TABLE IF EXISTS `query_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `query_chat` (
  `query_chat_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `faq_id` int DEFAULT NULL,
  `query_chat` text,
  `created_at` datetime DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  PRIMARY KEY (`query_chat_id`),
  KEY `user_id` (`user_id`),
  KEY `faq_id` (`faq_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `query_chat_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `query_chat_ibfk_2` FOREIGN KEY (`faq_id`) REFERENCES `faq` (`faq_id`),
  CONSTRAINT `query_chat_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_chat`
--

LOCK TABLES `query_chat` WRITE;
/*!40000 ALTER TABLE `query_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `query_chat` ENABLE KEYS */;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-25 12:24:04
