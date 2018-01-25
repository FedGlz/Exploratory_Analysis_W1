library(lubridate)

HPW <- read.table("household_power_consumption.txt",header = T , sep = ";", stringsAsFactors = F)
HPW$Date <- dmy(HPW$Date)
master <- subset(HPW,Date>="2007-02-01" & Date<= "2007-02-02")
rm(HPW)
master[,3:8] <- sapply(master[,3:8],as.numeric)
master$DateTime <- paste(as.character(master$Date),master$Time)
master$DateTime <-  ymd_hms(master$DateTime)

png(filename = "Plot1.png", width= 480,height= 480)
hist(master$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")
dev.off()

