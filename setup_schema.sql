/* Healthcare Database Setup Script
   Author: Mustafa Yigit Gocmen
   Purpose: Create database schema and populate with sample data.
*/

CREATE DATABASE IF NOT EXISTS HealthcareDB;
USE HealthcareDB;

-- ============================
-- 1. TABLE CREATION
-- ============================

-- Patients Table
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    ContactInfo VARCHAR(100)
);

-- Doctors Table
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Specialty VARCHAR(100),
    ContactInfo VARCHAR(100)
);

-- Medications Table
CREATE TABLE Medications (
    MedicationID INT PRIMARY KEY,
    MedicationName VARCHAR(100) NOT NULL,
    Dosage VARCHAR(50)
);

-- Appointments Table (Links Patients & Doctors)
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Prescriptions Table (Links Patients & Medications)
CREATE TABLE Prescriptions (
    PrescriptionID INT PRIMARY KEY,
    PatientID INT,
    MedicationID INT,
    PrescriptionDate DATE NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (MedicationID) REFERENCES Medications(MedicationID)
);

-- MedicalRecords Table
CREATE TABLE MedicalRecords (
    RecordID INT PRIMARY KEY,
    PatientID INT,
    RecordDate DATE NOT NULL,
    Diagnosis VARCHAR(255),
    Treatment TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- ============================
-- 2. DATA POPULATION (Sample Data)
-- ============================

INSERT INTO Patients (PatientID, FirstName, LastName, DateOfBirth, ContactInfo) VALUES
(1, 'John', 'Doe', '1980-05-12', '555-123-4567'),
(2, 'Jane', 'Smith', '1992-08-23', '555-234-5678'),
(3, 'Michael', 'Johnson', '1975-11-30', '555-345-6789'),
(4, 'Emily', 'Davis', '1988-04-15', '555-456-7890'),
(5, 'Robert', 'Miller', '1965-02-19', '555-567-8901');

INSERT INTO Doctors (DoctorID, FirstName, LastName, Specialty, ContactInfo) VALUES
(1, 'Alice', 'Johnson', 'Cardiology', '555-111-2222'),
(2, 'Bob', 'Williams', 'Neurology', '555-222-3333'),
(3, 'Charles', 'Brown', 'Orthopedics', '555-333-4444'),
(4, 'Diana', 'Davis', 'Pediatrics', '555-444-5555'),
(5, 'Edward', 'Garcia', 'Dermatology', '555-555-6666');

INSERT INTO Medications (MedicationID, MedicationName, Dosage) VALUES
(1, 'Lisinopril', '10mg daily'),
(2, 'Metformin', '500mg twice daily'),
(3, 'Ibuprofen', '200mg as needed'),
(4, 'Albuterol', '2 puffs as needed'),
(5, 'Hydrocortisone Cream', 'Apply twice daily');

INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate) VALUES
(1, 1, 1, '2024-09-01'),
(2, 2, 1, '2024-09-04'),
(3, 3, 2, '2024-09-11'),
(4, 4, 4, '2024-09-16'),
(5, 5, 3, '2024-09-25');

INSERT INTO Prescriptions (PrescriptionID, PatientID, MedicationID, PrescriptionDate) VALUES
(1, 1, 1, '2024-04-17'),
(2, 2, 2, '2024-03-05'),
(3, 3, 3, '2024-01-12'),
(4, 4, 4, '2024-01-14'),
(5, 5, 5, '2024-02-10');
