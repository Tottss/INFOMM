-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Doctor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Doctor` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Doctor` (
  `NPI` VARCHAR(15) NOT NULL,
  `Last_name` VARCHAR(45) NOT NULL,
  `First_name` VARCHAR(45) NOT NULL,
  `Middle_name` VARCHAR(45) NULL,
  `Sex` ENUM('M', 'F') NOT NULL,
  `Birthday` DATE NOT NULL,
  `Medical_certification` VARCHAR(45) NOT NULL,
  `Years_of_service` INT NOT NULL,
  `Specialization` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NPI`),
  UNIQUE INDEX `NPI_UNIQUE` (`NPI` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Patients` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Patients` (
  `MRN` VARCHAR(15) NOT NULL,
  `Last_name` VARCHAR(45) NOT NULL,
  `First_name` VARCHAR(45) NOT NULL,
  `Middle_name` VARCHAR(45) NULL,
  `Sex` ENUM('M', 'F') NOT NULL,
  `Birthday` DATE NOT NULL,
  `contact_no` INT NOT NULL,
  PRIMARY KEY (`MRN`),
  UNIQUE INDEX `MRN_UNIQUE` (`MRN` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Lab_reports`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Lab_reports` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Lab_reports` (
  `Lab_report_id` VARCHAR(45) NOT NULL,
  `MRN` VARCHAR(45) NOT NULL,
  `NPI` VARCHAR(45) NOT NULL,
  `Testing_for` VARCHAR(45) NOT NULL,
  `Findings` VARCHAR(45) NOT NULL,
  `Lab_test_date` DATE NOT NULL,
  `Lab_Fees` DOUBLE NOT NULL,
  `Payment_status` ENUM('Unpaid', 'Paid', 'Refunded') NOT NULL,
  `Result_status` ENUM('Pending', 'Completed') NOT NULL,
  PRIMARY KEY (`Lab_report_id`),
  UNIQUE INDEX `Lab_report_id_UNIQUE` (`Lab_report_id` ASC) VISIBLE,
  INDEX `FK5_idx` (`NPI` ASC) VISIBLE,
  INDEX `FK6_idx` (`MRN` ASC) VISIBLE,
  CONSTRAINT `FK5`
    FOREIGN KEY (`NPI`)
    REFERENCES `mydb`.`Doctor` (`NPI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK6`
    FOREIGN KEY (`MRN`)
    REFERENCES `mydb`.`Patients` (`MRN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Appointments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Appointments` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Appointments` (
  `Appointment_ID` INT NOT NULL,
  `MRN` VARCHAR(45) NOT NULL,
  `NPI` VARCHAR(45) NOT NULL,
  `Purpose` VARCHAR(45) NOT NULL,
  `date_of_visit` DATE NOT NULL,
  `Total_fees` DOUBLE NOT NULL,
  PRIMARY KEY (`Appointment_ID`),
  UNIQUE INDEX `Appointment_ID_UNIQUE` (`Appointment_ID` ASC) VISIBLE,
  INDEX `FK1_idx` (`NPI` ASC) VISIBLE,
  INDEX `FK2_idx` (`MRN` ASC) VISIBLE,
  CONSTRAINT `FK1`
    FOREIGN KEY (`NPI`)
    REFERENCES `mydb`.`Doctor` (`NPI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK2`
    FOREIGN KEY (`MRN`)
    REFERENCES `mydb`.`Patients` (`MRN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Prescriptions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Prescriptions` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Prescriptions` (
  `Prescription_ID` VARCHAR(15) NOT NULL,
  `MRN` VARCHAR(45) NOT NULL,
  `NPI` VARCHAR(45) NOT NULL,
  `medicationName` VARCHAR(45) NOT NULL,
  `Dosage` DOUBLE NOT NULL,
  `Frequency` VARCHAR(45) NOT NULL,
  `Duration` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Prescription_ID`),
  UNIQUE INDEX `Prescription_ID_UNIQUE` (`Prescription_ID` ASC) VISIBLE,
  INDEX `FK3_idx` (`NPI` ASC) VISIBLE,
  INDEX `FK4_idx` (`MRN` ASC) VISIBLE,
  CONSTRAINT `FK3`
    FOREIGN KEY (`NPI`)
    REFERENCES `mydb`.`Doctor` (`NPI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK4`
    FOREIGN KEY (`MRN`)
    REFERENCES `mydb`.`Patients` (`MRN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
