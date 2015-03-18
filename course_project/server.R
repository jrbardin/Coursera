
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(datasets)
data(mtcars)
mtcars2 <- cbind(row.names(mtcars), mtcars)
colnames(mtcars2)[1] <- "Make & Model"

shinyServer(function(input, output) {

  output$best_cars <- renderDataTable({
    # filter based on user selections
    my_cars <- mtcars2[mtcars2$mpg >= input$min_mpg & mtcars2$hp >= input$min_hp, ]
  }, options = list(orderClasses = TRUE, pageLength = 25),
  )

})
