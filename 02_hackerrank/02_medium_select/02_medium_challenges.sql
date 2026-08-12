-- ============================================================
-- HackerRank: Advanced Select / Medium Challenges
-- ============================================================

-- Challenge 1: New Companies
-- Platform: HackerRank (Advanced Select)
-- Description: Print the company_code, founder name, total number of lead managers, 
--              total number of senior managers, total number of managers, and total 
--              number of employees. Order output by company_code ASC.

SELECT 
    COMPANY.COMPANY_CODE, 
    COMPANY.FOUNDER, 
    COUNT(DISTINCT LEAD_MANAGER.LEAD_MANAGER_CODE),
    COUNT(DISTINCT SENIOR_MANAGER.SENIOR_MANAGER_CODE),
    COUNT(DISTINCT MANAGER.MANAGER_CODE),
    COUNT(DISTINCT EMPLOYEE.EMPLOYEE_CODE)
FROM COMPANY
JOIN LEAD_MANAGER
    ON COMPANY.COMPANY_CODE = LEAD_MANAGER.COMPANY_CODE
JOIN SENIOR_MANAGER
    ON COMPANY.COMPANY_CODE = SENIOR_MANAGER.COMPANY_CODE
JOIN MANAGER 
    ON COMPANY.COMPANY_CODE = MANAGER.COMPANY_CODE
JOIN EMPLOYEE
    ON COMPANY.COMPANY_CODE = EMPLOYEE.COMPANY_CODE  
GROUP BY COMPANY.COMPANY_CODE, COMPANY.FOUNDER
ORDER BY COMPANY.COMPANY_CODE ASC;


-- Challenge 2: Occupations
-- Platform: HackerRank (Advanced Select)
-- Description: Pivot the Occupation column in OCCUPATIONS so that each Name is sorted 
--              alphabetically and displayed underneath its corresponding Occupation. 
--              The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

SELECT 
    MAX(IF(Occupation = 'Doctor', Name, NULL)) AS Doctor,
    MAX(IF(Occupation = 'Professor', Name, NULL)) AS Professor,
    MAX(IF(Occupation = 'Singer', Name, NULL)) AS Singer,
    MAX(IF(Occupation = 'Actor', Name, NULL)) AS Actor
FROM (
    SELECT 
        Name, 
        Occupation,
        ROW_NUMBER() OVER(PARTITION BY Occupation ORDER BY Name) AS row_num
    FROM OCCUPATIONS
) AS DATOS_ORIGEN
GROUP BY row_num
ORDER BY row_num;


-- Challenge 3: Top Competitors
-- Platform: HackerRank (Advanced Join)
-- Description: Print the hacker_id and name of hackers who achieved full scores 
--              for more than one challenge. Order the output by the total number 
--              of challenges in which the hacker earned a full score in DESC order. 
--              If more than one hacker received full scores in the same number 
--              of challenges, sort them by hacker_id in ASC order.

SELECT 
    H.hacker_id, 
    H.name
FROM HACKERS H
JOIN SUBMISSIONS S 
    ON H.hacker_id = S.hacker_id
JOIN CHALLENGES C 
    ON S.challenge_id = C.challenge_id
JOIN DIFFICULTY D 
    ON C.difficulty_level = D.difficulty_level
WHERE S.score = D.score
GROUP BY H.hacker_id, H.name
HAVING COUNT(S.submission_id) > 1
ORDER BY COUNT(S.submission_id) DESC, H.hacker_id ASC;


-- Challenge 4: Ollivander's Inventory
-- Platform: HackerRank (Advanced Join / Window Functions)
-- Description: Harry wants to find the minimum number of gold galleons (coins_needed) 
--              needed to buy each non-evil wand (is_evil = 0) of high power and age. 
--              The output is ordered by power in DESC order, then by age in DESC order.


SELECT ID, AGE, COINS_NEEDED, POWER
FROM(
SELECT WANDS.ID, WANDS_PROPERTY.AGE, WANDS.COINS_NEEDED, WANDS.POWER,
 
ROW_NUMBER() OVER(PARTITION BY WANDS.CODE, WANDS.POWER 
ORDER BY WANDS.COINS_NEEDED ASC) AS FILA 
 
 
FROM WANDS 
JOIN WANDS_PROPERTY ON WANDS.CODE = WANDS_PROPERTY.CODE

WHERE  WANDS_PROPERTY.IS_EVIL = 0

 ) AS SUBTABLA
 WHERE FILA = 1
 ORDER BY POWER DESC, AGE DESC


-- ==============================================================================
-- Challenge 5
-- Description:
--   Write a query to print the hacker_id, name, and the total number of challenges
--   created by each student. 
--   
-- Filtering Rules (HAVING clause):
--   1. Include students who created the MAXIMUM total number of challenges.
--   2. Include students whose total number of challenges is UNIQUE (no other student 
--      has created that exact same amount).
--   3. Exclude students whose total number of challenges is duplicated if it is 
--      LESS than the maximum.
--
-- Sorting (ORDER BY):
--   - Primary: Total number of challenges in DESCENDING order.
--   - Secondary: hacker_id in ASCENDING order (tie-breaker).
-- ==============================================================================

SELECT 
    HACKERS.HACKER_ID, 
    HACKERS.NAME, 
    COUNT(CHALLENGES.CHALLENGE_ID) AS TOTAL_CHALLENGES
FROM HACKERS
JOIN CHALLENGES 
    ON HACKERS.HACKER_ID = CHALLENGES.HACKER_ID
GROUP BY 
    HACKERS.HACKER_ID, 
    HACKERS.NAME

HAVING 
    -- Condition 1: Keep hackers who created the absolute MAXIMUM number of challenges
    COUNT(CHALLENGES.CHALLENGE_ID) = (
        SELECT MAX(TEMP_TOTAL)
        FROM (
            SELECT COUNT(CHALLENGE_ID) AS TEMP_TOTAL
            FROM CHALLENGES
            GROUP BY HACKER_ID
        ) AS TEMP1
    )

    OR

    -- Condition 2: Keep hackers whose challenge count is UNIQUE (occurs exactly 1 time)
    COUNT(CHALLENGES.CHALLENGE_ID) IN (
        SELECT TEMP_TOTAL
        FROM (
            SELECT COUNT(CHALLENGE_ID) AS TEMP_TOTAL
            FROM CHALLENGES
            GROUP BY HACKER_ID
        ) AS TEMP2
        GROUP BY TEMP_TOTAL
        HAVING COUNT(TEMP_TOTAL) = 1
    )

ORDER BY 
    COUNT(CHALLENGES.CHALLENGE_ID) DESC, 
    HACKERS.HACKER_ID ASC;
