-- ============================================================
-- HackerRank: Basic Select (18 Challenges)
-- ============================================================

-- Challenge 1: Revising the Select Query I
SELECT * 
FROM CITY 
WHERE COUNTRYCODE = 'USA' 
  AND POPULATION > 100000;

-- Challenge 2: Revising the Select Query II
SELECT NAME 
FROM CITY 
WHERE POPULATION > 120000 
  AND COUNTRYCODE = 'USA';

-- Challenge 3: Japanese Cities' Attributes
SELECT * 
FROM CITY 
WHERE COUNTRYCODE = 'JPN';

-- Challenge 4: Japanese Cities' Names
SELECT NAME 
FROM CITY 
WHERE COUNTRYCODE = 'JPN';

-- Challenge 5: Weather Observation Station 1
SELECT CITY, STATE 
FROM STATION;

-- Challenge 6: Weather Observation Station 3
SELECT DISTINCT CITY 
FROM STATION 
WHERE ID % 2 = 0;

-- Challenge 7: Weather Observation Station 4
SELECT COUNT(CITY) - COUNT(DISTINCT CITY) 
FROM STATION;

-- Challenge 8: Weather Observation Station 5
SELECT CITY, LENGTH(CITY) 
FROM STATION 
ORDER BY LENGTH(CITY) ASC, CITY ASC 
LIMIT 1;

SELECT CITY, LENGTH(CITY) 
FROM STATION 
ORDER BY LENGTH(CITY) DESC, CITY ASC 
LIMIT 1;

-- Challenge 9: Weather Observation Station 6
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP '^[AEIOUaeiou]';

-- Challenge 10: Weather Observation Station 7
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP '[AEIOUaeiou]$';

-- Challenge 11: Weather Observation Station 8
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP '^[AEIOUaeiou].*[AEIOUaeiou]$';

-- Challenge 12: Weather Observation Station 9
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP '^[^AEIOUaeiou]';

-- Challenge 13: Weather Observation Station 10
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP '[^AEIOUaeiou]$';

-- Challenge 14: Weather Observation Station 11
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP '^[^AEIOUaeiou]|[^AEIOUaeiou]$';

-- Challenge 15: Weather Observation Station 12
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP '^[^AEIOUaeiou].*[^AEIOUaeiou]$';

-- Challenge 16: Higher Than 75 Marks
SELECT NAME 
FROM STUDENTS 
WHERE MARKS > 75 
ORDER BY RIGHT(NAME, 3), ID ASC;

-- Challenge 17: Employee Names
SELECT NAME 
FROM EMPLOYEE 
ORDER BY NAME ASC;

-- Challenge 18: Employee Salaries
SELECT NAME 
FROM EMPLOYEE 
WHERE SALARY > 2000 
  AND MONTHS < 10 
ORDER BY EMPLOYEE_ID ASC;

-- Challenge 19: The Blunder
-- Query the difference between the actual average salary and Samantha's miscalculated average salary, rounded up to the next integer.

SELECT CEIL(AVG(Salary) - AVG(REPLACE(Salary, '0', '')))
FROM EMPLOYEES;


-- Challenge 20: Top Earners
-- Query the maximum total earnings and the number of employees who have the maximum total earnings.

SELECT 
    (months * salary) AS total_earnings, 
    COUNT(*)
FROM Employee
GROUP BY total_earnings
ORDER BY total_earnings DESC
LIMIT 1;

-- Challenge 21: Top Earners
-- Platform: HackerRank (Aggregation)
-- Description: Query the maximum total earnings (months * salary) for all employees 
--              and the total number of employees who have that maximum total earnings.

SELECT 
    (months * salary) AS total_earnings, 
    COUNT(*)
FROM employee
GROUP BY total_earnings
ORDER BY total_earnings DESC
LIMIT 1;

-- Challenge 22: Weather Observation Station 13
-- Platform: HackerRank (Aggregation)
-- Description: Query the sum of Northern Latitudes (LAT_N) from STATION 
--              having values greater than 38.7880 and less than 137.2345.
--              Truncate the answer to 4 decimal places.

SELECT TRUNCATE(SUM(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;

-- Challenge 23: Weather Observation Station 14
-- Platform: HackerRank (Aggregation)
-- Description: Query the greatest value of the Northern Latitudes (LAT_N) from STATION 
--              that is less than 137.2345. Truncate the answer to 4 decimal places.

SELECT TRUNCATE(MAX(LAT_N), 4)
FROM STATION
WHERE LAT_N < 137.2345;

-- Challenge 24: Weather Observation Station 15
-- Platform: HackerRank (Aggregation)
-- Description: Query the Western Longitude (LONG_W) for the largest 
--              Northern Latitude (LAT_N) in STATION that is less than 137.2345.
--              Round the answer to 4 decimal places.

SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N < 137.2345
ORDER BY LAT_N DESC
LIMIT 1;

-- Challenge 25: Weather Observation Station 16
-- Platform: HackerRank (Aggregation)
-- Description: Query the smallest Northern Latitude (LAT_N) from STATION 
--              that is greater than 38.7780. Round the answer to 4 decimal places.

SELECT ROUND(LAT_N, 4) 
FROM STATION 
WHERE LAT_N > 38.7780
ORDER BY LAT_N ASC
LIMIT 1;

-- Challenge 26: Weather Observation Station 17
-- Platform: HackerRank (Aggregation)
-- Description: Query the Western Longitude (LONG_W) where the smallest 
--              Northern Latitude (LAT_N) in STATION is greater than 38.7780. 
--              Round the answer to 4 decimal places.

SELECT ROUND(LONG_W, 4) 
FROM STATION
WHERE LAT_N > 38.7780 
ORDER BY LAT_N ASC
LIMIT 1;


-- Challenge 27: Weather Observation Station 18
-- Platform: HackerRank (Aggregation)
-- Description: Query the Manhattan Distance between P1(min(LAT_N), min(LONG_W)) 
--              and P2(max(LAT_N), max(LONG_W)) rounded to 4 decimal places.

SELECT 
    ROUND(
        ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MIN(LONG_W) - MAX(LONG_W)), 
        4
    )
FROM STATION;

-- Challenge 30: Weather Observation Station 19
-- Platform: HackerRank (Aggregation)
-- Description: Query the Euclidean Distance between P1(min(LAT_N), min(LONG_W)) 
--              and P2(max(LAT_N), max(LONG_W)) rounded to 4 decimal places.

SELECT ROUND(
    SQRT(
        POWER(MIN(LAT_N) - MAX(LAT_N), 2) + 
        POWER(MIN(LONG_W) - MAX(LONG_W), 2)
    ), 
    4
)
FROM STATION;

-- Challenge 31: Asian Population
-- Platform: HackerRank (Basic Join)
-- Description: Query the sum of the populations of all cities 
--              where the CONTINENT is 'Asia'.

SELECT SUM(CITY.POPULATION) 
FROM CITY
JOIN COUNTRY 
    ON CITY.COUNTRYCODE = COUNTRY.CODE 
WHERE COUNTRY.CONTINENT = 'Asia';

-- Challenge 32: African Cities
-- Platform: HackerRank (Basic Join)
-- Description: Query the names of all cities where the CONTINENT is 'Africa'.

SELECT CITY.NAME 
FROM CITY
JOIN COUNTRY 
    ON CITY.COUNTRYCODE = COUNTRY.CODE 
WHERE LOWER(COUNTRY.CONTINENT) = 'africa';


-- Challenge 33: Average Population of Each Continent
-- Platform: HackerRank (Basic Join)
-- Description: Query the names of all the continents and their respective 
--              average city populations rounded down to the nearest integer.

SELECT 
    COUNTRY.CONTINENT, 
    FLOOR(AVG(CITY.POPULATION)) 
FROM CITY
JOIN COUNTRY
    ON CITY.COUNTRYCODE = COUNTRY.CODE
GROUP BY COUNTRY.CONTINENT;

-- Challenge 34: The Report
-- Platform: HackerRank (Advanced Join / Conditional)
-- Description: Generate a report containing Name, Grade and Mark. 
--              Names are NULL for Grades < 8. Order by Grade DESC, Name ASC, Marks ASC.

SELECT 
    CASE 
        WHEN GRADES.GRADE < 8 THEN NULL 
        ELSE STUDENTS.NAME 
    END AS NAME,
    GRADES.GRADE, 
    STUDENTS.MARKS
FROM STUDENTS
JOIN GRADES     
    ON STUDENTS.MARKS BETWEEN GRADES.MIN_MARK AND GRADES.MAX_MARK
ORDER BY 
    GRADES.GRADE DESC, 
    STUDENTS.NAME ASC, 
    STUDENTS.MARKS ASC;

