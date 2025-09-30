/*
Problem Statement:
We define an employee's total earnings to be their monthly salary * months worked, and the
maximum total earnings to be the maximum total earnings for any employee in the Employee table.
Write a query to find the maximum total earnings for all employees as well as the total number of
employees who have maximum total earnings. Then print these values as 2 space-separated integers.

Table Schema (Employee):
+---------------+----------------+
| Column        | Type           |
+---------------+----------------+
| employee_id   | Integer        |
| name          | String         |
| months        | Integer        |
| salary        | Integer        |
+---------------+----------------+

Language: Oracle (PL/SQL enabled)
*/

-- Oracle Query:
SELECT
    (months * salary),
    COUNT(employee_id)
FROM
    Employee
WHERE
    -- Filter for employees whose total earnings equals the maximum total earnings found in a subquery
    (months * salary) = (SELECT MAX(months * salary) FROM Employee)
GROUP BY
    -- Group by the earnings to correctly count all employees with that maximum earnings value
    (months * salary);