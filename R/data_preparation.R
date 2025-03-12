library(dplyr)
library(lubridate)
hospital_data <- read.csv("data/hospital_patient_data.csv") %>%
  mutate(Wait_Time_Minutes = as.numeric(difftime(hms::as_hms(Post_Consultation_Time), hms::as_hms(Entry_Time), units = "mins")))
