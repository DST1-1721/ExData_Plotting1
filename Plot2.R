setwd("~/coursera/expdan/w1")

library(dplyr)
hpc <- read.csv2("household_power_consumption.txt", sep=";")
hpc_data <- hpc %>% filter(as.Date("2007-02-01") <= as.Date(hpc$Date,format='%d/%m/%Y') &as.Date(hpc$Date,format='%d/%m/%Y') <=  as.Date("2007-02-02"))
hpc_data$Global_active_power[hpc_data$Global_active_power=="?"] <- NA
png(filename = 'Plot2.png',width=480,height=480)
plot(as.integer(as.POSIXct(paste(as.Date(hpc_data$Date,format="%d/%m/%Y"), hpc_data$Time, sep=" "))),
     hpc_data$Global_active_power,
     type="l",
     ylab='Global Active Power (kilowatts)',
     xaxt="none",
     xlab=''
)
axis(1,
     at=as.integer(as.POSIXct(c('2007-02-01','2007-02-02','2007-02-03'))),
     labels=weekdays(as.POSIXct(c('2007-02-01','2007-02-02','2007-02-03'))))
dev.off()
