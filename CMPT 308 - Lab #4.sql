--Matthew Velasquez
--February 7, 2017
--CMPT 308 - Lab #4


--1.) Get the cities of agents booking an order for a customer whose cid is 'c006'.

SELECT
	city
FROM
	Agents
WHERE
	aid IN (SELECT DISTINCT 
				aid
			FROM
				Orders
			WHERE
				cid = 'c006');
	

--2.) Get the distinct ids of products ordered through any agent who takes at least one order from a customer in Kyoto,
	  sorted by pid form highest to lowest. (This is not the same as asking for ids of products ordered by customers in
	  Kyoto.)

SELECT DISTINCT
	pid
FROM
	Orders
WHERE	
	aid IN	(SELECT DISTINCT
				aid
		 	 FROM
				Orders
		 	 WHERE	
				cid IN	(SELECT
							cid
				 	 	 FROM
							Customers
				 		 WHERE
							city = 'Kyoto')
			) 
ORDER BY pid DESC;


--3.) Get the ids and names of customers who did not place an order through agent a01.

SELECT
	cid, name
FROM
	Customers
WHERE
	cid IN	(SELECT DISTINCT
				cid
		 	 FROM
		 		Orders
		 	 WHERE 
				aid <> 'a01');


--4.) Get the ids of customers who ordered product p01 and p07.

SELECT DISTINCT
	cid
FROM
	Customers
WHERE
	cid IN	(SELECT DISTINCT
				cid
		 	 FROM
				Orders
		 	 WHERE
				pid = 'p01')
AND
	cid IN	(SELECT DISTINCT
				cid
		 	 FROM
				Orders
		 	 WHERE
				pid = 'p07');
			

--5.) Get the ids of products not ordered by any customers who placed and order through agent a08 in pid order from 
      highest to lowest.

SELECT
	pid
FROM
	Products
WHERE
	pid NOT IN (SELECT 
					cid
				FROM
					Orders
			 	WHERE
					aid = 'a08')
ORDER BY pid DESC;


--6.) Get the name, discount, and city for all customers who place orders through agents in Tokyo or New York.

SELECT
	name, discount, city
FROM
	Customers
WHERE
	cid IN	(SELECT DISTINCT
				cid
		 	 FROM
				Orders
		 	 WHERE
				aid IN	(SELECT
							aid
				 		 FROM
							Agents
					 	 WHERE
							city = 'Tokyo'
							OR city = 'New York'));


--7.) Get all customers who have the same discount as that of any customers in Duluth or London.

SELECT *
FROM
	Customers
WHERE
	discount IN	(SELECT
					discount
			 	 FROM
					Customers
			 	 WHERE
					city = 'Duluth'
					OR city = 'London');
					
					
					
/*8.) 
	  Check constraints are conditions in which are used to check if a value is being entered into a record.
	  If the condition is false, the record does not fulfill the check constraint and is not entered into 
	  the specific table. The advantages of having this inside of a database is that it gives the DBA the 
	  choice of defining check constraints on single columns or an entire table. Check constraints are 
	  important for data integrity and are used for limiting the value range that can be placed in columns.
	  An example would be if a player in a video game would have a specific rank level of advanced, a check 
	  constraint can be made to set the limit of the player's performance in regards to their rank level. This
	  means that if the player has a poor performance and goes down a level, they would only reach the minimum
	  level of beginner and stay there unless ranking up once again. A bad example of check constraints would 
	  be if they were used in different columns with different data. This would depend on their data types and
	  would not have the same requirement for each. 
*/


 