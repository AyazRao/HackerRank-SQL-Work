/*
Problem Statement:
Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

Tables:
- HACKERS (hacker_id, name)
- DIFFICULTY (difficulty_level, score [max score])
- CHALLENGES (challenge_id, hacker_id, difficulty_level)
- SUBMISSIONS (submission_id, hacker_id, challenge_id, score [submission score])

Language: MySQL
*/
-- The SQL Query starts below

SELECT
    h.hacker_id,
    h.name
FROM
    HACKERS h
INNER JOIN
    SUBMISSIONS s ON h.hacker_id = s.hacker_id
INNER JOIN
    CHALLENGES c ON s.challenge_id = c.challenge_id
INNER JOIN
    DIFFICULTY d ON c.difficulty_level = d.difficulty_level
WHERE
    -- Condition for achieving a full score (submission score equals max difficulty score)
    s.score = d.score
GROUP BY
    h.hacker_id,
    h.name
HAVING
    -- Filter for hackers with a full score on more than one challenge
    COUNT(h.hacker_id) > 1
ORDER BY
    -- Primary sort: total number of full-score challenges (descending)
    COUNT(h.hacker_id) DESC,
    -- Secondary sort: hacker_id (ascending)
    h.hacker_id ASC;