df <- read.table("D:/EDA coursera/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
df_subset <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
GlobalActivePower <- as.numeric(df_subset$Global_active_power)
png(file = "plot1.png", width = 480, height = 480)
hist(GlobalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()