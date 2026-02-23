/*💰 Q1. Investments in 2016 (LeetCode SQL)

Problem Summary:
Table: Insurance

pid (int)

tiv_2015 (float)

tiv_2016 (float)

lat (float)

lon (float)

You need to find the sum of tiv_2016 for all policyholders who:

Have the same tiv_2015 as at least one other person

Have unique (lat, lon) location (no other person shares the same coordinates)

Return the result rounded to 2 decimal places.

✅ SQL Solution*/
SELECT 
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
)
AND (lat, lon) IN (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
);
🔎 Explanation (Step-by-step)
1️⃣ Find duplicate tiv_2015
SELECT tiv_2015
FROM Insurance
GROUP BY tiv_2015
HAVING COUNT(*) > 1

✔ Ensures at least two policyholders share the same tiv_2015.

2️⃣ Ensure unique location
SELECT lat, lon
FROM Insurance
GROUP BY lat, lon
HAVING COUNT(*) = 1

✔ Keeps only policyholders whose (lat, lon) is unique.

3️⃣ Sum tiv_2016

Only rows satisfying both conditions are summed.

🧠 Cleaner Version Using JOIN (More Interview-Friendly)
SELECT 
    ROUND(SUM(i.tiv_2016), 2) AS tiv_2016
FROM Insurance i
JOIN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
) t
ON i.tiv_2015 = t.tiv_2015
JOIN (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
) l
ON i.lat = l.lat AND i.lon = l.lon;
⚡ Key Interview Insight

HAVING is used after GROUP BY

Tuple comparison (lat, lon) works in MySQL & PostgreSQL

Always use ROUND() because LeetCode checks exact decimal precision
