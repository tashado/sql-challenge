-- 1. List the employee number, last name, first name, sex and salary of each employee
SELECT employees.emp_no, 
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986
select first_name,
	last_name,
	hire_date
from employees
where hire_date >= '1986-01-01'
	and hire_date < '1987-01-01';
	
-- 3. List the manager of each department along with the department number, department name, employee number, last name and first name.
select dept_manager.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name
From dept_manager
Inner join departments On
dept_manager.dept_no = departments.dept_no
Inner join employees On
dept_manager.emp_no = employees.emp_no;

-- 4. List the department number for each employee along with employee no., last name, first name, and department name.
select dept_emp.emp_no,
	dept_emp.dept_no,
	departments.dept_name,
	employees.last_name,
	employees.first_name
From dept_emp
Inner join employees On
dept_emp.emp_no = employees.emp_no
Inner join departments On
dept_emp.dept_no = departments.dept_no;

-- 5. List the first name, last name and sex of each employee whose first name is Herculus and whose last name begins with the letter B.
select first_name,
	last_name,
	sex
from employees
where first_name = 'Hercules'
	and substring(last_name, 1, 1) = 'B';
	
-- 6. List each employee in the Sales department, including their employee number, last name and first name
select dept_emp.emp_no,
	dept_emp.dept_no,
	employees.last_name,
	employees.first_name
from dept_emp
Inner join employees on
dept_emp.emp_no = employees.emp_no
Where dept_no = 'd007';

-- 7. List each employee in the Sales and Development departments, including employee no., last name, first name, and department name
CREATE VIEW sales_development_emp AS
select dept_emp.emp_no,
	dept_emp.dept_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
from dept_emp
Inner join employees on
dept_emp.emp_no = employees.emp_no
Inner join departments on
dept_emp.dept_no = departments.dept_no;

select * from sales_development_emp
Where dept_no IN ('d007', 'd005');

-- 8. List the frequency counts, in descending order, of all the employee last names
SELECT employees.last_name, COUNT(employees.last_name) AS "last_name count"
from employees
GROUP BY employees.last_name
ORDER BY "last_name count" DESC;