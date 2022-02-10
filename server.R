library("shiny")

server <- function(input, output) {
  output$time.plot <- renderPlot({
    tourism.region <- tourism[tourism$Region == input$selected_region, ]
    autoplot(tourism.region)
  })
}
