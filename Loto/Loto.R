# 
setwd("D:\\Projects\\R\\Loto")

data <- read.csv("data.csv", sep = ";")

# превратим данные в обычный вектор
rawData <- as.numeric(t(data))
# частоты
freq <- table(rawData)
ft <- as.data.frame(freq)

# ===============================
# берем последние 5 по 6 и остальные как основа

data1 <- rawData[1:30]
data2 <- rawData[31:length(rawData)]

length(data1) + length(data2) == length(rawData)

# сделаем unique для data1
data1 <- unique(data1)

# теперь надо смотреть freq для data1
freq <- table(data2)
ft <- as.data.frame(freq)
colnames(ft) <- c("num", "freq")

last <- subset(ft, num %in% data1)
last <- last[order(last$freq),]

## Покажем что твориццо
print(paste("Минимум", min(ft$freq)))
last
print(paste("Максимум", max(ft$freq)))


ft[ft$freq > 130 & ft$freq < 138,]
