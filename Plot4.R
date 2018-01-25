Library(lubridate)

HPW <- read.table("household_power_consumption.txt",header = T , sep = ";", stringsAsFactors = F)
HPW$Date <- dmy(HPW$Date)
master <- subset(HPW,Date>="2007-02-01" & Date<= "2007-02-02")
master[,3:8] <- sapply(master[,3:8],as.numeric)
master$DateTime <- paste(as.character(master$Date),master$Time)
master$DateTime <-  ymd_hms(master$DateTime)

#Plot4
png(filename = "Plot4.png", width= 480, height= 480)
par(mfrow=c(2,2), cex=0.5)
with(master, {      
    plot(DateTime,Global_active_power,type="l")
    plot(DateTime,Voltage, type="l")
    
    plot(DateTime,Sub_metering_1, ylab = "Energy sub metering" , xlab="" , type="l")    
    points(DateTime,Sub_metering_2, type="l", col= "red")
    points(DateTime,Sub_metering_3, type="l")
    points(DateTime,Sub_metering_3, type="l", col= "blue")
    legend("topright", lty = 1, col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

    plot(DateTime,Global_reactive_power, type = "l")
    })
dev.off()
