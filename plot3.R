plot3 <- {
  library(dplyr)
  cclass <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
  tbl1 <-  read.delim("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE,na.strings="?")
  mindate <- as.POSIXct("2007-02-01")
  maxdate <- as.POSIXct("2007-02-02")
  tbl2 <-  tbl1[with(tbl1, as.POSIXct(Date,format="%d/%m/%Y") %in% c(mindate,maxdate)),]
  tbl2 <- mutate(tbl2,dt_tm = as.POSIXct(paste(Date,Time), format="%d/%m/%Y %H:%M:%S"),wkdy = weekdays(dt_tm))
  png("plot3.PNG",width=480,height=480,unit="px")
  with(tbl2,plot(dt_tm,Sub_metering_1,xlab="",ylab="Energy sub metering",type="l"))
  lines(x=tbl2$dt_tm,y=tbl2$Sub_metering_2,type="l",col="red")
  lines(x=tbl2$dt_tm,y=tbl2$Sub_metering_3,type="l",col="blue")
  legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  dev.off()
  print ("plot3.PNG has been output")
  }