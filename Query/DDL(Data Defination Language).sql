/* ===========================================================
   DDL SECTION
   Description: This section contains Data Definition Language 
   commands used to create, modify, and remove database objects.
   Commands used: CREATE, ALTER, DROP, TRUNCATE
   =========================================================== */


#Create a table Person
CREATE TABLE Person(
id INT NOT NULL,
person_name VARCHAR(50) NOT NUll,
person_number VARCHAR(50) NOT NULL,
birthdate DATE NOT NULL,
constraint pk_person PRIMARY KEY(id)
);

SELECT * FROM person;

#Alter the table , add email column to person table
ALTER TABLE person
ADD email VARCHAR(50) NOT NULL;

#Removing person_number from person table
ALTER TABLE person
DROP COLUMN person_number;

#Remove table person from database
DROP TABLE person;
