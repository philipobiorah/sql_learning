--Query the right table in the information_schema
SELECT table_name
FROM information_schema.tables
--Specify the correct table_schema value
WHERE table_schema = 'public'




 -- Query the right table in information_schema to get columns
SELECT column_name, data_type 
FROM information_schema.columns
WHERE table_name = 'university_professors' AND table_schema = 'public';

-- Create table for professors
CREATE TABLE professors(
    firstname text,
    lastname text
);


-- Create a table for the professors entity type
CREATE TABLE professors (
 firstname text,
 lastname text
);

-- Print the contents of this table
SELECT * 
FROM professors


-- Create a table for the universities entity type
CREATE Table universities (
    university_shortname text,
    university text,
    university_city text
);





-- Print the contents of this table
SELECT * 
FROM universities


-- Add the university_shortname column
ALTER TABLE professors
ADD COLUMN university_shortname text;

--Print the contents of this table
SELECT * 
FROM professors

--copy datafrom existing table to a new one
INSERT INTO organizations
SELECT DISTINCT organization,
organization_sector FROM university_professors


--INSERT INTO statement
INSERT INTO table_name (column_a, column_b)
VALUES ("value_a", "value_b")


--RENAME a COLUMN 
ALTER TABLE table_name
RENAME COLUMN old_name TO new_name;


-- Delete the university_shortname column
ALTER TABLE affiliations
DROP  COLUMN university_shortname;



-- Delete the university_professors table
DROP TABLE university_professors;


-- Calculate the net amount as amount + fee
SELECT transaction_date, CAST(amount AS integer) + CAST(fee AS integer) AS net_amount 
FROM transactions;


-- Change the type of firstname
ALTER TABLE professors
ALTER COLUMN firstname
TYPE varchar(64);

-- Convert the values in firstname to a max. of 16 characters
ALTER TABLE professors 
ALTER COLUMN firstname 
TYPE varchar(16)
USING SUBSTRING(firstname FROM 1 FOR 16)