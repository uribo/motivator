#' Ploting your activity.
#' 
#' @import ggplot2
#' @import RColorBrewer
#' @export 
indicate_yr_activity <- function (df.year) {
  
  df.year$Day %<>%  factor(levels = c("Sat", "Fri", "Thu", "Wed", "Tue", "Mon", "Sun"))
  
  ggplot(df.year, 
         aes(x = Week, y = Day, 
             fill = factor(Class))) +
    geom_tile(color = "white", size = 1) +
    scale_fill_manual(values = c("#eeeeee", "#d6e685", "#8cc665", "#44a340", "#1e6823")) +
    coord_fixed(ratio = 8 / 10) +
    theme(legend.position  = "none",
          panel.grid.major = element_blank(),
          axis.text.x      = element_text(angle = 45, hjust = 1))
}