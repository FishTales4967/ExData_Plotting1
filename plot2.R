plot2 <- {
  library(dplyr)
  cclass <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
  tbl1 <-  read.delim("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE,na.strings="?")
  mindate <- as.POSIXct("2007-02-01")
  maxdate <- as.POSIXct("2007-02-02")
  tbl2 <-  tbl1[with(tbl1, as.POSIXct(Date,format="%d/%m/%Y") %in% c(mindate,maxdate)),]
  tbl2 <- mutate(tbl2,dt_tm = as.POSIXct(paste(Date,Time), format="%d/%m/%Y %H:%M:%S"),wkdy = weekdays(dt_tm))
  png("plot2.PNG",width=480,height=480,unit="px")
  with(tbl2,plot(dt_tm,Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l"))
  dev.off()
  print ("plot2.PNG has been output")
}