-- CEATING COMMENTS
--comment line  
/*

a comment block in sql
CREATED BY: PHILIP OBIORAH
CREATE DATE: 17/03/2024
DESCRIPTION: THIS QUERY DISPLAY ALL CUSTOMERS FIRST, LAST NAMES AND EMAIL ADDRESS

*/



/*

Created By: Philip Obiorah
Create Date: 16/03/2024
Discription: this query displays all customers first, LastName, and Email Address
*/



SELECT 
	FirstName AS  [Customer First name], 
	LastName AS 'Customer Last Name',
	Email 	AS EMAIL
FROM
	Customer
ORDER BY
	LastName DESC