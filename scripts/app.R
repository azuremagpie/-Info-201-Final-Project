library(shiny)

add_average <- add_average

my_ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      h3("First chart"),
      selectInput("options", "Select graph to view", 
                  c("All.people.Estimate",
                    "Under.18.years.Estimate",
                    "X18.to.64.years.Estimate",
                    "X65.years.and.over.Estimate")
                  ,
                  selected = "All.people.Estimate"
      ),
      radioButtons(
        "colour",
        label = "Select color of bar graph",
        choices = c("Green", "Red", "Light blue")
      )
    ),
    
    mainPanel(
      plotOutput("bar")
      
      )
    )
)

my_server <- function(input, output) {
  
  output$bar <- renderPlot({
    bar1 <- tapply(add_average[input$options, ], add_average$X)
    barplot(bar1, col = input$colour, xlab = "State",
            main = "First visualization")
  })        
  
}

barplot(as.matrix(add_average))

shinyApp(ui = my_ui, server = my_server)