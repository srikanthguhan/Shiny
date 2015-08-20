
# This is the server logic for a Shiny web application.
#

library(shiny)

shinyServer(function(input, output) {
   
  output$pval <- reactive({
      if(is.na(input$ChiSq)) "Please enter the Chi Square value"
      else if(is.na(input$Df)) "Please enter the Degrees of Freedom"
      else pchisq(q = input$ChiSq, df = input$Df,lower.tail = F)
      })
    output$inference <- reactive({
    if(is.na(input$ChiSq)) "Please enter the Chi Square value"
        else if(is.na(input$Df)) "Please enter the Degrees of Freedom"
        else if (pchisq(q = input$ChiSq, df = input$Df,lower.tail = F)>0.1) "Not significant statistically"
        else if (pchisq(q = input$ChiSq, df = input$Df,lower.tail = F)>0.05) "Significant at 10%"
        else if (pchisq(q = input$ChiSq, df = input$Df,lower.tail = F)>0.01) "Significant at 5%"
        else "Significant at 1%"
  })  
})

#' Tried not to calculate the p-value again and again for significance but
#' could not find any method to save it as an intermediate variable. 
#' Kindly suggest if you know how to do it. Thanks! But hey I made it reactive.