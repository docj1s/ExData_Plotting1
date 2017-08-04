############################################################################################
# plot1.r File Description:
#
# This script will perform the following steps on the UC Irvine Machine Learning Repository
#
# 1. Create a histogram plot covering 2 days of data (Feb 1, 2007 to Feb 2, 2007)
#
# Note: Data file must be in the working directory
############################################################################################


plot1 <- function()
{
  #load the data
  df <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
  #subset the data for the specified dates
  subData <- df[which(df$Date == "1/2/2007" | df$Date == "2/2/2007"),]

  #create plot
  hist(subData$Global_active_power, xlab="Global Active Power (kilowatts)", col="Red", main ="Global Active Power")
  
  #save plot to png file
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
}
