## Getting full dataset
data_full <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?")
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting the data
data_sub <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## Converting dates
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$Datetime <- as.POSIXct(datetime)

## Plot3
with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()


par(mfrow = c(1, 1))

plot(data_sub$DateTime, data_sub$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering")
points(data_sub$DateTime, data_sub$Sub_metering_2, type = "l", xlab = "",
       ylab = "Energy sub metering", col = "red")
points(data_sub$DateTime, data_sub$Sub_metering_3, type = "l", xlab = "",
       ylab = "Energy sub metering", col = "blue")
legend("topright", lty = 1, lwd=2.5, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.5)

dev.copy(png, file = "Plot3.png", width=480, height=480)
dev.off()