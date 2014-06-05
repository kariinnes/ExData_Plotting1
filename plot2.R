#Open png device
png(filename = "plot2.png",
    width = 480, height = 480)

#Install data table package
library(data.table)

#Read data file
data <- fread("./ExploratoryDataAnalysis/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

#Subset data to the two day timeframe in 2007
plot.data <- subset(data, as.Date(data$Date, format = "%d/%m/%Y") >= "2007-02-01"
                    &  as.Date(data$Date, format = "%d/%m/%Y") < "2007-02-03") 

#Combine date and time and formate
date <- paste(as.Date(plot.data$Date, format = "%d/%m/%Y"), plot.data$Time)
date <- strptime(date, "%Y-%m-%d %H:%M:%S")

#Plot with title, label requirements
plot(date, as.numeric(plot.data$Global_active_power),type = 'l',
     xlab = " ", ylab = "Global Active Power (kilowatts)")

dev.off()