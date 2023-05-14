source("transform_data.R")

# Assignment part 2: Rank hospital
rankhospital <- function(state, outcome, num = "best"){
  # read outcome data
  outcomes <- transform_data(state, outcome)
  
  # # filter out by state
  by_state <<- subset(outcomes, State == state)
  
  # by_state <- na.omit(by_state)
  
  # sort out columns
  best <-  by_state[order(by_state[, outcome], by_state[, "hospital name"], decreasing = FALSE), ]
  worst <-  by_state[order(by_state[, outcome], by_state[, "hospital name"], decreasing = TRUE), ]
  
  # return first hospital name
  if(num == "best"){
    best[1, 1]
  }
  else if(num == "worst"){
    worst[1, 1]
  }
  else if (class(num) == "numeric"){
    best[num, 1]
  }
  else{
    stop("Invalid parameter")
  }
}
