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

*/
/* **************************************************************** 
<-- Changes neede to be done -->
******************************************************************* */

create function for ledger code auto generation  and while entering ledfrt add the ledger typr that is Program or General and Administrative  expense

create the function and event to cretae new date on 1st april next year.(Either databse or Backend)

In config for entity , emtity code addition feature should be given 

Finance team want to change the process. Initially 1st ticket used to go to Finance Processor who would check the tickets and then proccessed it.
Then  the finance approver will approve or reject the ticket . If approved then Finance Approver will do the payments processing . 
But now they want once Finace Approver approves, the ticket should again go to the Finance Processor who will do the payments.


-----------------------------------------------------------------------------------------------------------------------------
/* **************************************************************** 
<-- Procurement-->
******************************************************************* */
-----------------------------------------------------------------------------------------------------------------------------
for procurement there should be admin who can raise ticket for any entity, any cost center















