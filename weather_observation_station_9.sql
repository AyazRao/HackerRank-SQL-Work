/*
Problem Statement:
Query the list of CITY names from STATION that do not start with vowels (i.e., a, e, i, o, or u).
[cite_start]Your result cannot contain duplicates. [cite: 15]

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
(LAT_N is the northern latitude and LONG_W is the western longitude.) [cite_start][cite: 20, 21]

Language: MySQL
*/

-- MySQL Query:
SELECT DISTINCT
    s.city
FROM
    station s
WHERE
    LEFT(s.city, 1) NOT IN ('a', 'e', 'i', 'o', 'u');