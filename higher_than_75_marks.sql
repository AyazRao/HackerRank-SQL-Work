/*
Problem Statement:
[cite_start]Query the Name of any student in STUDENTS who scored higher than 75 Marks. [cite: 118]
[cite_start]Order your output by the last three characters of each name. [cite: 119]
If two or more students both have names ending in the same last three characters,
[cite_start]secondary sort them by ascending ID. [cite: 120]

Table Schema (STUDENTS):
+----------+-----------+
| Column   | Type      |
+----------+-----------+
| ID       | Integer   |
| Name     | String    |
| Marks    | Integer   |
+----------+-----------+

Language: MySQL
*/

-- MySQL Query:
SELECT
    s.name
FROM
    students s
WHERE
    s.marks > 75
ORDER BY
    RIGHT(s.name, 3),
    s.id;