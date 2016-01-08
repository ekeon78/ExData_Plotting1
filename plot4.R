## Load data using read.table()
	hpc <- read.table("./household_power_consumption.txt", sep=";", header = TRUE)

## Change format of date and time
	dates <- hpc$Date
	times <- hpc$Time
	x <- paste(dates, times)
	datetime <- strptime(x, "%d/%m/%Y %H:%M:%S")	

## Extract the required data
	extract <- grep("2007-02-01|2007-02-02", datetime)
	mhpc <- cbind(datetime,hpc)
	extract_data_set <- mhpc[extract,]
	extract_data_set$Global_active_power <- as.character(extract_data_set$Global_active_power)
	extract_data_set$Global_active_power <- as.numeric(extract_data_set$Global_active_power)
	extract_data_set$Voltage <- as.character(extract_data_set$Voltage)
	extract_data_set$Voltage <- as.numeric(extract_data_set$Voltage)
	extract_data_set$Sub_metering_1 <- as.character(extract_data_set$Sub_metering_1)
	extract_data_set$Sub_metering_2 <- as.character(extract_data_set$Sub_metering_2)
	extract_data_set$Sub_metering_3 <- as.character(extract_data_set$Sub_metering_3)
	extract_data_set$Sub_metering_1 <- as.numeric(extract_data_set$Sub_metering_1)
	extract_data_set$Sub_metering_2 <- as.numeric(extract_data_set$Sub_metering_2)
	extract_data_set$Sub_metering_3 <- as.numeric(extract_data_set$Sub_metering_3)
	extract_data_set$Global_reactive_power <- as.character(extract_data_set$Global_reactive_power)
	extract_data_set$Global_reactive_power <- as.numeric(extract_data_set$Global_reactive_power)


## open PNG file,plot and close the PNG device
	png("plot4.png",width = 480, height = 480, units = "px")

## Prepare 2by2 plot
	par(mfrow = c(2, 2))

## Plot 11,12,21,22
	
	with(extract_data_set, {
		plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
		plot(datetime, Voltage, type="l")
		{plot(datetime, extract_data_set$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering") 
		points(datetime, extract_data_set$Sub_metering_2, type="l", col="red")
		points(datetime, extract_data_set$Sub_metering_3, type="l", col="blue")
		legend("topright",lty=1,lwd=1  ,col = c("black", "red","blue"),legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
		}
		plot(datetime, Global_reactive_power, type="l")
	})


## close PNG device
	dev.off() 
	


