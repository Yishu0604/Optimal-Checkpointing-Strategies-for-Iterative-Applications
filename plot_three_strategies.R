#data
rm(list=ls())
library(ggplot2)
library(scales)
data<-read.table('C:/Users/duyis/Desktop/code-varing checkpoint 20200923/data_n10_CCR2.csv', header=TRUE, sep=',', row.names = 'row_name')

newdata<-data[c(1:1500), ]
newdata$P <- as.factor(newdata$P)
new_P<-factor(data$P,labels=c("1e-03", "1e-02", "1e-01", "1e-0.5", "1e-0.1"))
#new_P<-factor(newdata$P,labels=c('1e-04', "1e-03", "1e-02", "1e-01", "1e-0.5"))

p<-ggplot() + geom_boxplot(data=newdata, aes(x=new_P,y=ratio,fill=group),outlier.size = 0.5)
  
p

p+ xlab(expression(P)) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
 theme(plot.title=element_text(hjust=0.5))

#p+ xlab(expression(P)) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
#  theme(plot.title=element_text(hjust=0.5))

#p+ xlab(expression(P))+ ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
#  ggtitle('Neuroscience application') +theme(plot.title=element_text(hjust=0.5))

















#x<-c(1,2,3,4,5,1,2,3,4)
#levels(new_P)
#num<-which(levels(new_P)==0.1)
#levels(new_P)[num]<-expression(Sigma^2)
#newdata<-data[c(101:600,801:1300,1501:2000), ]
#newdata$P <- as.factor(newdata$P)
#data$P <- as.factor(data$P)



#data2
rm(list=ls())
library(ggplot2)
library(scales)
data<-read.table('C:/Users/duyis/Desktop/new code/data2.csv', header=TRUE, sep=',', row.names = 'row_name')
#data_static_new<-read.table('C:/Users/duyis/Desktop/code 20200507/data_static_new.csv', header=TRUE, sep=',', row.names = 'row_name')

data$P <- as.factor(data$P)
#data_static_new$k <- as.factor(data_static_new$k)

#levels(data_static$Distribution)<-c("P=1e-2,Gamma(25,0.5)","P=1e-2,Normal(50,2.5)","P=1e-2,Uniform(20,80)") #改标签
#levels(data_static_new$Distribution)<-c("P=1e-2,Gamma(25,0.5)","P=1e-2,Normal(50,2.5)","P=1e-2,Uniform(20,80)") #改标签
# data_static$Distribution<-factor(data_static$Distribution,levels=c("Uniform","Gamma","Normal")) #改分组顺序
p<-ggplot() + geom_boxplot(data=data, aes(x=P,y=ratio,fill=group),outlier.size = 0.5)
# geom_point(data=data_static_new, aes(x=k, y=Cind,group=Distribution),size=3,shape=23,color='brown',bg='brown')+
# geom_line(data=data_static_new, aes(x=k, y=ratio_the_dyn_YD_sta,group=Distribution),color='blue',size=0.5)+
# geom_line(data=data_static_new, aes(x=k, y=ratio_YD_dyn_YD_sta,group=Distribution),color='red',size=0.5)
p
#p+facet_grid(. ~ Distribution,as.table=TRUE) + ylab(expression(makespan~normalized~by~MS[YD_sta])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +ylim(0.95,1.10)
p+ ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90))





#data3
rm(list=ls())
library(ggplot2)
library(scales)
data<-read.table('C:/Users/duyis/Desktop/new code/data3.csv', header=TRUE, sep=',', row.names = 'row_name')
#data_static_new<-read.table('C:/Users/duyis/Desktop/code 20200507/data_static_new.csv', header=TRUE, sep=',', row.names = 'row_name')

data$P <- as.factor(data$P)
#data_static_new$k <- as.factor(data_static_new$k)

#levels(data_static$Distribution)<-c("P=1e-2,Gamma(25,0.5)","P=1e-2,Normal(50,2.5)","P=1e-2,Uniform(20,80)") #改标签
#levels(data_static_new$Distribution)<-c("P=1e-2,Gamma(25,0.5)","P=1e-2,Normal(50,2.5)","P=1e-2,Uniform(20,80)") #改标签
# data_static$Distribution<-factor(data_static$Distribution,levels=c("Uniform","Gamma","Normal")) #改分组顺序
p<-ggplot() + geom_boxplot(data=data, aes(x=P,y=ratio,fill=group),outlier.size = 0.5)
# geom_point(data=data_static_new, aes(x=k, y=Cind,group=Distribution),size=3,shape=23,color='brown',bg='brown')+
# geom_line(data=data_static_new, aes(x=k, y=ratio_the_dyn_YD_sta,group=Distribution),color='blue',size=0.5)+
# geom_line(data=data_static_new, aes(x=k, y=ratio_YD_dyn_YD_sta,group=Distribution),color='red',size=0.5)
p
#p+facet_grid(. ~ Distribution,as.table=TRUE) + ylab(expression(makespan~normalized~by~MS[YD_sta])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +ylim(0.95,1.10)
p+ ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90))




#data4
rm(list=ls())
library(ggplot2)
library(scales)
data<-read.table('C:/Users/duyis/Desktop/new code/data4.csv', header=TRUE, sep=',', row.names = 'row_name')
#data_static_new<-read.table('C:/Users/duyis/Desktop/code 20200507/data_static_new.csv', header=TRUE, sep=',', row.names = 'row_name')

data$P <- as.factor(data$P)
#data_static_new$k <- as.factor(data_static_new$k)

#levels(data_static$Distribution)<-c("P=1e-2,Gamma(25,0.5)","P=1e-2,Normal(50,2.5)","P=1e-2,Uniform(20,80)") #改标签
#levels(data_static_new$Distribution)<-c("P=1e-2,Gamma(25,0.5)","P=1e-2,Normal(50,2.5)","P=1e-2,Uniform(20,80)") #改标签
# data_static$Distribution<-factor(data_static$Distribution,levels=c("Uniform","Gamma","Normal")) #改分组顺序
p<-ggplot() + geom_boxplot(data=data, aes(x=P,y=ratio,fill=group),outlier.size = 0.5)
# geom_point(data=data_static_new, aes(x=k, y=Cind,group=Distribution),size=3,shape=23,color='brown',bg='brown')+
# geom_line(data=data_static_new, aes(x=k, y=ratio_the_dyn_YD_sta,group=Distribution),color='blue',size=0.5)+
# geom_line(data=data_static_new, aes(x=k, y=ratio_YD_dyn_YD_sta,group=Distribution),color='red',size=0.5)
p
#p+facet_grid(. ~ Distribution,as.table=TRUE) + ylab(expression(makespan~normalized~by~MS[YD_sta])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +ylim(0.95,1.10)
p+ ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90))

