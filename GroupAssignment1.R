library("fpp3")
library("shiny")
data("tourism")

ui <- fluidPage(
  selectInput(
    inputId = strong("selected_region"),
    label = "Select Region",
    choices = unique(tourism$Region)
  ),
  plotOutput("time.plot"),

  selectInput("selected_purpose", label = h3("Select box"),
              choices = list("Business" , "Holiday" , "Other" ),
              selected = 1),
)

server <- function(input, output, session) {
  output$time.plot <- renderPlot({
    tourism.region <- tourism[tourism$Region == input$selected_region, ]
    tourism.purpose <- tourism.region[tourism.region$Purpose == input$selected_purpose, ]
    autoplot(tourism.purpose)


  })

  output$value <- renderPrint({ input$select })

}

shinyApp(ui, server)
