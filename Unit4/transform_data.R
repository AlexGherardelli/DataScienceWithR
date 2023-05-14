transform_data <- function(state, outcome){
  # read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  # check that state is valid
  if (!(state %in% data$State)) stop("Invalid state")
  # check if outcome is valid
  if (!(outcome %in% c("heart attack", "heart failure", "pneumonia"))){
    stop("Invalid Outcome")
  }
  
  # create subset
  outcomes <- as.data.frame(cbind(
    data[, 2], # hospital name
    data[, 7], # state
    data[, 11], # heart attack
    data[, 17], # heart failure
    data[, 23], # pneumonia
    stringsAsFactors = FALSE
  ))
  
  # rename column into something more manageable
  selected_columns <- c("hospital name", "State", "heart attack", "heart failure", "pneumonia")
  
  colnames(outcomes) <- selected_columns
  
  
  # convert columns to numeric and remove NAs
  outcomes[3:5] <- lapply(outcomes[3:5], FUN = function(col){ 
    suppressWarnings(as.numeric(col))})
  
  # outcomes <- na.omit(outcomes)
  
  outcomes
}

transform_data2 <- function(outcome){
  # read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  # check if outcome is valid
  if (!(outcome %in% c("heart attack", "heart failure", "pneumonia"))){
    stop("Invalid Outcome")
  }
  
  # create subset
  outcomes <- as.data.frame(cbind(
    data[, 2], # hospital name
    data[, 7], # state
    data[, 11], # heart attack
    data[, 17], # heart failure
    data[, 23], # pneumonia
    stringsAsFactors = FALSE
  ))
  
  # rename column into something more manageable
  selected_columns <- c("hospital name", "State", "heart attack", "heart failure", "pneumonia")
  
  colnames(outcomes) <- selected_columns
  
  
  # convert columns to numeric and remove NAs
  outcomes[3:5] <- lapply(outcomes[3:5], FUN = function(col){ 
    suppressWarnings(as.numeric(col))})
  
  # outcomes <- na.omit(outcomes)
  
  outcomes
}

