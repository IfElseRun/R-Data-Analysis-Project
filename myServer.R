# Server logic
myserver <- function(input, output) {
  output$select_output <- renderText({
    "You have selected this"
  })
}
