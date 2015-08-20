
# This is the user-interface definition of a Shiny web application.

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Chi-Square to P-value Calculator"),
  
  # Sidebar with inputs for p-value calculation
  sidebarPanel(
        numericInput('ChiSq','Chi-square value',0,min=-Inf,max=Inf,step=0.0001),
        numericInput('Df','Degrees of Freedom',1,min=1,max=Inf,step=1),
        p('Your chi-square score goes in the chi-square score box'), 
        p('Enter the degrees of freedom in the DF box (df = (NColumns-1)*(NRows-1) for chi-square test for independence)'),
        p('You can also directly type the numeric inputs into the boxes instead of using the Slider')
  ),
  
  # Show p-value and inference
  mainPanel(
      strong('This calculator will tell you the one-tailed (right-tail) probability value for a chi-square test'),
      br(),
      strong('(i.e., the area under the chi-square distribution from the chi-square value to positive infinity), 
             given the chi-square value and the degrees of freedom.'),
      h3('Calculated P-value (right-tail)'),
      verbatimTextOutput("pval"),
      h3('Calculated Significance'),
      verbatimTextOutput("inference"),
      br(),br(),
      p('If you have any doubts regarding the concepts, please do check these links below:'),
      a('https://en.wikipedia.org/wiki/Chi-squared_distribution'),
      br(),
      a('https://en.wikipedia.org/wiki/P-value'),
      br(),br(),
      em('The author can be contacted on his Gmail ID: srikanthguhan')
      )
))
