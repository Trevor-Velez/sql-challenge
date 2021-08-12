-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
	
select
	emp.emp_no
	, emp.last_name
	, emp.first_name
	, emp.sex
	, sal.salary
from 
	public."Employees" as emp
join 
	public."Salaries" as sal
		on
			emp.emp_no = sal.emp_no
			
-- 2. List first name, last name, and hire date for employees who were hired in 1986.

select
	first_name
	, last_name
	, hire_date
from
	public."Employees"
where
	hire_date LIKE '%1986'
	
-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select
	dep.dept_no
	, dep.dept_name
	, man.emp_no
	, emp.last_name
	, emp.first_name
from 
	public."Departments" as dep
join
	public."Dept_manager" as man
		on dep.dept_no = man.dept_no
join
	public."Employees" as emp
		on man.emp_no = emp.emp_no
		
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select
	emp.emp_no
	, emp.last_name
	, emp.first_name
	, dep.dept_name
from 
	public."Departments" as dep
join
	public."Dept_Emp" as depemp
		on dep.dept_no = depemp.dept_no
join
	public."Employees" as emp
		on depemp.emp_no = emp.emp_no


-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select
	first_name
	, last_name
	, sex
from
	public."Employees"
where
	first_name = 'Hercules' AND last_name LIKE 'B%'


-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select
	emp.emp_no
	, emp.last_name
	, emp.first_name
	, dep.dept_name
from 
	public."Departments" as dep
join 
	public."Dept_Emp" as depemp
		on dep.dept_no = depemp.dept_no
join
	public."Employees" as emp
		on depemp.emp_no = emp.emp_no
where
	dept_name = 'Sales'

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select
	emp.emp_no
	, emp.last_name
	, emp.first_name
	, dep.dept_name
from 
	public."Departments" as dep
join 
	public."Dept_Emp" as depemp
		on dep.dept_no = depemp.dept_no
join
	public."Employees" as emp
		on depemp.emp_no = emp.emp_no
where
	dept_name = 'Sales' OR dept_name = 'Development'
	
	
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select
	last_name
	, count(last_name) as "Frequency_Count"
from
	public."Employees"
GROUP BY
	last_name
ORDER BY
	2 DESC


-- Epilogue
select 
	*
from
	public."Employees"
where
	emp_no = 499942
	
-- For the Bonus

select
	title.title
	, round(avg(sal.salary),2) as "Avg_salary"
from 
	public."Salaries" as sal
join
	public."Employees" as emp
		on sal.emp_no = emp.emp_no
join
	public."Titles" as title
		on emp.emp_title_id = title.title_id
GROUP BY
	title.title
ORDER BY
	2 DESC;
		
