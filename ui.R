#install.packages("shinythemes")
library(shinythemes)
library(shiny)

# Define UI for application that draws a histogram
shinyUI(
  navbarPage(
    title = "Pineapple Tribe",
    theme = shinytheme("cosmo"),
    ## first tab
    tabPanel(
      "tab1"
    ),
    ## second tab
    tabPanel(
      "tab2",
      fluidPage(
        titlePanel("Marriage Rate"),
        sidebarLayout(
          sidebarPanel(
            radioButtons("select_1", "Select By",
                         choices = c("Race" = "race",
                                     "Education_level" = "education",
                                     "Region" = "region")
            ),
            selectInput("select_2", "Select Age",
                        choices = c("25-34"="1", "35-44"="2", "45-54"="3"))
          ),
          mainPanel(
            plotOutput("contents")
          )
        )
      )
    ),
    ## third tab
    tabPanel(
      "tab3"
    ),
    ## forth tab
    tabPanel(
      "tab4"
    )
  )
)
