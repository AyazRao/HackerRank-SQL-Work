/*
Problem Statement:
[cite_start]Query the list of CITY names from STATION that do not end with vowels (a, e, i, o, u)[cite: 67].
[cite_start]Your result cannot contain duplicates[cite: 67].

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
(LAT_N is the northern latitude and LONG_W is the western longitude.) [cite_start][cite: 72]

Language: MySQL
*/

-- MySQL Query:
SELECT DISTINCT
    s.city
FROM
    station s
WHERE
    RIGHT(s.city, 1) NOT IN ('a', 'e', 'i', 'o', 'u');