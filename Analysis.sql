--Data Analysis on loaded data - SQL Challenge Submission File

--List the employee number, last name, first name, sex, and salary of each employee.

select e.emp_no as "Employee number",
       e.last_name as "last name",
	   e.first_name as "first name",
	   e.sex ,
	   s.salary
from employees as e
join salaries as s on 
e.emp_no = s.emp_no;


--List the first name, last name, and hire date for the employees who were hired in 1986.
select e.first_name as "first name",
       e.last_name as "last name",
	   e.hire_date
from employees as e
where EXTRACT(YEAR from e.hire_date) = '1986';


--List the manager of each department along with their department number, department name, employee number, last name, and first name.

select dm.emp_no as "Manager_of_dept number",
       dm.dept_no as "Department number",
       d.dept_name as "Department name",
	   dm.emp_no as "Employee number",
	   e.last_name as "Last Name",
	   e.first_name as "First Name"
from dept_manager as dm
join department as d on dm.dept_no= d.dept_no
join employees as e on dm.emp_no = e.emp_no;


select dm.emp_no as "Manager_of_dept number",
       dm.dept_no as "Department number",
       d.dept_name as "Department name",
	   dm.emp_no as "Manager Employee number",
	   e.last_name as "Last Name",
	   e.first_name as "First Name",
	   de.emp_no as "Employee dept number"
from dept_manager as dm
join department as d on dm.dept_no= d.dept_no
join employees as e on dm.emp_no = e.emp_no
join dept_emp as de on dm.dept_no= de.dept_no;


--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

select de.dept_no as "Department number",
       de.emp_no as "Employee number",
	   e.last_name as "Last Name",
	   e.first_name as "First Name",
	   d.dept_name as "Department name"
from dept_emp as de
join department as d on de.dept_no= d.dept_no
join employees as e on de.emp_no = e.emp_no
order by de.emp_no;

--select emp_no,count(dept_no) from dept_emp
--group by emp_no
--having count(dept_no) >1;


--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select first_name as "First Name",
       last_name as "Last Name",
	   sex
from employees 
where first_name ='Hercules' 
and last_name like 'B%';


--List each employee in the Sales department, including their employee number, last name, and first name.
select de.emp_no as "Employee number",
	   e.last_name as "Last Name",
	   e.first_name as "First Name"
from dept_emp as de
join department as d on de.dept_no= d.dept_no
join employees as e on de.emp_no = e.emp_no
where d.dept_name='Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select de.emp_no as "Employee number",
	   e.last_name as "Last Name",
	   e.first_name as "First Name",
	   d.dept_name as "Department name"
from dept_emp as de
join department as d on de.dept_no= d.dept_no
join employees as e on de.emp_no = e.emp_no
where d.dept_name in ('Sales','Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name, count(last_name) as "frequency" 
from employees
group by last_name 
order by frequency desc;
