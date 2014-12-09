install.packages("kernlab")
library(kernlab)
data(spam)
set.seed(333)
smallSpam <- spam[sample(dim(spam)[1], size = 10), ]
spamLabel <- (smallSpam$type =="spam")*1 + 1
plot(smallSpam$capitalAve, col = spamLabel)

rule1 <- function(x){
        prediction <- rep(NA, length(x))
        prediction[x > 2.7] <- "spam"
        prediction[x < 2.40] <- "nonspam"
        prediction[(x >= 2.40 & x <= 2.45)] <- "spam"
        prediction[(x > 2.45 & x <= 2.70)] <-"nonspam"
        return(prediction)
}
table(rule1(smallSpam$capitalAve), smallSpam$type)

rule2 <- function(x){
        prediction <- rep(NA, length(x))
        prediction[x > 2.80] <- "spam"
        prediction[x <= 2.80] <- "nonspam"
        return(prediction)
}
table(rule2(smallSpam$capitalAve), smallSpam$type)

table(rule1(spam$capitalAve), spam$type)

library(lattice)
xyplot(mpg ~ wt | cyl, data = mtcars, panel = function(x,y){
        panel.xyplot(x,y)
        panel.lmline(x,y, col = 2)
})
library(ggplot2)
str(mpg)
qplot(displ, hwy, data = mpg, geom = c("point","smooth"))
qplot(hwy, data = mpg, fill = drv)
qplot(displ, hwy, data = mpg, facets = .~drv)

install.packages("swirl")
library(swirl)

swirl()


library(caret)
library(kernlab)
data(spam)
inTrain <- createDataPartition(y=spam$type,
                               p=0.75, list=FALSE)
training <- spam[inTrain,]
testing <- spam[-inTrain,]

hist(training$capitalAve,main="",xlab="ave. capital run length")

dim(training)
set.seed(32343)
modelFit <- train(type ~.,data=training, method="glm")
modelFit

# PCA
smallSpam <- spam[,c(34,32)]
prComp <- prcomp(smallSpam)
plot(prComp$x[,1], prComp$x[,2])
prComp$rotation

install.packages("ISLR")
library(ISLR)
data(Wage)
summary(Wage)

inTrain <- createDataPartition(y=Wage$wage,
                               p=0.7, list=FALSE)
training <- Wage[inTrain,]
testing <- Wage[-inTrain,]

featurePlot(x=training[,c("age", "education","jobclass")],
            y=training$wage, plot = "pairs")

qplot(age,wage, data = training)
qq <- qplot(age,wage, color = education, data = training)
qq + geom_smooth(method = "lm", formula = y~x)

install.packages("Hmisc")
library(Hmisc)
cutWage <- cut2(training$wage, g=3)
table(cutWage)
p1 <- qplot(cutWage, age, data = training, fill = cutWage,
            geom = c("boxplot","jitter"))
p1


data(faithful); set.seed(333)
inTrain <- createDataPartition(y=faithful$waiting,
                               p = 0.5, list=FALSE)
trainFaith <- faithful[inTrain,]
testFaith <- faithful[-inTrain,]
q <- qplot(waiting, eruptions, data = trainFaith)
q + geom_smooth(method = "lm", formula = y~x)


lm1 <- lm(eruptions~waiting, data = trainFaith)
summary(lm1)

newdata <- data.frame(waiting=80)
predict(lm1, newdata)

modFit <- train(eruptions~waiting, data = trainFaith,
                method = "lm")
summary(modFit)
