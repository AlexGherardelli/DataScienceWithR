# Write a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The function should return a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0. A prototype of this function follows


corr <- function(directory,threshold = 0) {
  # create vector
  output = numeric()
  path <- paste0(getwd(), "/",directory)
  # read file
  for (file in list.files(path, full.names = TRUE)){
    tmp <- read.csv(file)
    tmp <-na.omit(tmp)
    nobs <- nrow(tmp)
    if (nobs > threshold){
      correlations <- cor(tmp$sulfate, tmp$nitrate)
      output <- c(output, correlations)
    } 
    else{
      NULL
    }
  
  }
  output
}

corr("testdata")

  
  