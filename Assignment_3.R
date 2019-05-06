#------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------
# Real World Analytics - Assignment 3
#------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------
library(ggplot2)
library(plotly)
library(ggpubr)
#------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------
### Part-1
#------------------------------------------------------------------------------------
# Reading data as Matrix
energy19.originalData <- as.matrix(read.table("Energy19.txt"))
#------------------------------------------------------------------------------------

# Random generation of 300 samples from the data
energy19.subset <- energy19.originalData[sample(1:671, 300), c(1:6)]
#------------------------------------------------------------------------------------
# Saving Subset data for later use if required
# write.table(energy19.subset,"shrutik-subset.txt")
# Reading Subset data if needed
# energy19.subset <- as.matrix(read.table("shrutik-subset.txt"))
#------------------------------------------------------------------------------------

# Histograms and Density Plots

# X1
HistX1 <- plot_ly(x = energy19.subset[,1], type = "histogram") %>%
  layout(title = "Distribution of Kitchen Area Temperature",
         xaxis = list(title = "Temperature (in Celsius)"))
HistX1

ggdensity(energy19.subset[,1], 
          main = "Density plot of Kitchen Area Temperature",
          xlab = "Temperature (in Celsius)")


# X2
HistX2 <- plot_ly(x = energy19.subset[,2], type = "histogram") %>%
  layout(title = "Distribution of Kitchen Area Humidity",
         xaxis = list(title = "Humidity (in Percentage)"))
HistX2

ggdensity(energy19.subset[,2], 
          main = "Density plot of Kitchen Area Humidity",
          xlab = "Humidity (in Percentage)")


# X3
HistX3 <- plot_ly(x = energy19.subset[,3], type = "histogram") %>%
  layout(title = "Distribution of Temperature outside Weather Station",
         xaxis = list(title = "Temperature (in Celsius)"))
HistX3

ggdensity(energy19.subset[,3], 
          main = "Density plot of Temperature outside Weather Station",
          xlab = "Temperature (in Celsius)")


# X4
HistX4 <- plot_ly(x = energy19.subset[,4], type = "histogram") %>%
  layout(title = "Distribution of Humidity outside Weather Station",
         xaxis = list(title = "Humidity (in Percentage)"))
HistX4

ggdensity(energy19.subset[,4], 
          main = "Density plot of Humidity outside Weather Station",
          xlab = "Humidity (in Percentage)")


# X5
HistX5 <- plot_ly(x = energy19.subset[,5], type = "histogram") %>%
  layout(title = "Distribution of Visibility from Weather Station",
         xaxis = list(title = "Visibility (in KMs)"))
HistX5

ggdensity(energy19.subset[,5], 
          main = "Density plot of Visibility from Weather Station",
          xlab = "Visibility (in KMs)")


# Y
HistY <- plot_ly(x = energy19.subset[,6], type = "histogram") %>%
  layout(title = "Distribution of Energy Cunsumption by Appliances",
         xaxis = list(title = "Energy Consumption (in Wh)"))
HistY

ggdensity(energy19.subset[,6], 
          main = "Density plot of Energy Cunsumption by Appliances",
          xlab = "Energy Consumption (in Wh)")


# Scatter Plot

# X1 vs Y
plot(x = energy19.subset[,1], y = energy19.subset[,6], 
     main = "Kitchen Area Temperature VS Energy Consumption", col = "red",
     xlab = "Temperature (in Celsius)", ylab = "Energy Consumption (in Wh)" , pch = 19)
abline(lm(energy19.subset[,6] ~ energy19.subset[,1]), col = "blue")

# X2 vs Y
plot(x = energy19.subset[,2], y = energy19.subset[,6], 
     main = "Kitchen Area Humidity VS Energy Consumption", col = "red",
     xlab = "Humidity (in Percentage)", ylab = "Energy Consumption (in Wh)" , pch = 19)
abline(lm(energy19.subset[,6] ~ energy19.subset[,2]), col = "blue")

# X3 vs Y
plot(x = energy19.subset[,3], y = energy19.subset[,6], 
     main = "Temperature outside Weather Station VS Energy Consumption", col = "red",
     xlab = "Temperature (in Celsius)", ylab = "Energy Consumption (in Wh)" , pch = 19)
abline(lm(energy19.subset[,6] ~ energy19.subset[,3]), col = "blue")

# X4 vs Y
plot(x = energy19.subset[,4], y = energy19.subset[,6], 
     main = "Humidity outside Weather Station VS Energy Consumption", col = "red",
     xlab = "Humidity (in Percentage)", ylab = "Energy Consumption (in Wh)" , pch = 19)
abline(lm(energy19.subset[,6] ~ energy19.subset[,4]), col = "blue")

# X5 vs Y
plot(x = energy19.subset[,5], y = energy19.subset[,6], 
     main = "Visibility from Weather Station VS Energy Consumption", col = "red",
     xlab = "Visibility (in KMs)", ylab = "Energy Consumption (in Wh)" , pch = 19)
abline(lm(energy19.subset[,6] ~ energy19.subset[,5]), col = "blue")


#------------------------------------------------------------------------------------
# Dataset Summary
summary(energy19.subset)
# Checking Skewness - Pearson Skewness with Alternate formula based on Mean, Median and SD
for (i in c(1:6)){
  print((3*(mean(energy19.subset[,i])-median(energy19.subset[,i])))
        / sd(energy19.subset[,i]))
}
#------------------------------------------------------------------------------------
### Part-2
#------------------------------------------------------------------------------------

### Transformations
energy19.Tsubset = energy19.subset
# X1
energy19.Tsubset[,1] = log(energy19.subset[,1])
# X2
energy19.Tsubset[,2] = log(energy19.subset[,2])
# X3
energy19.Tsubset[,3] = (energy19.subset[,3] + 1 - min(energy19.subset[,3]))**(1.5)
# X4
energy19.Tsubset[,4] = (energy19.subset[,4])**(2)
# X5
energy19.Tsubset[,5] = (energy19.subset[,5])**(3)
# Y
energy19.Tsubset[,6] = log(energy19.subset[,6])**(0.001)
#------------------------------------------------------------------------------------
# Saving Min and Max for Later Usage
MM = matrix(0, nrow = 6, ncol = 2)
for (i in c(1:6)){
  MM[i,1] = min(energy19.Tsubset[,i])
  MM[i,2] = max(energy19.Tsubset[,i])
}
#------------------------------------------------------------------------------------
# Normalize the Data to between 0 to 1
for (i in c(1:6)){
  energy19.Tsubset[,i] = (energy19.Tsubset[,i] - min(energy19.Tsubset[,i]))/
    (max(energy19.Tsubset[,i]) - min(energy19.Tsubset[,i]))
}
#------------------------------------------------------------------------------------
# Information on Transformed Data
#------------------------------------------------------------------------------------
# Dataset Summary
summary(energy19.Tsubset)
#------------------------------------------------------------------------------------
# Checking Skewness - Pearson Skewness with Alternate formula based on Mean, Median and SD
for (i in c(1:6)){
  print((3*(mean(energy19.Tsubset[,i])-median(energy19.Tsubset[,i])))
        / sd(energy19.Tsubset[,i]))
}
#------------------------------------------------------------------------------------
# Dropping Column 5 as need to work with 4 columns data
energy19.Tsubset = energy19.Tsubset[,-5]
#------------------------------------------------------------------------------------
# Writing Transformed data into File
write.table(energy19.Tsubset,"shrutik-transformed.txt")
#------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------
### Part-3
#------------------------------------------------------------------------------------
# Usage of Fitting Functions
#------------------------------------------------------------------------------------
# Weighted Arithmetic Mean
fit.QAM(energy19.Tsubset, "WAMo.txt", "WAMs.txt")
# Weighted Arithmetic Mean P=0.5
fit.QAM(energy19.Tsubset, "PM05o.txt", "PM05s.txt", g = PM05, g.inv = invPM05)
# Weighted Arithmetic Mean P=2 Quadratic Mean
fit.QAM(energy19.Tsubset, "PM2o.txt", "PM2s.txt", g = QM, g.inv = invQM)
# Ordered Weighted Average
fit.OWA(energy19.Tsubset, "OWAo.txt", "OWAs.txt")
# Choquet Integral
fit.choquet(energy19.Tsubset, "CHOo.txt", "CHOs.txt")
#------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------
### Part-4
#------------------------------------------------------------------------------------
# Using Choquet Function for Prediction
# Fuzzy Measures
ChoquetWeights = c(0.647386170104526, 0.354665086496711, 0.647386170104526,
                   0.730216876904541, 1.00000000000001, 0.925758283550086,
                   0.999999999999999, 0.53291257311322, 0.64956460830582,
                   0.53291257311322, 0.649564608305823, 0.975907973457025,
                   1.000, 0.975907973457021, 0.99999999999999)
# Data to predict
Predict.data = matrix(c(18, 44, 4, 74.8), nrow = 1, ncol = 4)

# Transforming Prediction data
Predict.data[,1] = log(Predict.data[,1])
Predict.data[,2] = log(Predict.data[,2])
Predict.data[,3] = (Predict.data[,3] + 1 - min(energy19.subset[,3]))**(1.5)
Predict.data[,4] = Predict.data[,4] ** 2


for (i in c(1:4)){
  Predict.data[,i] = (Predict.data[,i] - MM[i,1])/
    (MM[i,2] - MM[i,1])
}
#------------------------------------------------------------------------------------
# Predicting the output 
x.Normalized = choquet(Predict.data, ChoquetWeights)
# Removing the normalization
x.nNormalized = (x.Normalized * (MM[6,2]-MM[6,1])) + MM[6,1]
# Reverting the transformation
exp(x.nNormalized ^ 1000)
#------------------------------------------------------------------------------------