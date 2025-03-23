-- Insert into patients
INSERT INTO clinic.patients (last_name, first_name, middle_name, sex, birth_date, contact_no)
VALUES 
('Doe', 'John', 'A.', 'M', '1990-05-15', '1234567890'),
('Smith', 'Jane', NULL, 'F', '1985-08-22', '0987654321'),
('Brown', 'Michael', 'B.', 'M', '1978-12-10', '1122334455');

-- Insert into doctors
INSERT INTO clinic.doctors (last_name, first_name, middle_name, sex, birth_date, medical_certification, years_of_service, specialization)
VALUES 
('Adams', 'Lisa', 'C.', 'F', '1975-06-30', 'Board Certified', 15, 'Cardiology'),
('Johnson', 'Robert', NULL, 'M', '1980-09-12', 'Board Certified', 10, 'Dermatology'),
('Clark', 'Emily', 'D.', 'F', '1992-03-25', 'General Practitioner', 3, 'General Medicine');

-- Insert into lab_requests
INSERT INTO clinic.lab_requests (npi, mrn, reason, request_date)
VALUES 
(1, 1, 'Blood Test', '2025-03-01'),
(2, 2, 'X-Ray', '2025-03-02'),
(3, 3, 'MRI Scan', '2025-03-03');

-- Insert into lab_reports
INSERT INTO clinic.lab_reports (lab_request_id, mrn, npi, payment_id, findings, lab_test_datetime, lab_fees, lab_results, report_status)
VALUES 
(1, 1, 1, NULL, 'High cholesterol', '2025-03-02 10:30:00', 200.00, 'Needs dietary changes', 'completed'),
(2, 2, 2, NULL, 'Fracture in left wrist', '2025-03-03 11:00:00', 300.00, 'Surgery required', 'completed'),
(3, 3, 3, NULL, 'Normal', '2025-03-04 12:00:00', 500.00, 'No issues detected', 'completed');

-- Insert into appointments
INSERT INTO clinic.appointments (mrn, npi, lab_report_id, purpose, start_datetime, end_datetime, appointment_fees, payment_status)
VALUES 
(1, 1, 1, 'Routine Checkup', '2025-03-05 09:00:00', '2025-03-05 09:30:00', 100.00, 'paid'),
(2, 2, 2, 'Follow-up', '2025-03-06 10:00:00', '2025-03-06 10:45:00', 150.00, 'unpaid'),
(3, 3, 3, 'Consultation', '2025-03-07 11:00:00', '2025-03-07 11:30:00', 120.00, 'paid');

-- Insert into bookings
INSERT INTO clinic.bookings (appointment_id, mrn, npi, booking_date, appointment_date)
VALUES 
(1, 1, 1, '2025-03-01', '2025-03-05 09:00:00'),
(2, 2, 2, '2025-03-02', '2025-03-06 10:00:00'),
(3, 3, 3, '2025-03-03', '2025-03-07 11:00:00');

-- Insert into payments
INSERT INTO clinic.payments (lab_report_id, mrn, appointment_id)
VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- Insert into diagnosis
INSERT INTO clinic.diagnosis (lab_report_id, diagnosis, treatment)
VALUES 
(1, 'High cholesterol', 'Dietary changes'),
(2, 'Wrist Fracture', 'Surgery and physical therapy'),
(3, 'No issues detected', 'None required');

-- Insert into prescriptions
INSERT INTO clinic.prescriptions (mrn, npi, medication_name, dosage, frequency, duration)
VALUES 
(1, 1, 'Atorvastatin', 10, 'Once daily', '30 days'),
(2, 2, 'Ibuprofen', 400, 'Twice daily', '7 days'),
(3, 3, 'Vitamin D', 5000, 'Once daily', '60 days');
