LeetCode – Q2: Customers Who Bought All Products (SQL)

Problem summary:
You’re given two tables:

Customer

customer_id

product_key

Product

product_key

Return the customer_id of customers who bought all products listed in the Product table.

✅ SQL Solution
SELECT c.customer_id
FROM Customer c
GROUP BY c.customer_id
HAVING COUNT(DISTINCT c.product_key) = (
    SELECT COUNT(*) 
    FROM Product
);

💡 Explanation

COUNT(DISTINCT c.product_key) → number of unique products bought by each customer.

(SELECT COUNT(*) FROM Product) → total number of products available.

If both counts match → that customer bought every product.

GROUP BY customer_id → needed to aggregate purchases per customer.

🧠 Key Idea

Compare:

products bought by each customer
vs
total products in catalog

If equal → include that customer.
