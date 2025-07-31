SELECT 
src.*
, CURRENT_DATE()
, TIMESTAMPDIFF(YEAR, src.date_from_year, CURRENT_DATE()) AS years_difference
FROM (
    SELECT 
	e2.*
	, ic2.year
	, STR_TO_DATE(CONCAT(ic2.year, '-', '01', '-', '01'), '%Y-%m-%d') AS date_from_year
    FROM infection_cases_NF2 ic2
    LEFT JOIN entities_2NF e2 
    ON e2.entity_id = ic2.entity_id
) src
LIMIT 100;
