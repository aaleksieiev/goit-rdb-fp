-- -----------------------------------------------------
-- Migrate data to `pandemic`.`entities_2NF`
-- -----------------------------------------------------
INSERT INTO entities_2NF (entity, code)
SELECT DISTINCT entity, code 
FROM infection_cases;

SELECT count(*) FROM entities_2NF;
-- -----------------------------------------------------
-- Migrate data to `pandemic`.`infection_cases_NF2`
-- -----------------------------------------------------
INSERT INTO infection_cases_NF2 (entity_id, year, number_yaws, polio_cases, cases_guinea_worm, number_rabies, number_malaria, number_hiv, number_tuberculosis, number_smallpox, number_cholera_cases)
SELECT e.entity_id, year, number_yaws, polio_cases, cases_guinea_worm, number_rabies, number_malaria, number_hiv, number_tuberculosis, number_smallpox, number_cholera_cases 
FROM infection_cases i 
LEFT JOIN entities_2NF e ON e.entity=i.entity AND e.code = i.code;

SELECT count(*) FROM infection_cases_NF2;
-- -----------------------------------------------------
-- Compare `pandemic`.`infection_cases_NF2` and `pandemic`.`infection_cases`
-- -----------------------------------------------------
SELECT 
e2.entity AS entity
, e2.code AS code
, ic2.year
, ic2.number_yaws
, ic2.polio_cases
, ic2.cases_guinea_worm
, ic2.number_rabies
, ic2.number_malaria
, ic2.number_hiv
, ic2.number_tuberculosis
, ic2.number_smallpox
, ic2.number_cholera_cases
FROM infection_cases_NF2 ic2 
LEFT JOIN entities_2NF e2 ON e2.entity_id = ic2.entity_id
EXCEPT
SELECT ic.*
FROM infection_cases ic;
