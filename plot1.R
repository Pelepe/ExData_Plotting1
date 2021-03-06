
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

png(filename="plot1.png",width = 480, height = 480) 
   
hist(todo$Global_active_power,col="red",main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
    
dev.off()