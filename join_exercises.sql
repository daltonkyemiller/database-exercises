USE employees;

# Current Dept Managers
SELECT departments.dept_name                                  AS Department,
       CONCAT(employees.first_name, ' ', employees.last_name) AS `Manager Name`
FROM employees
         JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
         JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE dept_manager.to_date = '9999-01-01';

# Current Female Dept Managers
SELECT departments.dept_name                                  AS Department,
       CONCAT(employees.first_name, ' ', employees.last_name) AS `Manager Name`
FROM employees
         JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
         JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE dept_manager.to_date = '9999-01-01'
  AND employees.gender = 'F';


SELECT titles.title AS `Title`, COUNT(*) AS `COUNT`
FROM titles
         JOIN employees ON titles.emp_no = employees.emp_no
         JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
         JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_emp.to_date = '9999-01-01'
  AND departments.dept_name = 'Customer Service'
  AND titles.to_date = '9999-01-01'
GROUP BY titles.title
ORDER BY titles.title;


SELECT departments.dept_name                                  AS Department,
       CONCAT(employees.first_name, ' ', employees.last_name) AS `Manager Name`,
       salaries.salary                                        AS `Salary`
FROM employees
         JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
         JOIN departments ON departments.dept_no = dept_manager.dept_no
         JOIN salaries ON salaries.emp_no = employees.emp_no
WHERE dept_manager.to_date = curdate()
  AND salaries.to_date >= curdate()
ORDER BY departments.dept_name;


# Bonus
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS `Employee Name`,
       departments.dept_name                                  AS Department,
       CONCAT(managers.first_name, ' ', managers.last_name)   AS `Manager Name`
FROM employees
         JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
         JOIN departments ON departments.dept_no = dept_emp.dept_no
         JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
         JOIN employees as managers ON managers.emp_no = dept_manager.emp_no
WHERE dept_emp.to_date >= curdate()
  AND dept_manager.to_date >= curdate()
ORDER BY departments.dept_name;
