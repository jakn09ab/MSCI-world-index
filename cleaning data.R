as.numeric.factor <- function(x) {as.numeric(levels(x))[x]}
##inflation

inflation <- read.csv2("inflation i DK 1900-2016.csv", header = FALSE)
inflation <- as.data.frame(t(inflation))
inflation$V1 <- NULL


#MSCI DK
Msci.DK <- read.csv2("historyIndex MSCI DK.csv")
Msci.DK <- Msci.DK[-c(1:4),]
Msci.DK <- Msci.DK[-c(571:574),]
head(Msci.DK)
Msci.DK[,1] <- gsub(",","",Msci.DK[,1])
Msci.DK[,1] <- mdy(Msci.DK$Index.Level..)

#productivity
productivity <- read.table("arbejdsproduktivitet DK 1967-2016.csv", sep = ";")
productivity <- t(productivity)
productivity <- as.data.frame(productivity)
productivity$year <- 1964
productivity <- productivity[-c(1:3),]
length(productivity$year)
productivity$year <- 1967:(1967+47)
class(productivity$V1)
productivity$v1 <- as.numeric.factor(productivity$V1)
class(productivity$v1)
productivity <- productivity[,-c(1)]

#housing prices
HousingPrices <- read.table("ejendomsspriser Aalborg -Aarhus 92-16.csv", sep = ";")
HousingPrices <- t(HousingPrices)
HousingPrices <- HousingPrices[, -c(4:8)]
head(HousingPrices)
colnames(HousingPrices) <- c("quarter", "Aarhus", "Aalborg")
HousingPrices <- HousingPrices[-c(1),]
data<-as.data.frame(HousingPrices)
head(data)
str(data)
class(HousingPrices[,3])
data$Aarhus <- as.numeric(as.character(data$Aarhus))
str(data)
head(HousingPrices)

HousingPrices$aar <- as.numeric(HousingPrices[,2])
names(HousingPrices)
Aalborg <- HousingPrices$Aalborg
HousingPrices[,2] <- as.numeric(HousingPrices[,2])
class(HousingPrices)


#renteniveau
interest10Year <- read.table("renteniveau 1985-2012.csv", sep = ";")
interest10Year <- t(interest10Year)
interest10Year <- interest10Year[-c(1:15),]
interest10Year <- interest10Year[-c(327:377),]


class(interest10Year[,2])
as.numeric(interest10Year[,2])
