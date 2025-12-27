/* Healthcare Business Analytics Queries
   Purpose: Extract operational insights from the HealthcareDB.
*/

-- 1. Doctor Workload Analysis
-- Calculates the average number of appointments per doctor to assess resource allocation.
SELECT AVG(AppointmentCount) AS AverageAppointmentsPerDoctor
FROM (
    SELECT DoctorID, COUNT(*) AS AppointmentCount
    FROM Appointments
    GROUP BY DoctorID
) AS DoctorAppointments;

-- 2. Medication Demand Analysis
-- Identifies the Top 3 most frequently prescribed medications for inventory management.
SELECT 
    M.MedicationName, 
    COUNT(*) AS PrescriptionCount
FROM Medications M
JOIN Prescriptions P ON M.MedicationID = P.MedicationID
GROUP BY M.MedicationName
ORDER BY PrescriptionCount DESC
LIMIT 3;

-- 3. Patient Growth Trend
-- Generates a monthly breakdown of new patients (based on birth/registration data) for the past year.
SELECT 
    MONTHNAME(DateOfBirth) AS Month, 
    COUNT(*) AS NewPatients
FROM Patients
WHERE DateOfBirth BETWEEN CURDATE() - INTERVAL 1 YEAR AND CURDATE()
GROUP BY Month
ORDER BY Month;

-- 4. Upcoming Schedule
-- List all appointments scheduled for the upcoming week for reception planning.
SELECT * FROM Appointments 
WHERE AppointmentDate BETWEEN CURDATE() AND CURDATE() + INTERVAL 7 DAY;
