/*
Problem Statement:
Query a count of the number of cities in CITY having a Population larger than 100,000.

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
    COUNT(c.id)
FROM
    CITY c
WHERE
    c.population > 100000;