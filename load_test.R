library(readr) # to load the data and write the data
library(dplyr) # to transfrom the data

tests_data <- readr::read_csv(
  "https://raw.githubusercontent.com/dsbbfinddx/FINDCov19TrackerData/master/automated/segregated_tests.csv")

today <- format(Sys.time(), "%Y-%m-%d")

tests_data_today <- tests_data %>%

  filter(date == today) %>%

  select(tests_cumulative, pcr_tests_cum, rapid_test_cum)

readr::write_csv(tests_data_today, "data/tests_today.csv")