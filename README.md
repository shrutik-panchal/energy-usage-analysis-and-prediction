# Energy Usage Analysis and Prediction with [R](/Program/Program.R)
A Case study to analyse and predict the conditions where low energy consumptions by appliances will occur.

## Energy Prediction of Domestic Appliances [Dataset](/Data/) 
The given dataset, "Energy19.txt", can be used to create models of energy use of appliances in a energy-efficient house. The dataset provides the Energy use of appliances (denoted as Y) using 671 samples. It is a modified version of data used in the study [1]. The dataset includes 5 variables, denoted as X1, X2, X3, X4, X5, and Y, described as follows:

X1: Temperature in kitchen area, in Celsius
X2: Humidity in kitchen area, given as a percentage
X3: Temperature outside (from weather station), in Celsius
X4: Humidity outside (from weather station), given as a percentage
X5: Visibility (from weather station), in km
Y: Energy use of appliances, in Wh

## Task 1: Histograms, scatterplots and summary tables for the given variables in the given dataset

X1: Temperature in Kitchen Area, in Celsius

![Graph-1](/Images/T1X1.png)

Based on the above histogram and density plot of kitchen area temperature, it is visible that the data is slightly right skewed with long tail to higher temperatures though three to four peaks are noticeable as well. For this variable, mean and median are 18.51 and 18.33 respectively hence mean > median clarifies that data is slightly right skewed as there is no major difference. Pearson skewness score is 0.285813 hence data is positively skewed. As per scatter plot diagram, we can denote that kitchen area temperature has positive correlation with energy consumption hence increase in temperature shows increase in energy consumption as well.

X2: Humidity in Kitchen Area, in Percentage

![Graph-2](/Images/T1X2.png)

Based on the above histogram and density plot of humidity in kitchen area, it is slightly right skewed though majority of the distribution seem to follow bell shaped curve. Mean and median are 39.18 and 38.76 respectively that denotes data is rightly skewed though there is no huge difference. Pearson skewness score is 0.2376266 hence it is positively skewed. The scatter plot diagram denotes that the kitchen area humidity has low positive correlation with energy consumption.

X3: Temperature outside Weather Station, in Celsius

Based on the histogram and density plot of temperature outside weather station below, it is noticeable that the distribution has a peak though data around the peak is not normally or evenly distributed. Mean and median are 3.0115 and 3.1407 respectively hence data seem to have slightly left skewness. Pearson skewness score is -0.2832601 that shows the data is negatively skewed. The scatter plot shows the high positive correlation between both the variables. It is visible in histogram that data has some negative values.

![Graph-3](/Images/T1X3.png)

X4: Humidity outside from Weather Station, in Percentage

![Graph-4](/Images/T1X4.png)

Based on the histogram and density diagram above, it is noticeable that data is slightly left skewed with long tail. Mean and median are 82.17 and 82.56 respectively hence mean < median that shows negative skewness. Pearson skewness score is -0.1438816 that denotes data is slightly negatively skewed. The scatter plot shows that there is no correlation between these variables as there is no change in energy consumption with the change in Humidity.

X5: Visibility from Weather Station, in km

![Graph-5](/Images/T1X5.png)

Based on the histogram and density diagram above, it is noticeable that the data is unimodal however majority for the distribution is on the left side of the peak hence based on Pearson Skewness score which is -0.6606924, data is negatively skewed. Mean and median are 33.87 and 35.60 respectively and slightly positive correlation is visible.

Y: Energy use of Appliances, in Wh

![Graph-6](/Images/T1Y.png)

Based on the histogram and density diagram above, it is visible that the data is right skewed with long tail and Pearson Skewness score is 1.27098 hence data is positively skewed. Mean and median are 64.8 and 50.0 respectively.

#### Summary of the variables:

![Graph-7](/Images/T1Summ.png)


## Task 2: Data transformation

Here, transformations are applied to all the variables however X1, X2, X3 and X4 will be used with Variable Y for the further analysis.

Variable X1: As data is slightly right skewed, Log transformation has been used.
Variable X2: As data is slightly right skewed, Log transformation has been used.
Variable X3: There are negative values in data hence rescaled them using “value + 1 – minimum (column)” then applied power transformation with power 1.5 (getting as close as possible to normal distribution).
Variable X4: As data is slightly left skewed, Power transformation has been used with power 2 (Square Transformation).
Variable X5: As data is negatively skewed, Power Transformation has been used with power 3 (Cube Transformation).
Variable Y: As data has high right skewness, first log transformation has been used and later, power transformation with power 0.001 (as there was no any significant difference by decreasing the value more) has been applied.

After the transformation applied, data were normalized using formula: 
(Data Column – minimum (Data Column)) / (maximum (Data Column) – minimum (Data Column))

Summary of the variables after the transformations and normalization:

![Graph-8](/Images/T2Summ.png)

Only X1, X2, X3, X4 and Y will be used in further analysis.
For Pearson Skewness Calculation following alternate formula has been used:
Formula: (3 * (Mean (Data Column) – Median (Data Column))) / (standard deviation (Data Column))



