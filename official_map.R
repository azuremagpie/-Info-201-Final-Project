# Load necessary libraries into R
library(ggplot2)
library(dplyr)
library(tidyr)
library(maps)
library(mapdata)
library(ggmap)
library(plotly)
library(lintr)
  
# Load the raw data
  raw_data <- read.csv("data/spm_2016.csv", stringsAsFactors = FALSE)
  official_data <- read.csv("data/official-percentage.csv", stringsAsFactors = FALSE)
  
  total_data <- official_data %>%
    mutate(raw_data$State) 
  
  colnames(total_data)[4] <- "state"
  
# Interactive map  
  g <- list(
    scope = "usa",
    projection = list(type = "albers usa"),
    showland = TRUE,
    landcolor = toRGB("gray85"),
    subunitwidth = 1,
    countrywidth = 1,
    subunitcolor = toRGB("white"),
    countrycolor = toRGB("white")
  )
  
  total_data$df <- with(total_data, paste(
    total_data$state, "<br />",
    "Official Percent Estimate: ", total_data$official, "<br />"
  ))
  
  plot <- plot_geo(total_data, locationmode = "USA-states", sizes = c(1, 250)) %>%
    add_markers(
      x = total_data$long, y = total_data$lat, size = total_data$official, color =
        "grey", text = total_data$df
    ) %>%
    layout(title = "Official Percent Estimate", geo = g)
  
  
  
  
  
 # Write a CSV file containing raw_data to the working directory
  #write.csv(data, "data/official-percentage.csv", row.names = FALSE)
