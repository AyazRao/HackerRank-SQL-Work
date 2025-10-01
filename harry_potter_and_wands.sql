/*
Problem Statement:
Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
Hermione decides the best way to choose is by determining the minimum number of gold galleons
needed to buy each non-evil wand of high power and age.
Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in,
sorted in order of descending power. If more than one wand has same power, sort the result
in order of descending age. (A non-evil wand has is_evil = 0).

Tables:
- WANDS
  - id (Integer)
  - code (Integer)
  - coins_needed (Integer)
  - power (Integer)
- WANDS_PROPERTY
  - code (Integer)
  - age (Integer)
  - is_evil (Integer)

Matching Key: WANDS.code = WANDS_PROPERTY.code

Language: Generic SQL (compatible with MySQL/PostgreSQL)
*/
-- The SQL Query starts below
SELECT
    W.ID,
    P.AGE,
    W.COINS_NEEDED,
    W.POWER
FROM WANDS W
JOIN WANDS_PROPERTY P
  ON W.CODE = P.CODE
WHERE P.IS_EVIL = 0 -- 1. Filter: Select only non-evil wands
  -- 2. Filter: Select only wands where coins_needed is the minimum for that specific (Age, Power) combination
  AND W.COINS_NEEDED = (
      SELECT MIN(W_INNER.COINS_NEEDED)
      FROM WANDS W_INNER
      JOIN WANDS_PROPERTY P_INNER
        ON W_INNER.CODE = P_INNER.CODE
      WHERE P_INNER.AGE = P.AGE
        AND W_INNER.POWER = W.POWER
  )
ORDER BY
    W.POWER DESC, -- Primary Sort: Descending Power
    P.AGE DESC;   -- Secondary Sort: Descending Age