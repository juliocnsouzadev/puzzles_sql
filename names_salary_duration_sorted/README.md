## Scenario
In this scenario, we have a database table named `EMPLOYEE` that contains information about employees. The `EMPLOYEE` table has the following schema:

- `EMPLOYEE_ID`: The unique identifier for each employee.
- `NAME`: The name of the employee (VARCHAR).
- `SALARY`: The salary of the employee per month (NUMBER).
- `MONTHS`: The number of months the employee has been employed (NUMBER).

We need to retrieve a list of employee names from the `EMPLOYEE` table for employees who have a salary greater than 2000 per month and have been employees for less than 10 months. The result should be sorted in ascending order based on the `EMPLOYEE_ID`.

## Query
The SQL query to achieve the desired result is as follows:

```sql
/* Write a query that prints a list of employee names (i.e.: the name attribute)
   for employees in Employee having a salary greater than 2000 per month who
   have been employees for less than 10 months. Sort your result by ascending employee_id. */

SELECT NAME FROM EMPLOYEE
WHERE SALARY > 2000
AND MONTHS < 10
ORDER BY EMPLOYEE_ID;
```

## Query Explanation
Let's break down the query step by step:

1. `SELECT NAME`: This part of the query selects the `NAME` column from the `EMPLOYEE` table, which contains the names of the employees.

2. `FROM EMPLOYEE`: This specifies that we are querying the `EMPLOYEE` table.

3. `WHERE SALARY > 2000 AND MONTHS < 10`: The `WHERE` clause filters the rows based on two conditions: the employee's salary must be greater than 2000 per month (`SALARY > 2000`), and the employee must have been employed for less than 10 months (`MONTHS < 10`).

4. `ORDER BY EMPLOYEE_ID`: The `ORDER BY` clause sorts the result set in ascending order based on the `EMPLOYEE_ID`.

The final result of the query will be a list of employee names from the `EMPLOYEE` table who meet the specified conditions, sorted by ascending `EMPLOYEE_ID`.

Make sure to have the `EMPLOYEE` table available in the database for the query to execute successfully.

---

Note: The above explanation assumes that you have access to the database containing the `EMPLOYEE` table with appropriate permissions to execute the query.