-- Create table and import data (assuming CSV is loaded into SQLite)
CREATE TABLE hospital_data (
    Date TEXT,
    MedicationRevenue REAL,
    LabCost REAL,
    ConsultationRevenue REAL,
    DoctorType TEXT,
    FinancialClass TEXT,
    PatientType TEXT,
    EntryTime TEXT,
    PostConsultationTime TEXT,
    CompletionTime TEXT,
    PatientID TEXT
);

-- Calculate wait time by DoctorType
SELECT 
    DoctorType,
    AVG(ROUND((JULIANDAY('2025-01-01 ' || PostConsultationTime) - 
               JULIANDAY('2025-01-01 ' || EntryTime)) * 1440, 2)) AS Avg_Wait_Time,
    COUNT(*) AS Patient_Count
FROM hospital_data
WHERE EntryTime IS NOT NULL AND PostConsultationTime IS NOT NULL
GROUP BY DoctorType
ORDER BY Avg_Wait_Time DESC;

-- Wait time by hour of EntryTime
SELECT 
    STRFTIME('%H', EntryTime) AS Entry_Hour,
    AVG(ROUND((JULIANDAY('2025-01-01 ' || PostConsultationTime) - 
               JULIANDAY('2025-01-01 ' || EntryTime)) * 1440, 2)) AS Avg_Wait_Time
FROM hospital_data
WHERE EntryTime IS NOT NULL AND PostConsultationTime IS NOT NULL
GROUP BY STRFTIME('%H', EntryTime)
ORDER BY Entry_Hour;