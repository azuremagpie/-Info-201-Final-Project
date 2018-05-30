library(shiny)
library(plotly)
library(tidyverse)
library(ggplot2)
library(shinythemes)

add_average <- read.csv("../data/additions_average_2015_2016.csv")
subtract_average <- read.csv("../data/subtraction_average_2015_2016_v2.csv")


my_ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      h3("Addition"),
      selectInput("addition", "Select population to view", 
                  c("All.people.Estimate",
                    "Under.18.years.Estimate",
                    "X18.to.64.years.Estimate",
                    "X65.years.and.over.Estimate"),  
                  selected = "All.people.Estimate"
      ),
      h3("Subtraction"),
      selectInput("subtraction", "Select population to view", 
                  c("All.people.Estimate",
                    "Under.18.years.Estimate",
                    "X18.to.64.years.Estimate",
                    "X65.years.and.over.Estimate"),
                  selected = "All.people.Estimate"
      )
    ),
    mainPanel(
      plotOutput("bar"),
      plotOutput("bar2")
    )
  )
)

my_server <- function(input, output) {
  
  output$bar <- renderPlot({
    par(mar = c(12.1,10.1,4.1,2.1), mgp = c(8,1,0))
    bar1 <- tapply(add_average[,input$addition], add_average$X, mean)
    barplot(bar1, xlab = "Decrease in number of people in poverty",
            ylab = "Elements",
            main = "Additions Average", horiz = TRUE,
            las = 1, col = rainbow(12), cex.names = 0.75)
  })        
  output$bar2 <- renderPlot({
    par(mar = c(12.1,10.1,4.1,2.1), mgp = c(8,1,0))
    bar2 <- tapply(subtract_average[,input$subtraction], subtract_average$X, mean)
    barplot(bar2, xlab = "Increase in number of people in poverty",
            ylab = "Elements",  main = "Subtraction Average", horiz = TRUE,
            las = 1, col = rainbow(5), cex.names = 0.75)
  })
}

shinyApp(ui = my_ui, server = my_server)