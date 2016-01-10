#' plot whole year activity.
#' 
#' @import dplyr
gen_year_report <- function() {
  df_point <- gen_report()
  yr <- Sys.Date() %>% lubridate::year()
  
  # generate 365 days dataframe
  df.mo <- data.frame(Date = seq(as.Date(paste0(yr, "-01-01")), as.Date(paste0(yr, "-12-31")), by = "days")) %>%
    dplyr::mutate(
                 Day  = weekdays(Date, abbreviate = TRUE),
                 Week = format(Date, "%U"),
                 Qt   = quarters.Date(Date)) %>% 
    return(.)
  
  # # merge 2 tables
  # df.year <- left_join(df.mo, df.point)
  # 
  # tmp <- substr(df.year$Date, 9, 10) # get DD
  # tmp <- as.numeric(tmp) %% 7
  # 
  # df.year$date_of_week <- ifelse(tmp == 0, 7, tmp)
  
}