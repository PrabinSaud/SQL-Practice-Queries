use ola;
select * from products;

/* ============================================================
	   TOPIC: Window Function Analysis on Products Table
	   DESCRIPTION: Using SUM(), COUNT(), AVG(), MIN(), MAX(),
       RANK() with PARTITION BY to calculate category-wise totals.
   ============================================================ */



-- Find the total sales across all products
-- Find total sale for each category
-- Find the total sale for each combination of category and quantity
-- Additionally provides details such price, quantity
SELECT 
	product_id,
	product_name,
	category,
	price,
	quantity,
	SUM(price) OVER() AS totalsale,
	SUM(price) OVER(PARTITION BY category ) AS saleby_category,
	SUM(price) OVER(PARTITION BY category, quantity ) AS saleby_category_quantity
FROM products;



-- Find the sum and number of quantities for each category  from products table.
SELECT 
	product_id,
	product_name,
	category,
	quantity,
	SUM(quantity) OVER(PARTITION BY category) AS Total_category_quantity,
	COUNT(quantity) OVER(PARTITION BY category) AS  TotalCount_category_quantity
FROM products;



-- Find the percentage contribution of each product's sales to total sales
SELECT 
    product_id,
    product_name,
    category,
    price,
    quantity,
    (price * quantity) AS product_sale,
	SUM(price * quantity) OVER() AS total_sales,
	ROUND((price * quantity) / SUM(price * quantity) OVER() * 100,2) AS percentage_contribution
FROM products;



-- Find the the average price across all orders
-- Find the average price for each category
-- Additionally provides details such as products_id, product_name and price.
SELECT 
	product_id,
	product_name,
	price,
	quantity,
	ROUND(AVG(price) OVER(),2)AS avg_price,
	ROUND(AVG(price) OVER(PARTITION BY category),2) AS  avg_pricebycategory,
	ROUND(AVG(price) OVER(PARTITION BY category,product_id,product_name),2) AS avg_pricebyadditionallinfo
FROM products;



-- Find the all product where price are higher than the average price across products.
SELECT 
*
FROM(
	SELECT 
		product_id,
		product_name,
		price,
		quantity,
		ROUND(AVG(price) OVER(),2)AS avg_price
	FROM products) AS t
    WHERE price > avg_price;
    
    
    
-- Find the highest price from product by category table
SELECT 
	product_id,
	product_name,
	price,
	quantity,
    MAX(price) OVER() AS maxprice,
     MAX(price) OVER(PARTITION BY category) AS maxprice
FROM products;


-- Find the highest price from product by category table
SELECT 
	product_id,
	product_name,
	price,
	quantity,
    MIN(price) OVER() AS minprice,
    MIN(price) OVER(PARTITION BY category) AS minprice
FROM products;


-- Find the product_name who has highest price
SELECT
*
FROM(
	SELECT 
		product_id,
		product_name,
		price,
		quantity,
		MAX(price) OVER() AS highestprice
	FROM products) AS t
WHERE price =highestprice;



-- Ranking the products by price Most Expensive to Chepest.
SELECT 
    product_id,
    product_name,
    price,
    RANK() OVER (ORDER BY price DESC) AS price_rank
FROM products;



-- Find the sum of quantity for each category  from products table using Window function.
SELECT 
	product_id,
	product_name,
	category,
	quantity,
	SUM(quantity) OVER(PARTITION BY category ORDER BY product_id
	ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) AS Total_category_quantity,
	SUM(quantity) OVER(PARTITION BY category ORDER BY product_id
	ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Total_category_quantity
FROM products;



-- Find the Average of quantity for each category  from products table using Window function.
SELECT 
	product_id,
	product_name,
	category,
	quantity,
	AVG(quantity) OVER(PARTITION BY category ORDER BY product_id) AS avg_quantity,
	AVG(quantity) OVER(PARTITION BY category ORDER BY product_id
	ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) AS AVG_category_quantity
FROM products;