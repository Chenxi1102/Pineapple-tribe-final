# install.packages("shiny")
# install.packages("reshape2")
library(shiny)
library(reshape2)
library(dplyr)
library(ggplot2)

## Define server logic required to draw graphs and chart
shinyServer(function(input, output) {
# read the data
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
  output$note <- renderText("Have fun")
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
## creat the gif graph
  output$tab5 <- renderImage(
    return(list(
      src = paste0("img/",input$filter2, "_", input$age2, ".gif"),
      filetype = "gif",
      alt = "This is a gif"
    ))
  ,deleteFile=FALSE)
})