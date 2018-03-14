#Data frames, данные из try5
#You can think of a data frame as something akin 
#to a database table or an Excel spreadsheet.

treasure <- data.frame(weights, prices, types)
print(treasure)
#воот тут становится понятно, почему на координатной сетке иемнно 
#такое распределение и assign кружочков, крестика и треугольника

#access
treasure[[2]]
treasure[2,3]
treasure[["weights"]]
#ссылка без скобок:
treasure$prices
treasure$prices[1]
treasure$types

##Loading Data Frames 

read.csv("targets.csv")
read.table("infantry.txt", sep="\t")
#Notice the "V1" and "V2" column headers? 
#The first line is not automatically treated as column headers 
#with read.table
read.table("infantry.txt", sep="\t", header=TRUE)


##Merging Data Frames 

targets <- read.csv("targets.csv")
infantry <- read.table("infantry.txt", sep="\t", header=TRUE)

merge(x = targets, y = infantry)
