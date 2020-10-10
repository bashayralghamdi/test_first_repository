# 2.1.6 tidyverse - Grammar of Data Analysis
# Misk Academy Data Science Immersive, 2020

# Using the tidy PlayData dataframe, try to compute an aggregation function 
# according to the three scenarios, e.g. the mean of the value.

# Load packages
library(tidyverse)

# Get a play data set:
PlayData <- read_tsv("Data/PlayData.txt")

PlayData

# Scenario 1: Aggregation across height & width
PlayData %>% 
  summarise(mean_height=mean(height),
            mean_width=mean(width))

# Scenario 2: Aggregation across time 1 & time 2
PlayData %>%
  group_by(time) %>% 
  summarise(mean_height=mean(height),
            mean_width=mean(width))

# Scenario 3: Aggregation across type A & type B
PlayData %>%
  group_by(type) %>% 
  summarise(mean_height=mean(height),
            mean_width=mean(width))

