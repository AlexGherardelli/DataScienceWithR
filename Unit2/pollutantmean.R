# Helper functions
read_files <- function(directory, id){
  df <- data.frame()
  dirname <- paste0(directory, "/")
  for(i in 1:length(id)){
    add <- read.csv(as.character(paste0(dirname, sprintf("%03d",id[i]),".csv")))
    df <- rbind(df,add)
  }
  colnames(df) <- c("Date","sulfate","nitrate","ID")
  
  df
}

# Part 1: Pollutant Mean
pollutantmean <- function(directory, pollutant, id = 1:332){
  # p1: reads selected id files from directory into df
  df <- read_files(directory, id)
    
  # p2: return the mean (without NAs) of selected pollutant
  mean(df[[pollutant]], na.rm = TRUE)
    }

# Part 2: Complete
complete <- function(directory,id=1:332){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV filenames
  
  ## 'id' is an integer vector containing the monitor ID numbers to be Used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2 1047
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  df <- data.frame()
  dirname <- paste0(directory, "/")
  for(i in 1:length(id)){
    tmp <- read.csv(as.character(paste0(dirname, sprintf("%03d",id[i]),".csv")))
    tmp <- na.omit(tmp)
    nobs <- nrow(tmp)
    df <- rbind(df, data.frame(i, nobs))
  }
  colnames(df) <- c("ids", "nobs")
  
  df
}

