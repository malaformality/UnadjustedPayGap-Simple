

# 10/11/2019
# Pay Gap Analysis

library(RODBC)
library(tidyverse)
library(lubridate)
dbhandle <- odbcDriverConnect('driver={SQL Server};server=fakeserver;database=fakedatabse;trusted_connection=true')


data <- sqlQuery(dbhandle, 
"SELECT <all the important details here>
FROM fakedetailtable
WHERE IsActive = 'active'")

# Unadjusted pay gap - Gender
unadj_gender_gap <- data %>%
  filter(TypeofEmployee == "The Type",
         OtherDetail == "important thing") %>%
  group_by(Gender) %>%
  summarise(salary = median(HourlyWage)) 

unadj_gender_gap$salary[unadj_gender_gap$Gender == 'female'] / unadj_gender_gap$salary[unadj_gender_gap$Gender == 'male']



unadj_race_gap <- data %>%
  filter(TypeofEmployee == "The Type") %>%
  group_by(Race) %>%
  summarise(salary = median(AnnualWage)) 

unadj_race_gap$salary[unadj_race_gap$Race == 'American Indian'] / unadj_race_gap$salary[unadj_race_gap$Race == 'White']
unadj_race_gap$salary[unadj_race_gap$Race == 'Asian'] / unadj_race_gap$salary[unadj_race_gap$Race == 'White']
unadj_race_gap$salary[unadj_race_gap$Race == 'Black/African American'] / unadj_race_gap$salary[unadj_race_gap$Race == 'White']
unadj_race_gap$salary[unadj_race_gap$Race == 'Hispanic/Latino'] / unadj_race_gap$salary[unadj_race_gap$Race == 'White']
unadj_race_gap$salary[unadj_race_gap$Race == 'Native Hawaiian/Pacific Island'] / unadj_race_gap$salary[unadj_race_gap$Race == 'White']
unadj_race_gap$salary[unadj_race_gap$Race == 'Not Specified'] / unadj_race_gap$salary[unadj_race_gap$Race == 'White']
