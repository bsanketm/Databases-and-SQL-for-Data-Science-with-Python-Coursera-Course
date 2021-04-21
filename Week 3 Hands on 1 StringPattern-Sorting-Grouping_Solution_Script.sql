String Patterns
Q1 Retrieve all employees whose address is in Elgin,IL.
SELECT F_NAME , L_NAME
FROM EMPLOYEES
WHERE ADDRESS LIKE '%Elgin,IL%';

Q 2 Retrieve all employees who were born during the 1970’s.
SELECT F_NAME , L_NAME
FROM EMPLOYEES
WHERE B_DATE LIKE ‘197%';

Q3 Retrieve all employees in department 5 whose salary is between 60000 and 70000.
Soln:
SELECT *FROM EMPLOYEES
WHERE (SALARY BETWEEN 60000 AND 70000) AND DEP_ID = 5;

Sorting
Q4.Retrieve a list of employees ordered by department ID.
Soln
SELECT F_NAME, L_NAME, DEP_ID 
FROM EMPLOYEES
ORDER BY DEP_ID;

Q5.Retrieve a list of employees ordered in descending order by department ID and within each department ordered alphabetically in descending order by last name.
Soln
SELECT F_NAME, L_NAME, DEP_ID 
FROM EMPLOYEES
ORDER BY DEP_ID DESC, L_NAME DESC;

Q6. In Q6 use department name instead of department ID. Retrieve a list of employees ordered by department name, and within each department ordered alphabetically in descending order by last name.
Soln:
SELECT D.DEP_NAME , E.F_NAME, E.L_NAME
FROM EMPLOYEES as E, DEPARTMENTS as D
WHERE E.DEP_ID = D.DEPT_ID_DEP
ORDER BY D.DEP_NAME, E.L_NAME DESC;
“””In the SQL Query above, D and E are aliases for the table names. Once you define an alias like D in your query, you can simply write D.COLUMN_NAME rather than the full form DEPARTMENTS.COLUMN_NAME.”””

Grouping
Q7. For each department ID retrieve the number of employees in the department.
Soln:
SELECT DEP_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEP_ID;

Q8. For each department retrieve the number of employees in the department, and the average employee salary in the department..
Soln:
SELECT DEP_ID, COUNT(*), AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEP_ID;

Q9. Label the computed columns in the result set of SQL problem 8 (Above Problem ) as NUM_EMPLOYEES and
AVG_SALARY.
SOln:
SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
FROM EMPLOYEES
GROUP BY DEP_ID;

Q10 In SQL 9 (Above Problem ), order the result set by Average Salary..
Soln:
SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
FROM EMPLOYEES
GROUP BY DEP_ID
ORDER BY AVG_SALARY;





Q11In SQL problem 10 (Above Problem ), limit the result to departments with fewer than 4 employees.

Soln
SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
FROM EMPLOYEES
GROUP BY DEP_ID
HAVING count(*) < 4
ORDER BY AVG_SALARY;