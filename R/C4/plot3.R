## Retrieve full dataset into all_data
all_data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Convert Date to a date format
all_data$Date <- as.Date(all_data$Date, format="%d/%m/%Y")

## Subsetting all_data into data and remove all_data
data <- subset(all_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(all_data)

## Concatinating Date and Time in one variable
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

## Extract Sub_metering_1 to Sub_metering_1_data
Sub_metering_1_data <- as.numeric(data$Sub_metering_1)

## Extract Sub_metering_2 to Sub_metering_2_data
Sub_metering_2_data <- as.numeric(data$Sub_metering_2)

## Extract Sub_metering_3 to Sub_metering_3_data
Sub_metering_3_data <- as.numeric(data$Sub_metering_3)

## Open File plot3.png
png("plot3.png", width=480, height=480)

## Plot graph with Sub_metering_1_data
plot(datetime, Sub_metering_1_data , type="l", xlab="", ylab="Energy sub metering")

## Add lines for Sub_metering_2_data with red color
lines(datetime, Sub_metering_2_data, col = "red")

## Add lines for Sub_metering_3_data with blue color
lines(datetime, Sub_metering_3_data, col = "blue")

## Add legends at the top right corner
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## Close device
dev.off()