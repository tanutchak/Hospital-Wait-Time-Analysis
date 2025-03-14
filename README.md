# Optimizing Patient Wait Times: Analyzing Pre-Consultation Delays in Outpatient Hospital Operations using SQL and R

![structure](https://github.com/user-attachments/assets/b00226c2-f48e-4332-a2f8-700f8f6d4bf9)

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

    **FLOATING** = A doctor who works in different departments as needed

    **ANCHOR** = A doctor who is permanently assigned to a specific departmenะ

    **LOCUM** = A temporary doctor who fills in for another doctor on leave
    
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

## Analysis Workflow
### 1 Data Preparation
Cleaning the raw dataset (hospital_data.csv)

**SQL**:  

1. Load the hospital_data.csv into a database table using **SQLite**.
2. Clean the data by removing rows with invalid or missing EntryTime and PostConsultationTime.
3. Export the cleaned data as a CSV file for use in R

**R**:

1. Loads the cleaned CSV
2. Converts time columns to hms objects using hms::as_hms() and calculates Wait_Time_Minutes using difftime.
3. Saves the final dataset as cleaned_data.rds in ../data/.

### 2 Exploratory Analysis
Computes statistical summaries and identifies patterns in the data. (e.g., average wait times by hour)

**SQL**:
1. After cleaning the CSV file, write queries to retrieve the analysis results.

**R**
1. Loads cleaned_data.rds and computes summaries, adjusting for the fact that EntryTime is in seconds.

### 3 Visualizations
Generates plots to visualize wait time distributions, trends, and relationships, saved in the output/ directory
**Tools**: R (r/visualizations.R) using ggplot2
- Loads intermediate datasets (cleaned_data.rds, wait_by_hour.rds, patient_volume.rds) and generates plots.

### 4 Outputs
- **wait_time_dist.png**: Distribution of wait times.
- **wait_by_hour.png**: Wait times by hour of entry.
- **wait_by_doctor.png**: Wait times by doctor type.
- **volume_vs_wait.png**: Patient volume vs. wait time.

## Integration of SQL and R

**Why Use SQL?**:

- SQL excels at handling large datasets, performing complex queries, and filtering data efficiently, which reduces the load on R.
- It allows for initial data cleaning and summarization directly in the database, making the R scripts more focused on analysis and visualization.

**Workflow Synergy**:

- **SQL** preprocesses the data (e.g., removing invalid entries, calculating wait times) and exports it as CSV files.
- **R** takes these preprocessed files, performs advanced statistical analysis, and generates visualizations, leveraging its strengths in data manipulation and plotting.

**Example Pipeline**:
1. Run sql/data_preprocessing.sql to clean data and save as cleaned_data_sql.csv.
2. Run sql/exploratory_analysis.sql to generate preliminary summaries (e.g., wait_by_hour_sql.csv).
3. Run r/data_preparation.R to load and refine the data into cleaned_data.rds.
4. Run r/analysis.R to compute final statistics and save intermediate datasets.
5. Run r/visualizations.R to create and save plots in output/.
