SELECT c1.name AS city, code, c2.name AS country,
       region, city_proper_pop
FROM cities AS c1
  LEFT JOIN countries AS c2
    ON c1.country_code = c2.code
ORDER BY code DESC;

SELECT c.name as country, local_name, l.name as language, percent
FROM countries as c
LEFT JOIN languages as l
ON c.code = l.code
ORDER BY country DESC;

SELECT name, region, gdp_percapita
FROM countries as c
LEFT JOIN economies as e
ON c.code = e.code
WHERE e.year = 2010;

SELECT region, AVG(gdp_percapita) AS avg_gdp
FROM countries as c
LEFT JOIN economies as e
ON c.code = e.code
WHERE e.year = 2010
GROUP BY region;