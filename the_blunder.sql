/*
Problem Statement:
Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES
table, but did not realize her keyboard's 0 key was broken. She wants your help finding the difference
between her miscalculation (using salaries with any zeros removed), and the actual average salary.

Write a query calculating the amount of error (i.e.: actual - miscalculated average monthly salaries),
and round it up to the next integer.

Table Schema (EMPLOYEES):
+--------+-----------+
| Column | Type      |
+--------+-----------+
| ID     | Integer   |
| Name   | String    |
| Salary | Integer   |
+--------+-----------+

Language: MySQL
*/

-- MySQL Query: Calculate the difference between actual and miscalculated average salary
SELECT
    -- CEILING is used to round the difference up to the next integer
    CEILING(
        -- Actual Average Salary
        AVG(salary)
        -
        -- Miscalculated Average Salary (after removing '0's)
        AVG(CAST(REPLACE(salary, '0', '') AS UNSIGNED))
    )
FROM
    EMPLOYEES;