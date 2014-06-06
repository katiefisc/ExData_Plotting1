fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "./DATA/household_power_consumption.txt")
#unzip the file manually
data <- read.table("./DATA/household_power_consumption.txt", 
                          header = TRUE, sep = ";", na.strings=c("NA","NaN", "Not Available", " ?"))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
Febdates <- data[(data$Date == "2007-02-01") | (data$Date == "2007-02-02"),]
glblpwr <- Febdates[,3]
pwrdata <- as.numeric(levels(glblpwr))[glblpwr]
pwrdata_clean <-pwrdata[complete.cases(pwrdata)]
hist(pwrdata_clean, xlab= "Global active power (kilowatts)", 
     main = "Global Active Power",
     col ="red")

