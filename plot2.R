############################################################################################
# plot2.r File Description:
#
# This script will perform the following steps on the UC Irvine Machine Learning Repository
#
# 1. Create a plot covering 2 days of data (Feb 1, 2007 to Feb 2, 2007)
#
# Note: Data file must be in the working directory
############################################################################################

plot2 <- function()
{
  #load data
  df <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
  #subset data for the specified dates
  subData <- df[which(df$Date == "1/2/2007" | df$Date == "2/2/2007"),]
  
  #create a vector that will be used for the x-axis (not the best way, but it works!)
  dataLength <- length(subData$Date)
  timeVec <- 1:dataLength 
  newSubData <- cbind(timeVec, subData)
  
  #plot data and format graph
  plot(newSubData$timeVec, newSubData$Global_active_power, type="l", xaxt="n", ylab="Global Active Power", xlab="")
  axis(side="1", at=c("0", dataLength/2, dataLength), labels = c("Thu", "Fri", "Sat"))

  #save to png file
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
}