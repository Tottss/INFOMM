CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vw_appointmentdetails` AS
    SELECT 
        `a`.`appointment_id` AS `appointment_id`,
        CONCAT(COALESCE(`p`.`first_name`, ''),
                ' ',
                (CASE
                    WHEN
                        ((`p`.`middle_name` IS NOT NULL)
                            AND (`p`.`middle_name` <> ''))
                    THEN
                        CONCAT(`p`.`middle_name`, ' ')
                    ELSE ''
                END),
                COALESCE(`p`.`last_name`, '')) AS `patient_name`,
        `p`.`sex` AS `sex`,
        `p`.`birth_date` AS `birth_date`,
        `p`.`contact_no` AS `contact_no`,
        CONCAT(`d`.`First_name`,
                ' ',
                `d`.`middle_name`,
                ' ',
                `d`.`last_name`) AS `attending_doctor`,
        `d`.`specialization` AS `specialization`,
        `a`.`purpose` AS `purpose`,
        `a`.`start_datetime` AS `start_datetime`,
        `a`.`end_datetime` AS `end_datetime`,
        `lr`.`report_status` AS `lab_report_status`,
        (`a`.`total_fees` - `lr`.`lab_fees`) AS `appointment_fee`,
        `lr`.`lab_fees` AS `lab_report_Fee`,
        `a`.`total_fees` AS `total_fees`,
        `a`.`payment_status` AS `payment_status`
    FROM
        (((`appointments` `a`
        JOIN `patients` `p` ON ((`a`.`mrn` = `p`.`mrn`)))
        JOIN `doctors` `d` ON ((`a`.`npi` = `d`.`npi`)))
        JOIN `lab_reports` `lr` ON ((`a`.`lab_report_id` = `lr`.`lab_report_id`)))