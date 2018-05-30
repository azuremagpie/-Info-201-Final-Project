library(shiny)
library(plotly)
library(ggplot2)
<<<<<<< HEAD
source("spm_datasets.R", local = TRUE)
source("maps.R", local = TRUE)
=======
library(knitr)
source("spm_datasets.R", local = FALSE)
>>>>>>> 9976c220c62a1b8aa16c204bec2ca0767cb42601

shinyServer(function(input, output) {
  
  #Render for the first tab
  
  
  data2 <- function() {
   if(input$top_five_input == 'Official_top_five') {
     return(Official_top_five)
   } else {
     return(SPM_top_five)
   }
  }
  
  output$top_five_output <- renderPlot({
    title <- function() {
      if(input$top_five_input == 'Official_top_five') {
        return("Official Poverty Measurement")
      } else {
        return("Supplemental Poverty Measurment")
      }
    }
      
    top_five_hist <- ggplot(data = data2(),
                            aes(x = State, y = `Percent Estimate`)) +
      geom_bar(stat = "identity", fill = "pink") +
      xlab("States") +
      ylab("Percent Estimate") +
      ggtitle(paste0("Top 5 states with highest poverty level, according to the ",
                     title())) +
      geom_text(aes(label = `Percent Estimate`))
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