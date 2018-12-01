library(shiny)


shinyServer(function(input, output) {
  both <- read.csv("marriage/both_sexes.csv",stringsAsFactors = FALSE)
  men <- read.csv("marriage/men.csv",stringsAsFactors = FALSE)
  women <- read.csv("marriage/women.csv",stringsAsFactors = FALSE)
  divorce <- read.csv("marriage/divorce.csv",stringsAsFactors = FALSE)
  
})
