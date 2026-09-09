library(tidyverse)
library(tidycensus)

# Race and ethnicity variables from the 2020 Decennial Census (Table P2)
# P2 isolates Hispanic/Latino origin and breaks down non-Hispanic groups by race
race_vars <- c(
  total = "P2_001N",
  hispanic = "P2_002N",
  white = "P2_005N",
  black = "P2_006N",
  asian = "P2_008N",
  aian = "P2_007N",
  nhpi = "P2_009N",
  other = "P2_010N",
  two_or_more = "P2_011N"
)

# Download race and ethnicity data by tract for Sarasota County, Florida
sarasota_race <- get_decennial(
  geography = "tract",
  variables = race_vars,
  state = "FL",
  county = "Sarasota",
  year = 2020,
  geometry = TRUE,
  output = "wide"
)

# Save the dataset for your analysis
write_rds(sarasota_race, "sarasota_race.rds")
