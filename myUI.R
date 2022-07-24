
myUI <- fluidPage(
  navbarPage("NYC Restaurants",
             tabPanel("Main",     fluidRow(
               class = "landing-page",
               column(12, class="borough-dropdown",align="center", 
                      uiOutput(
                        outputId = 'select_output'))
               
             )), tabPanel("Map",
                          dashboardPage(
                            dashboardHeader(disable = TRUE),
                            dashboardSidebar(selectInput(
                              "boro", " Select Boro",
                              c("Manhattan" = "manhattan",
                                "Brooklyn" = "brooklyn",
                                "Bronx" = "gear"))),
                            dashboardBody(
                              # Boxes need to be put in a row (or column)
                              
                              fluidRow(
                                box(uiOutput("plot1", height = 250),width = 12)
                                
                              )
                            )
                          )
                          
                          ),
             tabPanel("Component 3")
  ),
  
  includeCSS("www/landing-page.css"),
  title = "NYC Restaurants Landing Page"

)