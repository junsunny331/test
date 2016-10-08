setwd("C:/LIFE/Data_Science_Certificate/Course4/Wk1/exdata-data-household_power_consumption")

mydata = read.table("household_power_consumption.txt", sep = ";",na.strings = "?",header=TRUE)  # read text file 
subsetData=mydata[mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007",]

subsetData$datetime = paste(subsetData$Date, subsetData$Time, sep=" ")
subsetData$Ndatetime <- strptime(subsetData$datetime, "%d/%m/%Y %H:%M:%S")

###Plot 1
png(file="plot1.png")

hist(subsetData$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     border="black", 
     col="red"
)

dev.off()

plot(subsetData$Wkday,subsetData$Global_active_power)
