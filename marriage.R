marriageRate <- function(data,input){
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