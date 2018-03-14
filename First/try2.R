#BASE 2
vector1 <- c(1,2,3,4)
5:9
seq(9,5,-1)
#get value
vector1[2]
#vector1[0]
vector1[4] <- "buya"
#add new " or '
vector1[5] <- "buya5"
#get 1st and 3rd
vector1[c(1,3)]
#get 2 - 4
vector1[2:4]
#assign multiple
vector1[1:3] <- c("b1", "b2", "b3")

#------Vector Names
ranks <- 1:3
names(ranks) <- c("first", "second", "third")
ranks["first"]
ranks
#ranks["first"] <- 10
#-------;


######Bar Plots
vesselsSunk <- c(4, 5, 1)
barplot(vesselsSunk)

names(vesselsSunk) <- c("England", "France", "Norway")
barplot(vesselsSunk)
######Bar Plots
barplot(1:100)
###

#Some manipulations
a <- c(1, 2, 3)
a + 1 #for all
b <- c(4, 5, 6)

a + b
a - b

#compare each
a == c(1, 99, 3)
#sin each
sin(a)
#sqrt

###Scater Plots
x <- seq(1, 20, 0.1)
y <- sin(x)
plot(x, y)
###Scater Plots### 

#NA values
a <- c(1, 3, NA, 7, 9)
sum(a)
sum(a, na.rm = TRUE)
