
library(shiny)
library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)

Base_stats <- read_excel("D:/R-learning-curve/Selfmade exersizes/All Champions Stats.xlsx", sheet = "Base Stats")
Types <- read_excel("D:/R-learning-curve/Selfmade exersizes/All Champions Stats.xlsx", sheet = "TYPES")
Primary <- read_excel("D:/R-learning-curve/Selfmade exersizes/All Champions Stats.xlsx", sheet = "PRIMARY")

attach(Base_stats)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  includeCSS("styles.css"),
  
  navbarPage("League of Legends, Raw stats",
    tabPanel("Compare stats",
      sidebarLayout(
        sidebarPanel(
          sliderInput("level", "Level", 1, 18, 1),
          tags$table(
            tags$tr(
              tags$th(class = "marg",
                selectInput("x_as", "X_AS", c("HP", "AR", "AD", "AS", "MR", "HP5"), width = 100)
              ),
              tags$th(class = "marg",
                selectInput("y_as", "Y_AS", c("AR", "HP", "AD", "AS", "MR", "HP5"), width = 100)
              )
            )
          ),
          
          tags$table(
            tags$tr(
              tags$th(class = "marg",
                checkboxGroupInput("Type", "Type", Types$TYPE)
              ),
              tags$th(class = "marg",
                tags$p("#van dit type")
                
              )
            ),
            tags$tr(
              tags$th(class = "marg",
                checkboxGroupInput("Type", "Type", Primary$PRIMARY)
              ),
              tags$th(class = "marg",
                tags$p("#van deze primary")
              )
            )
          ),
          tags$div( class = "champscroll",
            checkboxGroupInput("champs", "Champion", Base_stats$NAME)
          )
        ),
        mainPanel(
          tabsetPanel(
            tabPanel("Visual", br(),
              plotOutput("stats_v"),
              textOutput("error")
            ),
            tabPanel("Table", br(),
              tableOutput("stats_t")
            )
          )
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
  lv <- reactive({
    input$level
  })
  
  plusx <- reactive({
    paste(input$x_as, "PLUS", sep="")
  }) 
  
  plusy <- reactive({
    paste(input$y_as, "PLUS", sep="")
  }) 
  
  output$stats_v <- renderPlot({
    ggplot(Base_stats, aes(Base_stats[[input$x_as]] + Base_stats[[plusx()]] * (lv() - 1), Base_stats[[input$y_as]] + Base_stats[[plusy()]] * (lv() - 1), colour=NAME, label = NAME)) + geom_point(size=2) + geom_text(hjust = -0.1) + theme(legend.position="none") + labs(y = input$y_as, x = input$x_as)   
  })
  
  output$error <- renderText({
    
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)

