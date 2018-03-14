#Factors

#To categorize the values, simply pass the vector to the factor function:
chests <- c('gold', 'silver', 'gems', 'gold', 'gems')
types <- factor(chests)
print(chests)
print(types)
#
as.integer(types)
#You can get only the factor levels with the levels function:
levels(types)

#Plots With Factors

weights <- c(300, 200, 100, 250, 150)
prices <- c(9000, 5000, 12000, 7500, 18000)
plot(weights, prices)

#We can't tell which chest is which, though. 
#Fortunately, we can use different plot characters for each type 
#by converting the factor to integers, 
#and passing it to the pch argument of plot.

plot(weights, prices, pch=as.integer(types))

legend("topright", c("gems", "gold", "silver"), pch=1:3)
legend("topright", levels(types), pch=1:length(levels(types)))

