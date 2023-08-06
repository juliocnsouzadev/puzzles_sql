## Scenario
In this scenario, we have a database table named `STATION` that contains information about cities. The `STATION` table has the following schema:

- `ID`: The unique identifier for each city.
- `CITY`: The name of the city (VARCHAR).
- `COUNTRYCODE`: The country code of the city (VARCHAR).
- `DISTRICT`: The district where the city is located (VARCHAR).
- `POPULATION`: The population of the city (NUMBER).

We need to retrieve a list of city names from the `STATION` table that either do not start with vowels or do not end with vowels. The result should not contain any duplicate city names.

## Query
The SQL query to achieve the desired result is as follows:

```sql
/* Query the list of CITY names from STATION that either do not start with vowels 
   or do not end with vowels. Your result cannot contain duplicates. */

SELECT DISTINCT CITY FROM STATION
WHERE SUBSTRING(CITY, 1, 1) NOT IN ('a','e','i','o','u')
OR SUBSTRING(CITY, LENGTH(CITY), 1) NOT IN ('a','e','i','o','u');
```

## Query Explanation
Let's break down the query step by step:

1. `SELECT DISTINCT CITY`: This part of the query selects the `CITY` column from the `STATION` table and applies the `DISTINCT` keyword to remove any duplicate city names from the result set.

2. `FROM STATION`: This specifies that we are querying the `STATION` table.

3. `WHERE SUBSTRING(CITY, 1, 1) NOT IN ('a','e','i','o','u') OR SUBSTRING(CITY, LENGTH(CITY), 1) NOT IN ('a','e','i','o','u')`: The `WHERE` clause filters the rows based on the condition that either the first character of the city name (obtained using `SUBSTRING`) must not be one of the vowels 'a', 'e', 'i', 'o', or 'u', or the last character of the city name must not be one of the vowels 'a', 'e', 'i', 'o', or 'u'.

The final result of the query will be a list of distinct city names from the `STATION` table that either do not start with vowels or do not end with vowels.

Make sure to have the `STATION` table available in the database for the query to execute successfully.

---

Note: The above explanation assumes that you have access to the database containing the `STATION` table with appropriate permissions to execute the query.