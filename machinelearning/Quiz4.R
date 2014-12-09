#####################
# PredMach Quiz 4 ###
#####################

# Question 1

library(ElemStatLearn)
data(vowel.train)
data(vowel.test)
set.seed(33833)


library(caret)
modFit1 <- train(as.factor(y)~., data = vowel.train, method = "rf")
modFit2 <- train(as.factor(y)~., data = vowel.train, method = "gbm")

predRF <- predict(modFit1, newdata = vowel.test)
predGBM <- predict(modFit2, newdata = vowel.test)

confusionMatrix(predRF, vowel.test$y)
confusionMatrix(predGBM, vowel.test$y)
confusionMatrix(predRF, predGBM)

# Question 2

set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

modFit1 <- train(diagnosis~., data = training, method = "rf")
modFit2 <- train(diagnosis~., data = training, method = "gbm")
modFit3 <- train(diagnosis~., data = training, method = "lda")

predRF <- predict(modFit1, newdata = testing)
predGBM <- predict(modFit2, newdata = testing)
predLDA <- predict(modFit3, newdata = testing)


testing.stacked <- data.frame(predRF, predGBM, predLDA, diagnosis = testing$diagnosis)


model.stacked <- train(diagnosis~., data = testing.stacked, method = "rf",
                       trControl = trainControl(method = "cv"), number =3)
predStacked <- predict(model.stacked, newdata = testing)

confusionMatrix(predRF, testing$diagnosis)[3]
confusionMatrix(predGBM, testing$diagnosis)[3]
confusionMatrix(predLDA, testing$diagnosis)[3]
confusionMatrix(predStacked, testing$diagnosis)[3]

# Quesiton 3

set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

set.seed(233)
modFit <- train(CompressiveStrength ~., data = training, method = "lasso")
plot(modFit$finalModel, xvar = "penalty")


# Question 4
library(lubridate)
library(forecast)
dat = read.csv("/Users/Quan/Downloads/gaData.csv")
training = dat[year(dat$date) == 2011,]
testing = dat[year(dat$date) > 2011,]
tstrain = ts(training$visitsTumblr)
tstest = ts(testing$visitsTumblr)

modFit <- bats(tstrain)
pred <- forecast(modFit, h = length(testing$visitsTumblr), level = c(80,95))
accuracy <- 1-sum(testing$visitsTumblr>pred$upper[,2])/length(testing$visitsTumblr)


accuracy


# Question 5

set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

library(e1071)
set.seed(325)
modFit <- svm(CompressiveStrength~., data = training)
pred <- predict(modFit, testing[,-9])
sqrt(sum((pred-testing$CompressiveStrength)^2)/length(pred))