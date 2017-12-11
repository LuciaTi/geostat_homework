####################################
## Homework _ from 27.11.2017     ##
## Bivand et al. 2013 - chapter 3 ##
####################################


## 1) Plotting points, lines, polygons and grids ####

library(sp)
data(meuse) # use the example data "meuse" from the package "sp"
class(meuse) # check the class --> data.frame
coordinates(meuse) <- c("x", "y")
class(meuse) # --> it has been transformed to SpatialPointsDataFrame
plot(meuse) # plot the data
title("points") # add a titel to the plot


cc <- coordinates(meuse) # the coordinates of meuse are stored as a new object
class(cc) # --> it´s a matrix
m.sl <- SpatialLines(list(Lines(list(Line(cc)), "line1"))) # points are joined up in sequence
# --> a Lines-slot contains list of Line-objects
# --> SpatialLines() creates objects from lists of Lines objects
# create a SpatialLines-objects from the list of lines-obejcts (here one) which contains the list of line-objects (here cc)
plot(m.sl) # plot the resulting line
title("lines") # add a titel


data(meuse.riv) # load the data outlining the banks of River Meuse
meuse.lst <- list(Polygons(list(Polygon(meuse.riv)), # create a Polygons Objects from the data
                           "meuse.riv"))
meuse.pol <- SpatialPolygons(meuse.lst) # convert Polygon to Spatial Polygon
plot(meuse.pol, col = "grey") # plot the Spatial Polygon
title("polygons")


data(meuse.grid) # load the example data
class(meuse.grid) # --> it´s a data.frame
coordinates(meuse.grid) <- c("x", "y") # convert it to SpatialPointsDataFrame
meuse.grid <- as(meuse.grid, "SpatialPixels") # convert it to SpatiaPixels object
image(meuse.grid, col = "grey") # create a grid of colored rectangles for displaying
title("grid")


## map becomes more readable when combining several elements
# --> add elements to the plot with "add = TRUE"
image(meuse.grid, col = "grey")
plot(meuse.pol, col = "grey", add = TRUE)
plot(meuse, add = TRUE)

image(meuse.grid, col = "gold")
plot(meuse.pol, col = "cadetblue1", add = TRUE)
text(x=179000, y=333760, labels ="simple map", pos=1) # text can be added like so
lines(meuse.pol, col="blue", lwd=3) # lines can also be added like so
points(meuse, col ="red", pch=3, cex=0.3) # points can also be added like so


## 2) Axes and Layout Elements ####

# specify the layout of a plot
layout(matrix(c(1, 2), # devide the device in 1 row and 2 columns
               1, 2)) # specify colum-width and row-height
plot(meuse.pol, axes = TRUE) # plot polygon with axes
plot(meuse.pol, axes = FALSE) # plot polygon without axes
axis(side=1, at = c(178000 + 0:2 * 2000), cex.axis = 0.7)
axis(side=2, at = c(326000 + 0:3 * 4000), cex.axis = 0.7)
box() # draw a box around the current plot

## another example for the layout command:
#layout(matrix(c(1,1,1, # plot one in complete first line
#                2,3,4, # three plots in the middle line
#                5,5,6), # two plots in the last line
#              nrow=3, byrow=TRUE), # there are 3 rows, plotting is done by row
#       widths=c(1,1,2), # the first+ second column each are half as large as the last column
#       heights=c(1, 1, 2)) # the first + second row each are half as large as the last row
#layout.show(n=6) # show the layout with all six fields



oldpar = par(no.readonly = TRUE) # safe all the graphical parameters as a list
layout(matrix(c(1, 2), 1, 2)) # define a new layout

plot(meuse, axes = TRUE, cex = 0.6) # first plot - default size
plot(meuse.pol, add = TRUE)
title("Sample locations")

par(mar = c(0, 0, 0, 0) + 0.1) # define new parameters --> maximised plotting space witou axis drawn
plot(meuse, axes = FALSE, cex = 0.6)
plot(meuse.pol, add = TRUE)
box()

par(oldpar) # set the parameters to old values







