SELECT 
e2.*
, AVG(ic2.number_rabies)
, MIN(ic2.number_rabies)
, MAX(ic2.number_rabies)
, SUM(ic2.number_rabies)
FROM infection_cases_NF2 ic2
LEFT JOIN entities_2NF e2 ON e2.entity_id = ic2.entity_id
WHERE ic2.number_rabies != ''
GROUP BY ic2.entity_id
ORDER BY AVG(ic2.number_rabies) DESC
LIMIT 10;
