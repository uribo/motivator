#' Ploting your activity.
#' 
#' @import dplyr
#' @import stringr
#' @export
gen_report <- function (path = getwd(), rfiles, df.point) {
  rfiles <- list_rfiles(path)
  df.point <- data.frame(table(rfiles)) %>%
    rename(Date = rfiles, # name
           Point = Freq)
  
  df.point.na <- filter(df.point, is.na(Point)) %>%
    mutate(Point = 0)
  df.point <- filter(df.point, Point != "NA") %>%
    rbind(df.point.na) %>%
    mutate(Class = ifelse(Point / max(Point) < 0.20, 1,
                          ifelse(Point / max(Point) <= 0.40, 2,
                          ifelse(Point / max(Point) <= 0.60, 3,
                          ifelse(Point / max(Point) <= 0.80, 4, 5)))))
  
  return(df.point)
}