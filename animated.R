animated <- function(both, input) {
  if (input$age2 == "1") {
    both <- both %>% select(year, all_2534:rich_2534)
  } else if (input$age2 == "2") {
    both <- both %>% select(year, all_3544:rich_3544)
  } else {
    both <- both %>% select(year, all_4554:rich_4554)
  }
  if (input$filter2 == "education") {
    both <- both %>% select(year, 3:7)
    colnames(both) <- c("year", "High school graduate or less", "Some college", "Bachelor's degree or more", "Bachelor's degree, no graduate degre", "Graduate degree")
  } else if (input$filter2 == "race") {
    both <- both %>% select(year, 8:10)
    colnames(both) <- c("year", "Non-Hispanic white", "Black or African-American", "Hispanic of any race")
  } else {
    both <- both %>% select(year, 11:16)
    colnames(both) <- c("year", "New England", "Mid-Atlantic", "Midwest", "South", "Mountain West", "Pacific")
  }
  both <- melt(both, id = "year") %>% as_tibble()
  p <- ggplot(both, aes(variable, 1 - value, fill = variable)) +
    geom_bar(stat = "identity", position = "dodge", show.legend = FALSE) +
    theme(axis.text.x = element_text(angle = 45, hjust = 0.5, vjust = 0.5)) +
    labs(title = "Year: {frame_time}", x = input$filter2, y = "Marriage rate") +
    transition_time(year) +
    ease_aes("linear")
  animete_p <- animate(p)
  save_animation(anime, paste0(input$filter2, "_", input$age2, ".gif"))
}