setwd("C:/LIFE/Data_Science_Certificate/Course4/Wk1/exdata-data-household_power_consumption")

mydata = read.table("household_power_consumption.txt", sep = ";",na.strings = "?",header=TRUE)  # read text file 
subsetData=mydata[mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007",]

subsetData$datetime = paste(subsetData$Date, subsetData$Time, sep=" ")
subsetData$Ndatetime <- strptime(subsetData$datetime, "%d/%m/%Y %H:%M:%S")


###Plot 3
png(file="plot3.png")

with(subsetData,plot(Ndatetime,Sub_metering_1, type="line", col="black", ylim = c(-1,40),xlab="", ylab="Energy sub metering"))
par(new=TRUE)
with(subsetData,plot(Ndatetime,Sub_metering_2, type="line", col="red", ylim = c(-1,40),xlab="", ylab="Energy sub metering"))
par(new=TRUE)
with(subsetData,plot(Ndatetime,Sub_metering_3, type="line", col="blue", ylim = c(-1,40),xlab="", ylab="Energy sub metering"))

legend("topright", 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=1, cex=1.2,y.intersp=1.4, col=c("black","red","blue"), lty=c(1,1,1))

dev.off()
