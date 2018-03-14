# про погоду :-)

monthNames <- c('Yan', 'Feb', 'Mar',
                'Apr', 'May', 'Jun',
                'Jul', 'Aug', 'Sep',
                'Oct', 'Nov', 'Dec')

# заберем текущую WD
curWD <- getwd()
# Установим WD
setwd("D:\\Projects\\R\\Weather")

# Это часть загрузки и сохранения данных
file <- "datafileANSI.csv"
mydata <- read.csv(file, header = TRUE, sep = ";", stringsAsFactors = FALSE)
#save(mydata,file="data.Rda")
#load("data.Rda")


# 1 посмотрим осадки по прошлым годам по месяцам
partial <- mydata$Time
partial <- cbind(partial, mydata$RRR)
colnames(partial) <- c('Date', 'RRR')
partial <- as.data.frame(partial)
# тут предупреждение
partial$RRR <- as.numeric(as.character(partial$RRR))
#unique(partial$RRR)
partial$year <- as.numeric(substr(partial$Date, 7, 10))
partial$month <- as.numeric(substr(partial$Date, 4, 5))

# Агрегируем
aggrData <- aggregate(partial$RRR, by = list(partial$year, partial$month), 
          FUN = sum, na.rm=TRUE)
colnames(aggrData) <- c('Year', 'Month', 'RRR')

par(mfrow = c(4,3), mar = c(4, 4, 2, 1))
#par(mfrow = c(4,3))
for(i in 1:12)
{
        tmp <- aggrData[aggrData$Month == i,]$RRR
        yy1 <- aggrData[aggrData$Month == i,]$Year
        # нам не надо 2 первые цифры года
        yy1 <- substr(yy1, 3, 4)
        # строим барплот
        barplot(tmp, 
                xlab = monthNames[i], ylab = 'Осадки (mm)', 
                # подписи по оси Х
                names.arg = yy1)
                #las = 2) - это направление подписей перпендикулярно
        # среднее за данный месяц по годам
        abline(h = mean(aggrData[aggrData$Month == i,]$RRR), col = 'green')
}

# 
setwd(curWD)
getwd()

