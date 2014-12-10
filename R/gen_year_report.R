#' plot whole year activity.
#' 
#' @import dplyr
#' @export
gen_year_report <- function (df.point, df.mo, df.year, tmp) {
  
  df.point <- gen_report()
  df.point$Date <- as.Date(df.point$Date)
  
  # generate 365 days dataframe
  df.mo <- seq(as.Date("2014-01-01"), as.Date("2014-12-31"), by="days") %>%
    str_sub(start = 1, end =10) %>%
    as.factor() %>%
    as.data.frame()
  df.mo <- mutate(df.mo,
                 Date = as.Date(.),
                 Day = weekdays(Date, abbreviate = T),
                 Week = format(Date, "%U"),
                 Qt  = quarters.Date(.))
  
  # merge 2 tables
  df.year <- left_join(df.mo, df.point)
  
  tmp <- substr(df.year$Date, 9, 10) # get DD
  tmp <- as.numeric(tmp) %% 7
  
  df.year$date_of_week <- ifelse(tmp == 0,7, tmp)
  return(df.year)
}