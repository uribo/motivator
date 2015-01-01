#' Visualize GitHub Contribution.
#' 
#' @import dplyr
#' @import ggplot2
#' @import rvest
#' @export
indicate_gh_contribution <- function (username) {
  url <- html(paste("https://github.com/users", username, "contributions", sep = "/"))
  
  Point <- url %>% 
    html_nodes("svg g rect") %>%
    html_attr("data-count") %>%
    as.numeric()
  
  Date <- url %>%
    html_nodes("svg g rect") %>%
    html_attr("data-date")
  
  df.gh <- cbind(Date, Point) %>%
    as.data.frame() %>%
    mutate(
      Point = as.numeric(levels(Point)[Point]),
      Date  = as.Date(Date),
      Day   = as.factor(weekdays(Date, abbreviate = T)),
      Week  = format(Date, "%U"),
      Qt    = quarters.Date(Date),
      Class = ifelse(Point == 0, 0,
              ifelse(Point / max(Point) < 0.25, 1,
              ifelse(Point / max(Point) <= 0.50, 2,
              ifelse(Point / max(Point) <= 0.75, 3, 4)))))
  
  df.gh$Day %<>%  factor(levels = c("Sat", "Fri", "Thu", "Wed", "Tue", "Mon", "Sun"))
  
  ggplot(df.gh, 
         aes(x = Week, y = Day, 
             fill = factor(Class))) +
    geom_tile(color = "white", size = 1) +
    scale_fill_manual(values = c("#eeeeee", "#d6e685", "#8cc665", "#44a340", "#1e6823")) +
    coord_fixed(ratio = 8 / 10) +
    theme(legend.position  = "none",
          panel.grid.major = element_blank(),
          axis.text.x      = element_text(angle = 45, hjust = 1))
}