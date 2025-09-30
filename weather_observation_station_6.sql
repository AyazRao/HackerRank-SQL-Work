/*
Problem Statement:
Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION.
[cite_start]Your result cannot contain duplicates. [cite: 12, 13]

Table Schema (STATION):
+---------+------------------+
| Field   | Type             |
+---------+------------------+
| ID      | NUMBER           |
| CITY    | VARCHAR2(21)     |
| STATE   | VARCHAR2(2)      |
| LAT_N   | NUMBER           |
| LONG_W  | NUMBER           |
+---------+------------------+
(LAT_N is the northern latitude and LONG_W is the western longitude.) [cite_start][cite: 15, 17, 18]

Language: MySQL
*/

-- MySQL Query:
SELECT DISTINCT
    s.city
FROM
    station s
WHERE
    LEFT(s.city, 1) IN ('a', 'e', 'i', 'o', 'u');