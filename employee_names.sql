/*
Problem Statement:
Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in
alphabetical order.

Table Schema (Employee):
+---------------+-----------+
| Column        | Type      |
+---------------+-----------+
| employee_id   | Integer   |
| name          | String    |
| months        | Integer   |
| salary        | Integer   |
+---------------+-----------+

Language: MySQL
*/

-- MySQL Query:
SELECT
    name
FROM
    EMPLOYEE
ORDER BY
    name;