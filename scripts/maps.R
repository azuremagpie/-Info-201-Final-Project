library(plotly)
library(ggplot2)
library(dplyr)

# Set working directory
#setwd("~/Desktop/INFO_201/Info-201-Final-Project")

# Load the raw data
raw_data <- read.csv("../data/spm_2016.csv", stringsAsFactors = FALSE)
lat_long <- read.csv("../data/state_coordinates.csv", stringsAsFactors = FALSE)

# Sort data
total_data <- raw_data %>%
  select(state = State, 
         offic_perc = Official.Percent.Estimate, 
         spm_perc = SPM.Percent.Estimate)
total_data <- total_data[-1, ]
total_data <- total_data %>%
  mutate(lat = lat_long$Latitude, 
         lon = lat_long$Longitude)
total_data["long"] <- NULL

total_data$hover <- with(total_data, paste(
  state, "<br/>",
  "Official Percent Estimate", offic_perc, "<br/>"
))

total_data <- filter(total_data, state != 'District of Columbia')
total_data$state <- state.abb

<<<<<<< HEAD
=======

>>>>>>> 0640ddc59b6f387f90dd06d6f562cc8f6f9c4d53
build_offic_map <- function() {
  g <- list(
    scope = "usa",
    projection = list(type = "albers usa"),
    showland = TRUE,
    lakecolor = toRGB("white")
  )
  
  p <- plot_ly(locations = total_data$state,
<<<<<<< HEAD
               z = total_data[, "offic_perc"],
               color = total_data[,"offic_perc"],
               type = "choropleth",
               locationmode = "USA-states"
=======
          z = total_data[, "offic_perc"],
          color = total_data[,"offic_perc"],
          type = "choropleth",
          locationmode = "USA-states"
>>>>>>> 0640ddc59b6f387f90dd06d6f562cc8f6f9c4d53
  ) %>%
    layout(title = "Official Poverty Measurement", geo = g)
  p
}

build_spm_map <- function() {
  g <- list(
    scope = "usa",
    projection = list(type = "albers usa"),
    showland = TRUE,
    lakecolor = toRGB("white")
  )
  
  plot_ly(locations = total_data$state,
          z = total_data[, "spm_perc"],
          color = total_data[, "spm_perc"],
          type = "choropleth",
          locationmode = "USA-states"
  ) %>%
    layout(title = "SPM Measurement", geo = g)
<<<<<<< HEAD
}
=======
}

# SERVER 
output$map <- renderPlotly({
  if(input$map_data == "offic_perc") {
    return (build_offic_map())
  } else{
    return (build_spm_map())
  } 
})
>>>>>>> 0640ddc59b6f387f90dd06d6f562cc8f6f9c4d53
