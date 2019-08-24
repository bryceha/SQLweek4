DELIMITER $$
DROP PROCEDURE IF EXISTS TellBirthday $$
CREATE PROCEDURE TellBirthday(
    IN id int, 
    OUT birthday DATE)
  BEGIN
    SELECT birth_date INTO birthday FROM employees
    WHERE emp_no = id;
  END $$
DELIMITER ;