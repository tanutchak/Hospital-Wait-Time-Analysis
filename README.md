# Optimizing Patient Wait Times: Analyzing Pre-Consultation Delays in Outpatient Hospital Operations

## Overview  
This repository contains a data analysis case study focused on understanding and optimizing patient wait times in an outpatient hospital setting. Using the [Hospital Patient Data](https://www.kaggle.com/datasets/abdulqaderasiirii/hospital-patient-data) dataset, we analyze the typical duration between `Entry Time` and `Post-Consultation Time` and identify potential bottlenecks in the pre-consultation process.

### Objectives  
1. **Measure Typical Wait Time**: Calculate the average duration patients wait before seeing a doctor.  
2. **Identify Bottlenecks**: Detect delays by time of day, doctor type, or patient volume to improve hospital efficiency.

## Dataset  
- **Source**: [Hospital Patient Data on Kaggle](https://www.kaggle.com/datasets/abdulqaderasiirii/hospital-patient-data)  
- **Key Columns**:
  - `Date`: Day of patient visit
  - `MedicationRevenue`: Revenue from medication
  - `LabCost`: Cost of lab tests
  - `ConsultationRevenue`: Revenue from consultations
  - `DoctorType`: Type of doctor
  - `FinancialClass`: Patient financial category
  - `PatientType`: Type of patient (e.g., OUTPATIENT)
  - `EntryTime`: Time patient enters the hospital
  - `PostConsultationTime`: Time patient enters the clinic room
  - `CompletionTime`: Time patient exits
  - `PatientID`: Unique patient identifier

## Repository Structure
- **`data/`**: Placeholder for the dataset (download from Kaggle).
- **`sql/`**: SQL scripts for data manipulation and query results.
- **`r/`**: R scripts for analysis and visualization.
- **`output/`**: Generated plots and results.
