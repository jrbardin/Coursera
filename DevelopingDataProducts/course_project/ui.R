
# This is the user-interface definition for the Car Finder Shiny web App

library(shiny)
library(datasets)
data(mtcars)

shinyUI(fluidPage(

  # Application title
  titlePanel("Find your perfect car"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      h4("Select your criteria below to find the right car for you."),
      h6("(Don't worry about how much it costs!)"),
      
      sliderInput("min_mpg",
                  "Minimum Gas Mileage",
                  min = min(mtcars$mpg),
                  max = max(mtcars$mpg),
                  value = min(mtcars$mpg),
                  step = 0.1),
      sliderInput("min_hp",
                  "Minimum Horse Power",
                  min = min(mtcars$hp),
                  max = max(mtcars$hp),
                  value = min(mtcars$hp),
                  step = 10),
      radioButtons("trans", 
                   choices = list("Automatic" = 0, "Manual" = 1, "Either" = 2), 
                   label = "Transmission", 
                   selected = 2),
      actionButton("goButton", " Find! ", icon = icon("car")),
      br(),
      br(),
      h6(em("Note: results only refresh when you click 'Find'"))
    ),

    # Show a plot of the generated distribution
    mainPanel(
      textOutput("test"),
      dataTableOutput("best_cars")
    )
  )
))
