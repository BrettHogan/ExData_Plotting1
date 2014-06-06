## Uploads data gets the data from 2/1/2007 ans 2/2/2007 and creates a png file and puts a 
## line plot of three metering stations and attaches a legend to the png file and 
## then closes the png file.

plot3<-function()
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
  png(filename = "plot3.png",width = 480,height = 480 ,units = "px")
  #create plot
  plot(smalldata$Time,as.numeric(smalldata$Sub_metering_1), type = "l",xlab = "" ,ylab = "Energy sub metering")
  lines(smalldata$Time,as.numeric(smalldata$Sub_metering_2), type = "l" ,col = "red")
  lines(smalldata$Time,as.numeric(smalldata$Sub_metering_3), type = "l" ,col = "blue")
  legend("topright", legend = c("sub metering 1", "sub metering 2", "sub metering 3"),col = c("black" , "blue", "red"),lwd = 1)
   
  dev.off()
  
}