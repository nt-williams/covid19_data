
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




