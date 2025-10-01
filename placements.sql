/*
Problem Statement: Placements (HackerRank)

You are given three tables: Students, Friends and Packages. 
- Students: ID, Name.
- Friends: ID, Friend_ID (ID of the ONLY best friend).
- Packages: ID, Salary (offered salary in $ thousands per month).

Write a query to output the names of those students whose best friends got offered a higher salary than them.

Sorting Rules:
1. Names must be ordered by the salary amount offered to the best friends (ascending).

Guarantee: It is guaranteed that no two students got the same salary offer.

Tables:
- Students (ID: Integer, Name: String)
- Friends (ID: Integer, Friend_ID: Integer)
- Packages (ID: Integer, Salary: Float)

Language: MySQL
*/
-- The SQL Query starts below

SELECT t.student_name 
FROM Packages p1
JOIN (
    -- Subquery (t) to get the Student's details and their best friend's ID
    SELECT 
        s.id AS student_id,
        s.name AS student_name,
        p.salary AS student_salary,
        f.friend_id AS friend_id
    FROM Students s
    INNER JOIN Friends f
        ON s.id = f.id               -- Join Student to their Friend mapping
    INNER JOIN Packages p
        ON s.id = p.id               -- Join Student to their own Salary
) AS t 
    -- Outer Join: Match the Friend_ID from the subquery (t) to the Friend's Salary (p1)
    ON p1.id = t.friend_id
WHERE 
    -- Filter: Only include students where the Friend's salary (p1.salary) is higher than the student's salary (t.student_salary)
    p1.salary > t.student_salary
ORDER BY 
    -- Order by the Friend's salary (ascending)
    p1.salary ASC;