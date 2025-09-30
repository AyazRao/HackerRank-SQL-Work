/*
Problem Statement:
Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first
[cite_start]and last characters[cite: 85]. [cite_start]Your result cannot contain duplicates[cite: 86].

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
[cite_start](LAT_N is the northern latitude and LONG_W is the western longitude[cite: 92].)

Language: MySQL
*/

-- MySQL Query:
SELECT DISTINCT
    s.city
FROM
    station s
WHERE
    LEFT(s.city, 1) IN ('a', 'e', 'i', 'o', 'u')
    AND RIGHT(s.city, 1) IN ('a', 'e', 'i', 'o', 'u');