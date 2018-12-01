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
      "tab2"
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
