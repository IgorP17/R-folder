#matrix 3 by 4 all set to 0
matrix(0, 3, 4)

a <- 1:12
print(a)

#init with vector - note 1,*; 2,*
matrix(a, 3, 4)

#
plank <- 1:8
dim(plank) <- c(2, 4)
print(plank)
plank[2, 3]
plank[1, 4] <- 0
plank[2,]
plank[, 2:4]

matrix(1:25, 5, 5)

# Plotting
elevation <- matrix(1, 10, 10)
elevation[4, 6] <- 0
#countour plot
contour(elevation)

persp(elevation)
persp(elevation, expand=0.2)

#volcano reseved
contour(volcano)
persp(volcano, expand=0.2)

image(volcano)

