/*
Problem Statement:
Query all columns (attributes) for every row in the CITY table.

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
    CITY;