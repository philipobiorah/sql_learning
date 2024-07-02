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