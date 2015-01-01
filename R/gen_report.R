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
    mutate(Class = ifelse(Point == 0, 0,
                   ifelse(Point / max(Point) < 0.25, 1,
                   ifelse(Point / max(Point) <= 0.50, 2,
                   ifelse(Point / max(Point) <= 0.75, 3, 4)))))
  
  return(df.point)
}