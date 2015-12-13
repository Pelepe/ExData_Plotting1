
#Reading data into R

#Only reads first 90 days aprox.

todo<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",dec=".",nrows=130000,stringsAsFactors = FALSE)
todo$fulldate<-paste(todo$Date,todo$Time)
todo$fulldate<-strptime(todo$fulldate,"%d/%m/%Y %R:%S")
todo$Date<-as.Date(todo$Date,"%d/%m/%Y")
todo<-todo[,c(10,1,2,3,4,5,6,7,8,9)]
todo<-todo[todo$Date%in%as.Date(c('2007-02-01','2007-02-02')),]
todo$Global_active_power[todo$Global_active_power=="?"]<-NA
todo$Global_reactive_power[todo$Global_reactive_power=="?"]<-NA
todo$Voltage[todo$Voltage=="?"]<-NA
todo$Global_intensity[todo$Global_intensity=="?"]<-NA
todo$Sub_metering_1[todo$Sub_metering_1=="?"]<-NA
todo$Sub_metering_2[todo$Sub_metering_2=="?"]<-NA
todo$Sub_metering_3[todo$Sub_metering_3=="?"]<-NA

todo$Global_active_power<-as.numeric(todo$Global_active_power)
todo$Global_reactive_power<-as.numeric(todo$Global_reactive_power)
todo$Voltage<-as.numeric(todo$Voltage)
todo$Global_intensity<-as.numeric(todo$Global_intensity)
todo$Sub_metering_1<-as.numeric(todo$Sub_metering_1)
todo$Sub_metering_2<-as.numeric(todo$Sub_metering_2)
todo$Sub_metering_3<-as.numeric(todo$Sub_metering_3)


#Plotting phase

png(filename="plot4.png",width = 480, height = 480) 

par(mfrow=c(2,2))

#plot1
plot(todo$fulldate,todo$Global_active_power,xlab="",
     ylab= "Global Active Power",type="l")

#plot2
plot(todo$fulldate,todo$Voltage,xlab="datetime",
     ylab= "Voltage",type="l")

#plot3
plot(todo$fulldate,todo$Sub_metering_1,xlab="",
     ylab= "Energy sub metering",type="l")
lines(todo$fulldate,todo$Sub_metering_2,col="red" )
lines(todo$fulldate,todo$Sub_metering_3,col="blue" )
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"),xjust=1,yjust=1,bty = "n")# ,cex=0.7)


#plot4
plot(todo$fulldate,todo$Global_reactive_power,xlab="datetime",
     ylab= "Global_reactive_power",type="l")

dev.off()

#Important Note: Date Language (days in x axis) is spanish by Windows Default
