#' What about SHINCHOKU
#' 
#' @param goal interger.
#' @param num integer. select yeah voice.
#' @examples 
#' \dontrun{
#' shinchoku_test(goal = 10, num = 3)
#' }
#' @export
shinchoku_test <- function(goal = 1, num = 1) {
  if (file.exists(".gitignore") == FALSE) {
    print("Sorry, absence .git directly.\nIf you want initialize repositiory, try git2r::init().")
  } else {
    commit <- system("git log --since='$(date +'%Y-%m-%d') 00:00:00' --no-merges --oneline | wc -l", 
                     intern = TRUE) %>%
      tidyr::extract_numeric()

    yeah::doudesuka(num = num)
    
    Sys.sleep(2.0)
    
    message(paste("Today's commit activity is...", commit, ".",
                ifelse(commit < goal,
                       c("\nWhy don't you do your best?"), c("\nSo nice! Keep it up :)")), 
                sep = " "))
  }
}