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

#### X1: Temperature in Kitchen Area, in Celsius

![Graph-1](/Images/T1X1.png)

Based on the above histogram and density plot of kitchen area temperature, it is visible that the data is slightly right skewed with long tail to higher temperatures though three to four peaks are noticeable as well. For this variable, mean and median are 18.51 and 18.33 respectively hence mean > median clarifies that data is slightly right skewed as there is no major difference. Pearson skewness score is 0.285813 hence data is positively skewed. As per scatter plot diagram, we can denote that kitchen area temperature has positive correlation with energy consumption hence increase in temperature shows increase in energy consumption as well.

#### X2: Humidity in Kitchen Area, in Percentage

![Graph-2](/Images/T1X2.png)

Based on the above histogram and density plot of humidity in kitchen area, it is slightly right skewed though majority of the distribution seem to follow bell shaped curve. Mean and median are 39.18 and 38.76 respectively that denotes data is rightly skewed though there is no huge difference. Pearson skewness score is 0.2376266 hence it is positively skewed. The scatter plot diagram denotes that the kitchen area humidity has low positive correlation with energy consumption.

#### X3: Temperature outside Weather Station, in Celsius

Based on the histogram and density plot of temperature outside weather station below, it is noticeable that the distribution has a peak though data around the peak is not normally or evenly distributed. Mean and median are 3.0115 and 3.1407 respectively hence data seem to have slightly left skewness. Pearson skewness score is -0.2832601 that shows the data is negatively skewed. The scatter plot shows the high positive correlation between both the variables. It is visible in histogram that data has some negative values.

![Graph-3](/Images/T1X3.png)

#### X4: Humidity outside from Weather Station, in Percentage

![Graph-4](/Images/T1X4.png)

Based on the histogram and density diagram above, it is noticeable that data is slightly left skewed with long tail. Mean and median are 82.17 and 82.56 respectively hence mean < median that shows negative skewness. Pearson skewness score is -0.1438816 that denotes data is slightly negatively skewed. The scatter plot shows that there is no correlation between these variables as there is no change in energy consumption with the change in Humidity.

#### X5: Visibility from Weather Station, in km

![Graph-5](/Images/T1X5.png)

Based on the histogram and density diagram above, it is noticeable that the data is unimodal however majority for the distribution is on the left side of the peak hence based on Pearson Skewness score which is -0.6606924, data is negatively skewed. Mean and median are 33.87 and 35.60 respectively and slightly positive correlation is visible.

#### Y: Energy use of Appliances, in Wh

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

After the transformation applied, data were normalized using formula: (Data Column – minimum (Data Column)) / (maximum (Data Column) – minimum (Data Column))

#### Summary of the variables after the transformations and normalization:

![Graph-8](/Images/T2Summ.png)

Only X1, X2, X3, X4 and Y will be used in further analysis.

For Pearson Skewness Calculation alternate formula has been used: Formula: (3 * (Mean (Data Column) – Median (Data Column))) / (standard deviation (Data Column))

## Task 3: Model Building and Importance of Each Variable

#### Table 1: Summary - Error Measures and Correlation Coefficients
![Graph-9](/Images/T3T1.png)

#### Table 2: Summary - Weights and Parameters
![Graph-10](/Images/T3T2.png)

As per the table 1, it is clearly visible that Choquet performs the best in the given scenario comparted to other fitting functions. Choquet has the lowest error measure values for Root Mean Square Error as well as Average Absolute Error though model is least accurate with Weighted Power Mean where p=0.5. OWA seems to perform better than WAM and WPM functions though there is noticeable difference between Choquet accuracy and OWA. Pearson and Spearman correlation values are far better with Choquet fitting compared to other functions though it shows significant difference where other functions have Correlation below 0.5, Choquet function has Pearson and Spearman correlation values greater than 0.5 that shows high positive relationship.

As per the table 2, it is noticeable that all the fitting functions assign different weights to different attributes however if we compare our scatter plot diagrams (from task 1) to this weights assigned, Choquet function seem to be doing better job applying respected weights to attributes as X3 has high positive regression with Y hence logically it should be given higher weights and following it X1 should receive the second highest weight. Compared to this, other fitting functions doesn’t seem to provide sensible outputs/weights to attributes.

X3 and X1 covers more than 70 percent of weightage according to Choquet function. As per the Choquet fuzzy measures below, we can say that there are nearly 4 measures with value as 1.

As per the fuzzy measures collected with Choquet function,
X1 and X2 are additive however relationship with other variable relations such as X1 to X3, X1 to X4, X2 to X3, X2 to X4 and X3 to X4 are somewhat redundant.
Orness score for Choquet and OWA is 0.753750530061303 and 0.678134436983788 respectively hence our model favours the higher inputs as both the scores are higher than 0.5.

![Graph-11](/Images/T3CFM.png)

## Task 4: Model Prediction
In this task:
- Using best fitting model, prediction of the Energy usage of appliances for the input X1=18; X2=44; X3=4; X4=74.8; X5=31.4. [(R Program)](/Program/Program.R)
- Best conditions for a low energy usage of appliances will occur.


For the considered data, model seems to perform the best with Choquet compared to other fitting functions hence Choquet function has been used for the further analysis.

After considering the given input, appropriate transformation and normalization were applied hence received normalized output is 0.4809877. After undoing normalization and transformations, the final Energy Consumption is 51.48105.

Considering “Kitchen Area Temperature VS Energy Consumption” and “Temperature outside Weather Station VS Energy Consumption” scatter plot diagrams, Y is approximately 60 for X1 = 18 and Y is approximately 75 for X3 = 4 hence 75 + 60 = 135 though as discussed in Task 3 that X1 and X3 seems to have more than 70 of weightage of distribution hence (135/2) * 0.7 = 47.25. This denotes that theoretically based on X1 and X3 our Energy consumption should be around 47.25 and our predicted output is approximately 51.5 Wh. Hence, model performance seems reasonable. 

As per the scatter plot diagrams and weightages received, we can say that X4 does not have noticeable relation with energy consumption though X1, X2 and X3 seem to have positive relation with the energy consumption hence increase in the values of these variables will affect and increase the Energy consumptions. To get a low energy usage of appliances, temperature in the kitchen area (recommended to have less than 16) and outside weather station (recommended to have less than 2) should be least as possible and kitchen area humidity (recommended to have less than 35) should be low as well.

