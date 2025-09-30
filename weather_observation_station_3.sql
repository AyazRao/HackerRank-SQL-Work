/*
Problem Statement:
[cite_start]Query a list of CITY names from STATION for cities that have an even ID number[cite: 10, 13].
[cite_start]Print the results in any order, but exclude duplicates from the answer[cite: 13].

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
(LAT_N is the northern latitude and LONG_W is the western longitude.) [cite_start][cite: 17, 18]

Language: MySQL
*/

-- MySQL Query:
SELECT DISTINCT
    s.city
FROM
    station s
WHERE
    s.id % 2 = 0;