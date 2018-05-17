library(dplyr)
library(stringr)
#Convert csv to a usable dataframe
spm_2016 <- read.csv("../data/spm_2016.csv", stringsAsFactors = F)
spm_2016 <- data.frame(spm_2016)
state <- as.vector(unlist(spm_2016[1]))
new_spm_2016 <- spm_2016 %>% 
  mutate(state) %>% 
  select(State = state, everything(), -State)