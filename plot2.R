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
plot(
  hpc1$Global_active_power~hpc1$dandt,
  xlab='', ylab='Global Active Power (kilowatts)',
  type='l'
)


##CREATE PNG
dev.copy(png, file='plot2.png', height=480, width=480)
dev.off()

