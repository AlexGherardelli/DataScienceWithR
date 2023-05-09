# Assignment part 1: Best
best <- function(state, outcome){
  # read outcome data
  outcomes[, 11] <- as.numeric(outcomes[,11])

  # check that state and outcome are valid
  if (!(outcome %in% c("heart attack", "heart failure", "pneumonia")) | !(state %in% outcome$State)) {
    stop("Invalid Outcome")
  }
  

  # return hospital name with lowest 30-day death
  
}
