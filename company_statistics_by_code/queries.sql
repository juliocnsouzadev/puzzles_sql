/* Given the table schemas below, write a query to print the company_code, founder name,
   total number of lead managers, total number of senior managers, total number of managers,
   and total number of employees.
   Order your output by ascending company_code. */

SELECT COMPANY.COMPANY_CODE, COMPANY.FOUNDER, 
(
    SELECT COUNT(DISTINCT(LEAD_MANAGER.LEAD_MANAGER_CODE)) FROM LEAD_MANAGER WHERE LEAD_MANAGER.COMPANY_CODE = COMPANY.COMPANY_CODE
),
(
    SELECT COUNT(DISTINCT(SENIOR_MANAGER.SENIOR_MANAGER_CODE)) FROM SENIOR_MANAGER WHERE SENIOR_MANAGER.COMPANY_CODE = COMPANY.COMPANY_CODE
),
(
    SELECT COUNT(DISTINCT(MANAGER.MANAGER_CODE)) FROM MANAGER WHERE MANAGER.COMPANY_CODE = COMPANY.COMPANY_CODE
),
(
    SELECT COUNT(DISTINCT(EMPLOYEE.EMPLOYEE_CODE)) FROM EMPLOYEE WHERE EMPLOYEE.COMPANY_CODE = COMPANY.COMPANY_CODE
)
FROM COMPANY
GROUP BY COMPANY.COMPANY_CODE, COMPANY.FOUNDER
ORDER BY COMPANY.COMPANY_CODE;
