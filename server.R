 library(shiny) 
 #diabetesRisk <- function(glucose) glucose / 200 
 
 
 # Black-Scholes Call Option Value
 # This function return the value of the call option
 blackscholesCall <- function(S, X, rf, T, sigma) {
   
   
   d1 <- (log(S/X)+(rf+sigma^2/2)*T)/(sigma*sqrt(T))
   d2 <- d1 - sigma * sqrt(T)
   
   callvalue <- S*pnorm(d1) - X*exp(-rf*T)*pnorm(d2)
   
   
   callvalue
 }
 
 # Black-Scholes Put Option Value
 # This function return the value of the put option
 blackscholesput <- function(S, X, rf, T, sigma) {
   
   
   d1 <- (log(S/X)+(rf+sigma^2/2)*T)/(sigma*sqrt(T))
   d2 <- d1 - sigma * sqrt(T)
   
   
   putvalue <- X*exp(-rf*T) * pnorm(-d2) - S*pnorm(-d1)
   
   putvalue
 }
 
 
 
 shinyServer( 
   function(input, output) { 
    #output$inputValue <- renderPrint({input$glucose}) 
    output$CallValue <- renderPrint({blackscholesCall(input$stprice,input$strike, input$interest, input$texpir, input$sigma)}) 
    output$PutValue <- renderPrint({blackscholesput(input$stprice,input$strike, input$interest, input$texpir, input$sigma)}) 
  } 
 ) 
