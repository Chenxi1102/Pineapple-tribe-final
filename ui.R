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
      "tab3",
      sidebarPanel(
        h2("Divorce Rate"),
        ## radio buttons
        radioButtons(
          "age",
          label = h3("select age"),
          choices = list("35 - 44"="small","45 - 54"="big")
        ),
        ## select input box
        selectInput(
          "filter",
          label = h3("select category"),
          choices = list("education","wealth","all")
        )
      ),
      mainPanel({
        plotOutput("tab3")
      })
    ),
    ## forth tab
    tabPanel(
      "tab4"
    )
  )
)
