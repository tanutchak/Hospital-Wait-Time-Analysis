SELECT 
    Patient_ID,
    ROUND((JULIANDAY('2025-01-01 ' || Post_Consultation_Time) - 
           JULIANDAY('2025-01-01 ' || Entry_Time)) * 1440, 2) AS Wait_Time_Minutes
FROM hospital_data;
