library(readr) # to load the data and write the data
library(dplyr) # to transfrom the data

tests_data <- readr::read_csv(
  "https://raw.githubusercontent.com/dsbbfinddx/FINDCov19TrackerData/master/automated/segregated_tests.csv")

today <- format(Sys.time(), "%Y-%m-%d")

tests_data_today <- tests_data %>%

  filter(date == today) %>%

  select(country, tests_cumulative, pcr_tests_cum, rapid_test_cum)

tests_corrected_today <- tests_data %>%
  filter(date == today) %>%
  select(pcr_tests_cum_corrected, rapid_test_cum_corrected)

readr::write_csv(tests_corrected_today, "data/tests_today.csv")
