## Scenario
In this scenario, we have a database table named `EMPLOYEE` that contains information about employees. The `EMPLOYEE` table has the following schema:

- `EMPLOYEE_ID`: The unique identifier for each employee.
- `NAME`: The name of the employee (VARCHAR).
- `SALARY`: The salary of the employee per month (NUMBER).
- `MONTHS`: The number of months the employee has been employed (NUMBER).

We need to retrieve a list of employee names from the `EMPLOYEE` table in alphabetical order.

## Query
The SQL query to achieve the desired result is as follows:

```sql
/* Write a query that prints a list of employee names (i.e.: the name attribute)
   from the Employee table in alphabetical order. */

SELECT NAME FROM EMPLOYEE ORDER BY NAME;
```

## Query Explanation
Let's break down the query step by step:

1. `SELECT NAME`: This part of the query selects the `NAME` column from the `EMPLOYEE` table, which contains the names of the employees.

2. `FROM EMPLOYEE`: This specifies that we are querying the `EMPLOYEE` table.

3. `ORDER BY NAME`: The `ORDER BY` clause sorts the result set in alphabetical order based on the `NAME` column.

The final result of the query will be a list of employee names from the `EMPLOYEE` table, sorted in alphabetical order.

Make sure to have the `EMPLOYEE` table available in the database for the query to execute successfully.

---

Note: The above explanation assumes that you have access to the database containing the `EMPLOYEE` table with appropriate permissions to execute the query.