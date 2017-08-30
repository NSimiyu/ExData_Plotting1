# Read the data from the text file and subset the data from the dates of interest
data <- read.table("./EAWk1/household_power_consumption.txt", header = TRUE, sep = ";")
qdata <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

# Convert Date and Time
qdata$Date <- as.Date(qdata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(qdata$Date), qdata$Time)
qdata$Datetime <- as.POSIXct(datetime)

# Plot graph to PNG and annotate
png("./EAWk1/plot2.png", width=480, height=480)
plot(qdata$Time,as.numeric(as.character(qdata$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
dev.off()