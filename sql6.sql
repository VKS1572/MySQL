Table: Orders
Columns: order_number, customer_number

Goal: Find the customer_number who placed the highest number of orders.

✅ SQL Solution (Using GROUP BY + ORDER BY)
SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC
LIMIT 1;

✅ Alternative Solution (Using Subquery)
SELECT customer_number
FROM Orders
GROUP BY customer_number
HAVING COUNT(*) = (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM Orders
        GROUP BY customer_number
    ) t
);

💡 Explanation

Group orders by customer_number

Count orders per customer

Either:

Sort by count descending and take top 1, or

Compare with the maximum count using a subquery
