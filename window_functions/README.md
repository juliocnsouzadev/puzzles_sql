## Popular Baby Names

Given table `baby_names`:
```sql
name        gender      babies    
----------  ----------  ----------
Aaban       M           12        
Aadan       M           5         
Aaden       M           1142      
Aadhav      M           6         
Aadhya      F           442       
Aadi        M           108       
Aadit       M           6         
Aaditya     M           19        
Aadya       F           286       
Aadyn       M           30 
...
```

1. Write a query with a window function that will return a table with the following columns:
- gender
- name
- babies (the number of babies given a particular name)
- popularity (this is a column you'll need to create using a window function)

    The popularity column should include rankings for both female names and male names. The most popular female name should have a popularity of 1, the second should have a popularity of 2, and so on. The most popular male name should have a popularity of 1, and so on.

2. The second step is to write a query around the query with the window function, making the inner query a subquery.

    Subqueries are useful if a problem takes multiple steps to complete. In this case, first, we wrote a query to rank the popularity of the baby names. Next, we need to turn that query into a subquery and filter the data on just the five most popular names for each gender.

    Using the query we wrote in the last step, turn the query into a subquery and filter only the top five most popular names for both girls and boys.