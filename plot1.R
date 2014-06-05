#Open png device
png(filename = "plot1.png",
    width = 480, height = 480)

#Install data table package
library(data.table)

#Read data file
data <- fread("./ExploratoryDataAnalysis/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

#Subset data to the two day timeframe in 2007
plot.data <- subset(data, as.Date(data$Date, format = "%d/%m/%Y") >= "2007-02-01" & as.Date(data$Date, format = "%d/%m/%Y") <= "2007-02-02") 

#Histogram with title, label and color requirements
hist(as.numeric(plot.data$Global_active_power), freq = TRUE, 
     main = "Global Active Power", col = "red", 
     xlab = "Global Active Power (kilowatts)")

dev.off()