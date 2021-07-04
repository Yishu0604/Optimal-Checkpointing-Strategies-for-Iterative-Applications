## Main Paper Figures
# Main paper Figure 7 neuroscience
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.0719 ,   1.0675  ,  1.0531,    1.0348 ,   1.0000 ,   1.0008,    1.0008  ,  1.0241 ,   1.1147,    1.7976 ,   1.0074  ,  1.0062  ,  1.0299 ,   1.1244,    1.8303 ,1.0068   , 1.0152   , 1.0390 ,   1.0413 ,   1.0366))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top")


# Main paper Figure 8 neurosciecne Barplots
# 6.2*6.2
rm(list=ls())
library(ggplot2)
library(scales)
library(tikzDevice)


strategy=rep(c("CKPTEACHITER", "CKPTEACHTASK", "CKPTYDAVE", "CKPTYDPER", "CKPTOPT"),6)
strategy <- factor(strategy, levels = c("CKPTEACHITER","CKPTEACHTASK","CKPTYDPER","CKPTYDAVE", "CKPTOPT"))

df2 <- data.frame(type=c("type1", "type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2"),
                  group=c("Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime","Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime"),
                  strategy,
                  makespan=1.0*10^6*c( 0.4071  ,  0.1158   , 0.2206 ,   0.4083   , 0.1773,    0.0611  ,  0.5278   , 0.3167  ,  0.0167  ,  0.0723  ,  7.1570  ,  7.1570  ,  7.1570  ,  7.1570 ,   7.1570 ,   1.5888  ,  0.4223 ,   0.6202, 1.5642,    0.5549,    0.0611  ,  0.5278   , 0.3778   , 0.0167  ,  0.1223  ,  7.1570 ,   7.1570  ,  7.1570 ,   7.1570   , 7.1570))

head(df2)

df2$group = factor(df2$group, levels=c("Failure","RegCkpt","Basetime"))

tikz("C:/Users/DELL/Desktop/data_gopi_bar_new.tex",width=6.2,height=6.2)

# Stacked barplot with multiple groups
ggplot() +  geom_bar(data = df2, aes(x=strategy, y=makespan, fill=group), stat="identity") + 
  facet_grid(type~.) + theme(legend.position = "top") + 
  theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) +
  theme(legend.title = element_text(size=14), 
        legend.text = element_text(size=16))

dev.off()

# Main paper Figure 9 scalability box plots
rm(list=ls())
library(ggplot2)
library(scales)
data<-read.table('C:/Users/DELL/Desktop/code-final20210628/data_gopi_scalability.csv', header=TRUE, sep=',', row.names = 'row_name')

newdata<-data[c(1:2000), ]
newdata$P <- as.factor(newdata$N)

new_N<-factor(newdata$N,labels=c('1e+01', "1e+1.5", "1e+02", "1e+2.5", "1e+3"))

p<-ggplot() + geom_boxplot(data=newdata, aes(x=new_N,y=ratio,fill=strategy),outlier.size = 0.5)

p

p+ xlab(expression(number~of~iterations~N[iter])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top") 




# Main paper Figure 10 pertubation
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.0718 ,   1.0672 ,   1.0532  ,  1.0350 ,   1.0000    ,0.9999  ,  1.0000,    1.0229  ,  1.1177   , 1.8325   , 1.0071   , 1.0063 ,   1.0302  ,  1.1263  ,  1.8565,    0.9998  ,  1.0144 ,1.0329   , 1.0472 ,   1.0280))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top")


# Main paper Figure 11 synthetic type=1 n=10
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.0987  ,  1.0942,    1.0716,   1.0479  ,  1.0173  ,  1.0000 ,   1.0003,    1.0071,    1.0727   , 1.5610  ,  1.0144  ,  1.0127 ,   1.0207 ,   1.0922  ,  1.6164 ,1.0014 ,   1.0070  ,  1.0111 ,   1.0230 ,   1.0578))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top")




# Main paper Figure 12 synthetic type=1 n=20
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.0993 ,   1.0955  ,  1.0807  ,  1.0637   , 1.0360  ,  1.0002 ,   1.0003  ,  1.0209 ,   1.1172 ,   1.7895  ,  1.0026 ,   1.0023    ,1.0226   , 1.1202  ,  1.7974, 1.0013  ,  1.0053   , 1.0125    ,1.0228 ,   1.0198))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top") 




#Main paper figure 13 eta varies, n=10 type=1 P=1e-0.5
#5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("0.01", "0.05", "0.10", "0.15", "0.20"),levels=c("0.01", "0.05", "0.10", "0.15", "0.20"))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.0007   , 1.0174 ,   1.0479 ,   1.0820  ,  1.1193  ,  1.1160   , 1.0910,    1.0727  ,  1.0579   , 1.0496  ,  1.1172 ,   1.1004  ,  1.0922  ,  1.0880 ,1.0877  ,  1.0025 ,   1.0102  ,  1.0230 ,   1.0221 ,   1.0291))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(eta)) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top") 











## WSM Figures

# WSM Figure 1 GCR n=10 CCR=0.1
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.005019,1.003055,1.000000,1.000000,1.000094,1.001090,1.001997,1.031634,1.131987,1.762106,1.000090,1.000999,1.030342,1.130633,1.760781,0.999964,1.000199,1.001097,1.000000,1.000000))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top")



# WSM Figure 2 GCR n=10 CCR=0.2
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.010311,1.007405,1.001535,1.000004,1.000467,1.000907,1.001415,1.027975,1.125676,1.751184,1.000454,1.000418,1.026921,1.124522,1.748082,0.999968,0.999960,1.000000,1.000000,1.000000))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top")

# WSM Figure 3 GCR n=10 CCR=1
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.053350,1.046051,1.029425,1.013341,1.002207,1.001004,1.001197,1.015870,1.094958,1.671512,1.004104,1.000200,1.014764,1.093454,1.668731,1.000038,0.999744,1.000000,1.000000,1.000000))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top")

# WSM Figure 4 GCR n=10 CCR=5
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.270066,1.251506,1.204244,1.153508,1.075543,1.000027,0.999024,1.000961,1.036985,1.424585,1.024253,1.011671,1.000000,1.036102,1.422424,1.000082,1.000698,1.004094,1.000000,1.028408))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top")

# WSM Figure 5 GCR n=10 CCR=10
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.540834,1.509179,1.433555,1.346080,1.218502,1.000055,1.000000,1.000957,1.003730,1.256348,1.049960,1.030378,1.000000,1.002621,1.254905,0.999891,1.000623,1.007723,1.016693,1.036557))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top")

# WSM Figure 6 GCR n=20 CCR=0.1
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.005203,1.003884,1.001247,1.000000,1.000000,1.001000,1.002257,1.025718,1.102419,1.564802,1.000000,1.001258,1.024724,1.101414,1.563296,1.000000,1.000022,1.000000,1.002709,1.000000))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top")

# WSM Figure 7 GCR n=20 CCR=0.2
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.010561,1.008730,1.004271,1.000156,1.000000,1.001156,1.001864,1.023568,1.097055,1.556332,1.000156,1.000866,1.022576,1.095797,1.553526,1.000000,1.000044,1.000000,1.000000,1.000000))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top")

# WSM Figure 8 GCR n=20 CCR=1
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.053822,1.049343,1.037379,1.024909,1.004787,1.000003,1.000997,1.015182,1.077194,1.487494,1.001823,1.000000,1.014198,1.076203,1.486273,0.999956,1.000000,0.999947,1.000376,1.000000))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top")

# WSM Figure 9 GCR n=20 CCR=5
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.271440,1.259131,1.226805,1.192395,1.125624,1.000014,1.001979,1.002354,1.037010,1.332116,1.011715,1.004340,1.001382,1.035727,1.330418,1.000000,0.999980,1.000880,1.002565,1.000000))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top")

# WSM Figure 10 GCR n=20 CCR=10
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.543632,1.522890,1.476007,1.417673,1.310998,1.001025,0.999021,1.000969,1.014789,1.216233,1.024586,1.012257,1.000000,1.013767,1.215287,1.000055,1.000417,1.000000,1.013740,1.000000))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top")


# WSM Figure 11 synthetic type=2 n=10
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.122948,1.118261,1.098871,1.077103,1.046488,1.000000,1.000496,1.011006,1.078517,1.569536,1.006162,1.003831,1.015073,1.084250,1.584470,1.000516,1.003533,1.015397,1.034218,1.050239))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top")

# WSM Figure 12 synthetic type=2 n=20
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.137432,1.133360,1.119233,1.098506,1.064632,1.000959,1.000916,1.022609,1.115371,1.769905,1.008311,1.007957,1.030873,1.126195,1.810738,1.000586,1.004879,1.013659,1.029225,1.039318))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top")




# WSM Figure 13 synthetic (a) type=1 n=10 P=1e-3
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.009726,1.049021,1.098688,1.147847,1.197766,1.000344,1.000339,1.000000,1.000000,1.000320,1.001263,1.006968,1.014365,1.021538,1.029156,1.000433,1.000775,1.001374,1.001799,1.002298))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top")




# WSM Figure 13 synthetic (b) type=2 n=10 P=1e-3
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.012118,1.061347,1.122948,1.185032,1.247124,1.000503,1.000501,1.000000,1.000496,1.000494,1.000400,1.002812,1.006162,1.009616,1.012864,1.000037,1.000882,1.000516,1.001032,0.999600))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top")



# WSM Figure 14 synthetic (a) type=1 n=10 P=1e-2
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.007525,1.045595,1.094210,1.142256,1.190678,1.000605,1.000338,1.000331,1.000324,1.000317,1.001765,1.006502,1.012742,1.019049,1.025577,1.001293,1.004401,1.007039,1.008145,1.009389))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top")

# WSM Figure 14 synthetic (b) type=2 n=10 P=1e-2
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.010149,1.057631,1.118261,1.178184,1.238120,1.001337,1.000499,1.000496,1.000493,1.000490,1.001382,1.001974,1.003831,1.005866,1.007816,1.001427,1.003819,1.003533,1.009439,1.010091))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top")

# WSM Figure 15 synthetic (a) type=1 n=10 P=1e-1
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.002560,1.030846,1.071647,1.116418,1.160508,1.024272,1.014163,1.007078,1.004424,1.001418,1.025346,1.020685,1.020659,1.024805,1.030119,1.002619,1.007054,1.011071,1.017238,1.023300))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top")

# WSM Figure 15 synthetic (b) type=2 n=10 P=1e-1
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.005698,1.044114,1.098871,1.154844,1.210506,1.025341,1.015089,1.011006,1.008049,1.004489,1.025103,1.017119,1.015073,1.013942,1.012895,1.003284,1.011538,1.015397,1.013177,1.038225))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top")

# WSM Figure 16 synthetic (a) type=1 n=10 P=1e-0.5
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.000680,1.017403,1.047890,1.082012,1.119264,1.116001,1.090988,1.072720,1.057926,1.049596,1.117165,1.100372,1.092177,1.087996,1.087726,1.002543,1.010244,1.023018,1.022106,1.029054))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top")

# WSM Figure 16 synthetic (b) type=2 n=10 P=1e-0.5
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.002283,1.030372,1.077103,1.124917,1.173013,1.115309,1.091779,1.078517,1.067782,1.057213,1.115592,1.095460,1.084250,1.076956,1.069017,1.003404,1.005109,1.034218,1.030875,1.050958))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top")



# WSM Figure 17 synthetic (a) type=1 n=10 P=1e-0.1
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.000000,1.004251,1.017327,1.032970,1.059311,1.684001,1.618698,1.560972,1.506531,1.472178,1.687185,1.650497,1.616382,1.588678,1.582059,1.002029,1.012679,1.057794,1.055337,1.049812))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top")


# WSM Figure 17 synthetic (b) type=2 n=10 P=1e-0.1
# 5*6.5
rm(list=ls())
library(ggplot2)
xdata<-factor(c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'),levels=c("1e-03", "1e-02", "1e-01", "1e-0.5", '1e-0.1'))

df <- data.frame(strategy = rep(c("CKPTEACHTASK", "CKPTYDPER", "CKPTEACHITER", "CKPTYDAVE"), each=5),
                 xdata,
                 ydata=c(1.000000,1.015143,1.046488,1.083126,1.118188,1.677121,1.618670,1.569536,1.528046,1.489386,1.679022,1.628164,1.584470,1.553248,1.523909,1.001688,1.020863,1.050239,1.069649,1.027898))

p<-ggplot(data=df, mapping=aes(x=xdata, y=ydata, group=strategy)) +
  geom_line(aes(linetype= strategy,color=strategy))+
  geom_point(aes(color=strategy))+
  scale_linetype_manual(values = c('solid','dashed', 'dotted', 'dotdash'))

p

p+ xlab(expression(P[fail])) + ylab(expression(makespan~normalized~by~MS[optimal])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = "top")



# WSM Figure 18 neurosciecne
# 6.2*15.5
rm(list=ls())
library(ggplot2)
library(scales)
library(tikzDevice)


strategy=rep(c("CKPTEACHITER", "CKPTEACHTASK", "CKPTYDAVE", "CKPTYDPER", "CKPTOPT"),15)
strategy <- factor(strategy, levels = c("CKPTEACHITER","CKPTEACHTASK","CKPTYDPER","CKPTYDAVE", "CKPTOPT"))

df2 <- data.frame(type=c("type1", "type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type3", "type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type4", "type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type5", "type5","type5","type5","type5","type5","type5","type5","type5","type5","type5","type5","type5","type5","type5"),
                  group=c("Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime","Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime","Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime","Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime","Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime"),
                  strategy,
                  makespan=1.0*10^7*c(0.0004,0.0001,0.0019,0.0014,0.0007,0.0061,0.0528,0.0057,0.0008,0.0008,0.7157,0.7157,0.7157,    0.7157, 0.7157,    0.0038  ,  0.0011 ,   0.0058 ,   0.0044 ,   0.0038  ,  0.0061,    0.0528  ,  0.0106 ,   0.0017  ,  0.0017 ,   0.7157  ,  0.7157,    0.7157, 0.7157  ,  0.7157 ,   0.0407   , 0.0116 ,   0.0221,    0.0408  ,  0.0177  ,  0.0061,   0.0528 ,   0.0317 ,   0.0017,    0.0072  ,  0.7157 ,   0.7157, 0.7157   , 0.7157 ,   0.7157  ,  0.1589 ,   0.0422  ,  0.0620  ,  0.1564  ,  0.0555,    0.0061 ,   0.0528  ,  0.0378  ,  0.0017  ,  0.0122  ,  0.7157, 0.7157   , 0.7157 ,   0.7157 ,   0.7157   , 1.0667 ,   0.2102  ,  0.2525 ,   1.0433  ,  0.2102  ,  0.0061,    0.0528,    0.0456,    0.0017  ,  0.0528, 0.7157  ,  0.7157  ,  0.7157   , 0.7157 ,   0.7157))

head(df2)

df2$group = factor(df2$group, levels=c("Failure","RegCkpt","Basetime"))

tikz("C:/Users/DELL/Desktop/data_bar_neuroscience.tex",width=6.2,height=15.5)

# Stacked barplot with multiple groups
ggplot() +  geom_bar(data = df2, aes(x=strategy, y=makespan, fill=group), stat="identity") + 
  facet_grid(type~.) + theme(legend.position = "top") + 
  theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) +
  theme(legend.title = element_text(size=14), 
        legend.text = element_text(size=16))

dev.off()


# WSM Figure 19 GCR n=10, CCR=0.1
# 6.2*15.5
rm(list=ls())
library(ggplot2)
library(scales)
library(tikzDevice)


strategy=rep(c("CKPTEACHITER", "CKPTEACHTASK", "CKPTYDAVE", "CKPTYDPER", "CKPTOPT"),15)
strategy <- factor(strategy, levels = c("CKPTEACHITER","CKPTEACHTASK","CKPTYDPER","CKPTYDAVE", "CKPTOPT"))

df2 <- data.frame(type=c("type1", "type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type3", "type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type4", "type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type5", "type5","type5","type5","type5","type5","type5","type5","type5","type5","type5","type5","type5","type5","type5"),
                  group=c("Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime","Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime","Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime","Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime","Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime"),
                  strategy,
                  makespan=1.0*10^10*c(0.0027  ,  0.0003  ,  0.0035 ,   0.0100,    0.0035    ,0.0040   , 0.0400 ,   0.0031 ,   0.0040 ,   0.0033 ,   7.3003 ,   7.3003,    7.3003  ,  7.3003  ,  7.3003,    0.0252, 0.0027 ,   0.0107 ,   0.0325,    0.0106  ,  0.0040    ,0.0400   , 0.0100 ,   0.0040 ,   0.0100,    7.3003 ,   7.3003 ,   7.3003 ,   7.3003  ,  7.3003 ,   0.2896    ,0.0295, 0.0581 ,   0.2972    ,0.0294    ,0.0040  ,  0.0400,    0.0200    ,0.0040   , 0.0400  ,  7.3003,    7.3003 ,   7.3003    ,7.3003  ,  7.3003  ,  1.1177   , 0.1078 ,   0.1075,  1.1266,    0.1075 ,   0.0040 ,   0.0400,    0.0400 ,   0.0040  ,  0.0400  ,  7.3003,    7.3003 ,   7.3003 ,  7.3003    ,7.3003   , 6.4602 ,   0.4620  ,  0.4601 ,  6.4744, 0.4604 ,   0.0040 ,   0.0400  ,  0.0400 ,   0.0040 ,   0.0400  ,  7.3003  ,  7.3003 ,   7.3003 ,   7.3003 ,   7.3003))

head(df2)

df2$group = factor(df2$group, levels=c("Failure","RegCkpt","Basetime"))

tikz("C:/Users/DELL/Desktop/data_bar_GCR_n10_CCR0_1.tex",width=6.2,height=15.5)

# Stacked barplot with multiple groups
ggplot() +  geom_bar(data = df2, aes(x=strategy, y=makespan, fill=group), stat="identity") + 
  facet_grid(type~.) + theme(legend.position = "top") + 
  theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) +
  theme(legend.title = element_text(size=14), 
        legend.text = element_text(size=16))

dev.off()



# WSM Figure 20 GCR n=10, CCR=1
# 6.2*15.5
rm(list=ls())
library(ggplot2)
library(scales)
library(tikzDevice)


strategy=rep(c("CKPTEACHITER", "CKPTEACHTASK", "CKPTYDAVE", "CKPTYDPER", "CKPTOPT"),15)
strategy <- factor(strategy, levels = c("CKPTEACHITER","CKPTEACHTASK","CKPTYDPER","CKPTYDAVE", "CKPTOPT"))

df2 <- data.frame(type=c("type1", "type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type3", "type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type4", "type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type5", "type5","type5","type5","type5","type5","type5","type5","type5","type5","type5","type5","type5","type5","type5"),
                  group=c("Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime","Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime","Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime","Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime","Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime"),
                  strategy,
                  makespan=1.0*10^10*c( 0.0028 ,   0.0004  ,  0.0094   , 0.0174 ,   0.0101  ,  0.0400,    0.4000 ,   0.0103 ,   0.0100 ,   0.0100  ,  7.3003 ,   7.3003,    7.3003,    7.3003   , 7.3003 ,   0.0267, 0.0038,   0.0338   , 0.0340 ,   0.0332 ,   0.0400  ,  0.4000 ,   0.0308  ,  0.0400,    0.0320 ,   7.3003 ,   7.3003   , 7.3003,    7.3003 ,   7.3003 ,   0.2957  ,  0.0428, 0.1246 ,   0.3031,    0.1247  ,  0.0400  ,  0.4000 ,   0.1000 ,   0.0400  ,  0.0999    ,7.3003 ,   7.3003 ,   7.3003  ,  7.3003 ,   7.3003 ,   1.1399  ,  0.1576,    0.2537 ,1.1491  ,  0.2538    ,0.0400  ,  0.4000 ,   0.2000   , 0.0400 ,   0.2000 ,   7.3003  ,  7.3003 ,   7.3003 ,   7.3003 ,   7.3003  ,  6.6237,    0.6788  ,  0.6605 ,   6.6386,  0.6606,   0.0400   , 0.4000 ,   0.4000,    0.0400,    0.4000,    7.3003 ,   7.3003,    7.3003,    7.3003  ,  7.3003))

head(df2)

df2$group = factor(df2$group, levels=c("Failure","RegCkpt","Basetime"))

tikz("C:/Users/DELL/Desktop/data_bar_GCR_n10_CCR1.tex",width=6.2,height=15.5)

# Stacked barplot with multiple groups
ggplot() +  geom_bar(data = df2, aes(x=strategy, y=makespan, fill=group), stat="identity") + 
  facet_grid(type~.) + theme(legend.position = "top") + 
  theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) +
  theme(legend.title = element_text(size=14), 
        legend.text = element_text(size=16))

dev.off()





# WSM Figure 21 GCR n=10, CCR=10
# 6.2*15.5
rm(list=ls())
library(ggplot2)
library(scales)
library(tikzDevice)


strategy=rep(c("CKPTEACHITER", "CKPTEACHTASK", "CKPTYDAVE", "CKPTYDPER", "CKPTOPT"),15)
strategy <- factor(strategy, levels = c("CKPTEACHITER","CKPTEACHTASK","CKPTYDPER","CKPTYDAVE", "CKPTOPT"))

df2 <- data.frame(type=c("type1", "type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type3", "type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type4", "type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type5", "type5","type5","type5","type5","type5","type5","type5","type5","type5","type5","type5","type5","type5","type5"),
                  group=c("Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime","Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime","Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime","Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime","Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime"),
                  strategy,
                  makespan=1.0*10^10*c(0.0034 ,   0.0022 ,   0.0324   , 0.0296  ,  0.0294 ,   0.4000,    4.0000 ,   0.0328 ,   0.0336,    0.0336 ,   7.3003  ,  7.3003 ,   7.3003 ,   7.3003  ,  7.3003 ,   0.0309, 0.0226,    0.1100  ,  0.1126  ,  0.1048 ,   0.4000 ,   4.0000,    0.1028 ,   0.1004    ,0.1004,    7.3003  ,  7.3003  ,  7.3003  ,  7.3003  ,  7.3003 ,   0.3522   , 0.2407 ,0.4814   , 0.3598  ,  0.3522 ,   0.4000 ,   4.0000 ,   0.3336 ,   0.4004 ,   0.4000,    7.3003  ,  7.3003  ,  7.3003 ,   7.3003  ,  7.3003 ,   1.3877  ,  0.8980 ,   1.3414, 1.3969 ,   0.9635  ,  0.4000 ,   4.0000   , 0.5716  ,  0.4004 ,   0.7996 ,   7.3003 ,   7.3003,    7.3003 ,   7.3003 ,   7.3003  ,  8.3593,   4.2985 ,   4.9556,    8.3744, 4.2855,    0.4000 ,   4.0000  ,  1.0004  ,  0.4004  ,  1.1996 ,   7.3003,    7.3003 ,   7.3003 ,   7.3003,    7.3003))

head(df2)

df2$group = factor(df2$group, levels=c("Failure","RegCkpt","Basetime"))

tikz("C:/Users/DELL/Desktop/data_bar_GCR_n10_CCR10.tex",width=6.2,height=15.5)

# Stacked barplot with multiple groups
ggplot() +  geom_bar(data = df2, aes(x=strategy, y=makespan, fill=group), stat="identity") + 
  facet_grid(type~.) + theme(legend.position = "top") + 
  theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) +
  theme(legend.title = element_text(size=14), 
        legend.text = element_text(size=16))

dev.off()







# WSM Figure 22 synthetic c_i proportional
# 6.2*15.5
rm(list=ls())
library(ggplot2)
library(scales)
library(tikzDevice)


strategy=rep(c("CKPTEACHITER", "CKPTEACHTASK", "CKPTYDAVE", "CKPTYDPER", "CKPTOPT"),15)
strategy <- factor(strategy, levels = c("CKPTEACHITER","CKPTEACHTASK","CKPTYDPER","CKPTYDAVE", "CKPTOPT"))

df2 <- data.frame(type=c("type1", "type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type3", "type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type4", "type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type5", "type5","type5","type5","type5","type5","type5","type5","type5","type5","type5","type5","type5","type5","type5"),
                  group=c("Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime","Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime","Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime","Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime","Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime"),
                  strategy,
                  makespan=1.0*10^6*c(0.0015  ,  0.0003   , 0.0076,    0.0042 ,   0.0042,    0.0585    ,0.3832 ,   0.0087 ,   0.0034  ,  0.0034  ,  3.8317  ,  3.8317  ,  3.8317   , 3.8317 ,  3.8317  ,  0.0141, 0.0023 ,   0.0241  ,  0.0146,    0.0134,    0.0585 ,   0.3832 ,   0.0267  ,  0.0101 ,   0.0101  ,  3.8317  ,  3.8317 ,   3.8317 ,   3.8317   , 3.8317  ,  0.1490,    0.0240 ,0.0872  ,  0.1425  ,  0.0869  ,  0.0585 ,   0.3832 ,   0.0809 ,   0.0101  ,  0.0368 ,   3.8317  ,  3.8317,    3.8317,    3.8317 ,   3.8317 ,   0.5973,    0.0889 ,   0.2099, 0.5663 ,   0.1530,    0.0585 ,   0.3832,    0.1601,    0.0101,    0.1216 ,   3.8317 ,   3.8317 ,   3.8317,    3.8317 ,   3.8317 ,   3.4230 ,   0.3874   , 0.7533 ,   3.2190, 0.4388  ,  0.0585  ,  0.3832 ,   0.1977 ,   0.0101,    0.2528  ,  3.8317,    3.8317 ,   3.8317  ,  3.8317   , 3.8317))

head(df2)

df2$group = factor(df2$group, levels=c("Failure","RegCkpt","Basetime"))

tikz("C:/Users/DELL/Desktop/data_bar_synthetic_ci_proportional.tex",width=6.2,height=15.5)

# Stacked barplot with multiple groups
ggplot() +  geom_bar(data = df2, aes(x=strategy, y=makespan, fill=group), stat="identity") + 
  facet_grid(type~.) + theme(legend.position = "top") + 
  theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) +
  theme(legend.title = element_text(size=14), 
        legend.text = element_text(size=16))

dev.off()




# WSM Figure 23 synthetic c_i randomly drawn
# 6.2*15.5
rm(list=ls())
library(ggplot2)
library(scales)
library(tikzDevice)


strategy=rep(c("CKPTEACHITER", "CKPTEACHTASK", "CKPTYDAVE", "CKPTYDPER", "CKPTOPT"),15)
strategy <- factor(strategy, levels = c("CKPTEACHITER","CKPTEACHTASK","CKPTYDPER","CKPTYDAVE", "CKPTOPT"))

df2 <- data.frame(type=c("type1", "type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type1","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type2","type3", "type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type3","type4", "type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type4","type5", "type5","type5","type5","type5","type5","type5","type5","type5","type5","type5","type5","type5","type5","type5"),
                  group=c("Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime","Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime","Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime","Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime","Failure","Failure","Failure","Failure","Failure", "RegCkpt","RegCkpt","RegCkpt","RegCkpt","RegCkpt", "Basetime", "Basetime", "Basetime", "Basetime", "Basetime"),
                  strategy,
                  makespan=1.0*10^6*c(0.0014 ,   0.0003,   0.0085  ,  0.0042  ,  0.0042  ,  0.0278 ,   0.4779    ,0.0046 ,   0.0042 ,   0.0042 ,   3.8317  ,  3.8317  ,  3.8317,    3.8317 ,   3.8317,    0.0133  ,  0.0025 ,   0.0270 ,0.0149  ,  0.0130  ,  0.0278 ,   0.4779  ,  0.0139  ,  0.0125  ,  0.0125  ,  3.8317   , 3.8317 ,   3.8317,    3.8317 ,   3.8317 ,   0.1443  ,  0.0248 ,   0.1010 ,   0.1443 ,   0.0724 ,   0.0278 , 0.4779 ,   0.0736 ,   0.0125 ,   0.0403    ,3.8317  ,  3.8317,    3.8317   , 3.8317   , 3.8317  ,  0.5765   , 0.0940 ,   0.2501 ,   0.5685  ,  0.1648 ,   0.0278   , 0.4779   , 0.1457 ,   0.0125,  0.0913 ,   3.8317 ,   3.8317,    3.8317,    3.8317 ,   3.8317,    3.2906   , 0.4083   , 0.7316  ,  3.2296  ,  0.4899 ,   0.0278   , 0.4779   , 0.1723 ,   0.0125   , 0.1866 ,   3.8317,    3.8317 ,3.8317  ,  3.8317 ,   3.8317))

head(df2)

df2$group = factor(df2$group, levels=c("Failure","RegCkpt","Basetime"))

tikz("C:/Users/DELL/Desktop/data_bar_synthetic_ci_randomlydrawn.tex",width=6.2,height=15.5)

# Stacked barplot with multiple groups
ggplot() +  geom_bar(data = df2, aes(x=strategy, y=makespan, fill=group), stat="identity") + 
  facet_grid(type~.) + theme(legend.position = "top") + 
  theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +
  theme(plot.title=element_text(hjust=0.5)) +
  theme(legend.title = element_text(size=14), 
        legend.text = element_text(size=16))

dev.off()



