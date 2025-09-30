/*
Problem Statement:
Query the Western Longitude (LONG_W) where the smallest Northern Latitude (LAT_N) in STATION is
greater than 38.7780. Round your answer to 4 decimal places.

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
    -- Filter the rows to only include the one(s) with the minimum LAT_N
    -- that is strictly greater than 38.7780
    LAT_N = (
        SELECT
            MIN(LAT_N)
        FROM
            STATION
        WHERE
            LAT_N > 38.7780
    );

-- Note: In the subquery, comparing the raw LAT_N (LAT_N > 38.7780) is more precise and generally preferred
-- than ROUND(LAT_N,4) > 38.7780, as the problem statement refers to the actual LAT_N value. 
-- The outer query's condition LAT_N = (SELECT MIN(LAT_N) ...) correctly links to the exact row.