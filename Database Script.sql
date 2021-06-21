-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cvparser
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cvparser
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cvparser` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `cvparser` ;

-- -----------------------------------------------------
-- Table `cvparser`.`appliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cvparser`.`appliers` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `FullName` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `PhoneNb` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `EmailAddress` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `SpLang` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `PrLang` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Skills` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `CV` VARCHAR(1000) NULL DEFAULT NULL,
  `isCandidate` TINYINT(4) NULL DEFAULT NULL,
  `DateOfAppliance` TIMESTAMP NULL DEFAULT NULL,
  `Message` VARCHAR(256) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cvparser`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cvparser`.`users` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `UserName` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Password` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Position` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `FirstName` VARCHAR(45) NULL DEFAULT NULL,
  `LastName` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cvparser`.`log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cvparser`.`log` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NULL DEFAULT NULL,
  `logged_in` TIMESTAMP NULL DEFAULT NULL,
  `logged_out` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `cvparser`.`users` (`ID`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
