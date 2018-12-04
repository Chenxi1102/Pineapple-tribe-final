animated <- function(data,input){
  if(input$age2=="1"){
    data <- data %>% select(year,all_2534:rich_2534)
  }else if(input$age2=="2"){
    data <- data %>% select(year,all_3544:rich_3544)
  }else{
    data <- data %>% select(year,all_4554:rich_4554)
  }
  if(input$filter2=="education"){
    data <- data %>% select(year,3:7)
    colnames(data) <- c("year","High school graduate or less","Some college","Bachelor's degree or more","Bachelor's degree, no graduate degre","Graduate degree")
  }else if(input$filter2=="race"){
    data <- data %>% select(year,8:10)
    colnames(data) <- c("year","Non-Hispanic white","Black or African-American","Hispanic of any race")
  }else{
    data <- data %>% select(year,11:16)
    colnames(data) <- c("year","New England","Mid-Atlantic","Midwest","South","Mountain West","Pacific")
  }
  data <- melt(data,id="year")
  data <- as_tibble(data)
  ggplot(data, aes(variable,1 - value,fill=variable)) +
    geom_bar(stat= 'identity', position = 'dodge',show.legend = FALSE) +
    theme(axis.text.x = element_text(angle = 45, hjust = 0.5, vjust = 0.5)) +
    labs(title = 'Year: {frame_time}', x = input$filter2, y = 'Marriage rate') +
    transition_time(year) +
    ease_aes('linear')
  #anim_save(paste0(input$select_1,"_",age,".gif"))
}