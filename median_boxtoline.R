# figure 7
# 5*6.5
rm(list=ls())
library(ggplot2)

xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.0719,1.0675,1.0531,1.0348,1.0000,1.0008,1.0008,1.0239,1.1142,1.7976,1.0074,1.0062,1.0299,1.1244,1.8303,1.0068,1.0152,1.0390,1.0413,1.0366))

#new_xdata<-factor(df$xdata,labels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top") 




# figure 10
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.0717,1.0671,1.0532,1.0350,1.0000,0.9999,1.0000,1.0229,1.1167,1.8323,1.0071,1.0063,1.0302,1.1263,1.8565,0.9998,1.0144,1.0329,1.0472,1.0280))

#new_xdata<-factor(df$xdata,labels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top") 



# figure 11
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.0987,1.0942,1.0717,1.0479,1.0172,1.0000,1.0003,1.0071,1.0727,1.5610,1.0144,1.0127,1.0207,1.0922,1.6164,1.0014,1.0070,1.0111,1.0230,1.0578))

#new_xdata<-factor(df$xdata,labels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top") 






# figure 12
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.1229,1.1183,1.0989,1.0771,1.0465,1.0000,1.0005,1.0110,1.0785,1.5698,1.0062,1.0038,1.0151,1.0842,1.5851,1.0005,1.0035,1.0154,1.0342,1.0504))

#new_xdata<-factor(df$xdata,labels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top") 




# Appendix figure 7
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.0993,1.0955,1.0807,1.0637,1.0360,1.0002,1.0003,1.0209,1.1172,1.7895,1.0026,1.0023,1.0226,1.1202,1.7974,1.0013,1.0053,1.0125,1.0228,1.0198))

#new_xdata<-factor(df$xdata,labels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top") 

# Appendix figure 8
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.1374,1.1334,1.1192,1.0986,1.0658,1.0010,1.0009,1.0226,1.1147,1.7740,1.0083,1.0080,1.0309,1.1267,1.8132,1.0006,1.0049,1.0137,1.0293,1.0404))

#new_xdata<-factor(df$xdata,labels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top") 



# Appendix figure 1
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.0350,1.0315,1.0177,1.0062,1.0009,1.0010,1.0010,1.0196,1.1052,1.7058,1.0005,1.0000,1.0186,1.1043,1.7045,1.0005,1.0000,1.0022,1.0015,1.0000))

#new_xdata<-factor(df$xdata,labels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top") 




# Appendix figure 2
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.1765,1.1682,1.1360,1.0969,1.0355,1.0010,1.0010,1.0038,1.0589,1.5329,1.0041,1.0000,1.0028,1.0584,1.5309,0.9994,1.0068,1.0120,1.0098,1.0041))

#new_xdata<-factor(df$xdata,labels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top") 



# Appendix figure 3
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.8846,1.8574,1.7918,1.6670,1.4437,1.0000,0.9990,1.0010,1.0009,1.2347,1.0243,1.0117,1.0000,1.0000,1.2345,1.0025,1.0031,1.0526,1.0823,1.0751))

#new_xdata<-factor(df$xdata,labels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top") 



# Appendix figure 4
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.0624,1.0596,1.0473,1.0332,1.0120,1.0010,1.0010,1.0147,1.0774,1.4931,1.0000,1.0000,1.0138,1.0763,1.4931,1.0004,1.0024,1.0028,1.0013,1.0028))

#new_xdata<-factor(df$xdata,labels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top")



# Appendix figure 5
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.3138,1.3083,1.2783,1.2385,1.1619,1.0000,1.0010,1.0022,1.0424,1.3688,1.0018,1.0000,1.0012,1.0417,1.3688,1.0004,1.0066,1.0089,1.0106,1.0065))

#new_xdata<-factor(df$xdata,labels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top") 



# Appendix figure 6
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(2.5701,2.5460,2.4845,2.3496,2.0569,1.0000,1.0020,1.0010,1.0009,1.1514,1.0117,1.0043,1.0000,1.0000,1.1511,1.0019,1.0176,1.0601,1.0794,1.1150))

#new_xdata<-factor(df$xdata,labels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top") 


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








#P=1e^(-0.5) and 1e^(-1) 
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

tikz("C:/Users/DELL/Desktop/data_gopi_bar.tex",width=11,height=8)

# Stacked barplot with multiple groups
ggplot() +  geom_bar(data = df2, aes(x=strategy, y=makespan, fill=group), stat="identity") + 
  facet_wrap(~type) + theme(legend.position = "top") + 
  theme(axis.title.x = element_text(size = 18, angle = 0),axis.title.y = element_text(size = 18, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) +
  theme(legend.title = element_text(size=14), 
        legend.text = element_text(size=16))
dev.off()
