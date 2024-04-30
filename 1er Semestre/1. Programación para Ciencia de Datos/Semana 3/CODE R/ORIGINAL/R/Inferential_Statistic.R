setwd("D:/Statistical_Learning_V4")
datos= read.csv('winequality-white.csv', sep =";")
head(datos)
library(psych)
describe(datos)

summary(datos$fixed.acidity)

table(datos$quality)

x=datos$fixed.acidity
y=datos$alcohol

par(mfrow = c(1, 2)) 
hist(x)
hist(y)

# Data distribution 

par(mfrow = c(2, 2)) 

hist(x,freq=FALSE,col='gray',border="black",ylim=c(0,0.6)) 

lines(density(x),col="blue",lwd=2)

qqnorm(x, pch=19,col = "blue",ylim=c(3,15),xlim=c(-4,4)) 
qqline(x,col="black",lwd=3)

hist(y,freq=FALSE,col='gray',border="black",ylim=c(0,0.6))
lines(density(y),col="red",lwd=2)
qqnorm(y, pch=19,col = "red",ylim=c(3,15),xlim=c(-4,4)) 
qqline(y,col="black",lwd=3)

shapiro.test(x)


shapiro.test(y)

mean(x)

mean(y)
########################################################################
# Test about mean 
########################################################################
# Ejemplo 1
#  Considering 
#           H0: mu  = 0
#           H1: mu <> 0    
t.test(x,conf.level = 0.95)
t.test(x)
# Ejemplo 2
#  Considering 
#           H0: mu  = 6.85
#           H1: mu <> 6.85    

t.test(x,mu=6.85)

########################################################################
# Other options
#           H0: mu  >= mu_test
#           H1: mu  < mu_test    
# Ejemplo 3
#  Considering 
#           H0: mu  >= 6.10
#           H1: mu < 6.10  
t.test(x , mu=6.10, alternative = 'less')
# Ejemplo 4
#  Considering 
#           H0: mu<= 6.10
#           H1: mu > 6.10 
t.test(x , mu=6.10, alternative = 'greater')
########################################################################
# Comparison of means
#           H0: mu_A  = mu_B
#           H1: mu_A <> mu_B    

x_A=datos$fixed.acidity[datos$quality>6]
x_B=datos$fixed.acidity[datos$quality<=6]
mean(x_A)
mean(x_B)
# Ejemplo 5
#           H0: mu_A  = mu_B
#           H1: mu_A <> mu_B
t.test(x_A,x_B)
# Ejemplo 6
#           H0: mu_A  >= mu_B
#           H1: mu_A < mu_B
t.test(x_A,x_B, alternative = 'less')
# Ejemplo 7
#           H0: mu_A  <= mu_B
#           H1: mu_A > mu_B
t.test(x_A,x_B, alternative = 'greater')

########################################################################
# Test about proportion 


observations<-sum(datos$quality>6)
total<-length(datos$quality)
prop_obs <- observations/total
prop_obs
prop.test(observations,total,p=0.21) 
# Other options
prop.test(observations,total,p=0.2, alternative = 'less',conf.level = 0.9) 
prop.test(observations,total,p=0.2, alternative = 'greater',conf.level = 0.9) 
########################################################################
# Variance test

#           H0: var_A  = var_B
#           H1: var_A <> var_B 

var.test(datos$alcohol[datos$quality >6],datos$alcohol[datos$quality <=6] )
########################################################################
# Normality test
x=datos$fixed.acidity
hist(x,main="Fixed acidity")
#           H0: x is normal 
#           H1: x isn't normal


shapiro.test(x)


shapiro.test(y)
########################################################################

# https://r-graph-gallery.com/199-correlation-matrix-with-ggally.html

#library(psych)
corPlot(datos, upper=FALSE,main = "Matriz de correlaci?n",diag=FALSE,colors = FALSE)  

grad <- colorRampPalette(c("#B52127", "white", "#2171B5"))

corPlot(datos, numbers=TRUE,upper=FALSE,main = "Matriz de correlaci?n",diag=FALSE,gr = grad)  
########################################################################

cor(x,y)

cor.test(x, y, method="pearson")
cor.test(x, y, method="kendall")
cor.test(x, y, method="pearson",alternative = "greater")
########################################################################






