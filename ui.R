#install.packages("shinythemes")
library(shinythemes)
library(shiny)
library(markdown)
# Define UI for application that draws a histogram
shinyUI(
  navbarPage(
    title = "Pineapple Tribe",
    theme = shinytheme("cosmo"),
    ## first tab
    tabPanel(
      "Home page",
      fluidPage(
        includeMarkdown("README.md")
      )
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
      "Summary",
      fluidPage(
        includeMarkdown("SUMMARY.md")
      )
    )
  )
)
