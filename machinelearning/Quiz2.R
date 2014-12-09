# Coursera Practical Machine Learning
# Quiz 3
# Ryan Quan


# Question 1

library(AppliedPredictiveModeling)
library(caret)
data(AlzheimerDisease)

adData<-data.frame(diagnosis,predictors)

inTrain <- createDataPartition(y=adData$diagnosis,
                               p=0.5, list=FALSE)
training <- adData[inTrain,]
testing <- adData[-inTrain,]


# Question 2

library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(975)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

plot(training$CompressiveStrength)
points(training$Age, col= "red")
points(training$FlyAsh, col = "green")

# Question 3

qplot(Superplasticizer, data = training)

# Question 4
set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

adDataIL <- training[,c(58:69)]
preProc <- preProcess(adDataIL, method = "pca",
                  thresh = 0.90)
adDataPC<-predict(preProc, adDataIL)
summary(adDataPC)

# Question 5
set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

colnames(training)

smallTraining <- training[,c(58:69)]

modelFit <- train(smallTraining, training$diagnosis, method = "glm")
modelFit

preProc <- preProcess(smallTraining, method = "pca",
                      thresh = 0.80)
trainingPC <- predict(preProc, smallTraining)
modelFitPC <- train(trainingPC, training$diagnosis, method="glm")
modelFitPC
