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
with(
  hpc1,{
    plot(
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
  }
)

legend(
  'topright', 
  col=c('black', 'red', 'blue'), 
  lty=1, lwd=1, cex=0.85, xpd=NA,
  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)


##CREATE PNG
dev.copy(png, file='plot3.png', height=480, width=480)
dev.off()