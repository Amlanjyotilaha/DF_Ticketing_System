-----------------------------------------------------------------------------------------------------------------------------
/* **************************************************************** 
<-- Reimburesement-->
******************************************************************* */
-----------------------------------------------------------------------------------------------------------------------------
/* **************************************************************** 
<-- Changes Done-->
******************************************************************* */

/*
-- Changes asked by finance team

-- Remove Report name 
-- Emoployee ID in Finance Approver emp details
-- remeove time from date time
-- remove expected date of payment
-- in travel start odo , end odo pic is not mandatory and value should be mandatory and give a check box if asking Do you have Odometer readings? 
if not then direct distance adding 
in travel add auto/taxi 
-- for reimbursement both manageer and finace have option of amout edit 
-- validate invoice number , date , amount if matching with above section or even available in database 


-- to be added in ticket for all type of expences(Asked by Finance)

-- New Table 
Table Name Budget Type
Revenue Budget 
Capex Budget
 (can be changed by manager and finance)


-- New Table
Table name Expense
Program Expense
G & A Expences
(change by manager and finance)

-- New Table
Table Name Contribution type
FC
NFC

bank excel download
bank payment excel
payment utr excel download
for tally excel 

According to expense the ledgers will come . ie. for program expense only program ledgers will come

-- Changes found by technology team
employee_number need to be varchar in employees, employees_history, users, user_history and users tables 

change statue 
Active to Initiated

Edit employee details upload and while uploading also check academic_cost_center, academic_entity and insert those

employee details upload change according to latest list of details

Remember to change the ledger type to 1 and 2 for Program amd Admin repectively



Chnages asked by user
Hover on profile show option of profile and log out
Report Edit, and Recall option

-- Changes asked by finance team
Finance team want to change the process. Initially 1st ticket used to go to Finance Processor who would check the tickets and then proccessed it.
Then  the finance approver will approve or reject the ticket . If approved then Finance Approver will do the payments processing . 
But now they want once Finace Approver approves, the ticket should again go to the Finance Processor who will do the payments.


-- Changes In Fianace
In orgbank change email in main for entity 3 for RBL
Ledger addition for RBL and status 1 for entity 3

*/
/* **************************************************************** 
<-- Changes neede to be done -->
******************************************************************* */

create function for ledger code auto generation  and while entering ledfrt add the ledger typr that is Program or General and Administrative  expense

create the function and event to cretae new date on 1st april next year.(Either databse or Backend)

In config for entity , emtity code addition feature should be given 

In Config there will be a org bank edit add page where Finance can add bank, delete them , change them




DF FP = Pavan
DET who FP = nayana
DS who FP = Gowri

ADD as User
Df FA  = dfpayments@dfmail.org
DET FA = detpayments@dfmail.org
DS FA = sandboxaccounts@dfmail.org


INSERT INTO `df_ticketing`.`users` (`user_name`, `work_email`, `entity_id`, `cost_center_id`, `job_title`, `work_location`, `sended_email`, `status_id`, `timestamp`) VALUES ('DET Finance', 'detpayments@dfmail.org', '2', '1', 'Finance Approver', '9338+8JV, Hosur - Unkal Bypass Rd, Chetana Colony, Vidya Nagar, Hubballi, Karnataka 580021', '0', '1', NOW());
INSERT INTO `df_ticketing`.`users` (`user_name`, `work_email`, `entity_id`, `cost_center_id`, `job_title`, `work_location`, `sended_email`, `status_id`, `timestamp`) VALUES ('DS Finance', 'sandboxaccounts@dfmail.org', '3', '1', 'Finance Approver', 'Foundation for Sandboxstartup Initiatives, Gokul Rd, next to International Airport, opposite Gokul, Gokul, Hubballi, Karnataka 580030', '0', '1', NOW());


FP gets the Approve and Reject option and later all entity only 1 person will be doing FP for all the 3 entities

Also when manager approves or finance approves a amount the mail should have the amount and remarks

Payment Type 
add for RBL make NFT , RTS, TPT
Add for KOTAK make RTGS, NEFT, IFT  
INSERT INTO `payment_type` VALUES (5,'NEFT'),(6,'TPT'),(7,'RTS')



if beni bank and org bank is same ie both are RBL or both are Kotak identify using IFSC , then Payment type will be TPT for RBL and IFT for Kotak
other banks will be NEFT for Kotak and NFT for RBL 
and for DS if bank is selected as Other Bank then it will be NEFT with below excel format 

Entity 3 (DS) other bank
Trandsaction ID, Benef Name, Account number, IFSC , Account Bank Name,Amount

INSERT INTO `df_ticketing`.`organization_bank` (`org_id`, `entity_id`,,`account_type`, `entity_bank_name`,`entity_bank_account_no`, `entity_name_on_bank`, `bank_ledger`, `status_id`, `created_at`) VALUES ('1', '3','Other Bank', 'Other Bank','Other bank', 'Foundation for Sandboxstartup Initiatives', 'Other Bank', '1', Now());

-----------------------------------------------------------------------------------------------------------------------------
/* **************************************************************** 
<-- Procurement-->
******************************************************************* */
-----------------------------------------------------------------------------------------------------------------------------
for procurement there should be admin who can raise ticket for any entity, any cost center


















