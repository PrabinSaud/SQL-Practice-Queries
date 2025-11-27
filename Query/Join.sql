/* ===========================================================
   SQL JOIN SECTION
   Description: Practice queries using INNER JOIN, LEFT JOIN,
   RIGHT JOIN, FULL JOIN (if supported), and SELF JOIN.
   =========================================================== */
   
select * from  customers;
select * from orders;

# join table customers and orders(inner join)
select *
from customers as c
inner join orders as o
on c.CustomerID = o.OrderID;

/* ===========================================================*/

# Get all the customer along with orders but noly from the order that placed
select 
c.CustomerID,
c.FirstName,
c.LastName,
c.Country,
o.OrderDate,
o.OrderStatus,
o.OrderID,
o.Sales
from customers as c
inner join orders as o
on c.CustomerID = o.OrderID;

/* ===========================================================*/

# Join customers table with orders table(Left Join)
select 
c.CustomerID,
c.FirstName,
c.LastName,
c.Country,
o.OrderDate,
o.OrderStatus,
o.OrderID,
o.Sales
from customers as c
left join orders as o
on c.CustomerID = o.OrderID;

/* ===========================================================*/

#join table order with customers where the orders are not placed (Left join)
select 
o.OrderDate,
o.OrderStatus,
o.OrderID,
o.Sales,
c.CustomerID,
c.FirstName,
c.LastName,
c.Country
from orders as o
left join customers as c
on o.OrderID =  c.CustomerID;

/* ===========================================================*/

#Join table customers with orders (right join)

select 
c.CustomerID,
c.FirstName,
c.LastName,
c.Country,
o.OrderDate,
o.OrderStatus,
o.OrderID,
o.Sales
from customers as c
right join orders as o
on c.CustomerID = o.OrderID;

/* ===========================================================*/

#join table customer with orders(full join)

SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Country,
    o.OrderDate,
    o.OrderStatus,
    o.OrderID,
    o.Sales
FROM customers c
LEFT JOIN orders o
    ON c.CustomerID = o.CustomerID

UNION

SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Country,
    o.OrderDate,
    o.OrderStatus,
    o.OrderID,
    o.Sales
FROM customers c
RIGHT JOIN orders o
    ON c.CustomerID = o.CustomerID;

/* ===========================================================*/

# Get all the customers name who had't order.(left join table Customers with Orders)
select * 
from customers as c
left join orders as o
on c.CustomerID = o.OrderID
where o.OrderID is null;

# Get all the customers details who had order(right join table Orders with Customers)
select * 
from Orders as o
right join Customers as c
on o.OrderID = c.CustomerID 
where c.CustomerID is not null;

