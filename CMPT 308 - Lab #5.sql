--Matthew Velasquez
--February 14, 2017
--CMPT 308 Lab #5 - SQL Queries - The Joins Three-quel


/*1.) Show the cities of agents booking an order for a customer whose id is 'c006'. 
	  Use joins this time; no subqueries. */

SELECT DISTINCT	
	Agents.city
FROM 
	Agents, Orders
WHERE
	Agents.aid = Orders.aid
	AND Orders.cid = 'c006';
	
	
/*2.) Show the ids of products ordered through any agent who makes at least one order 
	  for a customer in Kyoto, sorted by pid from highest to lowest. Use joins; 
	  no subqueries. */

SELECT DISTINCT	
	A.pid
FROM
	Orders A, (SELECT DISTINCT
					aid
	 		   FROM
					Orders, Customers
	 		   WHERE
					Orders.cid = Customers.cid
		 			AND Customers.city = 'Kyoto') B
WHERE
	A.aid = B.aid

ORDER BY A.pid DESC;


--3.) Show the names of customers who have never placed an order. Use a subquery.

SELECT
	name
FROM
	Customers
WHERE
	cid NOT IN	(SELECT DISTINCT
					cid
		    	 FROM
		 			Orders
		   		);


--4.) Show the names of customers who have never placed an order. Use an outer join.

SELECT DISTINCT
	Customers.name
FROM
	Customers
LEFT JOIN Orders
ON
	Customers.cid = Orders.cid
WHERE
	Orders.cid IS NULL;


/*5.) Show the names of customers who placed at least one order through an agent in
	  their own city, along with those agent(s') names. */

SELECT DISTINCT
	Customers.name, Agents.name
FROM
	Customers, Orders, Agents
WHERE
	Customers.cid = Orders.cid
	AND Agents.aid = Orders.aid
	AND Customers.city = Agents.city;

	
/*6.) Show the names of customers and agents living in the same city, along with the name
	  of the shared city, regardless of whether or not the customer has ever placed an order
	  with that agent. */

SELECT DISTINCT
	Customers.name, Agents.name
FROM
	Orders
FULL OUTER JOIN Customers
ON 
	Customers.cid = Orders.cid
FULL OUTER JOIN Agents 
ON
	 Agents.aid = Orders.aid
WHERE
	Customers.city = Agents.city;


/*7.) Show the name and city of customers who live in the city that makes the fewest different
	  kinds of products. (Hint: Use count and group by on the Products table.) */
	  
SELECT
	Customers.name, Customers.city
FROM	
	Customers, 
	(SELECT 
		city, COUNT (*)
	 FROM
		Products
	 GROUP BY city
	 ORDER BY count ASC
	 LIMIT 1
	 ) Fewest
WHERE
	Customers.city = Fewest.city;
	
	