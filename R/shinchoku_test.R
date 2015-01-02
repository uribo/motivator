#' What about SHINCHOKU
#' 
#' @import magrittr
#' @import stringr
#' @import yeah
#' @param goal
#' @export
shinchoku_test <- function (goal, num = 1) {
  if(file.exists(".gitignore") == TRUE) {
    commit <- system("git log --since='$(date +'%Y-%m-%d') 00:00:00' --no-merges --oneline | wc -l", 
                     intern = T) %>%
      str_trim() %<>% as.numeric()
    
    doudesuka(num = num)
    Sys.sleep(2.0)
    print(paste("Today's commit activity is...", commit, 
                ifelse(commit < goal,
                       c("Never give up x("), c("So nice! Keep it up :)")), 
                sep = " "))
  } else {
    print("sorry, absence .git directly.")
  }
}