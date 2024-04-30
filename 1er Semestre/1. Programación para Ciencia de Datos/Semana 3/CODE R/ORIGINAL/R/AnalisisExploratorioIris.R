head(iris,n=5)
tail(iris,n=5)
# Muestra aleatoria de cinco lineas ide la BD.
iris[sample(nrow(iris), 5), ]
# Resumén descriptivo de la BD. 
summary(iris)
summary(iris$Petal.Length)
# O tambi?n...

datos=data.frame(iris)
# Histograma de la Longitud del S?palo seg?n frecuencias
hist(datos$Sepal.Length,breaks=seq(4,8,by=1),col="gray",border="blue",main="Longitud del Sépalo de la BD iris",ylim=c(0,80),right=TRUE,xlab="Longitud del Sépalo", ylab="Frecuencia",freq=TRUE)
# o tambi?n en proporciones
hist(datos$Sepal.Length,breaks=seq(4,8,by=1),col="gray",border="blue",main="Histograma de la Longitud del S?palo de la BD iris",ylim=c(0,0.8),right=TRUE,xlab="Longitud del Sépalo", ylab="Proporciones",freq=FALSE)
# o mostrando los valores en etiquetas
hist(datos$Sepal.Length,breaks=seq(4,8,by=1),col="gray",border="blue",main="Histograma de la Longitud del S?palo de la BD iris",ylim=c(0,0.6),right=TRUE,xlab="Longitud del Sépalo", ylab="Proporciones",freq=FALSE,labels=TRUE)
#
# Estimaci?n Puntual 

mean(datos$Sepal.Length)

# Estimaci?n intervalos de confianza

library(BSDA)

zsum.test(mean.x=10,sigma.x=6, n.x=50,conf.level=0.90)

zsum.test(mean.x=81,sigma.x=5.2,n.x=25,mean.y=76,sigma.y=3.4,n.y=36, conf.level=0.99)


library(psych)

t.test(iris$Sepal.Length, mu=6)

t.test(iris$Sepal.Length, mu=5)

t.test(iris$Sepal.Length, mu=4,alternative="less")

t.test(iris$Sepal.Length, mu=4,alternative="greater")

# Es una prueba de dos colas (siempre)



# Resum?n descriptivo de la BD por especie
bySpecies <- split(iris, iris$Species)
str(bySpecies)
# Selecci?n de la BD 
setosa=bySpecies[1]
versicolor<-bySpecies[2]
virginica<-bySpecies[3]
# y definirlos como un dataframe
Setosa=data.frame(setosa)
Versicolor=data.frame(versicolor)
Vrginica=data.frame(virginica)
hist(Setosa$setosa.Sepal.Length,breaks=seq(4,6,by=0.5),col="gray",border="blue",main="Histograma de la Longitud del S?palo de la BD iris - Especie: Setosa",ylim=c(0,30),right=FALSE,xlab="Longitud del s?palo en cm ", ylab="Frecuecia",freq=TRUE,labels=TRUE)
####----------------------------------------------------####
#### 3. Agrupamiento de datos
####----------------------------------------------------####
# Primero lo represertamos como un dataframe y usaremos el
# comando table() para elaborar "Tablas de Contingencia (TC)" 
Data_Iris=data.frame(iris)
# TC de la Longitud del S?palo>5
table(Data_Iris$Sepal.Length>5)
#### AN?LISIS DE DATOS BD-COMPLETA
# TC: Longitud del s?palo>5 y Especie=Setosa
table(Data_Iris$Sepal.Length>5&Data_Iris$Species=="setosa")
# TC: Longitud del s?palo>5 vs Especie
tab1=table(Data_Iris$Sepal.Length>5,Data_Iris$Species)
rownames(tab1)=c("Longitud-Sépalo <= 5","Longitud-Sépalo  > 5")
tab1

### Prueba de hip{otesis}
chisq.test(tab1)


# TC: Longitud del s?palo>5 vs Ancho del petalo<1.5
tab2=table(Data_Iris$Sepal.Length>5,Data_Iris$Petal.Width<1.5)
rownames(tab2)=c("Longitud-Sépalo <= 5","Longitud-Sépalo  > 5")
colnames(tab2)=c("Ancho-Pétalo >= 1.5","Ancho-Pétalo < 1.5")
tab2

prop.table(tab2)

prop.table(tab2,1)
# Por proporciones por fila
prop.table(tab2,2)
# Adicionando total por columna
addmargins(tab2, 1)
# Adicionando total por fila
addmargins(tab2, 2) 
# Adicionando total por fila y columna
addmargins(tab2, c(1, 2))
# Adicionando total por fila y columna en proporciones
addmargins(tab2, c(1, 2))/sum(tab2)

boxplot(iris$Petal.Width ~ iris$Species,col=c("green","red","blue"),xlab="Especies",ylab="Ancho del P?talo")
x11()
plot(x = iris$Petal.Length, y = iris$Petal.Width, cex=1.5, pch=18,col = iris$Species, 
     main = "Iris - P?talo", xlab = "Largo", ylab = "Ancho")
# Adicionando leyenda
legend("topleft",legend = c("Setosa", "Versicolor", "Virginica"), 
       fill = c("black", "red", "green"), title = "Especie")
# Tambien es posible crear varios gr?ficos
x11()
prev <- par(mfrow = c(2, 2))
plot(iris$Petal.Length, iris$Sepal.Length,cex=1.5, pch=18,col = iris$Species)
legend("bottomright",legend = c("Setosa", "Versicolor", "Virginica"), 
       fill = c("black", "red", "green"))
plot(iris$Petal.Length, iris$Setal.Width,cex=1.5, pch=18,col = iris$Species)
legend("bottomright",legend = c("Setosa", "Versicolor", "Virginica"), 
       fill = c("black", "red", "green"))
plot(iris$Petal.Width, iris$Sepal.Length,cex=1.5, pch=18,col = iris$Species)
legend("bottomright",legend = c("Setosa", "Versicolor", "Virginica"), 
       fill = c("black", "red", "green"))
plot(iris$Petal.Width, iris$Setal.Width,cex=1.5, pch=18,col = iris$Species)
legend("bottomright",legend = c("Setosa", "Versicolor", "Virginica"), 
       fill = c("black", "red", "green"))
## Otra opci?n 1: Usando diccionario de colores
my_cols <- c("black", "red", "green")  
pairs(iris[,1:4], pch = 19,  cex = 0.8,
      col = my_cols[iris$Species],
      lower.panel=NULL)
## Otra opci?n 2: Adicionando leyenda
x11()
pairs(iris[1:4], main = "Base de Datos IRIS",
      pch = 19,  cex = 0.8, col = c("black", "red", "green")[iris$Species],lower.panel=NULL)
legend("bottomleft", inset=c(0.05,0.50), legend = c("Setosa", "Versicolor", "Virginica"),  
       fill=c("black", "red", "green"))

library(PerformanceAnalytics)
library(psych)
# Nuestros datos es mejor tenerlos en un data.frame
x11()

pairs.panels(iris[,1:4],bg=c("black", "red", "green")[iris$Species],
             pch=21,main="Datos de correlacci?n IRIS",hist.col="blue",method="kendall",ellipses = FALSE)
#pairs.panels(iris[,1:4],bg=c("black", "red", "green")[iris$Species],
#             pch=21+as.numeric(iris$Species),main="Datos de correlacci?n IRIS",hist.col="blue",method="kendall")

chart.Correlation(iris[,1:4],col=iris$Species,
                  pch=21+as.numeric(iris$Species),main="Datos de correlacci?n IRIS")

