## First, copy the path of the file and assign it to an object
filepath <- "./project1/household_power_consumption.txt"

##Grab the data and subset the useful bits
data <- read.table(filepath, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec =".")
dataSubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
GAP <- as.numeric(dataSubset$Global_active_power)

##Plotting the data as necessary
png("plot1.png", width=504, height=504)
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
