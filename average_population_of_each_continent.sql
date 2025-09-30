/*
Problem Statement:
Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and
their respective average city populations (CITY.Population) rounded down to the nearest integer.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

Language: MySQL
*/

-- MySQL Query:
SELECT
    -- 1. Select the Continent name
    T2.CONTINENT,
    -- 2. Calculate the average population and round it down to the nearest integer
    FLOOR(AVG(T1.POPULATION))
FROM
    CITY AS T1
INNER JOIN
    COUNTRY AS T2
ON
    -- Join the tables on the country code
    T1.COUNTRYCODE = T2.CODE
GROUP BY
    -- Group the results by continent to calculate the average for each
    T2.CONTINENT;