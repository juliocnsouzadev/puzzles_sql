### [File with Queries](queries.sql)

## Filtering using scalar subqueries

Generate a list of matches where the total goals scored (for both teams in total) is more than 3 times the average for games in the matches_2013_2014 table, which includes all games played in the 2013/2014 season.

1. 
    - Calculate triple the average home + away goals scored across all matches. This will become your subquery in the next step. Note that this column does not have an alias, so it will be called ?column? in your results.

2. 
    - Select the date, home goals, and away goals in the main query.
    - Filter the main query for matches where the total goals scored exceed the value in the subquery.

## Filtering using a subquery with a list

Generate a list of teams that never played a game in their home city. Using a subquery, you will generate a list of unique hometeam_ID values from the unfiltered match table to exclude in the team table's team_api_ID column.

In addition to filtering using a single-value (scalar) subquery, you can create a list of values in a subquery to filter data based on a complex set of conditions. This type of subquery generates a one column reference list for the main query. As long as the values in your list match a column in your main query's table, you don't need to use a join -- even if the list is from a separate table.

1. 
    - Create a subquery in the WHERE clause that retrieves all unique hometeam_ID values from the match table.
    - Select the team_long_name and team_short_name from the team table. Exclude all values from the subquery in the main query.

2. 
    - Create a subquery in WHERE clause that retrieves all hometeam_ID values from match with a home_goal score greater than or equal to 8.
    - Select the team_long_name and team_short_name from the team table. Include all values from the subquery in the main query.

##  Subqueries in From clause

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

    
## Subqueries in Select clause
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

## Add a subquery in SELECT
