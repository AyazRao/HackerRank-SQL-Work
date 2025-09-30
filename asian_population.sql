/*
Problem Statement:
Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the
CONTINENT is 'Asia'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

Table Schemas:
CITY
+--------------+--------------+
| Field        | Type         |
+--------------+--------------+
| ID           | NUMBER       |
| NAME         | VARCHAR2(17) |
| COUNTRYCODE  | VARCHAR2(3)  |
| DISTRICT     | VARCHAR2(20) |
| POPULATION   | NUMBER       |
+--------------+--------------+

COUNTRY
+--------------+--------------+
| Field        | Type         |
+--------------+--------------+
| CODE         | VARCHAR2(3)  |
| NAME         | VARCHAR2(44) |
| CONTINENT    | VARCHAR2(13) |
| ...          | ...          |
+--------------+--------------+

Language: MySQL
*/

-- MySQL Query:
SELECT
    -- Sum the population of the filtered cities
    SUM(T1.POPULATION)
FROM
    CITY AS T1
INNER JOIN
    COUNTRY AS T2
ON
    -- Join the tables on the country code
    T1.COUNTRYCODE = T2.CODE
WHERE
    -- Filter for the 'Asia' continent
    T2.CONTINENT = 'Asia';