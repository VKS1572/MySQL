LeetCode 602 – Friend Requests II: Who Has the Most Friends
This one’s a classic UNION + GROUP BY SQL problem.

🧠 Problem Summary (simple words)

You’re given a table RequestAccepted:

requester_id	accepter_id

Each row means:
👉 requester_id and accepter_id are friends.

Friendship is two-way, so both users get +1 friend from a row.

🎯 Goal

Find:

The user with the maximum number of friends

Output:

id → user id

num → number of friends

✅ Correct SQL Solution
SELECT id, COUNT(*) AS num
FROM (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
) t
GROUP BY id
ORDER BY num DESC
LIMIT 1;

🔍 Step-by-Step Explanation
1️⃣ Convert friendships into single-column format

Each friendship affects both users, so we flatten it:

SELECT requester_id AS id FROM RequestAccepted
UNION ALL
SELECT accepter_id AS id FROM RequestAccepted


Now each row = 1 friend count for that user.

2️⃣ Count friends per user
GROUP BY id


Each occurrence = 1 friend.

3️⃣ Get the maximum
ORDER BY num DESC
LIMIT 1


Returns the user with the most friends.

🧪 Example

Input

requester_id	accepter_id
1	2
1	3
2	3

Flattened

id
1
1
2
3
2
3

Counts

id	num
1	2
2	2
3	2

Output → any one of them (all tied).
