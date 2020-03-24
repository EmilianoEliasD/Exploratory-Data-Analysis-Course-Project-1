###
###     Exploratory Graphing - Global Active Power
###     Emiliano Elias Dena
###

###     Library 
library("data.table")

###     Download Data
download <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "temp")
unzip("temp")
unlink("temp")


###     Clean Data
hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
hpc$dt <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc_sub <- subset(hpc, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

###     Plot 2
png("plot2.png", width=480, height=480)
plot(hpc_sub$dt, hpc_sub$Global_active_power, 
     type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()