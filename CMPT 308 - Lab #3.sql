
--Matthew Velasquez
--January 31, 3017
--Lab #3 - Getting Started with SQL Queries


--1.) List the order number and total dollars of all orders.

SELECT 
	ordNumber, totalUSD
FROM
	Orders;

	

--2.) List the name and city of agents named Smith.

SELECT 
	name, city
FROM 
	Agents
WHERE
	name = 'Smith';



--3.) List the id, name, and price of products with quantity more than 200,100.

SELECT 
	pid, name, priceUSD
FROM 
	Products
WHERE
	quantity > 200100;



--4.) List the names and cities of customers in Duluth.

SELECT 
	name, city
FROM 
	Customers
WHERE
	city = 'Duluth';



--5.) List the names of agents not in New York and not in Duluth.

SELECT 
	name
FROM 
	Agents
WHERE
	city <> 'New York'
	AND city <> 'Duluth';



--6.) List all data for products in neither Dallas nor Duluth that cost US$1 or more. 

SELECT *
	
FROM 
	Products
WHERE
	city <> 'Dallas'
	AND city <> 'Duluth'
	AND priceUSD >= 1;



--7.) List all data for orders in February or May.

SELECT *
	
FROM
	Orders
WHERE
	month = 'May'
	OR month = 'Feb';



--8.) List all data for orders in February of US$600 or more.

SELECT *
	
FROM 
	Orders
WHERE
	month = 'Feb'
	AND totalUSD >= 600;



--9.) List all orders from the customer whose cid is c005.

SELECT *
	
FROM 
	Customers, Orders
WHERE
	Customers.cid = Orders.cid
	AND Customers.cid = 'c005';

