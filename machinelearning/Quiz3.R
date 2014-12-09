data(iris); library(ggplot2); library(caret)
names(iris)

dim(iris)

inTrain <- createDataPartition(iris$Species, p = 0.7, list = FALSE)
training <- iris[inTrain,]
testing <- iris[-inTrain,]

modFit <- train(Species~., method = "rpart", data = training)
modFit$finalModel

library(rattle)
fancyRpartPlot(modFit$finalModel)

predict(modFit, newdata = testing)


library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)

training <- segmentationOriginal[segmentationOriginal$Case == "Train",]
testing <- segmentationOriginal[segmentationOriginal$Case == "Test",]

set.seed(125)
modelFit <- train(Class ~ ., data = training, method = "rpart")
modelFit$finalModel
fancyRpartPlot(modelFit$finalModel)

modelFit <- rpart(Area ~., data = olive[,-1])
predict(modelFit, newdata = as.data.frame(t(colMeans(olive[,-1]))))


library(ElemStatLearn)
data(SAheart)
set.seed(8484)
train = sample(1:dim(SAheart)[1], size = dim(SAheart)[1]/2, replace = F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]
set.seed(13234)
logitMod <- train(chd ~ age + alcohol + obesity + tobacco + typea + ldl,
                  data = trainSA, method = "glm", family = "binomial")
missClass = function(values,prediction){
        sum(((prediction > 0.5)*1) != values)/length(values)
}
trainPred <- predict(logitMod, newdata = trainSA)
testPred <- predict(logitMod, newdata = testSA)

missClass(trainSA$chd, trainPred)
missClass(testSA$chd, testPred)


library(ElemStatLearn)
data(vowel.train)
data(vowel.test)
vowel.train$y <- as.factor(vowel.train$y)
vowel.test$y <- as.factor(vowel.test$y)

set.seed(33833)
modelFit <- train(y ~ . , data = vowel.train, method = "rf")
varImp(modelFit)
