# plot3.R
# Author: Martin Kuhne
# Summary: plot for week 1 assignment
# cf. https://class.coursera.org/exdata-007/

source("data.R")
library("lubridate") # for parse_date_time

data <- getEnergyData()

# convert date and time from string to date format
data <- mutate(data, dateTime = parse_date_time(paste(Date, Time, sep = " "), "%d%m%y %H%M%S"))

png(file = "plot3.png")

with(data, 
{
    plot(dateTime, SubMetering1, type="n", 
         ylab = "Energy sub metering",
         xlab = "")
    lines(dateTime, SubMetering1, col="black")
    lines(dateTime, SubMetering2, col="red")
    lines(dateTime, SubMetering3, col="blue")
    legend("topright", lty=1,
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"),
           col=c("black", "red", "blue"))
})

dev.off()
