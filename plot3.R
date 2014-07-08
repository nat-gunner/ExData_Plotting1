plot3 <- function(input="household_power_consumption.txt"){
  
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
  
  ## Create a png file
  
  png(file = "plot3.png")
  
  ## Create the plots and legend
  
  plot(febDates$Time, as.numeric(as.character(febDates$Sub_metering_1)), type="l", ylab="Energy sub metering", xlab="")
  
  points(febDates$Time, as.numeric(as.character(febDates$Sub_metering_2)), type="l", col="blue")
  
  points(febDates$Time, as.numeric(as.character(febDates$Sub_metering_3)), type="l", col="darkgreen")
  
  legend("topright", lty=1, col=c("black", "blue", "darkgreen"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  ## Turn off the graphics device
  
  dev.off()
  
}