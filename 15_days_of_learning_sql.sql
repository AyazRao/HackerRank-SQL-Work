WITH RECURSIVE daily_hackers AS (
    SELECT DISTINCT submission_date, hacker_id
    FROM submissions
),
ordered_dates AS (
    SELECT DISTINCT submission_date
    FROM submissions
    ORDER BY submission_date
),
recursive_hackers AS (
    SELECT 
        d.submission_date,
        h.hacker_id
    FROM ordered_dates d
    JOIN daily_hackers h 
      ON d.submission_date = h.submission_date
    WHERE d.submission_date = (SELECT MIN(submission_date) FROM ordered_dates)

    UNION ALL

    SELECT 
        d.submission_date,
        h.hacker_id
    FROM ordered_dates d
    JOIN daily_hackers h 
      ON d.submission_date = h.submission_date
    JOIN recursive_hackers prev
      ON h.hacker_id = prev.hacker_id
    WHERE d.submission_date = (
        SELECT MIN(submission_date)
        FROM ordered_dates
        WHERE submission_date > prev.submission_date
    )
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