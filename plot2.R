library(sqldf)
sqlRequest <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
data <-  read.csv.sql(file='household_power_consumption.txt', sql=sqlRequest, sep=";")
data$DateTime <- strptime(paste(data$Date, data$Time),
                          format('%d/%m/%Y %T'))

png('plot2.png', width=480, height=480)
plot(data$DateTime,
     data$Global_active_power,
     type='l',
     xlab='',
     ylab='Global Active Power (kilowatts)')
dev.off()