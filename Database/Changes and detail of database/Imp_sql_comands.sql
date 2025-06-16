/* **************************************************************** 
<-- USED TO RESET AUTO_INCREMENT.-->
-- Use after deleting all data from the table--
******************************************************************* */
/*----------------------------------------------------------------------------------------------
ALTER TABLE table_name AUTO_INCREMENT = 1;
------------------------------------------------------------------------------------------------- */


/* ****************************************************************
<-- THIS CAN BE USED WHEN ADDING A COLUMN TO AN EXISTING TABLE.-->
******************************************************************* */
/*----------------------------------------------------------------------------------------------
ALTER TABLE Table_Name  
ADD COLUMN column_to_add column_datatype DEFAULT NULL AFTER after_which_column_you_want_to_place;
------------------------------------------------------------------------------------------------- */


/* *******************************************************************************
 <-- THIS CAN BE USED TO MOVE A COLUMN TO A CERTAIN POSITION IN AN EXISTING TABLE.-->
********************************************************************************** */
/*----------------------------------------------------------------------------------------------
ALTER TABLE table_name 
MODIFY COLUMN column_to_move_with_datatype AFTER after_which_column_you_want_to_place;
------------------------------------------------------------------------------------------------- */

/* *******************************************************************************
 <-- Used to find forign key constrains and remove that along with index-->
********************************************************************************** */
/*----------------------------------------------------------------------------------------------
SELECT 
    CONSTRAINT_NAME
FROM 
    information_schema.KEY_COLUMN_USAGE
WHERE 
    TABLE_NAME = 'table_name' <--- from where you want to remove foreign key 
    AND COLUMN_NAME = 'column_name'
    AND TABLE_SCHEMA = 'database_name';
  
ALTER TABLE table_name
DROP FOREIGN KEY constrain_name;  

SHOW INDEX FROM `table_name` WHERE Column_name = 'column_name';

ALTER TABLE `table_name` DROP INDEX `column_name`;

------------------------------------------------------------------------------------------------- */


/* ****************************************************************
<-- Check Event is allowed and if not then allow -->
******************************************************************* */

SHOW VARIABLES LIKE 'event_scheduler';
SHOW EVENTS;
SHOW EVENTS FROM df_ticketing;

SET GLOBAL event_scheduler = ON;


/* ****************************************************************
<-- Procedure to add new academic year  -->
******************************************************************* */

CREATE DEFINER=`ruser`@`%` PROCEDURE `USP_CREATE_NEW_ACADEMIC_YEAR`()
BEGIN
    DECLARE v_Year_ID INT;
    DECLARE v_Year_Name VARCHAR(10);
    DECLARE v_Start_Date DATETIME;
    DECLARE v_End_Date DATETIME;
    
    -- Get latest Academic Year
    SELECT year_id, year_name, start_date, end_date 
    INTO v_Year_ID, v_Year_Name, v_Start_Date, v_End_Date
    FROM academic_year 
    WHERE status_id = 1
    ORDER BY end_date DESC
    LIMIT 1;
    
    -- Update old Academic Year status to 2 (Inactive)
    UPDATE academic_year 
    SET status_id = 2 
    WHERE year_id = v_Year_ID;
    
    -- Prepare new Year Name (2526 → 2627)
    SET v_Year_Name = 
        LPAD(CAST(SUBSTRING(v_Year_Name,1,2) + 1 AS CHAR), 2, '0') 
        +
        LPAD(CAST(SUBSTRING(v_Year_Name,3,2) + 1 AS CHAR), 2, '0');
    
    -- Calculate new Start and End Dates
    -- Start Date = Next Day of v_End_Date at 00:00:00
	SET v_Start_Date = DATE_ADD(DATE(v_End_Date), INTERVAL 1 DAY);

	-- End Date = Start Date + 1 Year - 1 Second (To get till 23:59:59 of next year March 31)
	SET v_End_Date = DATE_ADD(v_Start_Date, INTERVAL 1 YEAR) - INTERVAL 1 SECOND;

    
    -- Insert new Academic Year
    INSERT INTO academic_year(year_name, status_id, start_date, end_date)
    VALUES(v_Year_Name, 1, v_Start_Date, v_End_Date);
    
END 


/* *********************************************************************************************************
<-- Create Event to run the above procedure automatically every day to add new academic year automatically-->
************************************************************************************************************ */

DELIMITER $$

CREATE EVENT IF NOT EXISTS EVENT_CREATE_NEW_ACADEMIC_YEAR
ON SCHEDULE EVERY 1 DAY
STARTS '2025-04-06 00:00:00'
DO
BEGIN
    IF (SELECT COUNT(*) 
        FROM academic_year 
        WHERE status_id = 1 AND end_date < NOW()) > 0 THEN
        CALL USP_CREATE_NEW_ACADEMIC_YEAR();
    END IF;
END $$

DELIMITER ;
