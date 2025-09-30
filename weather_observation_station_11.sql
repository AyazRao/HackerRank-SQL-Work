/*
Problem Statement:
Query the list of CITY names from STATION that either do not start with vowels OR do not end with vowels.
Your result cannot contain duplicates.
(This is equivalent to finding cities that are NOT starting AND ending with a vowel).

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
    city
FROM
    station s
WHERE
    LEFT(s.city, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
    OR RIGHT(s.city, 1) NOT IN ('a', 'e', 'i', 'o', 'u');