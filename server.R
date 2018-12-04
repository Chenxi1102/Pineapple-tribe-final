library(shiny)
library(reshape2)
library(dplyr)
library(ggplot2)
library(gganimate)

shinyServer(function(input, output) {
  both <- read.csv("marriage/both_sexes.csv", stringsAsFactors = FALSE)
  men <- read.csv("marriage/men.csv", stringsAsFactors = FALSE)
  women <- read.csv("marriage/women.csv", stringsAsFactors = FALSE)
  divorce <- read.csv("marriage/divorce.csv", stringsAsFactors = FALSE)
  source("marriage.R")
  source("animated.R")
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
    divorce <- melt(divorce, id = "year")
    ggplot(divorce, aes(year, value, colour = variable)) + geom_line() + ylab("divorce rate")
  })
  output$summary1 <- renderText("Over the years, researchers have determined certain factors that put people at higher risk for divorce: marrying young, limited education and income, living together before a commitment to marriage, premarital pregnancy, no religious affiliation, coming from a divorced family, and feelings of insecurity. This plot set intend to test these factors. The plot set displays the time trend of divorce rate based on different catagories. The first sted is to select an age period you would like to explore. Then you can categorize them by your own interests??such as education background, wealth or no category. ")
  output$tab4 <- renderPlot({
    if (input$gender == "male") {
      marriageRate(men, input)
    } else if (input$gender == "female") {
      marriageRate(women, input)
    } else {
      marriageRate(both, input)
    }
  })
  output$summary2 <- renderText("hello world")
  output$tab5 <- renderImage({
    if (!dir.exists(paste0("img/", input$filter2, "_", input$age2, ".gif"))) {
      animated(both, input)
    }
    return(list(
      src = paste0(input$filter2, "_", input$age2, ".gif"),
      filetype = "gif",
      alt = "This is a gif"
    ))
  })
})