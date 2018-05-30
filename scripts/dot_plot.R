#Load libraries 
library("plotly")
library("dplyr")

data <- read.csv("../data/spm_2016.csv")
#View(data)
data <- data %>% 
  select(State, Official.Percent.Estimate, SPM.Percent.Estimate)
states <- data$State
newdata <- data.frame(t(data))

#View(newdata)

m <- list(
  l = 125,
  r = 50,
  b = 300,
  t = 300,
  pad = 4
)

data$Official.Number.Estimate <- factor(data$Official.Percent.Estimate)
s <- seq(0, 25, by = 5)

plot_ly(x = seq(0, 25, by = 5),  y = data$State) %>% 
  add_trace(x = data$SPM.Percent.Estimate, y = data$State,
            name = "SPM % Estimate",type = 'scatter',
            mode = "markers", marker = list(color = "blue")) %>%
  add_trace(x = data$Official.Percent.Estimate, y = data$State,
            name = "Official % Estimate",type = 'scatter',
            mode = "markers", marker = list(color = "red")) %>%
  layout(
    title = "Poverty level measurements 2016",
    height = 800,
    yaxis = list(
      dtick = 2
    ),
    xaxis = list( title = "% of Poverty",
                  showticklabels = TRUE,
                  tickangle = 45),
    margin = m
  )

sp <- ggplot(newdata, aes(Official.Percent.Estimate, States))  +
   geom_point(aes(color = SPM.Percent.Estimate))+
   geom_point(aes(color = Official.Percent.Estimate))  +
   labs(title = "SPM and Official Estimates") 
# sp + expand_limits(x=c(0,20), y=c(0,150))


