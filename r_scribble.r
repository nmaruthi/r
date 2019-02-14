# Vector with numerics from 1 up to 10
my_vector <- 1:10 

# Matrix with numerics from 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)

# First 10 elements of the built-in data frame mtcars
my_df <- mtcars[1:10,]

# Adapt list() call to give the components names
my_list <- list(my_vector, my_matrix, my_df)

# Print out my_list
names(my_list) <- c("vec", "mat", "df")
my_list

# shining_list, the list containing movie name, actors and reviews, is pre-loaded in the workspace

# We forgot something; add the year to shining_list
shining_list_full <- c(shining_list, year = 1980)

# Have a look at shining_list_full
str(shining_list_full)

# Add code to import data from all three sheets in urbanpop.xls
path <- "urbanpop.xls"
urban_sheet1 <- read.xls(path, sheet = 1, stringsAsFactors = FALSE)
urban_sheet2 <- read.xls(path, sheet = 2, stringsAsFactors = FALSE)
urban_sheet3 <- read.xls(path, sheet = 3, stringsAsFactors = FALSE)

# Extend the cbind() call to include urban_sheet3: urban
urban <- cbind(urban_sheet1, urban_sheet2[-1], urban_sheet3[-1])

# Remove all rows with NAs from urban: urban_clean
urban_clean <- na.omit(urban)

# Print out a summary of urban_clean
summary(urban_clean)

install.packages("dplyr")

glimpse(mtcars)

# ggplot2
install.packages("ggplot2")
library("ggplot2")

ggplot(mtcars, aes(x = factor(cyl), y = mpg)) + geom_point()
ggplot(mtcars, aes(x = wt, y = mpg, shape = disp)) + geom_point()

iris

#########################
# Plots with ggplot2
#########################
ggplot(mtcars, aes(x = wt, y = mpg, color = disp)) + geom_point()
ggplot(mtcars, aes(x = wt, y = mpg, size = disp)) + geom_point()

ggplot(diamonds, aes(x = carat, y = price)) + geom_point()

ggplot(diamonds, aes(x = carat, y = price)) + geom_point() + geom_smooth()

ggplot(diamonds, aes(x = carat, y = price, color = clarity)) + geom_smooth(se = FALSE)

ggplot(diamonds, aes(x = carat, y = price, color = clarity)) + geom_point()

ggplot(diamonds, aes(x = carat, y = price, color = clarity)) + geom_smooth()

dia_plot <- ggplot(diamonds, aes(x = carat, y = price))
dia_plot <- dia_plot + geom_point(alpha = 0.2)
dia_plot + geom_smooth(se = FALSE)
dia_plot + geom_smooth(aes(col = clarity), se = FALSE)

ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point() + # Copy from Plot 2
  geom_smooth(method=lm, se=FALSE) + # Copy from Plot 2
  geom_smooth(aes(group=1), method ="lm", se = FALSE, linetype = 2)

#########################
# Plots with base package
#########################
  plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)
  mtcars$fcyl <- as.factor(mtcars$cyl)
  plot(mtcars$wt, mtcars$mpg, col = mtcars$fcyl)
  
  carModel <- lm(mtcars$wt ~ mtcars$mpg, data = mtcars)
  mtcars$cyl <- as.factor(mtcars$cyl)
  plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)  
  
  plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)
  abline(lm(mpg ~ wt, data = mtcars), lty = 2)
  lapply(mtcars$cyl, function(x) {
    abline(lm(mpg ~ wt, mtcars, subset = (cyl == x)), col = x)
  })
  legend(x = 5, y = 33, legend = levels(mtcars$cyl),
         col = 1:3, pch = 1, bty = "n")
  
subset(iris, Species=='setosa', select = c('Sepal.length', 'Species'))
