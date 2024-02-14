dat <- read.table("household_power_consumption.txt", sep = ";", header = T)
dat <- dat[dat$Date %in% c("1/2/2007","2/2/2007"),]
dateTime <- strptime(paste(dat$Date, dat$Time, sep=""), "%d/%m/%Y %H:%M:%S")
glap <- as.numeric(dat$Global_active_power) 
png(filename = "plot1", height = 480, width = 480)
hist(glap, col = "red", main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (killowats)")
dev.off()