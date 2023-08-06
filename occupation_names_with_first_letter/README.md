## Scenario
Suppose we have a database table called OCCUPATIONS that contains information about people's occupations. The table has the following columns:

- NAME: the name of the person
- OCCUPATION: the person's occupation
We want to generate two result sets from this table:

1. An alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
2. A list of the total number of people in each occupation, sorted by the number of people in each occupation in descending order.

## SQL Query
Here's the SQL query that generates the first result set:
```
SELECT CONCAT(NAME,"(",SUBSTRING(OCCUPATION,1,1),")") AS O FROM OCCUPATIONS ORDER BY NAME;
```
This query selects the NAME and OCCUPATION columns from the OCCUPATIONS table, concatenates the NAME column with the first letter of the OCCUPATION column enclosed in parentheses, and orders the result set by the NAME column in alphabetical order.

Note that the CONCAT function is used to concatenate the NAME and OCCUPATION columns, and the SUBSTRING function is used to extract the first letter of the OCCUPATION column.