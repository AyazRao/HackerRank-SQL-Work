/*
Problem Statement:
Query a list of CITY and STATE from the STATION table.

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
SELECT
    s.city,
    s.state
FROM
    station s;