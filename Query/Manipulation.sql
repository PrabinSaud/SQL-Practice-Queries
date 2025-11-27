use practicsql;

/*	=====================================================================================
		String Manipulation: UPPER, LOWER, CONCAT, SUBSTRING, REPLACE, and Title Case
	=====================================================================================*/
select 
'Prabin' as Name,
lower('Prabin') as lower_Name,
upper('Prabin') as Upper_Name,
substring('prabin',1,3) as strings;


select 
FirstName,
LastName,
concat(FirstName,' ' ,LastName) as FullName,
substring(firstName,1,3) as Strings,
replace(FirstName, 'a', '@') as ReplacedName
from customers;





/*	=====================================================================================
		Date Manipulation: YEAR, MONTH, DAY, DATE_ADD, DATE_SUB, DATEDIFF, and DATE_FORMAT
	=====================================================================================*/

select 
OrderDate,
year(OrderDate) as Order_Years,
month(OrderDate) as Order_Month,
day(OrderDate) as Order_Day,
monthname(OrderDate) as Month_Name,
dayname(OrderDate) as Day_name,
monthpart(orderdate)
from orders;

