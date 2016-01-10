#' Output your working log.
#'
gen_month_report <- function() {
  
  tmp_df_month <- data.frame(Date = seq(Sys.Date() %>% update(day = 1), 
                                        paste(Sys.Date() %>% lubridate::year(),
                                              Sys.Date() %>% lubridate::month(),
                                              Sys.Date() %>% lubridate::floor_date("month") %>% lubridate::days_in_month(), sep = "-") %>% as.Date(), 
                                        by = 1))
  # path <- list_rfiles()
  # 
  # 
  # for (i in 1:length(list.files())) {
  #   tmp.df[i, ] <- file.info(paste(path[i, ], sep = "")) %>%
  #     select(ctime)
  # }
  # 
  # tmp.df <- select(tmp.df, ctime) %>%
  #   na.omit()
  # tmp.df$ctime <- str_sub(tmp.df$ctime, start = 1, end =10) %>%
  #   as.factor()
  # 
  # tmp.df <- data.frame(table(tmp.df)) %>%
  #   rename(Date = tmp.df,
  #          Point = Freq)
  # 
  # out.df <- merge(tmp.df, tmp.df.month, all = T)
  # out.df.na <- filter(out.df, is.na(Point)) %>%
  #   mutate(Point = 0)
  # out.df <- filter(out.df, Point != "NA") %>%
  #   rbind(out.df.na) %>%
  #   mutate(Class = Point / max(Point))
  # # 5段階くらいの評価に...
  # out.df <- out.df[with(out.df, order(as.POSIXct(Date))), ]
  # out.df$Date <- as.Date(out.df$Date)
  # out.df$Day <- weekdays(out.df$Date)
  # out.df$quarters <- quarters.Date(out.df$Date)
}