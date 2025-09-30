/*
Problem Statement:
A median is defined as a number separating the higher half of a data set from the lower half.
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.

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

-- MySQL Query: Calculate the Median of LAT_N using NTILE(2)
SELECT
    ROUND(MAX(T.LAT_N), 4)
FROM (
    SELECT
        LAT_N,
        -- Divide the ordered data into 2 groups (halves)
        NTILE(2) OVER (ORDER BY LAT_N) AS quartile
    FROM
        STATION
) AS T
WHERE
    -- Select the maximum value from the first half, which is the median
    T.quartile = 1;