## Uploads data gets the data from 2/1/2007 ans 2/2/2007 and creates a png file and puts a 
## histogram of the Global active power in kilowatts to the png file and then closes the png file.

plot1<-function()
{
  library(data.table)
  library(png)
  # get data
  mydata<-fread("./exdata_data_household_power_consumption/household_power_consumption.txt",na.strings ="?")
  
  #use only date specified
  smalldata<-mydata[66637:69516,]
  
  #convert date/ time
  smalldata$Date<-as.Date(smalldata$Date, format = "%d/%m/%Y")
  myTime<-strptime(paste(smalldata$Date,smalldata$Time), format = "%Y-%m-%d %H:%M:%S")
  #use POSIXct for data.table
  smalldata$Time<-as.POSIXct(myTime)
  
  #create file
  png(filename = "plot1.png",width = 480,height = 480 ,units = "px")
  #create histogram
  hist(as.numeric(smalldata$Global_active_power),breaks = 24,col = "red",main = "Global Active Power" , xlab = "Global Active Power (kilowatts)" , ylab = "Frequency")
  #close file
  dev.off()
  
}