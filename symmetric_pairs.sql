/*
Problem Statement: Symmetric Pairs (HackerRank)

You are given a table, Functions, containing two columns: X and Y.
Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.

Write a query to output all such symmetric pairs in ascending order by the value of X.
Constraint: List the rows such that X1 <= Y1.

Tables:
- Functions (X: Integer, Y: Integer)

Language: MySQL
*/
-- The SQL Query starts below

SELECT f1.X, f1.Y
FROM Functions f1
INNER JOIN Functions f2 
    -- Condition for Symmetry: (f1.X = f2.Y) AND (f1.Y = f2.X)
    ON f1.Y = f2.X AND f1.X = f2.Y
WHERE 
    -- Case 1: X and Y are different (X < Y). We only need one of the two pairs (X, Y) or (Y, X).
    -- The output constraint is X <= Y, so we use f1.X < f1.Y.
    f1.X < f1.Y
    
    -- Case 2: X and Y are the same (X = Y). This creates a symmetric pair with itself.
    -- Since the join condition (f1.X = f2.Y AND f1.Y = f2.X) will be met for every (X, X) pair,
    -- we must ensure we only count distinct pairs once. The original problem requires that
    -- if X = Y, the count of (X, X) rows must be > 1 to be considered a symmetric pair.
    OR (f1.X = f1.Y AND (
        SELECT COUNT(*)
        FROM Functions f3
        WHERE f3.X = f1.X AND f3.Y = f1.Y
    ) > 1)
ORDER BY 
    f1.X ASC;

-- The simpler, more common solution for this problem that you provided:
/*
SELECT f1.X, f1.Y
FROM Functions f1
INNER JOIN Functions f2 
    ON f1.Y = f2.X AND f1.X = f2.Y
GROUP BY f1.X, f1.Y
-- HAVING Clause handles the two required constraints:
-- 1. Symmetric pairs where X != Y: f1.X < f1.Y ensures we only list (X, Y) and not (Y, X).
-- 2. Symmetric pairs where X = Y: COUNT(*) > 1 ensures the self-symmetric pair exists more than once.
HAVING COUNT(*) > 1 OR f1.X < f1.Y
ORDER BY f1.X;
*/