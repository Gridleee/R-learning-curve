
library(shiny)
library(readxl)
library(dplyr)
library(tidyr)

All_Champions_Stats <- read_excel("D:/R-learning-curve/Selfmade exersizes/All Champions Stats.xlsx")
attach(All_Champions_Stats)
t <- list(distinct(All_Champions_Stats, TYPE))

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  navbarPage("League of Legends, Raw stats",
    tabPanel("Compare stats",
      sidebarLayout(
        sidebarPanel(
          sliderInput("level", "Level", 1, 18, 1),
          checkboxGroupInput("Type", "Type", t)
          
        ),
        mainPanel(
          
        )
      )
    ),
    tabPanel("Champ stats",
      sidebarLayout(
        sidebarPanel(
          
        ),
        mainPanel(
          
        )
      )
    ),
    tabPanel("About this",
      tags$h1("About this")
    )
    
    
    
  )
)
  

# Define server logic required to draw a histogram
server <- function(input, output) {
   
  
}

# Run the application 
shinyApp(ui = ui, server = server)

