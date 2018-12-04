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
      "Divorce rate",
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
    ## third tab
    tabPanel(
      "Marriage rate",
      fluidPage(
        titlePanel("Marriage rate"),
        sidebarLayout(
          sidebarPanel(
            radioButtons(
              "gender",
              "Select geneder",
              choices = list("Male"="male","Female"="female","Both gender"="all")
            ),
            radioButtons("select_1", "Select By",
                         choices = c("Race" = "race",
                                     "Education level" = "education",
                                     "Region" = "region")
            ),
            selectInput("select_2", "Select Age",
                        choices = c("25-34"="1", "35-44"="2", "45-54"="3"))
          ),
          mainPanel({
            plotOutput("tab4")
          })
        )
      )
    ),
    ## fifth tab
    tabPanel(
      "Marriage rate",
      fluidPage(
        titlePanel("Marriage rate"),
        sidebarLayout(
          sidebarPanel(
            radioButtons("filter2", "Select By",
                         choices = c("Race" = "race",
                                     "Education level" = "education",
                                     "Region" = "region")
            ),
            selectInput("age2", "Select Age",
                        choices = c("25-34"="1", "35-44"="2", "45-54"="3"))
          ),
          mainPanel({
            imageOutput("tab5")
          })
        )
      )
    ),
    tabPanel(
      "Summary",
      fluidPage(
        includeMarkdown("SUMMARY.md")
      )
    )
  )
)
