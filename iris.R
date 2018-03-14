# iris

# https://www.datacamp.com/community/tutorials/machine-learning-in-r


# Read in `iris` data
#iris <- read.csv(url("http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"), 
#                 header = FALSE) 

# Print first lines
#head(iris)

# Add column names
#names(iris) <- c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width", "Species")

# Check the result
#iris

# У нас есть уже iris, посмотрим...
str(iris)
# Division of `Species`
table(iris$Species) 

# Percentual division of `Species`
round(prop.table(table(iris$Species)) * 100, digits = 1)

# минимумы максимумы
min(iris$Sepal.Length)
max(iris$Sepal.Width)
min(iris$Petal.Length)
max(iris$Petal.Width)

# разобьем
setosa <- iris[iris$Species == "setosa",]
versicolor <- iris[iris$Species == "versicolor",]
virginica <- iris[iris$Species == "virginica",]

# посмотримс Sepal
plot(setosa$Sepal.Length, setosa$Sepal.Width, col = "green", pch = 19, cex = 1.3,
     xlim = range(iris$Sepal.Length), ylim = range(iris$Sepal.Width),
     xlab = "Sepal Length", ylab = "Sepal Width")
points(versicolor$Sepal.Length, versicolor$Sepal.Width, col = "blue", pch = 19, cex = 1.3)
points(virginica$Sepal.Length, virginica$Sepal.Width, col = "red", pch = 19, cex = 1.3)
legend(x = "topright", legend = c("setosa", "versicolor", "virginica"),
       col=c("green", "blue", "red"),
       cex = 0.7, pch = 16, pt.cex = 1.2)



# посмотримс Petal
plot(setosa$Petal.Length, setosa$Petal.Width, col = "green", pch = 19, cex = 1.3,
     xlim = range(iris$Petal.Length), ylim = range(iris$Petal.Width),
     xlab = "Petal Length", ylab = "Petal Width")
points(versicolor$Petal.Length, versicolor$Petal.Width, col = "blue", pch = 19, cex = 1.3)
points(virginica$Petal.Length, virginica$Petal.Width, col = "red", pch = 19, cex = 1.3)
legend(x = "topleft", legend = c("setosa", "versicolor", "virginica"),
       col=c("green", "blue", "red"),
       bty = "n", # без бордюра
       cex = 0.7, pch = 16, pt.cex = 1.2)


# корреляции для Petal
# Overall correlation `Petal.Length` and `Petal.Width`
cor(iris$Petal.Length, iris$Petal.Width)

# Return values of `iris` levels 
x <- levels(iris$Species)

# Print Setosa correlation matrix
print(x[1])
cor(iris[iris$Species==x[1],1:4])

# Print Versicolor correlation matrix
print(x[2])
cor(iris[iris$Species==x[2],1:4])

# Print Virginica correlation matrix
print(x[3])
cor(iris[iris$Species==x[3],1:4])

### Summary overview of `iris`
summary(iris) 

# Refined summary overview
summary(iris[c("Petal.Width", "Sepal.Width")])


################################################
#install.packages("class")
#any(grepl("<name of your package>", installed.packages()))
library(class)

###### Build your own `normalize()` function
normalize <- function(x) {
        num <- x - min(x)
        denom <- max(x) - min(x)
        return (num/denom)
}

# Normalize the `iris` data
iris_norm <- as.data.frame(lapply(iris[1:4], normalize))

# Summarize `iris_norm`
summary(iris_norm)

##################

set.seed(1234)

ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.67, 0.33))

# Compose training set
iris.training <- iris[ind==1, 1:4]

# Inspect training set
head(iris.training)

# Compose test set
iris.test <- iris[ind==2, 1:4]

# Inspect test set
head(iris.test)

# Compose `iris` training labels
iris.trainLabels <- iris[ind==1,5]

# Inspect result
print(iris.trainLabels)

# Compose `iris` test labels
iris.testLabels <- iris[ind==2, 5]

# Inspect result
print(iris.testLabels)




