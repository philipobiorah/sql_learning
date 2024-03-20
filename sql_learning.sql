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
	total = 1.98 or  total =  3.96
	--total IN (1.98, 3.96)  same with above


-- How many invoices were billed to Brussels
SELECT
	InvoiceDate
	BillingAddress,
	BillingCity,
	total
 
FROM 
	Invoice
WHERE 
	BillingCity = 'Brussels' 
ORDER BY 
	InvoiceDate

--How many inoice were billed to Brussels, Orlando or Paris
-- How many invoices were billed in cities 
SELECT
	InvoiceDate
	BillingAddress,
	BillingCity,
	total
 
FROM 
	Invoice
WHERE 
	BillingCity  IN  ( 'Brussels' , 'Orlando', 'Paris')
ORDER BY 
	InvoiceDate

--How many invoices where billed in cities that sttt with B

-- How many invoices were billed in cities that start with B ?
SELECT
	InvoiceDate
	BillingAddress,
	BillingCity,
	total
 
FROM 
	Invoice
WHERE 
	BillingCity  LIKE 'B%'
ORDER BY 
	InvoiceDate


-- How many invoices were billed on 2010-05-22 00:00:00
SELECT
	InvoiceDate
	BillingAddress,
	BillingCity,
	total
 
FROM 
	Invoice
WHERE 
	InvoiceDate = '2010-05-22 00:00:00'
ORDER BY 
	InvoiceDate



-- How many invoices were billed on 2010-05-22 00:00:00
SELECT
	InvoiceDate
	BillingAddress,
	BillingCity,
	total
 
FROM 
	Invoice
WHERE 
	--USING THE DATE FUNCTION
	DATE(InvoiceDate ) = '2010-05-22'
ORDER BY 
	InvoiceDate

-- How many invoices were billed after 2010-05-22 and have totla of less than 3.00
SELECT
	InvoiceDate
	BillingAddress,
	BillingCity,
	total
 
FROM 
	Invoice
WHERE 
	DATE(InvoiceDate ) > '2010-05-22' AND total < 3.00
ORDER BY 
	InvoiceDate
	

--Get all invoice who's billing city is starrts with P or starts with D
SELECT
	InvoiceDate
	BillingAddress,
	BillingCity,
	total
FROM 
	Invoice
WHERE
	BillingCity LIKE 'P%' OR BillingCity LIKE 'D%'

--Get all invoices that are greater than 1.98 from any cities whose name start with P or starts with D?
SELECT
	InvoiceDate
	BillingAddress,
	BillingCity,
	total
FROM 
	Invoice
WHERE
	total > 1.98
	AND
	(BillingCity LIKE 'P%' OR BillingCity LIKE 'D%')

--ORDER OF OPERAITON
--BEMDAS- Brackets, Exponents, multiplication/division, additon/sub



/*
WSDA Music Salses Goal:
They want as many customers as possible to  spend
between $7.00 and $15.00

Sales categories:
Baseline Purchase - between $0.99 and $1.99
Low Purchase - Between $2.00 and $6.99
Target Purchase -  Between $7.00 and $15.00
Top Performer - Above $15.00
*/
SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total,
	CASE 
	WHEN total < 2.00 THEN 'Baseline Purchase'
	WHEN total BETWEEN 2.00  AND 6.99 THEN 'low Purchase'
	WHEN total BETWEEN 7.00 AND 15.00 THEN 'Target Purchase'
	ELSE 'Top Performer'
	END AS PurchaseType
FROM 
	Invoice
ORDER BY
	BillingCity


--FULL list of Customers and Invoices GENERATED
SELECT *

FROM 
	Invoice
	
INNER JOIN  
	Customer
 ON Invoice.CustomerId = Customer.CustomerId
 
 ORDER BY 
	Customer.FirstName
