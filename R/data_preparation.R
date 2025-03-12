library(readr)
library(dplyr)
library(lubridate)
library(hms)

# Load data
hospital_data <- read_csv("../data/hospital_data.csv")

# Clean and prepare data
hospital_data <- hospital_data %>%
  mutate(
    Entry_Time = hms::as_hms(Entry_Time),
    Post_Consultation_Time = hms::as_hms(Post_Consultation_Time),
    Date = as.Date(Date),
    Wait_Time_Minutes = as.numeric(difftime(Post_Consultation_Time, Entry_Time, units = "mins"))
  ) %>%
  filter(!is.na(Wait_Time_Minutes) & Wait_Time_Minutes >= 0)

# Save cleaned data
saveRDS(hospital_data, "../data/cleaned_data.rds")
