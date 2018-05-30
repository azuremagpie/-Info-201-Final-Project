library(shiny)
library(plotly)
library(ggplot2)
library(knitr)
source("spm_datasets.R", local = FALSE)

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
        return("Top 5 states with highest poverty level")
      } else {
        return(SPM_top_five)
      }
    }
      
    top_five_hist <- ggplot(data = data2(),
                            aes(x = State, y = `Percent Estimate`)) +
      geom_bar(stat = "identity", fill = "pink") +
      xlab("States") +
      ylab("Percent Estimate")
    top_five_hist
  })
  
  #Render the interactive map for the "Interactive Map" tab
  
  
  #Render the histogram for the "Histogram" tab
  
})