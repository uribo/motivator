#' Output your working log.
#'
#' @import ggplot2
#' @import stringr
#' @export
gen_month_report <- function (path = getwd(), tmp.df, tmp.df.month) {
  
  tmp.df <- Sys.Date()
  
  tmp.df.month <- seq(as.Date(paste(
    str_sub(Sys.Date(), start = 1, end = 7), c("01"), sep = "-")), tmp.df, by="days") %>%
    str_sub(start = 1, end =10) %>%
    as.factor() %>%
    as.data.frame()
  
  colnames(tmp.df.month) <-  c("Date")
  tmp.df.month$Date <- as.factor(tmp.df.month$Date)
  
  path <- list_rfiles()
  
  tmp.df <- file.info(
    paste(path[1, ], sep = "")) %>%
    select(contains("time"))
  
  for (i in 1:length(list.files())) {
    tmp.df[i, ] <- file.info(paste(path[i, ], sep = "")) %>%
      select(ctime)
  }
  
  tmp.df <- select(tmp.df, ctime) %>%
    na.omit()
  tmp.df$ctime <- str_sub(tmp.df$ctime, start = 1, end =10) %>%
    as.factor()
  
  tmp.df <- data.frame(table(tmp.df)) %>%
    rename(Date = tmp.df,
           Point = Freq)
  
  out.df <- merge(tmp.df, tmp.df.month, all = T)
  out.df.na <- filter(out.df, is.na(Point)) %>%
    mutate(Point = 0)
  out.df <- filter(out.df, Point != "NA") %>%
    rbind(out.df.na) %>%
    mutate(Class = Point / max(Point))
  # 5段階くらいの評価に...
  out.df <- out.df[with(out.df, order(as.POSIXct(Date))), ]
  out.df$Date <- as.Date(out.df$Date)
  out.df$Day <- weekdays(out.df$Date)
  out.df$quarters <- quarters.Date(out.df$Date)
}