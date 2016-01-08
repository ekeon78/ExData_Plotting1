## Load data using read.table()
	hpc <- read.table("./household_power_consumption.txt", sep=";", header = TRUE)

## Change format of date and time
	dates <- hpc$Date
	times <- hpc$Time
	x <- paste(dates, times)
	datetime <- strptime(x, "%d/%m/%Y %H:%M:%S")	

## Extract the required data
	extract <- grep("2007-02-01|2007-02-02", datetime)
	extract_data_set <- hpc[extract,]
	extract_data_set$Global_active_power <- as.character(extract_data_set$Global_active_power)
	extract_data_set$Global_active_power <- as.numeric(extract_data_set$Global_active_power)
	
## open PNG file,plot and close the PNG device
	png("plot1.png",width = 480, height = 480, units = "px")
	hist(extract_data_set$Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
	dev.off()



