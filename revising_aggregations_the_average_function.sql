/*
Problem Statement:
Query the average population of all cities in CITY where District is California. 

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
    AVG(population)
FROM
    CITY
WHERE
    district = 'California';