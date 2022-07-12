USE employees;

SELECT *
FROM employees
WHERE hire_date
          IN (SELECT hire_date FROM employees WHERE emp_no = '101010');

SELECT titles.title
FROM titles
WHERE emp_no IN
      (SELECT emp_no FROM employees WHERE first_name = 'Aamod');


SELECT employees.first_name, employees.last_name
FROM employees
WHERE employees.emp_no IN (SELECT emp_no
                           FROM dept_manager
                           WHERE gender = 'F'
                             AND to_date >= curdate());

