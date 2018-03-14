# Throttling

# заберем текущую WD
curWD <- getwd()
# Установим WD
setwd("D:\\Projects\\R\\Throttling")

# Это часть загрузки данных
file <- "throttled2.csv"
mydata <- read.csv(file, header = TRUE, sep = ",", stringsAsFactors = FALSE)

myDataNeeded <- subset(mydata, select=c("Time", "Result"))

colnames(myDataNeeded) <- c("Time", "Result")

# достанем MI SS ms
myDataNeeded$MI <- as.numeric(substr(myDataNeeded$Time, 15, 16))
myDataNeeded$SS <- as.numeric(substr(myDataNeeded$Time, 18, 19))
myDataNeeded$AbsoluteSS <- myDataNeeded$MI * 60 + myDataNeeded$SS
myDataNeeded$MS <- as.numeric(substr(myDataNeeded$Time, 21, length(myDataNeeded$Time)))
#colnames(myDataNeeded) <- c("Time", "Result", "MISSms1")
myDataNeeded$LastSS <- myDataNeeded$AbsoluteSS - 1


myDataNeeded <- myDataNeeded[complete.cases(myDataNeeded),]

# Для 15й строки
myDataNeeded[(myDataNeeded$AbsoluteSS == 299 & myDataNeeded$MS > 631350) | 
               (myDataNeeded$AbsoluteSS == 300 & myDataNeeded$MS < 631350), ]

# Для 147й строки
nrow(myDataNeeded[(myDataNeeded$AbsoluteSS == 308 & myDataNeeded$MS > 979330) | 
               (myDataNeeded$AbsoluteSS == 309 & myDataNeeded$MS < 979330), ])



myDataNeeded$PDUBefore <- -7

for(i in 1:length(myDataNeeded$PDUBefore)) {
  currentSS <- myDataNeeded$AbsoluteSS[i]
  lastSS <- myDataNeeded$LastSS[i]
  ms <- myDataNeeded$MS[i]
  
  count <- nrow(myDataNeeded[(myDataNeeded$AbsoluteSS == lastSS & myDataNeeded$MS > ms) | 
                               (myDataNeeded$AbsoluteSS == currentSS & myDataNeeded$MS < ms), ])
  myDataNeeded$PDUBefore[i] <- count
  
}

unique(myDataNeeded$PDUBefore)

myDataNeeded$DoTHR <- (myDataNeeded$PDUBefore == 14)


# Если несовпадения с расчетом
myDataNeeded[myDataNeeded$DoTHR == TRUE & myDataNeeded$Result == "OK", ]

myDataNeeded[myDataNeeded$DoTHR == FALSE & myDataNeeded$Result == "THR", ]


#
write.csv(myDataNeeded, file = "MyData.csv")


# сделаем MISSms
#tmp <- sub(":", "", myDataNeeded$MISSms)
#tmp <- sub("\\.", "", tmp)
#myDataNeeded$MISSms1 <- tmp

#myDataNeeded$MISSms1 <- as.numeric(myDataNeeded$MISSms1)

# честная последняя секунда
#myDataNeeded$LastSecStart <- myDataNeeded$MISSms1 - 1000000


# агрегируем по минутам

# require(plyr)
# ?count

#name  drink cost
#1 Bill coffee    1
#2 Llib    tea    2
#3 Bill  cocoa    3
#4 Llib  water    4

#count(bevs, c("name", "drink"))
#name  drink freq
#1 Bill  cocoa    2
#2 Bill coffee    2
#3 Llib    tea    2
#4 Llib  water    2

# -------------------

# aggregate(cost ~ name + drink, data = bevs, sum)

# ++++++++ a <- table(myDataNeeded)

forGraph <- cbind(table(myDataNeeded)[,1], 
                  table(myDataNeeded)[,2],
                  table(myDataNeeded)[,3])

colnames(forGraph) <- c("Time", "OK", "THR")
# уберем первую строку
forGraph <- forGraph[-1, ]
forGraph <- as.data.frame(forGraph)

# = Данные готовы

###

layout(rbind(1,2), heights=c(7,1))  # put legend on bottom 1/8th of the chart

plot(c(1:length(forGraph$OK)), forGraph$OK + forGraph$THR, type="l", col="deepskyblue",
     main = "Speed and Time", sub = NULL, xlab = "Time (sec)", ylab = "PDUs", lwd = 2)
lines(c(1:length(forGraph$OK)), forGraph$THR, col="seashell3", lwd = 2)
lines(c(1:length(forGraph$OK)), rep(14, length(forGraph$OK)), col="red1", lwd = 3)
lines(c(1:length(forGraph$OK)), forGraph$OK, col="lawngreen", lwd = 2)

# setup for no margins on the legend
par(mar=c(0, 0, 0, 0))
# c(bottom, left, top, right)
plot.new()
legend(x = "center", legend=c("All", "THR", "Limit", "OK"), 
       ncol = 4, 
       lwd=c(0.7,0.7),
       #cex=0.7,
       col=c("deepskyblue", "seashell3", "red1", "lawngreen"))

#
# option  description
# lty	line type. see the chart below.
# lwd	line width relative to the default (default=1). 2 is twice as wide.

# http://www.statmethods.net/advgraphs/parameters.html

setwd(curWD)
getwd()
