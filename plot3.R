fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "./DATA/household_power_consumption.txt")
#unzip the file manually
data <- read.table("./DATA/household_power_consumption.txt", 
                   header = TRUE, sep = ";", 
                   colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), 
                   stringsAsFactors=FALSE, 
                   na.strings="?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

Febdates <- data[(data$Date == "2007-02-01") | (data$Date == "2007-02-02"),]

Febdates$Date <-as.POSIXct(paste(Febdates$Date, Febdates$Time), 
                           format="%Y-%m-%d %H:%M:%S")

#Plot
plot(Febdates$Date,  Febdates$Sub_metering_1,
     ylab="Energy sub metering", type="l", lwd=1, xlab="")
lines(Febdates$Date,  Febdates$Sub_metering_2, type="l", col = "red")
lines(Febdates$Date,  Febdates$Sub_metering_3, type="l", col = "blue")
legend("topright",  
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty=1, lwd=1
       )


#Save to file
png(filename = "plot3.png", width = 480, height = 480,)
plot(Febdates$Date,  Febdates$Sub_metering_1,
     ylab="Energy sub metering", type="l", lwd=1, xlab="")
lines(Febdates$Date,  Febdates$Sub_metering_2, type="l", col = "red")
lines(Febdates$Date,  Febdates$Sub_metering_3, type="l", col = "blue")
legend("topright",  
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty=1, lwd=1
)
dev.off()