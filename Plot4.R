plot_active_power <- function() {
  plot(as.integer(as.POSIXct(paste(as.Date(hpc_data$Date,format="%d/%m/%Y"), hpc_data$Time, sep=" "))),
       hpc_data$Global_active_power,
       type="l",
       ylab='Global Active Power',
       xaxt="none",
       xlab=''
  )
  axis(1,
       at=as.integer(as.POSIXct(c('2007-02-01','2007-02-02','2007-02-03'))),
       labels=weekdays(as.POSIXct(c('2007-02-01','2007-02-02','2007-02-03')), abbreviate=TRUE)
  )
}
plot_sub_metering <- function() {
  plot.new()
  title(ylab="Energy sub metering")
  plot.window(xlim=as.integer(as.POSIXct(c('2007-02-01','2007-02-03'))),
              ylim=c(min(as.double(hpc_data$Sub_metering_1,hpc_data$Sub_metering_2,hpc_data$Sub_metering_3)),
                     max(as.double(hpc_data$Sub_metering_1,hpc_data$Sub_metering_2,hpc_data$Sub_metering_3))))
  lines(x=as.integer(as.POSIXct(paste(as.Date(hpc_data$Date,format="%d/%m/%Y"), hpc_data$Time, sep=" "))),
        y=as.double(hpc_data$Sub_metering_1),
        col="black")
  lines(x=as.integer(as.POSIXct(paste(as.Date(hpc_data$Date,format="%d/%m/%Y"), hpc_data$Time, sep=" "))),
        y=as.double(hpc_data$Sub_metering_2),
        col="red")
  lines(x=as.integer(as.POSIXct(paste(as.Date(hpc_data$Date,format="%d/%m/%Y"), hpc_data$Time, sep=" "))),
        y=as.double(hpc_data$Sub_metering_3),
        col="blue")
  axis(1,
       at=as.integer(as.POSIXct(c('2007-02-01','2007-02-02','2007-02-03'))),
       labels=weekdays(as.POSIXct(c('2007-02-01','2007-02-02','2007-02-03')), abbreviate=TRUE))
  axis(2,
       at=seq(from=0,
              to=max(as.double(hpc_data$Sub_metering_1,hpc_data$Sub_metering_2,hpc_data$Sub_metering_3)),
              by=10)
  )
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col=c("black", "red", "blue"), lty=c(1,1,1))
  box(which = "plot", lty = "solid")
}

plot_voltage <- function() {
  plot(as.integer(as.POSIXct(paste(as.Date(hpc_data$Date,format="%d/%m/%Y"), hpc_data$Time, sep=" "))),
       hpc_data$Voltage,
       type="l",
       xaxt="none",
       xlab='',
       ylab='Voltage'
  )
   axis(1,
       at=as.integer(as.POSIXct(c('2007-02-01','2007-02-02','2007-02-03'))),
       labels=weekdays(as.POSIXct(c('2007-02-01','2007-02-02','2007-02-03')), abbreviate=TRUE)
  )
}
plot_reactive_power<- function() {
  plot(as.integer(as.POSIXct(paste(as.Date(hpc_data$Date,format="%d/%m/%Y"), hpc_data$Time, sep=" "))),
       hpc_data$Global_reactive_power,
       type="l",
       xaxt="none",
       xlab='',
       ylab='Global reactive power'
  )
  axis(1,
       at=as.integer(as.POSIXct(c('2007-02-01','2007-02-02','2007-02-03'))),
       labels=weekdays(as.POSIXct(c('2007-02-01','2007-02-02','2007-02-03')), abbreviate=TRUE)
  )
}

setwd("~/coursera/expdan/w1")
library(dplyr)
hpc <- read.csv2("household_power_consumption.txt", sep=";")
hpc_data <- hpc %>% filter(as.Date("2007-02-01") <= as.Date(hpc$Date,format='%d/%m/%Y') &as.Date(hpc$Date,format='%d/%m/%Y') <=  as.Date("2007-02-02"))
hpc_data$Global_active_power[hpc_data$Global_active_power=="?"] <- NA
hpc_data$Global_reactive_power[hpc_data$Global_reactive_power=="?"] <- NA
png(filename = 'Plot4.png',width=480,height=480)
par(mfcol=c(2,2))

plot_active_power()
plot_sub_metering()
plot_voltage()
plot_reactive_power()

dev.off()

