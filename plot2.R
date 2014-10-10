# plot2.R
# Author: Martin Kuhne
# Summary: plot for week 1 assignment
# cf. https://class.coursera.org/exdata-007/

source("data.R")
library("lubridate") # for parse_date_time

data <- getEnergyData()

# convert date and time from string to date format
data <- mutate(data, dateTime = parse_date_time(paste(Date, Time, sep = " "), "%d%m%y %H%M%S"))

png(file = "plot2.png")

# creating a type "n" plot does not plot data initially
# then draw the lines we need to imitate the reference plot
with(data, 
 {
     plot(dateTime, GlobalActivePower, type="n", 
          ylab = "Global Active Power (kilowatts)",
          xlab = "")
     lines(dateTime, GlobalActivePower)
 })

dev.off()
