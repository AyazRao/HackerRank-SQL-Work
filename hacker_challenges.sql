/*
Problem Statement: Challenges (HackerRank)

Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name,
and the total number of challenges created by each student.

Exclusion Rule:
If more than one student created the same number of challenges and the count is less than the maximum
number of challenges created (i.e., not the absolute maximum count), then exclude those students from the result.

Sorting Rules:
1. Sort your results by the total number of challenges in descending order.
2. If more than one student created the same number of challenges, then sort the result by hacker_id in ascending order.

Tables:
- Hackers (hacker_id: Integer, name: String)
- Challenges (challenge_id: Integer, hacker_id: Integer)

Language: MySQL
*/
-- The SQL Query starts below

WITH CTE_1 AS(
SELECT
    h.hacker_id,
    h.name,
    -- Removed DISTINCT here as COUNT(*) OVER PARTITION handles the grouping correctly
    COUNT(c.challenge_id) OVER (PARTITION BY h.hacker_id) AS no_of_challenges
FROM Hackers h
INNER JOIN Challenges c
    ON h.hacker_id = c.hacker_id
-- Removed ORDER BY from CTE, as it is non-standard and not needed here
),
CTE_2 AS(
    SELECT
        hacker_id,
        name,
        no_of_challenges,
        DENSE_RANK() OVER (ORDER BY no_of_challenges DESC) as rank_no_challenge
    FROM CTE_1
)

SELECT hacker_id, name, no_of_challenges
FROM CTE_2
WHERE rank_no_challenge IN (
    SELECT rank_no_challenge
    FROM CTE_2
    GROUP BY rank_no_challenge   
    -- Logic: Include the max rank (rank 1) OR ranks that are unique (count = 1)
    HAVING COUNT(rank_no_challenge) = 1
    OR rank_no_challenge = 1
)
-- Apply final sorting rule
ORDER BY no_of_challenges DESC, hacker_id ASC;