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
