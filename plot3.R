# Install packages
library(lubridate)

# Read the data from the text file and subset the data from the dates of interest
data <- read.csv("./EAWk1/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
qdata <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

# Transform Time and Date from characters into Date and POSIXct objects
qdata$Date <- as.Date(qdata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(qdata$Date), qdata$Time)
qdata$Datetime <- as.POSIXct(datetime)

# Plot the data to PNG
png("./EAWk1/plot3.png", width=480, height=480)
with(qdata, plot(Sub_metering_1~Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab=""))
lines(qdata$Sub_metering_2~qdata$Datetime,col='Red')
lines(qdata$Sub_metering_3~qdata$Datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()