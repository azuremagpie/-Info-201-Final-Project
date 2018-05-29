#Make barplot for every column in the table
#Make reactive histogram 
#Dotplot 

library(dplyr)

subtract_average <- read.csv("../data/subtraction_average_2015_2016_v2.csv")
barplot(subtract_average$All.people.Estimate, main = "Estimate of XYZ", names.arg = 
          subtract_average$X)

