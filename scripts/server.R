library(shiny)
library(plotly)
library(ggplot2)
library(knitr)
source("spm_datasets.R", local = FALSE)
#source("maps.R", local = FALSE)

shinyServer(function(input, output) {
  
  #Render for the first tab
  data_used <- function() {
    if(input$top_input == "Official") {
      return(Official_above_nation_average)
    } else {
      return(SPM_above_nation_average)
    }
  }
  
  output$top_output <- renderPlot({
    title <- function() {
      if(input$top_input == "Official") {
        return("Official Poverty Measurement")
      } else {
        return("Supplemental Poverty Measurment")
      }
    }
    
    top_hist <- ggplot(data = head(data_used(), input$num),
                       aes(x = State, y = `Percent Estimate`)) +
      geom_bar(stat = "identity", fill = "pink") +
      xlab("States") +
      ylab("Percent Estimate") +
      ggtitle(paste0("Top ", input$num," states with highest poverty level, ",
                     "according to the ", title())) +
      geom_text(aes(label = `Percent Estimate`))
    top_hist
  })
  
  #Render the interactive map for the "Interactive Map" tab
# output$map <- renderPlotly({
#     g <- list(
#       scope = "usa",
#       projection = list(type = "albers usa"),
#       showland = TRUE,
#       lakecolor = toRGB("white")
#     )
# 
#     plot_ly(locations = total_data$state,
#             z = total_data[,input$map_data],
#             color = total_data[,input$map_data],
#             type = "choropleth",
#             locationmode = "USA-states"
#     ) %>%
#       layout(geo = g)
# })

  
  #Render the histogram for the "Histogram" tab
  
})