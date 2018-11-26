# 03-reactive

library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "x", 
    label = "Choose a number", 
    value = 25, min = 1, max = 100),
  
  sliderInput(inputId = "y", 
    label = "Choose a number", 
    value = 25, min = 1, max = 100),
  
  plotOutput("DOT")
)

server <- function(input, output) {
  
  x <- reactive({
    input$x
  })
  
  y <- reactive({
    input$y
  })
  
  output$DOT <- renderPlot({
    plot(x(), y())
  })
}

shinyApp(ui = ui, server = server)