#' Ploting your activity.
#' 
#' @import ggplot2
#' @import RColorBrewer
#' @export 
indicate_yr_activity <- function (df.year) {
  ggplot(df.year, 
         aes(x = Week, y = Day, 
             fill = factor(Class))) +
    geom_tile(color = "white", size = 1) +
    scale_fill_brewer(palette = "YlGn") +
    coord_fixed(ratio = 8 / 10) +
    theme(legend.position = "none",
          panel.grid.major = element_blank(),
          axis.text.x = element_text(angle = 45, hjust = 1))
}