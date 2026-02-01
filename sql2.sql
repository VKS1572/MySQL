This is LeetCode Q1 / Problem 586 – Customer Placing the Largest Number of Orders 👇

📌 Problem Summary

You’re given a table Orders:

Column Name	Type
order_number	int
customer_number	int

Each row is an order placed by a customer.

👉 Task:
Find the customer_number who has placed the maximum number of orders.

✅ SQL Solution (Accepted)-----------------------------------------------------------
  
SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC
LIMIT 1;

🧠 Explanation (Simple)---------------------------------------------------------------

GROUP BY customer_number → groups orders per customer

COUNT(order_number) → counts how many orders each customer made

ORDER BY COUNT(order_number) DESC → sorts customers by order count (highest first)

LIMIT 1 → picks the top customer only
