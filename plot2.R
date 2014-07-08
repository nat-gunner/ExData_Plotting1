plot2 <- function(input="household_power_consumption.txt"){
  
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
  
  ## Create the plot
  
  plot(febDates$Time, as.numeric(as.character(febDates$Global_active_power)), type="l", ylab="Global Active Power (kilowatts)", xlab="")
  
  ## Copy plot to a png file
  
  dev.copy(png,"plot2.png")
  
  ## Turn off the graphics device
  
  dev.off()
  
}