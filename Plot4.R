Plot4

##Reads data from the file
plot1<- read.table("household_power_consumption.txt",skip=1,sep=";")

## naming the columns
names(plot1)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",Sub_metering_3")

## Filtering dates and Assigning new data type
date<-plot1[plot1$Date %in% c("1/2/2007","2/2/2007"),]
gactpower<-as.numeric(date$Global_active_power)

##formatting Date and Time variable
date$Date <- as.Date(date$Date, format="%d/%m/%Y")
date$Time <- strptime(date$Time, format="%H:%M:%S")
date[1:1440,"Time"] <- format(date[1:1440,"Time"],"2007-02-01 %H:%M:%S")
date[1441:2880,"Time"] <- format(date[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

##Creating Png file in Directory
png("Plot4.png",width=480,height=480)

## call the Par function
par(mfrow=c(2,2))

## create all the 4 graph plot function
plot(date$Time,gactpower,type="l",xlab="",ylab = "Global Active Power")

plot(date$Time,as.numeric(as.character(date$Voltage)), type="l",xlab="datetime",ylab="Voltage")

plot(date$Time,date$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(date,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(date,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(date,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(date$Time,as.numeric(as.character(date$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")

## close the PNG files
dev.off()

