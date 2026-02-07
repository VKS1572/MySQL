LeetCode SQL – Q4. User Activity for the Past 30 Days I

📌 Table: Activity
user_id | session_id | activity_date | activity_type

✅ Goal

Find the number of distinct active users per day for the last 30 days ending on 2019-07-27 (inclusive).

Return:

day | active_users

✅ SQL Solution (MySQL)
SELECT 
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY)
                        AND '2019-07-27'
GROUP BY activity_date;

💡 Explanation

End date = '2019-07-27'

Last 30 days → subtract 29 days → start date = 2019-06-28

COUNT(DISTINCT user_id) → unique active users per day

GROUP BY activity_date → daily counts
