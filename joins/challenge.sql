
SELECT DISTINCT c.name, e.total_investment, e.imports
  FROM economies AS e
    LEFT JOIN countries AS c
      ON (e.code = c.code
        AND e.code IN (
          SELECT l.code
          FROM languages AS l
          WHERE l.official = 'true'
        ) )
  WHERE c.region = 'Central America' AND e.year = 2015
ORDER BY c.name asc;

SELECT c.region, c.continent, AVG(p.fertility_rate) AS avg_fert_rate
  FROM countries AS c
    INNER JOIN populations AS p
      ON c.code = p.country_code
  WHERE p.year = 2015
GROUP BY c.region, c.continent
ORDER BY avg_fert_rate;

SELECT name, country_code, city_proper_pop, metroarea_pop,  
      city_proper_pop / metroarea_pop * 100 AS city_perc
  FROM cities
  WHERE name IN
    (SELECT capital
     FROM countries
     WHERE (continent = 'Europe'
        OR continent LIKE '%America'))
       AND metroarea_pop IS NOT NULL
ORDER BY city_perc desc
LIMIT 10;