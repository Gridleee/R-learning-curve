library(shiny)
ui <- fluidPage(
  sliderInput(inputId = "num", label = "Choose a number", value = 25, min = 1, max = 100),
  plotOutput("hst")
)

server <- function(input, output) {
  output$hst <- renderPlot({
    hist(rnorm(input$num), main = "Random numbers")
  })
}

shinyApp(ui = ui, server = server)