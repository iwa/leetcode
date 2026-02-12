-- Write your PostgreSQL query statement below
SELECT E.name as "Employee"
FROM Employee AS E
FULL JOIN Employee AS M ON E.managerId = M.id
WHERE E.salary > M.salary
