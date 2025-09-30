/*
Problem Statement:
Query all columns for all American cities in the CITY table with populations larger than 100000.
The CountryCode for America is USA.

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
    CITY
WHERE
    POPULATION > 100000
    AND COUNTRYCODE = 'USA';