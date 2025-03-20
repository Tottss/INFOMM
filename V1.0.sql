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
-- Table `mydb`.`Lab_request`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Lab_request` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Lab_request` (
  `Lab_request_id` INT NOT NULL,
  `NPI` VARCHAR(45) NOT NULL,
  `MRN` VARCHAR(45) NOT NULL,
  `Reason` VARCHAR(45) NOT NULL,
  `Date_requested` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Lab_request_id`),
  UNIQUE INDEX `Lab_request_id_UNIQUE` (`Lab_request_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Lab_reports`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Lab_reports` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Lab_reports` (
  `Lab_report_id` VARCHAR(45) NOT NULL,
  `Lap_request_id` INT NOT NULL,
  `MRN` VARCHAR(45) NOT NULL,
  `NPI` VARCHAR(45) NOT NULL,
  `Testing_for` VARCHAR(45) NOT NULL,
  `Findings` VARCHAR(45) NOT NULL,
  `Lab_test_date` DATETIME NOT NULL,
  `Lab_Fees` DOUBLE NOT NULL,
  `Payment_record_id` INT NOT NULL,
  `lab_results` VARCHAR(45) NULL,
  `Report_status` ENUM('Pending', 'Completed') NOT NULL,
  PRIMARY KEY (`Lab_report_id`),
  UNIQUE INDEX `Lab_report_id_UNIQUE` (`Lab_report_id` ASC) VISIBLE,
  INDEX `FK5_idx` (`NPI` ASC) VISIBLE,
  INDEX `FK6_idx` (`MRN` ASC) VISIBLE,
  UNIQUE INDEX `Lap_request_id_UNIQUE` (`Lap_request_id` ASC) VISIBLE,
  CONSTRAINT `FK5`
    FOREIGN KEY (`NPI`)
    REFERENCES `mydb`.`Doctor` (`NPI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK6`
    FOREIGN KEY (`MRN`)
    REFERENCES `mydb`.`Patients` (`MRN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FKl`
    FOREIGN KEY (`Lap_request_id`)
    REFERENCES `mydb`.`Lab_request` (`Lab_request_id`)
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
  `Start_datetime` DATETIME NOT NULL,
  `Appointmentscol` DATETIME NOT NULL,
  `Total_fees` DOUBLE NOT NULL,
  `Payment_status` ENUM('Unpaid', 'Paid', 'Refunded') NOT NULL,
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


-- -----------------------------------------------------
-- Table `mydb`.`Booking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Booking` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Booking` (
  `Booking` VARCHAR(45) NOT NULL,
  `Appointment_ID` INT NOT NULL,
  `MRN` VARCHAR(45) NOT NULL,
  `NPI` VARCHAR(45) NOT NULL,
  `Booking_date` DATE NOT NULL,
  `Appointment_date` DATETIME NOT NULL,
  PRIMARY KEY (`Booking`),
  UNIQUE INDEX `Booking_UNIQUE` (`Booking` ASC) VISIBLE,
  INDEX `FK9_idx` (`NPI` ASC) VISIBLE,
  INDEX `FK10_idx` (`MRN` ASC) VISIBLE,
  UNIQUE INDEX `Appointment_ID_UNIQUE` (`Appointment_ID` ASC) VISIBLE,
  CONSTRAINT `FK8`
    FOREIGN KEY (`Appointment_ID`)
    REFERENCES `mydb`.`Appointments` (`Appointment_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK9`
    FOREIGN KEY (`NPI`)
    REFERENCES `mydb`.`Doctor` (`NPI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK10`
    FOREIGN KEY (`MRN`)
    REFERENCES `mydb`.`Patients` (`MRN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Diagnosis`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Diagnosis` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Diagnosis` (
  `Diagnosis_id` INT NOT NULL,
  `Appointment_ID` INT NOT NULL,
  `Diagnosis` VARCHAR(45) NOT NULL,
  `Treatment` VARCHAR(45) NULL,
  PRIMARY KEY (`Diagnosis_id`),
  UNIQUE INDEX `Diagnosis_id_UNIQUE` (`Diagnosis_id` ASC) VISIBLE,
  INDEX `FKA_idx` (`Appointment_ID` ASC) VISIBLE,
  CONSTRAINT `FKA`
    FOREIGN KEY (`Appointment_ID`)
    REFERENCES `mydb`.`Appointments` (`Appointment_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Payment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Payment` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Payment` (
  `Payment_id` INT NOT NULL,
  `lab_report_id` VARCHAR(45) NULL,
  `MRN` VARCHAR(45) NOT NULL,
  `Appointment_ID` INT NULL,
  PRIMARY KEY (`Payment_id`),
  UNIQUE INDEX `Payment_id_UNIQUE` (`Payment_id` ASC) VISIBLE,
  INDEX `FKm_idx` (`Appointment_ID` ASC) VISIBLE,
  INDEX `FKL_idx` (`lab_report_id` ASC) VISIBLE,
  CONSTRAINT `FKm`
    FOREIGN KEY (`Appointment_ID`)
    REFERENCES `mydb`.`Appointments` (`Appointment_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FKLoer`
    FOREIGN KEY (`lab_report_id`)
    REFERENCES `mydb`.`Lab_reports` (`Lab_report_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
