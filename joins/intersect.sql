SELECT code, year
  FROM economies
	INTERSECT 
SELECT country_code, year
  FROM populations
ORDER BY code, year;

SELECT name
  FROM countries
	INTERSECT
SELECT name
  FROM cities;