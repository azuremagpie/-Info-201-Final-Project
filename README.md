## -Info-201-Final-Project

# Project Description: 


- The dataset is the data of the number of and percent of people in poverty across all US states, from 2014 - 2016. 

  - Background on the data collector: The data was collected by the US Census Bureau. To quote the US Census website: "The United States Census Bureau is a principal agency of the U.S. Federal Statistical System, responsible for producing data about the American people and economy."
  
  - Brief background information about the dataset: The US Census included poverty data collected via both the _Official Poverty Measure (Official)_ and the _Supplemental Poverty Measure (SPM)_. The SPM was created due to criticisms of the Official Poverty Measure, with its shortcomings in measuring poverty level. Some key strengths of the SPM over the Official: it takes into account a person's cash income and non-cash benefits, and the amount of money a person spends on living expenditures (food, shelter, utilities) in each states.

- The dataset was taken from the US Census Bureau report: The Supplemental Poverty Measure 2016. 

- Target audience: The general public who may or maynot be familiar with different poverty measurements.

- Specific questions to be answered by the dataset:
  1. How is poverty level for each state different when using the Official Poverty Measure (Official), versus using the Supplemental Poverty Measure (SPM)?
  
  2. With the SPM, which state has the highest poverty level? Which state has the lowest?
  
  3. With the Official, which state has the highest poverty level? Which state has the lowest?
  
  4. Do both the Official and the SPM generally agree on which states have higher poverty than the national average?
  
  5. How many states have poverty level above national average?
  
  6. How many states have poverty level below national average?
  
  7. Which states have poverty level measurements that are surprising? 
  
  8. What other datasets could be used to further explore other factors that are
  influencing the differences in poverty levels?
  

# Technical Description

**Getting dataset:** I extracted the dataset from the report using the PDFTables tool, then convert it to .csv format. After a few simple data cleaning, the dataset can be read into R.

**Data cleaning:** Renaming columns so every column has its name, and which columns are numeric data for the Official, and which are for the SPM. A few special characters included in the dataset will also by removed, so the data will be pure numbers.

**Data wrangling:** The dataset will be split into 2 subdataset, one for the Offical and one for the SPM.   The main goal of data wrangling is to find out 

**New libraries used for this project:** Plotly to make interactive choropleth map.

**Anticipated major challenges:** 
- Removing the special characters from the dataset might be challenging. 
- Making the interactive map for the dataset. 
- Since the csv file is not laid out such that we can instantly start data wrangling, we will need to first split up both datasets, select the columns which we will need, and rename the columns according to what will work best for us.



