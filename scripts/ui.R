library(shiny)
library(shinythemes)
library(markdown)
source("spm_datasets.R", local = TRUE)

ui <- navbarPage(theme = shinytheme("superhero"),
  title = "Poverty levels across all US States",
  tabPanel("About this app",
           sidebarLayout(   
             sidebarPanel(
               selectInput("top_five_data", "Select the measurement",
                           c("Official Poverty Measurement" = "Official_top_five",
                             "Supplemental Poverty Measurement" = "SPM_top_five"))
             ),
             mainPanel(     
               h4("This app shows descriptive graphs about poverty level in the US"),
               includeMarkdown("overview.rmd")
             )
           )
  ),
  tabPanel("Interactive Maps",
           sidebarLayout(
             sidebarPanel(
               #Put widgets here
             ),
             mainPanel(
               #Put the map here
             )
           )
  ),
  tabPanel("Histograms",
           sidebarLayout(
             sidebarPanel(
               #Put widgets here
             ),
             mainPanel(
               #Put the plots here
             )
           )
  )
)

shinyUI(ui)
