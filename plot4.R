# INTRODUCTION
# R script to create figure 4 of Course Project 1 of Coursera Data science course 4: Exploratory Data Analysis

# LOCATIONS AND FILE NAMES
location_dataset <- "~\\DataScienceCourse\\DataSets\\household_power_consumption\\"
location_output <- "~\\DataScienceCourse\\ExData_Plotting1\\"
dataset_epc_filename <- "household_power_consumption.txt"
dataset_epc_fullfilename <- paste0(location_dataset, dataset_epc_filename)
filename_output <- "plot4.png"
full_filename_output <- paste0(location_output, filename_output)

# OPEN DATASET
dataset_epc <- read.table(dataset_epc_fullfilename, dec = ".", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# DATA WRANGLING
# selecting 1st and 2nd of February 2007
records_to_select <- grepl("^[12]/2/2007", datedate)
dataset_epc <- dataset_epc[records_to_select, ]

# Convert data and time to a combined record
DateTime <- paste(dataset_epc$Date, dataset_epc$Time)
DateTime <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")
dataset_epc <- cbind(DateTime, dataset_epc)

# CREATE PLOT
png(filename = full_filename_output, width = 480, height = 480)
Sys.setlocale(category = "LC_ALL", locale = "US")
par(mfrow = c(2,2))

#plot1
with(dataset_epc, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global active power"))

#plot2
with(dataset_epc, plot(DateTime, Voltage, type = "l", xlab = "", ylab = "Voltage"))

#plot3
with(dataset_epc, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(dataset_epc, lines(y = Sub_metering_2, x = DateTime, col = "red"))
with(dataset_epc, lines(y = Sub_metering_3, x = DateTime, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1), bty = "n")

#plot4
with(dataset_epc, plot(DateTime, Global_reactive_power, type = "l", xlab = "", ylab = "Global_reactive_power"))

dev.off()
