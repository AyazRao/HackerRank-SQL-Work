/*
Problem Statement:
Write a query identifying the type of each record in the TRIANGLES table using its three side lengths (A, B, and C).
Output one of the following statements for each record:
• Equilateral: It's a triangle with 3 sides of equal length.
• Isosceles: It's a triangle with 2 sides of equal length.
• Scalene: It's a triangle with 3 sides of differing lengths.
• Not A Triangle: The given values of A, B, and C don't form a triangle.

Table Schema (TRIANGLES):
+----------+-----------+
| Column   | Type      |
+----------+-----------+
| A        | Integer   |
| B        | Integer   |
| C        | Integer   |
+----------+-----------+

Language: MySQL
*/

-- MySQL Query:
SELECT
    CASE
        -- Check 1: Not A Triangle (Triangle Inequality Theorem: a+b > c, a+c > b, b+c > a)
        WHEN (t.a + t.b <= t.c) OR (t.b + t.c <= t.a) OR (t.a + t.c <= t.b)
            THEN 'Not A Triangle'
        -- Check 2: Equilateral (All three sides are equal)
        WHEN (t.a = t.b AND t.b = t.c)
            THEN 'Equilateral'
        -- Check 3: Isosceles (Exactly two sides are equal. The Equilateral case is filtered out by the order of WHEN clauses.)
        WHEN (t.a = t.b) OR (t.b = t.c) OR (t.a = t.c)
            THEN 'Isosceles'
        -- Check 4: Scalene (All three sides are different)
        ELSE 'Scalene'
    END AS triangle_type
FROM
    triangles t;