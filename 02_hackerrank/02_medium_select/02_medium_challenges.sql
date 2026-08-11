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


-- Challenge 2: Top Competitors
-- Platform: HackerRank (Full Score Submissions)
-- Description: ...
