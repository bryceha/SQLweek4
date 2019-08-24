DELIMITER $$
DROP PROCEDURE IF EXISTS GiveRaiseByTitle $$
CREATE PROCEDURE GiveRaiseByTitle(
    IN Title VARCHAR(50),
    IN Raise INT)
  BEGIN
    UPDATE salaries s
    INNER JOIN titles t
    ON t.emp_no = s.emp_no
    SET s.salary = s.salary + Raise
    WHERE s.to_date >= CURRENT_DATE
    AND t.title = Title;
  END $$ 
DELIMITER ;