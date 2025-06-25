/* **************************************************************** 
<-- 08/03/2025-->
******************************************************************* */
/*
df_ticketing database created
*/

/* **************************************************************** 
<-- 15/04/2025-->
******************************************************************* */
/*
CREATE TABLE budget_type (
    budget_id INT AUTO_INCREMENT PRIMARY KEY,
    budget_name VARCHAR(255) NOT NULL,
    status_id INT,
    FOREIGN KEY (status_id) REFERENCES master_status(status_id)
);

CREATE TABLE expense (
    expense_id INT AUTO_INCREMENT PRIMARY KEY,
    expense_name VARCHAR(255) NOT NULL,
    status_id INT,
    FOREIGN KEY (status_id) REFERENCES master_status(status_id)
);

CREATE TABLE contribution_type (
    contribution_id INT AUTO_INCREMENT PRIMARY KEY,
    contribution_name VARCHAR(255) NOT NULL,
    status_id INT,
    FOREIGN KEY (status_id) REFERENCES master_status(status_id)
);

ALTER TABLE ticket_history
ADD COLUMN expense_id INT AFTER cost_center_id,
ADD COLUMN budget_id INT AFTER expense_id,
ADD COLUMN contribution_id INT AFTER budget_id;

ALTER TABLE ledgers
ADD COLUMN category_id INT AFTER ledger_name,
ADD FOREIGN KEY (category_id) REFERENCES categories(category_id);

CREATE TABLE reimb_others (
    reimb_other_id INT AUTO_INCREMENT PRIMARY KEY,
    reimb_dtls_id INT,
    date datetime,
    remarks text,
    FOREIGN KEY (reimb_dtls_id) REFERENCES re_ticket_details(reimb_dtls_id)
);

*/



/* **************************************************************** 
<-- 21/04/2025-->
******************************************************************* */

/*
CREATE TABLE organization_bank (
    org_bank_id INT PRIMARY KEY AUTO_INCREMENT,
    org_id INT DEFAULT NULL,
    entity_id INT DEFAULT NULL,
    org_bank_name VARCHAR(100) DEFAULT NULL,
    org_bank_account_no VARCHAR(50) DEFAULT NULL,
    org_name_on_bank VARCHAR(100) DEFAULT NULL,
    org_bank_ifsc VARCHAR(50) DEFAULT NULL,
    org_bank_format TEXT DEFAULT NULL,
    status_id INT DEFAULT NULL,
    created_at DATETIME DEFAULT NULL,
    updated_at DATETIME DEFAULT NULL,
    FOREIGN KEY (status_id) REFERENCES master_status(status_id),
    FOREIGN KEY (org_id) REFERENCES organization(org_id),
    FOREIGN KEY (entity_id) REFERENCES entities(entity_id)
);

CREATE TABLE payment_type (
    pay_type_id INT AUTO_INCREMENT PRIMARY KEY,
    pay_type VARCHAR(30) DEFAULT NULL
);

ALTER TABLE payments  
ADD COLUMN pay_type_id INT DEFAULT NULL AFTER route_id,
ADD CONSTRAINT payments_ibfk_pay_type_id FOREIGN KEY (pay_type_id) REFERENCES payment_type(pay_type_id);

ALTER TABLE payments  
ADD COLUMN org_bank_id INT DEFAULT NULL AFTER pay_type_id,
ADD CONSTRAINT payments_ibfk_org_bank_id FOREIGN KEY (org_bank_id) REFERENCES organization_bank(org_bank_id);

ALTER TABLE payments  
ADD COLUMN user_bank_id INT DEFAULT NULL AFTER org_bank_id,
ADD CONSTRAINT payments_ibfk_user_bank_id FOREIGN KEY (user_bank_id) REFERENCES user_bank(bank_id);

ALTER TABLE payments  
ADD COLUMN vendor_bank_id INT DEFAULT NULL AFTER user_bank_id,
ADD CONSTRAINT payments_ibfk_vendor_bank_id FOREIGN KEY (vendor_bank_id) REFERENCES vendor_bank(vendor_bank_id);


ALTER TABLE payments
MODIFY COLUMN paid_from INT DEFAULT NULL AFTER pay_type_id,
MODIFY COLUMN paid_to INT DEFAULT NULL AFTER paid_from;

ALTER TABLE payments
MODIFY COLUMN amount varchar(30) Default Null;
*/


/* **************************************************************** 
<-- 22/04/2025-->
******************************************************************* */

/*
ALTER TABLE tickets  
ADD COLUMN entity_id INT DEFAULT NULL AFTER ticket_id,
ADD CONSTRAINT ticketss_ibfk_entity_id FOREIGN KEY (entity_id) REFERENCES entities(entity_id);

ALTER TABLE organization_bank  
ADD COLUMN entity_id INT DEFAULT NULL AFTER org_id,
ADD CONSTRAINT organization_bank_ibfk_entity_id FOREIGN KEY (entity_id) REFERENCES entities(entity_id);

ALTER TABLE organization_bank  
ADD COLUMN org_name_on_bank INT DEFAULT NULL AFTER org_bank_account_no;

ALTER TABLE organization_bank
MODIFY COLUMN org_name_on_bank varchar(100) DEFAULT NULL;

SET SQL_SAFE_UPDATES = 0;
UPDATE tickets
SET entity_id = 1;
SET SQL_SAFE_UPDATES = 1;  -- (Optional) Re-enable safe mode

SET SQL_SAFE_UPDATES = 0;
UPDATE tickets
SET entity_id = NULL;
SET SQL_SAFE_UPDATES = 1;  -- (Optional) Re-enable safe mode



*/


/* **************************************************************** 
<-- 23/04/2025-->
******************************************************************* */

/*
-- Rename current_address to current_address_line_1 and change data type to TEXT
ALTER TABLE employees
CHANGE COLUMN current_address current_address_line_1 TEXT;

-- Add new address-related columns after current_address_line_1
ALTER TABLE employees
ADD COLUMN current_address_line_2 TEXT AFTER current_address_line_1,
ADD COLUMN current_address_city TEXT AFTER current_address_line_2,
ADD COLUMN current_address_state TEXT AFTER current_address_city,
ADD COLUMN current_address_zip TEXT AFTER current_address_state,
ADD COLUMN current_address_country TEXT AFTER current_address_zip;

-- Rename permanent_address to permanent_address_line_1 and change data type to TEXT
ALTER TABLE employees
CHANGE COLUMN permanent_address permanent_address_line_1 TEXT;

-- Add new permanent address-related columns after permanent_address_line_1
ALTER TABLE employees
ADD COLUMN permanent_address_line_2 TEXT AFTER permanent_address_line_1,
ADD COLUMN permanent_address_city TEXT AFTER permanent_address_line_2,
ADD COLUMN permanent_address_state TEXT AFTER permanent_address_city,
ADD COLUMN permanent_address_zip TEXT AFTER permanent_address_state,
ADD COLUMN permanent_address_country TEXT AFTER permanent_address_zip;


-- Rename current_address to current_address_line_1 and change data type to TEXT
ALTER TABLE employee_history
CHANGE COLUMN current_address current_address_line_1 TEXT;

-- Add new address-related columns after current_address_line_1
ALTER TABLE employee_history
ADD COLUMN current_address_line_2 TEXT AFTER current_address_line_1,
ADD COLUMN current_address_city TEXT AFTER current_address_line_2,
ADD COLUMN current_address_state TEXT AFTER current_address_city,
ADD COLUMN current_address_zip TEXT AFTER current_address_state,
ADD COLUMN current_address_country TEXT AFTER current_address_zip;

-- Rename permanent_address to permanent_address_line_1 and change data type to TEXT
ALTER TABLE employee_history
CHANGE COLUMN permanent_address permanent_address_line_1 TEXT;

-- Add new permanent address-related columns after permanent_address_line_1
ALTER TABLE employee_history
ADD COLUMN permanent_address_line_2 TEXT AFTER permanent_address_line_1,
ADD COLUMN permanent_address_city TEXT AFTER permanent_address_line_2,
ADD COLUMN permanent_address_state TEXT AFTER permanent_address_city,
ADD COLUMN permanent_address_zip TEXT AFTER permanent_address_state,
ADD COLUMN permanent_address_country TEXT AFTER permanent_address_zip;


CREATE TABLE role_actions (
  role_action_id INT(11) NOT NULL AUTO_INCREMENT,
  role_id INT(11) DEFAULT NULL,
  action VARCHAR(100) DEFAULT NULL,
  status_id INT(11) DEFAULT NULL,
  PRIMARY KEY (role_action_id),
  KEY role_id (role_id),
  KEY status_id (status_id),
  CONSTRAINT role_action_ibfk_1 FOREIGN KEY (role_id) REFERENCES roles (role_id),
  CONSTRAINT role_action_ibfk_2 FOREIGN KEY (status_id) REFERENCES master_status (status_id)
  );
  
  */

/* **************************************************************** 
<-- 25/04/2025-->
******************************************************************* */
/*
ALTER TABLE login_details 
ADD COLUMN login_type VARCHAR(30) AFTER user_id;

ALTER TABLE payments CHANGE transaction_id UTR_number VARCHAR(100);

ALTER TABLE payments 
ADD COLUMN payment_number VARCHAR(45) AFTER ticket_id;

ALTER TABLE payments 
ADD COLUMN created_by int(11) AFTER payment_date,
ADD CONSTRAINT payments_ibfk_created_by FOREIGN KEY (created_by) REFERENCES users(user_id);

ALTER TABLE payments CHANGE payment_number transaction_id VARCHAR(45);

*/

/* **************************************************************** 
<-- 26/04/2025-->
******************************************************************* */

/*
SELECT CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME 
FROM information_schema.KEY_COLUMN_USAGE 
WHERE TABLE_NAME = 'payments' 
  AND CONSTRAINT_SCHEMA = 'df_ticketing' 
  AND REFERENCED_TABLE_NAME IS NOT NULL;
  
  
ALTER TABLE payments DROP FOREIGN KEY payments_ibfk_org_bank_id;
ALTER TABLE payments DROP FOREIGN KEY payments_ibfk_user_bank_id;
ALTER TABLE payments DROP FOREIGN KEY payments_ibfk_vendor_bank_id;

ALTER TABLE payments
DROP COLUMN org_bank_id,
DROP COLUMN user_bank_id,
DROP COLUMN vendor_bank_id;

ALTER TABLE payments
ADD COLUMN paid_from_bank INT(11) AFTER paid_to,
ADD COLUMN paid_to_bank INT(11) AFTER paid_from_bank;

ALTER TABLE organization_bank
CHANGE org_bank_name entity_bank_name VARCHAR(100),
CHANGE org_bank_account_no entity_bank_account_no VARCHAR(50),
CHANGE org_name_on_bank entity_name_on_bank VARCHAR(100),
CHANGE org_bank_ifsc entity_bank_ifsc VARCHAR(50),
CHANGE org_bank_format entity_bank_format TEXT;



SET SQL_SAFE_UPDATES = 0;

UPDATE payments
SET paid_from_bank = 1,
    paid_to_bank = 1;

SET SQL_SAFE_UPDATES = 1;
*/

/* **************************************************************** 
<-- 02/05/2025-->
******************************************************************* */

/*
-- Rename column granted_amount to m_granted_amount
ALTER TABLE re_ticket_details
CHANGE granted_amount m_granted_amount VARCHAR(100);

-- Add new column f_granted_amount after m_granted_amount
ALTER TABLE re_ticket_details
ADD f_granted_amount VARCHAR(100) AFTER m_granted_amount;

-- Rename column granted_by to f_granted_by
ALTER TABLE re_ticket_details
CHANGE granted_by f_granted_by INT(11);

-- Rename column granted_amount to m_granted_amount
ALTER TABLE reimbursement_history
CHANGE granted_amount m_granted_amount VARCHAR(100);

-- Add new column f_granted_amount after m_granted_amount
ALTER TABLE reimbursement_history
ADD f_granted_amount VARCHAR(100) AFTER m_granted_amount;
*/


/* **************************************************************** 
<-- 03/05/2025-->
******************************************************************* */

/*

SELECT report_code, COUNT(*)
FROM df_ticketing.reports
GROUP BY report_code
HAVING COUNT(*) > 1;

ALTER TABLE df_ticketing.reports
ADD CONSTRAINT unique_report_code UNIQUE (report_code);

SELECT ticket_number, COUNT(*)
FROM df_ticketing.tickets
GROUP BY ticket_number
HAVING COUNT(*) > 1;

ALTER TABLE df_ticketing.tickets
ADD CONSTRAINT unique_ticket_number UNIQUE (ticket_number);

SELECT transaction_id, COUNT(*)
FROM df_ticketing.payments
GROUP BY transaction_id
HAVING COUNT(*) > 1;

ALTER TABLE df_ticketing.payments
ADD CONSTRAINT unique_transaction_id UNIQUE (transaction_id);

*/

/* **************************************************************** 
<-- 08/05/2025-->
******************************************************************* */

/*
ALTER TABLE employee_history MODIFY COLUMN secondary_job_title VARCHAR(100);
ALTER TABLE employees MODIFY COLUMN secondary_job_title VARCHAR(100);
ALTER TABLE user_history MODIFY COLUMN secondary_job_title VARCHAR(100);
ALTER TABLE users MODIFY COLUMN secondary_job_title VARCHAR(100);

ALTER TABLE employee_history MODIFY COLUMN job_title VARCHAR(100);
ALTER TABLE employees MODIFY COLUMN job_title VARCHAR(100);
ALTER TABLE user_history MODIFY COLUMN job_title VARCHAR(100);
ALTER TABLE users MODIFY COLUMN job_title VARCHAR(100);

ALTER TABLE organization_bank 
ADD COLUMN email VARCHAR(100) 
after entity_bank_IFSC;

*/

/* **************************************************************** 
<-- 09/05/2025-->
******************************************************************* */

/*
ALTER TABLE organization_bank
ADD COLUMN account_type VARCHAR(50) AFTER entity_id,
ADD COLUMN bank_address TEXT AFTER entity_bank_IFSC,
ADD COLUMN bank_contact_no VARCHAR(30) AFTER bank_address,
ADD COLUMN bank_contact_person VARCHAR(100) AFTER bank_contact_no;

ALTER TABLE organization_bank AUTO_INCREMENT = 1;


SELECT table_name
FROM information_schema.columns
WHERE column_name = 'employee_number'
  AND table_schema = 'df_ticketing';
  
  
  ALTER TABLE employee_history 
MODIFY COLUMN employee_number VARCHAR(50);

ALTER TABLE employees 
MODIFY COLUMN employee_number VARCHAR(50);

ALTER TABLE user_history 
MODIFY COLUMN employee_number VARCHAR(50);

ALTER TABLE users 
MODIFY COLUMN employee_number VARCHAR(50);


--
-- Table structure for table `bill_history`
--

		DROP TABLE IF EXISTS `bill_history`;
/*		/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*		/*!50503 SET character_set_client = utf8mb4 */;
/*	  CREATE TABLE bill_history (
		`bill_hst_id` INT(11) NOT NULL AUTO_INCREMENT,
		`bill_id` INT(11) DEFAULT NULL,
		`ticket_id` INT(11) DEFAULT NULL,
		`exp_catg_id` INT(11) DEFAULT NULL,
		`ticket_dtls_id` INT(11) DEFAULT NULL,
		`bill_path` TEXT DEFAULT NULL,
		`bill_number` VARCHAR(45) DEFAULT NULL,
		`bill_amount` VARCHAR(100) DEFAULT NULL,
		`bill_date` DATETIME DEFAULT NULL,
		`status_id` INT(11) DEFAULT NULL,
		`created_at` DATETIME DEFAULT NULL,
		`created_by` INT(11) DEFAULT NULL,
		`updated_at` DATETIME DEFAULT NULL,
		`updated_by` INT(11) DEFAULT NULL,
		PRIMARY KEY (`bill_hst_id`),
		KEY `bill_id` (`bill_id`),
		KEY `ticket_id` (`ticket_id`),
		KEY `exp_catg_id` (`exp_catg_id`),
		KEY `status_id` (`status_id`),
		CONSTRAINT `bill_hst_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bills`(`bill_id`),
		CONSTRAINT `bill_hst_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `tickets`(`ticket_id`) ,
		CONSTRAINT `bill_hst_ibfk_3` FOREIGN KEY (`exp_catg_id`) REFERENCES `expense_category`(`expense_category_id`) ,
		CONSTRAINT `bill_hst_ibfk_4` FOREIGN KEY (`status_id`) REFERENCES `master_status`(`status_id`) 
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	/*!40101 SET character_set_client = @saved_cs_client */;


	--
	-- Dumping data for table `bill_history`
	--
/*
	LOCK TABLES `bill_history` WRITE;
	/*!40000 ALTER TABLE `bill_history` DISABLE KEYS */;
/*    
	/*!40000 ALTER TABLE `bill_history` ENABLE KEYS */;
/*	UNLOCK TABLES;



DROP TABLE `df_ticketing`.`bill_history`


*/

/* **************************************************************** 
<-- 12/05/2025-->
******************************************************************* */

/*
SELECT table_name
FROM information_schema.columns
WHERE column_name = 'reporting_manager_en'
  AND table_schema = 'df_ticketing';
  
  
    ALTER TABLE employee_history 
MODIFY COLUMN reporting_manager_en VARCHAR(50);


ALTER TABLE employees 
MODIFY COLUMN reporting_manager_en VARCHAR(50);



--
-- Table structure for table `edit_history`
--

		DROP TABLE IF EXISTS `edit_history`;
/*		/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*		/*!50503 SET character_set_client = utf8mb4 */;
/*		CREATE TABLE `edit_history` (
		  `edit_id` int(11) NOT NULL AUTO_INCREMENT,
		  `report_id` int(11) DEFAULT NULL,
		  `ticket_id` int(11) DEFAULT NULL,
		  `updated_by` int(11) DEFAULT NULL,
		  `table_name` varchar(50) DEFAULT NULL,
		  `column_name` varchar(60) DEFAULT NULL,
		  `before` varchar(50) DEFAULT NULL,
		  `after` varchar(50) DEFAULT NULL,
		  `updated_date` datetime DEFAULT NULL,
		  `description` text,
		  PRIMARY KEY (`edit_id`),
		  KEY `report_id` (`report_id`),
		  KEY `ticket_id` (`ticket_id`),
		  CONSTRAINT `edit_history_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`),
		  CONSTRAINT `edit_history_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;
		/*!40101 SET character_set_client = @saved_cs_client */;

		--
		-- Dumping data for table `edit_history`
		--

/*		LOCK TABLES `edit_history` WRITE;
		/*!40000 ALTER TABLE `edit_history` DISABLE KEYS */;
/*		/*!40000 ALTER TABLE `edit_history` ENABLE KEYS */;
/*		UNLOCK TABLES;



DROP TABLE `df_ticketing`.`edit_history`



*/


/* **************************************************************** 
<-- 12/05/2025-->
******************************************************************* */

/*


 ALTER TABLE employee_history 
MODIFY COLUMN personal_email VARCHAR(100);   
 ALTER TABLE employee_history 
MODIFY COLUMN work_email VARCHAR(100);

ALTER TABLE employees 
MODIFY COLUMN personal_email VARCHAR(100);
ALTER TABLE employees 
MODIFY COLUMN work_email VARCHAR(100);

ALTER TABLE users 
MODIFY COLUMN work_email VARCHAR(100);

ALTER TABLE users 
MODIFY COLUMN personal_email VARCHAR(100);

ALTER TABLE user_history 
MODIFY COLUMN work_email VARCHAR(100);

ALTER TABLE user_history 
MODIFY COLUMN personal_email VARCHAR(100);


ALTER TABLE employee_history 
MODIFY COLUMN display_name VARCHAR(100);   

ALTER TABLE employees 
MODIFY COLUMN display_name VARCHAR(100); 


ALTER TABLE users 
MODIFY COLUMN user_name VARCHAR(100); 

ALTER TABLE user_history 
MODIFY COLUMN user_name VARCHAR(100); 

ALTER TABLE user_bank 
MODIFY COLUMN name_on_bank VARCHAR(100); 


ALTER TABLE employee_history 
MODIFY COLUMN first_name VARCHAR(100);   
ALTER TABLE employee_history 
MODIFY COLUMN middle_name VARCHAR(100); 
ALTER TABLE employee_history 
MODIFY COLUMN last_name VARCHAR(100); 
ALTER TABLE employee_history 
MODIFY COLUMN full_name VARCHAR(100); 

ALTER TABLE employees 
MODIFY COLUMN first_name VARCHAR(100);   
ALTER TABLE employees 
MODIFY COLUMN middle_name VARCHAR(100); 
ALTER TABLE employees 
MODIFY COLUMN last_name VARCHAR(100); 
ALTER TABLE employees 
MODIFY COLUMN full_name VARCHAR(100); 

ALTER TABLE employees 
MODIFY COLUMN entity VARCHAR(100);   

ALTER TABLE employee_history 
MODIFY COLUMN entity VARCHAR(100); 

ALTER TABLE employee_history 
MODIFY COLUMN employee_name_on_bank VARCHAR(100); 

ALTER TABLE employees 
MODIFY COLUMN employee_name_on_bank VARCHAR(100); 


ALTER TABLE employee_history 
MODIFY COLUMN employees_name VARCHAR(100); 

ALTER TABLE employees 
MODIFY COLUMN employees_name VARCHAR(100); 

ALTER TABLE employee_history 
MODIFY COLUMN pay_group VARCHAR(100); 

ALTER TABLE employees 
MODIFY COLUMN pay_group VARCHAR(100); 


ALTER TABLE employee_history 
MODIFY COLUMN employee_IFSC VARCHAR(50); 

ALTER TABLE employees 
MODIFY COLUMN employee_IFSC VARCHAR(50); 

ALTER TABLE user_bank 
MODIFY COLUMN IFSC VARCHAR(50); 

ALTER TABLE vendor_bank 
MODIFY COLUMN IFSC VARCHAR(50); 

ALTER TABLE employees 
MODIFY COLUMN reporting_manager VARCHAR(100); 

ALTER TABLE employee_history 
MODIFY COLUMN reporting_manager VARCHAR(100); 

ALTER TABLE vendor_bank  
MODIFY COLUMN name_on_bank VARCHAR(100);

*/

/* **************************************************************** 
<-- 15/05/2025-->
******************************************************************* */

/*
ALTER TABLE employees
CHANGE employee_Account_number employee_account_number VARCHAR(20);

ALTER TABLE employee_history
CHANGE employee_Account_number employee_account_number VARCHAR(20);

*/

/* **************************************************************** 
<-- 23/05/2025-->
******************************************************************* */

/*

-- Add new column description after process_status_id
ALTER TABLE tickets
ADD description text AFTER process_status_id;

-- Add new column description after contribution_id
ALTER TABLE ticket_history
ADD description text AFTER contribution_id;

ALTER TABLE travels
MODIFY COLUMN `from` VARCHAR(100) AFTER vehicle_id,
MODIFY COLUMN `to` VARCHAR(100) AFTER `from`;

ALTER TABLE tickets
ADD COLUMN granted_amount VARCHAR(100) AFTER exp_catg_id;

ALTER TABLE organization_bank
ADD COLUMN client_code VARCHAR(100) AFTER account_type;

*/

/* **************************************************************** 
<-- 31/05/2025-->
******************************************************************* */

/*

-- Add new column bank_ledger after entity_bank_IFSC
ALTER TABLE organization_bank
ADD bank_ledger text AFTER entity_bank_IFSC;


ALTER TABLE employees
MODIFY cost_center VARCHAR(225);

ALTER TABLE employee_history
MODIFY cost_center VARCHAR(225);

ALTER TABLE `df_ticketing`.`users`
ADD COLUMN `sended_email` INT(11) AFTER `work_location`;

*/


/* **************************************************************** 
<-- 05/06/2025-->
******************************************************************* */

/*

SELECT 
    CONSTRAINT_NAME
FROM 
    information_schema.KEY_COLUMN_USAGE
WHERE 
    TABLE_NAME = 'ledgers'
    AND COLUMN_NAME = 'entity_id'
    AND TABLE_SCHEMA = 'df_ticketing';



ALTER TABLE ledgers
DROP FOREIGN KEY ledgers_ibfk_2;

SHOW INDEX FROM `ledgers` WHERE Column_name = 'entity_id';

ALTER TABLE `ledgers` DROP INDEX `entity_id`;


SET SQL_SAFE_UPDATES = 0;

UPDATE ledgers
SET entity_id = NULL;

-- Optionally, re-enable safe updates after
SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;

UPDATE ledgers
SET status_id = 2;

-- Optionally, re-enable safe updates after
SET SQL_SAFE_UPDATES = 1;

alter table tally_booking ADD COLUMN `dr/cr` varchar(10) AFTER `payment_id`;

ALTER TABLE `tally_booking`
  ADD COLUMN `tally_pay_id` INT(11) AFTER `payment_id`,
  ADD CONSTRAINT `tally_booking_ibfk_5` FOREIGN KEY (`tally_pay_id`) REFERENCES `tally_payment` (`tally_pay_id`);

  
*/

/* **************************************************************** 
<-- 11/06/2025-->
******************************************************************* */

/*

ALTER TABLE tally_pay_bank
ADD COLUMN route_id INT AFTER tally_pay_id,
ADD COLUMN bank_id INT AFTER route_id,
ADD CONSTRAINT fk_tally_pay_bank_route_id
    FOREIGN KEY (route_id) REFERENCES payment_route(route_id);

*/

/* **************************************************************** 
<-- 25/06/2025-->
******************************************************************* */

/*
UPDATE `df_ticketing`.`organization_bank` SET `status_id` = '2' WHERE (`org_bank_id` = '19');
UPDATE `df_ticketing`.`organization_bank` SET `status_id` = '2' WHERE (`org_bank_id` = '21');
UPDATE `df_ticketing`.`organization_bank` SET `status_id` = '2' WHERE (`org_bank_id` = '23');
UPDATE `df_ticketing`.`organization_bank` SET `status_id` = '2' WHERE (`org_bank_id` = '24');
UPDATE `df_ticketing`.`organization_bank` SET `status_id` = '2' WHERE (`org_bank_id` = '27');

*/
