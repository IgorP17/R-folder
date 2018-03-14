#Summary statistics
limbs <- c(4, 3, 4, 3, 2, 4, 4, 4)
names(limbs) <- c('One-Eye', 'Peg-Leg', 'Smitty', 'Hook', 'Scooter', 'Dan', 'Mikey', 'Blackbeard')

#среднее
mean(limbs)

barplot(limbs)

#draw h line
abline(h = mean(limbs))

############## median
limbs <- c(4, 3, 4, 3, 2, 4, 4, 14)
names(limbs) <- c('One-Eye', 'Peg-Leg', 'Smitty', 'Hook', 'Scooter', 'Dan', 'Mikey', 'Davy Jones')

mean(limbs)
median(limbs)

barplot(limbs)

abline(h = mean(limbs))

abline(h = median(limbs))


#различае есть 19 человек у которых по 5 долларов и 1 с миллиардом:
#медиана - это 50 персентилей, т.е. 
#Медиа́на (50-й перцентиль, квантиль 0,5) — возможное значение признака,
#которое делит ранжированную совокупность (вариационный ряд выборки) 
#на две равные части: 50 % «нижних» единиц ряда данных будут иметь 
#значение признака не больше, чем медиана, 
#а «верхние» 50 % — значения признака не меньше, чем медиана.

mean(c(5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,1000000000))
median(c(5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,1000000000))

#######################################

#стандартное отклонение
pounds <- c(45000, 50000, 35000, 40000, 35000, 45000, 10000, 15000)
barplot(pounds)
meanValue <- mean(pounds)
abline(h = meanValue)
deviation <- sd(pounds)

abline(h = meanValue + deviation)
abline(h = meanValue - deviation)
#####

