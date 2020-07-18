df <- read.table("D:/EDA coursera/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
df_subset <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
GlobalActivePower <- as.numeric(df_subset$Global_active_power)
df_subset$Date <- as.Date(df_subset$Date, format="%d/%m/%Y")
df_subset$Time <- strptime(df_subset$Time, format="%H:%M:%S")
df_subset[1:1440,"Time"] <- format(df_subset[1:1440,"Time"],"2007-02-01 %H:%M:%S")
df_subset[1441:2880,"Time"] <- format(df_subset[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png("plot3.png", height = 480, width = 480)

plot(df_subset$Time,df_subset$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(df_subset,lines(Time,Sub_metering_1))
with(df_subset,lines(Time,Sub_metering_2,col="red"))
with(df_subset,lines(Time,Sub_metering_3,col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
