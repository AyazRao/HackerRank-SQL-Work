/*
Problem Statement:
Generate the following two result sets:
1. Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the
   first letter of each profession as a parenthetical (i.e.: enclosed in parentheses)[cite: 497].
2. Query the number of occurrences of each occupation in OCCUPATIONS. Sort the occurrences in
   ascending order, and output them in the following format:
   "There are a total of [occupation count] [occupation]s."
   If more than one Occupation has the same [occupation count], they should be ordered alphabetically[cite: 500, 503].

Table Schema (OCCUPATIONS):
+------------+-----------+
| Column     | Type      |
+------------+-----------+
| Name       | String    |
| Occupation | String    |
+------------+-----------+

Language: MySQL
*/

-- MySQL Query 1: Names and the first letter of their profession
SELECT
    -- Concatenate Name, '(', the first letter of Occupation, and ')'
    CONCAT(o.name, "(", LEFT(o.occupation, 1), ")")
FROM
    OCCUPATIONS o
ORDER BY
    o.name;

-- MySQL Query 2: Counts of each occupation, formatted and sorted
SELECT
    -- Concatenate the final output string: "There are a total of [count] [lowercase_occupation]s."
    CONCAT("There are a total of ", COUNT(o.occupation), " ", LOWER(o.occupation), "s.")
FROM
    OCCUPATIONS o
GROUP BY
    o.occupation
ORDER BY
    -- Sort primarily by the count in ascending order
    COUNT(o.occupation),
    -- Secondary sort alphabetically by the occupation name
    o.occupation;