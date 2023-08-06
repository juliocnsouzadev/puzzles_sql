## Scenario
In this scenario, we have a database table named `STUDENTS` that contains information about students. The `STUDENTS` table has the following schema:

- `ID`: The unique identifier for each student.
- `NAME`: The name of the student (VARCHAR).
- `MARKS`: The marks obtained by the student.

We need to retrieve the names of students from the `STUDENTS` table who scored higher than 75 marks. The result should be ordered based on the last three characters of each student's name. If two or more students have names ending in the same last three characters, they should be further sorted by ascending `ID`.

## Query
The SQL query to achieve the desired result is as follows:

```sql
/* Query the Name of any student in STUDENTS who scored higher than 75 Marks.
   Order your output by the last three characters of each name.
   If two or more students both have names ending in the same
   last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID. */

SELECT NAME FROM STUDENTS 
WHERE MARKS > 75 
ORDER BY SUBSTRING(NAME, (LENGTH(NAME) - 2), 3), ID;
```

## Query Explanation
Let's break down the query step by step:

1. `SELECT NAME`: This part of the query selects the `NAME` column from the `STUDENTS` table, which contains the names of the students.

2. `FROM STUDENTS`: This specifies that we are querying the `STUDENTS` table.

3. `WHERE MARKS > 75`: The `WHERE` clause filters the rows and includes only those students who scored higher than 75 marks.

4. `ORDER BY SUBSTRING(NAME, (LENGTH(NAME) - 2), 3), ID`: The `ORDER BY` clause sorts the result set based on two criteria. First, it orders the students based on the last three characters of their name, obtained using the `SUBSTRING` function. The expression `SUBSTRING(NAME, (LENGTH(NAME) - 2), 3)` extracts the last three characters of each student's name. Second, if two or more students have names ending in the same last three characters, the `ORDER BY` clause further sorts them by ascending `ID`.

The final result of the query will be the names of students from the `STUDENTS` table who scored higher than 75 marks, ordered by the last three characters of their name. If multiple students have names ending in the same last three characters, they will be sorted by ascending `ID`.

Make sure to have the `STUDENTS` table available in the database for the query to execute successfully.

---

Note: The above explanation assumes that you have access to the database containing the `STUDENTS` table with appropriate permissions to execute the query.