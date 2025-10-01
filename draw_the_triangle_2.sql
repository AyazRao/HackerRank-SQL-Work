/*
Problem: Draw The Triangle 2 (HackerRank)
Language: MySQL (using Recursive CTE)

Objective: Write a query to print the pattern P(20), which is a right-justified triangle 
of asterisks, starting with 1 asterisk on the first row and increasing by one asterisk 
on each subsequent row until the final row has twenty asterisks.
*/
-- The core query uses a Recursive CTE (WITH RECURSIVE) and the CONCAT function.
WITH RECURSIVE pattern_cte (n, pattern_line) AS (
  SELECT 1, CAST('*' AS CHAR(50)) 
  UNION ALL
  SELECT n + 1, CONCAT(pattern_line, ' *')
  FROM pattern_cte
  WHERE n < 20
)
SELECT pattern_line FROM pattern_cte;