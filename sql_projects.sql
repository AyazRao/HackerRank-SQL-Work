/*
Problem Statement: SQL Project Planning (HackerRank)

You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date.
It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day for each row in the table.

If the End_Date of the tasks are consecutive, they are part of the same project.
Write a query to output the start and end dates of projects.

Sorting Rules:
1. Order by the number of days it took to complete the project in ascending order.
2. If there is more than one project that has the same number of completion days, then order by the Start_Date of the project.

Tables:
- Projects (Task_ID: Integer, Start_Date: Date, End_Date: Date)

Language: MySQL
*/
-- The SQL Query starts below

WITH cte AS
(
    SELECT 
        Task_ID,
        Start_Date, 
        End_Date, 
        -- Creates a unique ID for each continuous sequence of dates.
        -- When dates are consecutive, Start_Date - ROW_NUMBER() will be constant.
        DATE_SUB(Start_Date, INTERVAL ROW_NUMBER() OVER(ORDER BY Start_Date ASC) DAY) as Group_id
    FROM Projects 
)

SELECT 
    MIN(Start_Date), 
    MAX(End_Date) 
FROM cte 
GROUP BY Group_id
ORDER BY 
    -- 1. Sort by duration (MAX(End_Date) - MIN(Start_Date)) Ascending
    DATEDIFF(MAX(End_Date), MIN(Start_Date)) ASC,
    -- 2. Sort by Project Start Date (MIN(Start_Date)) Ascending
    MIN(Start_Date) ASC;