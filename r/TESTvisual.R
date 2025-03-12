library(ggplot2)

# Create output directory if it doesn’t exist
dir.create("../output", showWarnings = FALSE)

# Load data
hospital_data <- readRDS("../data/cleaned_data.rds")
wait_by_hour <- readRDS("../data/wait_by_hour.rds")
patient_volume <- readRDS("../data/patient_volume.rds")

# ตรวจสอบข้อมูล wait_by_hour
cat("Wait by Hour Data Loaded:\n")
print(wait_by_hour)

# Histogram of wait times
ggplot(hospital_data, aes(x = Wait_Time_Minutes)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Pre-Consultation Wait Times", x = "Wait Time (Minutes)", y = "Count") +
  theme_minimal() +
  theme(
    panel.background = element_rect(fill = "white", colour = "white"),
    plot.background = element_rect(fill = "white", colour = "white")
  )
ggsave("../output/wait_time_dist.png")

# Wait time by hour
ggplot(wait_by_hour, aes(x = Entry_Hour, y = Avg_Wait_Time)) +
  geom_line(color = "blue") +
  geom_point() +
  scale_x_continuous(breaks = 0:23) +  # กำหนดแกน x ให้ครอบคลุม 0-23 ชั่วโมง
  labs(title = "Average Wait Time by Hour of Entry", x = "Hour of Day", y = "Avg Wait Time (Minutes)") +
  theme_minimal() +
  theme(
    panel.background = element_rect(fill = "white", colour = "white"),
    plot.background = element_rect(fill = "white", colour = "white")
  )
ggsave("../output/wait_by_hour.png")

# Wait time by DoctorType
ggplot(hospital_data, aes(x = DoctorType, y = Wait_Time_Minutes)) +
  geom_boxplot(fill = "lightgreen") +
  labs(title = "Wait Time Distribution by Doctor Type", x = "Doctor Type", y = "Wait Time (Minutes)") +
  theme_minimal() +
  theme(
    panel.background = element_rect(fill = "white", colour = "white"),
    plot.background = element_rect(fill = "white", colour = "white")
  ) +
  coord_flip()
ggsave("../output/wait_by_doctor.png")

# Patient volume vs. wait time
ggplot(patient_volume, aes(x = Patient_Count, y = Avg_Wait_Time)) +
  geom_point(color = "purple") +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Patient Volume vs. Average Wait Time", x = "Number of Patients", y = "Avg Wait Time (Minutes)") +
  theme_minimal() +
  theme(
    panel.background = element_rect(fill = "white", colour = "white"),
    plot.background = element_rect(fill = "white", colour = "white")
  )
ggsave("../output/volume_vs_wait.png")