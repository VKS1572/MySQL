Response 1
🔹 Q2. Department Highest Salary (LeetCode)

This problem asks you to find the employees who have the highest salary in each department.

It is from LeetCode SQL section.

🗂️ Schema

Employee

Column Name	Type
id	int
name	varchar
salary	int
departmentId	int

Department

Column Name	Type
id	int
name	varchar
✅ Approach

Join Employee and Department tables.

For each department, find the maximum salary.

Return employees whose salary equals that maximum.

💡 Solution 1: Using Subquery (Most Common & Recommended)
SELECT 
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM Employee e
JOIN Department d
    ON e.departmentId = d.id
WHERE e.salary = (
    SELECT MAX(salary)
    FROM Employee
    WHERE departmentId = e.departmentId
);
🔎 Explanation:

The subquery finds the maximum salary per department.

The outer query returns employees matching that salary.

Handles ties automatically (multiple employees with same highest salary).
