-- Filtering using scalar subqueries

-- 1
SELECT 
	3 * AVG(home_goal + away_goal)
FROM matches_2013_2014;

-- 2
SELECT 
	-- Select the date, home goals, and away goals scored
    date,
	home_goal,
	away_goal
FROM  matches_2013_2014
-- Filter for matches where total goals exceeds 3x the average
WHERE (home_goal + away_goal) > 
       (SELECT 3 * AVG(home_goal + away_goal)
        FROM matches_2013_2014); 


-- Filtering using a subquery with a list

-- 1
SELECT
	team_long_name,
	team_short_name
FROM team
WHERE team_api_id NOT IN
     (SELECT DISTINCT hometeam_id  FROM match);

-- 2
SELECT
	team_long_name,
	team_short_name
FROM team
WHERE team_api_id IN
	  (SELECT hometeam_id 
       FROM match
       WHERE home_goal >= 8);

-- Subqueries in From clause
-- 1
SELECT 
	country_id, 
    id 
FROM match
WHERE (home_goal + away_goal) >= 10;

-- 2
SELECT
	name AS country_name,
    COUNT(sub.id) AS matches
FROM country AS c
INNER JOIN (SELECT country_id, id 
           FROM match
           WHERE (home_goal + away_goal) >= 10) AS sub
ON c.id = sub.country_id
GROUP BY country_name;

-- 2
SELECT
	country,
    date,
    home_goal,
    away_goal
FROM 
	(SELECT c.name AS country, 
     	    m.date, 
     		m.home_goal, 
     		m.away_goal,
           (m.home_goal + m.away_goal) AS total_goals
    FROM match AS m
    LEFT JOIN country AS c
    ON m.country_id = c.id) AS subq
WHERE total_goals >= 10;

-- Subqueries in Select clause
-- 1
SELECT 
	l.name AS league,
    ROUND(AVG(m.home_goal + m.away_goal), 2) AS avg_goals,
    (SELECT ROUND(AVG(home_goal + away_goal), 2) 
     FROM match
     WHERE season = '2013/2014') AS overall_avg
FROM league AS l
LEFT JOIN match AS m
ON l.country_id = m.country_id
WHERE m.season = '2013/2014'
GROUP BY league;

-- 2
SELECT
	l.name AS league,
	ROUND(AVG(m.home_goal + m.away_goal),2) AS avg_goals,
	ROUND(AVG(m.home_goal + m.away_goal) - 
		(SELECT AVG(home_goal + away_goal)
		 FROM match 
         WHERE season = '2013/2014'),2) AS diff
FROM league AS l
LEFT JOIN match AS m
ON l.country_id = m.country_id
WHERE m.season = '2013/2014'
GROUP BY l.name;

-- subqueries everywhere
-- 1
SELECT 
	m.stage,
    ROUND(AVG(m.home_goal + m.away_goal),2) AS avg_goals,
    ROUND((SELECT AVG(home_goal + away_goal) 
           FROM match 
           WHERE season = '2012/2013'),2) AS overall
FROM match AS m
WHERE season = '2012/2013'
GROUP BY stage;