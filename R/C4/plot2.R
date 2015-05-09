## Retrieve full dataset into all_data
all_data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Convert Date to a date format
all_data$Date <- as.Date(all_data$Date, format="%d/%m/%Y")

## Subsetting all_data into data and remove all_data
data <- subset(all_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(all_data)

## Concatinating Date and Time in one variable
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

## Open File plot2.png
png("plot2.png", width=480, height=480)

##Plot graph
plot(datetime, as.numeric(data$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")

##Close device
dev.off()