DELIMITER $$
DROP PROCEDURE IF EXISTS ShowEmpInfo $$
CREATE PROCEDURE ShowEmpInfo(
    IN LastName VARCHAR(16),
    IN FirstName VARCHAR(14))
  BEGIN
    SELECT e.emp_no 'Emp. No.', 
      e.hire_date 'Hire Date', 
      d.dept_name 'Department',
      t.title 'Title', 
      FORMAT(s.salary, 2) 'Salary'
    FROM employees e
    INNER JOIN titles t ON t.emp_no = e.emp_no
    INNER JOIN salaries s ON s.emp_no = e.emp_no
    INNER JOIN dept_emp de ON de.emp_no = e.emp_no
    INNER JOIN departments d ON d.dept_no = de.dept_no
    WHERE s.to_date >= CURRENT_DATE
    AND e.last_name = LastName
    AND e.first_name = FirstName;
  END $$
DELIMITER ;