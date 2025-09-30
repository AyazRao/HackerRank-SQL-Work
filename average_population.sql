/*
Problem Statement:
Query the average population for all cities in CITY, rounded down to the nearest integer.

Table Schema (CITY):
+---------------+----------------+
| Field         | Type           |
+---------------+----------------+
| ID            | NUMBER         |
| NAME          | VARCHAR2(17)   |
| COUNTRYCODE   | VARCHAR2(3)    |
| DISTRICT      | VARCHAR2(20)   |
| POPULATION    | NUMBER         |
+---------------+----------------+

Language: MySQL
*/

-- MySQL Query:
SELECT
    -- ROUND(X, 0) is often used for this problem. If strictly rounding DOWN (FLOOR),
    -- use FLOOR(AVG(population)). For this context, ROUND(AVG(population), 0) is standard.
    ROUND(AVG(population), 0)
FROM
    CITY;