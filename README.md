# MechaCar_Statistical_Analysis
## Overview of Project

AutosRUs’ newest prototype, the MechaCar, is suffering from production troubles that are blocking the manufacturing team’s progress. AutosRUs’ upper management has called on our data analytics team to review the production data for insights that may help the manufacturing team.

In this task we'll be required to the achieve the following goals:

- Perform multiple linear regression analysis to identify which variables in the dataset predict the mpg of MechaCar prototypes.
- Collect summary statistics on the pounds per square inch (PSI) of the suspension coils from the manufacturing lots.
- Run t-tests to determine if the manufacturing lots are statistically different from the mean population.
- Design a statistical study to compare vehicle performance of the MechaCar vehicles against vehicles from other manufacturers. 

For the purposes of this analysis, we've been provided with two .csv files: "MechaCar_mpg.csv" and and "Suspension_Coil.csv".

## Linear Regression to Predict MPG

The MechaCar_mpg.csv dataset contains test results for 50 prototype MechaCars. Multiple metrics, such as vehicle length, vehicle weight, spoiler angle, drivetrain, and ground clearance, were collected for each vehicle. We'll utilize this information to create a linear regression to predict each prototypes mpg based on the metrics provided in the .csv file.

For starters we'll read the csv file and create a dataframe.

![This is an image](https://github.com/aaron-ardell/MechaCar_Statistical_Analysis/blob/main/mpg_table.png)

Next, we'll create the linerar regression model with the following code in our Rscript file:

```
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacarmpg_table)
```

Delivering the following results:

![This is an image](https://github.com/aaron-ardell/MechaCar_Statistical_Analysis/blob/main/mpg_lm.png)

**mpg = (6.267)vehicle_length + (1.245)vehicle_weight + (6.877)spoiler_angle + (3.546)ground_clearance + (-3.411)AWD + (-1.040)**

Finally, we'll pull a summary() function to check the r-squared and p-values.

```
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacarmpg_table))
```

![This is an image](https://github.com/aaron-ardell/MechaCar_Statistical_Analysis/blob/main/mpg_summary.png)

Producing the following results:

**R-squared: 0.7149**

**P-value: 5.35**

From these results, we can make the following observations:
- Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?
- Is the slope of the linear model considered to be zero? Why or why not?
- Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?

## Summary Statistics on Suspension Coils

The MechaCar Suspension_Coil.csv dataset contains the results from multiple production lots. In this dataset, the weight capacities of multiple suspension coils were tested to determine if the manufacturing process is consistent across production lots. 

First, we'll upload the suspension coil data into a table.

![This is an image](https://github.com/aaron-ardell/MechaCar_Statistical_Analysis/blob/main/suspensioncoil_table.png)

Next, we'll create a summary for the entire dataset listing the mean, median, variance and standard deviation.

```
total_summary <- suspensioncoil_table %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))
```

![This is an image](https://github.com/aaron-ardell/MechaCar_Statistical_Analysis/blob/main/total_summary.png)

Finally, we'll divide the results between the three lots to test for variance between them.

```
lot_summary <- suspensioncoil_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep')
```

![This is an image](https://github.com/aaron-ardell/MechaCar_Statistical_Analysis/blob/main/lot_summary.png)

The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils **must not exceed 100 pounds per square inch**. Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? 



## T-Tests on Suspension Coils



![This is an image](https://github.com/aaron-ardell/MechaCar_Statistical_Analysis/blob/main/ttest.png)

![This is an image](https://github.com/aaron-ardell/MechaCar_Statistical_Analysis/blob/main/lot1_ttest.png)

![This is an image](https://github.com/aaron-ardell/MechaCar_Statistical_Analysis/blob/main/lot2_ttest.png)

![This is an image](https://github.com/aaron-ardell/MechaCar_Statistical_Analysis/blob/main/lot3_ttest.png)

## Study Design: MechaCar vs Competition









