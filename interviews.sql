/*
Problem Statement: Interviews (HackerRank)

Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions,
total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id.
Exclude the contest from the result if all four sums are 0.

Tables:
- Contests (contest_id: Integer, hacker_id: Integer, name: String)
- Colleges (college_id: Integer, contest_id: Integer)
- Challenges (challenge_id: Integer, college_id: Integer)
- View_Stats (challenge_id: Integer, total_views: Integer, total_unique_views: Integer)
- Submission_Stats (challenge_id: Integer, total_submissions: Integer, total_accepted_submissions: Integer)

Language: MySQL
*/
-- The SQL Query starts below

SELECT
    C.contest_id,
    C.hacker_id,
    C.name,
    -- Sums the total submissions for all challenges in the contest. COALESCE defaults to 0 if NULL.
    COALESCE(SUM(ss.total_submissions), 0) AS total_submissions,
    COALESCE(SUM(ss.total_accepted_submissions), 0) AS total_accepted_submissions,
    -- Sums the total views for all challenges in the contest. COALESCE defaults to 0 if NULL.
    COALESCE(SUM(vs.total_views), 0) AS total_views,
    COALESCE(SUM(vs.total_unique_views), 0) AS total_unique_views
FROM Contests C
-- Inner joins to link Contests to Challenges
INNER JOIN Colleges CO 
    ON C.contest_id = CO.contest_id
INNER JOIN Challenges CH 
    ON CO.college_id = CH.college_id

-- Subquery to aggregate View Stats by challenge_id first
LEFT JOIN (
    SELECT 
        challenge_id,
        SUM(total_views) AS total_views,
        SUM(total_unique_views) AS total_unique_views
    FROM View_Stats
    GROUP BY challenge_id
) vs ON CH.challenge_id = vs.challenge_id

-- Subquery to aggregate Submission Stats by challenge_id first
LEFT JOIN (
    SELECT 
        challenge_id,
        SUM(total_submissions) AS total_submissions,
        SUM(total_accepted_submissions) AS total_accepted_submissions
    FROM Submission_Stats
    GROUP BY challenge_id
) ss ON CH.challenge_id = ss.challenge_id

-- Group by Contest details to sum up the Challenge statistics
GROUP BY C.contest_id, C.hacker_id, C.name

-- Filter: Exclude contests where all four sums are 0
HAVING
    total_submissions > 0 OR
    total_accepted_submissions > 0 OR
    total_views > 0 OR
    total_unique_views > 0

-- Sort by contest_id ascending
ORDER BY C.contest_id ASC;