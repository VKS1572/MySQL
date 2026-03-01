/*4. Human Traffic of Stadium

This problem is from LeetCode.

🧩 Problem Summary

Table: Stadium

Column	Type
id	int
visit_date	date
people	int

We need to find 3 or more consecutive rows where:

people >= 100

id values are consecutive

Return the result ordered by visit_date

💡 Approach (Optimal – Window Function)

We use:

people >= 100 filter

A trick: id - ROW_NUMBER() to group consecutive IDs

If IDs are consecutive, id - row_number will remain constant for that group.

✅ SQL Solution (MySQL 8+, PostgreSQL, SQL Server)*/
WITH cte AS (
    SELECT 
        id,
        visit_date,
        people,
        id - ROW_NUMBER() OVER (ORDER BY id) AS grp
    FROM Stadium
    WHERE people >= 100
)

SELECT id, visit_date, people
FROM cte
WHERE grp IN (
    SELECT grp
    FROM cte
    GROUP BY grp
    HAVING COUNT(*) >= 3
)
ORDER BY visit_date;
/*🔎 How It Works

Example filtered data (people ≥ 100):

id	people
5	120
6	130
7	140

ROW_NUMBER() gives:

id	row_number	id - row_number
5	1	4
6	2	4
7	3	4

Since id - row_number is same (4), they form a consecutive group.

🕒 Time Complexity

O(n) (single scan with window function)*/
