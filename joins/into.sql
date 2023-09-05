SELECT country_code, size,
  CASE WHEN size > 50000000
            THEN 'large'
       WHEN size > 1000000
            THEN 'medium'
       ELSE 'small' END
       AS popsize_group
INTO pop_plus       
FROM populations
WHERE year = 2015;

SELECT name, continent, geosize_group, popsize_group,
CASE WHEN popsize_group = 'large' THEN 3
WHEN popsize_group = 'medium' THEN 2
ELSE 1 END AS pp,
CASE WHEN geosize_group = 'large' THEN 3
WHEN geosize_group = 'medium' THEN 2
ELSE 1 END AS gp
INTO cp_plus
FROM countries_plus AS c
  inner join pop_plus AS p
    on c.code = p.country_code;


SELECT name, continent, geosize_group, popsize_group,(pp / gp) AS density
FROM cp_plus   
ORDER BY density DESC;