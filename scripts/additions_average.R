library(dplyr)

add_average <- read.csv("../data/additions_average_2015_2016.csv")
#View(add_average)

#View(all_estimate)
barplot(add_average$All.people.Estimate, main = "Estimate of XYZ", names.arg = 
          all_estimate$X)

