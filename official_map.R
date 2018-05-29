# Load necessary libraries into R
library(plotly)
library(ggplot2)
library(dplyr)
packageVersion("plotly")

# Load the raw data
raw_data <- read.csv("data/spm_2016.csv", stringsAsFactors = FALSE)
official_data <- read.csv("data/official-percentage.csv",
  stringsAsFactors = FALSE
)

total_data <- official_data %>%
  mutate(raw_data$State)

colnames(total_data)[4] <- "state"

# Map Projections
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

total_data$hover <- with(total_data, paste(
  state, "<br>",
  "Official Percent Estimate: ", official, "<br>"
))

plot <- plot_geo(
  total_data,
  locationmode = "USA-states", sizes = c(1, 250)
) %>%
  add_markers(
    x = total_data$long, y = total_data$lat, text = total_data$hover,
    locations = total_data$official, color = "grey"
  ) %>%
  layout(title = "Official Percent Estimate", geo = g)
