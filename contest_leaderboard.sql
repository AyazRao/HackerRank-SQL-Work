/*
Problem Statement: Contest Leaderboard (HackerRank)

The total score of a hacker is the sum of their maximum scores for all of the challenges.
Write a query to print the hacker_id, name, and total score of the hackers.

Exclusion Rule:
Exclude all hackers with a total score of 0 from your result.

Sorting Rules:
1. Order by the descending total score.
2. If more than one hacker achieved the same total score, then sort the result by ascending hacker_id.

Tables:
- Hackers (hacker_id: Integer, name: String)
- Submissions (submission_id: Integer, hacker_id: Integer, challenge_id: Integer, score: Integer)

Language: MySQL
*/
-- The SQL Query starts below

SELECT hacker_id, name, SUM(scores) AS total_score
FROM (
    SELECT
        h.hacker_id,
        h.name,
        -- Find the maximum score achieved by the hacker (h.hacker_id)
        -- for a specific challenge (s.challenge_id).
        MAX(s.score) AS scores
    FROM Hackers h
    INNER JOIN SUBMISSIONS s
        ON h.hacker_id = s.hacker_id 
    GROUP BY h.hacker_id, h.name, s.challenge_id
) AS MaxScoresPerChallenge
GROUP BY hacker_id, name
-- Exclusion Rule: Exclude all hackers with a total score of 0
HAVING total_score > 0
-- Sorting Rules: Score descending, then hacker_id ascending
ORDER BY total_score DESC, hacker_id ASC;