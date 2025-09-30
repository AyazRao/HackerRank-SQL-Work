/*
Problem Statement:
Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780.
Round your answer to 4 decimal places.

Table Schema (STATION):
+----------+--------------+
| Field    | Type         |
+----------+--------------+
| ID       | NUMBER       |
| CITY     | VARCHAR2(21) |
| STATE    | VARCHAR2(2)  |
| LAT_N    | NUMBER       |
| LONG_W   | NUMBER       |
+----------+--------------+

Language: MySQL
*/

-- MySQL Query:
SELECT
    -- Round the minimum LAT_N to 4 decimal places
    ROUND(MIN(LAT_N), 4)
FROM
    STATION
WHERE
    -- Filter LAT_N values that are strictly greater than the lower bound
    LAT_N > 38.7780;