setwd("C:/LIFE/Data_Science_Certificate/Course4/Wk1/exdata-data-household_power_consumption")

mydata = read.table("household_power_consumption.txt", sep = ";",na.strings = "?",header=TRUE)  # read text file 
subsetData=mydata[mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007",]

subsetData$datetime = paste(subsetData$Date, subsetData$Time, sep=" ")
subsetData$Ndatetime <- strptime(subsetData$datetime, "%d/%m/%Y %H:%M:%S")

###Plot 4
png(file="plot4.png")

par(mfrow=c(2,2))
with(subsetData,plot(Ndatetime,Global_active_power, type="line", col="black", xlab="", ylab="Global active power"))
with(subsetData,plot(Ndatetime,Voltage, type="line", col="black", xlab="datetime", ylab="Voltage"))

with(subsetData,plot(Ndatetime,Sub_metering_1, type="line", col="black", ylim = c(-1,40),xlab="", ylab="Energy sub metering"))
par(new=TRUE)
with(subsetData,plot(Ndatetime,Sub_metering_2, type="line", col="red", ylim = c(-1,40),xlab="", ylab="Energy sub metering"))
par(new=TRUE)
with(subsetData,plot(Ndatetime,Sub_metering_3, type="line", col="blue", ylim = c(-1,40),xlab="", ylab="Energy sub metering"))
legend("topright", 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),bty = "n",cex=0.5)

with(subsetData,plot(Ndatetime,Global_reactive_power, type="line", col="black", xlab="datetime", ylab="Global_reactive_power"))

dev.off()
