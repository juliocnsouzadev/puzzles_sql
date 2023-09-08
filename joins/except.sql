SELECT name
  FROM cities
	EXCEPT
SELECT capital
  FROM countries
ORDER BY name;

SELECT capital
  FROM countries
	EXCEPT
SELECT name
  FROM cities
ORDER BY capital;