
myUI <- fluidPage(
  includeCSS("www/landing-page.css"),
  title = "NYC Restaurants Landing Page",
  fluidRow(
    class = "landing-page",
    column(12, class="borough-dropdown",align="center", 
           selectInput(
                        "variable", "",
                       c("Manhattan" = "cyl",
                         "Brooklyn" = "am",
                         "Bronx" = "gear")),
           uiOutput(
             outputId = 'select_output'))

  ),
  fluidRow(
    column(12, align="center")
    
  )
)
