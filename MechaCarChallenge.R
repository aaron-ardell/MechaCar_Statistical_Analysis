# Linear Regression to Predict MPG
# Loading the dplyr library.
library(dplyr)
# Reading the csv into a dataframe.
mechacarmpg_table <- read.csv(file='C:/Users/aaron/Desktop/Analysis_Projects/Week_16_R/MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
# Review loaded dataframe.
head(mechacarmpg_table)
# Multiple Linear Regression.
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacarmpg_table)
# Find the r-squared and p-value.
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacarmpg_table))

# Create Visualizations for the Trip Analysis.
# Reading the csv file into dataframe.
suspensioncoil_table <- read.csv(file='C:/Users/aaron/Desktop/Analysis_Projects/Week_16_R/Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
# Check dataframe.
head(suspensioncoil_table)
# Summarize to get mean, median, variance and standard.
total_summary <- suspensioncoil_table %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))
# Creating summaries for each lot.
lot_summary <- suspensioncoil_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep')

# Creating T-Test on Suspension Coils.
t.test(suspensioncoil_table$PSI, mu=1500)
#Using subset function, testing for each lot.
t.test(subset(suspensioncoil_table,Manufacturing_Lot=="Lot1")$PSI, mu=1500)
t.test(subset(suspensioncoil_table,Manufacturing_Lot=="Lot2")$PSI, mu=1500)
t.test(subset(suspensioncoil_table,Manufacturing_Lot=="Lot3")$PSI, mu=1500)
