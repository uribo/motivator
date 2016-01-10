#' Ploting your activity.
#' 
#' @import dplyr
#' @param path path a character vector of full path names; the default corresponds to the working directory, getwd().
#' @return local data frame.
#' @examples 
#' \dontrun{
#' gen_report()
#' }
#' @export
gen_report <- function(path = getwd()) {
   list_rfiles(path) %>% 
    dplyr::mutate(mdate  = lubridate::floor_date(mtime, unit = "day") %>% as.Date()) %>% 
    dplyr::select(mdate) %>%
    dplyr::group_by(mdate) %>% 
    dplyr::summarise(point = n()) %>% 
    dplyr::right_join(., 
                      data.frame(mdate = seq(min(.$mdate), max(.$mdate), by = 1))) %>% 
    dplyr::mutate(class = ifelse(is.na(point), 0,
                                 ifelse(point / max(point, na.rm = TRUE) < 0.25, 1,
                                        ifelse(point / max(point, na.rm = TRUE) <= 0.50, 2,
                                               ifelse(point / max(point, na.rm = TRUE) <= 0.75, 3, 4))))) %>% 
    return(.)
}