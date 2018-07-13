# Нарды

require(grDevices) # for colours
#==========
#tN <- table(Ni <- stats::rpois(100, lambda = 5))
#r <- barplot(tN, col = rainbow(20))
#- type = "h" plotting *is* 'bar'plot
#lines(r, tN, type = "h", col = "red", lwd = 2)

#barplot(tN, col = rainbow(20))

#barplot(table(c("1-1","3","1-5","5")), col = rainbow(20))

#a <- "1-1"
#a <- rbind(a, "1-2")
#table(a)
#barplot(table(a), col = rainbow(20))
#==========

# Кол-во бросков одновременно 2х костей
n <- 1E8

# Результирующий вектор (пока пустой)
result <- vector(length=0)
resultOrig <- vector(length=0)

# Кость 1 - вектор случайных чисел [1:6], с заменами, длиной n 
print(paste("Start gen dice1 =", beginTime <- Sys.time()))
dice1 <- sample(1:6, n, replace=T)
# Оригинал
dice1Orig <- dice1
print(paste("End gen dice1 =", endTime <- Sys.time()))
print(paste("Elapsed gen dice1 =", endTime - beginTime))

# Кость 2 - вектор случайных чисел [1:6], с заменами, длиной n
print(paste("Start gen dice2 =", beginTime <- Sys.time()))
dice2 <- sample(1:6, n, replace=T)
# Оригинал
dice2Orig <- dice2
print(paste("End gen dice2 =", endTime <- Sys.time()))
print(paste("Elapsed gen dice2 =", endTime - beginTime))

# ПЕревернем кости, чтобы dice1 никогда не был больше dice2
# Чтобы не было ситауций типа 4-3, 6-1
print(paste("Start switch =", beginTime <- Sys.time()))
for (i in c(1:n)){
        if (dice1[i] > dice2[i]){
                tmp <- dice1[i]
                dice1[i] <- dice2[i]
                dice2[i] <- tmp
        }
        #result <- c(result, paste(dice1[i], "-", dice2[i], sep =""))#так плохо медленно
}
print(paste("End switch =", endTime <- Sys.time()))
print(paste("Elapsed switch =", endTime - beginTime))

# И добавим в результат - который быдет типа ("1-1", "1-2", "1-2", "3-3", "4-6"...)
print(paste("Start data load =", beginTime <- Sys.time()))
result <- c(result, paste(dice1, "-", dice2, sep =""))
print(paste("End data load =", endTime <- Sys.time()))
print(paste("Elapsed data load =", endTime - beginTime))

# Построим table - частотное распределение значений //TODO
print(paste("Start table gen =", beginTime <- Sys.time()))
ttable <- table(result)
print(paste("End table gen =", endTime <- Sys.time()))
print(paste("Elapsed table gen =", endTime - beginTime))

# Найдем верх Y с упреждением в +1 в первой цифре максимума
print(paste("Start mmax =", beginTime <- Sys.time()))
expForMax <- 0
mmax <- max(ttable)
while(mmax > 9){
        mmax <- ceiling(mmax / 10) # округление вверх
        expForMax <- expForMax + 1 # степень 10ки
}

print(paste("End mmax =", endTime <- Sys.time()))
print(paste("Elapsed mmax =", endTime - beginTime))

# Построим бар, развернем значения оси Х(las)
barplot(ttable, 
        xlab = "Комбинации костей",
        col = rainbow(40), 
        ylim=range((c(0, mmax * 10^expForMax))), 
        las=2)

# ===== А теперь оригинал =====
# И добавим в результат - который быдет типа ("1-1", "1-2", "1-3", без схлопывания "1-4" и "4-1" в один кейс)
print(paste("Start data load =", beginTime <- Sys.time()))
resultOrig <- c(resultOrig, paste(dice1Orig, "-", dice2Orig, sep =""))
print(paste("End data load =", endTime <- Sys.time()))
print(paste("Elapsed data load =", endTime - beginTime))

# Построим table - частотное распределение значений //TODO
print(paste("Start table gen =", beginTime <- Sys.time()))
ttableOrig <- table(resultOrig)
print(paste("End table gen =", endTime <- Sys.time()))
print(paste("Elapsed table gen =", endTime - beginTime))

# Найдем верх Y с упреждением в +1 в первой цифре максимума
print(paste("Start mmax =", beginTime <- Sys.time()))
expForMax <- 0
mmax <- max(ttableOrig)
while(mmax > 9){
        mmax <- ceiling(mmax / 10) # округление вверх
        expForMax <- expForMax + 1 # степень 10ки
}

print(paste("End mmax =", endTime <- Sys.time()))
print(paste("Elapsed mmax =", endTime - beginTime))

# Построим бар, развернем значения оси Х(las)
barplot(ttableOrig, 
        xlab = "Комбинации костей",
        col = rainbow(40), 
        ylim=range((c(0, mmax * 10^expForMax))), 
        las=2)


#abline(h = max(ttable))

#legend(x = "bottomleft", legend=c("BYA"))

