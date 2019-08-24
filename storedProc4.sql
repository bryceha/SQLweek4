DELIMITER $$
DROP PROCEDURE IF EXISTS AvgSalaryByDeptTitle $$
CREATE PROCEDURE AvgSalaryByDeptTitle(
    IN Department VARCHAR(40),
    IN Title VARCHAR(50))
  BEGIN
    SELECT d.dept_name 'Department', 
      t.title 'Title', 
      FORMAT(AVG(s.salary), 2) 'Avg. Salary'
    FROM departments d
    INNER JOIN dept_emp de ON de.dept_no = d.dept_no
    INNER JOIN salaries s ON s.emp_no = de.emp_no
    INNER JOIN titles t ON t.emp_no = s.emp_no
    WHERE d.dept_name = Department
    AND t.title = Title;
  END $$ 
DELIMITER ;