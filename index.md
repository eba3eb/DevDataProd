---
title       : Interactive Titanic Predictive Model
subtitle    : Course Project for Coursera's Developing Data Products
author      : Evan Althouse
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Intro

* We look to a Kaggle competition in order to build out a simple interactive predictive model. 

* Our data uses passenger information such as socio-economic class and age, and labels each passenger with whether or not they survived the trip. We then predict the passenger's survival based on the interactive input.

* We have created an interactive app where input is received from the user. It is then passed to the predictive model, which will tell you whether or not a passenger with those traits would have survived the Titanic.

* This interactive app is easy to use, and easy to edit for different predictive models or inputs.

* All data-related information can be found at [link](https://www.kaggle.com/c/titanic).

---

## Model

We use a random forest model fitted to the training data. We first load the data, then manipulate the column data types. 


```r
training.data <- read.csv("C:/Users/evan.althouse/Documents/Kaggle/Titanic/train.csv")

training.data$Survived <- as.factor(training.data$Survived)
training.data$Pclass <- as.factor(training.data$Pclass)
training.data$Sex <- as.factor(training.data$Sex)
training.data$SibSp <- as.numeric(training.data$SibSp)
training.data$Parch <- as.numeric(training.data$Parch)
```

We then train the model


```r
model <- train(Survived ~ Pclass + Sex + SibSp + Parch, type="randomForest", data=training.data)
```

---

## Model Performance


```
## Random Forest 
## 
## 891 samples
##  11 predictor
##   2 classes: '0', '1' 
## 
## No pre-processing
## Resampling: Bootstrapped (25 reps) 
## Summary of sample sizes: 891, 891, 891, 891, 891, 891, ... 
## Resampling results across tuning parameters:
## 
##   mtry  Accuracy   Kappa      Accuracy SD  Kappa SD  
##   2     0.7959382  0.5548337  0.02029851   0.03956512
##   3     0.7891625  0.5430500  0.02200479   0.04429940
##   5     0.7815042  0.5271297  0.02107591   0.04244847
## 
## Accuracy was used to select the optimal model using  the largest value.
## The final value used for the model was mtry = 2.
```

---

## Conclusion

* Based on the results of the previous slide, we can expect accuracy of our model of around 80% (anyone who submits this model to Kaggle will find that this number is slightly inflated...). 

* With a few simple tweaks, we can use a different predictive model with the same sample input. This shiny app is easily manipulated to include different models, different training data, or other features such as interactive graphs. 

* This app has the ability to be used in a variety of different ways, with simple input from the user. It is easy to use and easy to edit.
