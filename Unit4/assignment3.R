# --------------------------- #
# R Programming: Assignment 3 #
# --------------------------- #

# load data
outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
hospitals <- read.csv("hospital-data.csv", colClasses = "character")

# understand the data
# print("Outcomes")
# dim(outcomes)
# names(outcomes)
# summary(outcomes)
# str(outcomes)

# plot
outcomes[,11] <- as.numeric(outcomes[,11])
hist(outcomes[,11])

# Assignment part 1: Best
best <- function(state, outcome){
  # read outcome data
  # check that state and outcome are valid
  # return hospital name with lowest 30-day death
  
}


