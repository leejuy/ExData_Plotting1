## Getting full dataset
data_full <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?")
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting the data
data_sub <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## Converting dates
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$Datetime <- as.POSIXct(datetime)

## Plot4


par(mfrow = c(2, 2))
plot(data_sub$DateTime, data_sub$Global_active_power, type = "l",
     ylab = "Global Active Power", xlab = "")
plot(data_sub$DateTime, data_sub$Voltage, type = "l", ylab = "Voltage",
     xlab = "datetime")
plot(data_sub$DateTime, data_sub$Sub_metering_1, type = "l",
     ylab = "Energy sub metering", xlab = "", col = "black")
points(data_sub$DateTime, data_sub$Sub_metering_2, type = "l", xlab = "",
       ylab = "Sub_metering_2", col = "red")
points(data_sub$DateTime, data_sub$Sub_metering_3, type = "l", xlab = "",
       ylab = "Sub_metering_3", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n", cex = 0.5)
plot(data_sub$DateTime, data_sub$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power", ylim = c(0, 0.5))
dev.copy(png, file = "Plot4.png", width=480, height=480)
dev.off()