/*
Problem Statement:
Query all columns for a city in CITY with the ID 1661.

Table Schema (CITY):
+-------------+------------------+
| Field       | Type             |
+-------------+------------------+
| ID          | NUMBER           |
| NAME        | VARCHAR2(17)     |
| COUNTRYCODE | VARCHAR2(3)      |
| DISTRICT    | VARCHAR2(20)     |
| POPULATION  | NUMBER           |
+-------------+------------------+

Language: MySQL
*/

-- MySQL Query:
SELECT
    *
FROM
    city
WHERE
    id = 1661;