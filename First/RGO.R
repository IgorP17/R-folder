#display current work directory
getwd()
#list dir
dir()
#display loaded code?
ls()
#load code
source("somefile.R")

####matrix
m <- matrix(nrow = 2, ncol = 3)
m
dim(m)#dimentions
attributes(m)

#matrix init
m <- matrix(1:6, nrow = 2, ncol = 3)
m

#transform
m <- 1:10
dim(m) <- c(2,5)
m

#cbind 
x <- 1:3
y <- 10:12
cbind(x,y)
rbind(x,y)

##list - differant types of data
x <- list(1, "a", TRUE, 1+4i)
x

##factors
x <- factor(c("yes", "yes", "no", "yes", "no"))
x
table(x) #frequency
unclass(x)#yes == 2, no ==1, как по алфавиту

x <- factor(c("yes", "yes", "no", "yes", "no"), levels = c("yes", "no"))
x
unclass(x)#yes == 1, no ==2

#NAN and na
is.na()
is.nan()

x <- c(1,2,NA,4,5)
is.na(x)
is.nan(x)
x <- c(1,2,NA,NaN,5)
is.na(x)
is.nan(x)


y <- x[!is.na(x)] #очищеный вектор от NA

x[!is.na(x) & x > 0]#очищаем вектор и берем положительные числа


#data frames - special list - иначе говоря это 
#типа первая колонка имя например, вторая возраст, третья пол и тп

row.names
read.table()
read.csv()
data.matrix() #convert to matrix 

x <- data.frame(foo = 1:4, bar = c(T,T,F,T))
x
nrow(x)
ncol(x)

###Names
x <- 1:3
names(x)
names(x) <- c("foo", "bar", "norf")
x
names(x)


x <- list(a = 1, b = 2, c = 3) 
x

m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a","b"),c("c","d"))
m


#######Subsets [] [[]] $
x <- c("a","b","b","d","e","a")
x[1]
x[2:4]
x[x > "a"] #logical statement
u <- x > "a" #logical vector
u
x[u]

x <- matrix(1:6, 2, 3)
x
x[1,2]
x[1,]
x[,2]

x[1,2, drop = FALSE] #возвратим матрицу, а не вектор
x[1, ,drop = FALSE]


!!!!!!
subset(data, Ozone > 31 & Temp > 90)

#элементы вектора кроме 2го и 10го
x[c(-2, -10)] 
x[-c(2, 10)] #the same


#list subset
x <- list(foo = 1:4, bar = 0.6)
x[1] #возвращаем List
x[[1]] #возвратили seq
x$bar
x[["bar"]]
x["bar"] #return list


x <- list(foo = 1:4, bar = 0.6, baz="hello")
x[c(1,3)]

name <- "foo"
x[[name]]#это сработает 
x$name#элемента name нету в листе
x$foo

##
x <- list(a = list(10,12,14), bar = 0.6, baz="hello")
x[[1]][[3]] #берем первый элемент список и из него 3й элемент
x[[c(1,3)]]

##частичное совпадение имен
x <- list(aardwark = 1:5)
x$a#works
x[["a"]]
x[["a", exact = FALSE]]#works

##remove NA
x <- c(1,2,NA,4,NA,6)
is.na(x)
bad <- is.na(x)
x[!bad]


x <- c(1,2,NA,4,NA,6)
y <- c("a","b",NA,"d",NA,"f")
good <- complete.cases(x,y)
good
x[good]
y[good]


head


#Идентичность
identical(vect, vect2)