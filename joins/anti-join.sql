-- Select statement
select count(name)
  -- From countries
  from countries
-- Where continent is Oceania
Where continent = 'Oceania';

-- Select fields (with aliases)
SELECT c1.code, c1.name, c2.basic_unit as currency
  -- From countries (alias as c1)
  FROM countries as c1
  	-- Join with currencies (alias as c2)
  	INNER JOIN currencies as c2
    -- Match on code
    ON c1.code = c2.code
-- Where continent is Oceania
WHERE c1.continent = 'Oceania';

-- Select fields
SELECT code, name
  -- From Countries
  FROM countries
  -- Where continent is Oceania
  WHERE continent = 'Oceania'
  	-- And code not in
  	AND code NOT IN
  	-- Subquery
  	(SELECT code
  	 FROM currencies);


SELECT name
  FROM cities AS c1
  WHERE c1.country_code IN
(
    SELECT e.code
    FROM economies AS e
    UNION
    SELECT distinct c2.code
    FROM currencies AS c2
    EXCEPT
    SELECT p.country_code
    FROM populations AS p
);