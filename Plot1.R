## Getting full dataset
data_full <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?")
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting the data
data_sub <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## Converting dates
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$Datetime <- as.POSIXct(datetime)

## Plot1

hist(data_sub$Global_active_power,main = "Global Active Power", col = "red", xlab="Global Active Power (kilowatts)")

dev.copy(png, file = "Plot1.png", width=480, height=480)
dev.off()

