## Analysis of Visualizations
### Wait Time Summary from R Analysis

**Min.** = 0.5667

**1st Qu.** = 13.9875   

**Median** = 26.3250 

**Mean** = 38.9144

**3rd Qu.** = 48.8333   

**Max.** = 733.3333 
  
### 1. Distribution of Pre-Consultation Wait Times 

![**wait_time_dist.png**](https://github.com/user-attachments/assets/5b06e83f-cd7c-4780-b4f7-0ca1944fb229)

**Observation**:

- The histogram shows a right-skewed distribution of wait times, with a significant peak near 0 minutes and a long tail extending to 600 minutes.
- Most patients experience wait times under 100 minutes, with the majority concentrated between 0 and 50 minutes.

**Interpretation**:

- The majority of patients experience relatively short wait times, suggesting that the hospital generally manages patient flow well for most cases.
- The long tail and outliers (e.g., wait times up to 733.33 minutes as seen in the `Wait Time Summary`) indicate that some patients face extreme delays, which could be due to specific bottlenecks or scheduling issues.


### 2. Average Wait Time by Hour of Entry 

![**wait_by_hour.png**](https://github.com/user-attachments/assets/1c225860-9a0c-413d-9a71-6023d87c428b)

**Observation**:

- The line plot shows the average wait time across different hours of the day (from ~8 AM to 23 PM).
- **Peak Wait Times**: around 9 AM (~50 minutes) and 17 PM (~45 minutes).
- **Low Wait Times**: around 13 PM (~30 minutes) and 22 PM (~15 minutes).
- There is a noticeable dip in wait times between 11 AM and 14 PM, followed by a rise in the late afternoon.

**Interpretation**:

- The peaks at 9 AM and 17 PM suggest that these are busy periods, possibly due to higher patient arrivals at the start of the day and late afternoon.
- The dip in the early afternoon (13 PM) indicates a quieter period, potentially when patient volume decreases or staff efficiency increases (e.g., after lunch breaks).
- The downward trend after 17 PM suggests that patient volume decreases towards the end of the day, reducing wait times.


### 3. Wait Time Distribution by Doctor Type 

![**wait_by_doctor.png**](https://github.com/user-attachments/assets/938b70c5-355a-41c2-8807-be58b48ead90)

**Observation**: 
- **ANCHOR**: Median wait time is around 25 minutes
- **FLOATING**: Median wait time is slightly higher (~30 minutes)
- **LOCUM**: Median wait time is the lowest (~20 minutes)
- All three doctor types show similar distributions between 10-50 minutes, but the presence of outliers (up to 600 minutes) is consistent across all types.

**Interpretation**:
- There is no significant difference in median wait times between doctor types, suggesting that the type of doctor does not strongly influence wait times.
- The outliers indicate that extreme delays are not specific to one doctor type but are a systemic issue affecting all types, possibly related to scheduling, patient volume, or emergency cases.

### 4. Patient Volume vs. Average Wait Time

![**volume_vs_wait.png**](https://github.com/user-attachments/assets/cd7f5dfd-a072-4fbe-8a64-3516c0ab4ad0)

**Observation**: 
- The scatter plot shows a positive correlation between patient volume (number of patients) and average wait time.
- As patient volume increases from 0 to 500, average wait time increases from ~10 minutes to ~60 minutes.
- The trend line has a positive slope, confirming that higher patient volumes are associated with longer wait times.
- There is some variability, with wait times fluctuating at similar patient volumes, indicating other factors may also influence delays.

**Interpretation**:
- Patient volume is a significant driver of wait times, as expected—more patients lead to longer waits due to limited resources (e.g., doctors, rooms).
- The variability suggests that other factors (e.g., staffing levels, appointment scheduling, or patient complexity) also play a role in wait times beyond just volume.

### **SQL Query**
1. Wait time by Type of Doctor:
  [Query Result](https://github.com/user-attachments/files/19217640/Calculate.wait.time.by.DoctorType.pdf)
2. Wait time by hour of the entry time:
  [Query Result](https://github.com/user-attachments/files/19217700/Wait.time.by.hour.of.EntryTime.pdf)

## Key Findings

### **Average Wait Time**: 38.91 minutes (median: 26.33 minutes)
- This aligns with the histogram, where most wait times are under 50 minutes, but outliers pull the mean higher.

### **Peak Delay Hours**: 9 AM (~50 minutes) and 17 PM (~45 minutes)
- These hours likely correspond to high patient arrival times, such as morning appointments and late afternoon visits.

### **Doctor Types with Longest Waits**: FLOATING doctors (~30 minutes median)
- While ANCHOR (~25 minutes) and LOCUM (~20 minutes)
- There is no significant difference in median wait times across doctor types.
- All doctor types experience extreme delays (outliers up to 600 minutes), indicating that the issue is systemic rather than specific to a doctor type.

## Addressing the Main Objective of the Case Study
**Objective**: Investigate the typical duration between EntryTime and PostConsultationTime and identify bottlenecks in the pre-consultation process.
1. **Measure Typical Wait Time**: Calculate the average duration patients wait before seeing a doctor.

   **ANSWER**: The median wait time is 26.33 minutes, making it a more accurate measure than the mean (38.91 minutes) due to the right-skewed distribution and outliers. Additionally, 75% of patients wait less than 48.83 minutes, suggesting that the pre-consultation process is generally manageable for most patients.

2. **Identify Bottlenecks**: Detect delays by time of day, doctor type, or patient volume to improve hospital efficiency.

   **ANSWER**: High patient volume leads to longer wait times, with averages reaching 60 minutes when patient numbers exceed 400. Peak delays occur at 9 AM and 5 PM, likely due to high patient arrivals. Systemic delays affect all doctor types, indicating hospital-wide operational challenges rather than doctor-specific issues. Extreme outliers, with wait times up to 733.33 minutes (~12 hours), suggest potential failures like emergency cases, scheduling errors, or staffing shortages.

## Insights and Recommendations for Improvement

### **Insights**
- **Patient Volume Drives Delays**: The strong correlation between patient volume and wait time highlights that resource constraints (e.g., doctors, rooms) are a primary bottleneck during high-traffic periods.
- **Peak Hours Indicate Scheduling Issues**: The peaks at 9 AM and 17 PM suggest that appointment scheduling or patient arrivals are concentrated during these times, leading to longer waits.
- **Systemic Issues Across Doctor Types**: The lack of significant difference in wait times across doctor types indicates that the issue lies in hospital-wide processes rather than specific doctor performance.
- **Outliers Signal Operational Failures**: Extreme wait times (up to 12 hours) point to specific cases where the system fails, possibly due to emergency patients, no-shows, or overbooking.

### **Recommendations**
1. **Optimize Appointment Scheduling**:
    
    - **Spread Out Appointments**: Distribute appointments more evenly throughout the day to avoid peaks at 9 AM and 17 PM. For example, encourage patients to book mid-morning or early afternoon slots (e.g., 11 AM to 14 PM), where wait times are lower.
    - **Spread-Out Arrival Times**: Spread out patient arrivals (e.g., 9:00, 9:10, 9:20) instead of scheduling many at once to reduce congestion.
2. **Increase Staffing During Peak Hours**:

    - **Add Temporary Staff**: Deploy additional doctors, nurses, or support staff during peak hours (8-10 AM and 4-6 PM) to handle higher patient volumes.
    - **Use FLOATING Doctors Strategically**: Since FLOATING doctors have slightly higher wait times, consider assigning them to less busy periods or pairing them with additional support staff during peak hours.

3. **Address Outliers and Extreme Delays**:

    - **Identify Causes of Outliers**: Investigate cases with wait times exceeding 400 minutes. These could be due to emergency cases, no-shows, or overbooking. Implement a system to flag and manage them (e.g., prioritize emergencies without delaying scheduled patients).
    - **Improve Patient Screening**: Streamline assessment to assign patients to the right doctor or department, minimizing delays.

4. **Leverage Data for Resource Allocation**:

    - **Predictive Modeling**: Use historical data to predict high-volume days or hours and adjust staffing accordingly.
    - **Dynamic Scheduling**: Implement a dynamic scheduling system that adjusts appointment slots based on real-time patient volume and wait times.
