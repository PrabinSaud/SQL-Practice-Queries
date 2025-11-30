use Mydatabase

/* ============================
        SECTION A — EASY
   ============================ */

-- 1. Find customers who never placed an order.
select 
c.CustomerID,
c.FirstName,
c.LastName,
Country
from Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
where o.OrderID is null


-- 2. Count total orders per customer.
select 
c.CustomerID,
count(o.OrderID) as TotalOrders

from Customers as c
left join Orders as o
on c.CustomerID = o.CustomerID
group by (c.CustomerID)

-- 3. Find customers whose first name starts and ends with the same letter.
select
FirstName
from Customers
where lower(left(FirstName,1)) =lower(right(FirstName,1))


-- 4. Show all orders where OrderDate > ShipDate.
select
OrderID,
OrderDate,
ShipDate
from Orders
where OrderDate > ShipDate

-- 5. Find all ProductIDs that appear more than once in OrdersArchive.
select
ProductID,
count(ProductID) as ProductCount
from OrdersArchive
where ProductID > 1
group by ProductID 

-- OR

select
ProductID,
count(ProductID) as ProductCount
from OrdersArchive
group by ProductID 
having count(ProductID) > 1;


-- 6. Get the full name of each customer (FirstName + LastName).

select 
FirstName,
LastName,
concat(FirstName, LastName) as FullName
from Customers

 --OR

select 
FirstName,
LastName,
FirstName + ' '+ LastName as FullName
from Customers


-- 7. Retrieve orders where ShipAddress is NULL.
select
OrderID,
ShipAddress
from Orders
where ShipAddress is null


-- 8. List distinct cities from Customer addresses.

select distinct Country
from Customers



-- 9. Find ProductIDs that appear in both Orders and OrdersArchive.
select 
ProductID
from Orders
intersect
select 
ProductID
from OrdersArchive


-- 10. Get customers with more than 3 orders (combined from both tables).

select 
CustomerID,
count(*) as totalorders
from (
    select CustomerID, OrderID from Orders
    union all
    select CustomerID, OrderID from OrdersArchive
) as allorders
group by CustomerID
having count(*) > 3;




