setwd("~/coursera/expdan/w1")
library(dplyr)

hpc <- read.csv2("household_power_consumption.txt", sep=";")
hpc_data <- hpc %>% filter(as.Date("2007-02-01") <= as.Date(hpc$Date,format='%d/%m/%Y') &as.Date(hpc$Date,format='%d/%m/%Y') <=  as.Date("2007-02-02"))
hpc_data$Global_active_power[hpc_data$Global_active_power=="?"] <- NA
png(filename = 'Plot1.png',width=480,height=480)
hist(as.double(hpc_data$Global_active_power),
     breaks=seq(from=0,
                to=ceiling(max(as.double(hpc_data$Global_active_power))),
                by=0.5),
     xlab='Global Active Power (kilowatts)',
     main='Global Active Power',
     col="red")
dev.off()
