---------------------------------------------------------------------------------------------------------------------------
/* **************************************************************** 
<-- Stored Procedure 1-->
******************************************************************* */
---------------------------------------------------------------------------------------------------------------------------

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

        IF v_entity_id IS NULL THEN
            INSERT INTO entities (org_id, entity_name, status_id)
            VALUES (p_org_id, p_entity_name, 1);
            SET v_entity_id = LAST_INSERT_ID();
        END IF;

        -- Check or insert into academic_entity
        IF v_year_id IS NOT NULL AND v_entity_id IS NOT NULL THEN
            IF NOT EXISTS (
                SELECT 1 FROM academic_entity
                WHERE entity_id = v_entity_id AND year_id = v_year_id AND status_id = 1
            ) THEN
                INSERT INTO academic_entity (entity_id, year_id, status_id)
                VALUES (v_entity_id, v_year_id, 1);
            END IF;
        END IF;
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

END;


-------------------------------------------------------------------------------------------------------------------------------
/* **************************************************************** 
<-- Stored Procedure 2-->
******************************************************************* */
-------------------------------------------------------------------------------------------------------------------------------

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

END

--------------------------------------------------------------------------------------------------------------------------
/* **************************************************************** 
<-- Stored Procedure 3-->
******************************************************************* */
--------------------------------------------------------------------------------------------------------------------------

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
END
-----------------------------------------------------------------------------------------------------------------------------
/* **************************************************************** 
<-- Stored Procedure 4-->
******************************************************************* */
-----------------------------------------------------------------------------------------------------------------------------

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
END



-----------------------------------------------------------------------------------------------------------------------------
/* **************************************************************** 
<-- Stored Procedure 5-->
******************************************************************* */
-----------------------------------------------------------------------------------------------------------------------------
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
END

-----------------------------------------------------------------------------------------------------------------------------
/* **************************************************************** 
<-- Stored Procedure 6-->
******************************************************************* */
-----------------------------------------------------------------------------------------------------------------------------
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
END
-----------------------------------------------------------------------------------------------------------------------------
/* **************************************************************** 
<-- Stored Procedure 7-->
******************************************************************* */
-----------------------------------------------------------------------------------------------------------------------------
CREATE DEFINER=`DF-Ticketing`@`%` PROCEDURE `USP_GET_USER_REPORT_NUMBERS`(
    IN p_user_id INT
)
BEGIN
    SELECT 
        -- Report Details
        COUNT(r.report_id) AS raised_reports,
        COUNT(CASE WHEN r.status_id = 1 THEN 1 END) AS active_reports,
        COUNT(CASE WHEN r.status_id = 1 AND r.process_status_id != 15 THEN 1 END) AS pending_reports,
        COUNT(CASE WHEN r.process_status_id = 15 THEN 1 END) AS closed_reports,

        -- Reimbursement Details (exp_catg_id = 1)
        COUNT(CASE WHEN t.exp_catg_id = 1 THEN t.ticket_id END) AS re_raised_tickets,
        COUNT(CASE WHEN t.exp_catg_id = 1 AND t.status_id = 1 THEN t.ticket_id END) AS re_active_tickets,
        COUNT(CASE WHEN t.exp_catg_id = 1 AND t.status_id = 1 AND t.process_status_id != 15 THEN t.ticket_id END) AS re_pending_tickets,
        COUNT(CASE WHEN t.exp_catg_id = 1 AND t.process_status_id = 15 THEN t.ticket_id END) AS re_closed_tickets,

        -- Procurement Details (exp_catg_id = 2)
        COUNT(CASE WHEN t.exp_catg_id = 2 THEN t.ticket_id END) AS pro_raised_tickets,
        COUNT(CASE WHEN t.exp_catg_id = 2 AND t.status_id = 1 THEN t.ticket_id END) AS pro_active_tickets,
        COUNT(CASE WHEN t.exp_catg_id = 2 AND t.status_id = 1 AND t.process_status_id != 15 THEN t.ticket_id END) AS pro_pending_tickets,
        COUNT(CASE WHEN t.exp_catg_id = 2 AND t.process_status_id = 15 THEN t.ticket_id END) AS pro_closed_tickets,

        -- Advance Details (exp_catg_id = 3)
        COUNT(CASE WHEN t.exp_catg_id = 3 THEN t.ticket_id END) AS adv_raised_tickets,
        COUNT(CASE WHEN t.exp_catg_id = 3 AND t.status_id = 1 THEN t.ticket_id END) AS adv_active_tickets,
        COUNT(CASE WHEN t.exp_catg_id = 3 AND t.status_id = 1 AND t.process_status_id != 15 THEN t.ticket_id END) AS adv_pending_tickets,
        COUNT(CASE WHEN t.exp_catg_id = 3 AND t.process_status_id = 15 THEN t.ticket_id END) AS adv_closed_tickets

    FROM reports r
    LEFT JOIN tickets t ON r.report_id = t.report_id
    WHERE r.user_id = p_user_id;
END

-----------------------------------------------------------------------------------------------------------------------------
/* **************************************************************** 
<-- Stored Procedure 8-->
******************************************************************* */
-----------------------------------------------------------------------------------------------------------------------------

CREATE DEFINER=`DF-Ticketing`@`%` PROCEDURE `USP_GET_MANAGER_REPORTS_NUMBER`(
    IN p_user_id INT
)
BEGIN
    -- Temporary table to store relevant report_ids
    CREATE TEMPORARY TABLE TempReportIds
    SELECT report_id 
    FROM reports 
    WHERE manager_id = p_user_id 
      AND status_id = 1;

    -- Fetch the distinct count of report_id based on process_status_id in tickets table
    SELECT 
        COUNT(DISTINCT CASE WHEN t.process_status_id = 7 THEN t.report_id END) AS pending,
        COUNT(DISTINCT CASE WHEN t.process_status_id NOT IN (19, 7, 8) THEN t.report_id END) AS approved,
        COUNT(DISTINCT CASE WHEN t.process_status_id = 8 THEN t.report_id END) AS rejected,
        COUNT(DISTINCT CASE WHEN t.process_status_id = 15 THEN t.report_id END) AS closed
    FROM tickets t
    WHERE t.report_id IN (SELECT report_id FROM TempReportIds);

    -- Drop the temporary table to free up memory
    DROP TEMPORARY TABLE IF EXISTS TempReportIds;
END
-----------------------------------------------------------------------------------------------------------------------------
/* **************************************************************** 
<-- Stored Procedure 9-->
******************************************************************* */
-----------------------------------------------------------------------------------------------------------------------------

CREATE DEFINER=`DF-Ticketing`@`%` PROCEDURE `USP_INSERT_USER_BANK_DETAILS`(
    IN p_updated_by INT,
    IN p_employee_number varchar(50),
    IN p_employee_name_on_bank VARCHAR(100),
    IN p_employee_bank_name VARCHAR(30),
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
    DECLARE v_existing_bank_name VARCHAR(30);

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

END
-----------------------------------------------------------------------------------------------------------------------------
/* **************************************************************** 
<-- Stored Procedure 10-->
******************************************************************* */
-----------------------------------------------------------------------------------------------------------------------------

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
END

-----------------------------------------------------------------------------------------------------------------------------
/* **************************************************************** 
<-- Stored Procedure 11-->
******************************************************************* */
-----------------------------------------------------------------------------------------------------------------------------

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
END


-----------------------------------------------------------------------------------------------------------------------------
/* **************************************************************** 
<-- Stored Procedure 12-->
******************************************************************* */
-----------------------------------------------------------------------------------------------------------------------------

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
END

-----------------------------------------------------------------------------------------------------------------------------
/* **************************************************************** 
<-- Stored Procedure 13-->
******************************************************************* */
-----------------------------------------------------------------------------------------------------------------------------

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
END

-----------------------------------------------------------------------------------------------------------------------------
/* **************************************************************** 
<-- Stored Procedure 14-->
******************************************************************* */
-----------------------------------------------------------------------------------------------------------------------------

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
END

-----------------------------------------------------------------------------------------------------------------------------
/* **************************************************************** 
<-- Stored Procedure 15-->
******************************************************************* */
-----------------------------------------------------------------------------------------------------------------------------

CREATE DEFINER=`DF-Ticketing`@`%` PROCEDURE `USP_GET_USERS_FA_FP_BY_ENTITY`(
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
        u.entity_id = p_entity_id
        AND ur.status_id = 1
        AND ur.role_id IN (3, 4);
END

-----------------------------------------------------------------------------------------------------------------------------
/* **************************************************************** 
<-- Stored Procedure 16-->
******************************************************************* */
-----------------------------------------------------------------------------------------------------------------------------

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
        
        LEFT JOIN payments p ON tb.ticket_id = p.ticket_id AND p.status_id =14
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
			AND (tb.process_status_id = p_status_id OR p_status_id = '*')
			AND (tb.expense_category_id = p_expense_category_id OR p_expense_category_id = '*')
			AND (t.entity_id = p_entity_id OR p_entity_id = '*')
		ORDER BY tb.created_at DESC;


        -- Show data from temp table
        IF p_limit = '*' THEN
            SELECT * FROM temp_tally_list;
        ELSE
            SET @sql := CONCAT('SELECT * FROM temp_tally_list LIMIT ', CAST(p_limit AS UNSIGNED));
            PREPARE stmt FROM @sql;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;
        END IF;

        DROP TEMPORARY TABLE IF EXISTS temp_tally_list;

END
-----------------------------------------------------------------------------------------------------------------------------
/* **************************************************************** 
<-- Stored Procedure 17-->
******************************************************************* */
-----------------------------------------------------------------------------------------------------------------------------


CREATE DEFINER=`DF-Ticketing`@`%` PROCEDURE `USP_EXPORT_TALLY_DATA`(
    IN p_user_id INT,
    IN p_tally_booking_ids TEXT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            @sqlstate = RETURNED_SQLSTATE,
            @errmsg = MESSAGE_TEXT;
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

        -- Step 5: Compute bank total and get bank_ledger
        SELECT 
            SUM(paid_amount), 
            bank_ledger 
        INTO 
            @payment_grand_total, 
            @bank_ledger
        FROM 
            temp_bank_summary
        WHERE 
            bank_ledger IS NOT NULL
        LIMIT 1;

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

        -- Step 7: Insert into tally_pay_bank (with bank_id and route_id)
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
END

-----------------------------------------------------------------------------------------------------------------------------
/* **************************************************************** 
<-- Stored Procedure 19-->
******************************************************************* */
-----------------------------------------------------------------------------------------------------------------------------

CREATE DEFINER=`ruser`@`%` PROCEDURE `USP_UNDO_TALLY_DATA`(
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
		GROUP BY tpb.tally_pay_bank_id, p.paid_from_bank, bank_ledger;


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
END

-----------------------------------------------------------------------------------------------------------------------------
/* **************************************************************** 
<-- Stored Procedure 20-->
******************************************************************* */
-----------------------------------------------------------------------------------------------------------------------------

CREATE DEFINER=`ruser`@`%` PROCEDURE `USP_REVERT_REPORT`(
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

END

-----------------------------------------------------------------------------------------------------------------------------
/* **************************************************************** 
<-- Stored Procedure 21-->
******************************************************************* */
-----------------------------------------------------------------------------------------------------------------------------