/*
Problem Statement:
Query the two cities in STATION with the shortest and longest CITY names, as well as their respective
[cite_start]lengths (i.e.: number of characters in the name). [cite: 30]
[cite_start]If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically. [cite: 31, 43]
(Note: This solution combines the shortest and longest queries into a single result set.)

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
(LAT_N is the northern latitude and LONG_W is the western longitude.) [cite_start][cite: 35]

Language: MySQL
*/

-- MySQL Query:
SELECT s3.city, LENGTH(s3.city)
FROM station s3
WHERE (s3.city, LENGTH(s3.city)) = (
    -- Subquery for the Longest City Name (alphabetical tie-breaker)
    SELECT
        s1.city,
        MAX(LENGTH(s1.city))
    FROM
        station s1
    GROUP BY
        s1.city
    ORDER BY
        LENGTH(s1.city) DESC,
        s1.city
    LIMIT 1
)
OR (s3.city, LENGTH(s3.city)) = (
    -- Subquery for the Shortest City Name (alphabetical tie-breaker)
    SELECT
        s1.city,
        MIN(LENGTH(s1.city))
    FROM
        station s1
    GROUP BY
        s1.city
    ORDER BY
        LENGTH(s1.city),
        s1.city
    LIMIT 1
);