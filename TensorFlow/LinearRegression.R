# Линейная 

# Позырим какие есть датасеты
ls("package:datasets")

# Scatter Plot
plot(cars$speed, cars$dist)

# BoxPlot – Check for outliers
# Generally, any datapoint that lies outside the 1.5 * interquartile-range (1.5 * IQR) 
# is considered an outlier, where, IQR is calculated as the distance between 
# the 25th percentile and 75th percentile values for that variable.

par(mfrow=c(1, 2))  # divide graph area in 2 columns
boxplot(cars$speed, main="Speed", sub=paste("Outlier rows: ", boxplot.stats(cars$speed)$out))  # box plot for 'speed'
boxplot(cars$dist, main="Distance", sub=paste("Outlier rows: ", boxplot.stats(cars$dist)$out))  # box plot for 'distance'

# Density plot – Check if the response variable is close to normality
par(mfrow=c(1, 2))  # divide graph area in 2 columns
plot(density(cars$speed), main="Density Plot: Speed", ylab="Frequency", sub=paste("Skewness:", round(e1071::skewness(cars$speed), 2)))  # density plot for 'speed'
polygon(density(cars$speed), col="red")
plot(density(cars$dist), main="Density Plot: Distance", ylab="Frequency", sub=paste("Skewness:", round(e1071::skewness(cars$dist), 2)))  # density plot for 'dist'
polygon(density(cars$dist), col="red")

# correlation
cor(cars$speed, cars$dist)

#

df <- data.frame(cars)
# агрегируем
#df <- aggregate(df$dist, by = list(df$speed), FUN = mean, na.rm=TRUE)
#colnames(df) <- c('speed', 'dist')
#plot(df$speed, df$dist)

# Нормализуем
#zVar <- (myVar - mean(myVar)) / sd(myVar)
df$speedNormalized <- (df$speed - mean(df$speed)) / sd(df$speed)
df$distNormalized <- (df$dist - mean(df$dist)) / sd(df$dist)
plot(df$speedNormalized, df$distNormalized)

require(tensorflow)
tf$device("/gpu:0")

x_data <- df$speedNormalized
y_data <- df$distNormalized

W <- tf$Variable(tf$random_uniform(shape(1L), -1.0, 1.0))
b <- tf$Variable(tf$zeros(shape(1L)))
y <- W * x_data + b
 
# Minimize the mean squared errors.
loss <- tf$reduce_mean((y - y_data) ^ 2)
optimizer <- tf$train$GradientDescentOptimizer(0.5)
train <- optimizer$minimize(loss)

# Launch the graph and initialize the variables.
sess = tf$Session()
sess$run(tf$global_variables_initializer())

# Fit the line (Learns best fit is W: 0.1, b: 0.3)
for (step in 1:201) {
        sess$run(train)
        if (step %% 20 == 0)
                cat(step, "-", sess$run(W), sess$run(b), "\n")
}
WLastNormalized <- sess$run(W)
BLastNormalized <- sess$run(b)
sess$close()

# Изобразим?

# Кстати...
reg <- lm(dist ~ speed, data = cars)
coeff = coefficients(reg)
# equation of the line : 
eq = paste0("y = ", round(coeff[2],1), "*x ", round(coeff[1],1))
# plot
plot(cars, main=eq)
abline(reg, col="blue")

# А теперь по идее надо денормализировать коэфициенты...

# См приложение с расчетами LinearRegressionCoef.odt
WOrigin <- WLastNormalized * sd(df$dist) / sd(df$speed)
BOrigin <- BLastNormalized * sd(df$dist) + mean(df$dist) - WLastNormalized * sd(df$dist) * mean(df$speed) / sd(df$speed)

# Денормализованые
plot(df$speed, df$dist, main = paste("y=",
                                round(WOrigin,1), 
                                "*x", 
                                round(BOrigin,1)))
abline(a = BOrigin, b = WOrigin, col="blue")

# разница между lm и TF
coeff[1] - BOrigin
coeff[2] - WOrigin
