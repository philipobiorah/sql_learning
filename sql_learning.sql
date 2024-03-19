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



--How many customers purchases two sondg as $0.99 each
--hint 2 * 0.99 = 1.98
SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	total = 1.98
ORDER BY 
	InvoiceDate    


-- How many invoices exist betwen $1.98 and 5.00
SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total

FROM 
	Invoice
WHERE 
	total BETWEEN 1.98 AND 5.00

-- How many invoices do we have that are exactly $1.98 or $3.96?
SELECT
	InvoiceDate
	BillingAddress,
	BillingCity,
	total
 
FROM 
	Invoice
WHERE 
	total = 1.98 or  3.96