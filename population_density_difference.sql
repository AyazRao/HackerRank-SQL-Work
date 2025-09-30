/*
Problem Statement:
Query the difference between the maximum and minimum populations in CITY.

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
    MAX(population) - MIN(population) AS diff_pop
FROM
    CITY;