##READ
hpc0 <- read.csv('household_power_consumption.txt', header=T, stringsAsFactors=F, na.strings='?', sep=';')


##CORRECT DATE FORMAT AND SUBSET
hpc0$Date <- as.Date(hpc0$Date, format='%d/%m/%Y')
hpc1 <- subset(hpc0, Date>='2007-02-01'&Date<='2007-02-02')
rm(hpc0)


##PLOT
hist(
  hpc1$Global_active_power,
  main='Global Active Power', xlab='Global Active Power (kilowatts)', ylab='Frequency',
  col='red'
)


##CREATE PNG
<<<<<<< HEAD:Plot1.R
dev.copy(png, file='plot1.png', height=480, width=480)
dev.off()
=======
dev.copy(png, file='plot1.png', height=400, width=400)
dev.off()
>>>>>>> origin/master:plot1.R
