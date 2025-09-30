/*
Problem Statement:
Write a query to print the company_code, founder name, total number of lead managers,
total number of senior managers, total number of managers, and total number of employees.
Order your output by ascending company_code.

Table Schemas:
- Company: company_code (String), founder (String)
- Lead_Manager: lead_manager_code (String), company_code (String)
- Senior_Manager: senior_manager_code (String), lead_manager_code (String), company_code (String)
- Manager: manager_code (String), senior_manager_code (String), lead_manager_code (String), company_code (String)
- Employee: employee_code (String), manager_code (String), senior_manager_code (String), lead_manager_code (String), company_code (String)

Language: MySQL
*/

-- MySQL Query: Counting distinct employees at each level per company
SELECT
    C.COMPANY_CODE,
    C.FOUNDER,
    -- Count distinct lead managers associated with the company
    COUNT(DISTINCT E.LEAD_MANAGER_CODE) AS total_lead_managers,
    -- Count distinct senior managers
    COUNT(DISTINCT E.SENIOR_MANAGER_CODE) AS total_senior_managers,
    -- Count distinct managers
    COUNT(DISTINCT E.MANAGER_CODE) AS total_managers,
    -- Count distinct employees
    COUNT(DISTINCT E.EMPLOYEE_CODE) AS total_employees
FROM
    Company C
INNER JOIN
    -- Employee table contains all necessary hierarchy codes to count distinct personnel
    Employee E ON C.COMPANY_CODE = E.COMPANY_CODE
GROUP BY
    C.COMPANY_CODE,
    C.FOUNDER
ORDER BY
    C.COMPANY_CODE ASC;