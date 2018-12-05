# install.packages("shiny")
# install.packages("reshape2")
library(shiny)
library(reshape2)
library(dplyr)
library(ggplot2)

## Define server logic required to draw graphs and chart
shinyServer(function(input, output) {
# reeding the data in
  both <- read.csv("marriage/both_sexes.csv", stringsAsFactors = FALSE)
  men <- read.csv("marriage/men.csv", stringsAsFactors = FALSE)
  women <- read.csv("marriage/women.csv", stringsAsFactors = FALSE)
  divorce <- read.csv("marriage/divorce.csv", stringsAsFactors = FALSE)
  source("marriage.R")
  
## if and else statement to filer the data needed
  output$tab3 <- renderPlot({
    if (input$age == "younger") {
      divorce <- divorce %>% select(year, 4:12)
    } else {
      divorce <- divorce %>% select(year, 13:21)
    }
    if (input$filter == "education") {
      divorce <- divorce %>% select(year, 3:7)
      colnames(divorce) <- c("year", "High school", "Some college", "Bachelor's degree or more", "Bachelor's degree, no graduate degree", "Graduate degree")
    } else if (input$filter == "wealth") {
      divorce <- divorce %>% select(year, 8:10)
      colnames(divorce) <- c("year", "poor", "mid", "rich")
    } else {
      divorce <- divorce %>% select(year, 2)
      colnames(divorce) <- c("year", "all")
    }
## reshaping the data
    divorce <- melt(divorce, id = "year")
## graph the divorce rate chart    
    ggplot(divorce, aes(year, value, colour = variable)) + geom_line() + ylab("divorce rate")
  })
## if and else statment to filter data
  output$tab4 <- renderPlot({
    if (input$gender == "male") {
      marriageRate(men, input)
    } else if (input$gender == "female") {
      marriageRate(women, input)
    } else {
      marriageRate(both, input)
    }
  })
  output$note1 <- renderText("As have demonstrated by certain researches, factors that
                             may contribute to higher divorce rate includes marrying
                             young, limited education and income, living together before
                             a commitment to marriage, premarital pregnancy, no religious
                             affiliation, coming from a divorced family, and feelings of
                             insecurity. In our dataset, divorce rate is calculated based
                             on different categories: age, education background, wealth
                             and different year. This plot set displays the time trend of
                             divorce rate based on different catagories. The first step
                             is to select an age period you would like to explore. Then
                             you can categorize them by your own interests, such as 
                             education background, wealth or no category.")
  
  output$note2 <- renderText("According to recent news, the percentage of U.S. adults 
                             who are married has reached a “record low”. However we are
                             interested in specifically what kind of people are less 
                             willingly to get married. This plot set intends to display 
                             the change of marriage rate over time by different categories
                             , namely age, gender, race, educational level and region. We
                             can see that much fewer adults in that youthful age group 
                             are married nowadays. Education also plays a crucial role 
                             in the marriage rate. It seems that young adults may delay 
                             marriage to pursue further education.")
## creat the gif graph
  output$tab5 <- renderImage(
    return(list(
      src = paste0("img/",input$filter2, "_", input$age2, ".gif"),
      filetype = "gif",
      alt = "This is a gif"
    ))
  ,deleteFile=FALSE)
})