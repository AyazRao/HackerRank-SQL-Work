/*
Problem Statement:
[cite_start]Query the list of CITY names from STATION that do not start with vowels AND do not end with vowels[cite: 4].
[cite_start]Your result cannot contain duplicates[cite: 5].

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
[cite_start](LAT_N is the northern latitude and LONG_W is the western longitude[cite: 11].)

Language: MySQL
*/

-- MySQL Query:
SELECT DISTINCT
    city
FROM
    station s
WHERE
    LEFT(s.city, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
    AND RIGHT(s.city, 1) NOT IN ('a', 'e', 'i', 'o', 'u');