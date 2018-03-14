# пасьянсы

# проигрыш дельта - m / (n * (n + 1))
# выигриш дельта - (n - m) / (n * (n + 1))

# 32 = m 40 = n

setwd("D:\\Projects\\R\\Pasyanci\\")

# === 1 Выигривыем все послед игры

nBegin <- 40
mBegin <- 32
maxN <- 100

n <- c(nBegin:maxN)
t <- maxN - (nBegin - mBegin)
m <- c(mBegin:t)

delta_win <- 100 * (n - m) / (n * (n + 1))
delta_loose <- 100 * m / (n * (n + 1))


# plot( x, y1, type="l", col="red" )
# par(new=TRUE)
# plot( x, y2, type="l", col="green" )

df <- data.frame(n,delta_win,delta_loose)

# install.packages("ggplot2")
require(ggplot2)

#png('plot_win.png')
ggplot(df, aes(n)) +                                            # basic graphical object
        geom_line(aes(y=delta_win, colour="DeltaWin"), size = 1) +   # first layer
        geom_line(aes(y=delta_loose, colour="DeltaLoose"), size = 1) +   # second layer
        ylab("Delta Percentage") + xlab("Number of games") + 
        #labs(title="Always win") + 
        ggtitle("Always win (32/40)") + 
        scale_colour_manual("", 
                            breaks = c("DeltaWin", "DeltaLoose"),
                            values = c("red", "green")) + 
        theme(plot.title = element_text(hjust = 0.5))
#dev.off()

# === 2 Приогрываем все послед игры

# nBegin <- 40
# mBegin <- 32
# maxN <- 100

n <- c(nBegin:maxN)
m <- rep(mBegin, length(n))

delta_win <- 100 * (n - m) / (n * (n + 1))
delta_loose <- 100 * m / (n * (n + 1))


# plot( x, y1, type="l", col="red" )
# par(new=TRUE)
# plot( x, y2, type="l", col="green" )

# df <- data.frame(n,delta_win,delta_loose)

require(ggplot2)
#png('plot_loose.png')
ggplot(df, aes(n)) +                                              # basic graphical object
        geom_line(aes(y=delta_win), colour="green", size = 1) +   # first layer
        geom_line(aes(y=delta_loose), colour="red", size = 1) +   # second layer
        ylab("Percentage") + xlab("Number of games")
#dev.off()


## ============================================
# remove.packages(c("ggplot2", "data.table"))
# install.packages('Rcpp', dependencies = TRUE)
# install.packages('ggplot2', dependencies = TRUE)
# install.packages('data.table', dependencies = TRUE)



# === 3 80% вероятность выигрыша игры

nBegin <- 2
mBegin <- 1
maxN <- 100

n <- c(nBegin:maxN)

# runif(1, 5.0, 7.5)
# sample(1:10, 5, replace=T)

m <- rep(mBegin, length(n))

delta_win <- 100 * (n - m) / (n * (n + 1))
delta_loose <- 100 * m / (n * (n + 1))


df <- data.frame(n,delta_win,delta_loose)

require(ggplot2)

ggplot(df, aes(n)) +                                              # basic graphical object
        geom_line(aes(y=delta_win), colour="green", size = 1) +   # first layer
        geom_line(aes(y=delta_loose), colour="red", size = 1) +   # second layer
        ylab("Percentage") + xlab("Number of games")




