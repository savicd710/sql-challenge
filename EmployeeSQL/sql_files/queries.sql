-- 1. Employee Number, Last Name, First Name, Sex, Salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
JOIN salaries as s
    ON e.emp_no = s.emp_no;

-- 2. First Name, Last Name, Hire Date for employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <'1987-01-01';

-- 3. Dept Number, Dept Name, Manager's Emp Number, Last Name, First Name
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name
FROM employees as e
JOIN dept_manager as dm
    USING (emp_no)
JOIN departments as d
    USING (dept_no);

-- 4. Employee Number, Last Name, First Name, Dept Name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp
    USING (emp_no)
JOIN departments as d
    USING (dept_no);

-- 5. First Name, Last Name, Sex WHERE First Name is Hercules and Last Name starts w B
SELECT first_name, last_name, sex
FROM employees
WHERE  first_name = 'Hercules' AND last_name ~~ 'B%';

-- 6. Employee Number, Last Name, First Name, Dept Name for all Sales Dept
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp
    USING (emp_no)
JOIN departments as d 
    USING (dept_no)
WHERE d.dept_name = 'Sales';

-- 7. Employee Number, Last Name, First Name, Dept Name for all Sales Dept AND Development Dept
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp
    USING (emp_no)
JOIN departments as d 
    USING (dept_no)
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- 8. Frequency count of Last Names in descending order
SELECT last_name, count(last_name)
FROM employees
GROUP BY last_name
ORDER BY count(last_name) DESC;