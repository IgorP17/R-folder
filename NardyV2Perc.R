# Нарды

require(grDevices) # for colours

# Кол-во бросков одновременно 2х костей
n <- 1E8

# Результирующий вектор (пока пустой)
result <- vector(length=0)
resultOrig <- vector(length=0)

# Кость 1 - вектор случайных чисел [1:6], с заменами, длиной n 
dice1 <- sample(1:6, n, replace=T)
dice1Orig <- dice1

# Кость 2 - вектор случайных чисел [1:6], с заменами, длиной n
dice2 <- sample(1:6, n, replace=T)
# Оригинал
dice2Orig <- dice2

# ПЕревернем кости, чтобы dice1 никогда не был больше dice2
# Чтобы не было ситауций типа 4-3, 6-1
for (i in c(1:n)){
        if (dice1[i] > dice2[i]){
                tmp <- dice1[i]
                dice1[i] <- dice2[i]
                dice2[i] <- tmp
        }
}

# И добавим в результат - который быдет типа ("1-1", "1-2", "1-2", "3-3", "4-6"...)
result <- c(result, paste(dice1, "-", dice2, sep =""))

# Построим table - частотное распределение значений //TODO
# При этом в %
ttable <- table(result) * 100 / n

par(mfrow = c(1,2))

# Построим бар, развернем значения оси Х(las)
barplot(ttable, 
        main = paste("n =", n),
        xlab = "Комбинации костей",
        ylab = "Процент от общего числа",
        col = rainbow(40), 
        ylim=range((c(0, max(ttable) + 1))), 
        las=2, space = 0)

# ===== А теперь оригинал =====
# И добавим в результат - который быдет типа ("1-1", "1-2", "1-3", без схлопывания "1-4" и "4-1" в один кейс)
resultOrig <- c(resultOrig, paste(dice1Orig, "-", dice2Orig, sep =""))

# Построим table - частотное распределение значений //TODO
# При этом в %
ttableOrig <- table(resultOrig) * 100 / n

# Построим бар, развернем значения оси Х(las)
barplot(ttableOrig,
        main = paste("n =", n),
        xlab = "Комбинации костей",
        col = rainbow(40), 
        ylim=range((c(0, max(ttable) + 1))), 
        las=2, space = 0)


#abline(h = max(ttable))

#legend(x = "bottomleft", legend=c("BYA"))

