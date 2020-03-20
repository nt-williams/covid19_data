
<!-- README.md is generated from README.Rmd. Please edit that file -->

# COVID-19 data extraction task

<!-- badges: start -->

<!-- badges: end -->

The goal of this project is to automate daily extraction and cleaning of
COVID-19 data. Currently the data processed is the publicly available
data through John’s Johns Hopkins University Center for Systems Science
and Engineering [COVID-19 data
repository](https://github.com/CSSEGISandData/COVID-19) and is parsed
into more locale specific files.

R scripts are automatically run at 12:00 PM Eastern Standard Time and
cleaned data files are automatically uploaded to the `extracted` folder.

**Data file
summaries**

| Description                                                                                                                                 | File link                                                                                                                          |
| ------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| Daily counts of confirmed cases for the aggregate United States                                                                             | <https://raw.githubusercontent.com/nt-williams/covid19_data/master/extracted/daily_confirmed_cases_US_count_2020-03-19.csv>        |
| Daily counts of deaths for the aggregate United States                                                                                      | <https://raw.githubusercontent.com/nt-williams/covid19_data/master/extracted/daily_deaths_US_count_2020-03-19.csv>                 |
| Daily counts of recoveries for the aggregate United States                                                                                  | <https://raw.githubusercontent.com/nt-williams/covid19_data/master/extracted/daily_recovered_US_count_2020-03-19.csv>              |
| Daily counts of confirmed cases for the United States at the state level (includes Puerto Rico, Gaum, and the Diamond Princess cruise ship) | <https://raw.githubusercontent.com/nt-williams/covid19_data/master/extracted/daily_confirmed_cases_US_locale_count_2020-03-19.csv> |
| Daily counts of deaths for the United States at the state level (includes Puerto Rico, Gaum, and the Diamond Princess cruise ship)          | <https://raw.githubusercontent.com/nt-williams/covid19_data/master/extracted/daily_deaths_US_locale_count_2020-03-19.csv>          |
| Daily counts of recoveries for the United States at the state level (includes Puerto Rico, Gaum, and the Diamond Princess cruise ship)      | <https://raw.githubusercontent.com/nt-williams/covid19_data/master/extracted/daily_recovered_US_locale_count_2020-03-19.csv>       |
