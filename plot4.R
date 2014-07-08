plot4 <- function(input="household_power_consumption.txt"){
  
  ## Input the dataset into R
  
  df <- read.csv(input, sep=";")
  
  ## Change the ?s to NA
  
  df[df=="?"] = NA
  
  ## Subset the complete cases
  
  df1 <- df[complete.cases(df),]
  
  ## Add the date to the time column
  
  df1$Time = paste(df1$Date, df1$Time, sep=" ")
  
  ## Convert the Date column into date format
  
  df1$Date <- as.Date(df1$Date, format="%d/%m/%Y")
  
  ## Convert the Time column into POSIX format
  
  df1$Time <- strptime(df1$Time, format="%d/%m/%Y %H:%M:%S")
  
  ## Subset according to the desired dates
  
  febDates <- df1[df1$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]
  
  ## Clear larger data sets from memory
  
  rm(df,df1)
  
  
  
  png(file = "plot4.png")
  
  ## Set the parameter to show a 2x2 plot grid
  
  par(mfrow=c(2,2))
  
  ## Create the plots and legend
  
  plot(febDates$Time, as.numeric(as.character(febDates$Global_active_power)), type="l", ylab="Global Active Power (kilowatts)", xlab="")
  
  plot(febDates$Time, as.numeric(as.character(febDates$Voltage)), type="l", xlab="datetime", ylab="Voltage")
  
  plot(febDates$Time, as.numeric(as.character(febDates$Sub_metering_1)), type="l", ylab="Energy sub metering", xlab="")
  
  points(febDates$Time, as.numeric(as.character(febDates$Sub_metering_2)), type="l", col="blue")
  
  points(febDates$Time, as.numeric(as.character(febDates$Sub_metering_3)), type="l", col="darkgreen")
  
  legend("topright", lty=1, col=c("black", "blue", "darkgreen"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=.75)
  
  plot(febDates$Time, as.numeric(as.character(febDates$Global_reactive_power)), type="l", xlab="datetime", ylab="Global_reactive_power")
  
  ## Turn off the graphics device
  
  dev.off()
  
  ## Restore the original parameter
  
  par(mfrow=c(1,1))
  
}