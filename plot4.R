library(sqldf)
sqlRequest <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
data <-  read.csv.sql(file='household_power_consumption.txt', sql=sqlRequest, sep=";")
data$DateTime <- strptime(paste(data$Date, data$Time),
                          format('%d/%m/%Y %T'))

png('plot4.png', width=480, height=480)
par(mfrow=c(2, 2))
with(data, {
    plot(DateTime, Global_active_power, type='l', xlab='', ylab='Global Active Power')
    
    plot(DateTime, Voltage, type='l', xlab='datetime', ylab='Voltage')
    
    plot(DateTime, Sub_metering_1, type='n', xlab='', ylab='Energy sub metering')
    lines(DateTime, Sub_metering_1, col='black')
    lines(DateTime, Sub_metering_2, col='red')
    lines(DateTime, Sub_metering_3, col='blue')
    legend('topright',
           c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
           col=c('black', 'red', 'blue'), lwd=1, box.lwd=0)
    
    plot(DateTime, Global_reactive_power, type='l', xlab='datetime')
})
dev.off()