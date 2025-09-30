/*
Problem Statement:
Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION.
Your result cannot contain duplicates.

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
(LAT_N is the northern latitude and LONG_W is the western longitude.)

Language: MySQL
*/

-- MySQL Query:
SELECT DISTINCT
    s.city
FROM
    station s
WHERE
    RIGHT(s.city, 1) IN ('a', 'e', 'i', 'o', 'u');