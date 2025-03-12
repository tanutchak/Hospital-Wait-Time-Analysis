library(readr)
library(dplyr)
library(lubridate)
library(hms)

# Create data directory if it doesn’t exist
dir.create("../data", showWarnings = FALSE)

# Load data
hospital_data <- read_csv("../data/hospital_data.csv")

# Clean and prepare data
hospital_data <- hospital_data %>%
  mutate(
    EntryTime = hms::as_hms(EntryTime),
    PostConsultationTime = hms::as_hms(PostConsultationTime),
    CompletionTime = hms::as_hms(CompletionTime),
    Date = as.Date(Date),
    Wait_Time_Minutes = as.numeric(difftime(PostConsultationTime, EntryTime, units = "mins"))
  ) %>%
  filter(!is.na(Wait_Time_Minutes) & Wait_Time_Minutes >= 0)

# Save cleaned data
saveRDS(hospital_data, "../data/cleaned_data.rds")