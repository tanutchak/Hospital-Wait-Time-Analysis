library(dplyr)
library(lubridate)

# Create data directory if it doesn’t exist
dir.create("../data", showWarnings = FALSE)

# Load cleaned data
hospital_data <- readRDS("../data/cleaned_data.rds")

# ตรวจสอบ EntryTime
cat("Sample of EntryTime:\n")
print(head(hospital_data$EntryTime, 10))

# Summary statistics
wait_summary <- summary(hospital_data$Wait_Time_Minutes)
cat("Wait Time Summary:\n")
print(wait_summary)

# Wait time by hour (แปลงจากวินาทีเป็นชั่วโมง)
wait_by_hour <- hospital_data %>%
  mutate(Entry_Hour = floor(as.numeric(EntryTime) / 3600)) %>%  # แปลงวินาทีเป็นชั่วโมง
  group_by(Entry_Hour) %>%
  summarise(Avg_Wait_Time = mean(Wait_Time_Minutes, na.rm = TRUE))

# ตรวจสอบข้อมูล wait_by_hour
cat("Wait by Hour Data:\n")
print(wait_by_hour)

# Save results
saveRDS(wait_by_hour, "../data/wait_by_hour.rds")

# Patient volume vs. wait time (แปลงจากวินาทีเป็นชั่วโมง)
patient_volume <- hospital_data %>%
  group_by(Date, Entry_Hour = floor(as.numeric(EntryTime) / 3600)) %>%  # แปลงวินาทีเป็นชั่วโมง
  summarise(Patient_Count = n(), Avg_Wait_Time = mean(Wait_Time_Minutes, na.rm = TRUE))

# Save results
saveRDS(patient_volume, "../data/patient_volume.rds")