wsbdf <- read.csv("/Users/hannahkayjones/Desktop/Desktop Documents/Matt/Spring/WLA.csv")
wsbyr <- table(wsbdf$X_Year,wsbdf$Result.Field)
wsbyr <- as.data.frame.matrix(wsbyr)
wsbyr$V1 <- NULL
wsbyr$T <- NULL
wsbyr$Road_Winning_Per <- (wsbyr$W)/(
  wsbyr$L + wsbyr$W)
View(wsbyr)
write.csv(wsbyr,file = "YR WSB")

