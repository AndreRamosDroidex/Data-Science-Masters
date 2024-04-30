

#########3}
setwd("D:/Maestria/1er Semestre/Semana 3 Del 28/CODE R/Data")
AutoStmat <- read.csv("stmat - stmat.csv", header = T, na.strings = "?", stringsAsFactors = T)
AutoStpor <- read.csv("stpor - stpor.csv",  header = T, na.strings = "?", stringsAsFactors = T)

head(AutoStmat)
head(AutoStpor)

# Data Exploration
dim(AutoStmat)
head(AutoStmat,6)
tail(AutoStmat,6)
table(AutoStmat$school)
summary(creditcard_data$Amount)
names(creditcard_data)
var(creditcard_data$Amount)
sd(creditcard_data$Amount)


#plot(AutoStmat$address , AutoStmat$age )

#####################
#####################
attach(AutoStmat)

AutoStmat$school <- as.factor(AutoStmat$school)
AutoStmat$sex <- as.factor(AutoStmat$sex)

#####################
attach(AutoStpor)

AutoStpor$school <- as.factor(AutoStpor$school)
AutoStpor$sex <- as.factor(AutoStpor$sex)


#####################
#####################
#MASCARAS DE ALUMNOSAPROBADOS EN AMBOS CURSOS
maskStmat <- AutoStmat$G3>10 
maskStpor <- AutoStpor$G3>10 

###

#####################
#DIFRENCIA EN GRAFICO DE INDIVIDUALMENTE DE MATEMATICAS CON SU TOTAL

plot(AutoStmat$school, AutoStmat$sex, col = "red", varwidth = T,
     xlab = "school", ylab = "sex",  main = 'Curso de MAT- APROBARON')
plot(AutoStmat[maskStmat,]$school, AutoStmat[maskStmat,]$sex, col = "red", varwidth = T,
     xlab = "school", ylab = "sex", main = 'Curso de MAT - TOTAL')
pie(table(AutoStpor$school, AutoStpor$sex), labels = AutoStpor$school, main = "Pie Chart Example")


#DIFRENCIA EN GRAFICO DE INDIVIDUALMENTE DE PORTUGUES CON SU TOTAL

plot(AutoStpor$school, AutoStpor$sex, col = "red", varwidth = T,
     xlab = "school", ylab = "sex",  main = 'Curso de PORT- APROBARON')
plot(AutoStpor[maskStpor,]$school, AutoStpor[maskStpor,]$sex, col = "red", varwidth = T,
     xlab = "school", ylab = "sex",  main = 'Curso de PORT - TOTAL')
##HOMBRES APRUEBAN MAS POR QUE?
#####################
#####################


hist(AutoStmat$age, col = 2, breaks = 15)
hist(AutoStmat$age,freq=FALSE,col='gray',border="blue")
lines(density(AutoStmat$age),col="red",lwd=2)

#####################

hist(AutoStpor$age, col = 2, breaks = 15)
hist(AutoStpor$age,freq=FALSE,col='gray',border="blue")
lines(density(AutoStpor$age),col="red",lwd=2)

#####################
#####################

#USANDO TABLA DE CONTIGENCIA
#Tabla contigencia: Escuela, Sexo TOTAL - MATH
table(AutoStmat$school, AutoStmat$sex)
barplot(table(AutoStmat$school, AutoStmat$sex), main = "Tabla contigencia: Escuela, Sexo TOTAL - MATH", xlab = "Sex", ylab = "School", col = "blue")


#Tabla contigencia: Escuela, Sexo - MATH
table(AutoStmat[maskStmat,]$school, AutoStmat[maskStmat,]$sex)
barplot(table(AutoStmat[maskStmat,]$school, AutoStmat[maskStmat,]$sex), main = "Tabla contigencia: Escuela, Sexo - MATH", xlab = "Sex", ylab = "School", col = "blue")

#####################

#USANDO TABLA DE CONTIGENCIA

#Tabla contigencia: Escuela, Sexo TOTAL- PORT
table(AutoStpor$school, AutoStpor$sex)
barplot(table(AutoStpor$school, AutoStpor$sex), main = "abla contigencia: Escuela, Sexo TOTAL- PORT", xlab = "Sex", ylab = "School", col = "blue")


#Tabla contigencia: Escuela, Sexo - PORT
table(AutoStpor[maskStpor,]$school, AutoStpor[maskStpor,]$sex)
barplot(table(AutoStpor[maskStpor,]$school, AutoStpor[maskStpor,]$sex), main = "Tabla contigencia: Escuela, Sexo - PORT", xlab = "Sex", ylab = "School", col = "blue")



#####################
#####################

resultado_MATH <- table(AutoStmat[maskStmat,]$school, AutoStmat[maskStmat,]$sex)/table(AutoStmat$school, AutoStmat$sex)
resultado_MATH_FULL <- 100*round(resultado_MATH, 3)
resultado_MATH_FULL


#####################

resultado_PORT <- table(AutoStpor[maskStpor,]$school, AutoStpor[maskStpor,]$sex)/table(AutoStpor$school, AutoStpor$sex)
resultado_PORT_FULL <- 100*round(resultado_PORT, 3)
resultado_PORT_FULL
#####################
#####################
##CONLUSION
#
############################################################################

