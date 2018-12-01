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
      "tab3",
      fluidPage(
        titlePanel("Divorce Rate"),
        sidebarLayout(
          sidebarPanel(
            ## radio buttons
            radioButtons(
              "age",
              "Select age",
              choices = list("35 - 44"="small","45 - 54"="big")
            ),
            ## select input box
            selectInput(
              "filter",
              "Select category",
              choices = list("education","wealth","all")
            )
          ),
          mainPanel({
            plotOutput("tab3")
          })
        )
      )
    ),
    ## forth tab
    tabPanel(
      "tab4"
    )
  )
)
