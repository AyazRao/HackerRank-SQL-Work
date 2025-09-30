/*
Problem Statement:
Consider P1(a,c) and P2(b,d) to be two points on a 2D plane where (a, b) are the respective minimum
and maximum values of Northern Latitude (LAT_N) and (c, d) are the respective minimum and maximum
values of Western Longitude (LONG_W) in STATION.
Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal
digits.

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

-- MySQL Query: Calculate the Euclidean Distance
SELECT
    -- Calculate Euclidean distance: SQRT((b-a)^2 + (d-c)^2) and round to 4 decimal places
    ROUND(
        SQRT(
            POWER((MAX(LAT_N) - MIN(LAT_N)), 2) -- (b - a)^2: Latitude squared difference
            +
            POWER((MAX(LONG_W) - MIN(LONG_W)), 2) -- (d - c)^2: Longitude squared difference
        ),
    4)
FROM
    STATION;