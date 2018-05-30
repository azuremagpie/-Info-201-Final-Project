library(dplyr)
library(stringr)
library(plotly)

#Convert csv to a usable dataframe
spm_2016 <- read.csv("../data/spm_2016.csv", stringsAsFactors = F)
spm_2016 <- data.frame(spm_2016)
state <- as.vector(unlist(spm_2016[1]))
new_spm_2016 <- spm_2016 %>% 
  mutate(state) %>% 
  select(State = state, everything(), -State)

percent_estimate <- new_spm_2016 %>% 
  select(State, Official.Percent.Estimate, SPM.Percent.Estimate) %>% 
  mutate(Percent.Estimate.Diff = SPM.Percent.Estimate - Official.Percent.Estimate)

#Working with the Official Measurement (Official) percentages:
#Find which states have poverty level higher than the national average
#via the Official Measurement. Calculate the proportion of those states
#over all states.
Official_national_average <- percent_estimate[percent_estimate$State == 
                                                "United States", 2]

Official_above_nation_average <- percent_estimate %>% 
  filter(Official.Percent.Estimate > Official_national_average) %>% 
  select(State, Official.Percent.Estimate) %>% 
  arrange(desc(Official.Percent.Estimate))

Official_percent_states_above_average <- 
          round((nrow(Official_above_nation_average) / nrow(percent_estimate) * 100),
                digits = 1)

#Working with the Supplemental Measurement (SPM) percentages:
#Find which states have poverty level higher than the national average
#via the Official Measurement. Calculate the proportion of those states
#over all states.
SPM_national_average <- percent_estimate[percent_estimate$State == 
                                                "United States", 3]

SPM_above_nation_average <- percent_estimate %>% 
  filter(SPM.Percent.Estimate > SPM_national_average) %>% 
  select(State, SPM.Percent.Estimate) %>% 
  arrange(desc(SPM.Percent.Estimate))

SPM_percent_states_above_average <- 
  round((nrow(SPM_above_nation_average) / nrow(percent_estimate) * 100),
        digits = 1)

#Official: Top 5 states in poverty
Official_top_five <- Official_above_nation_average[1:5, ]
colnames(Official_top_five)[2] <- "Percent Estimate"
#SPM: Top 5 states in poverty
SPM_top_five <- SPM_above_nation_average[1:5, ]
colnames(SPM_top_five)[2] <- "Percent Estimate"

#change column names of the two datasets
colnames(SPM_above_nation_average)[2] <- "Percent Estimate"
colnames(Official_above_nation_average)[2] <- "Percent Estimate"

#Create another dataframe for reactive output later
state_all_measures <- percent_estimate %>% 
  select(State, Official.Percent.Estimate, SPM.Percent.Estimate)
colnames(state_all_measures)[2] <- "Official Percent Estimate"
colnames(state_all_measures)[3] <- "SPM Percent Estimate"

#Test out the histogram for the SPM_top_five table
# title <- "Supplemental"
# ggplot(data = SPM_top_five,
#        aes(x = State, y = `Percent Estimate` )) +
#   geom_bar(stat = "identity", fill = "pink") +
#   xlab("States") +
#   ylab("Percent Estimate")+
#   ggtitle(paste0("blabla", title)) +
#   geom_text(aes(label=`Percent Estimate`))
