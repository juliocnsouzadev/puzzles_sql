SELECT CEILING(
    AVG(SALARY) - AVG(
        CAST(
            REPLACE(SALARY, '0','') AS UNSIGNED
        ) 
    )
)AS ERROR_AMOUNT FROM EMPLOYEES