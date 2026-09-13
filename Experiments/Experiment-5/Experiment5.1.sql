/* Write a query to find out what percentage of the total revenue (sum of all orders) is contributed by American Cuisine. Round the final value to 2 decimal places */
Select ROUND(
(SUM(CASE WHEN Cuisine='American' THEN PRICE ELSE 0 END)*100)
/SUM(PRICE)
,2) AS American_Revenue 
FROM orders;
