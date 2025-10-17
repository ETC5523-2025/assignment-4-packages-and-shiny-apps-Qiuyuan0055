# data-raw/clean_hai_data.R
library(tibble)
library(usethis)


df <- BHAI::num_hai_patients

hai_clean <- tibble(
  infection = names(df),
  cases     = as.integer(unname(df)),
  country   = "Germany"
)

usethis::use_data(hai_clean, overwrite = TRUE)
