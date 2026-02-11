LeetCode 183 — Customers Who Never Order (SQL)
We have two tables:


Customers(id, name)


Orders(id, customerId)


We need customers whose id does not appear in Orders.
✅ Solution — Using LEFT JOIN
SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o
ON c.id = o.customerId
WHERE o.customerId IS NULL;

✅ Solution — Using NOT IN
SELECT name AS Customers
FROM Customers
WHERE id NOT IN (
    SELECT customerId
    FROM Orders
);

✅ Solution — Using NOT EXISTS (best practice for large data)
SELECT c.name AS Customers
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.customerId = c.id
);

Recommended: NOT EXISTS or LEFT JOIN + IS NULL — both are safe and efficient.
