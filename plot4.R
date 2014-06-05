#Open png device
png(filename = "plot4.png",
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

par(mfrow = c(2,2))
par(mar = c(4,4,3,1))

#Plot 1
plot(date, as.numeric(plot.data$Global_active_power), type = 'l',  
     xlab = " ",
     ylab = "Global Active Power")

#Plot 2
plot(date, as.numeric(plot.data$Voltage), type = 'l', 
     xlab = "datetime",
     ylab = "Voltage")

#Plot 3
plot(date, as.numeric(plot.data$Sub_metering_1),type = 'n',
     xlab = " ", ylab = "Energy sub metering")

lines(date, as.numeric(plot.data$Sub_metering_1),col="black")
lines(date, as.numeric(plot.data$Sub_metering_2),col="red")
lines(date, as.numeric(plot.data$Sub_metering_3),col="blue")     

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), #text for legend
lty = c(1,1,1),  # gives the legend line symbols
col=c("black", "blue","red"), bty = "n")  

#Plot 4
plot(date, as.numeric(plot.data$Global_reactive_power), type = 'l', 
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()