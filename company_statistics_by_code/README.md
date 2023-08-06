## Scenario
In this scenario, we have multiple tables that contain information about a company's organizational structure. The tables are as follows:

- `COMPANY`: Contains information about companies, including the company code and founder name.
- `LEAD_MANAGER`: Contains information about lead managers in each company.
- `SENIOR_MANAGER`: Contains information about senior managers in each company.
- `MANAGER`: Contains information about managers in each company.
- `EMPLOYEE`: Contains information about employees in each company.

We need to retrieve specific details for each company, including the company code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. The result should be ordered in ascending order based on the company code.

## Query
The SQL query to achieve the desired result is as follows:

```sql
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
```

## Query Explanation
Let's break down the query step by step:

1. `SELECT COMPANY.COMPANY_CODE, COMPANY.FOUNDER, ...`: This part of the query selects the `COMPANY_CODE` and `FOUNDER` columns from the `COMPANY` table. Additionally, it includes subqueries to calculate the total number of lead managers, senior managers, managers, and employees for each company.

2. `FROM COMPANY`: This specifies that we are querying the `COMPANY` table.

3. Subqueries: The query includes four subqueries, each of which calculates the count of distinct codes for lead managers, senior managers, managers, and employees from their respective tables (`LEAD_MANAGER`, `SENIOR_MANAGER`, `MANAGER`, and `EMPLOYEE`). The subqueries are correlated subqueries, and they use the `COMPANY_CODE` from the outer query to get the count specific to each company.

4. `GROUP BY COMPANY.COMPANY_CODE, COMPANY.FOUNDER`: The `GROUP BY` clause groups the result set by the `COMPANY_CODE` and `FOUNDER`, which ensures that each row represents a unique company with its respective founder.

5. `ORDER BY COMPANY.COMPANY_CODE`: The `ORDER BY` clause sorts the result set in ascending order based on the `COMPANY_CODE`.

The final result of the query will be a list of company details, including the company code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees, ordered by ascending company code.

Make sure to have the tables (`COMPANY`, `LEAD_MANAGER`, `SENIOR_MANAGER`, `MANAGER`, and `EMPLOYEE`) available in the database for the query to execute successfully.

---

Note: The above explanation assumes that you have access to the database containing these tables with appropriate permissions to execute the query.