Q1. Customer Placing the Largest Number of Orders

This is LeetCode 586 👇

🧠 Problem (Short)

You’re given a table Orders.
Find the customer_number who placed the maximum number of orders.

If there’s a tie, return any one of them.

📊 Table: Orders
Column Name	Type
order_number	int
customer_number	int
✅ SQL Solution (Most Common & Best)
SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC
LIMIT 1;

🔍 Explanation

GROUP BY customer_number → group orders per customer

COUNT(*) → count total orders for each customer

ORDER BY COUNT(*) DESC → highest orders first

LIMIT 1 → pick the top customer

🧪 Alternative (Using Subquery)
SELECT customer_number
FROM Orders
GROUP BY customer_number
HAVING COUNT(*) = (
    SELECT MAX(order_count)
    FROM (
        SELECT COUNT(*) AS order_count
        FROM Orders
        GROUP BY customer_number
    ) t
);


💡 Useful if interviewer asks “without LIMIT”
