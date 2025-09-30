/*
Problem Statement:
Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and
less than 137.2345. Truncate your answer to 4 decimal places.

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
    -- Truncate the final sum to 4 decimal places
    TRUNCATE(SUM(LAT_N), 4)
FROM
    STATION
WHERE
    -- Filter LAT_N values between the specified bounds (exclusive)
    LAT_N > 38.7880 AND LAT_N < 137.2345;

-- Note: In MySQL, the TRUNCATE(LAT_N, 4) in the WHERE clause is technically not needed for correctness
-- since the comparison is done on the underlying numeric value, but using it as you did 
-- (TRUNCATE(LAT_N,4) > 38.7880 AND TRUNCATE(LAT_N,4) < 137.2345) is also a valid, albeit slightly
-- redundant, way to enforce the condition based on the truncated value. The simpler version above
-- is usually preferred for performance and clarity.