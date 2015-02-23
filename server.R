library(shiny)
library(datasets)

lm  <- lm(mpg~wt + qsec + am, data=mtcars)
coef <- summary(lm)$coef
p_mpg <- function(am,wt,qsec) {
      coef[2,1]*wt + coef[3,1]*qsec + coef[4,1]*as.numeric(am) + coef[1,1]
}
change <- function(am){if(am=='0') return('Automatic') else return('Manual')}
shinyServer(
      function(input,output) {
            output$val1 <- renderPrint({input$wt})
            output$val2 <- renderPrint({input$qsec})
            output$val3 <- renderPrint({change(input$am)})
            output$results <- renderPrint({p_mpg(input$am,input$wt,input$qsec)})
      }
)
