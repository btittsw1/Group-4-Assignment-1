library("shiny")

ui <- fluidPage(
  selectInput(
    inputId = "selected_region",
    label = "Select Region",
    choices = unique(tourism$Region)
  ),
  plotOutput("time.plot")
)
