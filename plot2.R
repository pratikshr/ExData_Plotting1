## First, copy the path of the file and assign it to an object
filepath <- "./project1/household_power_consumption.txt"

##Grab the data and subset the useful bits
data <- read.table(filepath, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec =".")
dataSubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
GAP <- as.numeric(dataSubset$Global_active_power)
datetime <- strptime(paste(dataSubset$Date, dataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##Plotting as required
png("plot2.png", width=504, height=504)
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
