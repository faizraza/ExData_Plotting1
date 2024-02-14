dat <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
dat <- dat[dat$Date %in% c("1/2/2007","2/2/2007"),]

dateTime <- strptime(paste(dat$Date, dat$Time, sep=""), "%d/%m/%Y %H:%M:%S")
glap <- as.numeric(dat$Global_active_power) 
gRap <- as.numeric(dat$Global_reactive_power) 
png(filename = "plot4", width = 480, height = 480)

##arrange row wise
par(mfrow = c(2, 2))

#plot 1
hist(glap, col = "red", main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (killowats)")

##plot 2
plot(dateTime, glap, type = "l", xlab="", ylab="Global Active Power (killowats)")

##plot 3
submetering1 <- as.numeric(dat$Sub_metering_1)
submetering2 <- as.numeric(dat$Sub_metering_2)
submetering3 <- as.numeric(dat$Sub_metering_3)
plot(dateTime, submetering1, type = "l", xlab="", ylab="Energy Submering")
lines(dateTime, submetering2, type="l", col="red")
lines(dateTime, submetering3, type="l", col="blue")
legend("topright", c("Submetering_1", "Submetering_2", "Submetering_3"), lwd = 2, col = c("black", "red", "blue"), cex = 0.5)

##plot 4
plot(dateTime, gRap, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()