
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(datasets)
data(mtcars)

shinyUI(fluidPage(

  # Application title
  titlePanel("Find your perfect car"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("min_mpg",
                  "Has to get at least this MPG:",
                  min = min(mtcars$mpg),
                  max = max(mtcars$mpg),
                  value = min(mtcars$mpg),
                  step = 0.1),
      sliderInput("min_hp",
                  "And at least this much horse power:",
                  min = min(mtcars$hp),
                  max = max(mtcars$hp),
                  value = min(mtcars$hp),
                  step = 10)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      dataTableOutput("best_cars")
    )
  )
))
