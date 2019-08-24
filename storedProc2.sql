DELIMITER $$
DROP PROCEDURE IF EXISTS ShowCurrentManager $$
CREATE PROCEDURE ShowCurrentManager(IN deptName VARCHAR(40))
  BEGIN
    SELECT CONCAT(e.first_name, ' ', e.last_name) 'Current Manager'
    FROM employees e
    INNER JOIN dept_manager dm ON e.emp_no = dm.emp_no
    INNER JOIN departments d ON dm.dept_no = d.dept_no
    WHERE dm.to_date >= CURRENT_DATE
    AND d.dept_name = deptName;
  END $$
DELIMITER ;