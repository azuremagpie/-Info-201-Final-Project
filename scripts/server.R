library(shiny)
library(plotly)
library(ggplot2)
library(knitr)
source("spm_datasets.R", local = FALSE)
source("maps.R", local = FALSE)

shinyServer(function(input, output) {
  
  #Render for the first tab
  output$state_percent <- renderTable({
    result <- state_all_measures %>% 
      filter(State == input$state_names) %>% 
      select(everything())
    result
  })
  
  data_used <- function() {
    if(input$top_input == "Official") {
      national_average <- Official_national_average
      return(Official_above_nation_average)
    } else {
      national_average <- SPM_national_average
      return(SPM_above_nation_average)
    }
  }
  
  output$average <- renderText({
    national_average <- 0
    if(input$top_input == "Official") {
      national_average <- Official_national_average
    } else {
      national_average <- SPM_national_average
    }
    
    paste0("The average poverty level of the United States is ",
           national_average)
  })
  
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
  
# Render the interactive map for the "Interactive Map" tab
output$map <- renderPlotly({
  map_title <- function() {
    if(input$map_data == "offic_perc") {
      return("Official Poverty Measurement")
    } else {
      return("Supplemental Poverty Measurment")
    }
  }
    g <- list(
      scope = "usa",
      projection = list(type = "albers usa"),
      showland = TRUE,
      lakecolor = toRGB("white")
    )

    plot_ly(locations = total_data$state,
            z = total_data[, input$map_title],
            color = total_data[, input$map_data],
            type = "choropleth",
            locationmode = "USA-states"
    ) %>%
      layout(geo = g)
})

<<<<<<< HEAD
  #Render the histogram for the "Histogram" tab
=======
  
  #Render the histogram for the third tab
>>>>>>> 93c263016c986052097b1afec6559aba471905c8
  output$bar <- renderPlot({
    par(mar = c(12.1,10.1,4.1,2.1), mgp = c(8,1,0))
    bar1 <- tapply(add_average[,input$addition], add_average$X, mean)
    barplot(bar1, xlab = "Decrease in number of people in poverty",
            ylab = "Elements",
            main = "Effects of Addition Elements on number of people in poverty",
            horiz = TRUE,
            las = 1, col = rainbow(12), cex.names = 0.75)
  })        
  output$bar2 <- renderPlot({
    par(mar = c(12.1,10.1,4.1,2.1), mgp = c(8,1,0))
    bar2 <- tapply(subtract_average[,input$subtraction], subtract_average$X, mean)
    barplot(bar2, xlab = "Increase in number of people in poverty",
            ylab = "Elements", 
            main = "Effects of Subtraction Elements on number of people in poverty",
            horiz = TRUE,
            las = 1, col = rainbow(5), cex.names = 0.75)
  })
})