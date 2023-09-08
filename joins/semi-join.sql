-- Query from step 1
SELECT code
  FROM countries
WHERE region = 'Middle East';

-- step 2
SELECT DISTINCT name
  FROM languages
ORDER BY name;

-- semi-join
SELECT DISTINCT name
  FROM languages
WHERE code IN
  (SELECT code
   FROM countries
   WHERE region = 'Middle East')
ORDER BY name;