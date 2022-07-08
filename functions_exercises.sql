USE employees;
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

SELECT CONCAT(first_name, ' ', last_name) as `Name`
FROM employees
WHERE last_name LIKE 'E%'
ORDER BY emp_no DESC;

SELECT *
FROM employees
WHERE last_name LIKE '%q%';



SELECT *
FROM employees
WHERE gender = 'M'
  AND (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya');


SELECT *
FROM employees
WHERE last_name LIKE '%E'
   OR last_name LIKE 'E%';
SELECT *
FROM employees
WHERE last_name LIKE '%E'
  AND last_name LIKE 'E%';

SELECT *
FROM employees
WHERE last_name LIKE '%q%'
  AND last_name NOT LIKE '%qu%';

SELECT *
FROM employees
WHERE DAY(birth_date) = 25
  AND MONTH(birth_date) = 12;

SELECT *
FROM employees
WHERE YEAR(hire_date) BETWEEN 1990 AND 2000
  AND MONTH(birth_date) = 12
  AND DAY(birth_date) = 25;
SELECT *
FROM employees
WHERE YEAR(hire_date) BETWEEN 1990 AND 2000
  AND MONTH(birth_date) = 12
  AND DAY(birth_date) = 25
ORDER BY hire_date DESC, birth_date DESC;

SELECT first_name, hire_date, DATEDIFF(curdate(), hire_date) AS `Length of Employment(days)`
FROM employees;