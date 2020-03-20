
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

cntrys <- levels(as.factor(.$confirmed_cases$country_region))
names(cntrys) <- cntrys
has_locale <- c("Australia", "Canada", "China", "Cruise Ship", "Denmark", "France", "Netherlands", "United Kingdom", "US")
names(has_locale) <- has_locale

# extracting total country cases by day
all_cntrys <-
  map(., function(x)
    map(cntrys, function(y)
      pull_country(x, y)))

# extracting total cases by country reporting locale by day
specific_cntry_locale <-
  map(., function(x)
    map(has_locale, function(y)
      pull_country_locale(x, y)))

# export ------------------------------------------------------------------

# country level confirmed cases by day
iwalk(all_cntrys$confirmed_cases, 
      export_hopkins_data, locale = FALSE, type = "confirmed_cases")

# country level deaths by day
iwalk(all_cntrys$deaths, 
      export_hopkins_data, locale = FALSE, type = "deaths")

# country level recoveries by day
iwalk(all_cntrys$recovered, 
      export_hopkins_data, locale = FALSE, type = "recovered")

# country locale confirmed cases by day
iwalk(specific_cntry_locale$confirmed_cases, 
      export_hopkins_data, locale = TRUE, type = "confirmed_cases")

# country locale deaths by day
iwalk(specific_cntry_locale$deaths, 
      export_hopkins_data, locale = TRUE, type = "deaths")

# country locale recoveries by day
iwalk(specific_cntry_locale$recovered, 
      export_hopkins_data, locale = TRUE, type = "recovered")


