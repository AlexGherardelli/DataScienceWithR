source("transform_data.R")

# Assignment part 2: Rank hospital
rankall <- function(outcome, num = "best"){
  # read outcome data
  all_hospitals <<- transform_data2(outcome)
  
  # get hospitals divided by state
  hospitals_by_state <<- split(all_hospitals, all_hospitals$State)
  
  get_rank <- function(el, ...) {
    # sort out columns
    best <-  el[order(el[, outcome], el[, "hospital name"], decreasing = FALSE), ]
    worst <-  el[order(el[, outcome], el[, "hospital name"], decreasing = TRUE), ]
    
    # return first hospital name
    if(num == "best"){
      return(best[1, 1])
    }
    else if(num == "worst"){
      return(worst[1, 1])
    }
    else{
      return(best[num, 1])
    }
  }

  # rank 
  rank_by_state <- lapply(hospitals_by_state, get_rank, el)
  
  result <<- data.frame(hospital = unlist(rank_by_state), state = names(rank_by_state))
  
  
  
}

#data.frame(best[1, 1:2])
