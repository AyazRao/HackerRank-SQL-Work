/*
Problem Statement:
[cite_start]Query the NAME field for all American cities in the CITY table with populations larger than 120000[cite: 5].
[cite_start]The CountryCode for America is USA[cite: 5].

Table Schema (CITY):
+-------------+------------------+
| Field       | Type             |
+-------------+------------------+
| ID          | NUMBER           |
| NAME        | VARCHAR2 (17)    |
| COUNTRYCODE | VARCHAR2(3)      |
| DISTRICT    | VARCHAR2(20)     |
| POPULATION  | NUMBER           |
+-------------+------------------+\
[cite_start][cite: 6, 7, 8]

Language: MySQL
*/

-- MySQL Query:
SELECT
    c.name
FROM
    city c
WHERE
    c.population > 120000
    AND c.countrycode = 'USA';