/* Generate the following two result sets:
   Query the number of occurrences of each occupation in OCCUPATIONS.
   Sort the occurrences in ascending order, and output them in the following format:

   There are a total of [occupation_count] [occupation]s.
   where [occupation_count] is the number of occurrences of an occupation
   in OCCUPATIONS and [occupation] is the lowercase occupation name.
   If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

   Note: There will be at least two entries in the table for each type of occupation. */

SELECT SUBQUERY.RESULT FROM (
    SELECT OCCUPATION, COUNT(OCCUPATION) AS COUNT, CONCAT("There are a total of ", COUNT(OCCUPATION)," ",LOWER(OCCUPATION),"s.") AS RESULT FROM OCCUPATIONS GROUP BY OCCUPATION ORDER BY COUNT
) AS SUBQUERY;
