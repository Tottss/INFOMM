-- Insert test values into `clinic`.`patients`
INSERT INTO `clinic`.`patients` (mrn, last_name, first_name, middle_name, sex, birth_date, contact_no) VALUES
('P001', 'Doe', 'John', 'A', 'M', '1985-05-15', 1234567890),
('P002', 'Smith', 'Jane', 'B', 'F', '1990-08-20', 2345678901),
('P003', 'Johnson', 'Emily', NULL, 'F', '1988-12-30', 3456789012);

-- Insert test values into `clinic`.`doctors`
INSERT INTO `clinic`.`doctors` (npi, last_name, First_name, middle_name, sex, birth_date, medical_certification, years_of_service, specialization) VALUES
('D001', 'Brown', 'Michael', 'C', 'M', '1975-03-10', 'MD', 20, 'Cardiology'),
('D002', 'Taylor', 'Sarah', 'D', 'F', '1980-07-25', 'DO', 15, 'Pediatrics'),
('D003', 'Wilson', 'David', NULL, 'M', '1982-11-05', 'MD', 10, 'Dermatology');

-- Insert test values into `clinic`.`lab_requests`
INSERT INTO `clinic`.`lab_requests` (lab_request_id, npi, mrn, reason, request_date) VALUES
('LR001', 'D001', 'P001', 'Routine Checkup', '2025-03-01'),
('LR002', 'D002', 'P002', 'Skin Rash', '2025-03-02'),
('LR003', 'D003', 'P003', 'Heart Check', '2025-03-03');

-- Insert test values into `clinic`.`lab_reports`
INSERT INTO `clinic`.`lab_reports` (lab_report_id, lab_request_id, mrn, npi, payment_id, findings, lab_test_datetime, lab_fees, lab_results, report_status) VALUES
('LR001', 'LR001', 'P001', 'D001', NULL, 'All normal', '2025-03-01 10:00:00', 100.00, 'N/A', 'completed'),
('LR002', 'LR002', 'P002', 'D002', NULL, 'Skin irritation', '2025-03-02 11:00:00', 150.00, 'N/A', 'completed'),
('LR003', 'LR003', 'P003', 'D003', NULL, 'Mild arrhythmia', '2025-03-03 09:00:00', 200.00, 'N/A', 'completed');

-- Insert test values into `clinic`.`appointments`
INSERT INTO `clinic`.`appointments` (appointment_id, mrn, npi, lab_report_id, purpose, start_datetime, end_datetime, total_fees, payment_status) VALUES
('APPT001', 'P001', 'D001', 'LR001', 'Routine Checkup', '2025-03-01 09:00:00', '2025-03-01 09:30:00', 100.00, 'paid'),
('APPT002', 'P002', 'D002', 'LR002', 'Skin Rash Consultation', '2025-03-02 10:00:00', '2025-03-02 10:30:00', 150.00, 'paid'),
('APPT003', 'P003', 'D003', 'LR003', 'Heart Check Consultation', '2025-03-03 11:00:00', '2025-03-03 11:30:00', 200.00, 'paid');

-- Insert test values into `clinic`.`payments`
INSERT INTO `clinic`.`payments` (payment_id, lab_report_id, mrn, appointment_id) VALUES
('PAY001', 'LR001', 'P001', 'APPT001'),
('PAY002', 'LR002', 'P002', 'APPT002'),
('PAY003', 'LR003', 'P003', 'APPT003');

-- Insert test values into `clinic`.`bookings`
INSERT INTO `clinic`.`bookings` (booking, appointment_id, mrn, npi, booking_date, appointment_date) VALUES
('B001', 'APPT001', 'P001', 'D001', '2025-02-25', '2025-03-01 09:00:00'),
('B002', 'APPT002', 'P002', 'D002', '2025-02-26', '2025-03-02 10:00:00'),
('B003', 'APPT003', 'P003', 'D003', '2025-02-27', '2025-03-03 11:00:00');

-- Insert test values into `clinic`.`diagnosis`
INSERT INTO `clinic`.`diagnosis` (diagnosis_id, lab_report_id, diagnosis, treatment) VALUES
('DGN001', 'LR001', 'Healthy', 'No treatment needed'),
('DGN002', 'LR002', 'Skin irritation', 'Topical cream'),
('DGN003', 'LR003', 'Mild arrhythmia', 'Medication prescribed');

-- Insert test values into `clinic`.`prescriptions`
INSERT INTO `clinic`.`prescriptions` (prescription_id, mrn, npi, medication_name, dosage, frequency, duration) VALUES
('RX001', 'P001', 'D001', 'Aspirin', 81.0, 'Once daily', '30 days'),
('RX002', 'P002', 'D002', 'Hydrocortisone', 0.5, 'Twice daily', '14 days'),
('RX003', 'P003', 'D003', 'Beta-blocker', 50.0, 'Once daily', '60 days');