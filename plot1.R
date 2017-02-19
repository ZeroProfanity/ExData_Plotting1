# INTRODUCTION
# R script to create figure 1 of Course Project 1 of Coursera Data science course 4: Exploratory Data Analysis

# LOCATIONS AND FILE NAMES
location_dataset <- "~\\DataScienceCourse\\DataSets\\household_power_consumption\\"
location_output <- "~\\DataScienceCourse\\ExData_Plotting1\\"
dataset_epc_filename <- "household_power_consumption.txt"
dataset_epc_fullfilename <- paste0(location_dataset, dataset_epc_filename)
filename_output <- "plot1.png"
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
hist(dataset_epc$Global_active_power, main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col = "red")
dev.off()