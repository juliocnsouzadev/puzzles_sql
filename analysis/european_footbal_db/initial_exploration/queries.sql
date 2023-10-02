SELECT team_long_name,team_api_id
FROM Team
WHERE team_long_name IN ('FC Schalke 04', 'FC Bayern Munich');

SELECT CASE
    WHEN home_team_api_id = 10189 THEN 'FC Schalke 04'
    WHEN home_team_api_id = 9823 THEN 'FC Bayern Munich'
    ELSE 'Other' END AS home_team,
    COUNT(id) AS total_matches
FROM Match
GROUP BY home_team

SELECT  
    date,
    CASE 
        WHEN home_team_goal > away_team_goal THEN 'Home win!'
        WHEN home_team_goal < away_team_goal THEN 'Home loss :(' 
        ELSE 'Tie' 
    END AS outcome,
    team_long_name AS team_name 
FROM Match 
INNER JOIN Team
ON team_api_id = home_team_api_id
WHERE team_long_name LIKE '%Barcelona%';

SELECT 
	date,
	CASE 
                WHEN home_team_api_id = 8634 THEN 'FC Barcelona' 
                ELSE 'Real Madrid CF' 
        END as home,
	CASE 
                WHEN away_team_api_id = 8634 THEN 'FC Barcelona' 
                ELSE 'Real Madrid CF' 
        END as away,
	CASE 
                WHEN home_team_goal > away_team_goal AND home_team_api_id = 8634 THEN 'Barcelona win!'
                WHEN home_team_goal > away_team_goal AND home_team_api_id = 8633 THEN 'Real Madrid win!'
                WHEN home_team_goal < away_team_goal AND away_team_api_id = 8634 THEN 'Barcelona win!'
                WHEN home_team_goal < away_team_goal AND away_team_api_id = 8633 THEN 'Real Madrid win!'
                ELSE 'Tie!' 
        END AS outcome
FROM Match
WHERE (away_team_api_id = 8634 OR home_team_api_id = 8634)
      AND (away_team_api_id = 8633 OR home_team_api_id = 8633);


SELECT 
	season,
    date,
	home_goal,
	away_goal
FROM matches_italy
WHERE 
	CASE 
		WHEN hometeam_id = 9857 AND home_goal > away_goal THEN 'Bologna Win'
		WHEN awayteam_id = 9857 AND away_goal > home_goal THEN 'Bologna Win' 
		END IS NOT NULL;