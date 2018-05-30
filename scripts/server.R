library(shiny)
library(plotly)
library(ggplot2)
source("spm_datasets.R", local = TRUE)
source("maps.R", local = TRUE)

shinyServer(function(input, output) {
  
  #Render for the first tab
  output$top_five <- renderPlot({
    #Data widget
    data <- input$top_five_data
    
    top_five_hist <- plot_ly(data, x = ~State, 
                             y = ~`Percent Estimate`, 
            type = 'bar', text = text,
            marker = list(color = 'rgb(158,202,225)',
                          line = list(color = 'rgb(8,48,107)',
                                      width = 1.5))) %>%
      layout(title = "States with top 5 highest poverty level",
             xaxis = list(title = "States"),
             yaxis = list(title = "Percent Estimate"))
    top_five_hist
  })
  
  #Render the interactive map for the "Interactive Map" tab
output$map <- renderPlotly({
    g <- list(
      scope = "usa",
      projection = list(type = "albers usa"),
      showland = TRUE,
      lakecolor = toRGB("white")
    )

    plot_ly(locations = total_data$state,
            z = total_data[,input$map_data],
            color = total_data[,input$map_data],
            type = "choropleth",
            locationmode = "USA-states"
    ) %>%
      layout(geo = g)
})

  
  #Render the histogram for the "Histogram" tab
  
})