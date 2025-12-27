# Healthcare Data Management & Analytics using SQL

## Project Overview
This project focuses on designing and implementing a relational database system for a healthcare facility. The goal is to manage critical data entities—Patients, Doctors, Appointments, and Prescriptions—while ensuring data integrity and query efficiency.

Using **MySQL**, I designed a normalized schema and performed advanced SQL queries to derive operational insights, such as doctor workload distribution and medication demand trends.

## Entity-Relationship Diagram (ERD)
The database follows a relational structure connecting patients, doctors, and medical records. 

```mermaid
erDiagram
    PATIENTS ||--o{ APPOINTMENTS : has
    PATIENTS ||--o{ MEDICAL_RECORDS : has
    PATIENTS ||--o{ PRESCRIPTIONS : receives
    DOCTORS ||--o{ APPOINTMENTS : attends
    MEDICATIONS ||--o{ PRESCRIPTIONS : contained_in

    PATIENTS {
        int PatientID PK
        string FirstName
        string DateOfBirth
    }
    DOCTORS {
        int DoctorID PK
        string Specialty
    }
    APPOINTMENTS {
        int AppointmentID PK
        date AppointmentDate
        int PatientID FK
        int DoctorID FK
    }
    MEDICATIONS {
        int MedicationID PK
        string MedicationName
    }
