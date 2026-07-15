## Experiment-1 => Hospital Management System


## Aim
Insert sample data into the tables and retrieve the first record from the first three tables.

## SQL Queries

### Insert Data

```sql
-- Doctors
INSERT INTO Doctors (DoctorID, Name, Specialization, ContactNumber, Email) VALUES
(1, 'Dr. John Smith', 'Cardiology', '1234567890', 'john.smith@hospital.com'),
(2, 'Dr. Lisa Brown', 'Neurology', '0987654321', 'lisa.brown@hospital.com');

-- Patients
INSERT INTO Patients (PatientID, Name, DOB, Gender, ContactNumber, Address) VALUES
(1, 'Alice Johnson', '1990-05-21', 'Female', '1112223333', '123 Main St'),
(2, 'Bob Martin', '1985-08-14', 'Male', '4445556666', '456 Elm St');

-- Appointments
INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate, Status) VALUES
(1, 1, 1, '2025-02-15', 'Scheduled'),
(2, 2, 2, '2025-02-16', 'Completed');

-- Treatments
INSERT INTO Treatments (TreatmentID, PatientID, DoctorID, Diagnosis, TreatmentDescription, TreatmentDate) VALUES
(1, 1, 1, 'Hypertension', 'Prescribed medication', '2025-02-15'),
(2, 2, 2, 'Migraine', 'MRI Scan and medications', '2025-02-16');

-- MedicalRecords
INSERT INTO MedicalRecords (RecordID, PatientID, TreatmentID, Notes) VALUES
(1, 1, 1, 'Patient responding well to treatment'),
(2, 2, 2, 'Further evaluation required');

-- Billing
INSERT INTO Billing (BillID, PatientID, TreatmentID, Amount, BillDate, Status) VALUES
(1, 1, 1, 200.00, 'Paid'),
(2, 2, 2, 500.00, 'Unpaid');
```

### Retrieve First Record

```sql
SELECT * FROM Doctors LIMIT 1;

SELECT * FROM Patients LIMIT 1;

SELECT * FROM Appointments LIMIT 1;
```

## Output

- Data is inserted into all tables.
- The first record from **Doctors**, **Patients**, and **Appointments** is displayed.

## Conclusion

Successfully inserted sample data into the Hospital Management System tables and retrieved the first record from the first three tables using the `LIMIT` clause.
