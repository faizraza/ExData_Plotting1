dat <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
dat <- dat[dat$Date %in% c("1/2/2007","2/2/2007"),]
dateTime <- strptime(paste(dat$Date, dat$Time, sep=""), "%d/%m/%Y %H:%M:%S")
glap <- as.numeric(dat$Global_active_power) 
png(filename = "plot2", )
plot(dateTime, glap, type = "l", xlab="", ylab="Global Active Power (killowats)")
dev.off()