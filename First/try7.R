#Real-World Data

list.files(pattern = ".*R")
piracy <- read.csv("piracy.csv")
gdp <- read.table("gdp.txt", sep=" ", header=TRUE)
countries <- merge(x = gdp, y = piracy)

plot(countries$GDP,countries$Piracy)

#Возможна есть корреляция - 
cor.test(countries$GDP, countries$Piracy)
#The key result we're interested in is the "p-value". 
#Conventionally, any correlation with a p-value less than 0.05 
#is considered statistically significant,

#мы можем попробовать построить линейную модель:
line <- lm(countries$Piracy ~ countries$GDP)
abline(line)

##+ggplot2 example
install.packages("ggplot2")
help(package = "ggplot2")

weights <- c(300, 200, 100, 250, 150)
prices <- c(9000, 5000, 12000, 7500, 18000)
chests <- c('gold', 'silver', 'gems', 'gold', 'gems')
types <- factor(chests)
#
library(ggplot2)
qplot(weights, prices, color = types)
#