
# This is the server logic for the Car Finder Shiny web app

library(shiny)
library(datasets)
data(mtcars)
# drop some of the columns
mtcars <- mtcars[c(1,2,4,7,9)]
mtcars2 <- cbind(row.names(mtcars), mtcars)
names(mtcars2)[1] <- "make_model"

shinyServer(function(input, output) {
  
  output$best_cars <- renderDataTable({
    # only refresh table when user hits button
    input$goButton
    
    # don't show anything until user hits button the first time
    if (input$goButton == 0) {
      return(NULL)
    }
    
    isolate({
      # filter based on user selections
      my_cars <- 
        mtcars2[mtcars2$mpg >= input$min_mpg 
                & mtcars2$hp >= input$min_hp
                & (mtcars2$am == input$trans | input$trans==2), ]
      # customize names for table header
      names(my_cars) <- c("Make & Model", "Miles/Gallon", "Cylinders", "Horse Power", "1/4 Mile Time (sec)", "Transmission 0=Automatic 1=Manual")       
      # return value
      my_cars
    })
  }, options = list(orderClasses = TRUE, pageLength = 10),
  )

})
