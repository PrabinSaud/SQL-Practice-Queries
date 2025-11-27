/* ===========================================================
   SQL PRACTICE QUESTIONS
   Description: This section contains 20 basic SQL questions 
   created for practicing SELECT, WHERE, ORDER BY, DDL, and DML.
   Topics covered: SELECT, WHERE, ORDER BY, ASC/DESC, INSERT, 
   UPDATE, DELETE, CREATE TABLE
   =========================================================== */

USE practicsql;

-- 1. Show all rows from the sales table.
select * from sales;

-- 2. Select only Product and Price columns.
select product,price from sales;

-- 3. Find all products where Quantity is greater than 3.
select product 
from sales
where quantity>3;

-- 4. List all Electronics category items.
select product,category
from sales
where category='Electronics';

-- 5. Show all products priced above 5000.
select product,price
from sales
where price > 5000;

-- 6. Display all products ordered by Price in ascending order.
select product,price
from sales
order by(price) asc;

-- 7. Display all products ordered by Quantity in descending order.
select product,quantity
from sales
order by(quantity) desc;

-- 8. Find the product with SaleID = 5.
select product 
from sales
where SaleID=5;

-- 9. Show all products whose name starts with 'B'.
select product
from sales
where product like("B%");

-- 10. Show the total number of items sold (sum of Quantity).
select sum(quantity) as total_item_sold
from sales;

-- 11. Show all unique categories.
select distinct category
from sales;

-- 12. Count how many Electronics products are there.
select count(category) as Electronics
from sales
where category='electronics';

-- 13. Show all products that cost less than 3000.
select product,price
from sales
where price<3000;

-- 14. Show products where Quantity is between 2 and 5.
select product,quantity 
from sales
where quantity between 2 and 5; -- (where quantity >2 and quantity <5;)

-- 15. Order products by Category, then by Price.
select product,category,price
from sales
order by catogry,price;

-- 16. Rename the table to sales_data (DDL).
rename table sales to sale_data;

-- 17. Add a new column named discount (INT) to the table (DDL).
alter table sale_data
add Discount int  ;
select * from sale_data;

-- 18. Insert a new row into the table with any valid values (DML).
insert into sale_data
values(11,'iphone','Electronics',7,58000,null);

-- 19. Update the price of 'Laptop' to 60000 (DML).
update sale_data
set price=60000
where SaleID = 1;

-- 20. Delete rows where Category = 'Accessories' (DML).
delete from sale_data
where Category='Accessories';

select * from sale_data;
