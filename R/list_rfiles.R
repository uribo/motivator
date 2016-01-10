#' List of R and Image files.
#' 
#' @import dplyr
#' @param path a character vector of full path names; the default corresponds to the working directory, getwd().
#' @return local data frame. Contains r and image filenames.
#' @export
#' @note checked 2016-01-10
list_rfiles <- function(path = getwd()) {
  list.files(path = path,
             recursive = TRUE,
             pattern = "(.r$|.R$|.Rmd$|.gif$|.jpg$|.png$|.pdf$)") %>%
    as.data.frame() %>%
    dplyr::rename_(file_path = ".") %>%
    dplyr::mutate(
      file_path = as.character(file_path),
      file_name = gsub(".+/|.+/.+%", "", file_path),
      mtime     = file.mtime(file_path)
    ) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(size = file.size(file_path) %>% utils:::format.object_size(units = "auto")) %>%
    dplyr::ungroup() %>%
    return(.)
}
