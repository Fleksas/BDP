library(shiny)
shinyUI(pageWithSidebar(
      headerPanel('Miles per galon (MPG) prediction for cars'),
      sidebarPanel(
            sliderInput('wt','Car weight (1000lb)',min = 0, max = 6, value = 3.2,step=0.1),
            sliderInput('qsec','Acceleration speed (1/4 mile time)', min=14, max=23, value=17.8, step=0.1),
            selectInput("am","Transmission type",c('Automatic'=0,'Manual'=1)),
            submitButton('Predict MPG')
      ),
      mainPanel(
            tabsetPanel(
                  tabPanel("Output",
                           h5('Weight'),
                           verbatimTextOutput("val1"),
                           h5('Acceleration speed'),
                           verbatimTextOutput("val2"),
                           h5('Transmission type'),
                           verbatimTextOutput("val3"),
                           h4('Predicted MPG', style = "color:red"),
                           verbatimTextOutput("results")
                  ),
                  tabPanel("Documentation",
                           p(h4("MPG prediction:")),
                           helpText("This shiny app predicts MPG for cars using linear regression model
                             build on the mtcars dataset."),
                           HTML("<u><b>Instructions: </b></u>
                        <br>
                        1) Select car weight <br>
                        2) Select acceleration speed <br>
                        3) Select transmission type <br>
                        3) Press 'Predict MPG' button <br>
                        <br>
                        <u><b>Prediction Equision: </b></u>
                        <br>
                        <b> MPG = -3.917*WT + 1.226*QSEC + 2.936*AM + 9.618 </b>
                        <br>
                        <br>
                        WT   - Car weight in 1000lb <br>
                        QSEC - Acceleration speed 1/4 mile time <br>
                        AM   - Transmission type (Auto = 0, Manual= 1) <br>
                    ")                
                  )
            )
      )
)
)