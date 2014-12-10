#' Ploting your activity.
#' 
#' @import ggplot2
#' @import RColorBrewer
#' @export 
indicate_activity <- function (df.point) {
  ggplot(df.point, aes(x = Date, y = Point)) + 
    geom_bar(stat="identity", aes(fill = factor(Class))) + 
    scale_fill_brewer(palette="YlGn") +
    theme_bw() +
    theme(legend.position = "none",
          panel.grid.major = element_blank())
}