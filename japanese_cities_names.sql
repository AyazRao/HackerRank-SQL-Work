/*
Problem Statement:
[cite_start]Query the names of all the Japanese cities in the CITY table[cite: 42]. [cite_start]The COUNTRYCODE for Japan is JPN[cite: 42].

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
    c.name
FROM
    city c
WHERE
    c.countrycode = 'JPN';