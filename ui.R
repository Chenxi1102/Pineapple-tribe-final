## install.packages("shinythemes")
library(shinythemes)
library(shiny)
library(markdown)
## Define UI for application that draws a histogram
shinyUI(
  navbarPage(
    title = "Pineapple Tribe",
    theme = shinytheme("cosmo"),
    ## first tab
    tabPanel(
      "Home page",
      fluidPage(
        ## read in READ.md
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
              choices = list("35 - 44" = "younger", "45 - 54" = "elder")
            ),
            ## select input box
            selectInput(
              "filter",
              "Select category",
              choices = list("education", "wealth", "all")
            )
          ),
          mainPanel(
            tabsetPanel(
              tabPanel("Plot", 
                       plotOutput("tab3"), 
                       p("As have demonstrated by certain researches, factors that may contribute to higher divorce rate includes marrying young, limited education and income, living together before a commitment to marriage, premarital pregnancy, no religious affiliation, coming from a divorced family, and feelings of insecurity. In our dataset, divorce rate is calculated based on different categories: age, education background, wealth and different year. This plot set displays the time trend of divorce rate based on different catagories. The first step is to select an age period you would like to explore. Then you can categorize them by your own interests, such as education background, wealth or no category. ")
                       ), 
              tabPanel("Note", textOutput("note"))
            )
          )
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
              choices = list("Male" = "male", "Female" = "female", "Both gender" = "all")
            ),
            radioButtons("select_1", "Select By",
              choices = c(
                "Race" = "race",
                "Education level" = "education",
                "Region" = "region"
              )
            ),
            selectInput("select_2", "Select Age",
              choices = c("25-34" = "1", "35-44" = "2", "45-54" = "3")
            )
          ),
          mainPanel( 
            tabsetPanel(
            tabPanel("Plot", 
                     plotOutput("tab4"), 
                     p("We are interested in specifically what kind of people are less willingly to get married. This plot set intends to display the change of marriage rate over time by different categories, namely age, gender, race, educational level and region. We can see that much fewer adults in that youthful age group are married nowadays. Education also plays a crucial role in the marriage rate. It seems that young adults may delay marriage to pursue further education.")
                     ), 
            tabPanel("Note", textOutput("note"))
          ))
        )
      )
    ),
    ## fifth tab
    tabPanel(
      "Time trend",
      fluidPage(
        titlePanel("Marriage rate time trend"),
        sidebarLayout(
          sidebarPanel(
            radioButtons("filter2", "Select By",
              choices = c(
                "Race" = "race",
                "Education level" = "education",
                "Region" = "region"
              )
            ),
            selectInput("age2", "Select Age",
              choices = c("25-34" = "1", "35-44" = "2", "45-54" = "3")
            )
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