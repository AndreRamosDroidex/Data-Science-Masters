setwd("D:/Statistical_Learning_V4")
datos= read.csv('Advertising.csv', sep =",")
head(datos)


library(psych)

describe(datos)

help(describe)

library(caret)

set.seed(123) # fijar la semilla

nrow(datos)

smp_size <- floor(0.7 * nrow(datos))

smp_size

train_ind <- sample(seq_len(nrow(datos)), size = smp_size)

train_ind

# Dividiendo la data en entrenamiento y prueba
train <- datos[train_ind, ]
test <- datos[-train_ind, ]

head(train)

head(test)

nrow(train)
nrow(test)


test  # La usaremos para evaluar la capacidad predictiva de los modelos.

par(mfrow = c(1, 3))
hist(train$Sales,col="blue", main="Histogram of Sales")
qqnorm(train$Sales, pch=19,col = "blue", main="Q-Q plot of Sales") 
qqline(train$Sales,col="red",lwd=3)
boxplot(train$Sales, horizontal=FALSE,main="Box plot of Sales",col="blue")


shapiro.test(train$Sales)

par(mfrow = c(1, 3))


plot(train$TV,train$Sales,col="red")
plot(train$Radio,train$Sales,col="red")
plot(train$Newspaper,train$Sales,col="red")

corPlot(train, upper=FALSE,main = "Matriz de correlaci?n",diag=FALSE,colors = FALSE)  
grad <- colorRampPalette(c("#B52127", "white", "#2171B5"))
corPlot(datos, numbers=TRUE,upper=FALSE,main = "Matriz de correlaci?n",diag=FALSE,gr = grad)  
###############################################################################
### Simple Regression
###############################################################################
model1 <- lm(Sales ~ TV, data = train)
summary(model1)

# Modelo 1: sales = 7.193899 + 0.054286 * TV 

par(mfrow = c(2, 2))
plot(model1,col='blue')


# Normality 

model1$residuals

par(mfrow = c(1, 3))
hist(model1$residuals,col="blue", main="Model1: Histogram of Residuals")
qqnorm(model1$residuals, pch=19,col = "blue", main="Model1: Q-Q plot of Residuals") 
qqline(model1$residuals,col="red",lwd=3)

boxplot(model1$residuals, horizontal=FALSE,main="Model1: Box plot of Residuals",col="blue")

shapiro.test(model1$residuals)



library(lmtest)

# Hypothesis test of Homocedasticity

#  H0: There is Homocedasticity
#  Ha  There is no Homocedasticity
bptest(model1)

# Hypothesis test autocorrelation

#  H0: There is no autocorrelation among the residuals.
#  Ha  The residuals are autocorrelated

library(car)

dwt(model1, alternative = "two.sided")


# Validaci?n de supuestos para un modelo son.
  
  # 1. Normalidad del residuo.
  # 2. Homocedasticidad del residuo.
  # 3. El residuo no debe estar autocorrelacionado.


influencePlot(model1,col='blue')

datos[36,]

summary(influence.measures(model1))

MSE_model1=mean(model1$residuals^2)
MSE_model1
MAE_model1=mean(abs(model1$residuals))
MAE_model1

###############################################################################
### Multiple Regression
###############################################################################
model2 <- lm(Sales ~ ., data = train)
summary(model2)

# Model 2: 4.6899873 + 0.0541755 * TV + 0.1058366 * radio + 0.0006121 * newspaper

par(mfrow = c(2, 2))
plot(model2,col='green')


# Normality 

par(mfrow = c(1, 3))
hist(model2$residuals,col="green", main="Model2: Histogram of Residuals")
qqnorm(model2$residuals, pch=19,col = "green", main="Model2: Q-Q plot of Residuals") 
qqline(model2$residuals,col="red",lwd=3)

boxplot(model2$residuals, horizontal=FALSE,main="Model2: Box plot of Residuals",col="green")

shapiro.test(model2$residuals)

par(mfrow = c(2, 2))
plot(model2,col='green')


library(lmtest)

# Hypothesis test of Homocedasticity

#  H0: There is Homocedasticity
#  Ha  There is no Homocedasticity

bptest(model2)

# Hypothesis test autocorrelation

#  H0: There is no correlation among the residuals.
#  Ha  The residuals are autocorrelated

library(car)

dwt(model2, alternative = "two.sided")


influencePlot(model2,col='blue')

datos[17,]

summary(influence.measures(model2))

MSE_model2=mean(model2$residuals^2)
MSE_model2
MAE_model2=mean(abs(model2$residuals))
MAE_model2
summary(influence.measures(model2))
# Comparison of Simple and Multiple Regression
Table<-cbind(c(MSE_model1,MSE_model2),c(MAE_model1,MAE_model2))
colnames(Table)<-c("MSE","MAE")
rownames(Table)<-c("Simple Regression","Multiple Regression")
Table

library(stargazer)

stargazer(model1,model2, type="text", df=TRUE)

# Model 3: Considering TV and Radio

model3 <- lm(Sales ~ TV + Radio, data = train)
summary(model3)

# Model 4: Considering TV, Radio and TV*radio


model4 <- lm(Sales ~ TV + Radio + TV*Radio, data = train)

summary(model4)

x11()
par(mfrow = c(2, 2))
plot(model3,col='purple')
x11()
par(mfrow = c(2, 2))
plot(model4,col='orange')

# Normality test

#  H0: The residual is normal
#  Ha  The residual is no normal

shapiro.test(model3$residuals)

shapiro.test(model4$residuals)

# Hypothesis test of Homocedasticity

#  H0: There is Homocedasticity
#  Ha  There is no Homocedasticity

bptest(model3)
bptest(model4)

# Hypothesis test autocorrelation

#  H0: There is no correlation among the residuals.
#  Ha  The residuals are autocorrelated

dwt(model3, alternative = "two.sided")
dwt(model4, alternative = "two.sided")


MSE_model3=mean(model3$residuals^2)
MSE_model4=mean(model4$residuals^2)

MAE_model3=mean(abs(model3$residuals))
MAE_model4=mean(abs(model4$residuals))

# Comparison of Simple and Multiple Regression
Table<-cbind(c(MSE_model1,MSE_model2,MSE_model3,MSE_model4),c(MAE_model1,MAE_model2,MAE_model3,MAE_model4))
colnames(Table)<-c("MSE (Train)","MAE (Train)")
rownames(Table)<-c("Simple Regression","Multiple Regression (All)", "Multiple Regression (TV+radio)","Multiple Regression (TV+radio+TV*radio)" )
Table

# Comparing all models

stargazer(model1,model2,model3,model4, type="text", df=TRUE)


# About predictions



real=test$Sales

pred1<- predict(model1,test)
pred2<- predict(model2,test)
pred3<- predict(model3,test)
pred4<- predict(model4,test)

cbind(real,pred1,pred2,pred3,pred4)

error1<-real-pred1
error2<-real-pred2
error3<-real-pred3
error4<-real-pred4


MSE1<-mean(error1^2)
MSE2<-mean(error2^2)
MSE3<-mean(error3^2)
MSE4<-mean(error4^2)

MAE1<-mean(abs(error1))
MAE2<-mean(abs(error2))
MAE3<-mean(abs(error3))
MAE4<-mean(abs(error4))

Table

Table2<-cbind(c(MSE1,MSE2,MSE3,MSE4),c(MAE1,MAE2,MAE3,MAE4))
colnames(Table2)<-c("MSE (Test)","MAE (Test)")
rownames(Table2)<-c("Simple Regression","Multiple Regression (All)", "Multiple Regression (TV+radio)","Multiple Regression (TV+radio+TV*radio)" )
Table2


#library(tidyverse)
#library(ISLR)
#library(dplyr)
#library(psych) 

help(state.x77)


datos <- data.frame(state.x77)

colnames(datos)
colnames(datos)<-c("Pob","Ingresos","Analfabetismo","EspVida","Asesinatos","Universidad","Frio","Area")
head(datos)

datos$Densidad<-datos$Pob/datos$Area

head(datos)

library(GGally)

datos<-datos[ ,c("Ingresos","Analfabetismo","Asesinatos","Universidad","Frio","Densidad","EspVida")]

head(datos)

ggcorr(datos,nbreaks=8,label=TRUE,label_round = 2,label_alpha = FALSE)

library(RColorBrewer)

display.brewer.all()

ggcorr(datos,nbreaks=8,label=TRUE,palette = "Purples",label_round = 2,label_alpha = TRUE)

ggcorr(datos,nbreaks=8,label=TRUE,palette = "BrBG",label_round = 2,label_alpha = TRUE)


#########################################################
# Generating Linear model
#########################################################

# Y: Esperanza de Vida

modelo_total <- lm(EspVida ~  ., data = datos)

summary(modelo_total)

par(mfrow = c(2, 2))
plot(modelo_total,col='blue')

influencePlot(modelo_total)


# Feature selection using AIC 

modelo_step_selection <- step(object = modelo_total, direction = 'backward') 

modelo_step_selection <- step(object = modelo_total, direction = 'backward',trace=FALSE) 

modelo_total
modelo_step_selection

summary(modelo_total)
summary(modelo_step_selection)


stargazer(modelo_total,modelo_step_selection, type="text", df=TRUE)
### 
# Other example

library(faraway) 
?meatspec
data(meatspec) 

head(meatspec)
dim(meatspec)

set.seed(123)

smp_size <- floor(0.7 * nrow(meatspec))
train_ind <- sample(seq_len(nrow(meatspec)), size = smp_size)

training <- meatspec[train_ind, ]
test <- meatspec[-train_ind, ]
###########################################################################
# Model 1: All variables
modelo <- lm(fat ~ ., data = training) 
summary(modelo)
# Computing Error 
training_mse1 <- mean((modelo$fitted.values - training$fat)^2) 
predicciones <- predict(modelo, newdata = test) 
test_mse1 <- mean((predicciones - test$fat)^2) 

training_mse1
test_mse1
###########################################################################
# Model 2: Using Stepwise
modelo_step_selection <- step(object = modelo, trace = FALSE) 
summary(modelo_step_selection)

modelo_step_selection
# Computing Error 
training_mse2 <- mean((modelo_step_selection$fitted.values - training$fat)^2)
predicciones <- predict(modelo_step_selection, newdata = test) 
test_mse2 <- mean((predicciones - test$fat)^2) 
# Train vs Test
Table<-cbind(c(training_mse1,training_mse2),c(test_mse1,test_mse2))
colnames(Table)<-c("MSE (Train)","MSE (Test)")
rownames(Table)<-c("All variables","Stepwise Selection")
Table
###########################################################################
# Model 3: Using Principal Component Regression with 4 components
pca <- prcomp(training[, -101], scale. = TRUE) 
summary(pca)$importance[, 1:9]
library(pls) 
modelo_pcr <- pcr(formula = fat ~ ., data = training, scale. = TRUE, ncomp = 4)
# Computing Error 
training_mse3 <- mean((modelo_pcr$fitted.values - training$fat)^2) 
predicciones <- predict(modelo_pcr, newdata = test, ncomp = 4) 
test_mse3 <- mean((predicciones - test$fat)^2) 
# Train vs Test
Table<-cbind(c(training_mse1,training_mse2,training_mse3),c(test_mse1,test_mse2,test_mse3))
colnames(Table)<-c("MSE (Train)","MSE (Test)")
rownames(Table)<-c("All variables","Stepwise Selection","PCA with 4 components")
Table
###########################################################################
# Model 4: Using Principal Component Regression with the optimal components 
set.seed(123) 
modelo_pcr <- pcr(formula = fat ~ ., data = training, scale. = TRUE, validation = "CV") 
modelo_pcr_CV <- MSEP(modelo_pcr, estimate = "CV")
val_optimo=which.min(modelo_pcr_CV$val)
val_optimo
modelo_pcr_opt <- pcr(formula = fat ~ ., data = training, scale. = TRUE, ncomp = val_optimo)
# Computing Error
training_mse4 <- mean((modelo_pcr_opt$fitted.values - training$fat)^2) 
predicciones <- predict(modelo_pcr, newdata = test, ncomp = val_optimo) 
test_mse4 <- mean((predicciones - test$fat)^2) 
# Train vs Test (Final Table)
Final_Table<-Table<-cbind(c(training_mse1,training_mse2,training_mse3,training_mse4),c(test_mse1,test_mse2,test_mse3,test_mse4))
colnames(Table)<-c("MSE (Train)","MSE (Test)")
rownames(Table)<-c("All variables","Stepwise Selection","PCA with 4 components","PCA with 29 components")
Table
# Test-MSE p
par(mfrow = c(1, 2)) 
plot(modelo_pcr_CV$val, main = "MSE vs N? of components", type = "l", ylab = "MSE", col = "blue", xlab = "N? of components",lwd=4) 
plot(modelo_pcr_CV$val, main = "MSE vs N? of components (zoom)", type = "l", ylab = "MSE", xlab = "N? of components", col = "blue", ylim = c(0, 35), xlim=c(0,50),pch=10,lwd=4)


