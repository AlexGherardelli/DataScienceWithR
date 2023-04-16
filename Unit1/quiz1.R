hw1 <- read.csv("D:/Downloads/hw1_data.csv")
hw1[1:2, ]
nrow(hw1) # count rows
tail(hw1, n=2) # extract last two row
hw1$Ozone[47] # value of Ozone in 47th row
sum(is.na(hw1$Ozone)) # count number of NAs
mean(hw1$Ozone, na.rm = TRUE) # mean without NAs
s <- subset(hw1, hw1$Ozone > 31 & hw1$Temp<90, select = Solar.R)
may <- subset(df, df$Month == 5, select = Ozone)
max(may)