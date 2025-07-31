SET GLOBAL local_infile = ON;

-- -----------------------------------------------------
-- Create user
-- -----------------------------------------------------
CREATE USER 'mwb-user'@'%' IDENTIFIED BY 'sgd-vfv-cx2-34da';
GRANT ALL PRIVILEGES ON pandemic.* TO 'mwb-user'@'%';
FLUSH PRIVILEGES;

-- -----------------------------------------------------
-- Schema pandemic
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `pandemic` ;
CREATE DATABASE `pandemic`;
USE pandemic;

-- -----------------------------------------------------
-- Create table 
-- ----------------------------------------------------
CREATE TABLE `infection_cases` (
    `entity` VARCHAR(255) NOT NULL,
    `code` VARCHAR(255) NOT NULL,
    `year` YEAR,
    `number_yaws` varchar(255) default '',
    `polio_cases` varchar(255) default '',
    `cases_guinea_worm` varchar(11) DEFAULT '',
    `number_rabies` varchar(255) default '',
    `number_malaria` varchar(255) default '',
    `number_hiv` varchar(255) default '',
    `number_tuberculosis` varchar(255) default '',
    `number_smallpox` varchar(255) default '',
    `number_cholera_cases` varchar(255) default ''
);

LOAD DATA INFILE '/var/lib/mysql-files/infectious_cases.csv' 
INTO TABLE `infection_cases` FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 
ROWS (`entity`, `code`, `year`, `number_yaws`, `polio_cases`, `cases_guinea_worm`, `number_rabies`, `number_malaria`, `number_hiv`, `number_tuberculosis`, `number_smallpox`, `number_cholera_cases`);

show tables;

select count(*) from infection_cases;

