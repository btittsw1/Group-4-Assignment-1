library("fpp3")
library("shiny")
data("tourism")

ui <- fluidPage(
  selectInput(
    inputId = "selected_region",
    label = "Select Region",
    choices = unique(tourism$Region)
  ),
  plotOutput("time.plot")
)


server <- function(input, output, session) {
  output$time.plot <- renderPlot({
    tourism.region <- tourism[tourism$Region == input$selected_region, ]
    autoplot(tourism.region)
  })
}

shinyApp(ui, server)
