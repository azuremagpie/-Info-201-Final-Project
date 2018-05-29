#Load libraries 
library("plotly")
library("dplyr")

data <- read.csv("../data/spm_2016.csv")
View(data)

factor(data$Official.Percent.Estimate)

plot_ly(data, x = factor(data$Official.Percent.Estimate),  y = factor(data$State),
        name = "Office % Estimate", type = 'scatter',
             mode = "markers", marker = list(color = "pink")) %>%
  add_trace(x = factor(data$SPM.Percent.Estimate), y = factor(data$State),
            name = "SPM % Estimate",type = 'scatter',
            mode = "markers", marker = list(color = "blue")) %>%
  layout(
    autosize = F,
    title = "Poverty level measurements 2016",
    xaxis = list(title = "State")
   # margin = list(l = 100)
  )


