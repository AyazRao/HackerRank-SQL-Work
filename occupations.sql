/*
Problem Statement:
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed
underneath its corresponding Occupation. The output should consist of four columns (Doctor, Professor,
Singer, and Actor) in that specific order, with their respective names listed alphabetically under each
column. Print NULL when there are no more names corresponding to an occupation.

Table Schema (OCCUPATIONS):
+------------+-----------+
| Column     | Type      |
+------------+-----------+
| Name       | String    |
| Occupation | String    |
+------------+-----------+

Language: MySQL
*/

-- MySQL Query: Pivoting using ROW_NUMBER() and Conditional Aggregation
WITH cte AS (
    -- Assign a row number (rn) to each name within its occupation, ordered alphabetically by name.
    SELECT
        name,
        occupation,
        ROW_NUMBER() OVER(PARTITION BY occupation ORDER BY name) AS rn
    FROM
        occupations
)
SELECT
    -- Use MAX(CASE...) to pivot the data: names with the same 'rn' value align in the same row.
    MAX(CASE WHEN occupation = 'Doctor' THEN name END) AS Doctor,
    MAX(CASE WHEN occupation = 'Professor' THEN name END) AS Professor,
    MAX(CASE WHEN occupation = 'Singer' THEN name END) AS Singer,
    MAX(CASE WHEN occupation = 'Actor' THEN name END) AS Actor
FROM
    cte
GROUP BY
    rn -- Group by the row number to get one row for each position (1st name, 2nd name, etc.)
ORDER BY
    rn; -- Order the final result set by the row number