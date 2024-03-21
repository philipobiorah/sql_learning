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

--FULL list of Customers and Invoices GENERATED ..using ALIAS
SELECT *

FROM 
	Invoice AS i
	
INNER JOIN  
	Customer AS c
 ON i.CustomerId = c.CustomerId
 
 ORDER BY 
	c.FirstName



--FULL list of Customers and Invoices GENERATED ..using ALIAS
SELECT 
	c.LastName,
	c.FirstName,
	i.InvoiceId,
	c.CustomerId,
	i.InvoiceDate,
	i.Total

FROM 
	Invoice AS i
	
INNER JOIN  
	Customer AS c
 ON i.CustomerId = c.CustomerId
 
 ORDER BY 
	c.FirstName


--Description: JOINS on more than two tables | What employees are reposnsible for the 10 heightest indiviual sales


SELECT 
	i.InvoiceId,
	i.CustomerId,
	c.SupportRepId,
	e.EmployeeId,
	e.FirstName,
	e.LastName,
	e.Email,
	i.total
FROM 
	Invoice i
INNER JOIN Customer c
	ON i.CustomerId = c.CustomerId
INNER JOIN Employee e
	ON c.SupportRepId = e.EmployeeId
ORDER BY 
	Total DESC
LIMIT 10
	
--Create a Mainling List of US Customers

SELECT 
	FirstName,
	LastName,
	Address,
	FirstName ||" "|| LastName ||" "|| Address||', ' || City ||" "||  PostalCode AS  'Mailing Address'

FROM 
	Customer
WHERE
	Country = 'USA'
	
	
--Create a Mainling List of US Customers, more fucntions, subtr, upper and lower

SELECT 
	FirstName,
	LastName,
	Address,
	FirstName ||" "|| LastName ||" "|| Address||', ' || City ||" "||  PostalCode AS  'Mailing Address',
	LENGTH(PostalCode),
	substr(PostalCode, 1,5) AS [5 Digit Poatal Code],
	upper(firstname) AS [First Name All caps],
	lower(lastname) AS [ LAST NAME  ALL Lower]

FROM 
	Customer
WHERE
	Country = 'USA'
	

	--Calculate the ages of all Employees

SELECT 
	LastName,
	FirstName,
	BirthDate,
	strftime('%Y-%m-%d', Birthdate) AS [Birthdate No timecode],
	strftime('%Y-%m-%d','now') - strftime('%Y-%m-%d', Birthdate) AS Age
	FROM 
	Employee

--AGGREGATE FUNCTIONS :  What are the all time global sales
 
 
 SELECT
	SUM(Total)  AS [Total Sales],
	AVG(Total) AS [Average Sales],
	MAX(Total) AS [Maximun Sales],
	MIN(Total) AS [Minmum Sales],
	COUNT(*) AS [Sales Count]
FROM 
	Invoice


--AGGREGATE FUNCTIONS :  What are the all time global sales
 
 
 SELECT
	SUM(Total)  AS [Total Sales],
	AVG(Total) AS [Average Sales],
	MAX(Total) AS [Maximun Sales],
	MIN(Total) AS [Minmum Sales],
	COUNT(*) AS [Sales Count]
FROM 
	Invoice

--DESCRIPTION: Grouping in SQL | What are the average iinvoice totals by city


SELECT 
	BillingCity,
	ROUND(AVG(total),2) AS  [Average Sales],
	SUM(total) AS [Total city Sales],
	COUNT(total) AS [Sales Count]

FROM 
	Invoice
-- WHERE 
-- 	BillingCity LIKE 'L%'
GROUP BY
 BillingCity
 
 ORDER BY 
	[Average Sales] DESC
	
LIMIT 10
 
--DESCRIPTION: Grouping in SQL | What are the average invoice totals  greater than $5.00


SELECT 
	BillingCity,
	ROUND(AVG(total),2) AS  [Average Sales],
	SUM(total) AS [Total city Sales],
	COUNT(total) AS [Sales Count]

FROM 
	Invoice

GROUP BY
 BillingCity
 
 HAVING 
	[Average Sales] > 5.00
 
 ORDER BY 
	[Average Sales] DESC
	

 --DESCRIPTION: Grouping in SQL | What are the average iinvoice totals  greater than $5.00 for cities startng with B
 -- WHERE IS used to filter non- aggregate fields while HAVING is used to filter Aggregate fields


SELECT 
	BillingCity,
	ROUND(AVG(total),2) AS  [Average Sales],
	SUM(total) AS [Total city Sales],
	COUNT(total) AS [Sales Count]

FROM 
	Invoice
WHERE 
	BillingCity LIKE 'B%'

GROUP BY
 BillingCity
 
 HAVING 
	[Average Sales] > 5.00
 
 ORDER BY 
	[Average Sales] DESC
	
--GROUPOING MORE THAN ONE FIELD AT A TIME | WHAT ARE THE AVERAGE INVOICE TOTALS BH BILLING AND CITY

--GROUPOING MORE THAN ONE FIELD AT A TIME | WHAT ARE THE AVERAGE INVOICE TOTALS BH BILLING AND CITY


SELECT
	BillingCountry,
	BillingCity,
	ROUND(AVG(total) ,2) AS [AVG Total]
FROM 
	Invoice

 GROUP BY
	BillingCountry, BillingCity


--Description: How is each city performing against the global average sales?

-- (SELECT 
-- 			ROUND(AVG(Total),2)
-- 
-- FROM	
-- 	Invoice)

SELECT
	BillingCity,
	ROUND(AVG(total),2) AS city_avg_total,
	(SELECT 
			ROUND(AVG(Total),2)
             FROM	
	            Invoice)  AS  global_average
	

FROM 
	Invoice
	
GROUP BY
	BillingCity
	
-- HAVING 
-- 	      city_avg_total  <
-- 			(SELECT 
-- 			ROUND(AVG(Total),2)
--              FROM	
-- 	            Invoice)
	      
ORDER BY 
	BillingCity


-- Description: Subqueries without Aggregate functions

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity

FROM 
	Invoice
WHERE 
	--InvoiceDate >  DATE('2012-01-09 00:00:00')


	InvoiceDate  >

	(SELECT 
	InvoiceDate
	FROM 
	Invoice
	WHERE 
	InvoiceId = 251)


	-- Description: Returning multple values form a subquery

SELECT
	BillingCity,
	BillingCountry,
	BillingAddress,
	InvoiceDate
FROM	
	Invoice

WHERE 
	InvoiceDate  IN


(SELECT
	InvoiceDate
FROM
	Invoice
WHERE 
	InvoiceId  IN (251, 252, 254))


--Description: Subqueries and DISTINCT | Which tracks are not selling? 


SELECT  
	Track.TrackId,
	Track.Name,
	Track.Composer
	--Track.UnitPrice
	

FROM 
	Track
	
LEFT  JOIN  InvoiceLine   
	ON  InvoiceLine.TrackId = Track.TrackId
LEFT JOIN Invoice
		ON  Invoice.InvoiceId = InvoiceLine.InvoiceId
	
WHERE	
	Invoice.InvoiceId IS NULL
	
ORDER BY 
	Total DESC
	
	
-----short format (faster) Subqueries and DISTINCT | Which tracks are not selling? 
SELECT 
	TrackId,
	Name,
	Composer

FROM 
	Track
WHERE 
	TrackId NOT IN

(SELECT DISTINCT
	TrackId
FROM
	InvoiceLine
ORDER BY 
	TrackId)
--CREATING A VIEW
CREATE VIEW  V_nosales_tracks AS
SELECT  
	Track.TrackId,
	Track.Name,
	Track.Composer
	--Track.UnitPrice
	

FROM 
	Track
	
LEFT  JOIN  InvoiceLine   
	ON  InvoiceLine.TrackId = Track.TrackId
LEFT JOIN Invoice
		ON  Invoice.InvoiceId = InvoiceLine.InvoiceId
	
WHERE	
	Invoice.InvoiceId IS NULL
	
ORDER BY 
	Total DESC
	



--MODIFYING A VIEW
DROP VIEW "main"."V_Avg_Total";
CREATE VIEW V_Avg_Total AS

SELECT 
	ROUND(AVG(Total),2) AS avg_total
FROM
	Invoice
	

--DELETING A VIEW
DROP VIEW 
	V_Avg_Total

--INSERTING INTO A TABLE


INSERT INTO
	Artist(Name)
	VALUES("Davido")
	
	
--UPDATE TABLE
UPDATE
	Artist
SET Name = "Indaboski Bahose"

WHERE 
  ArtistId  = 276