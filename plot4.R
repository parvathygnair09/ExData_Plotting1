## plot4.R

## This code reads the household electric power consumption data, subsets it to the time frame for the analysis, and creats the plot.

## Code for reading data into the working directory.

# setwd(<directory name>)
if(!file.exists("./data")) { dir.create("./data")}
con <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
library(downloader)
download(con, dest = "./data/projectdata.zip")
unzip("./data/projectdata.zip", list = TRUE)
pwr <- read.table(unz("./data/projectdata.zip","household_power_consumption.txt"), 
                  sep = ";", 
                  header = TRUE, 
                  stringsAsFactors = FALSE,
                  na.strings = "?")
head(pwr)


## plot4.png

png(filename = "plot4.png")
par(mfrow = c(2,2))
with(sub, {
        plot(date2, as.numeric(Global_active_power), type = "l", ylab = "Global Active Power", xlab = NA)
        plot(date2, as.numeric(Voltage), type = "l", ylab = "Voltage", xlab = "datetime")
})
with(sub, {
        plot(date2, as.numeric(Sub_metering_1), type = "l", xlab = NA, ylab = "Energy sub metering")
        lines(date2, as.numeric(Sub_metering_2), type = "l", col = "red")
        lines(date2, as.numeric(Sub_metering_3), type = "l", col = "blue")
        legend("topright", bty = "n", lty = c(1, 1, 1), col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), inset = 0)
})
with(sub,plot(date2, as.numeric(Global_reactive_power), type = "l", ylab = "Global_reactive_power", xlab = "datetime"))
dev.off()
