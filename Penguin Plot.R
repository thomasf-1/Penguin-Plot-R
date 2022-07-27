library(tidyverse)
library(ggplot2)
library(glue)                 #loading packages and data set
library(palmerpenguins)


head(penguins, 10) #preview of data set


#function to enter in the species of penguin (Adelie, Chinstrap, Gentoo)
penguinplot <- function(species) {
  penguins %>%
    filter(.data$species == .env$species) %>% 
    ggplot() +
    aes(x = flipper_length_mm, y = body_mass_g, color= sex) +
    geom_point() +
    ggtitle(glue("Species: {species}")) +
    xlab("Flipper Length (mm)") +
    ylab("Body mass (g)") +
    theme(plot.title.position = "plot") +
    geom_smooth(method = "lm", se=FALSE, color="black", formula = y ~ x) +
    geom_point()
}

penguinplot("Adelie") 
penguinplot("Chinstrap") 
penguinplot("Gentoo")





