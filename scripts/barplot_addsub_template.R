library(shiny)
library(plotly)
library(tidyverse)
library(ggplot2)
library(shinythemes)

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
    bar1 <- tapply(add_average[,input$addition], add_average$X, mean)
    barplot(bar1, xlab = "X axis", main = "Additions Average", horiz = TRUE,
            las = 1, col = " light blue" )
  })        
  output$bar2 <- renderPlot({
    bar2 <- tapply(subtract_average[,input$subtraction], subtract_average$X, mean)
    barplot(bar2, xlab = "X axis", main = "Subtraction Average", horiz = TRUE,
            las = 1, col = "light blue")
  })
}

shinyApp(ui = my_ui, server = my_server)