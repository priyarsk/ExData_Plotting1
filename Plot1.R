plot 1

library("data.table")

##Reads data from the file 
plot1<- read.table("household_power_consumption.txt",skip=1,sep=";")

## naming the columns
names(plot1)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",Sub_metering_3")

## Filtering dates
date<-plot1[plot1$Date %in% c("1/2/2007","2/2/2007"),]

##Assigning new data type
gactpower<-as.numeric(date$Global_active_power)

##Creating Png file in Directory
png("Plot1.png",width=480,height=480)

## creating base plot function
hist(gactpower,col="red",main="Global Active Power",xlab ="Global Active Power(Kilowatts)")

## close the PNG files
dev.off()