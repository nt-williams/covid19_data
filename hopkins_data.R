
# Nick Williams
# Research Biostatistician
# Department of Healthcare Policy and Research
# Weill Cornell Medicine

# packages ----------------------------------------------------------------

library(tidyverse)
library(here)
library(xts)

# global ------------------------------------------------------------------

fun_in <- here("functions", "hopkins_data_clean.R")
cc_in <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv"
dths_in <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Deaths.csv"
rcvr_in <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Recovered.csv"

all_US_cc_out <- here("extracted", paste0("daily_confirmed_cases_US_count_", as.character(Sys.Date()), ".csv"))
all_US_dths_out <- here("extracted", paste0("daily_deaths_US_count_", as.character(Sys.Date()), ".csv"))
all_US_rcvr_out <- here("extracted", paste0("daily_recovered_US_count_", as.character(Sys.Date()), ".csv"))
all_USL_cc_out <- here("extracted", paste0("daily_confirmed_cases_US_locale_count_", as.character(Sys.Date()), ".csv"))
all_USL_dths_out <- here("extracted", paste0("daily_deaths_US_locale_count_", as.character(Sys.Date()), ".csv"))
all_USL_rcvr_out <- here("extracted", paste0("daily_recovered_US_locale_count_", as.character(Sys.Date()), ".csv"))

# data import -------------------------------------------------------------

source(fun_in)

. <- map(
  list(
    confirmed_cases = cc_in,
    deaths = dths_in,
    recovered = rcvr_in
  ),
  read_hopkins_covid
)

# cleaning ----------------------------------------------------------------

# extracting total US cases by day
all_US <- map(., pull_US_country)

# extracting US cases by reporting locale by day
all_US_locale <- map(., pull_US_locale)

# export ------------------------------------------------------------------

# total US cases by day
walk2(all_US, 
      list(all_US_cc_out, all_US_dths_out, all_US_rcvr_out), 
      write.csv, row.names = F)

# US cases by locale by day
walk2(all_US_locale, 
      list(all_USL_cc_out, all_USL_dths_out, all_USL_rcvr_out), 
      write.csv, row.names = F)

