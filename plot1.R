plot1 <- function(input="household_power_consumption.txt"){
  
  ## Input the dataset into R
  
  df <- read.csv(input, sep=";")
  
  ## Change the ?s to NA
  
  df[df=="?"] = NA
  
  ## Subset the data
  
  febDates <- df[df$Date %in% c('1/2/2007', '2/2/2007'),]
  
  ## Clear larger data set from memory
  
  rm(df)
  
  ## Create the plot
  
  hist(as.numeric(as.character(febDates$Global_active_power)), breaks=13, col="green", main="Global Active Power", xlab ="Global Active Power (kilowatts)")
  
  ## Copy plot to a png file
  
  dev.copy(png,"plot1.png")
  
  ## Turn off the graphics device
  
  dev.off()
  
}