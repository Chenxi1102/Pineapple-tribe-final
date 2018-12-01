library(shiny)
library(reshape2)
library(dplyr)
library(ggplot2)

shinyServer(function(input, output) {
  both <- read.csv("marriage/both_sexes.csv",stringsAsFactors = FALSE)
  men <- read.csv("marriage/men.csv",stringsAsFactors = FALSE)
  women <- read.csv("marriage/women.csv",stringsAsFactors = FALSE)
  divorce <- read.csv("marriage/divorce.csv",stringsAsFactors = FALSE)
  source("marriage.R")
  output$tab3 <- renderPlot({
    if(input$age=="small"){
      divorce <- divorce %>% select(year,4:12)
    }else{
      divorce <- divorce %>% select(year,13:21)
    }
    if(input$filter=="education"){
      divorce <- divorce %>% select(year,3:7)
      colnames(divorce)=c("year","High school","Some college","Bachelor's degree or more","Bachelor's degree, no graduate degre","Graduate degree")
    }else if(input$filter=="wealth"){
      divorce <- divorce %>% select(year,8:10)
      colnames(divorce)=c("year","poor","mid","rich")
    }else{
      divorce <- divorce %>% select(year,2)
      colnames(divorce)=c("year","all")
    }
    divorce <- melt(divorce,id = "year")
    ggplot(divorce,aes(year, value,colour=variable))+geom_line()+ylab("divorce rate")
  })
  output$tab4 <- renderPlot({
    if(input$gender=="male"){
      marriageRate(men,input)
    }else if(input$gender=="female"){
      marriageRate(women,input)
    }else{
      marriageRate(both,input)
    }
  })
})
