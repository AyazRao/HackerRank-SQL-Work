/*
Problem: Draw The Triangle 1 (HackerRank)
Language: MySQL (using Recursive CTE)

Objective: Write a query to print the pattern P(20), which is a right-justified triangle 
of asterisks, starting with 20 asterisks on the first row and decreasing by one asterisk 
on each subsequent row until the final row has one asterisk.
*/
-- The core query uses a Recursive CTE (WITH RECURSIVE) and the REPEAT function.
WITH RECURSIVE pattern_cte (n, pattern_line) AS (
  SELECT 20, REPEAT('* ', 20)
  UNION ALL
  SELECT n - 1, REPEAT('* ', n - 1)
  FROM pattern_cte
  WHERE n > 1
)
SELECT pattern_line FROM pattern_cte;