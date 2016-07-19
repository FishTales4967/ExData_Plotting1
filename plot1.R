plot1 <- {
  cclass <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
  tbl1 <-  read.delim("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE)
  mindate <- as.POSIXct("2007-02-01")
  maxdate <- as.POSIXct("2007-02-02")
  tbl2 <-  tbl1[with(tbl1, as.POSIXct(Date,format="%d/%m/%Y") %in% c(mindate,maxdate)),]
  png("plot1.PNG",width=480,height=480,unit="px")
  with(tbl2,hist(as.numeric(Global_active_power),main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red"))
   ## need to width of 480 px and height of 408 px
  title(main="Global Active Power") 
  print ("plot1.PNG has been saved")
  dev.off()
  }