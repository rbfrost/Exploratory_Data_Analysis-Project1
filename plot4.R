##READ
hpc0 <- read.csv('household_power_consumption.txt', header=T, stringsAsFactors=F, na.strings='?', sep=';')


##CORRECT DATE FORMAT, SUBSET, AND DELETE FULL DATA SET
hpc0$Date <- as.Date(hpc0$Date, format='%d/%m/%Y')
hpc1 <- subset(hpc0, Date>='2007-02-01'&Date<='2007-02-02')
rm(hpc0)


##COMBINE AND CONVERT DATE & TIME
dandt <- paste(as.Date(hpc1$Date), hpc1$Time)
hpc1$dandt <- as.POSIXct(dandt)


##PLOT
par(oma=c(0,0,2,0), mar=c(4,4,2,1), mfrow=c(2,2))
with(
  hpc1,{
    
    plot( ##FIRST PLOT
      hpc1$Global_active_power~hpc1$dandt,
      xlab='', ylab='Global Active Power',
      type='l'
    )
    
    plot( ##SECOND PLOT
      Voltage~dandt,
      xlab='datetime', ylab='Voltage',
      type='l'
    )
    
    plot( ##THIRD PLOT
      Sub_metering_1~dandt, 
      xlab='', ylab='Energy sub metering',
      type='l'
    )
      lines(
        Sub_metering_2~dandt,
        col='red'
      )
      lines(
        Sub_metering_3~dandt,
        col='blue'
      )
      legend(
        'topright', 
        col=c('black', 'red', 'blue'), 
        lty=1, lwd=1, cex=0.85, xpd=NA, bty='n',
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
      )
      
    plot( ##FOURTH PLOT
      Global_reactive_power~dandt,
      xlab='datetime', ylab='Global_reactive_power',
      type='l' 
    )
  }
)


##CREATE PNG
dev.copy(png, file='plot4.png', height=480, width=480)
dev.off()