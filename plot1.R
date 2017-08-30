# Read the data from the text file and subset the data from the dates of interest
data <- read.table("./EAWk1/household_power_consumption.txt", header = TRUE, sep = ";")
qdata <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

# Generate Histogram and Save as PNG
png("./EAWk1/plot1.png", width=480, height=480)
hist(as.numeric(qdata$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()