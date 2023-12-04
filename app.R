# Load
library(shiny)

# Front-end user interface
ui <- fluidPage(
  titlePanel("Interactive Histogram"),
  sidebarLayout(
    sidebarPanel(
      "Sidebar Panel",
      numericInput(inputId = "num", "Type any integer:", value = 50),
      selectInput(inputId = "color", "Choose your color for histogram:", choices = colors(), selected = "blue")
    ),
    mainPanel(
      "Main panel",
      plotOutput(outputId = "histogram")
    )
  )
)

# Back-end logic
server <- function(input, output, session) {
  num <- reactive(input$num)
  color <- reactive(input$color)
  output$histogram <- renderPlot(hist(rnorm(num()), col = color()))
}

# Execute
shinyApp(ui, server)
