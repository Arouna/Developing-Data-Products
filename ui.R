library(shiny) 
 

 # Define UI for dataset viewer application 
 shinyUI( 
    pageWithSidebar( 
         # Application title 
       headerPanel("Black & Scholes option pricing Model"), 
       
         sidebarPanel( 
            h4('User guide'),  
            
            h5('Enter values for the five (5) parameters: current stock price, current strike price, Time until option exercise,
              Volatility and Risk-free interest rates'),
               
            h5('After clicking on *Evaluate* button, the correspoding value of the *Call option* and the *Put option* is displayed 
               in the main panel'),

             sliderInput('stprice', 'Current stock price', 100, min = 90, max = 150, step = 5), 
             sliderInput('strike', 'Option strike price', 110, min = 90, max = 150, step = 5),
             sliderInput('texpir', 'Time until option exercise (percent of a year)', 1, min = .1, max = 1, step = .1), 
             numericInput('sigma', 'Volatility (between 0 and .5)', .2, min = 0, max = .5, step = .05),
             numericInput('interest', 'Risk-free interest rates (between .01 and .1)', .05, min = .01, max = .1, step = .01),
             submitButton('Evaluate')
           ), 
        mainPanel( 
               h3('Predicted Call and Put value'), 
              h4('From the parameters value enter in the left panel,  '), 
              h4('The resulting Call predicted value is : '),
             verbatimTextOutput("CallValue"), 
             h4('The resulting Put predicted value is : '),
             verbatimTextOutput("PutValue") 
          ) 
      ) 
 ) 

