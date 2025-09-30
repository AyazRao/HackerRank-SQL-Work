
Problem Statement
[cite_start]Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table[cite 52].
[cite_start](This calculates the number of duplicate city names in the table[cite 57, 58, 59].)

Table Schema (STATION)
+---------+------------------+
 Field    Type             
+---------+------------------+
 ID       NUMBER           
 CITY     VARCHAR2(21)     
 STATE    VARCHAR2(2)      
 LAT_N    NUMBER           
 LONG_W   NUMBER           
+---------+------------------+
[cite_start](LAT_N is the northern latitude and LONG_W is the western longitude[cite 56].)

Language MySQL


-- MySQL Query
SELECT
    COUNT(s.city) - COUNT(distinct s.city)
FROM
    station s;