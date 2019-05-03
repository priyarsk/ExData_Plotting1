Plot 3

##Reads data from the file
plot1<- read.table("household_power_consumption.txt",skip=1,sep=";")

## naming the columns
names(plot1)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",Sub_metering_3")

## Filtering dates and Assigning new data type
date<-plot1[plot1$Date %in% c("1/2/2007","2/2/2007"),]
date$Date <- as.Date(date$Date, format="%d/%m/%Y")

##formatting Date and Time variable
date$Time <- strptime(date$Time, format="%H:%M:%S")
date[1:1440,"Time"] <- format(date[1:1440,"Time"],"2007-02-01 %H:%M:%S")
date[1441:2880,"Time"] <- format(date[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

##Creating Png file in Directory
png("Plot3.png",width=480,height=480)

## create graph plot function
plot(date$Time,date$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(date,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(date,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(date,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## close the PNG files
dev.off()
