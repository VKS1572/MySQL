/*Q3. Product Sales Analysis III (LeetCode SQL)

This problem is from LeetCode.

📌 Problem Summary

You are given a Sales table:

Column Name	Type
sale_id	int
product_id	int
year	int
quantity	int
price	int

👉 Each row represents a sale of a product in a specific year.

🎯 Task:

For each product, return:

product_id

the first year it was sold

quantity

price

⚠ Important: Return the quantity and price from the first year only.
*/


/*✅ Solution (Using Subquery + MIN)*/
SELECT s.product_id, s.year AS first_year, s.quantity, s.price
FROM Sales s
JOIN (
    SELECT product_id, MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
) t
ON s.product_id = t.product_id 
AND s.year = t.first_year;
