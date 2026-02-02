This is LeetCode 586 – Customer Placing the Largest Number of Orders 👍

Problem gist

You’re given an Orders table and need to find the customer who placed the maximum number of orders.

✅ SQL Solution
SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC
LIMIT 1;

🧠 Explanation

GROUP BY customer_number → groups orders per customer

COUNT(*) → counts how many orders each customer placed

ORDER BY COUNT(*) DESC → sorts customers by order count (highest first)

LIMIT 1 → returns only the top customer
