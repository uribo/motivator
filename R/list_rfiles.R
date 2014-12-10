#' List of R and Image files.
#' 
#' @param path a character vector of full path names; the default corresponds to the working directory, getwd().
#' @return The list r and image filenames.
#' @import dplyr
#' @export
#' @note checked 141210
list_rfiles <- function (path = getwd()) { 
  rfiles <- list.files(path = path, include.dirs = TRUE) %>%
    as.data.frame %>%
    filter(grepl(
    ".r$|.R$|.Rmd$|.gif$|.jpg$|.png$|.pdf$", .))
  
  colnames(rfiles) <- c("Filename")
  rfiles$Filename <- as.character(rfiles$Filename)
  
  rfiles <- file.info(paste(rfiles$Filename, sep = "")) %>%
    select(mtime) %>%
    na.omit()
  
  rfiles$mtime <- str_sub(rfiles$mtime, start = 1, end =10)
  rfiles$mtime <- as.factor(rfiles$mtime)
  
  return(rfiles)
}