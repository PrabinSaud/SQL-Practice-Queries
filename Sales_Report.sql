

/* ===================== SQL TABLE JOINS Project =======================
Task: Using SalesDB, retrieve a list of all orders, along with the related 
   customer, product, and employee details. 
   For each order, display:
   Order ID, Customer's name, Product name, Sales, Price, Sales person's name 
========================================================================= */

select 
o.OrderID,
c.FirstName,
c.LastName,
p.Product as Product_Name,
o.Sales as Sales_Amount ,
p.Price as Product_Price,
e.FirstName as Employee_Name
from orders as o
left join customers as c
on o.OrderId = c.customerID
left join products as p
on o.ProductId = p.ProductID
left join employees as e
on o.OrderID = e.EmployeeID;



/* ========================================================================= */
		# SQL Joins Report: Cleaned Sales Data Without NULL Records
/* ========================================================================= */

create table  sales_report as
select 
o.OrderID,
c.FirstName,
c.LastName,
p.Product as Product_Name,
o.Sales as Sales_Amount ,
p.Price as Product_Price,
e.FirstName as Employee_Name
from orders as o
left join customers as c
on o.OrderId = c.customerID
left join products as p
on o.ProductId = p.ProductID
left join employees as e
on o.OrderID = e.EmployeeID;

select * from sales_report;

delete from sales_report
where FirstName is null;

select * from sales_report;


/* ========================================================================= */