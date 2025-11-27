use practicsql;
select 
* 
from orders
union
select 
* 
from ordersarchive
order by(OrderID);

select 
OrderID,
ProductID,
OrderStatus
from orders
union
select 
OrderID,
ProductID,
OrderStatus
from ordersarchive
order by OrderID;


select 
OrderID,
ProductID,
OrderStatus
from orders
union all
select 
OrderID,
ProductID,
OrderStatus
from ordersarchive
order by OrderID;


select 
OrderID,
ProductID,
OrderStatus
from orders
except
select 
OrderID,
ProductID,
OrderStatus
from ordersarchive
order by OrderID;



select 
OrderID,
ProductID,
OrderStatus
from orders
INTERSECT
OrderID,
ProductID,
OrderStatus
from ordersarchive
order by OrderID;
