-- Problem: The Report (HackerRank)
-- Tables:
-- 1. Students (ID, Name, Marks)
-- 2. Grades (Grade, Min_Mark, Max_Mark)
--
-- Objective: Generate a report (Name, Grade, Marks) with complex conditional logic.
--
-- Logic:
-- 1. Match Students to Grades based on Marks falling between Min_Mark and Max_Mark.
-- 2. Display Name only if Grade >= 8. Otherwise, display NULL.
-- 3. Order by:
--    a. Grade DESC (primary sort)
--    b. If Grade >= 8: Name ASC (secondary sort)
--    c. If Grade < 8: Marks ASC (secondary sort)

SELECT
    -- Conditional Name Selection
    CASE
        WHEN G.Grade >= 8 THEN S.Name
        ELSE NULL
    END AS Name,

    G.Grade,
    S.Marks
FROM
    Students S
JOIN
    Grades G
ON
    S.Marks BETWEEN G.Min_Mark AND G.Max_Mark
ORDER BY
    -- Primary Sort: Grade Descending
    G.Grade DESC,

    -- Secondary Sort 1 (For Grades 8-10): Sort by Name Ascending
    -- This CASE statement returns the Name for high grades and NULL otherwise.
    -- The non-NULL values (Names) will be sorted alphabetically.
    CASE WHEN G.Grade >= 8 THEN S.Name END ASC,

    -- Secondary Sort 2 (For Grades 1-7): Sort by Marks Ascending
    -- This CASE statement returns the Marks for low grades and NULL otherwise.
    -- The non-NULL values (Marks) will be sorted numerically.
    CASE WHEN G.Grade < 8 THEN S.Marks END ASC;