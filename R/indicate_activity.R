#' Ploting your activity.
#' 
#' @import ggplot2
#' @param df data frame.
indicate_activity <- function(df) {
  ggplot(df, aes(x = mdate, y = point)) + 
    geom_bar(stat = "identity", aes(fill = factor(class))) + 
    scale_fill_manual(values = c("#eeeeee", "#d6e685", "#8cc665", "#44a340", "#1e6823")) +
    theme_bw() +
    theme(legend.position  = "none",
          panel.grid.major = element_blank(),
          axis.text.x      = element_text(angle = 45, hjust = 1))
}