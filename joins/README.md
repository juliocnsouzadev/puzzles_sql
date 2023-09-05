# INNER
An inner join returns only the rows that have matching values in both tables being joined. In other words, it returns the intersection of the two tables.
## [Example](./into.sql)

# LEFT
A left join returns all the rows from the left table and the matching rows from the right table. If there is no match in the right table, the result will contain NULL values for the right table's columns.
## [Example](./left.sql)

# RIGHT
A right join is similar to a left join, but it returns all the rows from the right table and the matching rows from the left table. If there is no match in the left table, the result will contain NULL values for the left table's columns.
## [Example](./right.sql)

# USING INTO

The `INTO` clause in SQL is used to create a new table based on the result set of a `SELECT` statement. When the `INTO` clause is used, the result set of the `SELECT` statement is inserted into a new table with the specified name.

For example, in the code you provided, the `INTO` clause is used to create two new tables: `pop_plus` and `cp_plus`. The `pop_plus` table is created by selecting the `country_code`, `size`, and `popsize_group` columns from the `populations` table, and inserting the result set into a new table called `pop_plus`. Similarly, the `cp_plus` table is created by joining the `countries_plus` and `pop_plus` tables, and inserting the result set into a new table called `cp_plus`.

The `INTO` clause is useful when you want to create a new table based on the result set of a `SELECT` statement, without having to manually create the table and insert the data. It can save time and reduce errors, especially when dealing with large datasets.

It's worth noting that the `INTO` clause is not supported by all database systems, and the syntax may vary depending on the system you are using. In some systems, you may need to use a different syntax, such as `CREATE TABLE AS SELECT` or `SELECT ... INTO OUTFILE`.

## [Example](./into.sql)
