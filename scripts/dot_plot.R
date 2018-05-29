#Load libraries 
library("plotly")
library("dplyr")

data <- read.csv("../data/spm_2016.csv")
View(data)

m <- list(
  l = 125,
  r = 50,
  b = 100,
  t = 100,
  pad = 4
)

data$Official.Number.Estimate <- factor(data$Official.Percent.Estimate)
s <- seq(0, 25, by = 5)

plot_ly(x = seq(0, 25, by = 5),  y = factor(data$State)) %>% 
  add_trace(x = factor(data$SPM.Percent.Estimate), y = factor(data$State),
            name = "SPM % Estimate",type = 'scatter',
            mode = "markers", marker = list(color = "blue")) %>%
  add_trace(x = factor(data$Official.Percent.Estimate), y = factor(data$State),
            name = "Official % Estimate",type = 'scatter',
            mode = "markers", marker = list(color = "red")) %>%
  layout(
    title = "Poverty level measurements 2016",
    xaxis = list( title = "% of Poverty",
                  showticklabels = TRUE,
                  tickangle = 45),
    margin = m
  )


