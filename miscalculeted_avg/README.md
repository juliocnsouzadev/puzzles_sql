# Miscalculate AVG

## Problem

Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.

Write a query calculating the amount of error (i.e.:  actual - miscalculted average monthly salaries), and round it up to the next integer.

```
Column      Type
ID          Integer
Name        String
Salary      Integer
```

## Solution

```sql
SELECT CEILING(
    AVG(SALARY) - AVG(
        CAST(
            REPLACE(SALARY, '0','') AS UNSIGNED
        ) 
    )
)AS ERROR_AMOUNT FROM EMPLOYEES
```

### Explanation
- `REPLACE(salary, '0', '')`: Removes all zeros from the salary.
- `CAST(... AS UNSIGNED)`: Converts the result to an unsigned integer, as the replacement might result in a string.
- `AVG(salary)`: Calculates the actual average salary.
- `AVG(CAST(REPLACE(salary, '0', '') AS UNSIGNED))`: Calculates the miscalculated average salary.
- `CEILING(...)`: Rounds the difference up to the next integer.
- The result will be aliased as `error_amount`.