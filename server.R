library(shiny)
library(reshape2)
library(dplyr)
library(ggplot2)

shinyServer(function(input, output) {
  both <- read.csv("marriage/both_sexes.csv",stringsAsFactors = FALSE)
  men <- read.csv("marriage/men.csv",stringsAsFactors = FALSE)
  women <- read.csv("marriage/women.csv",stringsAsFactors = FALSE)
  divorce <- read.csv("marriage/divorce.csv",stringsAsFactors = FALSE)
  
  marriageRate <- function(data){
    if(input$select_2=="1"){
      data <- data %>% select(year,all_2534:rich_2534)
    }else if(input$select_2=="2"){
      data <- data %>% select(year,all_3544:rich_3544)
    }else{
      data <- data %>% select(year,all_4554:rich_4554)
    }
    if(input$select_1=="education"){
      data <- data %>% select(year,3:7)
      colnames(data) <- c("year","High school graduate or less","Some college","Bachelor's degree or more","Bachelor's degree, no graduate degre","Graduate degree")
    }else if(input$select_1=="race"){
      data <- data %>% select(year,8:10)
      colnames(data) <- c("year","Non-Hispanic white","Black or African-American","Hispanic of any race")
    }else{
      data <- data %>% select(year,11:16)
      colnames(data) <- c("year","New England","Mid-Atlantic","Midwest","South","Mountain West","Pacific")
    }
    data <- melt(data,id="year")
    ggplot(data,aes(year,1-value,colour=variable))+geom_line()+ylab("Marriage rate")
  }
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
      marriageRate(men)
    }else if(input$gender=="female"){
      marriageRate(women)
    }else{
      marriageRate(both)
    }
  })
})
