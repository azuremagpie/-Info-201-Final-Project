library(shiny)
library(shinythemes)
library(markdown)
library(plotly)
#source("spm_datasets.R")

ui <- navbarPage(theme = shinytheme("superhero"),
  title = "Poverty levels across all US States",
  tabPanel("About this app",
           fluidPage(     
               h4("Overview"),
               includeHTML("overview.html")
             )
           
  ),
  tabPanel("More histograms",
           sidebarLayout(
             sidebarPanel(
               selectInput("top_five_input", "Select the measurement",
                           c("Official Poverty Measurement" = "Official_top_five",
                             "Supplemental Poverty Measurement" = "SPM_top_five")
               ) 
             ), 
             mainPanel(
               plotOutput("top_five_output")
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
               #Put widgets here (VAL!!!!!!!!)
             ),
             mainPanel(
               #Put the plots here
             )
           )
  )
)

shinyUI(ui)
