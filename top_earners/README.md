## Scenario

We define an employee's total earnings to be their monthly `salary x months`  worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as `2` space-separated integers.

The Employee table containing employee data for a company is described as follows:
```
Column          Type
employee_id     Integer
name            String
months          Integer
salary          Integer
```
where employee_id is an employee's ID number, name is their name, months is the total number of months they've been working for the company, and salary is the their monthly salary.

## Solution

```sql
SELECT 
    total_earnings,
    COUNT(employee_id) AS total_employees
FROM (
    SELECT 
        employee_id, 
        salary * months AS total_earnings
    FROM Employee
) AS sub
WHERE total_earnings = (SELECT MAX(salary * months) FROM Employee)
GROUP BY total_earnings;
```

This query selects the total earnings and total number of employees for the employee(s) who have the highest total earnings. It achieves this by first creating a subquery that calculates the total earnings for each employee by multiplying their salary by the number of months they have worked. The subquery then selects the employee ID and total earnings for each employee.

The outer query then filters the results to only include the employee(s) with the highest total earnings by comparing the total earnings of each employee to the maximum total earnings calculated in the subquery. Finally, the query groups the results by total earnings and counts the number of employees with that total earnings.

### Here's a breakdown of the query
The subquery calculates the total earnings for each employee by multiplying their salary by the number of months they have worked:
```sql
SELECT 
    employee_id, 
    salary * months AS total_earnings
FROM Employee
```

The outer query selects the total earnings and total number of employees for the employee(s) with the highest total earnings:
```sql
SELECT 
    total_earnings,
    COUNT(employee_id) AS total_employees
```

The outer query filters the results to only include the employee(s) with the highest total earnings:
```sql
WHERE total_earnings = (SELECT MAX(salary * months) FROM Employee)
```

The outer query groups the results by total earnings and counts the number of employees with that total earnings:
```sql
GROUP BY total_earnings;
```