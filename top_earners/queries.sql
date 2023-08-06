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