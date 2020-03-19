
# Nick Williams
# Research Biostatistician
# Department of Healthcare Policy and Research
# Weill Cornell Medicine

# functions ---------------------------------------------------------------

fix_year <- function(date) {
  
  . <- stringr::str_extract(date, "[[:digit:]]{2}$")
  . <- paste0("20", .)
  . <- stringr::str_replace(date, "[[:digit:]]{2}$", .)
  return(.)
  
}

read_hopkins_covid <- function(fp, nn = c("province_state", "country_region", "lat", "long", "date", "count")) {
  
  raw <- vroom::vroom(fp)
  out <- tidyr::pivot_longer(
    data = raw,
    cols = -c(1:4),
    names_to = "date",
    values_to = "count"
  )
  
  out$date <- fix_year(out$date)
  out$date <- as.Date(out$date, "%m/%d/%Y")
  names(out) <- nn
  return(out)
  
}

pull_US_country <- function(df) {
  . <- df[df$country_region == "US", ]
  . <- dplyr::filter(., !stringr::str_detect(province_state, "\\,"))
  locations <- unique(.$province_state)
  . <- xts::xts(.[, "count"], order.by = .$date)
  . <- xts::apply.daily(.[, "count"], sum)
  . <- data.frame(date = index(.), coredata(.))
  rownames(.) <- NULL
  
  message("Daily US count based on the following locations:\n", paste(locations, collapse = ", "))
  return(.)
}

pull_US_locale <- function(df) {
  
  . <- df[df$country_region == "US", ]
  . <- dplyr::filter(., !stringr::str_detect(province_state, "\\,"))
  
  sep. <- split(., .$province_state)
  sep. <- purrr::map(sep., ~ xts::xts(.x[, "count"], order.by = .x$date))
  sep. <- purrr::map(sep., ~ xts::apply.daily(.[, "count"], sum))
  sep. <- purrr::map(sep., ~ data.frame(date = index(.x), coredata(.x)))
  sep. <- purrr::imap(sep., ~ mutate(.x, reporting = .y))
  . <- reduce(sep., rbind)
  
  return(.)
}

