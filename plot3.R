############################################################################################
# plot3.r File Description:
#
# This script will perform the following steps on the UC Irvine Machine Learning Repository
#
# 1. Create a plot covering 2 days of data (Feb 1, 2007 to Feb 2, 2007)
#
# Note: Data file must be in the working directory
############################################################################################

plot3 <- function()
{
  #load data
  df <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
  #subset data for specified dates
  subData <- df[which(df$Date == "1/2/2007" | df$Date == "2/2/2007"),]
  
  #create a vector for x-axis
  dataLength <- length(subData$Date)
  timeVec <- 1:dataLength
  newSubData <- cbind(timeVec, subData)
  
  #plot and format the data
  png("plot3.png") #this preserves the proper size for the legend
 
  plot(newSubData$timeVec, newSubData$Sub_metering_1, type = "l", xaxt="n", ylab="Energy Sub Meeting", xlab="")
  lines(newSubData$timeVec, newSubData$Sub_metering_2, col="Red")
  lines(newSubData$timeVec, newSubData$Sub_metering_3, col="Blue")
  
  axis(side="1", at=c("0", dataLength/2, dataLength), labels = c("Thu", "Fri", "Sat"))
  legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  dev.off()
}