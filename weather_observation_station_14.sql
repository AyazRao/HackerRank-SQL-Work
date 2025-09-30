/*
Problem Statement:
Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345.
Truncate your answer to 4 decimal places.

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
    -- Truncate the final maximum value to 4 decimal places
    TRUNCATE(MAX(LAT_N), 4)
FROM
    STATION
WHERE
    -- Filter LAT_N values that are strictly less than the upper bound
    LAT_N < 137.2345;

-- Note: Your original query used TRUNCATE(LAT_N,4) in the WHERE clause, which is often 
-- unnecessary in MySQL since the comparison is done on the full numeric value. The query above
-- uses the simpler and standard filtering condition, LAT_N < 137.2345, which achieves the same goal.