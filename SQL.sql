CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR,   NOT NULL,
    "gender" VARCHAR,   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "emp_no" INT   NOT NULL,
    "title" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
	
ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");


--List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT e.emp_no, e.first_name,e.last_name, e.gender, s.salary
FROM salaries as s
INNER JOIN employees AS e 
	ON s.emp_no = e.emp_no;

--List employees who were hired in 1986.
SELECT e.emp_no, e.first_name,e.last_name, e.gender, s.salary
FROM salaries as s
INNER JOIN employees AS e 
	ON s.emp_no = e.emp_no;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT e.emp_no, d.dept_name, e.first_name,e.last_name
FROM dept_manager AS dm
INNER JOIN employees AS e 
	ON dm.emp_no = e.emp_no
INNER JOIN departments AS d
	ON dm.dept_no = d.dept_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT e.emp_no, d.dept_name, e.first_name,e.last_name
FROM debt_emp as de
INNER JOIN employees AS e 
	ON de.emp_no = e.emp_no
INNER JOIN departments AS d
	ON de.dept_no = d.dept_no

--List all employees whose first name is "Hercules" and last names begin with "B."

SELECT *
FROM employees
WHERE first_name = 'Hercules' 
	AND last_name Like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no, d.dept_name, e.first_name,e.last_name
FROM debt_emp as de
INNER JOIN employees AS e 
	ON de.emp_no = e.emp_no
INNER JOIN departments AS d
	ON de.dept_no = d.dept_no
WHERE dept_name like 'Sales'

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, d.dept_name, e.first_name,e.last_name
FROM debt_emp as de
INNER JOIN employees AS e 
	ON de.emp_no = e.emp_no
INNER JOIN departments AS d
	ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales' OR dept_name ='Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT COUNT(last_name), last_name
from employees
GROUP BY last_name
ORDER BY COUNT DESC;
