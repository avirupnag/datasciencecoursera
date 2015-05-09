## Retrieve full dataset into all_data
all_data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Convert Date to a date format
all_data$Date <- as.Date(all_data$Date, format="%d/%m/%Y")

## Subsetting all_data into data and remove all_data
data <- subset(all_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(all_data)

## Open File plot1.png
png("plot1.png", width=480, height=480)

## Plot graph
hist(as.numeric(data$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

##Close device
dev.off()