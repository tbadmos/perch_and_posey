--1 select only the id, account_id, and occurred_at columns for all orders in the orders table.
SELECT id, account_id, occurred_at
FROM orders;

--2 Write a query that displays all the data in the occurred_at, account_id, and channel columns of 
--the web_events table, and limits the output to only the first 15 rows.*/
SELECT occurRed_at, account_id, channel
FROM web_events
LIMIT 15;

--3 Write a query to return the 10 earliest orders in the orders table. 
--Include the id, occurred_at, and total_amt_usd.
SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY occurred_at ASC
LIMIT 10;


-- Write a query to return the top 5 orders in terms of largest total_amt_usd. 
--Include the id, account_id, and total_amt_usd.
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC
LIMIT 5;


--4 Write a query to return the lowest 20 orders in terms of smallest total_amt_usd. 
--Include the id, account_id, and total_amt_usd.
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd ASC
LIMIT 20;

--5 Write a query that displays the order ID, account ID, and total dollar amount for all the orders,
--sorted first by the account ID (in ascending order), and then by the total dollar amount (in descending order).
SELECT  id, account_id, total_amt_usd
FROM orders
ORDER BY account_id ASC, total_amt_usd DESC;

--6 Now write a query that again displays order ID, account ID, and total dollar
 --amount for each order, but this time sorted first by total dollar amount (in descending order),
 -- and then by account ID (in ascending order).
SELECT  id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC, account_id ASC ;

--7 Pull the first 5 rows and all columns from the orders table that have a dollar amount of gloss_amt_usd greater than
-- or equal to 1000.
SELECT *
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5;

--9 Pulls the first 10 rows and all columns from the orders table that have a total_amt_usd less than 500
SELECT *
FROM orders
WHERE total_amt_usd <500
LIMIT 10;

--10 Filter the accounts table to include the company name, website, and the primary point of contact (primary_poc)
-- just for the Exxon Mobil company in the accounts table.
SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil' ;

--11 Create a column that divides the standard_amt_usd by the standard_qty to find the unit price for standard paper for each order. 
--Limit the results to the first 10 orders, and include the id and account_id fields.
SELECT  id, account_id, (standard_amt_usd/ standard_qty) AS unit_price
FROM orders
LIMIT 10;

--12 Use the accounts table to find all the companies whose names start with 'C'.
SELECT name 
FROM accounts
WHERE name LIKE 'C%' ;

--13 Use the accounts table to find all companies whose names contain the string 'one' somewhere in the name.
SELECT name 
FROM accounts
WHERE name LIKE '%one%' ;

--14 Use the accounts table to find all companies whose names end with 's'.
SELECT name 
FROM accounts
WHERE name LIKE '%s' ;

--15 Use the accounts table to find the account name, primary_poc, and sales_rep_id for Walmart, Target, and Nordstrom
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');

--16 Use the web_events table to find all information regarding individuals who were contacted via the channel of organic or adwords.
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords');


--17 Use the accounts table to find the account name, primary poc, and sales rep id for all stores except Walmart, Target, and Nordstrom.
SELECT name, primary_poc, sales_rep_id 
FROM accounts
WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom')

--18 Use the web_events table to find all information regarding individuals who were contacted via any method except using organic or adwords methods.
SELECT *
FROM web_events
WHERE channel NOT IN ('organic', 'adwords')

--19 Use the accounts table to find all the companies whose names does not start with 'C'.
SELECT name 
FROM accounts
WHERE name NOT LIKE 'C%' ;

--20 Use the accounts table to find all companies whose names does not contain the string 'one' somewhere in the name.
SELECT name 
FROM accounts
WHERE name NOT LIKE '%one%' ;

--21 Use the accounts table to find all companies whose names does not end with 's'.
SELECT name 
FROM accounts
WHERE name NOT LIKE '%s' ;

--22 Write a query that returns all the orders where the standard_qty is over 1000, the poster_qty is 0, and the gloss_qty is 0.
SELECT *
FROM orders
WHERE standard_qty > 1000 AND poster_qty > 0 AND gloss_qty = 0

--23 Using the accounts table, find all the companies whose names do not start with 'C' and end with 's'.
SELECT name
FROM accounts
WHERE name NOT LIKE 'C%' AND name LIKE '%s'

--24 When you use the BETWEEN operator in SQL, do the results include the values of your endpoints, or not? 
--Figure out the answer to this important question by writing a query that displays the order date and gloss_qty data 
--for all orders where gloss_qty is between 24 and 29. Then look at your output to see if the BETWEEN operator included the begin and end values or not.
SELECT occurred_at, gloss_qty
FROM orders
WHERE gloss_qty BETWEEN 24 AND 29
ORDER BY gloss_qty DESC   --IT DOES

--25 Use the web_events table to find all information regarding individuals who were contacted via the organic 
--or adwords channels, and started their account at any point in 2016, sorted from newest to oldest.
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords') AND occurred_at >= '2016-01-01' AND occurred_at <= '2016-12-31' 

--26 Find list of orders ids where either gloss_qty or poster_qty is greater than 4000. Only include the id field in the resulting table.
SELECT id
FROM orders
WHERE gloss_qty >= 4000 OR poster_qty >= 4000 

--27 Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000.
SELECT * 
FROM orders
WHERE standard_qty = 0 AND (gloss_qty >= 1000 OR poster_qty >= 1000);

--28 Find all the company names that start with a 'C' or 'W', and the primary contact contains 'ana' or 'Ana', but it doesn't contain 'eana'.
SELECT name, primary_poc
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%') 
AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') AND primary_poc NOT LIKE '%eana%') ;



--29 Provide a table for all web_events associated with account name of Walmart. 
--There should be three columns. Be sure to include the primary_poc, time of the event, and the channel for each event. 
--Additionally, you might choose to add a fourth column to assure only Walmart events were chosen.
SELECT a.name, a.primary_poc, w.occurred_at, w.channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
WHERE a.name = 'Walmart';

--30 Provide a table that provides the region for each sales_rep along with their associated accounts. 
--Your final table should include three columns: the region name, the sales rep name, and the account name. 
--Sort the accounts alphabetically (A-Z) according to account name.
SELECT r.name region_name, s.name sales_rep_name, a.name AS account_name
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
JOIN accounts a
ON s.id = a.sales_rep_id 
ORDER BY a.name; 

--31 Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. 
--Your final table should have 3 columns: region name, account name, and unit price. A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero.
SELECT r.name region_name, a.name accounts_name,
(o.total_amt_usd/o.total) unit_price 
FROM  region r
JOIN sales_reps s
ON r.id = s.region_id
JOIN accounts a
ON s.id = a. sales_rep_id
JOIN orders o
ON a.id = o.account_id 
WHERE total != 0; 

--32 Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for the Midwest region. 
--Your final table should include three columns: the region name, the sales rep name, and the account name. 
--Sort the accounts alphabetically (A-Z) according to account name.
SELECT r.name region_name, s.name sales_rep,  a.name account_name
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
AND r.name = 'Midwest'
JOIN accounts a
ON s.id = a. sales_rep_id
ORDER BY account_name;

--33 Provide a table that provides the region for each sales_rep along with their associated accounts. 
--This time only for accounts where the sales rep has a first name starting with S and in the Midwest region. --
--Your final table should include three columns: the region name, the sales rep name, and the account name. 
--Sort the accounts alphabetically (A-Z) according to account name. 
SELECT r.name region_name, s.name sales_rep,  a.name account_name
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
AND s.name LIKE 'S%' AND r.name = 'Midwest'
JOIN accounts a
ON s.id = a. sales_rep_id
ORDER BY account_name;

--33 Provide a table that provides the region for each sales_rep along with their associated accounts. 
--This time only for accounts where the sales rep has a last name starting with K and in the Midwest region. 
--Your final table should include three columns: the region name, the sales rep name, and the account name. 
--Sort the accounts alphabetically (A-Z) according to account name.
SELECT r.name region_name, s.name sales_rep,  a.name account_name
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
AND s.name LIKE '% K%' AND r.name = 'Midwest'
JOIN accounts a
ON s.id = a. sales_rep_id
ORDER BY account_name;

--34 Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. 
--However, you should only provide the results if the standard order quantity exceeds 100. 
--Your final table should have 3 columns: region name, account name, and unit price. In order to avoid a division by zero error, adding .01 to the denominator here is helpful total_amt_usd/(total+0.01). 
SELECT r.name, a.name, (o.total_amt_usd/o.total) AS unit_price, o.total
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
JOIN accounts a
ON s.id = a.sales_rep_id
JOIN orders o
ON a.id = o.account_id
AND o.standard_qty >100;

--35 Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. 
--However, you should only provide the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50. 
--Your final table should have 3 columns: region name, account name, and unit price. Sort for the smallest unit price first. In order 
--to avoid a division by zero error, adding .01 to the denominator here is helpful (total_amt_usd/(total+0.01). 
SELECT r.name, a.name, (o.total_amt_usd/o.total) AS unit_price, o.total
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
JOIN accounts a
ON s.id = a.sales_rep_id
JOIN orders o
ON a.id = o.account_id
AND o.standard_qty >100
AND o.poster_qty > 50
ORDER BY unit_price ASC;

--36 Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. 
--However, you should only provide the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50.
--Your final table should have 3 columns: region name, account name, and unit price. Sort for the largest unit price first. 
SELECT r.name, a.name, (o.total_amt_usd/o.total) AS unit_price, o.total
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
JOIN accounts a
ON s.id = a.sales_rep_id
JOIN orders o
ON a.id = o.account_id
AND o.standard_qty >100
AND o.poster_qty > 50
ORDER BY unit_price DESC;

--37 What are the different channels used by account id 1001? Your final table should have only 2 columns: account name and the different channels. 
--You can try SELECT DISTINCT to narrow down the results to only the unique values.
SELECT DISTINCT a.name account_name, w.channel, a.id
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
AND a.id = 1001;

-- 38 Find all the orders that occurred in 2015. Your final table should have 4 columns: occurred_at, account name, order total, and order total_amt_usd.
--Note that you if you use BETWEEN to filter it assumes the date limit for example 2015-12-31  as 2015-12-31 00:00:00. So it won't capture later times on the same day 
SELECT DISTINCT a.name account_name, o.total order_total, o.total_amt_usd total_amt_usd, o.occurred_at
FROM orders o
LEFT JOIN accounts a
ON a.id = o.account_id
WHERE o.occurred_at BETWEEN '2015-01-01' AND '2016-01-01' 
--WHERE o.occurred_at BETWEEN '2015-01-01' AND '2015-12-31 23:59:59';

--39 Find the total amount of poster_qty paper ordered in the orders table.
SELECT SUM (poster_qty)
FROM orders;

--40 Find the total amount of standard_qty paper ordered in the orders table.
SELECT SUM (standard_qty)
FROM orders;

--41 Find the total dollar amount of sales using the total_amt_usd in the orders table.
SELECT SUM (total_amt_usd) dollars
FROM orders;

-- 42 Find the total amount spent on standard_amt_usd and gloss_amt_usd paper for each order in the orders table. 
--This should give a dollar amount for each order in the table.
SELECT id, (standard_amt_usd + gloss_amt_usd) std_gls_usd
FROM orders;

--43 Find the standard_amt_usd per unit of standard_qty paper. Your solution should use both an aggregation and a mathematical operator.
SELECT SUM(standard_amt_usd)/SUM(standard_qty) AS standard_unit_price
FROM orders;

--44 When was the earliest order ever placed? You only need to return the date.
SELECT MIN(occurred_at)
FROM orders;

--45 When did the most recent (latest) web_event occur?
SELECT MAX(occurred_at)
FROM orders;

--46 Find the mean (AVERAGE) amount spent per order on each paper type, 
--as well as the mean amount of each paper type purchased per order. 
--Your final answer should have 6 values - one for each paper type for 
--the average number of sales, as well as the average amount.
SELECT AVG(standard_qty) mean_standard, AVG(gloss_qty) mean_gloss, 
AVG(poster_qty) mean_poster, AVG(standard_amt_usd) mean_standard_usd,
AVG(gloss_amt_usd) mean_gloss_usd, AVG(poster_amt_usd) mean_poster_usd
FROM orders;



--47 What is the MEDIAN total_usd spent on all orders? 
WITH tab2 AS (SELECT  total_amt_usd
FROM(
	SELECT total_amt_usd
	FROM orders
	ORDER BY total_amt_usd ASC
	LIMIT (SELECT CEIL(COUNT(total_amt_usd)/2.0)
	FROM orders)) AS tab21
ORDER BY total_amt_usd DESC
LIMIT 1),

tab3 AS (SELECT  total_amt_usd
FROM(
	SELECT total_amt_usd
	FROM orders
	ORDER BY total_amt_usd ASC
	LIMIT (SELECT COUNT(total_amt_usd)/2.0 +1 
	FROM orders)) AS tab31
ORDER BY total_amt_usd DESC
LIMIT 2)

SELECT CASE WHEN COUNT(total_amt_usd) % 2 = 0 THEN  (SELECT AVG(total_amt_usd) FROM tab3)
		ELSE (SELECT total_amt_usd FROM tab2)

            END AS median_amt_usd
FROM orders;

--SOLUTION 2 - more elegant
-- PERCENTILE_CONT() returns the average if there are two medians but PERCENTILE_DISC returns the first median 
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY total_amt_usd) AS median
FROM orders

--48 Which account (by name) placed the earliest order? Include the account name and the date of the order.
SELECT a.name account,   o.occurred_at
FROM accounts a
JOIN orders o
ON a.id = o.account_id
ORDER BY o.occurred_at
LIMIT 1;


--49 Find the total sales in usd for each account. You should include two columns - the total sales for each company's orders in usd and the company name
SELECT a.name account, SUM(total_amt_usd) total_usd
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name;

--50 Via what channel did the most recent (latest) web_event occur, which account was associated with this web_event? 
--Your query should return only three values - the date, channel, and account name.
SELECT a.name account, w.occurred_at, w.channel
FROM accounts a
JOIN web_events W
ON a.id = w.account_id
ORDER BY o.occurred_at DESC
LIMIT 1;

--51 Find the total number of times each type of channel from the web_events was used. 
--Your final table should have two columns - the channel and the number of times the channel was used.
SELECT channel, COUNT(channel) no_of_times_used
FROM web_events
GROUP BY channel;

--52 Who was the primary contact associated with the earliest web_event? 
SELECT a.primary_poc
FROM accounts a
JOIN web_events W
ON a.id = w.account_id
ORDER BY o.occurred_at DESC
LIMIT 1;

--53 What was the smallest order placed by each account in terms of total usd. Provide only two columns - the account name and the total usd. 
--Order from smallest dollar amounts to largest.
SELECT a.name account, MIN(total_amt_usd) total_usd
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name
ORDER BY total_usd ASC;

--54 Find the number of sales reps in each region. Your final table should have two columns - the region and the number of sales_reps. 
--Order from fewest reps to most reps

SELECT r.name AS region, COUNT(s.name) AS number_of_sales_rep
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
GROUP BY r.name
ORDER BY number_of_sales_rep ASC;

--55 For each account, determine the average amount of each type of paper they purchased across their orders. 
--Your result should have four columns - one for the account name and one for the average quantity purchased for each of the paper types for each account. 
SELECT a.name account, AVG(standard_qty) avg_standard_usd, 
AVG(gloss_qty) avg_gloss_qty, AVG(poster_qty) avg_poster_qty
FROM orders o
JOIN accounts a
ON o.account_id = a.id
GROUP BY a.name



--56 For each account, determine the average amount spent per order on each paper type. 
--Your result should have four columns - one for the account name and one for the average amount spent on each paper type.
SELECT a.name account, AVG(standard_amt_usd) standard_usd, 
AVG(gloss_amt_usd) gloss_usd, AVG(poster_amt_usd) poster_usd
FROM orders o
JOIN accounts a
ON o.account_id = a.id
GROUP BY a.name

--57 Determine the number of times a particular channel was used in the web_events table for each sales rep. 
--Your final table should have three columns - the name of the sales rep, the channel, and the number of occurrences. 
--Order your table with the highest number of occurrences first.
SELECT s.name rep_name, channel, COUNT(channel) channel_no_of_time_used
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN web_events w
ON a.id = w.account_id
GROUP BY s.name, w.channel
ORDER BY channel_no_of_time_used DESC;

--57 Determine the number of times a particular channel was used in the web_events table for each region. 
--Your final table should have three columns - the region name, the channel, and the number of occurrences. 
--Order your table with the highest number of occurrences first.
SELECT r.name region_name, channel, COUNT(channel) channel_no_of_time_used
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN web_events w
ON a.id = w.account_id
JOIN region r
ON r.id = s.region_id
GROUP BY r.name, channel
ORDER BY channel_no_of_time_used DESC;

--57 Use DISTINCT to test if there are any accounts associated with more than one region. Yes, both queries give same result
SELECT a.name, COUNT (DISTINCT r.name) region_count
FROM accounts a
JOIN sales_reps s
ON a.sales_rep_id = s.id
JOIN region r
ON r.id = s.region_id
GROUP BY a.name
HAVING COUNT (DISTINCT r.name) > 1

--58 Have any sales reps worked on more than one account? Yes, 1st query gives 351 while 2nd gives 50
SELECT s.name, COUNT (DISTINCT a.name)
FROM accounts a
JOIN sales_reps s
ON a.sales_rep_id = s.id
GROUP BY s.name
HAVING COUNT (DISTINCT a.name) > 1 
ORDER BY COUNT (DISTINCT a.name) DESC

--59 How many of the sales reps have more than 5 accounts that they manage?
SELECT COUNT (*)
FROM (SELECT s.name
      FROM accounts a
      JOIN sales_reps s
      ON a.sales_rep_id = s.id
      GROUP BY s.name
      HAVING COUNT (DISTINCT a.name) > 5) AS tab1

--60 How many accounts have more than 20 orders?
SELECT COUNT(*)
FROM(
SELECT a.name
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name
HAVING COUNT(o.id) > 20) AS tab2

--61 Which account has the most orders? There are 3 accounts with the topmost 21 orders
SELECT a.name, COUNT(o.id) AS orders_count
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name
ORDER BY orders_count DESC
LIMIT 1;

--62 Which accounts spent more than 30,000 usd total across all orders?
SELECT a.name, sum(total_amt_usd) total_ord_usd
FROM orders o 
JOIN accounts a
ON a.id = o.account_id
GROUP BY a.name
HAVING sum(total_amt_usd)  > 30000
ORDER BY total_ord_usd ;

--63 Which accounts spent less than 1,000 usd total across all orders?
SELECT a.name, sum(total_amt_usd) total_ord_usd
FROM orders o 
JOIN accounts a
ON a.id = o.account_id
GROUP BY a.name
HAVING sum(total_amt_usd)  < 1000
ORDER BY total_ord_usd ;

--64 Which account has spent the most with us?
SELECT a.name, SUM(total_amt_usd) total_ord_usd
FROM orders o 
JOIN accounts a
ON a.id = o.account_id
GROUP BY a.name
ORDER BY total_ord_usd DESC
LIMIT 1;

--65 Which account has spent the least with us?
SELECT a.name, SUM(total_amt_usd) total_ord_usd
FROM orders o 
JOIN accounts a
ON a.id = o.account_id
GROUP BY a.name
ORDER BY total_ord_usd ASC
LIMIT 1;

--66 Which accounts used facebook as a channel to contact customers more than 6 times?
SELECT a.name account, COUNT (w.channel) channel_used
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
WHERE channel = 'facebook'
GROUP BY a.name
HAVING COUNT (w.channel)  > 6
ORDER BY COUNT (w.channel);

--67 Which account used facebook most as a channel? 
SELECT a.name account, COUNT (w.channel) channel_used
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
WHERE channel = 'facebook'
GROUP BY a.name
ORDER BY COUNT (w.channel) DESC
LIMIT 1;

--68 Which channel was most frequently used by most accounts?
SELECT w.channel,   COUNT (a.name) accounts_count
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY   w.channel
ORDER BY COUNT (a.name) DESC
LIMIT 1;


--69 Find the sales in terms of total dollars for all orders in each year, ordered from greatest to least. Do you notice any trends in the yearly sales totals? 
/*Yes, there is an increase in sales from 2013 to 2016 and then a decrease in 2017. There is however a drastic difference in 
the sales for 2013 and 2017 compared with the other years. Exploring the data further with the second 
piece of code we see that in 2017 there was sales record only for January and in 2013 that was sales record only
for December */
SELECT DATE_PART('YEAR', occurred_at),
SUM(total_amt_usd) yearly_sales
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

--further analysis to understand significantly low sales in 2013 and 2017
SELECT DATE_PART('YEAR', occurred_at) year_, DATE_PART('MONTH', occurred_at) month_, 
SUM(total_amt_usd) yearly_sales
FROM orders
GROUP BY 2,1
ORDER BY 2 DESC;

--70 Which month did Parch & Posey have the greatest sales in terms of total dollars? Are all months evenly represented by the dataset?
SELECT DATE_PART('month', occurred_at) ord_mnth, SUM(total_amt_usd) total_sales
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY 1
ORDER BY 2 DESC; 

-- Months are not evenly spread out. Only 1 month data for 2013 and 2017. Other years have 12months
SELECT DATE_PART('YEAR', occurred_at) year_,  COUNT (DISTINCT DATE_PART('MONTH', occurred_at)) distinct_months_
FROM orders
GROUP BY 1;

--71 Which year did Parch & Posey have the greatest sales in terms of total number of orders? 
--Are all years evenly represented by the dataset?
SELECT DATE_PART('year', occurred_at) year_, COUNT(id) order_count
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

--72 Which month did Parch & Posey have the greatest sales in terms of total number of orders? Are all months evenly represented by the dataset?
-- December has the most sales. 2013 and 2017 are removed because they are under-represented
SELECT DATE_PART('month', occurred_at) ord_mnth, COUNT(id) order_count
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2016-01-01 23:59:59'
GROUP BY 1
ORDER BY 2 DESC; 

--73 In which month of which year did Walmart spend the most on gloss paper in terms of dollars? May, 2016
SELECT a.name account, DATE_TRUNC('month', o.occurred_at) date_, SUM(o.gloss_amt_usd) ord_total_usd
FROM accounts a
JOIN orders o 
ON a.id = o.account_id
WHERE a.name = 'Walmart'
GROUP BY 1,2
ORDER BY 3 DESC;



--74 Write a query to display for each order, the account ID, total amount of the order, 
--and the level of the order- 'large' or 'small' - depending on if the order is $3000 or more, or smaller than $3000.
SELECT account_id, total_amt_usd,
      CASE WHEN total_amt_usd >= 3000 THEN 'Large'  	   
      ELSE 'Small' END AS order_level
FROM  orders; 

--75 Write a query to display the number of orders in each of three categories, based on the total number of items in each order.
-- The three categories are: 'At Least 2000', 'Between 1000 and 2000' and 'Less than 1000'.
SELECT id, CASE WHEN total >= 2000 THEN 'At least 2000'
           		 WHEN total BETWEEN 1000 AND 1999 THEN 'BETWEEN 1000 and 2000'
           		 WHEN total < 1000 THEN 'Less than 1000' END AS total_ord_qty_level    
COUNT(1)
FROM orders
GROUP BY 1;


--76 We would like to understand 3 different levels of customers based on the amount associated with their purchases. 
--The top level includes anyone with a Lifetime Value (total sales of all orders) greater than 200,000 usd. 
--The second level is between 200,000 and 100,000 usd. The lowest level is anyone under 100,000 usd. 
--Provide a table that includes the level associated with each account. You should provide the account name, the total sales of all orders for the customer, 
--and the level. Order with the top spending customers listed first.
SELECT a.name, SUM(o.total_amt_usd) total_sales , 
      CASE WHEN SUM(o.total_amt_usd) > 200000 THEN 'TOP'
            WHEN SUM(o.total_amt_usd) BETWEEN 100000 AND 200001 THEN 'MEDIUM'
            ELSE 'LOW' END Sales_usd_level
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY a.name
order by total_sales DESC ;


--77 We would now like to perform a similar calculation to the first, but we want to obtain the total amount spent by customers only in 2016 and 2017. 
--Keep the same levels as in the previous question. Order with the top spending customers listed first.
SELECT a.name, SUM(o.total_amt_usd) total_sales , 
      CASE WHEN SUM(o.total_amt_usd) > 200000 THEN 'TOP'
            WHEN SUM(o.total_amt_usd) BETWEEN 100000 AND 200001 THEN 'MEDIUM'
            ELSE 'LOW' END Sales_usd_level
FROM orders o
JOIN accounts a
ON a.id = o.account_id
WHERE o.occurred_at >= '2016-01-01' AND occurred_at < '2018-01-01'
GROUP BY a.name
order by total_sales DESC ;


--78 We would like to identify top performing sales reps, which are sales reps associated with more than 200 orders. 
--Create a table with the sales rep name, the total number of orders, and a column with top or not depending on if they have more than 200 orders. 
--Place the top sales people first in your final table.
ELECT s.name, COUNT(*) num_ords,
     CASE WHEN COUNT(*) > 200 THEN 'top'
          ELSE 'not' END AS sales_rep_level
FROM orders o
JOIN accounts a
ON o.account_id = a.id 
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.name
ORDER BY 2 DESC;


--79 The previous didn't account for the middle, nor the dollar amount associated with the sales. Management decides they want to see these characteristics represented as well.
-- We would like to identify top performing sales reps, which are sales reps associated with more than 200 orders or more than 750000 in total sales. 
--The middle group has any rep with more than 150 orders or 500000 in sales. Create a table with the sales rep name, the total number of orders, total sales across all orders, and a column with top, middle, or low depending on this criteria. Place the top sales people based on dollar amount of sales first in your final table. You might see a few upset sales people by this criteria!
SELECT s.name sales_rep, COUNT(o.id) total_orders, sum(total_amt_usd) total_order_val,
      CASE WHEN COUNT(o.id) > 200 OR sum(total_amt_usd) > 75000 THEN 'top'
            WHEN COUNT(o.id) > 150 OR sum(total_amt_usd) > 50000 THEN 'middle'
            ELSE 'low' END sales_rep_level
FROM orders o 
JOIN accounts a 
ON o.account_id = a.id 
JOIN sales_reps s 
ON s.id = a.sales_rep_id
GROUP BY s.name
ORDER BY 3 DESC;

--80 We want to find the average number of events for each day for each channel.
SELECT channel, AVG(num_event) num_events_per_day 
FROM (SELECT channel, 
	DATE_TRUNC('day', occurred_at) event_day,	
      COUNT(*) num_event
      FROM web_events
      GROUP BY channel, 2
      ORDER BY channel) tab
      GROUP BY channel
ORDER BY channel;

--81 On which day-channel pair did the most events occur
SELECT channel, DATE_TRUNC('day', occurred_at) event_day, COUNT(*) num_event
FROM web_events
GROUP BY channel, 2
ORDER BY  num_event DESC
LIMIT 1;


--82 What is the average amount of standard paper sold on the first month that any order was placed in the orders table (in terms of quantity).
SELECT AVG(standard_qty) 
FROM orders
WHERE DATE_TRUNC('month', occurred_at)=
	(SELECT DATE_TRUNC('month', MIN(occurred_at)) 
	FROM orders)

--83 What is the average amount of gloss paper sold on the first month that any order was placed in the orders table (in terms of quantity).
SELECT AVG(gloss_qty) 
FROM orders
WHERE DATE_TRUNC('month', occurred_at)=
	(SELECT DATE_TRUNC('month', MIN(occurred_at)) 
	FROM orders)

--84 The average amount of poster paper sold on the first month that any order was placed in the orders table (in terms of quantity).
SELECT AVG(poster_qty) 
FROM orders
WHERE DATE_TRUNC('month', occurred_at)=
	(SELECT DATE_TRUNC('month', MIN(occurred_at)) 
	FROM orders)

--85 The total amount spent on all orders on the first month that any order was placed in the orders table (in terms of usd).
SELECT SUM(total_amt_usd) 
FROM orders
WHERE DATE_TRUNC('month', occurred_at)=
	(SELECT DATE_TRUNC('month', MIN(occurred_at)) 
	FROM orders)



--86 Provide the name of the sales_rep in each region with the largest amount of total_amt_usd sales.
--Solution 1
SELECT org.region, org.sales_rep, org.total_usd
FROM(SELECT region, MAX(total_usd) max_total_usd
     FROM(SELECT r.name region,  s.name AS sales_rep, SUM(total_amt_usd) total_usd
          FROM sales_reps s
          JOIN region r
          ON r.id = s.region_id
          JOIN accounts a
          ON s.id = a.sales_rep_id
          JOIN orders o
          ON a.id = o.account_id
          GROUP BY s.name, r.name 
          ORDER BY region) tab1
     GROUP BY region) tab2
JOIN (SELECT r.name region,  s.name AS sales_rep, SUM(total_amt_usd) total_usd
      FROM sales_reps s
      JOIN region r
      ON r.id = s.region_id
      JOIN accounts a
      ON s.id = a.sales_rep_id
      JOIN orders o
      ON a.id = o.account_id
      GROUP BY s.name, r.name 
      ORDER BY region) org
ON tab2.max_total_usd = org.total_usd;

--solution 2
WITH tab1 AS (SELECT r.name region, s.name sales_rep, SUM(o.total_amt_usd) sum_usd
    FROM sales_reps s
    JOIN region r
    ON s.region_id = r.id
    JOIN accounts a
    ON a.sales_rep_id = s.id
    JOIN orders o 
    ON o.account_id = a.id
    GROUP BY 1, 2),

    tab2 AS (SELECT region, MAX(sum_usd) max_total_amt_usd 
    FROM tab1
    GROUP BY 1)

SELECT tab1.sales_rep, tab1.region, tab2.max_total_amt_usd
FROM tab1
JOIN tab2
ON tab1.region = tab2.region AND tab1.sum_usd = tab2.max_total_amt_usd;

--87 For the region with the largest (sum) of sales total_amt_usd, how many total (count) orders were placed?

--Solution 1
WITH tab1 AS (SELECT r.name region, SUM(o.total_amt_usd) sum_usd, COUNT(o.id) order_count 
    FROM sales_reps s
    JOIN region r
    ON s.region_id = r.id
    JOIN accounts a
    ON a.sales_rep_id = s.id
    JOIN orders o 
    ON o.account_id = a.id
    GROUP BY 1
    ORDER BY 2 DESC ),
    
    tab2 AS (SELECT *
              FROM tab1
              LIMIT 1)
SELECT tab1.region, tab2.order_count
FROM tab1
JOIN tab2
ON tab1.region = tab2.region;

--Solution 2
SELECT r.name region, SUM(o.total_amt_usd) sum_usd, COUNT(o.id) order_count 
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o 
ON o.account_id = a.id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;
    
    

--88 How many accounts had more total purchases than the account name which has bought the most standard_qty paper throughout their lifetime as a customer? 3
--Soltion 1
SELECT COUNT(*)
FROM
    (SELECT a.name, SUM(total) total_pur
    FROM accounts a
    JOIN orders o
    ON o.account_id = a.id
    GROUP BY a.name
    HAVING SUM(total) >
         ( SELECT SUM(total) total_pur
          FROM accounts a
          JOIN orders o
          ON o.account_id = a.id
          GROUP BY a.name
          ORDER BY SUM(o.standard_qty)  DESC
          LIMIT 1)) tab1

--SOLUTION 2
WITH tab1 AS (SELECT a.name account, SUM(standard_qty) standard_qty_total, SUM(total) sum_total 
    FROM accounts a
    JOIN orders o
    ON a.id = o.account_id
    GROUP BY 1
    ORDER BY 2 DESC),

    tab2 AS (SELECT *
            FROM tab1
            LIMIT 1)

SELECT COUNT(*)
FROM tab2,tab1 
WHERE tab1.sum_total > tab2.sum_total

--SOLUTION 3 COMMON TABLE EXPRESSION AND SUBQUERY(most effiicient)
WITH tab1 AS (SELECT a.name account, SUM(standard_qty) standard_qty_total, SUM(total) sum_total  
    FROM accounts a
    JOIN orders o
    ON a.id = o.account_id
    GROUP BY 1
    ORDER BY 2 DESC),

    tab2 AS (SELECT *
            FROM tab1
            LIMIT 1)

SELECT COUNT(*)
FROM tab1 
WHERE tab1.sum_total > (SELECT sum_total FROM tab2)


--89 For the customer that spent the most (in total over their lifetime as a customer) total_amt_usd, how many web_events did they have for each channel?
--Solution 1
SELECT a.name, channel, COUNT(occurred_at) events_per_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.name, channel
HAVING a.name =
          (SELECT a.name
          FROM accounts a
          JOIN orders o
          ON o.account_id = a.id
          GROUP BY a.name
          ORDER BY SUM(total_amt_usd)  DESC
          LIMIT 1 )       

--SOLUTION 2
WITH tab1 AS (SELECT a.id account_id,   SUM(total_amt_usd) sum_amt_usd 
    FROM accounts a
    JOIN orders o
    ON a.id = o.account_id
    GROUP BY 1
    ORDER BY 2 DESC
    LIMIT 1)
    
SELECT account_id, channel, COUNT(occurred_at) web_events_count
FROM web_events
GROUP BY account_id, channel
HAVING account_id = (SELECT account_id FROM tab1)

    
   

--90 What is the lifetime average amount spent in terms of total_amt_usd for the top 10 total spending accounts?
--Soltion 1
SELECT AVG(total_usd) avg_top10_spenders
FROM
   (SELECT a.name, SUM(total_amt_usd) total_usd
    FROM accounts a
    JOIN orders o
    ON o.account_id = a.id
    GROUP BY a.name
    ORDER BY SUM(total_amt_usd)  DESC
    LIMIT 10) tab1;          

--SOLUTION 2
WITH tab1 AS (SELECT a.id account_id,   SUM(total_amt_usd) sum_amt_usd 
    FROM accounts a
    JOIN orders o
    ON a.id = o.account_id
    GROUP BY 1
    ORDER BY 2 DESC
    LIMIT 10)

SELECT AVG(sum_amt_usd)
FROM tab1


--91 What is the lifetime average amount spent in terms of total_amt_usd, including only the companies that spent more per order, on average, than the average of all orders.
--Solution 1
SELECT AVG(total_amt_usd) 
FROM(
SELECT account_id, AVG(total_amt_usd) avg_spent_per_order
FROM  orders 
GROUP BY  account_id
HAVING AVG(total_amt_usd) > 
          (SELECT AVG(total_amt_usd)
          FROM orders)) tab1
JOIN orders o
ON o.account_id = tab1.account_id;

--SOLUTION 2
WITH tab1 AS (SELECT AVG(total_amt_usd) average_total
            FROM orders),

  	tab2 AS ( SELECT a.id account_id,   	AVG(o.total_amt_usd) avg_amt_per_acc 
    FROM accounts a
    JOIN orders o
    ON a.id = o.account_id
    GROUP BY 1
    HAVING AVG(o.total_amt_usd) > (SELECT average_total FROM tab1)
    ORDER BY 2 DESC)

SELECT AVG(o.total_amt_usd) average_amt_top
FROM orders o
JOIN tab2
ON o.account_id = tab2.account_id


--91 In the accounts table, there is a column holding the website for each company. The last three digits specify what type of web address they are using. 
--A list of extensions (and pricing) is provided here. Pull these extensions and provide how many of each website type exist in the accounts table.
SELECT  RIGHT(website, 3) AS extension, COUNT(*)
FROM accounts
GROUP BY 1


--91 There is much debate about how much the name (or even the first letter of a company name) matters. 
--Use the accounts table to pull the first letter of each company name to see the distribution of company names that begin with each letter (or number). 
SELECT LEFT(UPPER(name), 1) AS first_letter_comp, COUNT(*)
FROM accounts
GROUP BY 1
ORDER BY 2 DESC


--92 Using the accounts table, create two groups: one group of company names that start with a number and a second group of those company names that start with a letter.
-- What proportion of company names start with a letter
WITH tab1 AS (SELECT LEFT(name, 1) AS first_letter_comp
FROM accounts),

tab2 AS (SELECT first_letter_comp, 
CASE WHEN first_letter_comp IN ('0','1','2','3', '4', '5','6','7','8','9') THEN 'numeric'
ELSE 'alphabet'
END AS alpha_numeric_group
FROM tab1)

SELECT alpha_numeric_group, COUNT(*) proportion
FROM tab2
GROUP BY 1

--93 Consider vowels as a, e, i, o, and u. What proportion of company names start with a vowel, and what percent start with anything else? 
WITH tab1 AS(SELECT LEFT(UPPER(name), 1) AS first_letter_comp
FROM accounts),

tab2 AS(SELECT first_letter_comp, 
CASE WHEN first_letter_comp IN ('A','E','I','O', 'U') THEN 'vowels'
ELSE 'others'
END AS vowel_and_others_group
FROM tab1)

SELECT vowel_and_others_group, COUNT(*) proportion
FROM tab2
GROUP BY 1

--94 Use the accounts table to create first and last name columns that hold the first and last names for the primary_poc. 
SELECT LEFT(primary_poc, POSITION(' ' IN primary_poc)) AS first_name, RIGHT(primary_poc, LENGTH(primary_poc) - POSITION(' ' IN primary_poc)) AS last_name
FROM accounts

--95 Create first and last name columns that hold the first and last name for every rep name in the sales_reps table.
SELECT LEFT(name, POSITION(' ' IN name)) AS first_name, RIGHT(name, LENGTH(name) - POSITION(' ' IN name)) AS last_name
FROM sales_reps

--96 Each company in the accounts table wants to create an email address for each primary_poc. 
--The email address should be the first name of the primary_poc . last name primary_poc @ company name .com.
WITH tab1 AS (SELECT LEFT(primary_poc, POSITION(' ' IN primary_poc)) AS first_name, 
                    RIGHT(primary_poc, LENGTH(primary_poc) - POSITION(' ' IN primary_poc)) AS last_name, name
FROM accounts)
                                                                                          
SELECT REPLACE(CONCAT(first_name, '.', last_name, '@', name, '.com'), ' ', '')
FROM tab1

--97 We would also like to create an initial password, which they will change after their first log in.
-- The first password will be the first letter of the primary_poc's first name (lowercase), then the last letter of their first name (lowercase),
-- the first letter of their last name (lowercase), the last letter of their last name (lowercase), the number of letters in their first name,
-- the number of letters in their last name, and then the name of the company they are working with, all capitalized with no spaces. 
WITH tab1 AS (SELECT LEFT(LOWER(primary_poc), POSITION(' ' IN primary_poc)-1) AS first_name, RIGHT(LOWER(primary_poc), LENGTH(primary_poc) - POSITION(' ' IN primary_poc)) AS last_name, REPLACE(UPPER(name), ' ', '') AS comp_name
FROM accounts)
                                                                                          
SELECT LEFT(first_name, 1) || RIGHT(first_name, 1) || LEFT(last_name, 1) || RIGHT(last_name, 1) || LENGTH(first_name) || LENGTH(last_name) || comp_name 
FROM tab1 ;    


--98 Show primary point of contact for each company (first and last name), their company, email address and initial assigned password
 WITH tab1 AS (SELECT LEFT(LOWER(primary_poc), POSITION(' ' IN primary_poc)-1) AS first_name, 
                      RIGHT(LOWER(primary_poc), LENGTH(primary_poc) - POSITION(' ' IN primary_poc)) AS last_name, 
                      REPLACE(UPPER(name), ' ', '') AS comp_name
              FROM accounts),
                                                                                               
      tab2 AS (SELECT first_name, last_name, comp_name, CONCAT(first_name, '.', last_name, '@', comp_name, '.com') AS email_address
              FROM tab1),
                                                                                        
      tab3 AS (SELECT first_name, last_name, comp_name, LEFT(first_name, 1) || RIGHT(first_name, 1) || LEFT(last_name, 1) || RIGHT(last_name, 1) || LENGTH(first_name) || LENGTH(last_name) || comp_name AS password 
              FROM tab1)
                                                                                               
SELECT *                                                                                               
FROM tab2                                                                                              
JOIN tab3
ON tab2.first_name = tab3.first_name AND 
tab2.comp_name = tab3.comp_name  

--99 Write a query to extract the date from the sf_crime_data dataset
WITH tab1 AS (SELECT id, SUBSTR(date, 7, 4) AS yer, 
              SUBSTR(date, 1, 2) AS month,
              SUBSTR(date, 4, 2) AS day, 
              SUBSTR(date, 12, 17 ) AS tim , date              
              FROM sf_crime_data),

tab2 AS (SELECT (yer||'-'||month||'-'||day) :: DATE 
        FROM tab1)

SELECT * FROM tab2

--SOLUTION 2
SELECT date orig, (SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) || '-' || SUBSTR(date, 4, 2))::DATE new_date
FROM sf_crime_data;
               
--find accountS without an order. Then replace any nulls
-- coalsesce replace nulls but does not alter other values so that the number of counts in the column will now include the replaced nulls
SELECT COALESCE(o.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, 
       COALESCE(o.account_id, a.id) account_id, o.occurred_at, COALESCE(o.standard_qty, 0) standard_qty, 
       COALESCE(o.gloss_qty,0) gloss_qty, COALESCE(o.poster_qty,0) poster_qty, COALESCE(o.total,0) total, 
       COALESCE(o.standard_amt_usd,0) standard_amt_usd, COALESCE(o.gloss_amt_usd,0) gloss_amt_usd, 
       COALESCE(o.poster_amt_usd,0) poster_amt_usd, COALESCE(o.total_amt_usd,0) total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id;


--100 Create running total of standard_amt_usd over ordered time
SELECT standard_amt_usd,
      SUM(standard_amt_usd) OVER(ORDER BY occurred_at) AS running_total
FROM orders;

-- 101 Create running total of standard_amt_usd over ordered time and partitioned over the years
SELECT standard_amt_usd, DATE_TRUNC('year', occurred_at) AS transac_year,
    SUM(standard_amt_usd) OVER(PARTITION BY DATE_TRUNC('year', occurred_at) ORDER BY occurred_at) AS running_total
FROM orders;

--102 Select the id, account_id, and total variable from the orders table, then create a column called total_rank that ranks 
--this total amount of paper ordered (from highest to lowest) for each account using a partition. Your final table should have these four columns
SELECT id, account_id, total,
RANK() OVER (PARTITION BY account_id ORDER BY  total DESC) total_rank
FROM orders;


-- 103 Ordered by year and partitioned for each account_id show a running SUM, COUNT, AVG, MIN and MAX of total_amt_usd
SELECT id,
       account_id,
       DATE_TRUNC('year',occurred_at) AS year,
       DENSE_RANK() OVER account_year_window AS dense_rank,
       total_amt_usd,
       SUM(total_amt_usd) OVER account_year_window AS sum_total_amt_usd,
       COUNT(total_amt_usd) OVER account_year_window AS count_total_amt_usd,
       AVG(total_amt_usd) OVER account_year_window AS avg_total_amt_usd,
       MIN(total_amt_usd) OVER account_year_window AS min_total_amt_usd,
       MAX(total_amt_usd) OVER account_year_window AS max_total_amt_usd
FROM orders
WINDOW account_year_window AS (PARTITION BY account_id ORDER BY DATE_TRUNC('year', occurred_at))


--104 Determine how the current order's total revenue ("total" meaning from sales of all types of paper) compares to the next order's total revenue.
SELECT occurred_at,
       total_amt_usd,
       LEAD(total_amt_usd) OVER (ORDER BY occurred_at) AS lead,
       LEAD(total_amt_usd) OVER (ORDER BY occurred_at) - total_amt_usd AS lead_difference
FROM (SELECT SUM(total_amt_usd) AS total_amt_usd, occurred_at
	  FROM orders
	 GROUP BY occurred_at) tab1


--105 Divide the accounts into 4 levels in terms of the amount of standard_qty for their orders. Your resulting table should have the account_id, 
--the occurred_at time for each order, the total amount of standard_qty paper purchased, and one of four levels in a standard_quartile column.
SELECT account_id, occurred_at, standard_qty,
NTILE(4) OVER (PARTITION BY account_id ORDER BY standard_qty) AS standard_quartile
FROM orders

--106 Divide the accounts into two levels in terms of the amount of gloss_qty for their orders. Your resulting table should have the account_id, 
--the occurred_at time for each order, the total amount of gloss_qty paper purchased, and one of two levels in a gloss_half column.
SELECT account_id, occurred_at, gloss_qty,
NTILE(2) OVER (PARTITION BY account_id ORDER BY gloss_qty) AS gloss_half
FROM orders

--107 Divide the orders for each account into 100 levels in terms of the amount of total_amt_usd for their orders. Your resulting table should have the account_id,
-- the occurred_at time for each order, the total amount of total_amt_usd paper purchased, and one of 100 levels in a total_percentile column.
SELECT account_id, occurred_at, total_amt_usd,
NTILE(100) OVER (PARTITION BY account_id ORDER BY total_amt_usd) AS total_percentile
FROM orders

---108 You want to see each account who has a sales rep and each sales rep that has an account, but also each account that does not have a sales rep and 
--each sales rep that does not have an account
SELECT s.id AS sales_rep_id, s.name AS sales_rep,  a.*
FROM sales_reps s
FULL JOIN accounts a
ON s.id = a.sales_rep_id
WHERE s.id IS NULL OR a.sales_rep_id IS NULL


-- 109 SHOW web events that occur not more than 1 day for each other for each account and show the channel for each event
SELECT  w1.account_id AS W1_acc_id, w1.occurred_at AS w1_occurred_at, w1.channel AS w1_channel,  w2.account_id AS w2_acc_id, 
        w2.occurred_at AS w2_occurred_at, w2.channel AS w2_channel
FROM web_events w1
JOIN web_events w2
ON w1.account_id = w2.account_id
AND w2.occurred_at > w1.occurred_at
AND w2.occurred_at <= w1.occurred_at + INTERVAL '1 day'
ORDER BY w1.account_id, w2.occurred_at

--110 show accounts that made multiple orders within 30 days  
SELECT o1.id AS o1_id,
       o1.account_id AS o1_account_id,
       o1.occurred_at AS o1_occurred_at,
       o2.id AS o2_id,
       o2.account_id AS o2_account_id,
       o2.occurred_at AS o2_occurred_at
  FROM orders o1
 LEFT JOIN orders o2
   ON o1.account_id = o2.account_id
  AND o2.occurred_at > o1.occurred_at
  AND o2.occurred_at <= o1.occurred_at + INTERVAL '30 days'
ORDER BY o1.account_id, o1.occurred_at

--111 Write a query that uses UNION ALL on two instances (and selecting all columns) of the accounts table to show Walmart and Disney accounts only
SELECT * 
FROM accounts a
WHERE name = 'Walmart'
UNION ALL
SELECT *  
FROM accounts a
WHERE name = 'Disney'

--112 Write a query that uses UNION ALL on two instancesof the accounts table in a common table expression and name it double_accounts. 
--Then do a COUNT the number of times a name appears in the double_accounts table.
WITH double_accounts AS (SELECT * 
FROM accounts a
UNION ALL
SELECT *  
FROM accounts a)

SELECT name, COUNT(name)
FROM double_accounts
GROUP BY 1
ORDER BY 2 DESC