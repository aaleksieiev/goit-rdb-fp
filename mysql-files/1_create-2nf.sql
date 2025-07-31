SET FOREIGN_KEY_CHECKS = 0;

-- -----------------------------------------------------
-- Table `pandemic`.`infection_cases_NF2`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pandemic`.`infection_cases_NF2` ;

CREATE TABLE IF NOT EXISTS `pandemic`.`infection_cases_NF2` (
  `infection_case_id` INT(11) NOT NULL AUTO_INCREMENT,
  `entity_id` INT(11) NOT NULL,
  `year` YEAR NULL DEFAULT NULL,
  `number_yaws` VARCHAR(255) NULL DEFAULT '',
  `polio_cases` VARCHAR(255) NULL DEFAULT '',
  `cases_guinea_worm` VARCHAR(11) NULL DEFAULT '',
  `number_rabies` VARCHAR(255) NULL DEFAULT '',
  `number_malaria` VARCHAR(255) NULL DEFAULT '',
  `number_hiv` VARCHAR(255) NULL DEFAULT '',
  `number_tuberculosis` VARCHAR(255) NULL DEFAULT '',
  `number_smallpox` VARCHAR(255) NULL DEFAULT '',
  `number_cholera_cases` VARCHAR(255) NULL DEFAULT '',
  PRIMARY KEY (`infection_case_id`),
  INDEX `fk_infection_cases_NF2_1_idx` (`entity_id` ASC) VISIBLE,
  CONSTRAINT `fk_infection_cases_NF2_1`
    FOREIGN KEY (`entity_id`)
    REFERENCES `pandemic`.`entities_2NF` (`entity_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

DESCRIBE `pandemic`.`infection_cases_NF2`;

-- -----------------------------------------------------
-- Table `pandemic`.`entities_2NF`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pandemic`.`entities_2NF` ;

CREATE TABLE IF NOT EXISTS `pandemic`.`entities_2NF` (
  `entity_id` INT(11) NOT NULL AUTO_INCREMENT,
  `entity` VARCHAR(255) NOT NULL,
  `code` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`entity_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

DESCRIBE `pandemic`.`entities_2NF`;

SET FOREIGN_KEY_CHECKS = 1;


