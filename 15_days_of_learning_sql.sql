/*
Problem: 15 Days of Learning SQL (HackerRank) - Oracle/SQL*Plus
--------------------------------------------------------------------------------
Objective: Print the submission_date, the count of unique hackers who made at 
least 1 submission each day (starting on the first day of the contest), the hacker_id, 
and name of the hacker who made the maximum submissions each day. 

Tie-breaker: If more than one hacker has the maximum submissions, print the lowest hacker_id.
Sort Order: The final result must be sorted by submission_date ascending.
--------------------------------------------------------------------------------
*/

-- SQL*Plus / Oracle Session Settings (as provided by user)
SET NULL "NULL";
SET FEEDBACK OFF;
SET ECHO OFF;
SET HEADING OFF;
SET WRAP OFF;
SET LINESIZE 10000;
SET TAB OFF;
SET PAGES 0;
SET DEFINE OFF;

-- Core Query (as provided by user)
WITH RECURSIVE daily_hackers AS (
    SELECT DISTINCT submission_date, hacker_id
    FROM submissions
),
ordered_dates AS (
    SELECT submission_date,
           ROW_NUMBER() OVER (ORDER BY submission_date) AS day_num
    FROM (SELECT DISTINCT submission_date FROM submissions)
),
recursive_hackers (day_num, submission_date, hacker_id) AS (
    SELECT 
        od.day_num,
        od.submission_date,
        dh.hacker_id
    FROM ordered_dates od
    JOIN daily_hackers dh 
      ON od.submission_date = dh.submission_date
    WHERE od.day_num = 1
    UNION ALL
    SELECT 
        od.day_num,
        od.submission_date,
        dh.hacker_id
    FROM ordered_dates od
    JOIN daily_hackers dh 
      ON od.submission_date = dh.submission_date
    JOIN recursive_hackers prev
      ON dh.hacker_id = prev.hacker_id
     AND od.day_num = prev.day_num + 1
),
active_hacker_counts AS (
    SELECT 
        submission_date,
        COUNT(DISTINCT hacker_id) AS active_hacker_count
    FROM recursive_hackers
    GROUP BY submission_date
),
top_hacker_per_day AS (
    SELECT 
        submission_date,
        hacker_id,
        RANK() OVER (
            PARTITION BY submission_date
            ORDER BY COUNT(*) DESC, hacker_id ASC
        ) AS rnk,
        COUNT(*) AS submission_count
    FROM submissions
    GROUP BY submission_date, hacker_id
)
SELECT 
    a.submission_date,
    a.active_hacker_count,
    h.hacker_id,
    hk.name
FROM active_hacker_counts a
JOIN top_hacker_per_day h 
  ON a.submission_date = h.submission_date AND h.rnk = 1
JOIN hackers hk 
  ON h.hacker_id = hk.hacker_id
ORDER BY a.submission_date;

exit;