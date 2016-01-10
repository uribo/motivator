#' Visualize GitHub Contribution.
#' 
#' @import dplyr
#' @import rvest
#' @import ggplot2
#' @param username character. Display user name (GitHub account).
#' @details
#' \if{html}{
#' \out{<div style="text-align: center">}\figure{indicate-gh-contribution.png}{options: style="width:750px;max-width:90\%;"}\out{</div>}
#' }
#' \if{latex}{
#' \out{\begin{center}}\figure{indicate-gh-contribution.png}\out{\end{center}}
#' }
#' @export
#' @examples 
#' \dontrun{
#' indicate_gh_contribution(username = "uribo")
#' 
#' track_url %>% purrr::flatmap(get_sc_artwork, ci)
#' }
indicate_gh_contribution <- function(username = getOption("github.user")) {
  
  xml2::read_html(paste("https://github.com/users", username, "contributions", sep = "/")) %>%
    rvest::html_nodes(., css = "svg g rect") %>% {
      Point    <<-
        rvest::html_attr(., name = "data-count") %>% as.numeric()
      Date     <<- rvest::html_attr(., "data-date")
      Vitality <<- rvest::html_attr(., "fill")
    }
  
  df_gh <- cbind(Date, Point, Vitality) %>%
    as.data.frame() %>%
    dplyr::mutate(
      Point    = as.numeric(levels(Point)[Point]),
      Date     = as.Date(Date),
      Day      = weekdays(Date, abbreviate = TRUE) %>% factor(levels = c("Sat", "Fri", "Thu", "Wed", "Tue", "Mon", "Sun"),
                                                              labels  = c("Sat", "Fri", "Thu", "Wed", "Tue", "Mon", "Sun"),
                                                              ordered = TRUE),
      Week     = paste(lubridate::year(Date), format(Date, "%U"), sep = "-"),
      Qt       = quarters.Date(Date),
      Vitality = as.character(Vitality))
  
  df_gh %>% ggplot(aes(x = Week, y = Day)) +
    geom_tile(fill = Vitality, color = "white", size = 1) +
    scale_fill_manual(values = Vitality) +
    coord_fixed(ratio = 1) +
    theme(
      legend.position  = "none",
      panel.grid.major = element_blank(),
      axis.text.x      = element_text(angle = 45, hjust = 1),
      plot.title       = element_blank()
    )
  # ggsave("man/figures/indicate-gh-contribution.png", width = 8, height = 3)
}
