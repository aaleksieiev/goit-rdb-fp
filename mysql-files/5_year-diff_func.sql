DROP FUNCTION IF EXISTS years_difference;

DELIMITER $$

CREATE FUNCTION years_difference(year_value YEAR)
RETURNS INT
DETERMINISTIC
BEGIN
    -- Declare local variables if needed
    DECLARE date_from_year DATE;
    DECLARE result INT;

    -- Function logic
    SET date_from_year = STR_TO_DATE(CONCAT(year_value, '-', '01', '-', '01'), '%Y-%m-%d'); 
    SET result = TIMESTAMPDIFF(YEAR, date_from_year, CURRENT_DATE());

    -- Return the result
    RETURN result;
END$$

DELIMITER ;

SELECT 
e2.*
, ic2.year
, years_difference(ic2.year)
FROM infection_cases_NF2 ic2
LEFT JOIN entities_2NF e2 
ON e2.entity_id = ic2.entity_id
LIMIT 100;
