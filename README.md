# Energy Usage Analysis and Prediction with [R](/Program/Program.R)
A Case study to analyse and predict the conditions where low energy consumptions by appliances will occur.

## Energy Prediction of Domestic Appliances Dataset (/Data/) 
The given dataset, "Energy19.txt", can be used to create models of energy use of appliances in a energy-efficient house. The dataset provides the Energy use of appliances (denoted as Y) using 671 samples. It is a modified version of data used in the study [1]. The dataset includes 5 variables, denoted as X1, X2, X3, X4, X5, and Y, described as follows:

X1: Temperature in kitchen area, in Celsius
X2: Humidity in kitchen area, given as a percentage
X3: Temperature outside (from weather station), in Celsius
X4: Humidity outside (from weather station), given as a percentage
X5: Visibility (from weather station), in km
Y: Energy use of appliances, in Wh

## Task 1:
### Histograms, scatterplots and summary tables for the given variables are as below:

X1: Temperature in Kitchen Area, in Celsius

![Graph-1](/Images/T1X1.png)

Based on the above histogram and density plot of kitchen area temperature, it is visible that the data is slightly right skewed with long tail to higher temperatures though three to four peaks are noticeable as well. For this variable, mean and median are 18.51 and 18.33 respectively hence mean > median clarifies that data is slightly right skewed as there is no major difference. Pearson skewness score is 0.285813 hence data is positively skewed. As per scatter plot diagram, we can denote that kitchen area temperature has positive correlation with energy consumption hence increase in temperature shows increase in energy consumption as well.