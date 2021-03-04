#data
rm(list=ls())
library(ggplot2)
library(scales)
data<-read.table('C:/Users/DELL/Desktop/code/data_gopi.csv', header=TRUE, sep=',', row.names = 'row_name')
#data<-read.table('C:/Users/DELL/Desktop/code/data_GCR_n20_CCR_5.csv', header=TRUE, sep=',', row.names = 'row_name')
#data<-read.table('C:/Users/DELL/Desktop/code/data_random_n10_type2.csv', header=TRUE, sep=',', row.names = 'row_name')
#data<-read.table('C:/Users/DELL/Desktop/code/data_gopi_perturb.csv', header=TRUE, sep=',', row.names = 'row_name')

newdata<-data[c(1:2000), ]
newdata$P <- as.factor(newdata$P)

new_P<-factor(newdata$P,labels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))
#new_P<-factor(newdata$P,labels=c("1e-02", "1e-01", "1e-0.5", "1e-0.1"))
#new_P<-factor(newdata$P,labels=c("1e-3", "1e-02", "1e-01", "1e-0.5"))

p<-ggplot() + geom_boxplot(data=newdata, aes(x=new_P,y=ratio,fill=strategy),outlier.size = 0.5)
  
p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
 theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top") 
#+ylim(0.99, 1.7)

#p+ xlab(expression(P)) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
#  theme(plot.title=element_text(hjust=0.5))

#p+ xlab(expression(P))+ ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
#  ggtitle('Neuroscience application') +theme(plot.title=element_text(hjust=0.5))





#data scalability
rm(list=ls())
library(ggplot2)
library(scales)
data<-read.table('C:/Users/DELL/Desktop/code/data_gopi_scalability.csv', header=TRUE, sep=',', row.names = 'row_name')
#data<-read.table('C:/Users/DELL/Desktop/code/data_GCR_n20_CCR10.csv', header=TRUE, sep=',', row.names = 'row_name')
#data<-read.table('C:/Users/DELL/Desktop/code/data_random_n10_type2.csv', header=TRUE, sep=',', row.names = 'row_name')

newdata<-data[c(1:2000), ]
newdata$P <- as.factor(newdata$N)

new_N<-factor(newdata$N,labels=c('1e+01', "1e+1.5", "1e+02", "1e+2.5", "1e+3"))
#new_P<-factor(newdata$P,labels=c("1e-02", "1e-01", "1e-0.5", "1e-0.1"))
#new_P<-factor(newdata$P,labels=c("1e-3", "1e-02", "1e-01", "1e-0.5"))

p<-ggplot() + geom_boxplot(data=newdata, aes(x=new_N,y=ratio,fill=strategy),outlier.size = 0.5)

p

p+ xlab(expression(number~of~iterations~N[iter])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top") 


#p+ xlab(expression(P)) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
#  theme(plot.title=element_text(hjust=0.5))

#p+ xlab(expression(P))+ ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
#  ggtitle('Neuroscience application') +theme(plot.title=element_text(hjust=0.5))



#data baseline
rm(list=ls())
library(ggplot2)
library(scales)
data<-read.table('C:/Users/DELL/Desktop/code/data_gopi_base.csv', header=TRUE, sep=',', row.names = 'row_name')
#data<-read.table('C:/Users/DELL/Desktop/code/data_GCR_n20_CCR10.csv', header=TRUE, sep=',', row.names = 'row_name')
#data<-read.table('C:/Users/DELL/Desktop/code/data_random_n10_type2.csv', header=TRUE, sep=',', row.names = 'row_name')

newdata<-data[c(1:3500), ]
newdata$P <- as.factor(newdata$P)

new_P<-factor(newdata$P,labels=c('1e-04', "1e-03", "1e-02", "1e-01", "1e-0.5"))
#new_P<-factor(newdata$P,labels=c("1e-02", "1e-01", "1e-0.5", "1e-0.1"))
#new_P<-factor(newdata$P,labels=c("1e-3", "1e-02", "1e-01", "1e-0.5"))

p<-ggplot() + geom_boxplot(data=newdata, aes(x=new_P,y=ratio,fill=strategy),outlier.size = 0.5)

p

p+ xlab(expression(P)) + ylab(expression(makespan~normalized~by~MS[base])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top") 
#+ylim(0.99, 1.15)

#p+ xlab(expression(P)) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
#  theme(plot.title=element_text(hjust=0.5))

#p+ xlab(expression(P))+ ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
#  ggtitle('Neuroscience application') +theme(plot.title=element_text(hjust=0.5))


#6.7*5.86
# P=1e^(-1)
rm(list=ls())
library(ggplot2)

strategy=rep(c("CKPTEACHITER", "CKPTEACHTASK", "CKPTYDAVE", "CKPTYDPER", "CKPTOPT"),3)
strategy <- factor(strategy, levels = c("CKPTEACHITER","CKPTEACHTASK","CKPTYDPER","CKPTYDAVE", "CKPTOPT"))

df2 <- data.frame(group=rep(c("Failure", "RegCkpt", "Basetime"), each=5),
                  strategy,
                  makespan=c( 407060,115840,220600,407960,177300, 61110,527770,316690,16731,72220,7157000, 7157000, 7157000, 7157000, 7157000))

head(df2)

df2$group = factor(df2$group, levels=c("Failure","RegCkpt","Basetime"))

# Stacked barplot with multiple groups
#ggplot() +  geom_bar(data = df2, aes(x=strategy, y=makespan, fill=group), stat="identity")+ylim(0, 10000000)
ggplot() +  geom_bar(data = df2, aes(x=strategy, y=makespan, fill=group), stat="identity")+ylim(0, 10000000)+theme(legend.position='none');

# #Use position=position_dodge()
# ggplot(data=df2, aes(x=dose, y=len, fill=supp)) +
#  geom_bar(stat="identity", position=position_dodge())




#8*7
#P=1e^(-0.5)
rm(list=ls())
library(ggplot2)

strategy=rep(c("CKPTEACHITER", "CKPTEACHTASK", "CKPTYDAVE", "CKPTYDPER", "CKPTOPT"),3)
strategy <- factor(strategy, levels = c("CKPTEACHITER","CKPTEACHTASK","CKPTYDPER","CKPTYDAVE", "CKPTOPT"))

df2 <- data.frame(group=rep(c("Failure", "RegCkpt", "Basetime"), each=5),
                  strategy,
                  makespan=c( 1588800,422260,620250,1561900,554990,61110,527770,377830,16731,122220,7157000, 7157000, 7157000, 7157000, 7157000))

head(df2)

df2$group = factor(df2$group, levels=c("Failure","RegCkpt","Basetime"))

# Stacked barplot with multiple groups
ggplot() +  geom_bar(data = df2, aes(x=strategy, y=makespan, fill=group), stat="identity")+ylim(0, 10000000)

# #Use position=position_dodge()
# ggplot(data=df2, aes(x=dose, y=len, fill=supp)) +
#  geom_bar(stat="identity", position=position_dodge())































#11*11
#P=1e^(-0.5)
rm(list=ls())
library(ggplot2)
library(scales)
library(tikzDevice)

strategy=rep(c("CKPTEACHITER", "CKPTEACHTASK", "CKPTYDAVE", "CKPTYDPER", "CKPTOPT"),6)
strategy <- factor(strategy, levels = c("CKPTEACHITER","CKPTEACHTASK","CKPTYDPER","CKPTYDAVE", "CKPTOPT"))

df2 <- data.frame(type=c("type1", "type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2"),
                  group=c("Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime","Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime"),
                  strategy,
                  makespan=c(407060,115840,220600,407960,177300, 61110,527770,316690,16731,72220,7157000, 7157000, 7157000, 7157000, 7157000, 1588800,422260,620250,1561900,554990,61110,527770,377830,16731,122220,7157000, 7157000, 7157000, 7157000, 7157000))

head(df2)

df2$group = factor(df2$group, levels=c("Failure","RegCkpt","Basetime"))

tikz("C:/Users/DELL/Desktop/data_gopi_bar.tex",width=11,height=11)

# Stacked barplot with multiple groups
ggplot() +  geom_bar(data = df2, aes(x=strategy, y=makespan, fill=group), stat="identity") + 
  facet_wrap(~type) + theme(legend.position = "top") + 
  theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) +
  theme(legend.title = element_text(size=14), 
          legend.text = element_text(size=16))
dev.off()




