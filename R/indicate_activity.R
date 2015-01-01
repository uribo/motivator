#' Ploting your activity.
#' 
#' @import ggplot2
#' @import RColorBrewer
#' @export 
indicate_activity <- function (df.point) {
  ggplot(df.point, aes(x = Date, y = Point)) + 
    geom_bar(stat="identity", aes(fill = factor(Class))) + 
    scale_fill_manual(values = c("#eeeeee", "#d6e685", "#8cc665", "#44a340", "#1e6823")) +
    theme_bw() +
    theme(legend.position  = "none",
          panel.grid.major = element_blank(),
          axis.text.x      = element_text(angle = 45, hjust = 1))
}