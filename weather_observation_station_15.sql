/*
Problem Statement:
Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is
less than 137.2345. Round your answer to 4 decimal places.

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
    -- Select the Western Longitude, rounded to 4 decimal places
    ROUND(LONG_W, 4)
FROM
    STATION
WHERE
    -- Filter the rows to only include the one(s) with the maximum LAT_N
    -- that is strictly less than 137.2345
    LAT_N = (
        SELECT
            MAX(LAT_N)
        FROM
            STATION
        WHERE
            LAT_N < 137.2345
    );