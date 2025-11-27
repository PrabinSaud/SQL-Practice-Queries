USE practicsql;
SELECT * 
FROM customers;

#Group by a country which have score 900
SELECT country
FROM customers
WHERE score=900
GROUP BY country;

#Group by a country and stotal score
SELECT country,SUM(score)
FROM customers
GROUP BY country;

#Finding total number of customer and score from each country
SELECT Country,SUM(score)AS Score ,COUNT(customerid) AS CustomerId
FROM customers
GROUP BY country;

/*Finding the score for country 
only customers with a score not equal to 0
 and return only those countries with average score greater than 430*/
 SELECT country,AVG(score) AS Average_score
 FROM customers
 WHERE score!=0
 GROUP BY country
 HAVING AVG(score)>450; 
 
 #Retuer unique value of country
 SELECT DISTINCT country
 FROM customers;
 
 #TOP 3 customers with highest score 
 SELECT *
 FROM customers 
 ORDER BY score DESC LIMIT 3;
 
 #List out top 2 recent orders
 SELECT * 
 FROM orders
 ORDER BY orderdate DESC LIMIT 2;
 
 #Create a new table students
 CREATE TABLE Students(
 Id INT NOT NULL,
 Firstname VARCHAR(50) NOT NULL,
 Lastname VARCHAR(50) NOT NULL,
 Birthdata DATE,
 Numbers VARCHAR(50) NOT NULL,
 CONSTRAINT students PRIMARY KEY(Id)
 )
 
