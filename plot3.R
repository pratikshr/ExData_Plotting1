## First, copy the path of the file and assign it to an object
filepath <- "./project1/household_power_consumption.txt"

##Grab the data and subset the useful bits
data <- read.table(filepath, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec =".")
dataSubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(dataSubset$Date, dataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
s1 <- as.numeric(dataSubset$Sub_metering_1)
s2 <- as.numeric(dataSubset$Sub_metering_2)
s3 <- as.numeric(dataSubset$Sub_metering_3)

#Plotting
png("plot3.png")
plot(datetime, s1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, s2, type="l", col="red")
lines(datetime, s3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))
dev.off()
