fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "./DATA/household_power_consumption.txt")
#unzip the file manually
data <- read.table("./DATA/household_power_consumption.txt", 
                   header = TRUE, sep = ";", colClasses = "character", stringsAsFactors=FALSE, na.strings=c("NA","NaN", "Not Available", " ?"))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
Febdates <- data[(data$Date == "2007-02-01") | (data$Date == "2007-02-02"),]
Febdates$Date <-as.POSIXct(paste(Febdates$Date, Febdates$Time), 
                      format="%Y-%m-%d %H:%M:%S")
Febdates$Global_active_power <-as.numeric(Febdates$Global_active_power)
glblpwr <- Febdates[,1:3]
pwrdata_clean <-glblpwr[complete.cases(glblpwr),]

#Plot
plot(glblpwr$Date,  glblpwr$Global_active_power,
   ylab="Global Active Power (kilowatts)", type="l", lwd=1, xlab="")

#Saving to file
png(filename = "plot2.png", width = 480, height = 480,)
plot(glblpwr$Date,  glblpwr$Global_active_power,
     ylab="Global Active Power (kilowatts)", type="l", lwd=1, xlab="")
dev.off()
