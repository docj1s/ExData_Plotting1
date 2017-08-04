############################################################################################
# plot4.r File Description:
#
# This script will perform the following steps on the UC Irvine Machine Learning Repository
#
# 1. Create a plot covering 2 days of data (Feb 1, 2007 to Feb 2, 2007)
#
# Note: Data file must be in the working directory
############################################################################################

plot4<-function()
{
  #load data
  df <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
  #subset the data for specified dates
  subData <- df[which(df$Date == "1/2/2007" | df$Date == "2/2/2007"),]
  
  #create a vector for the x-axis
  dataLength <- length(subData$Date)
  timeVec <- 1:dataLength
  newSubData <- cbind(timeVec, subData)
  
  #plot and format the graphs
  png("plot4.png")
  
  par(mfrow = c(2,2))
  
  plot(newSubData$timeVec, newSubData$Global_active_power, type="l", xaxt="n", ylab="Global Active Power", xlab="")
  axis(side="1", at=c("0", dataLength/2, dataLength), labels = c("Thu", "Fri", "Sat"))

  plot(newSubData$timeVec, newSubData$Voltage, type="l", xaxt="n", ylab="Voltage", xlab="")
  axis(side="1", at=c("0", dataLength/2, dataLength), labels = c("Thu", "Fri", "Sat"))

  plot(newSubData$timeVec, newSubData$Sub_metering_1, type = "l", xaxt="n", ylab="Energy Sub Meeting", xlab="")
  lines(newSubData$timeVec, newSubData$Sub_metering_2, col="Red")
  lines(newSubData$timeVec, newSubData$Sub_metering_3, col="Blue")
  axis(side="1", at=c("0", dataLength/2, dataLength), labels = c("Thu", "Fri", "Sat"))
  legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(newSubData$timeVec, newSubData$Global_reactive_power, type="l", xlab="datetime", xaxt="n", ylab="Global_reactive_power")
  axis(side="1", at=c("0", dataLength/2, dataLength), labels = c("Thu", "Fri", "Sat"))
  
  dev.off()
  
}