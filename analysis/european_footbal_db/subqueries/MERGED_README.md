# Overview


Generate a list of matches where the total goals scored (for both teams in total) is more than 3 times the average for games in the matches_2013_2014 table, which includes all games played in the 2013/2014 season.

1.
    - Calculate triple the average home + away goals scored across all matches. This will become your subquery in the next step. Note that this column does not have an alias, so it will be called ?column? in your results.

2.
    - Select the date, home goals, and away goals in the main query.
    - Filter the main query for matches where the total goals scored exceed the value in the subquery.


Generate a list of teams that never played a game in their home city. Using a subquery, you will generate a list of unique hometeam_ID values from the unfiltered match table to exclude in the team table's team_api_ID column.

In addition to filtering using a single-value (scalar) subquery, you can create a list of values in a subquery to filter data based on a complex set of conditions. This type of subquery generates a one column reference list for the main query. As long as the values in your list match a column in your main query's table, you don't need to use a join -- even if the list is from a separate table.

1.
    - Create a subquery in the WHERE clause that retrieves all unique hometeam_ID values from the match table.
    - Select the team_long_name and team_short_name from the team table. Exclude all values from the subquery in the main query.

2.
    - Create a subquery in WHERE clause that retrieves all hometeam_ID values from match with a home_goal score greater than or equal to 8.
    - Select the team_long_name and team_short_name from the team table. Include all values from the subquery in the main query.


The match table in the European Soccer Database does not contain country or team names. You can get this information by joining it to the country table, and use this to aggregate information, such as the number of matches played in each country.

If you're interested in filtering data from one of these tables, you can also create a subquery from one of the tables, and then join it to an existing table in the database. A subquery in FROM is an effective way of answering detailed questions that requires filtering or transforming data before including it in your final results.

1. Your goal in this exercise is to generate a subquery using the match table, and then join that subquery to the country table to calculate information about matches with 10 or more goals in total!

    - Create the subquery to be used in the next step, which selects the country ID and match ID (id) from the match table.
    - Filter the query for matches with greater than or equal to 10 goals.

2.
    - Construct a subquery that selects only matches with 10 or more total goals.
    - Inner join the subquery onto country in the main query.
    - Select name from country and count the id column from match.


3.
    - Complete the subquery inside the FROM clause. Select the country name from the country table, along with the date, the home goal, the away goal, and the total goals columns from the match table.
    - Create a column in the subquery that adds home and away goals, called total_goals. This will be used to filter the main query.
    - Select the country, date, home goals, and away goals in the main query.
    - Filter the main query for games with 10 or more total goals.


Subqueries in SELECT statements generate a single value that allow you to pass an aggregate value down a data frame. This is useful for performing calculations on data within your database.

1.
    - In the subquery, select the average total goals by adding home_goal and away_goal.
    - Filter the results so that only the average of goals in the 2013/2014 season is calculated.
    - In the main query, select the average total goals by adding home_goal and away_goal. This calculates the average goals for each league.
    - Filter the results in the main query the same way you filtered the subquery. Group the query by the league name.

2.
    - Select the average goals scored in a match for each league in the main query.
    - Select the average goals scored in a match overall for the 2013/2014 season in the subquery.
    - Subtract the subquery from the average number of goals calculated for each league.
    - Filter the main query so that only games from the 2013/2014 season are included.


Correlated subqueries are subqueries that reference one or more columns in the main query. Correlated subqueries depend on information in the main query to run, and thus, cannot be executed on their own.

Correlated subqueries are evaluated in SQL once per row of data retrieved -- a process that takes a lot more computing power and time than a simple subquery.

1.
  - Select the country_id, date, home_goal, and away_goal columns in the main query.
  - Complete the AVG value in the subquery.
  - Complete the subquery column references, so that country_id is matched in the main and subquery.

Correlated subqueries are useful for matching data across multiple columns. In the previous exercise, you generated a list of matches with extremely high scores for each country. In this exercise, you're going to add an additional column for matching to answer the question -- what was the highest scoring match for each country, in each season?

1.
  - Select the country_id, date, home_goal, and away_goal columns in the main query.
  - Complete the subquery: Select the matches with the highest number of total goals.
  - Match the subquery to the main query using country_id and season.
  - Fill in the correct logical operator so that total goals equals the max goals recorded in the subquery.

Nested subqueries can be either simple or correlated.
Just like an unnested subquery, a nested subquery's components can be executed independently of the outer query, while a correlated subquery requires both the outer and inner subquery to run and produce results.
In this exercise, you will practice creating a nested subquery to examine the highest total number of goals in each season, overall, and during July across all seasons.

1.
  - Complete the main query to select the season and the max total goals in a match for each season. Name this max_goals.
  - Complete the first simple subquery to select the max total goals in a match across all seasons. Name this overall_max_goals.
  - Complete the nested subquery to select the maximum total goals in a match played in July across all seasons.
  - Select the maximum total goals in the outer subquery. Name this entire subquery july_max_goals.

# Details
SQL Query Explanations and Trade-Offs

This document provides explanations for various SQL queries, highlighting how each query works and discussing the trade-offs of each approach. The queries demonstrate different uses of subqueries in SQL, including scalar subqueries, subqueries with lists, subqueries in the FROM and SELECT clauses, correlated subqueries, and nested subqueries.

Filtering Using Scalar Subqueries

Query 1

SELECT
    3 * AVG(home_goal + away_goal)
FROM matches_2013_2014;

Explanation:

This query calculates three times the average total number of goals scored per match during the 2013/2014 season. It sums the home_goal and away_goal for each match to get the total goals, computes the average across all matches, and multiplies it by 3.

Trade-Offs:
	•	Performance: Since it performs an aggregate function over the entire table without any filters, it’s efficient for small to medium datasets. However, on very large tables, it could be slow.
	•	Simplicity: The query is straightforward and easy to understand, making it maintainable.
	•	Use Case Limitation: It only provides a single scalar value without context, which may limit its usefulness without additional data.

Query 2

SELECT
    date,
    home_goal,
    away_goal
FROM matches_2013_2014
WHERE (home_goal + away_goal) >
      (SELECT 3 * AVG(home_goal + away_goal)
       FROM matches_2013_2014);

Explanation:

This query retrieves the date and goals of matches where the total goals exceed three times the average total goals per match for the 2013/2014 season. The subquery calculates the threshold, and the main query filters matches based on this threshold.

Trade-Offs:
	•	Performance: The scalar subquery is computed once, making the query efficient.
	•	Clarity: Using a scalar subquery in the WHERE clause enhances readability.
	•	Scalability: Performance remains consistent even as data size grows, since the subquery is not correlated with the outer query.

Filtering Using a Subquery with a List

Query 1

SELECT
    team_long_name,
    team_short_name
FROM team
WHERE team_api_id NOT IN
      (SELECT DISTINCT hometeam_id FROM match);

Explanation:

This query selects teams that have never played a home match. It checks for team_api_id values that are not present in the hometeam_id column of the match table.

Trade-Offs:
	•	Performance: Using NOT IN with a subquery can be inefficient if the subquery returns a large list, as it may require scanning the entire list for each row.
	•	Alternative Approach: A LEFT JOIN with a NULL check or using NOT EXISTS could be more efficient.
	•	Simplicity: The query is simple and easy to understand.

Query 2

SELECT
    team_long_name,
    team_short_name
FROM team
WHERE team_api_id IN
      (SELECT hometeam_id
       FROM match
       WHERE home_goal >= 8);

Explanation:

This query retrieves teams that have scored 8 or more goals in a home match. It selects teams whose team_api_id is in the list of hometeam_id from matches where home_goal is at least 8.

Trade-Offs:
	•	Performance: Using IN with a subquery that returns a moderate number of rows is acceptable, but performance may degrade with larger lists.
	•	Readability: The query is clear and expresses the intent directly.
	•	Index Usage: Performance can be improved if indexes are present on the hometeam_id and home_goal columns.

Subqueries in the FROM Clause

Query 1

SELECT
    country_id,
    id
FROM match
WHERE (home_goal + away_goal) >= 10;

Explanation:

This query selects matches where the total goals scored are 10 or more, retrieving the country_id and id of those matches.

Trade-Offs:
	•	Performance: Efficient for filtering and retrieving specific columns.
	•	Data Context: Lacks contextual information like country names, which may be needed for more comprehensive analysis.

Query 2

SELECT
    name AS country_name,
    COUNT(sub.id) AS matches
FROM country AS c
INNER JOIN (
    SELECT country_id, id
    FROM match
    WHERE (home_goal + away_goal) >= 10
) AS sub ON c.id = sub.country_id
GROUP BY country_name;

Explanation:

This query counts the number of high-scoring matches (total goals ≥ 10) per country. The subquery selects relevant matches, and the outer query joins this data with the country table to get country names and aggregate the counts.

Trade-Offs:
	•	Performance: The subquery reduces the dataset before joining, which can be efficient.
	•	Readability: Using subqueries in the FROM clause can make the query more organized.
	•	Complexity: Slightly more complex due to nesting but provides better context.

Query 3

SELECT
    country,
    date,
    home_goal,
    away_goal
FROM (
    SELECT
        c.name AS country,
        m.date,
        m.home_goal,
        m.away_goal,
        (m.home_goal + m.away_goal) AS total_goals
    FROM match AS m
    LEFT JOIN country AS c ON m.country_id = c.id
) AS subq
WHERE total_goals >= 10;

Explanation:

This query retrieves details of high-scoring matches (total goals ≥ 10), including the country name, date, and goals. The subquery joins the match and country tables and calculates total_goals, which is then used in the outer query for filtering.

Trade-Offs:
	•	Performance: The subquery processes all records before filtering, which may impact performance on large datasets.
	•	Readability: Improves organization by separating the data preparation and filtering steps.
	•	Flexibility: Easily extendable if additional calculations or columns are needed.

Subqueries in the SELECT Clause

Query 1

SELECT
    l.name AS league,
    ROUND(AVG(m.home_goal + m.away_goal), 2) AS avg_goals,
    (SELECT ROUND(AVG(home_goal + away_goal), 2)
     FROM match
     WHERE season = '2013/2014') AS overall_avg
FROM league AS l
LEFT JOIN match AS m ON l.country_id = m.country_id
WHERE m.season = '2013/2014'
GROUP BY league;

Explanation:

This query calculates the average goals per match for each league during the 2013/2014 season and includes the overall average across all leagues. The subquery in the SELECT clause computes the overall average.

Trade-Offs:
	•	Performance: The subquery is executed for each row unless the database optimizes it, which could impact performance.
	•	Readability: Including subqueries in the SELECT clause may reduce clarity.
	•	Optimization: Modern databases may cache the subquery result, mitigating performance issues.

Query 2

SELECT
    l.name AS league,
    ROUND(AVG(m.home_goal + m.away_goal), 2) AS avg_goals,
    ROUND(AVG(m.home_goal + m.away_goal) -
        (SELECT AVG(home_goal + away_goal)
         FROM match
         WHERE season = '2013/2014'), 2) AS diff
FROM league AS l
LEFT JOIN match AS m ON l.country_id = m.country_id
WHERE m.season = '2013/2014'
GROUP BY l.name;

Explanation:

This query calculates the difference between the average goals per match for each league and the overall average for the 2013/2014 season. The subquery computes the overall average, and the difference is calculated in the SELECT clause.

Trade-Offs:
	•	Performance: Similar to the previous query, potential performance issues if the subquery isn’t optimized.
	•	Readability: Calculating the difference directly in the SELECT clause keeps related computations together.
	•	Data Insight: Provides immediate insights into how each league compares to the overall average.

Subqueries Everywhere

Query 1

SELECT
    m.stage,
    ROUND(AVG(m.home_goal + m.away_goal), 2) AS avg_goals,
    ROUND((SELECT AVG(home_goal + away_goal)
           FROM match
           WHERE season = '2012/2013'), 2) AS overall
FROM match AS m
WHERE season = '2012/2013'
GROUP BY stage;

Explanation:

This query calculates the average goals per match for each stage in the 2012/2013 season and includes the overall average. The subquery in the SELECT clause computes the overall average goals for the season.

Trade-Offs:
	•	Performance: The subquery may be executed multiple times, affecting performance unless optimized.
	•	Readability: Including the overall average directly in the results enhances the usefulness of the data.
	•	Maintenance: Hardcoding the season in multiple places can lead to errors; using parameters or variables might be better.

Query 2

SELECT
    -- Select the stage and average goals from the subquery
    stage,
    ROUND(s.avg_goals, 2) AS avg_goals
FROM
    -- Select the stage and average goals in 2012/2013
    (SELECT
         stage,
         AVG(home_goal + away_goal) AS avg_goals
     FROM match
     WHERE season = '2012/2013'
     GROUP BY stage) AS s
WHERE
    -- Filter the main query using the subquery
    s.avg_goals > (SELECT AVG(home_goal + away_goal)
                   FROM match WHERE season = '2012/2013');

Explanation:

This query selects stages where the average goals per match exceed the overall average for the 2012/2013 season. The main query operates on a subquery that computes average goals per stage.

Trade-Offs:
	•	Performance: Efficient as it reduces data early through subqueries.
	•	Readability: Clear separation of data computation and filtering logic.
	•	Complexity: Slightly more complex due to multiple layers but improves data accuracy.

Query 3

SELECT
    s.stage,
    ROUND(s.avg_goals, 2) AS avg_goal,
    (SELECT AVG(home_goal + away_goal) FROM match WHERE season = '2012/2013') AS overall_avg
FROM
    (SELECT
         stage,
         AVG(home_goal + away_goal) AS avg_goals
     FROM match
     WHERE season = '2012/2013'
     GROUP BY stage) AS s
WHERE
    s.avg_goals > (SELECT AVG(home_goal + away_goal)
                   FROM match WHERE season = '2012/2013');

Explanation:

This query extends the previous one by including the overall average goals per match in the result set. It provides both the stage-specific average and the overall average for comparison.

Trade-Offs:
	•	Performance: Similar considerations as before; subqueries may impact performance if not optimized.
	•	Data Richness: Offers more comprehensive insights by including additional data.
	•	Redundancy: The overall average is calculated twice; assigning it to a variable or CTE could be more efficient.

Basic Correlated Subqueries

Query 1

SELECT
    main.country_id,
    main.date,
    main.home_goal,
    main.away_goal
FROM match AS main
WHERE
    (home_goal + away_goal) >
        (SELECT AVG((sub.home_goal + sub.away_goal) * 3)
         FROM match AS sub
         WHERE main.country_id = sub.country_id);

Explanation:

This query selects matches where the total goals exceed three times the average total goals for that country. The subquery is correlated with the outer query through main.country_id = sub.country_id.

Trade-Offs:
	•	Performance: Correlated subqueries can be slow because the subquery is executed for each row of the outer query.
	•	Specificity: Provides country-specific thresholds, making the data more relevant.
	•	Optimization: Can be improved by rewriting using joins or aggregations.

Correlated Subquery with Multiple Conditions

Query 1

SELECT
    main.country_id,
    main.date,
    main.home_goal,
    main.away_goal
FROM match AS main
WHERE
    (home_goal + away_goal) =
        (SELECT MAX(sub.home_goal + sub.away_goal)
         FROM match AS sub
         WHERE main.country_id = sub.country_id
               AND main.season = sub.season);

Explanation:

This query retrieves matches that have the highest total goals within each country and season. The correlated subquery finds the maximum total goals for the specific country and season.

Trade-Offs:
	•	Performance: Potentially slow due to the correlated subquery running for each row.
	•	Precision: Offers highly specific results, useful for identifying peak performances.
	•	Alternative Approach: Using window functions might improve performance and readability.

Nested Subqueries

Query 1

SELECT
    season,
    MAX(home_goal + away_goal) AS max_goals,
    (SELECT MAX(home_goal + away_goal) FROM match) AS overall_max_goals,
    (SELECT MAX(home_goal + away_goal)
     FROM match
     WHERE id IN (
           SELECT id FROM match WHERE EXTRACT(MONTH FROM date) = 07)) AS july_max_goals
FROM match
GROUP BY season;

Explanation:

This query finds the maximum total goals per season, the overall maximum, and the maximum goals in matches played in July. It uses nested subqueries to compute the overall and July-specific maxima.

Trade-Offs:
	•	Performance: Multiple subqueries can slow down execution, especially if not optimized.
	•	Complexity: The nesting can make the query hard to read and maintain.
	•	Function Use: EXTRACT(MONTH FROM date) may prevent index usage, affecting performance.

Nesting a Subquery in FROM

Query 1

SELECT
    c.name AS country,
    AVG(outer_s.matches) AS avg_seasonal_high_scores
FROM country AS c
LEFT JOIN (
    SELECT country_id, season,
           COUNT(id) AS matches
    FROM (
        SELECT country_id, season, id
        FROM match
        WHERE home_goal >= 5 OR away_goal >= 5
    ) AS inner_s
    GROUP BY country_id, season
) AS outer_s ON c.id = outer_s.country_id
GROUP BY country;

Explanation:

This query calculates the average number of high-scoring matches (where either team scored at least 5 goals) per season for each country. It uses nested subqueries to first filter matches, then count them per country and season, and finally compute the average per country.

Trade-Offs:
	•	Performance: Multiple levels of subqueries can impact performance but help in breaking down complex logic.
	•	Readability: Nesting subqueries in the FROM clause organizes the query but can make it harder to follow.
	•	Flexibility: Modular approach allows for easier modifications to individual components.

Conclusion

These queries demonstrate various techniques for utilizing subqueries in SQL to perform complex data retrieval and analysis tasks. Each method has its own advantages and trade-offs in terms of performance, readability, and maintainability. Understanding these trade-offs is essential for writing efficient and effective SQL queries tailored to specific use cases.
