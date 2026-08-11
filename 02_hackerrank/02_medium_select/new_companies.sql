# New Companies (HackerRank)

## Problem Description
Amber's conglomerate corporation just acquired some new companies. Each company follows a hierarchical structure:
`Company` → `Lead_Manager` → `Senior_Manager` → `Manager` → `Employee`.

Given the table schemas (`Company`, `Lead_Manager`, `Senior_Manager`, `Manager`, and `Employee`), write a query to print the `company_code`, `founder` name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by `company_code` in ascending order.

**Note:**
- The tables may contain duplicate records.
- The `company_code` is string, so the sorting should not be numeric. For example, if the `company_codes` are `C_1`, `C_2`, and `C_10`, then the ascending `company_codes` will be `C_1`, `C_10`, and `C_2`.

---

## SQL Solution

```sql
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
