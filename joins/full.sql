SELECT name AS country, code, region, basic_unit
FROM countries
  FULL JOIN currencies
    USING (code)
WHERE region = 'North America' OR region IS NULL
ORDER BY region;