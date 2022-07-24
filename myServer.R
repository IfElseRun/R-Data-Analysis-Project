# Server logic

myserver <- function(input, output,session) {
  output$plot1 <- renderUI({
    if(input$boro == "manhattan") {
      results <- yelp_business_search(term = "",location = "Colorado",radius = 0, categories = "Restaurants")
      source(file="manhattan.R")
     
    }else if (input$boro == "brooklyn") {
      results <- yelp_business_search(term = "",location = "Colorado",radius = 0, categories = "Restaurants")
      source(file="brooklyn.R")
    }
   
  })
 


}
