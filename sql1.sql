🧩 175. Combine Two Tables
📌 Problem

You are given two tables:

Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| personId    | int     |
| lastName    | varchar |
| firstName   | varchar |
+-------------+---------+


Address

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| addressId   | int     |
| personId    | int     |
| city        | varchar |
| state       | varchar |
+-------------+---------+


Write an SQL query to report the first name, last name, city, and state of each person.
If the address is missing, return NULL.

✅ Solution (LEFT JOIN)-----------------------------------------
SELECT 
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person p
LEFT JOIN Address a
ON p.personId = a.personId;

🧠 Explanation (short & clear)

LEFT JOIN ensures all persons are included

If a person has no address, city and state become NULL

Exactly matches the problem requirement ✔️

📈 Output Example
+-----------+----------+-----------+--------+
| firstName | lastName | city      | state  |
+-----------+----------+-----------+--------+
| Allen     | Wang     | New York  | NY     |
| Bob       | Alice    | NULL      | NULL   |
+-----------+----------+-----------+--------+
