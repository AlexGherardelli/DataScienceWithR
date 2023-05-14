source("transform_data.R")

# Assignment part 1: Best
best <- function(state, outcome){
  # read outcome data
  outcomes <- transform_data(state, outcome)

  # # filter out by state
  by_state <<- subset(outcomes, State == state)

  # sort out columns
  result <- by_state[order(by_state[, outcome], by_state[, "hospital name"]), ]
  
  # return first hospital name
  result[1, 1]
  
}
