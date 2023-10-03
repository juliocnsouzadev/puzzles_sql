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