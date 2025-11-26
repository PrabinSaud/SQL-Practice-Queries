/* ========================= SQL PRACTICE QUESTIONS (50) ========================= */

/* 1. Select all rows from the customers table. */
use practicsql;
select *
from customers;

/* 2. Show CustomerName and Country from the customers table. */
select 
FirstName as CustomerName,
Country
from customers;

/* 3. List all products whose price is more than 20. */
select
Product,
Price
from products
where price>20;

/* 4. Show all employees who work in the "Sales" department. */
select
FirstName 
from employees
where Department = 'Sales';

/* 5. Show orders placed after 1 January 2024. */
select 
ProductID
from orders
where OrderDate>2025-01-01;

/* 6. Show customers from India. */
select 
FirstName 
from customers 
where Country = 'India';

/* 7. Show products with price between 100 and 500. */
select 
Product,
Price
from sale_data
where Price between 100 and 500;


/* 8. Show customers whose names start with 'A'. */
select
FirstName
from customers 
where FirstName='A%';

/* 9. Show orders that have NULL OrderStatus. */

select 
OrderId 
from orders
where OrderStatus is null;

/* 10. Show products not in the "Electronics" category. */
select 
Product
from sale_data
where Category = 'Electronics';


/* 11. Show all customers sorted by FirstName. */
select 
FirstName
from customers 
order by FirstName;

/* 12. Show the top 5 most expensive products. */
select
Product 
from sale_data
order by Price limit 5;


/* 13. Show orders sorted by OrderDate (latest first). */
select
OrderDate
from orders
order by Orderdate desc;

/* 14. Show employees sorted by Department then FirstName. */
select 
Department,
FirstName
from employees 
order by Department asc, FirstName asc;


/* 15. Show the cheapest 3 products. */
select 
Product
from sale_data
order by Price asc limit 3;

/* 16. Count how many customers exist. */
select 
count(CustomerID) as CustomerCount
from customers;

/* 17. Find the total sales amount from orders. */
select 
sum(Price) as TotalAmount
from products;

/* 18. Calculate average price of all products. */
select
avg(Price) as AvgPrice
from products;

/* 19. Count how many orders each customer has placed. */
select 
    CustomerID,
    COUNT(*) as Total_Orders
from orders
group by CustomerID;


/* 20. Show the highest product price. */
select
max(Price) as HighestPrice
from products;


/* 21. Show minimum salary from employees. */
select 
min(Salary) as LowestSalary
from employees;

/* 22. Count number of employees in each department. */
select
Department,
count(*) as Total_Employee
from employees
group by Department;

/* 23. Show total sales per product. */
select
Product,
count(*) as Total_Sales
from products
group by product;

/* 24. Show total sales per month. */
select 
    DATE_FORMAT(OrderDate, '%Y-%m') as Month,
    SUM(Sales) as Total_Sales
from orders
group by DATE_FORMAT(OrderDate, '%Y-%m')
order by Month;


/* 25. Find total number of products per category. */
select 
    Category,
    count(ProductID) as Total_Products
from products
group by Category
order by Category;


/* 26. Show categories that have more than 5 products.*/ 
select 
    Category,
    count(ProductID) as Total_Products
from products
group by Category
having count(ProductID) > 5
order by Total_Products desc;


/* 27. Show customers having more than 2 orders. */
select 
CustomerID, 
count(OrderID) as Total_Orders
from orders
group by CustomerID
having count(OrderID) > 2
order by Total_Orders desc;

/* 28. Show products sold more than 50 units (sum). */

select
    ProductID,
    SUM(Quantity) as Total_Units_Sold
from orders
group by ProductID
having SUM(Quantity) > 50
order by Total_Units_Sold desc;

/* 29. Show departments having more than 2 employees. */
select 
Department,
count(EmployeeID) as Total_Employee
from employees
group by Department
having count(EmployeeID) > 2
order by Total_Employee;


/* 31. Show orders with customer names using INNER JOIN. */
select 
o.OrderID,
c.FirstName
from orders as o
inner join Customers as c
on o.CustomerID = c.CustomerID;

/* 32. Show all customers with their orders using LEFT JOIN. */
select 
*
from customers as c
left join orders as o
on c.CustomerID = o.CustomerID ;

/* 33. Show all orders with product names. */
select
o.OrderID,
p.ProductID,
p.Product
from orders as o
left join products as p
on o.ProductID = p.ProductID
order by OrderID;


/* 34. Show all employees and the orders they handled. */
select 
* 
from employees as e
left join orders as o
on e.EmployeeId = o.EmployeeID
order by EmployeeID;

/* 35. Display OrderID, CustomerName, ProductName, EmployeeName. */
select 
o.OrderID,
c.FirstName,
c.LastName,
p.Product as ProductName,
e.FirstName as EmployeeName
from orders as o
left join customers as c
on o.CustomerID = c.CustomerID
left join products as p
on o.ProductID = p.ProductID
left join employees as e
on o.SalesPersonID = e.EmployeeID
order by o.OrderID;


/* 36. Show customers who never placed any order. */
select 
c.FirstName,
c.LastName
from customers as c 
left join orders as o
on c.CustomerID = o.CustomerID
where o.OrderID is null;

/* 37. Show products that have never been sold. */
select
p.Product
from products as p
left join orders as o
on p.ProductID = o.ProductID
where o.OrderID is null;



/* 38. Show order details with price and total amount (quantity * price). */
select 
o.OrderID,
o.Quantity,
p.Price ,
(o.Quantity * p.Price) as Total_Amount
from orders as o
left join products as p
on o.ProductID = p.ProductID;


/* 39. Join 4 tables: orders, customers, products, employees. */
select 
o.OrderID,
c.FirstName,
c.LastName,
p.Product,
e.FirstName as Employee_Name 
from orders as o
left join customers as c
on o.CustomerId = c.CustomerID
left join products as p
on o.ProductID = p.ProductID
left join employees as e
on o.SalesPersonID = e.EmployeeID;


/* 40. Show products priced above the average price. */
select 
ProductID,
Product,
Price
from products
where Price > (select avg(Price) from products);




/* 42. Show customers who placed the highest number of orders. */
select 
CustomerID,
count(OrderID) as total_orders
from orders
group by CustomerID
order by total_orders desc
limit 1;



/* 43. Show products that have the lowest price. */
select 
ProductID,
Product,
Price
from products
where Price = (select min(Price) from products);



/* 44. Show employees whose salary is more than the company average. */
select 
EmployeeID,
FirstName,
Salary
from employees
where salary > (select avg(salary) from employees);



/* 45. Show customers who ordered the most expensive product. */
select 
c.CustomerID,
o.OrderID,
p.Product,
p.Price
from orders o
join products as p 
on o.productid = p.productid
join customers as c
on o.customerid = c.customerid
where p.price = (select max(price) from products);


/* 46. Retrieve common OrderIDs from orders and ordersarchive using UNION. */
select 
OrderID 
from orders
intersect
select 
OrderID 
from ordersarchive;



/* 47. Combine both tables and remove duplicates using UNION. */
select * 
from orders
union
select * 
from ordersarchive;


/* 48. Combine both tables including duplicates using UNION ALL. */
select * 
from orders
union all
select * 
from ordersarchive;

/* 49. Update product price by +10% for all Electronics products. */
update products
set price = price * 1.10
where category = 'electronics';



/* 50. Delete all orders where OrderStatus is NULL. */
delete from orders
where orderstatus is null;
   
   
   
   
/* ============================================================================== */
