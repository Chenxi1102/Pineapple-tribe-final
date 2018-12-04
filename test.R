library(ggplot2)
library(dplyr)
setwd("../Desktop/UWE/INFO201/pineapple-tribe-final/")

both_sexes <- read.csv("marriage/both_sexes.csv")

#if(!require(devtools)) install.packages("devtools")
#devtools::install_github("dgrtwo/gganimate")
#install.packages("installr")
#installr::install.ImageMagick("http://www.imagemagick.org/script/download.php")


gifdata <- both_sexes %>% select(year,NE_2534, MA_2534, Midwest_2534, South_2534, Mountain_2534, Pacific_2534)
gifdata <- melt(gifdata,id="year") %>% as_tibble()
g <- ggplot(gifdata, aes(variable,value), size = pop, color = continent, frame = year) +
  
  geom_point() +
  
  scale_x_log10()


library(gganimate)

gganimate(g, 'output1.gif')
temp.gapminder
temp.gapminder = gapminder
select.country = c(as.character(head(temp.gapminder$country[temp.gapminder$year==2007][order(temp.gapminder$pop[temp.gapminder$year==2007],decreasing = TRUE)],8)))
temp.gapminder = temp.gapminder[temp.gapminder$country %in% select.country,]
temp.gapminder$country = factor(temp.gapminder$country, order = TRUE, levels = select.country)
p = ggplot(temp.gapminder, aes(country, lifeExp, fill=country)) +
  +     geom_bar(stat= 'identity', position = 'dodge',show.legend = FALSE) +
  +     theme(axis.text.x = element_text(angle = 45, hjust = 0.5, vjust = 0.5)) +
  +     # Here comes the gganimate specific bits
  +     labs(title = 'Year: {frame_time}', x = 'country', y = 'life expectancy') +
  +     transition_time(year) +
  +     ease_aes('linear')