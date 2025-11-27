USE practicsql;
/* ===========================================================
   DML SECTION
   Description: This section contains Data Manipulation Language
   commands used to insert, update, delete, and retrieve data.
   Commands used: INSERT, UPDATE, DELETE, SELECT
   =========================================================== */
   
#Insert values into Customers table

INSERT INTO customers (CustomerID, FirstName, LastName, Country, Score)
VALUES
    (6, 'peter', 'parker', 'USA', 500),
    (7, 'chirsh', 'hem', 'Austrila', NULL),
    (8, 'Ram', 'chy', 'India', 454);
SELECT * FROM customers;

CREATE TABLE Person(
id INT NOT NULL,
person_name VARCHAR(50) NOT NUll,
person_number VARCHAR(50) NOT NULL,
birthdate DATE NOT NULL,
constraint pk_person PRIMARY KEY(id)
);
SELECT * FROM person;

# Insert values from Customer table to Person table

#First creat a new table person.
INSERT INTO person(id, person_name, person_number, birthdate)
SELECT 
    customerid,
    firstname,
    'UNKNOWN',
    '1900-01-01'
FROM customers;

SELECT * FROM person;

#Update the LastName from customers table null to joe.
SET SQL_SAFE_UPDATES = 0;

UPDATE customers
SET LastName= 'joe'
WHERE CustomerID= 3;

SELECT * FROM customers;


#Update the First Name from Ram to Sita in customers table 
 UPDATE customers
 SET FirstName = 'Sita'
 WHERE CustomerID = 8 ;
 
 SELECT * FROM customers;
 
 # Upadate all customer with score null to 0
 UPDATE customers
 SET score = 0
 WHERE score IS NULL;
 
 
SELECT * FROM customers;

#Update the LastName to 'white' and Score to 0 for multiple customers whose CustomerID is 3 or 5.

UPDATE customers
SET LastName = 'joe',
    score = 0
WHERE CustomerID IN (3, 5);

SELECT * FROM customers;

#delete all customers whose CustomerID is 8 from the customers table.

DELETE FROM customers
WHERE CustomerID = 8;

SELECT * FROM customers;

#delete all customers whose score is 0 from the customers table.

DELETE FROM customers
WHERE Score = 0;

SELECT * FROM customers;

# Delete all the data from Person table(Truncate doesnt delet table it delete only data from the table)

TRUNCATE TABLE person;

SELECT * FROM person;