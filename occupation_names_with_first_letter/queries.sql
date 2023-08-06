/* Generate the following two result sets:
   Query an alphabetically ordered list of all names in 
   OCCUPATIONS, immediately followed by the first letter of 
   each profession as a parenthetical (i.e.: enclosed in parentheses).
   For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S). */

SELECT CONCAT(NAME,"(",SUBSTRING(OCCUPATION,1,1),")") AS O FROM OCCUPATIONS ORDER BY NAME;
