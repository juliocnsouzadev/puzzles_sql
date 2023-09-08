SELECT *
FROM economies2010
UNION ALL
SELECT * 
FROM economies2015
ORDER BY code, year;

SELECT country_code
  FROM cities
	UNION
SELECT code
  FROM currencies
ORDER BY country_code;

SELECT code, year
  FROM economies
	UNION ALL
SELECT country_code, year
  FROM populations
ORDER BY code, year;