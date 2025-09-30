/*
Problem Statement:
Query the sum of the populations for all Japanese cities in CITY. [cite_start]The COUNTRYCODE for Japan is JPN. [cite: 1]

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
    SUM(population)
FROM
    CITY
WHERE
    countrycode = 'JPN';