--Matthew Velasquez
--February 21, 2017
--CMPT 308 Lab #6 - Interesting and Painful Queries


/*1.) Display the name and city of customers who live in any city that makes the most
	  different kinds of products. (There are two cities that make the most different
	  products. Return the name and city of customers from either one of those.) */

SELECT 
	name, city
FROM 
	Customers
WHERE 
	city IN (SELECT
				city
		 	 FROM
				Products
		 	 GROUP BY city
		 	 ORDER BY count (*) DESC 
		 	 LIMIT 1);


/*2.) Display the names of products whose priceUSD is strictly above the average
	  priceUSD, in reverse-alphabetical order. */
	
SELECT 
	name
FROM
	Products
WHERE
	priceUSD > (SELECT 
					AVG(priceUSD)
		     	FROM 
					Products)
ORDER BY name ASC;
	

/*3.) Display the customer name, pid ordered, and the total for all orders, sorted by
	  total from low to high. */

SELECT 
	C.name, O.pid, sum (O.totalUSD) as TotalUSD
FROM
	Customers C, Orders O 
WHERE
	C.cid = O.cid
GROUP BY 
	C.name, O.pid
ORDER BY sum (O.totalUSD) ASC;


/*4.) Display all customer names (in alphabetical order) and their total ordered, and
	  nothing more. Use coalesce to avoid showing NULLs. */

SELECT
	C.name, sum (COALESCE(O.totalUSD, 0))
FROM
	Customers C 
	LEFT JOIN Orders O
	ON C.cid = O.cid
GROUP BY
	C.name;


/*5.) Display the names of all customers who bought products from agents based in
	  Newark along with the names of the products they ordered, and the names of the
	  agents who sold it to them. */

SELECT DISTINCT
	C.name, P.name, A.name
FROM
	Customers C, Products P, Agents A, Orders O
WHERE
	O.cid = C.cid
	AND O.pid = P.pid
	AND O.aid = A.aid
	AND A.city = 'Newark';


/*6.) Write a query to check the accuracy of the totalUSD column in the Orders table. 
	  This means calculating Orders.totalUSD from data in other tables and comparing 
	  those values to the values in Orders.totalUSD. Display all rows in Orders where
	  Orders.totalUSD is incorrect, if any. */

SELECT
	O.ordNumber, O.month, O.cid, O.aid, O.pid, O.qty, O.totalUSD
FROM
	Customers C, Products P, Orders O
WHERE
	O.cid = c.cid
	AND O.pid = P.pid
	AND O.qty * P.priceUSD * (100 - C.discount) / 100 <> O.totalUSD;
	

/*7.) What's the difference between a LEFT OUTER JOIN and a RIGHT OUTER JOIN? Give 
	  example queries in SQL to demonstrate. (Feel free to use the CAP database to
	  make your points here.) 
	  
	  A left outer join returns all rows from the left table, with the matching rows 
	  in the right table. The result is NULL on the right side when there is no match.

	  Example:
	  
	  SELECT DISTINCT
		Customers.name
	  FROM
		Customers
	  LEFT JOIN Orders
	  ON
		Customers.cid = Orders.cid
	  WHERE
		Orders.cid IS NULL;
	 
	 
	 A right outer join returns all rows from the right table, with the matching rows 
	 in the left table. The result is NULL on the left side when there is no match. 
	 
	 Example: 
	 
	 SELECT DISTINCT
		Customers.name
	 FROM
		Customers
	 RIGHT JOIN Orders
	 ON
		Customers.cid = Orders.cid
*/
	  
	 