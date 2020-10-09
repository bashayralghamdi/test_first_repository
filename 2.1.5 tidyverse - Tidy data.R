# 2.1.5 tidyverse - Tidy data
# Misk Academy Data Science Immersive, 2020

library(tidyverse)
library(dplyr)
library(tidyr)
# Get a play data set:
PlayData <- read_tsv("Data/PlayData.txt")

# Let's see the scenarios we discussed in class:
# Scenario 1: Transformation across height & width

PlayData %>%
  mutate(ratio= width/height)



# For the other scenarios, tidy data would be a 
# better starting point: 
# Specify the ID variables (i.e. Exclude them)
PlayData %>%
  pivot_longer(-c(type, time),  
               names_to = "key")->PlayData_t
PlayData_t


# Now try the same thing but specify the MEASURE variables (i.e. Include them)

pivot_longer(PlayData, c(height, width),names_to = "key")


# Scenario 2: Transformation across time 1 & 2 (group by type & key)
# Difference from time 1 to time 2 for each type and key (time2 - time1)
# we only want one value as output
PlayData_t %>%
  group_by(type, key) %>%
  summarise(timediff = value[time == 2] - value[time == 1])

PlayData_t


# As another example: standardize to time 1 i.e time2/time1

PlayData_t %>%
  group_by(type,key)%>%
  summarise(rel_inc = value[time == 2] / value[time == 1])


# Keep all values
#use mutate()



# Scenario 3: Transformation across type A & B
# Ratio of A/B for each time and key
PlayData_t %>%
  group_by(key, time)%>%
  summarise(type_ratio = value[type=="A"]/value[type =="B"])





#############

PlantGrowth%>%
  spread(group, weight)%>%
  pivot_wider(names_from = group, values_from = weight)
glimpse(PlantGrowth)

spread(PlantGrowth, group, weight)->PlantGrowth_1

pivot_wider(PlantGrowth, names_from = group, values_from = weight)->PlantGrowth_1

typeof(PlantGrowth_1)
class(PlantGrowth_1)
as.matrix(PlantGrowth_1)
glimpse(PlantGrowth_1)
PlantGrowth_1$ctrl
PlantGrowth_1$trt1
PlantGrowth_1$trt2

############
