Q1. Trips and Users leetcode sql
LeetCode – Trips and Users (SQL) asks you to compute the cancellation rate of requests per day for trips made by unbanned users, rounded to 2 decimals.

You’re given:

Trips(id, client_id, driver_id, city_id, status, request_at)

Users(users_id, banned, role)

We only consider trips where both client and driver are not banned, and status:

completed → not cancelled

cancelled_by_driver / cancelled_by_client → cancelled

✅ MySQL Solution
SELECT 
    t.request_at AS Day,
    ROUND(
        SUM(CASE 
                WHEN t.status != 'completed' THEN 1 
                ELSE 0 
            END) / COUNT(*),
        2
    ) AS "Cancellation Rate"
FROM Trips t
JOIN Users c 
    ON t.client_id = c.users_id
JOIN Users d 
    ON t.driver_id = d.users_id
WHERE c.banned = 'No'
  AND d.banned = 'No'
  AND t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY t.request_at;

🧠 Logic Breakdown

Join Users twice:

once for client

once for driver

Filter only:

c.banned = 'No'

d.banned = 'No'

Count cancelled trips using:

status != 'completed'


Cancellation rate per day:

cancelled_trips / total_trips


Use ROUND(value, 2) for 2 decimal places.

Group by request_at (day).
