#plot gopi figure in pdf
rm(list=ls())
library(ggplot2)
library(scales)
#library(tikzDevice)
data<-read.table('C:/Users/duyis/Desktop/lip_code/R_plot20201008/data_gopi.csv', header=TRUE, sep=',', row.names = 'row_name')

newdata<-data[c(1:1500), ]

newdata$P <- as.factor(newdata$P)

new_P<-factor(newdata$P,labels=c('1e-04', "1e-03", "1e-02", "1e-01", "1e-0.5")) #gopi
#new_P<-factor(data$P,labels=c("1e-03", "1e-02", "1e-01", "1e-0.5", "1e-0.1")) #GCR
#new_P<-factor(newdata$P,labels=c("1e-03", "1e-02", "1e-01", "1e-0.5")) #random

#tikz("C:/Users/duyis/Desktop/paper/newfigures/data_gopi.tex",width=3.00,height=3.00)

p<-ggplot() + geom_boxplot(data=newdata, aes(x=new_P,y=ratio,fill=group),outlier.size = 0.5)

p+ guides(colour = guide_legend(nrow = 2))

p+labs(x=expression(P[fail]),y=expression(makespan~normalized~by~MS[optimal]),fill='strategy') + 
  theme(legend.position="top", axis.title.x = element_text( size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + guides(colour = guide_legend(nrow = 1))

#dev.off()







#plot gopi figure in tex
rm(list=ls())
library(ggplot2)
library(scales)
library(tikzDevice)
data<-read.table('C:/Users/duyis/Desktop/lip_code/R_plot20201008/data_gopi.csv', header=TRUE, sep=',', row.names = 'row_name')

newdata<-data[c(1:1500), ]

newdata$P <- as.factor(newdata$P)

new_P<-factor(newdata$P,labels=c('1e-04', "1e-03", "1e-02", "1e-01", "1e-0.5")) #gopi
#new_P<-factor(data$P,labels=c("1e-03", "1e-02", "1e-01", "1e-0.5", "1e-0.1")) #GCR
#new_P<-factor(newdata$P,labels=c("1e-03", "1e-02", "1e-01", "1e-0.5")) #random

tikz("C:/Users/duyis/Desktop/paper/newfigures/data_gopi.tex",width=3.40,height=5.39)

p<-ggplot() + geom_boxplot(data=newdata, aes(x=new_P,y=ratio,fill=group),outlier.size = 0.5)

#p

p + theme(legend.position="top",legend.text = element_text(size = 6)) +
  labs(x=expression(P[fail]),y=expression(makespan~normalized~by~MS[optimal]),fill='strategy') + 
  theme(axis.title.x = element_text(size = 15, angle = 0),axis.title.y = element_text(size = 15, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5))+ guides(fill=guide_legend(title=NULL))

dev.off()






#plot GCR figure in tex
rm(list=ls())
library(ggplot2)
library(scales)
library(tikzDevice)
data<-read.table('C:/Users/DELL/Desktop/lip_code/R_final_plot/data_GCR_n10.csv', header=TRUE, sep=',', row.names = 'row_name')

newdata<-data[c(301:1500,1801:3000), ]


newdata$P <- as.factor(newdata$P)

#new_P<-factor(newdata$P,labels=c('1e-04', "1e-03", "1e-02", "1e-01", "1e-0.5")) #gopi
#new_P<-factor(newdata$P) #GCR
new_P<-factor(newdata$P,labels=c("1e-02", "1e-01", "1e-0.5", "1e-0.1")) #GCR
#new_P<-factor(newdata$P,labels=c("1e-03", "1e-02", "1e-01", "1e-0.5")) #random

tikz("C:/Users/DELL/Desktop/data_GCR_n10.tex",width=6.81,height=5.39)
p<-ggplot() + geom_boxplot(data=newdata, aes(x=new_P,y=ratio,fill=group),outlier.size = 0.5)

#p

p + theme(legend.position="top",legend.text = element_text(size = 15)) +
  labs(x=expression(P[fail]),y=expression(makespan~normalized~by~MS[optimal]),fill='strategy') + 
  theme(axis.title.x = element_text(size = 20, angle = 0),axis.title.y = element_text(size = 18, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + facet_wrap(~CCR_group) #facet_wrap(~CCR_group, scales="free_y") 
dev.off()





#plot random figure in tex
rm(list=ls())
library(ggplot2)
library(scales)
library(tikzDevice)
data<-read.table('C:/Users/duyis/Desktop/lip_code/R_plot20201008/data_random_n10.csv', header=TRUE, sep=',', row.names = 'row_name')

#newdata<-data[c(1:3000), ]
newdata<-data[c(1:2400), ]

newdata$P <- as.factor(newdata$P)

#new_P<-factor(newdata$P,labels=c('1e-04', "1e-03", "1e-02", "1e-01", "1e-0.5")) #gopi
#new_P<-factor(data$P,labels=c("1e-03", "1e-02", "1e-01", "1e-0.5", "1e-0.1")) #GCR
new_P<-factor(newdata$P,labels=c("1e-03", "1e-02", "1e-01", "1e-0.5")) #random

tikz("C:/Users/duyis/Desktop/paper20201012/newfigures/data_random_n10.tex",width=6.81,height=5.39)

p<-ggplot() + geom_boxplot(data=newdata, aes(x=new_P,y=ratio,fill=group),outlier.size = 0.5)

#p

p + theme(legend.position="top",legend.text = element_text(size = 15)) +
  labs(x=expression(P[fail]),y=expression(makespan~normalized~by~MS[optimal]),fill='strategy') + 
  theme(axis.title.x = element_text(size = 20, angle = 0),axis.title.y = element_text(size = 18, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + facet_wrap(~type) #+ facet_wrap(~type, scales="free_y") 
dev.off()


















































#data
rm(list=ls())
library(ggplot2)
library(scales)
data<-read.table('C:/Users/duyis/Desktop/lip_code/data_online/template.csv', header=TRUE, sep=',', row.names = 'row_name')

newdata<-data[c(1:1200), ]
newdata$P <- as.factor(newdata$P)
#new_P<-factor(newdata$P,labels=c('1e-04', "1e-03", "1e-02", "1e-01", "1e-0.5")) #gopi
#new_P<-factor(data$P,labels=c("1e-03", "1e-02", "1e-01", "1e-0.5", "1e-0.1")) #GCR
new_P<-factor(newdata$P,labels=c("1e-03", "1e-02", "1e-01", "1e-0.5")) #random

p<-ggplot() + geom_boxplot(data=newdata, aes(x=new_P,y=ratio,fill=group),outlier.size = 0.5)

p

p+labs(x=expression(P[fail]),y=expression(makespan~normalized~by~MS[optimal]),fill='strategy') + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5))#+ylim(1.00, 1.15)


#bound
rm(list=ls())
library(ggplot2)
library(scales)

tasks_bound<-read.table('C:/Users/duyis/Desktop/lip_code/bound/data_gopi_bound.csv', header=TRUE, sep=',', row.names = 'row_name')

p<-ggplot(tasks_bound, aes(x=P, y=Tasks, colour=groups,group=groups)) + geom_line(size=1)

p

p + scale_x_continuous(name=expression(P[fail]),trans="log10",breaks=tasks_bound$P, labels = c("1e-4", "1e-03", "1e-02", "1e-01", "1e-0.5", "1e-4", "1e-03", "1e-02", "1e-01", "1e-0.5"))+
  scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  labs(x=expression(P[fail]),y='Tasks') + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5))
  

  

#p + scale_x_continuous(trans="log10",breaks=tasks_bound$P, labels = c("1e-03", "1e-02", "1e-01", "1e-0.5", "1e-0.1", "1e-03", "1e-02", "1e-01", "1e-0.5", "1e-0.1"))+
  #labs(x=expression(P[fail]),y='Tasks') + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  #theme(plot.title=element_text(hjust=0.5))







#GCR
rm(list=ls())
library(ggplot2)
library(scales)
data<-read.table('C:/Users/duyis/Desktop/lip_data/data_GCR_n10_CCR2.csv', header=TRUE, sep=',', row.names = 'row_name')

newdata<-data[c(1:1500), ]
newdata$P <- as.factor(newdata$P)

new_P<-factor(data$P,labels=c("1e-03", "1e-02", "1e-01", "1e-0.5", "1e-0.1"))

p<-ggplot() + geom_boxplot(data=newdata, aes(x=new_P,y=ratio,fill=group),outlier.size = 0.5)

p

p+labs(x=expression(P[fail]),y=expression(makespan~normalized~by~MS[optimal]),fill='strategy') + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5))



#bound
rm(list=ls())
library(ggplot2)
library(scales)

tasks_bound<-read.table('C:/Users/duyis/Desktop/lip_data/bound/data_GCR_n10_CCR10_bound.csv', header=TRUE, sep=',', row.names = 'row_name')

p<-ggplot(tasks_bound, aes(x=P, y=Tasks, colour=groups,group=groups)) + geom_line(size=1)

p

p + scale_x_continuous(trans="log10",breaks=tasks_bound$P, labels = c("1e-03", "1e-02", "1e-01", "1e-0.5", "1e-0.1", "1e-03", "1e-02", "1e-01", "1e-0.5", "1e-0.1"))+
labs(x=expression(P[fail]),y='Tasks') + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5))




















